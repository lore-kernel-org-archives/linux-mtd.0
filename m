Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C0AC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 08:46:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DC7A6135E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 08:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DC7A6135E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xC6srO+yTIpHlVlsbDpSOueHEEFA4I8uU8Kg9kp7zuo=; b=1fm9INeiGfg96H
	JLC4kmeUoRaADoXw4KA4/RBv6JKjD4mwY6qzizfEymB1MrbMiujNhPRlJewcpUeQqIyK7CEyv8Fy4
	IsM/pgTa5YrHNFDrajV39Nxw0zjFIOHGeGdlitTf3QkpUW315tQHwQ8xzMe3owcM6MTlIYZFF4nbj
	rB6qd/XZBDMpkvge+N8CB6GzY/V+GNYkGSyBcymbDfodcCMwH5XZPUerKQUrocazhBBvva62DdTm4
	Swlw0SewJKet60o7MSLFjxW4DouUqrCfEaMkIQAbcKlK3PPHMRYDDkRw1yUj5DIq18iTprChOaLaF
	XpuenY1oqydK1PweGFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md7EU-003rbf-QD; Wed, 20 Oct 2021 08:45:58 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md7EE-003rXR-M0
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 08:45:45 +0000
Received: from zen.. (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id 7ECCEC7EC1;
 Wed, 20 Oct 2021 08:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1634719539; bh=62lajEG/Zp5Y2+ojU0CnJypHmdp5+W22IzTBw2oTzyg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=OAgdH1hzJJy8Okt0XHUi8YteB/3iRyorCpMvWodCoUd/tnOwgu5LeoBP0GHstw5zM
 2drP6l243bq4biY+ajAmvLMrqVdQ39HeaeRsA8XMTj92Swirhn8PSOm2DlJJhTbFgb
 UBcY48WIt5C++9j+h7A0Cfb5EsYT4pCo3u9Ia7ZgQqKvseB4RzWtgNbH6fRiEH46Vn
 xrckiCcUXCNGGXFfBNfvRrqZgDGKoJu2f7ImZ8rpBbueSe7QgB6k3WpFxxJ3BA4Mm5
 VmM4WU5GCO/8QQo4QWOIrQPlTTCegkk6FVmUDyHqvPmLuP2lvW6OviKU4526htxGJj
 +fjEE+mkOhVeQ==
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sean Nyekjaer <sean@geanix.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] mtd: rawnand: nand_bbt: hide suspend/resume hooks
 while scanning bbt
Date: Wed, 20 Oct 2021 10:45:31 +0200
Message-Id: <20211020084534.2472305-2-sean@geanix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020084534.2472305-1-sean@geanix.com>
References: <20211020084534.2472305-1-sean@geanix.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_014542_901862_5B3CC80A 
X-CRM114-Status: GOOD (  16.04  )
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

From: Boris Brezillon <boris.brezillon@collabora.com>

The BBT scan logic use the MTD helpers before the MTD layer had a
chance to initialize the device, and that leads to issues when
accessing the uninitialized suspend lock. Let's temporarily set the
suspend/resume hooks to NULL to skip the lock acquire/release step.

Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
Tested-by: Sean Nyekjaer <sean@geanix.com>
---
 drivers/mtd/nand/raw/nand_bbt.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index b7ad030225f8..93d385703469 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -1397,8 +1397,28 @@ static int nand_create_badblock_pattern(struct nand_chip *this)
  */
 int nand_create_bbt(struct nand_chip *this)
 {
+	struct mtd_info *mtd = nand_to_mtd(this);
+	int (*suspend) (struct mtd_info *) = mtd->_suspend;
+	void (*resume) (struct mtd_info *) = mtd->_resume;
 	int ret;
 
+	/*
+	 * The BBT scan logic use the MTD helpers before the MTD layer had a
+	 * chance to initialize the device, and that leads to issues when
+	 * accessing the uninitialized suspend lock. Let's temporarily set the
+	 * suspend/resume hooks to NULL to skip the lock acquire/release step.
+	 *
+	 * FIXME: This is an ugly hack, so please don't copy this pattern to
+	 * other MTD implementations. The proper fix would be to implement a
+	 * generic BBT scan logic at the NAND level that's not using any of the
+	 * MTD helpers to access pages. We also might consider doing a two
+	 * step initialization at the MTD level (mtd_device_init() +
+	 * mtd_device_register()) so some of the fields are initialized
+	 * early.
+	 */
+	mtd->_suspend = NULL;
+	mtd->_resume = NULL;
+
 	/* Is a flash based bad block table requested? */
 	if (this->bbt_options & NAND_BBT_USE_FLASH) {
 		/* Use the default pattern descriptors */
@@ -1422,7 +1442,13 @@ int nand_create_bbt(struct nand_chip *this)
 			return ret;
 	}
 
-	return nand_scan_bbt(this, this->badblock_pattern);
+	ret = nand_scan_bbt(this, this->badblock_pattern);
+
+	/* Restore the suspend/resume hooks. */
+	mtd->_suspend = suspend;
+	mtd->_resume = resume;
+
+	return ret;
 }
 EXPORT_SYMBOL(nand_create_bbt);
 
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
