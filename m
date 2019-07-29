Return-Path: <SRS0=s9Jc=V2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545B3C7618B
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 14:28:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27338206DD
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 14:28:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZB6SyIQ/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eiYYdNui"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27338206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BbOfPEfWRYcX5Z8t36bojPSlVKcwiiponAqj8vUQIbg=; b=ZB6SyIQ/s0MwblLP3UyU/y8zw7
	3m4bGENbqfKlllyOOEcmJ4yqOvEAs+z89/bOFLDO/d1oh4llleGWm/OE8ZNK1eqZT88ZvI6mwqjlw
	qDdV9ZK7F1duMKM54H1rMHhkovYfOiEBZ/RJu6E1gmUbZ+rYg3wrGa6ZFdFDUGD4ewgyXNYFZ/njq
	i+oGr7U24LytXBgCBrLPdnvvazwFfPwYbkZyryIO8fSdXZ1nKUzNq6jEjvb32tOarekWGCV1KGI2y
	L/bbOXB9VJfoFTOSAIDHB62uaEDX84/RLYjwWrY6lnWKNROaePm1qiS9BoDMbcJZG4Ga1nEusX7iX
	lIbLpRVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs6dG-0005mO-OT; Mon, 29 Jul 2019 14:28:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs6dF-0005mI-Gu
 for linux-mtd@bombadil.infradead.org; Mon, 29 Jul 2019 14:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W0uPCNr/DsWKO1afSsH5zinjuVhA/kCF5UlBNJimAdw=; b=eiYYdNuifnwb+43+UuoyUHYar
 ataEc6lESv9R97Pj3Qz3Qi3IWD4cBi9JHPAoURhtytddyOoaUuzYjbGp78TCaDI6a5jCnnBTQLHhX
 /NfZasPdul31S8UztO2FbCJvJ7zwL4fcesTXFHwrO0r2TwDk0Kvj9szOxg1D1DoxTwBFQt43RKRmE
 c/2MLX9y8FcFl6qbm9yAQ+Wi1BgXU0v/oqDG0uGlLmRr7O73ZzNHY8G1ccD7B2nB3AX4bAn6jaMdJ
 DEReoj0/B+kyYsNEdptUjEwDLUitVdK5BOzw4aLbsYVZ5QpfSC1RDVTg2Pl8vqdxrRkYtmhGpeSX9
 ZgAG++9qA==;
Received: from 212.199.177.27.static.012.net.il ([212.199.177.27]
 helo=herzl.nuvoton.co.il)
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs6dO-0002P0-9A
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2019 14:28:20 +0000
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x6TEP7Fj025574;
 Mon, 29 Jul 2019 17:25:07 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 29394622F0; Mon, 29 Jul 2019 17:25:07 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: broonie@kernel.org, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, bbrezillon@kernel.org, yogeshnarayan.gaur@nxp.com,
 tudor.ambarus@microchip.com, gregkh@linuxfoundation.org,
 frieder.schrempf@exceet.de, tglx@linutronix.de
Subject: [RFC v1 3/3] mtd: m25p80: add get Flash size callback support
Date: Mon, 29 Jul 2019 17:25:04 +0300
Message-Id: <20190729142504.188336-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190729142504.188336-1-tmaimon77@gmail.com>
References: <20190729142504.188336-1-tmaimon77@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_152818_480357_8C65EA3C 
X-CRM114-Status: GOOD (  13.32  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>, linux-spi@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add get Flash size function support for
passing Flash size through callback use
to the spi layer.

Add get Flash size function support

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index c50888670250..fd14c8c6d8d8 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -151,6 +151,15 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	return len;
 }
 
+/* Sending Flash size thourgh callback function to spi layer */
+size_t	m25p80_get_flash_size(void *param)
+{
+	struct spi_mem *spimem = param;
+	struct m25p *flash = spi_mem_get_drvdata(spimem);
+
+	return (u32)(flash->spi_nor.mtd.size >> 10) * 1024;
+}
+
 /*
  * board specific setup should have ensured the SPI clock used here
  * matches what the READ command supports, at least until this driver
@@ -188,6 +197,9 @@ static int m25p_probe(struct spi_mem *spimem)
 	spi_nor_set_flash_node(nor, spi->dev.of_node);
 	nor->priv = flash;
 
+	spimem->callback = m25p80_get_flash_size;
+	spimem->callback_param = spimem;
+
 	spi_mem_set_drvdata(spimem, flash);
 	flash->spimem = spimem;
 
-- 
2.18.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
