Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C374D12D7E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 07:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gFskQZkA9YDxYo/Vr4NUqnZNKxPIqlMv29hUZRgoKo0=; b=KN1Kv79y/INZiH
	NSrJ+eIsIDnnWmQwOd129Cht4NbphndxiVUWSrsJkJpg5U12iu0Jqr9OyzJrcNoUnbQQMT3RexNKi
	pYeb8CMo5eSgL3vh352zeZiSOxGSS/pJXFb0lnX+bjB1YEaRyXj4FPLM03PVwMq+ElJynPjN4VZgw
	zDpHdtJLDpiP3eGOQzdm/dlULXTj32aNrq2Pr6VneQ91uSGQkmZBFm1ORGZSgKjWUYW+h8mg2ggeI
	xOMf21yeMOFewKX8M5L5qnu3aoxC4k4QbsM1VbXKx8+wPULmvB3Ko/4JMHntXNvHCpE6aN8XSzatO
	hsDk8t3jP4yGVKYdIzVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOYv-0000000Gct1-3yju;
	Mon, 11 Nov 2024 07:10:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOVN-0000000Ga7M-3mrY
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:06:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=+IkbNjAuhZsJujR//RRVuoeLPgw/BKLVaR2o0CZst/I=; b=fWiPYgMR0Vi7lAxI0AFUaZpLzs
	/U/j3aIt2vyFSuNWP0TGh2l2OF60AStgzbTqpi8/YAtMprWCw7Xo8Ax/5/Q2tf36jcp5Vbbkvs3OW
	N1p+xr8bWzJKMXEqWapnVwQYTOG8i3RV2h7T9HY7KwOmHkWpMQI0DUjSpLOpIQdJ+68qGs6fSP5rQ
	lIyVXTe8xYVyXl78+TTliFMUsPYf5KlTPLOn4Mr+/2jh0fGsmUh1tZT5PD6kCirBVDAJ37BYGlQKP
	osXSZZhFZ9Qp3NxzKkZ4lSvl/CJjlbWjz2lIOSzErrxGyDhoZYo84wqL77JS/ZEuiU9I55UAJwGKt
	UnJJCyzA==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOVJ-0000000CR9L-2X2K
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:06:32 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Xn0vG1tqYz1ypXD;
	Mon, 11 Nov 2024 15:06:02 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 2925B1A0188;
	Mon, 11 Nov 2024 15:05:51 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:50 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 099/102] tests: ubifs_tools: mkfs_tests: Add fs content check test
Date: Mon, 11 Nov 2024 15:03:42 +0800
Message-ID: <20241111070346.1314122-100-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070630_580442_F7E9B1D7 
X-CRM114-Status: GOOD (  13.44  )
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

Initialize UBIFS image from a given directory, then check whether the
fs content in mounted UBIFS is consistent with the original directory.
Both UBI volume and file are chosen as storage mediums to test.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 .gitignore                                         |   1 +
 configure.ac                                       |   3 +-
 tests/ubifs_tools-tests/Makemodule.am              |   3 +-
 tests/ubifs_tools-tests/lib/common.sh.in           |   8 +
 .../mkfs_tests/build_fs_from_dir.sh.in             | 174 +++++++++++++++++++++
 5 files changed, 187 insertions(+), 2 deletions(-)
 create mode 100755 tests/ubifs_tools-tests/mkfs_tests/build_fs_from_dir.sh.in

diff --git a/.gitignore b/.gitignore
index 68fff365..ffbde6e5 100644
--- a/.gitignore
+++ b/.gitignore
@@ -121,6 +121,7 @@ tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh
 tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh
 tests/ubifs_tools-tests/fsck_tests/random_corrupted_fsck.sh
 tests/ubifs_tools-tests/fsck_tests/fsck_bad_image.sh
+tests/ubifs_tools-tests/mkfs_tests/build_fs_from_dir.sh
 
 #
 # Files generated by autotools
diff --git a/configure.ac b/configure.ac
index 1f07841c..095400f8 100644
--- a/configure.ac
+++ b/configure.ac
@@ -300,7 +300,8 @@ AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
 	tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh
 	tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh
 	tests/ubifs_tools-tests/fsck_tests/random_corrupted_fsck.sh
-	tests/ubifs_tools-tests/fsck_tests/fsck_bad_image.sh])
+	tests/ubifs_tools-tests/fsck_tests/fsck_bad_image.sh
+	tests/ubifs_tools-tests/mkfs_tests/build_fs_from_dir.sh])
 
 AC_OUTPUT([Makefile])
 
diff --git a/tests/ubifs_tools-tests/Makemodule.am b/tests/ubifs_tools-tests/Makemodule.am
index 1d3d0f29..f4d8a073 100644
--- a/tests/ubifs_tools-tests/Makemodule.am
+++ b/tests/ubifs_tools-tests/Makemodule.am
@@ -6,7 +6,8 @@ test_SCRIPTS += \
 	tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh \
 	tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh \
 	tests/ubifs_tools-tests/fsck_tests/random_corrupted_fsck.sh \
-	tests/ubifs_tools-tests/fsck_tests/fsck_bad_image.sh
+	tests/ubifs_tools-tests/fsck_tests/fsck_bad_image.sh \
+	tests/ubifs_tools-tests/mkfs_tests/build_fs_from_dir.sh
 
 test_DATA += \
 	tests/ubifs_tools-tests/images/good.gz \
diff --git a/tests/ubifs_tools-tests/lib/common.sh.in b/tests/ubifs_tools-tests/lib/common.sh.in
index a27fe108..8d1b3c03 100755
--- a/tests/ubifs_tools-tests/lib/common.sh.in
+++ b/tests/ubifs_tools-tests/lib/common.sh.in
@@ -8,8 +8,10 @@ UBI_NUM=0
 DEV=/dev/ubi0_0
 MNT=/mnt/test_file_system
 TMP_FILE=/tmp/ubifs_test_file
+TMP_MNT=/tmp/ubifs_tmp_mnt
 LOG_FILE=/tmp/ubifs_log
 KEY_FILE=/tmp/key
+IMG_FILE=ubifs.img
 nandsim_patt="NAND simulator"
 mtdram_patt="mtdram test device"
 
@@ -35,6 +37,8 @@ function cleanup_handler()
 {
 	local ret="$1"
 
+	umount $TMP_MNT >/dev/null 2>&1 ||:
+	rm -rf $TMP_MNT >/dev/null 2>&1 ||:
 	if [ "$ret" == "0" ]; then
 		umount $MNT >/dev/null 2>&1 ||:
 		modprobe -r ubifs >/dev/null 2>&1 ||:
@@ -45,6 +49,7 @@ function cleanup_handler()
 		rm -f $TMP_FILE >/dev/null 2>&1 ||:
 		rm -f $KEY_FILE >/dev/null 2>&1 ||:
 		rm -f $LOG_FILE >/dev/null 2>&1 ||:
+		rm -f $IMG_FILE >/dev/null 2>&1 ||:
 		exit 0
 	else
 		exit 1
@@ -344,6 +349,9 @@ function cancel_io_err()
 if ! [ -d $MNT ]; then
 	mkdir -p $MNT
 fi
+if ! [ -d $TMP_MNT ]; then
+	mkdir -p $TMP_MNT
+fi
 
 modprobe ubi || fatal "common.sh: cannot load ubi"
 modprobe ubifs || fatal "common.sh: cannot load ubifs"
diff --git a/tests/ubifs_tools-tests/mkfs_tests/build_fs_from_dir.sh.in b/tests/ubifs_tools-tests/mkfs_tests/build_fs_from_dir.sh.in
new file mode 100755
index 00000000..0b228562
--- /dev/null
+++ b/tests/ubifs_tools-tests/mkfs_tests/build_fs_from_dir.sh.in
@@ -0,0 +1,174 @@
+#!/bin/sh
+# Copyright (c), 2024, Huawei Technologies Co, Ltd.
+# Author: Zhihao Cheng <chengzhihao1@huawei.com>
+#
+# Test Description:
+# Initialize UBIFS image from a given directory, then check whether the
+# fs content in mounted UBIFS is consistent with the original directory.
+# Both UBI volume and file are chosen as storage mediums to test.
+# Running time: 10min
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
+	local vid_offs=$page_size;
+	local encryption=$5;
+	local test_medium=$6;
+	local space_fix=$7;
+	local need_fsck=$8;
+	local double_mkfs=$9;
+	local leb_size=$(($(($peb_size*1024))-$page_size));
+	VIDHDR_SZ=64;
+
+	option=""
+	if [[ "$space_fix" == "fix_space" ]]; then
+		option="-F"
+	fi
+	echo "======================================================================"
+	printf "%s" "$simulator: ${size}MiB PEB size ${peb_size}KiB"
+	if [ "$simulator" = "mtdram" ]; then
+		page_size=8
+		leb_size=$(($leb_size-$VIDHDR_SZ))
+	else
+		leb_size=$(($leb_size-$page_size))
+	fi
+	printf " %s" "page size ${page_size}Bytes"
+	printf " $encryption $test_medium $space_fix $need_fsck $double_mkfs\n"
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
+	dmesg -c > /dev/null
+	flash_eraseall /dev/mtd$mtdnum
+	modprobe ubi mtd="$mtdnum,$vid_offs" || fatal "modprobe ubi fail"
+	ubimkvol -N vol_test -m -n 0 /dev/ubi$UBI_NUM || fatal "mkvol fail"
+	modprobe ubifs || fatal "modprobe ubifs fail"
+	if [[ "$encryption" == "encrypted" ]]; then
+		encryption_gen_key
+		option="$option --cipher AES-256-XTS --key $KEY_FILE"
+	fi
+
+	if [[ "$test_medium" == "volume" ]]; then
+		mkfs.ubifs $option -m${page_size} -c 1024 -e $leb_size -f 4 -r $TMP_MNT $DEV
+		if [[ $? != 0 ]]; then
+			fatal "mkfs failed"
+		fi
+		if [[ "$double_mkfs" == "double_format" ]]; then
+			mkfs.ubifs -y $option -m${page_size} -c 1024 -e $leb_size -f 4 -r $TMP_MNT $DEV
+			if [[ $? != 0 ]]; then
+				fatal "mkfs failed"
+			fi
+		fi
+	else
+		mkfs.ubifs $option -m${page_size} -c 1024 -e $leb_size -f 4 -r $TMP_MNT -o $IMG_FILE
+		if [[ $? != 0 ]]; then
+			fatal "mkfs failed"
+		fi
+		ubiupdatevol $DEV $IMG_FILE
+		if [[ $? != 0 ]]; then
+			fatal "ubiupdatevol failed"
+		fi
+	fi
+
+	if [[ "$need_fsck" == "do_fsck" ]]; then
+		fsck.ubifs -a $DEV # 'fsck.ubifs $DEV' is fine too.
+		res=$?
+		if [[ $res != $FSCK_OK ]]
+		then
+			fatal "fsck expects result $FSCK_OK, but $res is returned"
+		fi
+	fi
+
+	enable_chkfs
+
+	mount_ubifs $DEV $MNT "noauthentication" "noatime"
+	res=$?
+	if [[ $res != 0 ]]
+	then
+		fatal "mount fail $res"
+	fi
+
+	if [[ "$encryption" != "encrypted" ]]; then
+		# Check filesystem information, skip encrypted image.
+		# fscryptctl is not compatible with fscryptctl in mtd-utils.
+		# See https://github.com/google/fscryptctl/issues/33
+		du -sh $MNT > /dev/null  # Make sure all files are accessible
+		ret=$?
+		if [[ $ret != 0 ]]; then
+			fatal "Cannot access all files"
+		fi
+
+		parse_dir "md5sum"
+	fi
+
+	check_err_msg
+
+	umount $MNT
+	res=$?
+	if [[ $res != 0 ]]
+	then
+		fatal "unmount fail $res"
+	fi
+
+	check_err_msg
+	disable_chkfs
+
+	if [[ "$test_medium" != "volume" ]]; then
+		rm -f $IMG_FILE
+	fi
+	modprobe -r ubifs
+	modprobe -r ubi
+	modprobe -r $simulator
+
+	echo "----------------------------------------------------------------------"
+}
+
+check_fsstress
+start_t=$(date +%s)
+echo "Do mkfs+fsck+mount test in kinds of flashes"
+mount -t tmpfs -osize=50m  none $TMP_MNT || fatal "cannot mount tmpfs"
+echo 123 > $TMP_MNT/file
+setfattr -n user.xyz -v 123abc $TMP_MNT/file
+fsstress -d $TMP_MNT -l30 -n10 -p4
+# Record filesystem information
+rm -f $TMP_FILE 2>/dev/null
+read_dir $TMP_MNT "md5sum"
+
+# No authentication tests, which needs a specific key from certs directory corresponding to linux source code..
+# See https://patchwork.ozlabs.org/project/linux-mtd/cover/20190806104928.1224-1-s.hauer@pengutronix.de/
+for simulator in "mtdram" "nandsim"; do
+	for encryption in "encrypted" "noencrypted"; do
+		for test_medium in "volume" "file"; do
+			for space_fix in "fix_space" "nofix_space"; do
+				for need_fsck in "do_fsck" "no_fsck"; do
+					for double_mkfs in "double_format" "format_once"; do
+						run_test "$simulator" "64" "64" "2048" $encryption $test_medium $space_fix $need_fsck $double_mkfs
+						run_test "$simulator" "128" "128" "2048" $encryption $test_medium $space_fix $need_fsck $double_mkfs
+						run_test "$simulator" "512" "512" "2048" $encryption $test_medium $space_fix $need_fsck $double_mkfs
+						run_test "$simulator" "1024" "512" "2048" $encryption $test_medium $space_fix $need_fsck $double_mkfs
+					done
+				done
+			done
+		done
+	done
+done
+
+umount $TMP_MNT
+rm -f $TMP_FILE 2>/dev/null
+end_t=$(date +%s)
+time_cost=$(( end_t - start_t ))
+echo "Success, cost $time_cost seconds"
+exit 0
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
