Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494F1C4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 08:04:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A0D3217D4
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 08:04:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TMHNg/mr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A0D3217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2FsjhZTnIEeduRBAvvYxJuXiEnRa6Yeq53rvpX1cii4=; b=TMHNg/mrOC8mpU
	qOUD391PuHV4K2p6jitL5ZsCGPWZ5tyNllSMpawSEwhYbUU8xpiH6hW2xj4mSaiULW8bSF9cszG+o
	iNaoVxEV8EHiig4zSm6MaQ3cYqbMEXz5A/RhHd+q1dC55ylNimd4jqhUowO8l96EP4Y1onMiSQcMs
	BS8B/fKnU5jrViFf5YiMABJdZztjs5BEHww3Y2xCUty/9SyVOvZqkiCsVRIy0YXdFVJF14obiM4px
	OulqsXB2a3EfrKTOtONxgsKunKlrv0Ywu/X5VWT6i2phgZW6CIJ7Ng8OZLDFdIOITbVleW7AUMyjE
	of/v32qi4+bW6Qc/92eQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCJpP-0002WJ-J9; Fri, 05 Apr 2019 08:03:59 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCJpL-0002Va-Da
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2019 08:03:57 +0000
X-Originating-IP: 90.88.30.125
Received: from localhost.localdomain
 (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr [90.88.30.125])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C10B26000A;
 Fri,  5 Apr 2019 08:03:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] MAINTAINERS: MTD Git repository is hosted on kernel.org
Date: Fri,  5 Apr 2019 10:03:42 +0200
Message-Id: <20190405080342.26330-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_010355_612197_54B05303 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Because of the slowness of the infradead.org server, Linus requested
that we send him PRs from another domain. We moved our Git repository
to kernel.org and maintain the following branches:
* Fixes based on the last -rc: mtd/fixes
* Next branch based usually on -rc1: mtd/next, nand/next, spi-nor/next.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes in v2:
* Drop nand/fixes and spi-nor/fixes, we won't use them.


 MAINTAINERS | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 383915d69a51..ef6a56141344 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10004,8 +10004,8 @@ M:	Vignesh Raghavendra <vigneshr@ti.com>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/
 Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
-T:	git git://git.infradead.org/linux-mtd.git master
-T:	git git://git.infradead.org/linux-mtd.git mtd/next
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
 S:	Maintained
 F:	Documentation/devicetree/bindings/mtd/
 F:	drivers/mtd/
@@ -10617,8 +10617,7 @@ R:	Richard Weinberger <richard@nod.at>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/
 Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
-T:	git git://git.infradead.org/linux-mtd.git nand/fixes
-T:	git git://git.infradead.org/linux-mtd.git nand/next
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
 S:	Maintained
 F:	drivers/mtd/nand/
 F:	include/linux/mtd/*nand*.h
@@ -14603,8 +14602,7 @@ M:	Tudor Ambarus <tudor.ambarus@microchip.com>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/
 Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
-T:	git git://git.infradead.org/linux-mtd.git spi-nor/fixes
-T:	git git://git.infradead.org/linux-mtd.git spi-nor/next
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
 S:	Maintained
 F:	drivers/mtd/spi-nor/
 F:	include/linux/mtd/spi-nor.h
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
