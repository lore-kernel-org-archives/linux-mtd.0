Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739BAC021B1
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Feb 2025 11:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BssF1aLC9fRtIkRUJM+nxXB+rmzgsrKmaAAPUvddm2Q=; b=fR/K1WC5zjU9/p
	3HLaY9be9WRVpgo68+pI9B4q7BVlnO4AXq6A8okm/o2wMZksvMmVtAg5qAhNzsPHQYNfSkvnNP6Ot
	9maMdfhsoF/Qp8yHmbz071redXTbeQ1iXgaAGorSLKRyGI7ZpgmlJrc0HC9uH+l5MLHwFk1eLgM+u
	2VxMj9iXyQ36nksnUNpzIv7QdH7dlTVj4NpGlN0/VD8oN8+1yKHPrkgtWc/1d3c0SjIkhSNiE8diK
	XPptZKAuOBu5MN+RXf2Ujt56LuRo46x7vkq5L521e4N/MVgY0pDJEaReHJRI3+yS7f/fuMvfnLK0U
	mLfBIoWJy/qQUVAxa+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4gu-00000000Xfv-22Ph;
	Thu, 20 Feb 2025 11:26:04 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4gs-00000000Xds-03lt
	for linux-mtd@lists.infradead.org;
	Thu, 20 Feb 2025 11:26:03 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mol@pengutronix.de>)
	id 1tl4gq-0007Ec-2u; Thu, 20 Feb 2025 12:26:00 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mol@pengutronix.de>)
	id 1tl4go-001vVO-1Z;
	Thu, 20 Feb 2025 12:25:58 +0100
Received: from mol by dude05.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mol@pengutronix.de>)
	id 1tl4go-0091bE-1M;
	Thu, 20 Feb 2025 12:25:58 +0100
From: Michael Olbrich <m.olbrich@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
	Michael Olbrich <m.olbrich@pengutronix.de>
Subject: [PATCH mtd-utils v3] tests: add test_DATA to EXTRA_DIST
Date: Thu, 20 Feb 2025 12:25:54 +0100
Message-Id: <20250220112554.2150046-1-m.olbrich@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_032602_048545_5D4BEDE1 
X-CRM114-Status: GOOD (  10.08  )
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

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
---

Changes in v2:
 - introduce a new variable for the test files
 - extend EXTRA_DIST in tests/ubifs_tools-tests/Makemodule.am instead of
   the toplevel Makefile.am

Changes in v3:
 - added missing whitespace

 tests/ubifs_tools-tests/Makemodule.am | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/ubifs_tools-tests/Makemodule.am b/tests/ubifs_tools-tests/Makemodule.am
index 1715757e3188..5fe4f83a6fdb 100644
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
+EXTRA_DIST += $(TEST_IMAGE_FILES)
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
