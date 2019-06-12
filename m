Return-Path: <SRS0=tiqS=UL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96233C31E47
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jun 2019 10:49:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70A992082C
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jun 2019 10:49:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SgFPLx44";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SC/wtDlW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70A992082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8GavlCqV8LYLPyz+M7lx5NMkcwiQwx9UFdZwV1eQAM8=; b=SgFPLx44PmxY6GQnW3zhZX4xTR
	SJ+MG7k46PDMry4GSogRZUxyPNMFGj8TGNPs4GYSf8zEvLJpTXFMXbrBQXCrq5dALCcdK0C7sX0+F
	ZxvM+5bg2AL21MSaqdK7ngK6XIq+g5X3F6UzdoKOlGOhqG3fRmrBOTDpLeREWnOpL8WPRcdZ6vYG7
	zjfaQDJ2QvBn88Ui7ajAfRwp1fNSaNQjWsQbZzUpKkrhmgPKXtqQIMeUEYj+y/57PJw3zu/iGFcTN
	Xh6SLN2SUe+eQ3SEV5yXmpuBvt69seWdQ/jYa7BTChp0w+FVEVQqQtjtZOFlCXZRBohK3Dp1bvsJM
	ySOL0R+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hb0oy-0001EZ-5c; Wed, 12 Jun 2019 10:49:36 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb0oc-0000p8-1d
 for linux-mtd@lists.infradead.org; Wed, 12 Jun 2019 10:49:15 +0000
Received: by mail-pg1-x544.google.com with SMTP id l19so6124792pgh.9
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jun 2019 03:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/34VUba2TMn1HUJYz+e67ilwN8q7isgKAmoXZ4qRiqs=;
 b=SC/wtDlWHVohDk7cxk5knZoolyQZl4Clqn455YPX3TFOuVKH5GRuCtgk3p6HL+y8jn
 b+keSwdI+s29Sse4jokvis6wMRIfvVT0nh7ABPa6t1aMvDSdLkexGNnD+j9irzPHXud5
 mXH820BF/AhKZIJ8f8JFX1tOayUZBgudZUu6F9jLp6An15h3NMu2RgXBMjjgrj0dzVE+
 jI0yzEL+/aQu0+z0MXvYsxxXEs0Kr3/VIp5zaMWvsgVIK046vdZVePonBYmVst2ug4iH
 JDJCWMFbeaAou4tAl8U+yJ0W9eO5ruf4/AJYDr+Mo6IdiPCHaIm2kjWrXud2/P76YHmh
 KGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/34VUba2TMn1HUJYz+e67ilwN8q7isgKAmoXZ4qRiqs=;
 b=sPRwNsp8NdIUiXuqqSvlf/fWhd7nS2oODBXOv9eBM9dDBcwq6LrHSS66O+O6bwXpgm
 dy+RudNFKXAkRgBLnGSoYkObvpoeWjoRzGnlyYdwsuU3cafu3jQlF3Q0pIJvLdBxDrTK
 PaugEWBQ2rUwz2LLngSynrXoCWVEthWWi0gVbvi4zEFdvQHIwZAUfv0QiWFOTr+PgXz8
 o5n0puz4TvekOF+hGTNmibtss0h6euV0PqP8JxBhUqI5QT2L8GxBVQpuHaY0nBPGkb99
 ipbZZSL0SKnNcOpwnOk2+2W9tuUcmdI0u/IuNW5W49bcQz4bl0Q3eoq6APulexq1DE8u
 EF5A==
X-Gm-Message-State: APjAAAWBzCgrXfAeOa1EvnARNkSm2AMmJfK09ftoPwJSRJZ390SgPsHB
 T2VEngUC0gSQdkhl6sk4Ss/npA==
X-Google-Smtp-Source: APXvYqyyIMxcvMkdOmgbGdxqwUCfj1i8ToNEidoIVG/3vovKkuMaa+3pJ9drMOOqrY0fD0slF0BNZg==
X-Received: by 2002:a62:5c84:: with SMTP id
 q126mr59382546pfb.247.1560336553124; 
 Wed, 12 Jun 2019 03:49:13 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id y22sm12241561pfm.70.2019.06.12.03.49.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 12 Jun 2019 03:49:12 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH v5 2/3] mtd: spi-nor: add support to unlock flash device
Date: Wed, 12 Jun 2019 16:17:55 +0530
Message-Id: <1560336476-31763-3-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560336476-31763-1-git-send-email-sagar.kadam@sifive.com>
References: <1560336476-31763-1-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_034914_125056_D5E68782 
X-CRM114-Status: GOOD (  17.33  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: wesley@sifive.com, palmer@sifive.com,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>, aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Nor device (is25wp256 mounted on HiFive unleashed Rev A00 board) from ISSI
have memory blocks guarded by block protection bits BP[0,1,2,3].

Clearing block protection bits,unlocks the flash memory regions
The unlock scheme is registered during nor scans.

Based on code developed by Wesley Terpstra <wesley@sifive.com>
and/or Palmer Dabbelt <palmer@sifive.com>.
https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 51 ++++++++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/spi-nor.h   |  1 +
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 2d5a925..b7c6261 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1461,6 +1461,49 @@ static int macronix_quad_enable(struct spi_nor *nor)
 }
 
 /**
+ * issi_unlock() - clear BP[0123] write-protection.
+ * @nor: pointer to a 'struct spi_nor'.
+ * @ofs: offset from which to unlock memory.
+ * @len: number of bytes to unlock.
+ *
+ * Bits [2345] of the Status Register are BP[0123].
+ * ISSI chips use a different block protection scheme than other chips.
+ * Just disable the write-protect unilaterally.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int issi_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	int ret, val;
+	u8 mask = SR_BP0 | SR_BP1 | SR_BP2 | SR_BP3;
+
+	val = read_sr(nor);
+	if (val < 0)
+		return val;
+	if (!(val & mask))
+		return 0;
+
+	write_enable(nor);
+
+	write_sr(nor, val & ~mask);
+
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret)
+		return ret;
+
+	ret = read_sr(nor);
+	if (ret > 0 && !(ret & mask)) {
+		dev_info(nor->dev,
+			"ISSI Block Protection Bits cleared SR=0x%x", ret);
+		ret = 0;
+	} else {
+		dev_err(nor->dev, "ISSI Block Protection Bits not cleared\n");
+		ret = -EINVAL;
+	}
+	return ret;
+}
+
+/**
  * spansion_quad_enable() - set QE bit in Configuraiton Register.
  * @nor:	pointer to a 'struct spi_nor'
  *
@@ -1836,7 +1879,7 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 1024,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_4B_OPCODES)
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK)
 	},
 
 	/* Macronix */
@@ -4080,6 +4123,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		nor->flash_is_locked = stm_is_locked;
 	}
 
+	/* NOR protection support for ISSI chips */
+	if (JEDEC_MFR(info) == SNOR_MFR_ISSI ||
+	    info->flags & SPI_NOR_HAS_LOCK) {
+		nor->flash_unlock = issi_unlock;
+
+	}
 	if (nor->flash_lock && nor->flash_unlock && nor->flash_is_locked) {
 		mtd->_lock = spi_nor_lock;
 		mtd->_unlock = spi_nor_unlock;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index ff13297..9a7d719 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -127,6 +127,7 @@
 #define SR_BP0			BIT(2)	/* Block protect 0 */
 #define SR_BP1			BIT(3)	/* Block protect 1 */
 #define SR_BP2			BIT(4)	/* Block protect 2 */
+#define SR_BP3			BIT(5)	/* Block protect 3 for ISSI device*/
 #define SR_TB			BIT(5)	/* Top/Bottom protect */
 #define SR_SRWD			BIT(7)	/* SR write protect */
 /* Spansion/Cypress specific status bits */
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
