Return-Path: <SRS0=wdA/=TL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB4CC04AB1
	for <linux-mtd@archiver.kernel.org>; Sat, 11 May 2019 10:08:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 629DD21841
	for <linux-mtd@archiver.kernel.org>; Sat, 11 May 2019 10:08:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oQy5HoeY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Dw7FyF67"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 629DD21841
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kbMnTOW9FQPzr1rWY5HIwhdauBHlf0v7AAbSFETvwWU=; b=oQy5HoeYOEUhsPdeBxHCeMVznv
	XWHV2BVAsOPP+uaTeYv0dTw4J20nPY2qvrNbAe36CrbVQDbmIL45ptbJt5jgKpTFCFqDMs9fS3O1D
	g0AFQl3tzFotlBYraW7A7bFKgOo1OunSudZhXAnGer9O/8mu/ndKqRsUKD51svAgau1lnm7WGYtfQ
	M3C/p7FRxfrpr0zxRqzclDvgOgPNzLwGWCxKJNwAfkM0hD5levEtNingcGB9DD5N7hWItrBum5ZCZ
	LxOc5Uq+utomtNs7xc+iiq3dG0aVUxG9fTDJYo+DGeGtMuqm2QjwVKT+58LO22UZb7OGzN4jpJimV
	+nUm/TYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPOvy-000200-5h; Sat, 11 May 2019 10:08:50 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPOvl-0001cx-IL
 for linux-mtd@lists.infradead.org; Sat, 11 May 2019 10:08:44 +0000
Received: by mail-pl1-x644.google.com with SMTP id y3so3999528plp.0
 for <linux-mtd@lists.infradead.org>; Sat, 11 May 2019 03:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0EQbtG9UK8LaFWPxCR8l4gLESWDW0fS19bkjthE7mrI=;
 b=Dw7FyF673u3rt2Kt56MEIfuZ4GVyNqyF2ZS81A2N0yZg+R9xjVDroPHkMdsjhq8vPO
 1yQMH5Q+r+3IN98KLc7R/Rv4uPphjAvsz8hInTbeqc13q+Y3rxN+Mt40EaSgCEnp14pF
 DcC+Mp2+4pb6/pDFQ80eS2DGU+3mkTkcw9tmi+LrGVT24nKJtIGzLjM0xCKv055ksZgE
 x3jTPLghR7mRHJYiNgS+X0T6gprmSSsXjvjd6deqisc29IdpJWs8fD48hU2iT7nsquuc
 kTIYqiAJqfkkmwWopyv3E55jZi0FFYNQY5bhv1P+9Aobkml6OB/8BDybYVuEZxdSXbYh
 2V1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0EQbtG9UK8LaFWPxCR8l4gLESWDW0fS19bkjthE7mrI=;
 b=ZcBcSEoHwBlX14er7kmlYX40fVdDOpJCtIJPtmSZcFS8dHKmJkwROtudM718EtSY57
 K2esUzwaPiA/+sOCoJoYxhVBA76rLft0sgc3AJuZn2uBc7qTQgDLHOrU1aw9zshZjmfa
 TCOqSfVzHtomxZZgZQPJxrCWhTOp66TdsOBkFk2ArNdxIzonxxSnYMnFjT/3wUmmpsHl
 SfRIIHsyW+KH8wEF6U+JgEL6Ogkw2rqOfMPWxf90g3KsL25JXe16ZZoDCcBGaJCDki+G
 JUhmzQY+r78pi9M7B5F4OGlyttp1XzJKDpTxSqs9Q9sVUzJxtmFp2vSBW3ugRkNy1zEj
 Dekg==
X-Gm-Message-State: APjAAAVHmGHbcze10gn7aI/exvICyvnxEsJqp6Bw5bPZhZcS+s421InO
 3pgEw3YhplwtS9tcMAtjHj39CQ==
X-Google-Smtp-Source: APXvYqwVECdIzOQsAnYcibww71gPB9aNXqCmxNekgY5j0GplT7l+TITNM79GbCsGwsm/oKFur5YlVw==
X-Received: by 2002:a17:902:b70c:: with SMTP id
 d12mr19459356pls.178.1557569313210; 
 Sat, 11 May 2019 03:08:33 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 c129sm16951836pfg.178.2019.05.11.03.08.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 11 May 2019 03:08:32 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, bbrezillon@kernel.org, richard@nod.at,
 palmer@sifive.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v4 2/3] mtd: spi-nor: add support to unlock flash device.
Date: Sat, 11 May 2019 15:38:07 +0530
Message-Id: <1557569288-19441-3-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557569288-19441-1-git-send-email-sagar.kadam@sifive.com>
References: <1557569288-19441-1-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190511_030838_034905_F1B2409B 
X-CRM114-Status: GOOD (  17.54  )
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
index c5408ed..3942b26 100644
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
@@ -4078,6 +4121,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
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
