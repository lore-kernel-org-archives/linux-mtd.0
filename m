Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8F8E8537A
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2026 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPgY8Jz23uQJrMwt9QWzDkYdYYRQIY/e4DMF36TZgpw=; b=oSQPiAvQoHkr7Q
	+kvRa8GoddcF3xlj5wpLpqA1Ktb19UPIwGOyguPJsDYvcpzjyARGfZKCk1nw+HxdbJ06G+jDwYMtj
	BO8YY5ydpsb6ciAbav/FGVe/Qz+sxEtmZPlhOWIgJgKxUQkVJk2OpoTkzPwxReeiuxqSU71t01/9n
	bVV9UBP5kn/cssZLYFneZ++jDMSv+oKI+2fz7dvxDzNciLFcDRNXzlIo3IhjqB6T1YjwSqM81B6AZ
	uwvKVzGsGKnvcsHpxWL36E5+msI0TS4Hfxwn6jUDc3XvzljdpG7P3MoxDTx+rZuNLwD7avDQ98yLW
	3HHvC6oO+8ZCmqYymlzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h65-00000002HG3-1LHr;
	Fri, 03 Apr 2026 16:10:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h60-00000002H8Q-3fjV
	for linux-mtd@bombadil.infradead.org;
	Fri, 03 Apr 2026 16:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8PfJAvOeYuhH5dbaDKJSTXCqDQ9KrVUp5a2zaIJVtqQ=; b=HHb03HFjhGPcnahUp+GwG/3M8a
	w84SDrNrerro58ON1Iq2b6fKFywmqlxqyuuUJVkwsr+gPfkZXxzayX4e6m5mIMR25Bsto/OmE/Bpb
	hTOYUsi5S+Ev2Pw94snmqVvk2fXwwIP1R1memZoVfIwmrHowqZGfA8duOgiaLiRFcHX8G3GWE6Kj+
	XAksU455X1EfaK65or39vdTPgY0M9wBuiH4NagRuLGPJ9W0x75HA74nOeZNRDJofC37GsK2YnSc6s
	ESKY1fKKwqmByzaVES5etp6nWvJ/DnqPXwIT1Ctt+V32SsulSXXQnSGsHDgixoOxsiHJSgkDrm1pA
	OFgSrqNg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5w-00000004ONT-3NYg
	for linux-mtd@lists.infradead.org;
	Fri, 03 Apr 2026 16:10:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C8EA9C59F65;
	Fri,  3 Apr 2026 16:10:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC75B603C1;
	Fri,  3 Apr 2026 16:10:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3796A104500FB;
	Fri,  3 Apr 2026 18:10:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775232602; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8PfJAvOeYuhH5dbaDKJSTXCqDQ9KrVUp5a2zaIJVtqQ=;
	b=fX0TW3G+QCtp4oSRisM4uUPTCgxO0PWqGemlRIr5nkFNOHaoSzkduz4HpALyNhrYLSq8/F
	kGdMa5s3r718SBxAkzFC/oda64BcExkVZ4ZZGV2f7IZLyesthcuL2kXtBQnW1R0UccIlf0
	slDX60Mz/1xNX6zErIDZnwBmC8Y01TPWCDH/JZ/uHHAaw5glgP918C7Rk6WHQHzjv/Oblj
	LJI4abbCNTT4UKd7Jyte5s8C2jbD8q8IeVkzjwLaDT5wP4aJMfRHDqF6MxzzB2DiIyuuPL
	RO8y4kgbaw4xBzGXVohvHl83fX3AdLQ0FUgHy7QRpmFOxyu/Y04Sh1/koj3bHQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 03 Apr 2026 18:09:29 +0200
Subject: [PATCH v4 11/27] mtd: spi-nor: swp: Rename a mask
MIME-Version: 1.0
Message-Id: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-11-833dab5e7288@bootlin.com>
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
X-CRM114-CacheID: sfid-20260403_171005_026155_565910FD 
X-CRM114-Status: GOOD (  11.04  )
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

"mask" is not very descriptive when we already manipulate two masks, and
soon will manipulate three. Rename it "bp_mask" to align with the
existing "tb_mask" and soon "cmp_mask".

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index af6e577d9b42..66f85826ba0d 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -57,9 +57,9 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
 					u64 *len)
 {
 	u64 min_prot_len;
-	u8 mask = spi_nor_get_sr_bp_mask(nor);
+	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
-	u8 bp, val = sr[0] & mask;
+	u8 bp, val = sr[0] & bp_mask;
 
 	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
 		val = (val & ~SR_BP3_BIT6) | SR_BP3;
@@ -160,7 +160,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	u64 min_prot_len;
 	int ret;
 	u8 status_old[1] = {}, status_new[1] = {};
-	u8 mask = spi_nor_get_sr_bp_mask(nor);
+	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 pow, val;
 	loff_t lock_len;
@@ -199,7 +199,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 		lock_len = ofs + len;
 
 	if (lock_len == nor->params->size) {
-		val = mask;
+		val = bp_mask;
 	} else {
 		min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
@@ -208,15 +208,15 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
 			val = (val & ~SR_BP3) | SR_BP3_BIT6;
 
-		if (val & ~mask)
+		if (val & ~bp_mask)
 			return -EINVAL;
 
 		/* Don't "lock" with no region! */
-		if (!(val & mask))
+		if (!(val & bp_mask))
 			return -EINVAL;
 	}
 
-	status_new[0] = (status_old[0] & ~mask & ~tb_mask) | val;
+	status_new[0] = (status_old[0] & ~bp_mask & ~tb_mask) | val;
 
 	/*
 	 * Disallow further writes if WP# pin is neither left floating nor
@@ -234,7 +234,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 		return 0;
 
 	/* Only modify protection if it will not unlock other areas */
-	if ((status_new[0] & mask) < (status_old[0] & mask))
+	if ((status_new[0] & bp_mask) < (status_old[0] & bp_mask))
 		return -EINVAL;
 
 	return spi_nor_write_sr_and_check(nor, status_new[0]);
@@ -250,7 +250,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	u64 min_prot_len;
 	int ret;
 	u8 status_old[1], status_new[1];
-	u8 mask = spi_nor_get_sr_bp_mask(nor);
+	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 pow, val;
 	loff_t lock_len;
@@ -306,11 +306,11 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 			val = (val & ~SR_BP3) | SR_BP3_BIT6;
 
 		/* Some power-of-two sizes may not be supported */
-		if (val & ~mask)
+		if (val & ~bp_mask)
 			return -EINVAL;
 	}
 
-	status_new[0] = (status_old[0] & ~mask & ~tb_mask) | val;
+	status_new[0] = (status_old[0] & ~bp_mask & ~tb_mask) | val;
 
 	/* Don't protect status register if we're fully unlocked */
 	if (lock_len == 0)
@@ -324,7 +324,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 		return 0;
 
 	/* Only modify protection if it will not lock other areas */
-	if ((status_new[0] & mask) > (status_old[0] & mask))
+	if ((status_new[0] & bp_mask) > (status_old[0] & bp_mask))
 		return -EINVAL;
 
 	return spi_nor_write_sr_and_check(nor, status_new[0]);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
