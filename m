Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A443C38A2A
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 12:27:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E09852082E
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 12:27:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YtjVlYF5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E09852082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fu9Hx4GSJ+QWbg3O9QVENn6TlgTmW2kUYI95TILQ7b8=; b=YtjVlYF50qH9mm
	pnLmy3y2ewFmHp/y0iilAKTrXLKmyiuk3bGq1+DbzVhZFELa7ThKqkENy/OZpi2se7RFHFLKX1GJ5
	Ew7Rgb65OJ46RlPzU0FuS5RnIYiOdzcRG1uGcIDLj6hzlvgr//zBNIZGhIVUrKUJ9SrIoWiy47nnR
	JEYkrUZBYC2rXwxiT9aRc4xu3WD9yIMf1J/YVnwzyqQnEAADOrq1aOVUaYZjxo6AE+rHLZ4sNq05m
	AcitldduaPoE9lSJODxROFZbkkA01PaLLh/MMC++HtASFbw09wGdOUk+bZrFo5Oq145P8FkFbw81/
	lFIaTilr+/SS5Gegflbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXl3Y-0000Xa-Rd; Sun, 10 May 2020 12:27:44 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXkpd-0005jg-1d
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 12:13:23 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D99E320014;
 Sun, 10 May 2020 12:13:18 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 58/62] mtd: rawnand: txx9ndfmc: Stop using nand_release()
Date: Sun, 10 May 2020 14:12:16 +0200
Message-Id: <20200510121220.18042-59-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510121220.18042-1-miquel.raynal@bootlin.com>
References: <20200510121220.18042-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_051321_228599_65466A6D 
X-CRM114-Status: GOOD (  10.55  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This helper is not very useful and very often people get confused:
they use nand_release() instead of nand_cleanup().

Let's stop using nand_release() by calling mtd_device_unregister() and
nand_cleanup() directly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/txx9ndfmc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 2642d5bb3241..47d966871445 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -371,7 +371,7 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 static int __exit txx9ndfmc_remove(struct platform_device *dev)
 {
 	struct txx9ndfmc_drvdata *drvdata = platform_get_drvdata(dev);
-	int i;
+	int ret, i;
 
 	if (!drvdata)
 		return 0;
@@ -385,7 +385,9 @@ static int __exit txx9ndfmc_remove(struct platform_device *dev)
 		chip = mtd_to_nand(mtd);
 		txx9_priv = nand_get_controller_data(chip);
 
-		nand_release(chip);
+		ret = mtd_device_unregister(nand_to_mtd(chip));
+		WARN_ON(ret);
+		nand_cleanup(chip);
 		kfree(txx9_priv->mtdname);
 		kfree(txx9_priv);
 	}
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
