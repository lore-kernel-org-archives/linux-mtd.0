Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC79C4321E
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 13:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTGEPCS4lSndx7k7a9gRW9SiskfCDgCW4oeDv9qgnoA=; b=1ayBptNWAt2U2l
	pqtkUIMgpaFH1byxh8oe0gfRJgiE48DNGjB4naejcNKLy+VuBEQ/eS2m6kOXi2nnX/eaUcrM1ezG6
	QhbIP/Y89at1e/DhCjjT9q6kmyVjaqoODsT3RW7Km50JIXw4KQ+kf9sinMB60no+CfYxqKuP2xhIH
	UZ5SSYt2nLwWxwLQdDMhq49x3tssokqwT1rzYLWmJAYnEJ5ya2nfzYd64/6zXrHrCLUcYxRCZWqZ9
	huiWNQZOKzGKTV9ooPLdC06CKXXiSdo3J0J4V3geeYY0weB3PSsXexLy8RMB+qnKgk0BDjaXkb/cO
	vCuGUr9H1ZKNhSBgxjkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p16WD-00Ghv6-Us; Fri, 02 Dec 2022 13:55:57 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p16W8-00GhpL-0Y
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2022 13:55:53 +0000
Received: by mail-qt1-x835.google.com with SMTP id y15so5132159qtv.5
        for <linux-mtd@lists.infradead.org>; Fri, 02 Dec 2022 05:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aN/7/h+h5Hpms0utb+UumNlSGE7V17/9wj785xAfzjY=;
        b=LCzV62wD19bVIRTiuK9BapJ+Qf6X3XlFWMnP6gGd28pj3TviIJMod7uNGVKOdQoVX1
         LsQtUx7YJat0zJT7K4QxsEKU2wfxSR5ZdUHJAnyKCFFK0XMofuQWMpKUs4SmRznJ6S7k
         tujqZqqCkHhwbkvuZnVqoIVjpVXJkzTHYFWqpmzVX84I3GKV7MD1lHql5hEZxl9sET6p
         h2u493NCAAOO4u6m2YkTPkjzoHFjp3f1LRkK1CJQRlmTNGMUV7db5dBNBX59a4Az5XT+
         Fd3nb3MqvIT8BPpsw/mVeoDKF7OldbaE+mcdRdWzoPjPH/N79nmmXwjDWP/zmPqDz0EP
         2olw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aN/7/h+h5Hpms0utb+UumNlSGE7V17/9wj785xAfzjY=;
        b=A2+01jOEWAbs916utov2XSCycW30M0zfXgbAh3jHzwder6DH8w7OHxo3nqDZ+MjOfq
         XUWSE5XB2S8UpfeJhfHXVKX/vyJ9EJVXUbbRd98qreb69DpDWI7ww/ImCcs8Tek12bKa
         uosqHwCEcEg8kJ9cMiGrVfzCJQUXFYa0gGcXbjUTB1TZNyCrXSR/C1krOCthNOFkNB5i
         XluYlfuJLGoqj87CDTTAkJc4oDF1llyQO6DhQCPVsHNTOesade9pRfJTnlhfm6X8GaeL
         gllD5pchadQAvNs2m4rxQ8C6DqVTSHwa8ZqDK8XACA5yLv3UkpDcXHcUxOL3KobfeEeE
         6RIA==
X-Gm-Message-State: ANoB5pnadq/D2cRC+nxADksvHdBSeIFqmmONQRuE66T3+Dl289oxo23U
	GuxhG0bdA9Rj7St6M+Iv2BWtxA==
X-Google-Smtp-Source: AA0mqf7VunQ1iCgqE+Mr+ITm3DVf5R0l2fBjJE6prsVBDnASbLmjCsqFDvhXV+bKBmLfq/ij/nWssg==
X-Received: by 2002:ac8:704:0:b0:39c:d509:76a5 with SMTP id g4-20020ac80704000000b0039cd50976a5mr50313757qth.382.1669989346833;
        Fri, 02 Dec 2022 05:55:46 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id x1-20020ac84d41000000b0039a610a04b1sm4122237qtv.37.2022.12.02.05.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 05:55:46 -0800 (PST)
From: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
To: 
Cc: nathan.morrison@timesys.com,
	greg.malysa@timesys.com,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org (open list:SPI NOR SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 3/3] mtd: spi-nor: Add support for IS25LX256 operating in 1S-8S-8S octal read mode
Date: Fri,  2 Dec 2022 08:55:39 -0500
Message-Id: <20221202135539.271936-4-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221202135539.271936-1-nathan.morrison@timesys.com>
References: <20221202135539.271936-1-nathan.morrison@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_055552_080114_B7375F45 
X-CRM114-Status: GOOD (  13.48  )
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

This adds the IS25LX256 chip into the ISSI flash_info parts table

Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
---
 drivers/mtd/spi-nor/issi.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 89a66a19d754..362bc3603d8f 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -29,6 +29,35 @@ static const struct spi_nor_fixups is25lp256_fixups = {
 	.post_bfpt = is25lp256_post_bfpt_fixups,
 };
 
+static int
+is25lx256_post_bfpt_fixups(struct spi_nor *nor,
+			   const struct sfdp_parameter_header *bfpt_header,
+			   const struct sfdp_bfpt *bfpt)
+{
+	/*
+	 * IS25LX256 supports both 1S-1S-8S and 1S-8S-8S.
+	 * However, the BFPT does not contain any information denoting this
+	 * functionality, so the proper fast read opcodes are never setup.
+	 * We're correcting this issue via the fixup below.  Page program
+	 * commands are detected and setup properly via the 4BAIT lookup.
+	 */
+	params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_8;
+	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_8],
+				  0, 8, SPINOR_OP_READ_1_1_8,
+				  SNOR_PROTO_1_1_8);
+
+	params->hwcaps.mask |= SNOR_HWCAPS_READ_1_8_8;
+	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_8_8],
+				  0, 16, SPINOR_OP_READ_1_8_8,
+				  SNOR_PROTO_1_8_8);
+
+	return 0;
+}
+
+static const struct spi_nor_fixups is25lx256_fixups = {
+	.post_bfpt = is25lx256_post_bfpt_fixups,
+};
+
 static void pm25lv_nor_late_init(struct spi_nor *nor)
 {
 	struct spi_nor_erase_map *map = &nor->params->erase_map;
@@ -74,6 +103,9 @@ static const struct flash_info issi_nor_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &is25lp256_fixups },
+	{ "is25lx256", INFO(0x9d5a19, 0, 0, 0)
+		PARSE_SFDP
+		.fixups = &is25lx256_fixups },
 
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
