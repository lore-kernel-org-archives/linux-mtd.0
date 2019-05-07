Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0BFC004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 16:00:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA24C205ED
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 16:00:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kx6dloI4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MIaRFN3f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA24C205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R+crKORO/u57w7RNtCAI0LKxsqYO0A6SaQOUGRnpDRk=; b=kx6dloI4ijONrT
	EHxFLR78vk7HPoXNhxck3lOqoimod//jgbD1dWVIlLJ5GmbgjjPsoMpI0T2Mr/xYHAGxsjGOu6zWX
	aSiOzQ6U4ozCmeOubyRsnC8irlt4X+d9sQtanoaUv+vrSCvUpXdhwWfsm1BTsM3r6iCdN4WZ8DgdQ
	ZiNH1sBwRZ8+ftKBg4/IFbtlO5FhvZhKBzVDD9lqysMz59TWUGwJY+oVfqm7NGx3avuTBX90/wNEx
	TDCgRoPXJnK5t92A9wgcoY82yOCbXSvi81alMlvGx2N1TiVLIx12XZG10HUUaYlgst+gYrt6TllDJ
	jJB6lUiLtflEILOyPKjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hO2Va-0008Ov-SB; Tue, 07 May 2019 15:59:58 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO2VS-0008A7-Q3
 for linux-mtd@lists.infradead.org; Tue, 07 May 2019 15:59:56 +0000
Received: by mail-pl1-x643.google.com with SMTP id bi2so8392535plb.13
 for <linux-mtd@lists.infradead.org>; Tue, 07 May 2019 08:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:from:to:cc:subject:date:message-id;
 bh=Jk4l4aIhsSS1QaMGb/xfaCHwS6DqaTwgoIuoYji1K5w=;
 b=MIaRFN3fv3+GWWwZnBAErq1T33G8rzvbl422n5Qc2yFfjz++rNY//jxFv5G8+cbVGQ
 qyeY4WCPn7hxzv86c9HWZEWHxzzxQoHAFjjxfZE+1aEcjFLFH4mN/wDg4dw9MM3CQItK
 vZzfjNK5gcbQ8n+9E5LUpqiywcxxVNOOSihLlQd1KqJQt6Iaem9CcHh3nbMXqsIfxXkI
 t5IxN7pdYihTH8VdxjCB4Ckeyma451Dmjhvdq7V86U/X4I4ZXAIiYG0O5Vc3G0dJPFy7
 eTEgNQSBRY4U0BofW4a6Me1G3BmxKOEr5do0Qog9ddXygfCoU8OIYYuQqz+wCjKEBzw0
 QO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Jk4l4aIhsSS1QaMGb/xfaCHwS6DqaTwgoIuoYji1K5w=;
 b=cPsKkI4eDLB0OmUM08rhUVyIoehUmvGpFhbQkHGj0u36L8Huqq/g/eD0Np8rN2ekg/
 EW2BdF5TGAmgc5DeG7qWrpcqbhpMjj8L3P/7oki6OrCIqmZxLKwhQW2CGUbB+IxoPA/d
 TrbdubD7X5JiZ7HCXGqbTDNNJGoekf4FpW/blsPllEr+NYk6TpFSvGfUJTtFszB9rOaU
 xrFte5hQB7N5atlq/o8OfZGoi3xwkzIz5Bi8V3F0gvP+xq0yUSbMm3MRVrIN3glMtJss
 PK+ndO8qTl2Jy58J8gNdPCeNmiidiL06QyxA0O9GQlWmdvS+7wiB/KgcngGaXYRQGGjQ
 RCBA==
MIME-Version: 1.0
X-Gm-Message-State: APjAAAUU6rT4kprtVxf1p4R/1cN8LwudRPdPnLll7FGYzF8QLnnhw3Sx
 7Bac2Sc2wDhVGcW/IVXfs4TS01Mi0VuHwJ0lQn3icaqhXgDnNFPkzLgwRiz4xKKq4CUyZT+7Si3
 cJt7STty4lj+3Y6+xjA4=
X-Google-Smtp-Source: APXvYqzjuXzlJfYmm6OQjWmSFkfZp7p5+/RBKtyuW9GmAw6VaX33RD5pvt2FRSYs/l0C4jzCq+840g==
X-Received: by 2002:a17:902:9a03:: with SMTP id
 v3mr42085296plp.27.1557244789768; 
 Tue, 07 May 2019 08:59:49 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 h187sm22543540pfc.52.2019.05.07.08.59.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 07 May 2019 08:59:49 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, bbrezillon@kernel.org, richard@nod.at,
 palmer@sifive.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v3 v3 1/3] mtd: spi-nor: add support for is25wp256
Date: Tue,  7 May 2019 21:29:33 +0530
Message-Id: <1557244775-14206-1-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_085951_200301_DC382F17 
X-CRM114-Status: GOOD (  13.16  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Update spi_nor_id table for is25wp256 (32MB)device from ISSI,
present on HiFive Unleashed dev board (Rev: A00).

Set method to enable quad mode for ISSI device in flash parameters
table.

Based on code originally written by Wesley Terpstra <wesley@sifive.com>
and/or Palmer Dabbelt <palmer@sifive.com>
https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 10 +++++++++-
 include/linux/mtd/spi-nor.h   |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index fae1474..c5408ed 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1834,6 +1834,10 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 1024,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES)
+	},
 
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
@@ -3650,6 +3654,10 @@ static int spi_nor_init_params(struct spi_nor *nor,
 		case SNOR_MFR_MACRONIX:
 			params->quad_enable = macronix_quad_enable;
 			break;
+		case SNOR_MFR_ISSI:
+			params->quad_enable = macronix_quad_enable;
+			break;
+
 
 		case SNOR_MFR_ST:
 		case SNOR_MFR_MICRON:
@@ -4127,7 +4135,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	if (nor->addr_width) {
+	if (nor->addr_width && JEDEC_MFR(info) != SNOR_MFR_ISSI) {
 		/* already configured from SFDP */
 	} else if (info->addr_width) {
 		nor->addr_width = info->addr_width;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index b3d360b..ff13297 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -19,6 +19,7 @@
 #define SNOR_MFR_ATMEL		CFI_MFR_ATMEL
 #define SNOR_MFR_GIGADEVICE	0xc8
 #define SNOR_MFR_INTEL		CFI_MFR_INTEL
+#define SNOR_MFR_ISSI		0x9d		/* ISSI */
 #define SNOR_MFR_ST		CFI_MFR_ST	/* ST Micro */
 #define SNOR_MFR_MICRON		CFI_MFR_MICRON	/* Micron */
 #define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
-- 
1.9.1


-- 
The information transmitted is intended only for the person or entity to 
which it is addressed and may contain confidential and/or privileged 
material. If you are not the intended recipient of this message please do 
not read, copy, use or disclose this communication and notify the sender 
immediately. It should be noted that any review, retransmission, 
dissemination or other use of, or taking action or reliance upon, this 
information by persons or entities other than the intended recipient is 
prohibited.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
