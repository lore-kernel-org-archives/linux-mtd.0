Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816BAC27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZjoT1pW0PXBhvar3lQ/HXAjPl4yk6BKPGHcDaUm5ZA=; b=NssUglFxbxNNc6
	jqoUVTqV/qM/IGd+H1xTVUXZdTr/E5qk7l/hpZ8yPCt7GmiDMFh64PrqQy/u3hmeQSfnHGc2dAUc4
	250j/1DmHVs7ToaxttOpRDQ8No49i+832j5r9T+i/f2R5GG0Eiw9E1ITUxWDMCryt4Zp7TbilBV/Y
	ug7+grP43/5C4U85LJKn/sGnoPcQ4coYhudUxVusOfND8c2XyyYpdXGJovBma0YPcQaCEd6TGIFRf
	l1watwn5bMFsceOd61F9XIgRujkQMU5RXE++bqPY6hM+YUITMLYDFP9IYBllWAgI2AS7h++JzWv3+
	xctKlDx2DQsycYIfYbQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRHx-0000000CL9r-193g;
	Fri, 07 Jun 2024 04:33:17 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRFM-0000000CJ5Q-14uY
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:30:55 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VwSrj4HjhzdZhH;
	Fri,  7 Jun 2024 12:29:09 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 829B9140203;
	Fri,  7 Jun 2024 12:30:19 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:42 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 103/110] tests: ubifs_tools: fsck_tests: Add corrupt+fsck+fault_inject test
Date: Fri, 7 Jun 2024 12:26:08 +0800
Message-ID: <20240607042615.2069840-104-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_213036_921936_D2F1B6A8 
X-CRM114-Status: GOOD (  17.70  )
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

Inject memory/io fault while doing fsck for corrupted UBIFS images.
This testcase mainly checks whether fsck.ubifs has problems (eg.
UAF, null-ptr-def, etc.) in random error paths. Besides, it provides
a similar way to simulate powercut during fsck, and checks whether
the fsck.ubifs can fix an UBIFS image after many rounds interrupted
by kinds of errors.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 .gitignore                                         |   1 +
 configure.ac                                       |   3 +-
 tests/ubifs_tools-tests/Makemodule.am              |   3 +-
 .../cycle_corrupted_fsck_fault_inject.sh.in        | 225 +++++++++++++++++++++
 tests/ubifs_tools-tests/lib/common.sh.in           |   3 +-
 5 files changed, 232 insertions(+), 3 deletions(-)
 create mode 100755 tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh.in

diff --git a/.gitignore b/.gitignore
index b63b9868..ea99a614 100644
--- a/.gitignore
+++ b/.gitignore
@@ -117,6 +117,7 @@ tests/ubifs_tools-tests/lib/common.sh
 tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh
 tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh
 tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh
+tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh
 
 #
 # Files generated by autotools
diff --git a/configure.ac b/configure.ac
index 99ce86c8..ed8a5f12 100644
--- a/configure.ac
+++ b/configure.ac
@@ -293,7 +293,8 @@ AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
 	tests/ubifs_tools-tests/lib/common.sh
 	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh
 	tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh
-	tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh])
+	tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh
+	tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh])
 
 AC_OUTPUT([Makefile])
 
diff --git a/tests/ubifs_tools-tests/Makemodule.am b/tests/ubifs_tools-tests/Makemodule.am
index d54514da..932a2bcb 100644
--- a/tests/ubifs_tools-tests/Makemodule.am
+++ b/tests/ubifs_tools-tests/Makemodule.am
@@ -2,4 +2,5 @@ test_SCRIPTS += \
 	tests/ubifs_tools-tests/lib/common.sh \
 	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh \
 	tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh \
-	tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh
+	tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh \
+	tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh
diff --git a/tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh.in b/tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh.in
new file mode 100755
index 00000000..2073fecf
--- /dev/null
+++ b/tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh.in
@@ -0,0 +1,225 @@
+#!/bin/sh
+# Copyright (c), 2024, Huawei Technologies Co, Ltd.
+# Author: Zhihao Cheng <chengzhihao1@huawei.com>
+#
+# Test Description:
+# For many kinds of flash, do following things
+#  1. mount UBIFS
+#  2. fsstress && unmount
+#  3. inject corruption into UBIFS image randomly
+#  3. fsck UBIFS && inject kinds of errors(memory, io)
+#  4. check UBIFS mounting result
+# Running time: 15min
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
+		printf " %s" "page size ${page_size}Bytes"
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
+	modprobe ubi mtd="$mtdnum,$page_size" || fatal "modprobe ubi fail"
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
+	sleep $((RANDOM % 20))
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
+	# inject corruption
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
+			# Skip free PEB, otherwise LEB data could be overwritten in UBIFS
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
+	modprobe ubi mtd="$mtdnum,$page_size"
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
+
+		round=0
+		while [[ $round -lt 50 ]];
+		do
+			let round=$round+1
+			inject_mem=0
+
+			fsck.ubifs -yb $DEV 2>&1 > $LOG_FILE &
+			pid=$!
+			if [[ $((RANDOM % 2)) == 0 ]]; then
+				inject_mem_err $pid
+				inject_mem=1
+			fi
+			inject_io_err
+			wait $pid
+			cat $LOG_FILE
+			if [[ $inject_mem == 1 ]]; then
+				cancel_mem_err
+			fi
+			cancel_io_err
+
+			# UBI could become ro-mode, reload it
+			modprobe -r ubifs
+			modprobe -r ubi
+			modprobe ubi mtd="$mtdnum,$page_size" || fatal "modprobe ubi2 fail"
+			modprobe ubifs || fatal "modprobe ubifs3 fail"
+		done
+
+		fsck.ubifs -yb $DEV 2>&1 > $LOG_FILE
+		res=$?
+		cat $LOG_FILE
+		let "ret=$res&~$FSCK_NONDESTRUCT"
+		if [[ $ret != $FSCK_OK ]]
+		then
+			# Skip superblock error
+			log=`cat $LOG_FILE | grep "bad node at LEB 0:"`
+			if [[ "$log" != "" ]]
+			then
+				skip=1
+				echo "SB is corrupted, skip fsck & mounting"
+			else
+				fatal "fsck fail $res"
+			fi
+		fi
+
+		if [[ $skip == 0 ]]; then
+			enable_chkfs
+
+			mount_ubifs $DEV $MNT "noauthentication" "noatime"
+			res=$?
+			if [[ $res != 0 ]]
+			then
+				fatal "mount fail $res"
+			fi
+
+			if [[ "$encryption" == "encrypted" ]]; then
+				# Ignore the encrypting error, root dir could be
+			        # corrupted, the new root dir cannot be
+			        # encrypted because it is not empty.
+				encryption_set_key $MNT 1
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
+
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
+echo "Do corrruption+cycle_fsck_fault_injection test in kinds of flashes"
+for simulator in "mtdram" "nandsim"; do
+	for encryption in "encrypted" "noencrypted"; do
+		run_test "$simulator" "16" "16" "512" $encryption
+		run_test "$simulator" "256" "128" "2048" $encryption
+		run_test "$simulator" "1024" "512" "2048" $encryption
+	done
+done
+end_t=$(date +%s)
+time_cost=$(( end_t - start_t ))
+echo "Success, cost $time_cost seconds"
+exit 0
diff --git a/tests/ubifs_tools-tests/lib/common.sh.in b/tests/ubifs_tools-tests/lib/common.sh.in
index 5a07ebcd..a27fe108 100755
--- a/tests/ubifs_tools-tests/lib/common.sh.in
+++ b/tests/ubifs_tools-tests/lib/common.sh.in
@@ -234,12 +234,13 @@ function encryption_gen_key()
 function encryption_set_key()
 {
 	mnt=$1
+	ignore_err=$2
 	# https://github.com/google/fscryptctl
 	key=$(fscryptctl add_key $mnt < $KEY_FILE)
 	fscryptctl set_policy $key $mnt
 	#fscryptctl get_policy $mnt
 	ret=$?
-	if [[ $ret != 0 ]]; then
+	if [[ $ret != 0 && $ignore_err != 1 ]]; then
 		fatal "set encryption policy failed"
 	fi
 }
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
