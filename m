Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F6ACE8D69
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zss3yntsRDeXK2+vNz3g2soYTDwa5G8N7rJd3aKiNmM=; b=35Eh3BZ1tAyFvM
	ENfLyKsTmZBTYYm/5nMZd4JRgJbrQ4L+yAqDhcPhmkv83AcR8tOoaLIg4SK6knV0BuRt3sQUSDoZz
	+BFFvBrg9cw1ILUMmkuz8ff4jXaBgEd3R6onsTR5AWPCTO1nTg6+9e8rs+o4FbsEKCQKSyYWXQ30i
	3pQN8KYTgR9yGAvlKDDQ1Zx3xOkHQ32DA/rsxwjp/AgSjK/WWWsu5GAWfKvmLgVVsZC3V0KkjgWzD
	MQlh2A62JHia6B++sX6z1q50MS0KwiCLxv+gnziATWuX9Cu+Z4L64XrVLHps16SoQ16Y2ysZxuTmm
	ROVQK125RV9Yrj28qU4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzU-0000000CtD4-1FLC;
	Fri, 14 Nov 2025 17:53:44 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzS-0000000Ct7X-036P
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 17:53:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9BE8F1A1AAD;
	Fri, 14 Nov 2025 17:53:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 726096060E;
	Fri, 14 Nov 2025 17:53:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B942103719A9;
	Fri, 14 Nov 2025 18:53:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142819; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bXNGKKPe2xfLrB79EbbpZKWghN08fwXDQNrdCNHKVkA=;
	b=HPhbh1vVY16GcXBe+azcFeketYp/9jtzteLU7B5sKVd/9V2kjQwgoe4MHSk6g0xNnfi2eV
	hNz1qKCcI9w4O1O0yJOAkZYJ1Br/qRhUi6hIvSimiheWo1mRDOCrl78hcA/fyVwHzKTYW/
	AFnCZR62llvcMhReOd+lmzw5SLbaCgrKE0vnXCkHc3j0Ftd5mX816ZdnKxsYAIxFJEiVnt
	R9xyocHWfOfvy6tzPvz8lAazCPwTypcissk2xB4Qru5Hm/j/31ZhWTs/Nj0755Sh/jXaeK
	9AuYK6PU8iKX/YNOa6Vk7WecO+/8PBx+oo1EgpikDauC4Em4Ax/CoClsYamfKg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 14 Nov 2025 18:53:12 +0100
Subject: [PATCH 11/19] mtd: spi-nor: swp: Create a TB intermediate variable
MIME-Version: 1.0
Message-Id: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-11-487bc7129931@bootlin.com>
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_095342_207922_A8027680 
X-CRM114-Status: UNSURE (   9.49  )
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

Ease the future reuse of the tb (Top/Bottom) boolean by creating an
intermediate variable.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 971aac0581db2830a4bbee5603661ec1e6612e6f..61d899b4fbf42b8bd9d86dc4e6b3ffcfe91a90e8 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -60,6 +60,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 bp, val = sr[0] & bp_mask;
+	bool tb = (nor->flags & SNOR_F_HAS_SR_TB) ? sr[0] & tb_mask : 0;
 
 	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
 		val = (val & ~SR_BP3_BIT6) | SR_BP3;
@@ -79,7 +80,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_
 	if (*len > nor->params->size)
 		*len = nor->params->size;
 
-	if (nor->flags & SNOR_F_HAS_SR_TB && sr[0] & tb_mask)
+	if (tb)
 		*ofs = 0;
 	else
 		*ofs = nor->params->size - *len;

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
