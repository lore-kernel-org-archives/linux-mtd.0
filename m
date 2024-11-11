Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B349D12D7C
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 07:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6e3FSJuiUsXVBG/i/0UMvYdAf6m/L/Di5k0DD9ic0LE=; b=zpBxcLR0vlwiNd
	qQv91NNiU2Xsfcdvpdv82ytPKE7r3T7WUnEB0QoPQXzYkuSZTNa5yZl4M4h5eMT/7lrVcyGAHl9l8
	+/hA6DN62GTTEGAOuBdRVHqf6ExBdoa/VseRmTvTC1WCS0gP4rK4ts8y73eY3r5t6CfD2+sbY2yo8
	Uj4eT2k62CFUGYn74XxhV6Mzd8mZdy/quK6EgBdIBcoeyjRXAmf1j4040+sGOlTyqQRswVW15s5O+
	rqHeuIHToo2SAscMtYo+mRubgkDDDoLr267576ggM7c/B5apFZF0x0411z20OPlJ6WFF1R8P8pl14
	WHrGta1vGF7cAk+glWzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOYM-0000000GcUB-2AsD;
	Mon, 11 Nov 2024 07:09:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOVS-0000000GaAW-1Ry1
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:06:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=s7eIVP75FrYtxtMjaUMD+6yybI09+fjcFEAfhxC/8Pg=; b=UbmrUc0TTEG/GGgsU8UsknU3oq
	Mh+Zq25r4xV3yEsPpkqntL2X6BXHEkBg6Tu1Iz2zlK6Lfr4jUnh+aARXp/OXSM7MFJh4h0hHOO6DL
	B2GPz3gBc4mg0GFNrC9xawa3TQqDKQ8NaxHslz4Lblh8e5M1fb6o1KrrnKdvI5VOFh3GB5PX/8E6N
	EVTQYJtElI6nWeLUMF0x0Gcfam7lKqyim0D6QgsVx+Y2Puj8lqZTwaGlFuvQN7urn71oaXy8hJsKD
	RO50XJySEcR2odHYMD1HZiCIiP8Ij3kO/8ZX3HpIc9HPjs0jLPpmg0RFq/WfPA/UdvGDscWzh6gfi
	Y9BpTl8A==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOVO-0000000CR9B-0jYE
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:06:37 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Xn0vB5KGRz1ypVD;
	Mon, 11 Nov 2024 15:05:58 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 9F0091A0188;
	Mon, 11 Nov 2024 15:05:47 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:46 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 092/102] tests: ubifs_tools: fsck_tests: Add cycle mount+fsck test
Date: Mon, 11 Nov 2024 15:03:35 +0800
Message-ID: <20241111070346.1314122-93-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070635_159111_48283A32 
X-CRM114-Status: GOOD (  13.10  )
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

Do fsstress and fsck, check whether there are any files(and their data)
are lost after fsck. This testcase mainly checks whether fsck.ubifs could
corrupt the filesystem content in common case.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 .gitignore                                         |   1 +
 configure.ac                                       |   3 +-
 tests/ubifs_tools-tests/Makemodule.am              |   3 +-
 .../fsck_tests/cycle_mount_fsck_check.sh.in        | 154 +++++++++++++++++++++
 4 files changed, 159 insertions(+), 2 deletions(-)
 create mode 100755 tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh.in

diff --git a/.gitignore b/.gitignore
index 799290a4..7de38e86 100644
--- a/.gitignore
+++ b/.gitignore
@@ -115,6 +115,7 @@ tests/ubi-tests/runubitests.sh
 tests/ubi-tests/ubi-stress-test.sh
 tests/ubifs_tools-tests/lib/common.sh
 tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh
+tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh
 
 #
 # Files generated by autotools
diff --git a/configure.ac b/configure.ac
index 45f51abb..bcd9b63a 100644
--- a/configure.ac
+++ b/configure.ac
@@ -294,7 +294,8 @@ AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
 	tests/ubi-tests/runubitests.sh
 	tests/ubi-tests/ubi-stress-test.sh
 	tests/ubifs_tools-tests/lib/common.sh
-	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh])
+	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh
+	tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh])
 
 AC_OUTPUT([Makefile])
 
diff --git a/tests/ubifs_tools-tests/Makemodule.am b/tests/ubifs_tools-tests/Makemodule.am
index 6b533982..68c77a62 100644
--- a/tests/ubifs_tools-tests/Makemodule.am
+++ b/tests/ubifs_tools-tests/Makemodule.am
@@ -1,3 +1,4 @@
 test_SCRIPTS += \
 	tests/ubifs_tools-tests/lib/common.sh \
-	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh
+	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh \
+	tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh
diff --git a/tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh.in b/tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh.in
new file mode 100755
index 00000000..c9972e27
--- /dev/null
+++ b/tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh.in
@@ -0,0 +1,154 @@
+#!/bin/sh
+# Copyright (c), 2024, Huawei Technologies Co, Ltd.
+# Author: Zhihao Cheng <chengzhihao1@huawei.com>
+#
+# Test Description:
+# Do many cycles of mount/fsstress/umount/fsck/mount, check whether the
+# filesystem content before fsck and after fsck are consistent.
+# Running time: 10h
+
+TESTBINDIR=@TESTBINDIR@
+source $TESTBINDIR/common.sh
+
+ID="0xec,0xa1,0x00,0x15" # 128M 128KB 2KB 512-sub-page
+
+function run_test()
+{
+	encryption=$1
+	modprobe nandsim id_bytes=$ID
+	mtdnum="$(find_mtd_device "$nandsim_patt")"
+	flash_eraseall /dev/mtd$mtdnum
+
+	dmesg -c > /dev/null
+
+	modprobe ubi mtd="$mtdnum,2048" || fatal "modprobe ubi fail"
+	ubimkvol -N vol_test -m -n 0 /dev/ubi$UBI_NUM || fatal "mkvol fail"
+	modprobe ubifs || fatal "modprobe ubifs fail"
+
+	echo "Do cycle mount+umount+fsck+check_fs_content test ($encryption)"
+
+	if [[ "$encryption" == "encrypted" ]]; then
+		encryption_gen_key
+	fi
+
+	round=0
+	while [[ $round -lt 20 ]]
+	do
+		echo "---------------------- ROUND $round ----------------------"
+		let round=$round+1
+
+		mount_ubifs $DEV $MNT "noauthentication" "noatime" || fatal "mount ubifs fail"
+		if [[ "$encryption" == "encrypted" ]]; then
+			encryption_set_key $MNT
+		fi
+
+		per=`df -Th | grep ubifs | awk '{print $6}'`;
+		if [[ ${per%?} -gt 95 ]]; then
+			# Used > 95%
+			echo "Clean files"
+			rm -rf $MNT/*
+			check_err_msg
+		fi
+
+		fsstress -d $MNT -l0 -p4 -n10000 &
+
+		sleep $((RANDOM % 30))
+
+		ps -e | grep -w fsstress > /dev/null 2>&1
+		while [ $? -eq 0 ]
+		do
+			killall -9 fsstress > /dev/null 2>&1
+			sleep 1
+			ps -e | grep -w fsstress > /dev/null 2>&1
+		done
+
+		per=`df -Th | grep ubifs | awk '{print $6}'`;
+		if [[ ${per%?} -gt 95 ]]; then
+			dmesg -c > /dev/null # The ENOSPC error messages may exist
+		else
+			check_err_msg # Make sure new operations are okay after fsck
+		fi
+		sync
+
+		# Record filesystem information
+		rm -f $TMP_FILE 2>/dev/null
+		read_dir $MNT "md5sum"
+
+		while true
+		do
+			res=`mount | grep "$MNT"`
+			if [[ "$res" == "" ]]
+			then
+				break;
+			fi
+			umount $MNT
+			sleep 0.1
+		done
+
+		fsck.ubifs -a $DEV 2>&1 > $LOG_FILE
+		res=$?
+		cat $LOG_FILE
+		if [[ $res != $FSCK_OK ]]
+		then
+			# The lpt nodes could be parsed incorrectly because the lpt disk
+			# layout is too simple. See details in
+			# https://lore.kernel.org/linux-mtd/97ca7fe4-4ad4-edd1-e97a-1d540aeabe2d@huawei.com/
+			log=`cat $LOG_FILE | grep "dbg_check_ltab_lnum: invalid empty space in LEB"`
+			if [[ "$log" == "" ]]; then
+				fatal "fsck fail $res"
+			fi
+			if [[ $res != $FSCK_NONDESTRUCT ]]; then
+				fatal "fsck fail $res"
+			fi
+		fi
+
+		enable_chkfs
+
+		mount_ubifs $DEV $MNT "noauthentication" "noatime"
+		res=$?
+		if [[ $res != 0 ]]
+		then
+			fatal "mount fail $res"
+		fi
+
+		if [[ "$encryption" == "encrypted" ]]; then
+			encryption_set_key $MNT
+		fi
+
+		du -sh $MNT > /dev/null  # Ensure that all files are accessible
+		ret=$?
+		if [[ $ret != 0 ]]; then
+			fatal "Cannot access all files"
+		fi
+		check_err_msg
+
+		# Check filesystem information
+		parse_dir "md5sum"
+		rm -f $TMP_FILE 2>/dev/null
+
+		umount $MNT
+		res=$?
+		if [[ $res != 0 ]]
+		then
+			fatal "unmount fail $res"
+		fi
+
+		check_err_msg
+
+		disable_chkfs
+	done
+
+	modprobe -r ubifs
+	modprobe -r ubi
+	modprobe -r nandsim
+}
+
+check_fsstress
+start_t=$(date +%s)
+for encryption in "encrypted" "noencrypted"; do
+	run_test $encryption
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
