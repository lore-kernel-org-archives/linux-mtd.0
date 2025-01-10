Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37F3E7719C
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2025 15:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+0/dVGcWt4gZrSDj4VuBz3IOWRuyPrqauspYXQvszFM=; b=hSNBKXW4qlaw9t
	lvZhzR0XrF4Qrj45dTeBxWnP6LysrGgZLmoSrFBfN+viRBLJPGLppMdYIMSeJ3Snt7OEec3x0nL4C
	1cjMrxcgiD5A+nMd5eA8Gz/7BvgKpu54iw0RfHsPNiCZNBV/AGGAbFW+l/8RJfF0yAIpfX5jLnz24
	umIixjjCn5/OPTwfSU8Te9PAyfOvIqHC1jjBlYElmoyzb5qKlZJA5vAbp8v2yJpKkuBxqWxJecqfX
	+Nqqw3VqXTXzBA5lxJ74gQlxLhT9GrCt3aD4CaDVhaxO81o8FLb1hMPnyJzxetKsbMY4w8ZSeMtBO
	TXPcj0PD8h2wNceSfqFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGdF-0000000FoUO-3QCw;
	Fri, 10 Jan 2025 15:09:05 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGGn-0000000FgKB-3obR;
	Fri, 10 Jan 2025 14:45:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52486FF809;
	Fri, 10 Jan 2025 14:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736520352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EpRU8Ni8GjnsQQyxRFEa2zYtIybiX1a/U99sUmUB8ik=;
	b=ps2xwVTlM2PTpfSbUiaA7GQikbBH2xvfr/ZvvllsjJplPe0WaeZjLR3zfkV5ZPJo9Fsvfw
	Hvr/eNi/+vf5xgAEq3I6OWryO5KLCo2GlusGdMXRZQN3ls18h+0riFckUUqD9oNbjI/gR5
	0m3WtbaalZjIWYBQtsudpoGqxwxL12PtG0RvDneXjNijWN6EDWlsydN6yevpu2gg7yKNUr
	a/p/z1DcxBrwliH5lFJMR7tggXrkA4gBMPupZ1/c4m30EBZPNtO3XRfczF2zZwitdePeJE
	Y4T+AovB8ht2v/imVIx+K6HoyMofI2fs3bA6uDikBjR/LNw8J9gnI5lezSkcNw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Jan 2025 15:45:20 +0100
Subject: [PATCH v3 18/27] spi: spi-mem: Reorder spi-mem macro assignments
MIME-Version: 1.0
Message-Id: <20250110-winbond-6-11-rc1-quad-support-v3-18-7ab4bd56cf6e@bootlin.com>
References: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com>
In-Reply-To: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, 
 Serge Semin <fancer.lancer@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Raju Rangoju <Raju.Rangoju@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mtd@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_064554_207843_C0E0498B 
X-CRM114-Status: GOOD (  10.08  )
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

Follow the order in which all the `struct spi_mem_op` members are
defined.

This is purely aesthetics, there is no functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/spi/spi-mem.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index c7a7719c264846ad9fce613ba96d9284ad7893e7..ca6ea01c40f85095ac2730cb424cfb21d7daa700 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -15,16 +15,16 @@
 
 #define SPI_MEM_OP_CMD(__opcode, __buswidth)			\
 	{							\
+		.nbytes = 1,					\
 		.buswidth = __buswidth,				\
 		.opcode = __opcode,				\
-		.nbytes = 1,					\
 	}
 
 #define SPI_MEM_OP_ADDR(__nbytes, __val, __buswidth)		\
 	{							\
 		.nbytes = __nbytes,				\
-		.val = __val,					\
 		.buswidth = __buswidth,				\
+		.val = __val,					\
 	}
 
 #define SPI_MEM_OP_NO_ADDR	{ }
@@ -39,18 +39,18 @@
 
 #define SPI_MEM_OP_DATA_IN(__nbytes, __buf, __buswidth)		\
 	{							\
+		.buswidth = __buswidth,				\
 		.dir = SPI_MEM_DATA_IN,				\
 		.nbytes = __nbytes,				\
 		.buf.in = __buf,				\
-		.buswidth = __buswidth,				\
 	}
 
 #define SPI_MEM_OP_DATA_OUT(__nbytes, __buf, __buswidth)	\
 	{							\
+		.buswidth = __buswidth,				\
 		.dir = SPI_MEM_DATA_OUT,			\
 		.nbytes = __nbytes,				\
 		.buf.out = __buf,				\
-		.buswidth = __buswidth,				\
 	}
 
 #define SPI_MEM_OP_NO_DATA	{ }

-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
