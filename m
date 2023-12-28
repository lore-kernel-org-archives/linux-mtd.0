Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC59C46CD2
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Dec 2023 01:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbXoFhsBzxmXSwIdTzfGW3wliMtiN/XSCamJ2Ba5PRc=; b=M6PAuS1ZOC5bIY
	vIsLRooNEDDrCptat8LbXtPwdq2ZbCKMc1IwuhpMmf95jRNCTYnDc5kz5Dx5xyXMdV3Lk+tVS8NlP
	SV78M1GvTI70J9OXk8ak/HEXf2LZBp0JKbImtSzOvuL6WfBq4ESgNBPOA+eE8LpxDktabt+r3S6u1
	xDADTEPeWyiiwPdJdDIWyG062Tz/n/XhLsOEUZ819fB+VM0L7glanqXNfq3Ov5IJrtR6y9WKduJ+b
	Y+nv6LV97AjxNyRykYFFPBSRc6ldwHMv3mUx1cI3j2dHz1Va5o7C2RMCj9EP8wV8b9ng805I60P3U
	kSU1QcHPLR8hKFQ78+/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfI3-00FoKE-1b;
	Thu, 28 Dec 2023 01:34:27 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfI0-00FoG0-1B
	for linux-mtd@lists.infradead.org;
	Thu, 28 Dec 2023 01:34:26 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4T0rcD4mJrz1R5Yg;
	Thu, 28 Dec 2023 09:33:00 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 3BA5E1A0192;
	Thu, 28 Dec 2023 09:34:06 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Dec
 2023 09:33:36 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <s.hauer@pengutronix.de>,
	<Tudor.Ambarus@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils 07/11] tests: ubifs_repair: Add random_corrupt+repair test
Date: Thu, 28 Dec 2023 09:36:35 +0800
Message-ID: <20231228013639.2827205-8-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231228013639.2827205-1-chengzhihao1@huawei.com>
References: <20231228013639.2827205-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_173424_729000_E92D031D 
X-CRM114-Status: GOOD (  15.38  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Inject random corruption on UBIFS image by writting random data on
kinds of mtd devices (eg. nand, nor), check the consistency of UBIFS
after repairing.
This testcase simulate random bad UBIFS image caused by hardware
exceptions(eg. ecc uncorrectable, unwritten), and makes sure that
ubifs_repair could make UBIFS be consistent after repairing UBIFS
image.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 .gitignore                                         |   1 +
 configure.ac                                       |   3 +-
 tests/ubifs_repair-tests/Makemodule.am             |   3 +-
 .../tests/random_corrupted_repair.sh.in            | 205 +++++++++++++++++++++
 4 files changed, 210 insertions(+), 2 deletions(-)
 create mode 100755 tests/ubifs_repair-tests/tests/random_corrupted_repair.sh.in

diff --git a/.gitignore b/.gitignore
index 7077b8d..dbe63b7 100644
--- a/.gitignore
+++ b/.gitignore
@@ -118,6 +118,7 @@ tests/ubifs_repair-tests/tests/cycle_mount_repair_check.sh
 tests/ubifs_repair-tests/tests/powercut_repair_mount.sh
 tests/ubifs_repair-tests/tests/cycle_corrupted_repair_fault_inject.sh
 tests/ubifs_repair-tests/tests/cycle_powercut_mount_repair.sh
+tests/ubifs_repair-tests/tests/random_corrupted_repair.sh
 
 #
 # Files generated by autotools
diff --git a/configure.ac b/configure.ac
index b3dd453..11d34bd 100644
--- a/configure.ac
+++ b/configure.ac
@@ -360,6 +360,7 @@ AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
 	tests/ubifs_repair-tests/tests/cycle_mount_repair_check.sh
 	tests/ubifs_repair-tests/tests/powercut_repair_mount.sh
 	tests/ubifs_repair-tests/tests/cycle_corrupted_repair_fault_inject.sh
-	tests/ubifs_repair-tests/tests/cycle_powercut_mount_repair.sh])
+	tests/ubifs_repair-tests/tests/cycle_powercut_mount_repair.sh
+	tests/ubifs_repair-tests/tests/random_corrupted_repair.sh])
 
 AC_OUTPUT([Makefile])
diff --git a/tests/ubifs_repair-tests/Makemodule.am b/tests/ubifs_repair-tests/Makemodule.am
index 4a7f5ed..323102b 100644
--- a/tests/ubifs_repair-tests/Makemodule.am
+++ b/tests/ubifs_repair-tests/Makemodule.am
@@ -4,4 +4,5 @@ test_SCRIPTS += \
 	tests/ubifs_repair-tests/tests/cycle_mount_repair_check.sh \
 	tests/ubifs_repair-tests/tests/powercut_repair_mount.sh \
 	tests/ubifs_repair-tests/tests/cycle_corrupted_repair_fault_inject.sh \
-	tests/ubifs_repair-tests/tests/cycle_powercut_mount_repair.sh
+	tests/ubifs_repair-tests/tests/cycle_powercut_mount_repair.sh \
+	tests/ubifs_repair-tests/tests/random_corrupted_repair.sh
diff --git a/tests/ubifs_repair-tests/tests/random_corrupted_repair.sh.in b/tests/ubifs_repair-tests/tests/random_corrupted_repair.sh.in
new file mode 100755
index 0000000..61ec64e
--- /dev/null
+++ b/tests/ubifs_repair-tests/tests/random_corrupted_repair.sh.in
@@ -0,0 +1,205 @@
+#!/bin/sh
+# Copyright (c), 2023-2024, Huawei Technologies Co, Ltd.
+# Author: Zhihao Cheng <chengzhihao1@huawei.com>
+#
+# Test Description:
+# For many kinds of flash, do following things
+#  1. mount UBIFS
+#  2. fsstress && unmount
+#  3. inject corruption into UBIFS image randomly
+#  3. repair ubifs
+#  4. check UBIFS mounting result
+# Running time: 10h
+
+TESTBINDIR=@TESTBINDIR@
+source $TESTBINDIR/common.sh
+
+function run_test()
+{
+	local simulator="$1";
+	local size="$2";
+	local peb_size="$3";
+	local page_size="$4";
+	local encryption=$5;
+
+	echo "======================================================================"
+	printf "%s" "$simulator: ${size}MiB PEB size ${peb_size}KiB"
+	if [ "$simulator" = "nandsim" ]; then
+		printf " %s" "page size ${page_size}KiB"
+	fi
+	printf " $encryption\n"
+
+	if [ "$simulator" = "nandsim" ]; then
+		$TESTBINDIR/load_nandsim.sh "$size" "$peb_size" "$page_size" || echo "cannot load nandsim";
+		mtdnum="$(find_mtd_device "$nandsim_patt")"
+	elif [ "$simulator" = "mtdram" ]; then
+		load_mtdram "$size" "$peb_size" || echo "cannot load mtdram"
+		mtdnum="$(find_mtd_device "$mtdram_patt")"
+	else
+		fatal "$simulator is not supported"
+	fi
+
+	flash_eraseall /dev/mtd$mtdnum
+	modprobe ubi mtd="$mtdnum,$page_size,0,0,1" fm_autoconvert || fatal "modprobe ubi fail"
+	ubimkvol -N vol_test -m -n 0 /dev/ubi$UBI_NUM || fatal "mkvol fail"
+	modprobe ubifs || fatal "modprobe ubifs fail"
+	mount_ubifs $DEV $MNT || fatal "mount ubifs fail"
+	if [[ "$encryption" == "encrypted" ]]; then
+		encryption_gen_key
+		encryption_set_key $MNT
+	fi
+
+	fsstress -d $MNT -l0 -p4 -n10000 &
+
+	while true;
+	do
+		per=`df -Th | grep ubifs | awk '{print $6}'`;
+		if [[ ${per%?} -gt 95 ]]; then
+			# Used > 95%
+			break;
+		fi
+	done
+
+	ps -e | grep -w fsstress > /dev/null 2>&1
+	while [ $? -eq 0 ]
+	do
+		killall -9 fsstress > /dev/null 2>&1
+		sleep 1
+		ps -e | grep -w fsstress > /dev/null 2>&1
+	done
+
+	while true
+	do
+		res=`mount | grep "$MNT"`
+		if [[ "$res" == "" ]]
+		then
+			break;
+		fi
+		umount $MNT
+		sleep 0.1
+	done
+
+	# injection
+	times=$((RANDOM % 10))
+	let times=$times+10
+	i=0
+	tot_peb=`cat /sys/class/ubi/ubi$UBI_NUM/total_eraseblocks`;
+
+	modprobe -r ubifs
+	modprobe -r ubi # Stop wear-leveling & erasing worker
+	while [[ $i -lt $times ]]
+	do
+		let i=$i+1;
+		peb=$((RANDOM % $tot_peb));
+		pg=`expr $peb_size \* 1024`;
+		peb_off=`expr $pg \* $peb`
+		pages=`expr $pg / $page_size`;
+		pg=`expr $pages - 2`;
+		pg=$((RANDOM % $pg));
+		pg_off=`expr $pg + 2`;
+		pg_start=`expr $pages \* $peb`;
+		pg=`expr $pg_start + $pg_off`;
+		vid_pg=`expr $pg_start + 1`;
+		dd if=/dev/mtd$mtdnum of=$TMP_FILE bs=$page_size skip=$vid_pg count=1 2>/dev/null;
+		content=`cat $TMP_FILE | grep UBI!`; # vid header magic
+		if [[ "$content" == "" ]]; then
+			# Skip free PEB, otherwise data could be overwritten in ubifs repairing process
+			continue;
+		fi
+		if [[ $((RANDOM % 2)) == 0 ]]; then
+			# Corrupts 1 page
+			dd if=/dev/urandom of=/dev/mtd$mtdnum bs=$page_size seek=$pg count=1;
+		else
+			# Erase 1 LEB, TNC points to an unmapped area
+			flash_erase /dev/mtd$mtdnum $peb_off 1
+		fi
+	done
+	rm -f $TMP_FILE 2>/dev/null
+	sync
+
+	skip=0
+	modprobe ubi mtd="$mtdnum,$page_size,0,0,1" fm_autoconvert
+	ret=$?
+	if [[ $ret != 0 ]]
+	then
+		skip=1
+		echo "UBI layout volume is corrupted, skip"
+	fi
+
+	if [[ $skip == 0 ]]; then
+		modprobe ubifs || fatal "modprobe ubifs2 fail"
+		dmesg -c > /dev/null
+		echo 'format "UBIFS DBG repair" +pflmt' > /sys/kernel/debug/dynamic_debug/control
+		echo "$DEV" > /sys/kernel/debug/ubifs/repair_fs
+		res=$?
+		if [[ $res != 0 ]]
+		then
+			log=`dmesg | grep "bad node at LEB 0:"`
+			if [[ "$log" != "" ]]
+			then
+				skip=1
+				echo "SB is corrupted, skip repairing & mounting"
+			else
+				fatal "repair fail $res"
+			fi
+		fi
+
+		check_memleak
+
+		if [[ $skip == 0 ]]; then
+			dmesg -c > /dev/null # repairing corrupted image could reproduce error messages
+
+			enable_chkfs
+
+			mount_ubifs $DEV $MNT
+			res=$?
+			if [[ $res != 0 ]]
+			then
+				fatal "mount fail $res"
+			fi
+
+			if [[ "$encryption" == "encrypted" ]]; then
+				encryption_set_key $MNT
+			fi
+
+			du -sh $MNT > /dev/null  # Make sure all files are accessible
+			ret=$?
+			if [[ $ret != 0 ]]; then
+				fatal "Cannot access all files"
+			fi
+			# check_err_msg is not suggested in this testcase, because
+			# ubi_io_read(triggered by wear_leveling_worker -> ubi_eba_copy_leb)
+			# could print stack if ecc uncorrectable errors are detected.
+
+			umount $MNT
+			res=$?
+			if [[ $res != 0 ]]
+			then
+				fatal "unmount fail $res"
+			fi
+		fi
+		modprobe -r ubifs
+		modprobe -r ubi
+	fi
+	modprobe -r $simulator
+
+	echo "----------------------------------------------------------------------"
+}
+
+check_fsstress
+start_t=$(date +%s)
+echo "Do random_corrruption+repair+mount test in kinds of flashes"
+for simulator in "mtdram" "nandsim"; do
+	for encryption in "encrypted" "noencrypted"; do
+		run_test "$simulator" "16" "16" "512" $encryption
+		run_test "$simulator" "64" "16" "512" $encryption
+		run_test "$simulator" "128" "64" "2048" $encryption
+		run_test "$simulator" "256" "128" "2048" $encryption
+		run_test "$simulator" "512" "128" "2048" $encryption
+		run_test "$simulator" "1024" "512" "2048" $encryption
+	done
+done
+end_t=$(date +%s)
+time_cost=$(( end_t - start_t ))
+echo "Success, cost $time_cost seconds"
+exit 0
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
