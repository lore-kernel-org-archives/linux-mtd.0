Return-Path: <SRS0=P+6h=ND=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	DATE_IN_FUTURE_06_12,DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63F4C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:03:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8255360EB2
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8255360EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4aPKGD3o2ATumAeBJzYJtorvT+Qhj7LGhKBRrUr/vRA=; b=209dwga7A5UR1I
	jwylbdV1PK3k+iytnVpTtXYe5Z7Asqy1Eh7ZGdaHJaIjxz15y3QpZKIODcteYxPzIAcf0WMpAJ+f0
	1WHkooxguy0xBQa5LeZ/OwQxmjS1CC5ofhAU7fLgArCiRbTaGDFORRnKU7WEP636A6jfsYiQ6kzAd
	fWizRglGAK4nJ+vR6YokeMKME3bqICgnI5+HugEmDNhZrdsLrkF0KytgFD+54YsG3hHu8PtUa6qy7
	cxU2dcdWPaw5mPaB6qbRQ1qPKp7N0qOlq3VfovitesIIexlJ0v6KWba2VT621WYr1CW4Ab+P/b1Nl
	f8FpLjLaz1h0lSiovuUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE4k6-008pW3-Dg; Thu, 12 Aug 2021 07:03:06 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4jr-008pSY-Gn
 for linux-mtd@lists.infradead.org; Thu, 12 Aug 2021 07:02:55 +0000
Received: by mail-pj1-x1031.google.com with SMTP id j1so7834738pjv.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 Aug 2021 00:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ujOLj4IcDhfJIQfBXBs+VeU8KbTcT55vk1xqQFJRf5o=;
 b=rHYjQJOzsPC9vdexlRz8oTLe/5t/6GJLeQZf9k7Kki6W81qzINLu+p2Yl5jHdM3k+A
 VqnDsgVzHJJfCJ7bCj53pc0y45WozGg1R1LnY3hRWKzzXY5gJ7j4D4pPItOfWpddUT6T
 66xYfcGq8Czt4O66twmSjFIrj+1r6kgJrXofVirANlG5YO+/cb6xEG7ujq2dhFLqUrqt
 vPenLW5Jse7GlrIziuB/At7Cq8d9otc7RTLmZSOf8VS2248mCaatvpJDk7bqCqz0jcio
 uiA0SB2wBXgV5IXjNp/+vkE3GBy9aqr/QiiKJnH5f1CwhZJFJp6NWkHxprZVsOH98rCy
 UegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ujOLj4IcDhfJIQfBXBs+VeU8KbTcT55vk1xqQFJRf5o=;
 b=HSpKClL2kF5ofg0gnZ130EXJ4H16NZd3a9ZQLy5IQUcZcxUIcQFE4jKVX4u1OygRze
 zcl4vN9qvLz/CP/zv0UYS3bBqU3hR3WUTmnTLgR33QMWhSywz1rwmG/ZLRAtKqB8WOVu
 kZQEXlNHXDRwq0Yl/kSl0RXEiVTlsi9s/+CD6wAg66OmwTyQ31QIqk0dLiCSsMjstWKM
 HMHTV/9kOKb6A+m6hxiv0JVL9Rs6VeA9LGMsiNHTI2jLqEbO5YxCLzvHsdrHj7xtEZkL
 AnGuTf/ju/EeOSA4dmvLOA7uE2W95yjzAIvjjqoi96dfTmshBHSe3Ta0VnBDpR2ca3C2
 sP5g==
X-Gm-Message-State: AOAM533rz+a+pZ9kIWoEauUYrgFqJhkbBQ9NR2yt9PH5HqmtYor3PAAO
 8pc1gHpmuCTDExUc/vmrbg0=
X-Google-Smtp-Source: ABdhPJx/NgQkzEOAfIQS5S3KuBmdPXJSQzt+lajQ8FVJuMnQFz48LEgRdaY2rtPyQbmWNSS+4kjX6Q==
X-Received: by 2002:aa7:9115:0:b029:359:69db:bc89 with SMTP id
 21-20020aa791150000b029035969dbbc89mr2755726pfh.32.1628751770511; 
 Thu, 12 Aug 2021 00:02:50 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.gmail.com with ESMTPSA id o127sm1946962pfb.48.2021.08.12.00.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 00:02:50 -0700 (PDT)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 vigneshr@ti.com, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH v6 01/15] mtd: spi-nor: macronix: add support for Macronix
 octaflash
Date: Thu, 12 Aug 2021 15:01:21 +0000
Message-Id: <20210812150135.4005-2-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
References: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_000251_989749_572490C9 
X-CRM114-Status: GOOD (  21.91  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The octaflash is an xSPI compliant octal DTR flash. Add support
for using it in octal DTR mode.

Try to verify the flash ID to check whether the flash memory in octal
DTR mode and SPI mode are correct. When reading ID in OCTAL DTR mode,
ID will appear in a repeated manner. ex: ID[0] = 0xc2, ID[1] = 0xc2,
ID[2] = 0x94, ID[3] = 0x94... Rearrange the order so that the ID can pass.

The octaflash series can be divided into the following types:

MX25 series : Serial NOR Flash.
MX66 series : Serial NOR Flash with stacked die.(Size larger than 1Gb)
LM/UM series : Up to 250MHz clock frequency with both DTR/STR operation.
LW/UW series : Support simultaneous Read-while-Write operation in multiple
	       bank architecture. Read-while-write feature which means read
	       data one bank while another bank is programing or erasing.

MX25LM : 3.0V Octal I/O
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7841/MX25LM51245G,%203V,%20512Mb,%20v1.1.pdf

MX25UM : 1.8V Octal I/O
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7525/MX25UM51245G%20Extreme%20Speed,%201.8V,%20512Mb,%20v1.0.pdf

MX66LM : 3.0V Octal I/O with stacked die
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7929/MX66LM1G45G,%203V,%201Gb,%20v1.1.pdf

MX66UM : 1.8V Octal I/O with stacked die
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7721/MX66UM1G45G,%201.8V,%201Gb,%20v1.1.pdf

MX25LW : 3.0V Octal I/O with Read-while-Write
MX25UW : 1.8V Octal I/O with Read-while-Write
MX66LW : 3.0V Octal I/O with Read-while-Write and stack die
MX66UW : 1.8V Octal I/O with Read-while-Write and stack die

About LW/UW series, please contact us freely if you have any
questions. For adding Octal NOR Flash IDs, we have validated
each Flash on plateform zynq-picozed.

Signed-off-by: Zhengxun <zhengxunli.mxic@gmail.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/macronix.c | 85 ++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 27498ed0cc0d..0fe5c9c8de8d 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -8,6 +8,12 @@
 
 #include "core.h"
 
+#define SPINOR_OP_RD_CR2		0x71		/* Read configuration register 2 */
+#define SPINOR_OP_WR_CR2		0x72		/* Write configuration register 2 */
+#define SPINOR_REG_MXIC_CR2_MODE	0x00000000	/* For setting octal DTR mode */
+#define SPINOR_REG_MXIC_OPI_DTR_EN	0x2		/* Enable Octal DTR */
+#define SPINOR_REG_MXIC_SPI_EN		0x0		/* Enable SPI */
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -32,6 +38,85 @@ static struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
 };
 
+/**
+ * spi_nor_macronix_octal_dtr_enable() - Enable octal DTR on Macronix flashes.
+ * @nor:		pointer to a 'struct spi_nor'
+ * @enable:		whether to enable Octal DTR or switch back to SPI
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_macronix_octal_dtr_enable(struct spi_nor *nor, bool enable)
+{
+	struct spi_mem_op op;
+	u8 *buf = nor->bouncebuf, i;
+	int ret;
+
+	/* Set/unset the octal and DTR enable bits. */
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	if (enable) {
+		buf[0] = SPINOR_REG_MXIC_OPI_DTR_EN;
+	} else {
+		/*
+		 * The register is 1-byte wide, but 1-byte transactions are not
+		 * allowed in 8D-8D-8D mode. Since there is no register at the
+		 * next location, just initialize the value to 0 and let the
+		 * transaction go on.
+		 */
+		buf[0] = SPINOR_REG_MXIC_SPI_EN;
+		buf[1] = 0x0;
+	}
+
+	op = (struct spi_mem_op)
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_CR2, 1),
+			   SPI_MEM_OP_ADDR(4, SPINOR_REG_MXIC_CR2_MODE, 1),
+			   SPI_MEM_OP_NO_DUMMY,
+			   SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
+
+	if (!enable)
+		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret)
+		return ret;
+
+	/* Read flash ID to make sure the switch was successful. */
+	op = (struct spi_mem_op)
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
+			   SPI_MEM_OP_ADDR(enable ? 4 : 0, 0, 1),
+			   SPI_MEM_OP_DUMMY(enable ? 4 : 0, 1),
+			   SPI_MEM_OP_DATA_IN(SPI_NOR_MAX_ID_LEN, buf, 1));
+
+	if (enable)
+		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret)
+		return ret;
+
+	if (enable) {
+		for (i = 0; i < nor->info->id_len; i++)
+			if (buf[i * 2] != nor->info->id[i])
+				return -EINVAL;
+	} else {
+		if (memcmp(buf, nor->info->id, nor->info->id_len))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void octaflash_default_init(struct spi_nor *nor)
+{
+	nor->params->octal_dtr_enable = spi_nor_macronix_octal_dtr_enable;
+}
+
+static struct spi_nor_fixups octaflash_fixups = {
+	.default_init = octaflash_default_init,
+};
+
 static const struct flash_info macronix_parts[] = {
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
