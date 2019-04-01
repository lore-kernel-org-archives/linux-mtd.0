Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190ABC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:10:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBF1720857
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:10:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hoYY102T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBF1720857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8kovSRLqGUE29zz7KlZDSSUi3M0Z2c48EOSrjmHYjH0=; b=hoYY102Tal+IGf
	B9fILRxfZsfp2JY4zyta2snwqBj8rRy9DOk5UFeieOEAZ7HtT9Kyhrm7qFWeZtKiQHkaotvws6fPg
	Jd/D1mCpO4yVAIxPdF2BAY4Wa+AhsnZ9TWvHgWIpa8Lh4f7BF8EfEyW1autL3dVG6xm1lqLYYf6qo
	s+g+wiG2TRPYA1ULZEQLVeUDMN/H6NuhxtiYIjlFYYxGrfK5+iqyba3YYPZyjREIyi2FRFzh+BIau
	0Wk0CsCoBGJeNDugeB7ioOYpo6MIORYeG7D+MXtARWYXxkzFMqhkCDrRj9wJ5Sl1aCiWTy4jtdYzq
	zzYF6xiYr7c3B1uT2g9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAyZZ-00085e-Ja; Mon, 01 Apr 2019 15:10:05 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAyZO-0007hc-Ll
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 15:09:56 +0000
X-Originating-IP: 90.88.32.136
Received: from localhost.localdomain
 (aaubervilliers-681-1-91-136.w90-88.abo.wanadoo.fr [90.88.32.136])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1840840007;
 Mon,  1 Apr 2019 15:09:50 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 2/2] MAINTAINERS: MTD Git repository is hosted on kernel.org
Date: Mon,  1 Apr 2019 17:09:38 +0200
Message-Id: <20190401150938.10607-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190401150938.10607-1-miquel.raynal@bootlin.com>
References: <20190401150938.10607-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_080954_863797_1C10FA18 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Because of the slowness of the infradead.org server, Linus requested
that we send him PRs from another domain. We moved our Git repository
to kernel.org and maintain the following branches:
* Fixes based on the last -rc: mtd/fixes, nand/fixes, spi-nor/fixes.
* Next branch based usually on -rc1: mtd/next, nand/next, spi-nor/next.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 MAINTAINERS | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 383915d69a51..45b4d4ad5907 100644
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
@@ -10617,8 +10617,8 @@ R:	Richard Weinberger <richard@nod.at>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/
 Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
-T:	git git://git.infradead.org/linux-mtd.git nand/fixes
-T:	git git://git.infradead.org/linux-mtd.git nand/next
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/fixes
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
 S:	Maintained
 F:	drivers/mtd/nand/
 F:	include/linux/mtd/*nand*.h
@@ -14603,8 +14603,8 @@ M:	Tudor Ambarus <tudor.ambarus@microchip.com>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/
 Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
-T:	git git://git.infradead.org/linux-mtd.git spi-nor/fixes
-T:	git git://git.infradead.org/linux-mtd.git spi-nor/next
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/fixes
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
 S:	Maintained
 F:	drivers/mtd/spi-nor/
 F:	include/linux/mtd/spi-nor.h
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
