Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9834CD3442
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2026 16:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWwLh8XizfWSN9f+7OKkfLl1QDAYb/+skMo0F9QFrMs=; b=JKJYZPDdDjqo8q
	ufjcw4/NKfyYMgQco7s3++ITuM9yE1uucLRHZDDVVXrOjHKUWLqGB0D3PBr33nqylxqw1/0HULYn7
	MX+pIoRCKr5NYUuFZ7fy6/N9DUdDWiI5QPBJQT4ioMnEjj8CKPsCHdtwjSQo6cfoQh0GjvupjRKqh
	A+LK29qL+qz36faMmPOtKOj5mvkPHNHZlwbIUeKnK76aq0UexMdNnSYwwvLUl1SfLI0AhuvJlXw4/
	7cHt5FH6SCX39ofU3jb5Mh8NaXR28KNCzUCFIYP8EA/AWejscKUjdifSrI8165S4UOtui7p4wDyud
	yPgJ01IPjlCpTye6SM3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1sj-00000004NIs-1qYC;
	Thu, 07 May 2026 16:47:25 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1sg-00000004NCl-3nta
	for linux-mtd@lists.infradead.org;
	Thu, 07 May 2026 16:47:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 21B48C5DC60;
	Thu,  7 May 2026 16:48:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 580C2605CF;
	Thu,  7 May 2026 16:47:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 282C6108194E4;
	Thu,  7 May 2026 18:47:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172440; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+w5oU3Gj7K2BYmqNI/4B+f1lhjNH9tKHYf4hS6Tqu1k=;
	b=SvwCLcRlUH1nlj9wQodxPJxJUNp+urJTHFfLxGnaZPrbD7Z5+YlD5xfKQPmR8ZBBMSCXpy
	xaci73OYYFThwgZ8KKZeaff3GnxFi6e3LNCJgs+EakNmXu51LnPlf57xtFX8NCdy//BYQG
	F97AD9IXUyEno2u6+b1HVCDuSDo4zrXAu6jPgp4MLuD1J23arho2tLpXhruzdqVv/iu+yg
	Ap7ZpAp90fNFbW0y5jmou+6haz9yrt/Yyq7DxIDMHnSny97Nk8teSO2EpwuqLNB7bAG7wL
	pFPh7xfaxalpFE0I3G53J7WK/EzAOO3/N7TM5TOLTyaCcTngwIurF7ed+EX1mA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:46:56 +0200
Subject: [PATCH v5 15/28] mtd: spi-nor: swp: Simplify checking the
 locked/unlocked range
MIME-Version: 1.0
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-15-93453e1a9597@bootlin.com>
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
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
X-CRM114-CacheID: sfid-20260507_094723_243880_91D884D9 
X-CRM114-Status: GOOD (  11.67  )
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
index 8aa0fe297188..a45627380363 100644
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
@@ -264,8 +261,16 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (status_new[0] == status_old[0])
 		return 0;
 
+	spi_nor_get_locked_range_sr(nor, status_old, &ofs_old, &len_old);
+	spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+
+	/* Don't "lock" with no region! */
+	if (!len_new)
+		return -EINVAL;
+
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
