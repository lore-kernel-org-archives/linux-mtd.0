Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60317D26D7A
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/WWlrqD+Yexr1docwp1Zw6+noGeAu0WxFtMNRVT38zY=; b=o0e7bv0ctJXe3U
	oM6fE8Wm8hvw+K/C68VgDQ4XVqgEbzgZJ/xmofM362V4O/Fr0O+UFli8Opoo0ShZwYcHwGsRkeeys
	4ypoollifX8r7/EgUVWE0lW90zAXDfQjYw922rphzl44YhjpWiHWGQJKhsz7U81qftmEpuimKGwNn
	RHrMWPUritNtYjSJUsygMk0enmx2MrweTG3HC+kFnevEA/GBkQ7Zmqd5Vyrcl2c8sNt01fIXJUZ/G
	zGWgD/vWuB2qEhsSvRtCV6dbtH/vKpww1oAi9s2k3TySNtuuHEX3t4ZwrUKEZjI6eEdUqgkH0a1Uk
	PCHE2cRcrbrJFGsNNRyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG8N-00000002mIW-1A3l;
	Fri, 09 Jan 2026 17:18:47 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG8F-00000002m40-3Evm
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:18:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 501971A2753;
	Fri,  9 Jan 2026 17:18:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 25432606C6;
	Fri,  9 Jan 2026 17:18:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9609C103C89B8;
	Fri,  9 Jan 2026 18:18:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979117; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lnokEMFB4NwttnDPKwrpdjjcxdmg3b5O6SJBXL7NJ0s=;
	b=uiD8NIYzaeFDctQYhOWJnQb5qr6Y7NUQoL60Npic3ffuF6iUrJ3fJAWmWTJxoIYp72dheG
	gr+7OgafM9T50STuFGgMKNcnYcMG7NW5QX7OUhkTH+zdXBRgf+0hf/EdJ5Yu8KXweaeKkW
	fNqcq0oJYRQscOgAUbsijhM+p/CtDT213TxCkA1KMr+IStc+VTQb0a9Rq7cskzIBNqS0T2
	zyxh9F6v4CwxRH5qCJGY9ZlsebSk77ZW83+MdBWghv1YVo9LBtqrVq3usPa+IoJtHUl3ma
	qsX6f105OSUxJgjP9lsjnGzfuUhMtD6A5xOEizlVL/xYFT14aEzbeQwbfC0XRA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:14 +0100
Subject: [PATCH v2 16/27] mtd: spinand: winbond: Register W25N vendor
 specific operation
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-16-1fff6a2ddb80@bootlin.com>
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
X-CRM114-CacheID: sfid-20260109_091839_953329_BFABB259 
X-CRM114-Status: UNSURE (   8.98  )
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

Provide the Winbond W25N specific "select target" operation to let the
core verify it is supported by the controller before using it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 3003ad7e83ee..36053f35ee5e 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -105,6 +105,9 @@ spinand_fill_winbond_write_vcr_op(struct spinand_device *spinand, u8 reg, void *
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(1, buf, 1))
 
+static SPINAND_OP_VARIANTS(winbond_w25_ops,
+		SPINAND_WINBOND_SELECT_TARGET_1S_0_1S(NULL));
+
 static struct spi_mem_op
 spinand_fill_winbond_select_target_op(struct spinand_device *spinand, void *valptr)
 {
@@ -497,6 +500,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
+		     SPINAND_INFO_VENDOR_OPS(&winbond_w25_ops),
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL),
 		     SPINAND_SELECT_TARGET(w25m02gv_select_target)),
 	SPINAND_INFO("W25N02JW", /* high-speed 1.8V */

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
