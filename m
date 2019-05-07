Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D1FC04AAD
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 16:00:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D71B205ED
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 16:00:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rj79LaSe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NU62BZrN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D71B205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GdOOVs4ydaaYN5WYPd1B3+SdMseX30YSa81u2Qqy2aQ=; b=rj79LaSeLdl5ZH
	uiSV3pUDYj+ue9PsKtMRlsJtgu7RfAP6ETaszKagliyT7TbBALDQItYhOJ2BijpeCxvgjpTN788I3
	iu8FZGQkEIXJ2JXxZp99h00Da645aBXROIMDU91wF4Hqz/lVW76jfBvm2udNLmQ/0QAeEVb8bCFc+
	cdEQQy4GRWaf/nEx+V6ihwNh3OuOwiHXD9L1JAkGbI0NhupHC3JNgM/UJaZkh470kFz9nTPzAwjiK
	zA9q0clYB8e5NJ39UVZ6G604O40tQTyTHBFTowmWwixHYmMM2B+IjHDNxaofAQSHvkt7IWD3Wsg4M
	APXcNhI2nViXZhFVyvGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hO2WK-0001bL-Lh; Tue, 07 May 2019 16:00:44 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO2WH-0001aU-GQ
 for linux-mtd@lists.infradead.org; Tue, 07 May 2019 16:00:43 +0000
Received: by mail-pg1-x544.google.com with SMTP id 85so8532605pgc.3
 for <linux-mtd@lists.infradead.org>; Tue, 07 May 2019 09:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
 :references; bh=4KM0y+VsDRDq1QBsQrOgSVGYr46K10+xwnmF6uVSq4g=;
 b=NU62BZrN5KCzZX1XVTU3IVHwSAdjJbIyQg4VeugCYGDvtd77Z/gP3F4OUlaR4krlgS
 o+11XHW0v8kPcVAoScYskKkc+MjQrl0vsScZ73N6pvEcuj8HxFgNDRBLxty7GmXNCwfq
 2iJ8x42frxfAT8uV/B3a5kp5QFVhV+yA1MPi+rCejY8Mv1n6HKeW5WkxwkKgtLSEr3Ht
 mZdGBeuU7a4fbOhLaT5GfGypqZhijSaNbl7f1rYq3I4zNRW4GAnH8lusIdUETxOPJocw
 4BHGlYCozYX+kT2gE4i7Kjf/HUnwn+Elr89RC531EOnyNxGdbBN9hT/I85OAyDkqj6wi
 5nBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=4KM0y+VsDRDq1QBsQrOgSVGYr46K10+xwnmF6uVSq4g=;
 b=MQH89e63mlZY0RQl6XVbZcj+myxMj0MJiY5ifsPKcGl2e6LwErtPwI83AQM5j656le
 T2r8aCBC7KagKytmesVM1H4kTtuZKLF9ywMNN8UBK2I2UIcoU53ZX9HlXwGngy7iVfXE
 44sSheV6Caq9ULcFURU8t9BzhM57CsTXleV/HvPZaXkdFq5DExRJ+VoinJCBj7QGj/sI
 IJF9SBgf+OHLucLVE+K9ELgmZ8uoucK2rlz8OrB4msDY1YNXIgMj2AyRFNUjkxoYOKFb
 IrBBTs/da7OXaI+8XqA/vxyu8/z32g7ZGlcc9T2qoWktB+20IAsESOTztPWtTibjAU8b
 bSMA==
MIME-Version: 1.0
X-Gm-Message-State: APjAAAWTmGQZ1Bgra1m8AwZQ73qNQWeq/HGtVC2NrK7lSmJIQC6+/cgx
 fA7w7shZ1fwysnDuipwn3Dvbfe/82bAPX8gk5dQhlzeFHAdG/bfR4CkOmkb/aWrT/xj7MEvuXzc
 rHYP/pBby9jBhgBCuQCw=
X-Google-Smtp-Source: APXvYqxPnAEc2G3zRVZf6L/0Kdp2TrKypPq94MbRDW4FheSYN1WrKPt1O7GwwpXDKr3U6SEFcuigZw==
X-Received: by 2002:a63:3e47:: with SMTP id l68mr40030636pga.85.1557244840952; 
 Tue, 07 May 2019 09:00:40 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 h187sm22543540pfc.52.2019.05.07.09.00.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 07 May 2019 09:00:40 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, bbrezillon@kernel.org, richard@nod.at,
 palmer@sifive.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v3 v3 2/3] mtd: spi-nor: add support to unlock flash device.
Date: Tue,  7 May 2019 21:29:34 +0530
Message-Id: <1557244775-14206-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557244775-14206-1-git-send-email-sagar.kadam@sifive.com>
References: <1557244775-14206-1-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_090041_544394_2225F20E 
X-CRM114-Status: GOOD (  17.42  )
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
