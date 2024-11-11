Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E28AD12D7B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 07:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7E8QT1GuR+zLaiuvC0o2yYC+jLRuJjqPMj9FIJECSUk=; b=LilAAb26R6atLr
	lT+BW0YWIGXYiZyuQGuGR7gpImOV+wVOAPEgKzsLnChvv2HT3vS5zgasuY7oNbSP/OFeO7VGYQClH
	GQ+4hue+j3K5SBcoeFIyZiSUPeipCaq///g5tBpKUAliEYnIZZHyLixji1LgebR/D1GjAyhwZ3uAK
	YaH2QAUkir3y6Q/Mg4KtGgML6wnEcIBTClXx61CbLrgox6qk89Lj0WM/lN+6z5Cx5bMxe0wI3XWBd
	UoUsXZHNQ2j/RPfqMYMrD4kksfSpazlj9q9imRDZcUi/UT7uai4Fne/XNeNR2ThMiAKiO3f8WlEnA
	5ZKKF48reIYZaz3DfCgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOVy-0000000GaaN-2uTq;
	Mon, 11 Nov 2024 07:07:10 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUj-0000000GZZK-3ZgL
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:59 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xn0rv5dkCz10V9H;
	Mon, 11 Nov 2024 15:03:59 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B3FCE1401F1;
	Mon, 11 Nov 2024 15:05:51 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:51 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 100/102] tests: ubifs_tools: Add run_all script
Date: Mon, 11 Nov 2024 15:03:43 +0800
Message-ID: <20241111070346.1314122-101-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_230554_831712_2889105E 
X-CRM114-Status: GOOD (  11.38  )
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
index 095400f8..7b5d6096 100644
--- a/configure.ac
+++ b/configure.ac
@@ -294,6 +294,7 @@ AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
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
