Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B362CD6E40
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 14:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VMq+eTWR+VHdLC4k9fzomXMiLCQF5j58wXwToEhWqzw=; b=VQAuRHKY3nKJOZ
	iw8H4S2+pQo7wJee1BOeB0BVKxbuYTzekhBa8RTJpcFBzT1M0RTU37JeiwTNZxm3CU34LuVNMF5gV
	jYVIXUKUN3evCgDOthSm688lbEevYBaYwcqZNPT6vOeHgWR5PwQ5WA+Y080RYc6z+2Isxih7j/JY0
	E+7aXpqGyxSJOD/ClmPt3NZEe3aut0LoTkmT+YXTOWVqw0NwGaHpKSoI/mhnmxf5QEcjZ2vDPibA4
	ABlwShBx6A4HLvGpjCKVaFGtfOEAXC8K21JCSHtNZlIx4NRb8P3dn+QlwvFlONs50BJeAtx6tMQMT
	AEFBUjW8PRVsS71w6v6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDn-00000002FtH-3x4Y;
	Tue, 26 May 2026 14:57:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDl-00000002FoI-2Ay9
	for linux-mtd@bombadil.infradead.org;
	Tue, 26 May 2026 14:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bA4B3jn6hd+ZrucCkVFV8gLVoYD1nz4YNDViCFJtHTo=; b=mNFwcjlbz03+8Dcfk/tKtcnohS
	j850ujCWMie9K75TIXlHZfJRmhnRSJlF49MqJF/qqtwb5VAhCu5Jx3aundsa8d10R6PZNETlBNwae
	FYSczJEUAyEekrDjHEnJbAmXog01gS3p1+8EtJ2KR9Hk7uyN/zh96WcHi7zQb/dnmKoY2gqOa7J0H
	oF5oLn7HlbfUU8u+ZgmOVOyvoGYBi9JRtEFfhjocUsGTDVAYJE1C5ZHDNksjmpjpvwVdtUzxn53AX
	OWI6p3ds6qrxuclIhxM0FBEnTIFBElmDdxWiym9eigHYngVatE0DXJpmfgUiLJbEU7WH6D8Rcoibb
	EkfaVH0g==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDg-0000000BarT-3fVM
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 14:57:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2C306C2AC40;
	Tue, 26 May 2026 14:57:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C275F6011D;
	Tue, 26 May 2026 14:57:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 210A2108888CB;
	Tue, 26 May 2026 16:57:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807435; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bA4B3jn6hd+ZrucCkVFV8gLVoYD1nz4YNDViCFJtHTo=;
	b=eUvhhu6j8rgxB4OE2S9LmK60QKd4E0JSbGFKof4o8adRVwAMOSq09gIDwN+TR7vP+tzH7p
	+pU/q+AuyNAZkxSqTs0hvcm3gSzRdkDaeaiXxG6BK6eF+ggwfsKuzx845fjTfoSWyWtITb
	I0Lu04XFZuu8/8u1Yt5IZWr5oAx9FJCwQyn1nCFQPax8VnzQIF7kJw/hJuO7iMbUZRGNbt
	4wrMbnY4JorjFsvTDOc2ME885h2tN0EHepyadXC6LIwnco9tcGL4WlQNQvHJ4t50oI1C0F
	PktUId5xsGWHZiX7cZNKj1qWYu1jdoEo6Vl7RdrifxEeE1XyJW/PJkAAqmryEA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:39 +0200
Subject: [PATCH v6 15/28] mtd: spi-nor: swp: Simplify checking the
 locked/unlocked range
MIME-Version: 1.0
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-15-4092f1419f8f@bootlin.com>
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
In-Reply-To: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_155725_550207_AABDE414 
X-CRM114-Status: GOOD (  12.40  )
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

In both the locking/unlocking steps, at the end we verify whether we do
not lock/unlock more than requested (in which case an error must be
returned).

While being possible to do that with very simple mask comparisons, it
does not scale when adding extra locking features such as the CMP
possibility. In order to make these checks slightly easier to read and
more future proof, use existing helpers to read the (future) status
register, extract the covered range, and compare it with very usual
algebric comparisons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 8a75cd59cb10..229074d4e121 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -200,7 +200,8 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	u64 min_prot_len;
 	int ret;
 	u8 status_old[1] = {}, status_new[1] = {};
-	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
+	loff_t ofs_old, ofs_new;
+	u64 len_old, len_new;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
@@ -248,10 +249,6 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (ret)
 		return ret;
 
-	/* Don't "lock" with no region! */
-	if (!(status_new[0] & bp_mask))
-		return -EINVAL;
-
 	/*
 	 * Disallow further writes if WP# pin is neither left floating nor
 	 * wrongly tied to GND (that includes internal pull-downs).
@@ -260,12 +257,20 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (!(nor->flags & SNOR_F_NO_WP))
 		status_new[0] |= SR_SRWD;
 
+	spi_nor_get_locked_range_sr(nor, status_old, &ofs_old, &len_old);
+	spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+
+	/* Don't "lock" with no region! */
+	if (!len_new)
+		return -EINVAL;
+
 	/* Don't bother if they're the same */
 	if (status_new[0] == status_old[0])
 		return 0;
 
 	/* Only modify protection if it will not unlock other areas */
-	if ((status_new[0] & bp_mask) < (status_old[0] & bp_mask))
+	if (len_old &&
+	    (ofs_old < ofs_new || (ofs_new + len_new) < (ofs_old + len_old)))
 		return -EINVAL;
 
 	return spi_nor_write_sr_and_check(nor, status_new[0]);
@@ -281,7 +286,8 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	u64 min_prot_len;
 	int ret;
 	u8 status_old[1], status_new[1];
-	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
+	loff_t ofs_old, ofs_new;
+	u64 len_old, len_new;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
@@ -346,7 +352,10 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 		return 0;
 
 	/* Only modify protection if it will not lock other areas */
-	if ((status_new[0] & bp_mask) > (status_old[0] & bp_mask))
+	spi_nor_get_locked_range_sr(nor, status_old, &ofs_old, &len_old);
+	spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+	if (len_old && len_new &&
+	    (ofs_new < ofs_old || (ofs_old + len_old) < (ofs_new + len_new)))
 		return -EINVAL;
 
 	return spi_nor_write_sr_and_check(nor, status_new[0]);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
