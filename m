Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4AEC021AB
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2025 08:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DNSWDae4JAssTnaat+PiFcZPf/uDrrZJQey+zgQ3WvQ=; b=ZxDaN8yEJMBG7S
	AOCqvf9kMedss4tZg9T92/qOtkxuSyZW+c8rOKhRqqunYdCd5NSzTsRDLAIZbQBBff5YIWJvSzgDs
	a/c7Az2X4h2gMXHA/y9yUSANkEHPFpdTfTi7mnA6UJ+ghKhUDbr4PwQIhPm0dzhbrS+/JyMbIgHiY
	OMnP48Ak4UWAfp8Cvn3iFDIkJ+WcveeqXPA+SIrO4EkFxQNpe0t9SU5BM9pdLVVP3tPHhJ/Eyt8MJ
	ooh93/gAw4fbdA9MQhoE6FS4Ooh9u3Nz20ESQRvxt715cksdkKZdphvMH0RLcYdAlyQ37cUapG24Q
	c4CeM8aVKuoFf+PzCNOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfn1-0000000Bdz4-0LHs;
	Wed, 19 Feb 2025 08:50:43 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfQR-0000000BVe4-0W0W
	for linux-mtd@lists.infradead.org;
	Wed, 19 Feb 2025 08:27:24 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mol@pengutronix.de>)
	id 1tkfQN-0005oh-TP; Wed, 19 Feb 2025 09:27:19 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mol@pengutronix.de>)
	id 1tkfQN-001jOB-2L;
	Wed, 19 Feb 2025 09:27:19 +0100
Received: from mol by dude05.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mol@pengutronix.de>)
	id 1tkfQN-00GbBp-2C;
	Wed, 19 Feb 2025 09:27:19 +0100
From: Michael Olbrich <m.olbrich@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Michael Olbrich <m.olbrich@pengutronix.de>
Subject: [PATCH mtd-utils] tests: add test_DATA to EXTRA_DIST
Date: Wed, 19 Feb 2025 09:27:06 +0100
Message-Id: <20250219082706.3956008-1-m.olbrich@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_002723_159147_2D09DEAB 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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
 Makefile.am | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile.am b/Makefile.am
index c7561272fab3..9efcacc6991a 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -70,3 +70,5 @@ endif
 if UNIT_TESTS
 include tests/unittests/Makemodule.am
 endif
+
+EXTRA_DIST += $(test_DATA)
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
