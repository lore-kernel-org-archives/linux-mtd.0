Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21965C021B1
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Feb 2025 08:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZT3sep4EEinyIgaQTzvx1AYqjeG59zZxVQvZqtDBqfA=; b=DQAhwOPhFTNRcA
	wZS759PXX2Qo3ArY0o9OkRSFzLU8gooNYtT4evuML/zVWEhNuADnFhwFRODIJbI4BkOjUBCzwoDZS
	Lu+gdmIX1xHUva+YLc4xpR3gQZJWEQ6918glUWyCnuaRczd8N2y3XoiN3Wx4lu8irllT/3Oxc2sqy
	TyqxOmhcZgVvIh7U7kXZgsRrZ5gdOZqNieCBoAr6KVaYxKHgMnKcuTAuir6QP7Q0KImqRJK0EsG7T
	tBLftnRHL+NqV0R2TIeJGn0CGwRWHjR08Yb0FUqC+g3/S708SmXWDFNMQD88bMPk/LcESaaF2eZFG
	+Xxpk/vdW1LLW3YNaq+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl25I-0000000HP4n-2gcQ;
	Thu, 20 Feb 2025 08:39:04 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl258-0000000HP2U-0rl4
	for linux-mtd@lists.infradead.org;
	Thu, 20 Feb 2025 08:38:55 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mol@pengutronix.de>)
	id 1tl255-0003KO-K7; Thu, 20 Feb 2025 09:38:51 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mol@pengutronix.de>)
	id 1tl254-001uGd-0Y;
	Thu, 20 Feb 2025 09:38:50 +0100
Received: from mol by dude05.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mol@pengutronix.de>)
	id 1tl254-004L0u-0O;
	Thu, 20 Feb 2025 09:38:50 +0100
From: Michael Olbrich <m.olbrich@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
	Michael Olbrich <m.olbrich@pengutronix.de>
Subject: [PATCH mtd-utils v2] tests: add test_DATA to EXTRA_DIST
Date: Thu, 20 Feb 2025 09:38:36 +0100
Message-Id: <20250220083836.1033367-1-m.olbrich@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_003854_258535_DB0AF506 
X-CRM114-Status: GOOD (  10.72  )
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

Otherwise, the test files are missin in the tarball and building fails
with:

make[1]: *** No rule to make target 'tests/ubifs_tools-tests/images/good.gz', needed by 'all-am'.  Stop.

unless --without-tests is uses.

Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
---

Changes in v2:
 - introduce a new variable for the test files
 - extend EXTRA_DIST in tests/ubifs_tools-tests/Makemodule.am instead of
   the toplevel Makefile.am

I've used a different name for the new variable to make is less generic.

 tests/ubifs_tools-tests/Makemodule.am | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/ubifs_tools-tests/Makemodule.am b/tests/ubifs_tools-tests/Makemodule.am
index 1715757e3188..4ce3f3393448 100644
--- a/tests/ubifs_tools-tests/Makemodule.am
+++ b/tests/ubifs_tools-tests/Makemodule.am
@@ -10,7 +10,7 @@ test_SCRIPTS += \
 	tests/ubifs_tools-tests/fsck_tests/fsck_bad_image.sh \
 	tests/ubifs_tools-tests/mkfs_tests/build_fs_from_dir.sh
 
-test_DATA += \
+TEST_IMAGE_FILES = \
 	tests/ubifs_tools-tests/images/good.gz \
 	tests/ubifs_tools-tests/images/sb_fanout.gz \
 	tests/ubifs_tools-tests/images/sb_fmt_version.gz \
@@ -64,3 +64,6 @@ test_DATA += \
 	tests/ubifs_tools-tests/images/dir_lost_not_recover.gz \
 	tests/ubifs_tools-tests/images/root_dir.gz \
 	tests/ubifs_tools-tests/images/empty_tnc.gz
+
+test_DATA += $(TEST_IMAGE_FILES)
+EXTRA_DIST +=$(TEST_IMAGE_FILES)
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
