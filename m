Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20234D26D7D
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+cyFdrpdvStUNtqOLXvv/rlU3sWB/h8g8YN510fR8bg=; b=5DtO9TJ1MMDWSo
	oPHin8hH4Z0wi4zGiw95x3ZdhJOLYX76wZ3H5VGlM2va+EYrXi6nt2Wgq6pwwaK/jRo17wVd21Zin
	2OyJoXfDqPNwKYKQKsfsNg6zzVvsqBuU7+BGl7+CFy3Te6J+cyWXc6LrKP+pbGDfHgGu8Czji2lpr
	F9aGPdTV4jto0xzyEQP/t0DYMoedLzzOVH43sEgljxQ/IB5ia1WD1z8DlUd49OS6eINLNBc8DjkQV
	bTrkDfM5rORCTnXhcHtuhe0+M/JoV08LSy063yTIuyfG5hRDagFYEBhg16leO0u73D4f5SrASuBWr
	W08ByMEP4ZXV8pGSEfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGEY-00000002o7d-223I;
	Fri, 09 Jan 2026 17:25:10 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGES-00000002o2G-02oj
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:25:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 400CD4E4202D;
	Fri,  9 Jan 2026 17:18:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 14B18606C6;
	Fri,  9 Jan 2026 17:18:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E6D3103C89AB;
	Fri,  9 Jan 2026 18:18:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979131; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G/7Ycy/ogVyXcqM2ko9UNgXCQm9s/CNPDNAu6YdiZO4=;
	b=TJVhB286dsU5B7RGpUhDq4AEeS/PK1NFAvtQ9Wz5RZOgu72Vv+LRGhbnota89w01ZSyEaZ
	qLV2iKK556/+pua0km2hQdchoS5gHuDaYwP8LDjKNVonlC3G9w9uEr8xYUA0kF/Jza6I3c
	6OQibYHC2/tNBocP5BTFDgQFStX3gDv5c7kJxNoOykFxK6vK+U+eqodaqSceD8wJ6HfCF2
	ndxlCIsTfErY8uG4vMHn0AtXdXTuZNNB/w8LSI4CVY/y6hGTeKYqTznDuF+jclbZJIF3EB
	CrwFzAhd6LToSCu8suRcKhk0t4VIXcMc74ugefFDTQi7XzK1cqZBp4ZA1XuuEQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:23 +0100
Subject: [PATCH v2 25/27] mtd: spinand: Warn if using SSDR-only vendor
 commands in a non SSDR mode
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-25-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_092504_239242_F04A8918 
X-CRM114-Status: UNSURE (   8.62  )
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

Both Macronix and Winbond have chip specific operations which are SSDR
only. Trying to use them in an ODTR setup will fail and doing this is a
pure software bug. Warn explicitly in this case.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/macronix.c | 2 ++
 drivers/mtd/nand/spi/winbond.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 6b7cbcc6e287..84be5e0402b5 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -53,6 +53,8 @@ static SPINAND_OP_VARIANTS(macronix_ops,
 static struct spi_mem_op
 spinand_fill_macronix_read_eccsr_op(struct spinand_device *spinand, void *valptr)
 {
+	WARN_ON_ONCE(spinand->bus_iface != SSDR);
+
 	return (struct spi_mem_op)SPINAND_MACRONIX_READ_ECCSR_1S_0_1S(valptr);
 }
 
diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 419f4303a0dc..90e4ece00cf5 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -114,6 +114,8 @@ static SPINAND_OP_VARIANTS(winbond_w25_ops,
 static struct spi_mem_op
 spinand_fill_winbond_select_target_op(struct spinand_device *spinand, void *valptr)
 {
+	WARN_ON_ONCE(spinand->bus_iface != SSDR);
+
 	return (struct spi_mem_op)SPINAND_WINBOND_SELECT_TARGET_1S_0_1S(valptr);
 }
 

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
