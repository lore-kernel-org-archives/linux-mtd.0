Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26F9E8537A
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2026 16:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=alQDtBK3JLXrqAQYpfaJrWv9oVL7jZQMyuH1WVNobUo=; b=Jf0DGxzMJIOjp1
	q4ZatPnsEOekwgtQzGtDOLhL0rTeH4ExTCHCx9jUO23e78xohvcLTN36fvwFWhR/TZTEWQbxDk7XX
	7k9igNGbgiobcAUMqvrJHUZ5KUIdHje6IgrBcBsc49XOahhfeWwopLcP8jRPgARtnwIyeo0tAdVmG
	yi2y4yIL9Yt6BrPbRwDtRRWBguvOYFqZEo7NGAGuYt7xv8JP/XalRCruMDECmxzxhwbQD3P/xRwV4
	yfJjT/OdIYhrBXLEsoMe4u1UhSDSvpW5Ako9c0IwhQg/U8Y32rsLgLYZIaYMYrsn1Xh7z4KItYkj3
	LX4w1Sj7S9ADmtTITqYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h6P-00000002HkC-3izU;
	Fri, 03 Apr 2026 16:10:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h6L-00000002HcD-0sv0
	for linux-mtd@bombadil.infradead.org;
	Fri, 03 Apr 2026 16:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=xR38gyrQC5XhhjYq85zVZxA7ePkj9xFcfqojI3JaBuI=; b=FHA02KzR2N+RJAiWJwNO1jsfJ0
	kU6M8HpCbp9APPx1SOnmevxoyiskhmjsAVgMslBXXHYTVJzmqAQckws9641rAqvcGzmLloKhZe+gI
	/2ah02sPfCYi+hoeNF3wFZBSELlqPDDAsLnwRjUFECxEZaAegfTfc9WRtxG46T76nJfZRlDSZlMqR
	ahReKwGy3FBk4QT3M1tz/wQhEs3+ffg9FdiHEJuG4FZKdEf/mkWiRrhmNqSLPt/gyD/S1Xwl590Bv
	C16K5zM9LEzO0Lhlh7M5OVL3Eap156u7vsfYcchGRY6kfu0tcONK2f3j5bFDOvGQ85S2ALUYkqmqd
	J3BtAljg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h6D-0000000Egcu-1Azl
	for linux-mtd@lists.infradead.org;
	Fri, 03 Apr 2026 16:10:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7BE204E428D6;
	Fri,  3 Apr 2026 16:10:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 531D2603C1;
	Fri,  3 Apr 2026 16:10:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF6DF10450103;
	Fri,  3 Apr 2026 18:10:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775232612; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xR38gyrQC5XhhjYq85zVZxA7ePkj9xFcfqojI3JaBuI=;
	b=eDOTYLgib43BSK2VON0gYT0KXJz2WSOkmHGSSDQ2r/2MGo3XMbch10FjMtO65399sOrHM7
	z6hPRz67qFQ85k+pkDOBtC1NCUugEtFbRdafrXG7y8IKefi7tsbO639VCKeecvfxQwJJ0Y
	k2ZkadLgedtepXWbg6YQO3gqvyWbfmZ/k2hVMjmNwcYzorQhxcVIvgQ5bSpxq4knllLkbF
	9nBQRO1KbIzuG5Jn3kXK1PAnaAVxSf4lDKmr1kUoacBQYFLHtIjsa9fMZwop7PYyNG1PMq
	GI4f88DJfELXfxthQOOtfH18boC62941FnPXsRwcEp2Y7//ZAR4oJ26vblMSug==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 03 Apr 2026 18:09:33 +0200
Subject: [PATCH v4 15/27] mtd: spi-nor: swp: Cosmetic changes
MIME-Version: 1.0
Message-Id: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-15-833dab5e7288@bootlin.com>
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
In-Reply-To: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_171021_405030_652AD6AB 
X-CRM114-Status: GOOD (  10.87  )
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

As a final preparation step for the introduction of CMP support, make
a few more cosmetic changes to simplify the reading of the diff when
adding the CMP feature. In particular, define "min_prot_len" earlier as
it will be reused and move the definition of the "ret" variable at the
end of the stack just because it looks better.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index c45a9ddd5788..c3dbc8832025 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -195,14 +195,14 @@ static int spi_nor_build_sr(struct spi_nor *nor, const u8 *old_sr, u8 *new_sr,
  */
 static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
-	u64 min_prot_len;
-	int ret;
+	u64 min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 	u8 status_old[1] = {}, status_new[1] = {};
 	loff_t ofs_old, ofs_new;
 	u64 len_old, len_new;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
+	int ret;
 	u8 pow;
 
 	ret = spi_nor_read_sr(nor, nor->bouncebuf);
@@ -236,12 +236,10 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	else
 		lock_len = ofs + len;
 
-	if (lock_len == nor->params->size) {
+	if (lock_len == nor->params->size)
 		pow = (nor->flags & SNOR_F_HAS_4BIT_BP) ? GENMASK(3, 0) : GENMASK(2, 0);
-	} else {
-		min_prot_len = spi_nor_get_min_prot_length_sr(nor);
+	else
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
-	}
 
 	ret = spi_nor_build_sr(nor, status_old, status_new, pow, use_top);
 	if (ret)
@@ -281,7 +279,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
  */
 static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
-	u64 min_prot_len;
+	u64 min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 	int ret;
 	u8 status_old[1], status_new[1];
 	loff_t ofs_old, ofs_new;
@@ -329,14 +327,11 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	else
 		lock_len = ofs;
 
-	if (lock_len == 0) {
+	if (lock_len == 0)
 		pow = 0; /* fully unlocked */
-	} else {
-		min_prot_len = spi_nor_get_min_prot_length_sr(nor);
+	else
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
 
-	}
-
 	ret = spi_nor_build_sr(nor, status_old, status_new, pow, use_top);
 	if (ret)
 		return ret;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
