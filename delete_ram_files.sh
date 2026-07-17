#!/bin/bash

# Script to delete all files with "ram" in the filename from the src directory
# Using GitHub CLI

REPO="soniaaniesh/ZBASTRAVELAPP"
BRANCH="main"
FILES_TO_DELETE=(
  "src/zcl_ram_data_generator.clas.abap"
  "src/zcl_ram_data_generator.clas.xml"
  "src/zram_booksuppl_m.tabl.xml"
  "src/zram_bp_travel_m.clas.abap"
  "src/zram_bp_travel_m.clas.xml"
  "src/zram_c_booking_processor_m.ddls.asddls"
  "src/zram_c_booking_processor_m.ddls.baseinfo"
  "src/zram_c_booking_processor_m.ddls.xml"
  "src/zram_c_booking_processor_m.ddlx.asddlxs"
  "src/zram_c_booking_processor_m.ddlx.xml"
  "src/zram_c_booksuppl_processor_m.ddls.asddls"
  "src/zram_c_booksuppl_processor_m.ddls.baseinfo"
  "src/zram_c_booksuppl_processor_m.ddls.xml"
  "src/zram_c_travel_processsor_m.ddls.asddls"
  "src/zram_c_travel_processsor_m.ddls.baseinfo"
  "src/zram_c_travel_processsor_m.ddls.xml"
  "src/zram_c_travel_processsor_m.ddlx.asddlxs"
  "src/zram_c_travel_processsor_m.ddlx.xml"
  "src/zram_i_booking_m.ddls.asddls"
  "src/zram_i_booking_m.ddls.baseinfo"
  "src/zram_i_booking_m.ddls.xml"
  "src/zram_i_booksuppl_m.ddls.asddls"
  "src/zram_i_booksuppl_m.ddls.baseinfo"
  "src/zram_i_booksuppl_m.ddls.xml"
  "src/zram_i_travel_m.bdef.asbdef"
  "src/zram_i_travel_m.bdef.xml"
  "src/zram_i_travel_m.ddls.asddls"
  "src/zram_i_travel_m.ddls.baseinfo"
  "src/zram_i_travel_m.ddls.xml"
  "src/zram_travel_m.tabl.xml"
  "src/zram_ui_travel_proc_m_o4.srvb.xml"
  "src/zram_ui_travel_proc_m_o4_0001_g4ba.sco2.xml"
  "src/zram_ui_travel_processor_m.srvd.srvdsrv"
  "src/zram_ui_travel_processor_m.srvd.xml"
)

echo "Starting deletion of files with 'ram' in filename..."
echo "Repository: $REPO"
echo "Branch: $BRANCH"
echo "Number of files to delete: ${#FILES_TO_DELETE[@]}"
echo ""

DELETED_COUNT=0
FAILED_COUNT=0

for file in "${FILES_TO_DELETE[@]}"; do
  echo "Deleting: $file"
  
  # Use gh api to delete file - requires authentication
  if gh api repos/$REPO/contents/$file --method DELETE \
    -f branch=$BRANCH \
    -f message="Delete $file - remove RAM files" 2>/dev/null; then
    echo "✓ Deleted: $file"
    ((DELETED_COUNT++))
  else
    echo "✗ Failed to delete: $file"
    ((FAILED_COUNT++))
  fi
done

echo ""
echo "========================================"
echo "Deletion Summary:"
echo "Successfully deleted: $DELETED_COUNT files"
echo "Failed to delete: $FAILED_COUNT files"
echo "========================================"
