Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B929D12D7E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 07:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2cywIDzy9oz8th7Hrlvwf/YrAGkC2n06UvLHFh5E5Dw=; b=BGA/7bwxVibWEF
	rx7ke9x/2UpAKaMo2jWMdGy1xRMKRRdYlHt7fq18KHukHJu6ORn+oWXz68nna6sTtoUFwB7hZZeyV
	FYE+UhvhXriS9YIFsyowm9Srk3UjI7sWS64hSMBJ1dEuE9V6fuodbMFLMgwilFnJ6L2/lLM1PaunB
	6KFCjoJtUxQwutsUfyhCSS1rKoORdWqKgMS0iqB9e+S0qKlF45pT6dD7SOXTTDK59fn1AoZg/Tbwj
	xuVmfcP80rBmszApss3pVTrtSDbSjzOCft+i3IFlG4miAG+aHHwb1jY/Tum3YQopJ/itWl+bdbESC
	4jduZuDY08gxqfBRxmRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOZH-0000000Gd8x-3PJp;
	Mon, 11 Nov 2024 07:10:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOVV-0000000GaD8-22dT
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+FBVF95Ad6o5h3VLFaSm19aLt/TzWuL9v2R7OCZVRaw=; b=ELr+qp7xVtwRnIkhayiVGGvEh/
	xnyIN9dnIqiXRtCvZRwusV6GPZ0j3symkHBPUWqLyle/XCOgY8Dd14ph74tX2nKkZcQcScD4s/8vW
	Bldl/8vx98vcqsOutqNn8+WGtJ0IFqF3wuz6e0dNCQcKYeN6+eBomM2u0cTYFP2yNBBufLMzpY/wj
	uXHOJB5w07rhj2OkT/nLNZ4a3SjJBwjC2PDEg96r8EcDGvEBQsOV7feJCLitggYB1kQGfk/itz8yW
	EKe7QfmV2fC8M2+kUsR2Jqn/w07VjCHgY1P3ibznVAHvEh9GxItB6dchZwdpzTpKfRo184bFQdNwg
	SpZhG9Nw==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOVE-0000000CmTJ-1nzD
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:06:39 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Xn0nb5ZGzz28fSN;
	Mon, 11 Nov 2024 15:01:07 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 274921A0188;
	Mon, 11 Nov 2024 15:05:49 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:48 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 095/102] tests: ubifs_tools: fsck_tests: Add cycle_powercut+fsck test
Date: Mon, 11 Nov 2024 15:03:38 +0800
Message-ID: <20241111070346.1314122-96-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070627_308238_D3BCDC34 
X-CRM114-Status: GOOD (  15.78  )
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

Inject powercut while doing fsstress on mounted UBIFS, check the
consistency of UBIFS after fsck.
This testscase mainly makes sure that fsck.ubifs can make UBIFS
image be consistent in common stress cases and powercut cases.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 .gitignore                                         |   1 +
 configure.ac                                       |   3 +-
 tests/ubifs_tools-tests/Makemodule.am              |   3 +-
 .../fsck_tests/cycle_powercut_mount_fsck.sh.in     | 148 +++++++++++++++++++++
 4 files changed, 153 insertions(+), 2 deletions(-)
 create mode 100755 tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh.in

diff --git a/.gitignore b/.gitignore
index ea99a614..1d150f7a 100644
--- a/.gitignore
+++ b/.gitignore
@@ -118,6 +118,7 @@ tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh
 tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh
 tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh
 tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh
+tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh
 
 #
 # Files generated by autotools
diff --git a/configure.ac b/configure.ac
index 47efd40c..7b929459 100644
--- a/configure.ac
+++ b/configure.ac
@@ -297,7 +297,8 @@ AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
 	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh
 	tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh
 	tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh
-	tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh])
+	tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh
+	tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh])
 
 AC_OUTPUT([Makefile])
 
diff --git a/tests/ubifs_tools-tests/Makemodule.am b/tests/ubifs_tools-tests/Makemodule.am
index 932a2bcb..2c190e2b 100644
--- a/tests/ubifs_tools-tests/Makemodule.am
+++ b/tests/ubifs_tools-tests/Makemodule.am
@@ -3,4 +3,5 @@ test_SCRIPTS += \
 	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh \
 	tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh \
 	tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh \
-	tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh
+	tests/ubifs_tools-tests/fsck_tests/cycle_corrupted_fsck_fault_inject.sh \
+	tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh
diff --git a/tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh.in b/tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh.in
new file mode 100755
index 00000000..6af1b54d
--- /dev/null
+++ b/tests/ubifs_tools-tests/fsck_tests/cycle_powercut_mount_fsck.sh.in
@@ -0,0 +1,148 @@
+#!/bin/sh
+# Copyright (c), 2024, Huawei Technologies Co, Ltd.
+# Author: Zhihao Cheng <chengzhihao1@huawei.com>
+#
+# Test Description:
+# Do many cycles of mount/fsstress/powercut/umount/fsck/mount, check whether
+# mount is successful.
+# Running time: 9h
+
+TESTBINDIR=@TESTBINDIR@
+source $TESTBINDIR/common.sh
+
+ID="0x20,0xa7,0x00,0x26" # 4G 256KB 4KB 2KB-sub-page
+
+function run_test()
+{
+	local encryption=$1
+
+	echo "Do cycle mount+powercut+fsck+umount($encryption) test"
+	modprobe nandsim id_bytes=$ID
+	mtdnum="$(find_mtd_device "$nandsim_patt")"
+	flash_eraseall /dev/mtd$mtdnum
+
+	dmesg -c > /dev/null
+
+	modprobe ubi mtd="$mtdnum,4096" || fatal "modprobe ubi fail"
+	ubimkvol -N vol_test -m -n 0 /dev/ubi$UBI_NUM || fatal "mkvol fail"
+	modprobe ubifs || fatal "modprobe ubifs fail"
+
+	if [[ "$encryption" == "encrypted" ]]; then
+		encryption_gen_key
+	fi
+
+	round=0
+	while [[ $round -lt 60 ]]
+	do
+		echo "---------------------- ROUND $round ----------------------"
+		let round=$round+1
+
+		mount_ubifs $DEV $MNT || fatal "mount ubifs fail"
+		if [[ "$encryption" == "encrypted" ]]; then
+			encryption_set_key $MNT
+		fi
+
+		if [[ $(($round % 30)) == 0 ]]
+		then
+			echo "Clean files"
+			rm -rf $MNT/*
+			check_err_msg
+		fi
+
+		fsstress -d $MNT -l0 -p4 -n10000 &
+		sleep $((RANDOM % 30))
+
+		per=`df -Th | grep ubifs | awk '{print $6}'`;
+		if [[ ${per%?} -gt 95 ]]; then
+			dmesg -c > /dev/null # The ENOSPC error messages may exist
+		else
+			check_err_msg # Make sure new operations are okay after fsck
+		fi
+		powercut
+
+		ps -e | grep -w fsstress > /dev/null 2>&1
+		while [ $? -eq 0 ]
+		do
+			killall -9 fsstress > /dev/null 2>&1
+			sleep 1
+			ps -e | grep -w fsstress > /dev/null 2>&1
+		done
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
+			# Powercut during layout_leb_in_gaps may change index
+			# LEBs without updating LPT.
+			idx_log=`cat $LOG_FILE | grep "Inconsistent properties" | grep "is_idx 1"`
+			# The lpt nodes could be parsed incorrectly because the lpt disk
+			# layout is too simple. See details in
+			# https://lore.kernel.org/linux-mtd/97ca7fe4-4ad4-edd1-e97a-1d540aeabe2d@huawei.com/
+			lpt_log=`cat $LOG_FILE | grep "dbg_check_ltab_lnum: invalid empty space in LEB"`
+			if [[ "$idx_log" == "" ]] && [[ "$lpt_log" == "" ]]; then
+				fatal "fsck fail $res"
+			fi
+			if [[ $res != $FSCK_NONDESTRUCT ]]; then
+				fatal "fsck fail $res"
+			fi
+		fi
+
+		dmesg -c > /dev/null # powercut could reproduce error messages
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
+		du -sh $MNT > /dev/null  # Make sure all files are accessible
+		ret=$?
+		if [[ $ret != 0 ]]; then
+			fatal "Cannot access all files"
+		fi
+		check_err_msg
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
+run_test "encrypted"
+run_test "noencrypted"
+end_t=$(date +%s)
+time_cost=$(( end_t - start_t ))
+echo "Success, cost $time_cost seconds"
+exit 0
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
