Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EA9D2E9C3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7E8QT1GuR+zLaiuvC0o2yYC+jLRuJjqPMj9FIJECSUk=; b=nzWlhy0GjdTv+N
	G7VoqWARbj6kgQVn0mTNzEP9nzGj+rAh2gwdZ9YtwOHNraX9woJYhSkXhc0vlZ7vv1vHHbfJILEwl
	+cY6E/OrhgcZm48Z7/RSaPjwyjnyviVaeVcketonvy9XXVSQFVzNgWsHNWhxqENT5a1UWdgOYYPHG
	IGJjfKPmLXKO1hI2Y9RFvbCEFVmzDEx62SRqnki7APLDT+91CmwylPMpqLeidFpEU/kMmDcq/n2R6
	9a1sKeHXG+YD0YNKS+/lOU8a017ajN3xZ0J36F8YEIWRgO3+oehd12L6+GdA9HJWnvsZEmWelaami
	06A71a7KuKxVOFuYrbuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQSg-0000000H20I-1HP7;
	Mon, 11 Nov 2024 09:11:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQQz-0000000H0Yi-2suy
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 09:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/FW/8wkFockmfpcKQdWR5cwIchzaUZwhJ/n9F6+zgnc=; b=CaXEVndSccoFu+a5YJ5I9uqozi
	j3jQ5FnaDbmH0+mrDTlJB3/Z/2JOac7bAxFn0V9dTRVyhHI05Seo8TNMkhnP/FWMTnCCh2zD8ALFO
	jlk7o8/Q5uNdZvRbZLIvxtyjlsBYa+FeAP4nbRCg02GWs6F/4ndOCWfRfxhmNTrkSyiiM5hw/zaQR
	A7GiWeBxaUBgMhXcsgbUS3CT+SQqbI21DGvPAhWAILvYwqYnH7kjFpSQbw504KdHKq16ndkGiWbCR
	8nDI+KcGcGHOUsBgaVaE8bfTMCjtrCNTLrOWxBddQA0H3/Kb6/ss3CzjMXX0zIvd5EaIE6IuQCWM2
	PDjxxjrw==;
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQQv-0000000CoZH-2rsF
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 09:10:08 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Xn3cs3h5JzQsrj;
	Mon, 11 Nov 2024 17:08:45 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id F3C991400DC;
	Mon, 11 Nov 2024 17:09:57 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 17:09:57 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 100/102] tests: ubifs_tools: Add run_all script
Date: Mon, 11 Nov 2024 17:08:28 +0800
Message-ID: <20241111090832.2093596-31-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_091006_845069_C85EEAA5 
X-CRM114-Status: GOOD (  10.70  )
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
