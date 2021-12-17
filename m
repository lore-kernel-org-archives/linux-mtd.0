Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9774DC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 18:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RYFBlC0n73/Sf4upi/zsy4cfdsJPPp1sy3nT8+zH+O0=; b=lWA/ZLMSeF/HJR
	fP46dD0gdXnKCRtYdeP/oaArv0h7OTRafPKvv1HGnQdbSaCOJyE/NJRoXKQEHHxIz7DHQxTxyhODr
	n7cRD+O27ypBceG7ph640YUdf0ESXiD3VDuzfN/p8UoT/dm2sSDILT4UaiuRWH+Xc24NHIcmuoS3q
	97n4KZwbObZyC+BsHGR0qjcQ5Q5iLq9QKQ9gHi5T/2eHLc9efjFFi1pTEqJBHhwCRSu/XaOwAEe5V
	Bw9OuvBHU3lcFrgq1d4hYzte7Utknw4a89YY3R66SutvEMOjXXlctedhL3I+GpMhLCmsQjPgyT+yl
	IfZc/JQ3EWO0g2J99cFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myHto-00BoHd-Ui; Fri, 17 Dec 2021 18:24:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myH6t-00BUsu-05
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 17:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639762415; x=1671298415;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e8rDwt+rUS5WewjAz5C0vn2vjW4Owt1/HbKwTqWf3EM=;
 b=CWlTv5eYNKfmV9YaHLOED8DTOod43cCVwzVqdzc6lx07w8j01mmrjHxO
 zDCfj6mJNF5R7QenkxUxzimUCALm2o6uj2VxqDVEqp92F9EBIUtxx4lGx
 VIsvqgzdk/xKIvbhrMj1tPOwTTNmAWJTzSg0KPW+MsU/ggBuYVR2REUki
 l9k3MCSZmjCafyf6Dlc4BZT8cb0fYQXKUYOi5c/66KECnor8zM2FfNZI7
 PDAuNzg+OxXYDRgEytwlZysZ5otOG/glLSVmTfjn7FQUnAjmByZEy7nXs
 djaWw8ChYJoZ6JRIbL4Z6HzUdenbmdAaqbv7u1lB95EGG4IwaMzqXP94J A==;
IronPort-SDR: L8dISSoQfrXsBLfUSnlxEL36IbAXUpVPUAoCwbHJzTY42TjdzA9Ayk82KMAKbkKTXVgMOzkOxI
 Zdqz3MPyy79oP+2QsruzBWmbfSlsIBd21YQLyf6J780fN9oYX4F/eyaNsl+hxIqhvGZoyRFzh2
 27q8xMxWGThrp6toFFIS78sWQzNjqTpK+sjgHEPqr3UvzOvNWdoupyCydtDt1hYY28vcprtfKN
 kL39e/XaEK9lXEYkeXJFTQiWvOND9jAq+Eo9VAOmiOvtnCZFfB45WFGQyW94/I+5IU3pitYddf
 ShIg1tJ3xylwbLLmKcpKv6yU
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="147051392"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 10:33:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 10:33:33 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 17 Dec 2021 10:33:31 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v4 1/2] mtd: spi-nor: core: Introduce SPI_NOR_SOFT_RESET
 flash_info fixup_flag
Date: Fri, 17 Dec 2021 19:33:28 +0200
Message-ID: <20211217173329.553293-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_093335_095686_3937AF77 
X-CRM114-Status: GOOD (  10.62  )
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

The Soft Reset and Rescue Sequence Support is defined in BFPT_DWORD(16)
starting with JESD216A. The first version of SFDP, JESD216 (April 2011),
defines just the first 9 BFPT DWORDS, thus it does not contain information
about the Software Reset and Rescue Support. Since this support can not
be discovered by parsing the first SFDP version, introduce a flash_info
fixup_flag that will be used either by flashes that define
JESD216 (April 2011) or by flashes that do not define SFDP at all.
In case a flash defines BFPT_DWORD(16) but with wrong values, one should
instead use a post_bfpt() hook and set SNOR_F_SOFT_RESET.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
v4: no changes
v3: collect R-b
v2: no changes
 drivers/mtd/spi-nor/core.c | 3 +++
 drivers/mtd/spi-nor/core.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 2e21d5ac0e2d..32d80fdaa2a2 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2699,6 +2699,9 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
 
 	if (fixup_flags & SPI_NOR_IO_MODE_EN_VOLATILE)
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
+
+	if (fixup_flags & SPI_NOR_SOFT_RESET)
+		nor->flags |= SNOR_F_SOFT_RESET;
 }
 
 /**
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 2afb610853a9..70c6bb7f5f04 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -373,6 +373,8 @@ struct spi_nor_fixups {
  *                            memory size above 128Mib.
  *   SPI_NOR_IO_MODE_EN_VOLATILE: flash enables the best available I/O mode
  *                            via a volatile bit.
+ *   SPI_NOR_SOFT_RESET:      flash supports software reset enable, reset
+ *                            sequence.
  * @mfr_flags:      manufacturer private flags. Used in the manufacturer fixup
  *                  hooks to differentiate support between flashes of the same
  *                  manufacturer.
@@ -416,6 +418,7 @@ struct flash_info {
 	u8 fixup_flags;
 #define SPI_NOR_4B_OPCODES		BIT(0)
 #define SPI_NOR_IO_MODE_EN_VOLATILE	BIT(1)
+#define SPI_NOR_SOFT_RESET		BIT(2)
 
 	u8 mfr_flags;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
