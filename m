Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26124CD37AA
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2026 16:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eP7osXsYpIb/ggkIJvAPmNDHFM/pw64DBK9822qriWs=; b=cGoIw8OEq6r+Ft
	J04byxjJ4j03Xd4x66IjlnrwZYorLh5lV+1n/EoLsmcF3qK5IxLxYUtemnIrym7ivhDbuEWD3Kj1N
	wbMz9CJo7qfyLXnoH3Sg9sVCBsSp8cqqNUc4eT6lT+AvmaM720xkWYvWAN5btgNmRSCGwY6Hh0vo2
	tXNWZfOUXXPnb+wTpTzk2/riKHTs0j+RQddaR4CslM56NwPZyY6GA7Q7Ry4A3z6A7214911xjBCaq
	l+JDztlLRicIDK00E0NZhQ/KFQXpyUHqHa6LKngImq1fLko+m58KTZqyEspOpojE6DU/C6AvEqxgF
	5mxnMKsDJuN8v/mjlGqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1sX-00000004N06-0NxM;
	Thu, 07 May 2026 16:47:13 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1sT-00000004Mxq-2s5S
	for linux-mtd@lists.infradead.org;
	Thu, 07 May 2026 16:47:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 485494E42C33;
	Thu,  7 May 2026 16:47:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1C970605CF;
	Thu,  7 May 2026 16:47:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 28A5D108194E2;
	Thu,  7 May 2026 18:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172427; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=380DMxOtkVf4S8j1lpaF5rnIUMKJfHDNDSHsb4bomqI=;
	b=jZOMbxa1u8EpHor/OaMpOtoS4ck+q56bAJc6QdT3wvqxVBB5E3wxslMFb4HA4BhRsOp+ct
	7Qzva9KLTTFGVCvP0NusFmBfxPBhuXkY901MJ7LJgnDvf0K2OxhI/oON14kvDfkhy1JDss
	P7FuFh9FlNxlcYw2dpQZV4ocB7MIwZL727OjBRVi++vKnAhX9Kr0LMRMJ4bCiAsOGlPFuP
	Icq3ru76HZQb9SsPW0BW5gGFXyPKwnZkJalKtopQhOs3/dAA5MbJ+evq8Cbr6zaGFPH9ql
	edGg3h4MKbEITN1wFmP0FyLoD+QWE5S2XbITlKMe46QgN2nJ5ywwbvEacENLAg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:46:48 +0200
Subject: [PATCH v5 07/28] mtd: spi-nor: debugfs: Enhance output
MIME-Version: 1.0
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-7-93453e1a9597@bootlin.com>
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
X-CRM114-CacheID: sfid-20260507_094709_864923_628AC820 
X-CRM114-Status: GOOD (  10.30  )
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

Align the number of dashes to the bigger column width (the title in this
case) to make the output more pleasant and aligned with what is done
in the "params" file output.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 69830ad43990..d0191eb9f879 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -144,7 +144,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 
 	seq_puts(s, "\nsector map\n");
 	seq_puts(s, " region (in hex)   | erase mask | overlaid\n");
-	seq_puts(s, " ------------------+------------+----------\n");
+	seq_puts(s, " ------------------+------------+---------\n");
 	for (i = 0; i < erase_map->n_regions; i++) {
 		u64 start = region[i].offset;
 		u64 end = start + region[i].size - 1;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
