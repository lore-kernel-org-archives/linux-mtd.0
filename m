Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8327BCCFA03
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZW+bEyNl+zUtwdDe72UNG2ky8Sm2nGVL+9ijHxJcEY=; b=wADYpTaRAZblRK
	SFN9YIniw+4v5UACq06QMlm98g+bNpZY3g85roUhtYvgNiQfp2lT8JdaA3SZPPL0cVRAyUVu/MBrs
	H0I6Od7543jjR37G7k6kkLHRiTftIh7T2uH3UhQdgtYdZ5SHUu8SNvypbUJ/n4RqdVD8XTL+D6Yok
	9bmaPar0xK3d2ra8AOOT4smBF1VeMnoU1IlXK/25ufFBXUlr6TVcSanFqVZ6Oiem8fFgsGLnpq3Kv
	RWJb8tZihowQhfqbB2fz75zcGff+xJD18KCRgCwRbBnaPC/b0DOZveedzZZutJhmKHLHjuiDe/c+d
	mpvmY5r9/FFYWWZfPQig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEswM-00000006VUg-3j4e;
	Fri, 31 Oct 2025 17:29:30 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvO-00000006UJf-3v7x
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 485E51A17C4;
	Fri, 31 Oct 2025 17:28:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 206F360704;
	Fri, 31 Oct 2025 17:28:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6685E11818468;
	Fri, 31 Oct 2025 18:28:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931708; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mXik5j5I11be7gGeEVhCzfvaeTWInz7PcYTvkv28QF0=;
	b=hNMbrx24fu986J8m5f1/dnFgNLgPP2fiWJWkjZkyUgfgDAF7g1MBpAjsjzFp3+r43dZiQb
	FaUqXKKkGcO7EcFKlORnUtq/ezPZfNS+gPEiWATs1WLqyIRepEtBhAJWBlUpfN+IO19ZLP
	FjC3SeNvxJfaiT8TVReVsGcdFRlErz53p1uckIHnF47XO/utmjUihp4LhmH73wtJj82tuO
	Q1zzXLRixFIp/yOlUOA16mHQeoMqMVWZT8bmINveTGX9W/9Vbxx8uFy747VD5+fiBlO6gG
	9jV6+SOVxonAzMq5GjOgMxFv++cArYbstP9kLu0JqElIzD26/YTMmC4T+piNZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:26:58 +0100
Subject: [PATCH 14/28] mtd: spinand: winbond: Convert W35N specific
 operation to SPINAND_OP()
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-14-be42de23ebf1@bootlin.com>
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102831_623951_D538ACBC 
X-CRM114-Status: GOOD (  11.87  )
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

Winbond W35N* chips require a vendor specific operation to write their
VCR register (a configuration register, typically used for tuning the
number of dummy cycles and switching to a different bus
interface). Instead of defining this op only in the function that needs
it, hiding it from the core, make it a proper define like all other
spi-mem operations, and implement the necessary spinand_fill_*_op()
helper to make the SPINAND_OP() macro work. This way we can use it from
any function without any extra handling outside of this helper when we
will convert the core to support octal DDR busses.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index dde59f8f63f511a298a43a5b43fe07c1d726f179..3003ad7e83ee8f553ec82a0326422916c0ed794c 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -87,6 +87,18 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_1S_1S_4S_OP(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
+#define SPINAND_WINBOND_WRITE_VCR_1S_1S_1S(reg, buf)			\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x81, 1),				\
+		   SPI_MEM_OP_ADDR(3, reg, 1),				\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(1, buf, 1))
+
+static struct spi_mem_op
+spinand_fill_winbond_write_vcr_op(struct spinand_device *spinand, u8 reg, void *valptr)
+{
+	return (struct spi_mem_op)SPINAND_WINBOND_WRITE_VCR_1S_1S_1S(reg, valptr);
+}
+
 #define SPINAND_WINBOND_SELECT_TARGET_1S_0_1S(buf)			\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0xc2, 1),				\
 		   SPI_MEM_OP_NO_ADDR,					\
@@ -329,11 +341,8 @@ static int w25n0xjw_hs_cfg(struct spinand_device *spinand)
 
 static int w35n0xjw_write_vcr(struct spinand_device *spinand, u8 reg, u8 val)
 {
-	struct spi_mem_op op =
-		SPI_MEM_OP(SPI_MEM_OP_CMD(0x81, 1),
-			   SPI_MEM_OP_ADDR(3, reg, 1),
-			   SPI_MEM_OP_NO_DUMMY,
-			   SPI_MEM_OP_DATA_OUT(1, spinand->scratchbuf, 1));
+	struct spi_mem_op op = SPINAND_OP(spinand, winbond_write_vcr,
+					  reg, spinand->scratchbuf);
 	int ret;
 
 	*spinand->scratchbuf = val;

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
