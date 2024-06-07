Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B202FC27C65
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OBI1CfTRrzhXa/d9arbmq9sigbLagfBdgoMlL6JwOI=; b=tJeXIltsbr/7yf
	S06yH8XTv+VGgKgoj2lk7Z1FbPACTuoODLP6HpR1HUlbWQ9x3Nr+4yFrlI+pJqmn16qOasRhlOTLU
	rAjg6ms7R88hwSouhXP9VTvAlc1YFDuAv5EO0soEyh5HB5Woi7XD2gusZhsLwpQrum3Yr+Y3W6aMT
	zAAfNBfR3Xq26/6OkVKV8kUn94uoU0NPprvXlRxm86WhHauk5/x9tU9YY6N2AFFn7SXNXccOvTOp/
	7DIOIjg3HL/xPFMOmKc9oGByWyJVJe6eHR3MRtx6M1pXoRoTbKBNP/R16D5ZbqEQMpTngSx647pHR
	Evj5jSDQk52lHPODCEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRIO-0000000CLVb-1JG2;
	Fri, 07 Jun 2024 04:33:44 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRGL-0000000CJrT-1V9K
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:32:09 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VwSst1mSPzdZhG;
	Fri,  7 Jun 2024 12:30:10 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 29F92180085;
	Fri,  7 Jun 2024 12:31:35 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:47 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 109/110] tests: ubifs_tools: Add run_all script
Date: Fri, 7 Jun 2024 12:26:14 +0800
Message-ID: <20240607042615.2069840-110-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_213138_344761_5884560C 
X-CRM114-Status: GOOD (  10.52  )
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

Add run_all script to run all UBIFS fsck & mkfs testcases.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 .gitignore                                        |  1 +
 configure.ac                                      |  1 +
 tests/ubifs_tools-tests/Makemodule.am             |  1 +
 tests/ubifs_tools-tests/ubifs_tools_run_all.sh.in | 65 +++++++++++++++++++++++
 4 files changed, 68 insertions(+)
 create mode 100755 tests/ubifs_tools-tests/ubifs_tools_run_all.sh.in

diff --git a/.gitignore b/.gitignore
index ffbde6e5..673536e9 100644
--- a/.gitignore
+++ b/.gitignore
@@ -114,6 +114,7 @@ tests/fs-tests/stress/fs_stress01.sh
 tests/ubi-tests/runubitests.sh
 tests/ubi-tests/ubi-stress-test.sh
 tests/ubifs_tools-tests/lib/common.sh
+tests/ubifs_tools-tests/ubifs_tools_run_all.sh
 tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh
 tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh
 tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh
diff --git a/configure.ac b/configure.ac
index 13974090..da1b0cfc 100644
--- a/configure.ac
+++ b/configure.ac
@@ -291,6 +291,7 @@ AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
 	tests/ubi-tests/runubitests.sh
 	tests/ubi-tests/ubi-stress-test.sh
 	tests/ubifs_tools-tests/lib/common.sh
+	tests/ubifs_tools-tests/ubifs_tools_run_all.sh
 	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh
 	tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh
 	tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh
diff --git a/tests/ubifs_tools-tests/Makemodule.am b/tests/ubifs_tools-tests/Makemodule.am
index f4d8a073..1715757e 100644
--- a/tests/ubifs_tools-tests/Makemodule.am
+++ b/tests/ubifs_tools-tests/Makemodule.am
@@ -1,5 +1,6 @@
 test_SCRIPTS += \
 	tests/ubifs_tools-tests/lib/common.sh \
+	tests/ubifs_tools-tests/ubifs_tools_run_all.sh \
 	tests/ubifs_tools-tests/fsck_tests/authentication_refuse.sh \
 	tests/ubifs_tools-tests/fsck_tests/cycle_mount_fsck_check.sh \
 	tests/ubifs_tools-tests/fsck_tests/powercut_fsck_mount.sh \
diff --git a/tests/ubifs_tools-tests/ubifs_tools_run_all.sh.in b/tests/ubifs_tools-tests/ubifs_tools_run_all.sh.in
new file mode 100755
index 00000000..a7caad04
--- /dev/null
+++ b/tests/ubifs_tools-tests/ubifs_tools_run_all.sh.in
@@ -0,0 +1,65 @@
+#!/bin/sh
+# Copyright (c), 2024, Huawei Technologies Co, Ltd.
+# Author: Zhihao Cheng <chengzhihao1@huawei.com>
+#
+# Test Description:
+# Run all testcases under 'tests' directory
+
+function print_line()
+{
+	echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
+	echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
+}
+
+TESTBINDIR=@TESTBINDIR@
+
+print_line
+$TESTBINDIR/authentication_refuse.sh
+if [[ $? != 0 ]]; then
+	echo "authentication_refuse failed"
+	exit 1
+fi
+print_line
+$TESTBINDIR/powercut_fsck_mount.sh
+if [[ $? != 0 ]]; then
+	echo "powercut_fsck_mount failed"
+	exit 1
+fi
+print_line
+$TESTBINDIR/cycle_corrupted_fsck_fault_inject.sh
+if [[ $? != 0 ]]; then
+	echo "cycle_corrupted_fsck_fault_inject failed"
+	exit 1
+fi
+print_line
+$TESTBINDIR/fsck_bad_image.sh
+if [[ $? != 0 ]]; then
+	echo "fsck_bad_image failed"
+	exit 1
+fi
+print_line
+$TESTBINDIR/random_corrupted_fsck.sh
+if [[ $? != 0 ]]; then
+	echo "random_corrupted_fsck failed"
+	exit 1
+fi
+print_line
+$TESTBINDIR/cycle_powercut_mount_fsck.sh
+if [[ $? != 0 ]]; then
+	echo "cycle_powercut_mount_fsck failed"
+	exit 1
+fi
+print_line
+$TESTBINDIR/cycle_mount_fsck_check.sh
+if [[ $? != 0 ]]; then
+	echo "cycle_mount_fsck_check failed"
+	exit 1
+fi
+print_line
+$TESTBINDIR/build_fs_from_dir.sh
+if [[ $? != 0 ]]; then
+	echo "build_fs_from_dir failed"
+	exit 1
+fi
+
+exit 0
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
