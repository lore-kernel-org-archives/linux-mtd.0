Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D43AD12D7E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 07:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPqz5vuBDFFTnu05EYPH0glaI8CJ+lLMlMrQIAfWR4c=; b=qbBqkNA45OnsZ+
	VA+INzlpjqXjKPI4aw8X+ljBBmYfsr48flsZI4BPtI9OqfY5Nmr7sinMqMSWdrCSYuSrDZysgazX8
	WR9IzeBVR06e60S5KhZglkrhDETy5CufqOMbLzr6m0OHtCv91todLDZ47MMgpesBBoiC+7DtvZdWJ
	X/sF/4XwqgndLJI1pQH00BFHSCkP7K6idJdmfkYytaCOI3lEdlDl2UWu6cQRWzGK/Kk2tIzPWidG8
	KR1vG0FKnCFScMsEqHXnCG9SuRzGK1rFGJRElCJJ6qzrk3r4IpRY+IlO/ifPZqRbaMa2HI9LoLEAa
	CLEJKlHsGBkKzyxlD1Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOZ3-0000000Gcz4-1yTD;
	Mon, 11 Nov 2024 07:10:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOVT-0000000GaBj-24qF
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:06:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FzXC2acUAwDXByjg07LacRqNuUYE4Rvdp9go0iaThFM=; b=CnQwxmqUrpc3AhwxTDnSK/2LQd
	/3B+M1UTE56HYsFIVwVSKQYfFdcYwPrDFdg6YHrF6oRqMix27BVGvbxtqo2f8SKyjwj4o9VDWzxDH
	rCj/nOVSgaTsG47sX8el/Ki3iWPRV8F9CNlCvjZt6FgE+Swy87PNXYGme1/STkalAPtYGZPR3VhR3
	Yb7p98XgibQWsab4j1O1kqO9Sx/PObozbRMELnE4Vsm2ypg0/NaXkK45opkgovMxu8pogsJCpsq9m
	Yc+m+SwTmaICGhsrW78qrmKem62EtaODBSdPvPPLaQDrJEh8rzkemH5JNBP4Zx0RuG4W7u1IAGj7i
	1fqepung==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOVC-0000000CmQs-0fd7
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:06:32 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xn0rC0YF7z10QyX;
	Mon, 11 Nov 2024 15:03:23 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A1C0E1400D8;
	Mon, 11 Nov 2024 15:05:49 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:49 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 096/102] tests: ubifs_tools: fsck_tests: Add random_corrupt+fsck test
Date: Mon, 11 Nov 2024 15:03:39 +0800
Message-ID: <20241111070346.1314122-97-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070626_897495_5F3B7ED7 
X-CRM114-Status: GOOD (  17.14  )
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
after fsck.
This testcase simulates random bad UBIFS image caused by hardware
exceptions(eg. ecc uncorrectable, unwritten), and makes sure that
fsck.ubifs could make UBIFS be consistent after repairing UBIFS
image.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 .gitignore                                         |   1 +
 configure.ac                                       |   3 +-
 tests/ubifs_tools-tests/Makemodule.am              |   3 +-
 .../fsck_tests/random_corrupted_fsck.sh.in         | 206 +++++++++++++++++++++
 4 files changed, 211 insertions(+), 2 deletions(-)
 create mode 100755 tests/ubifs_tools-tests/fsck_tests/random_corrupted_fsck.sh.in

diff --git a/.gitignore b/.gitignore
index 1d150f7a..203f01f0 100644
--- a/.gitignore
+++ b/.gitignore
@@ -119,6 +119,7 @@ tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh
 tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh
 tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh
 tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh
+tests/ubifs_tools-tests/fsck_tests/random_corrupted_fsck.sh
 
 #
 # Files generated by autotools
diff --git a/configure.ac b/configure.ac
index 7b929459..1b2591ba 100644
--- a/configure.ac
+++ b/configure.ac
@@ -298,7 +298,8 @@ AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
 	tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh
 	tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh
 	tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh
-	tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh])
+	tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh
+	tests/ubifs_tools-tests/fsck_tests/random_corrupted_fsck.sh])
 
 AC_OUTPUT([Makefile])
 
diff --git a/tests/ubifs_tools-tests/Makemodule.am b/tests/ubifs_tools-tests/Makemodule.am
index 2c190e2b..9881ebbe 100644
--- a/tests/ubifs_tools-tests/Makemodule.am
+++ b/tests/ubifs_tools-tests/Makemodule.am
@@ -4,4 +4,5 @@ test_SCRIPTS += \
 	tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh \
 	tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh \
 	tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh \
-	tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh
+	tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh \
+	tests/ubifs_tools-tests/fsck_tests/random_corrupted_fsck.sh
diff --git a/tests/ubifs_tools-tests/fsck_tests/random_corrupted_fsck.sh.in b/tests/ubifs_tools-tests/fsck_tests/random_corrupted_fsck.sh.in
new file mode 100755
index 00000000..64760c94
--- /dev/null
+++ b/tests/ubifs_tools-tests/fsck_tests/random_corrupted_fsck.sh.in
@@ -0,0 +1,206 @@
+#!/bin/sh
+# Copyright (c), 2024, Huawei Technologies Co, Ltd.
+# Author: Zhihao Cheng <chengzhihao1@huawei.com>
+#
+# Test Description:
+# For many kinds of flash, do following things
+#  1. mount UBIFS
+#  2. fsstress && unmount
+#  3. inject corruption into UBIFS image randomly
+#  3. fsck UBIFS
+#  4. check UBIFS mounting result
+# Running time: 1h
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
+			# Skip free PEB, otherwise data could be overwritten in UBIFS
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
+echo "Do random_corrruption+fsck+mount test in kinds of flashes"
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
