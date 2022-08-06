Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694C4C49EC1
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Aug 2022 06:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9nnGOtHZWzHaW6SUf7EG9Q2RkX7hIDd5lclvBbQNDg=; b=mKQh++wDuCm8AS
	WaMMWljRWTJUBVKHsTPglhASzxRJ8IHOy/mDRGEwcaA1dNwKGefIy3kfFTpsLkS+3gFJnMzzByxei
	beQppbhRCcbGPpU9ToaCmAE3on+ALHwHa8xVnzRSpLaO39kFzwmsa6eOn4OwWaaUt9Uyq2pkvNm8f
	eaCYhqEJAnH8L5YU7OnNNRviTR9bjJGo3feuxxqhTu0mHYwpRrZDf4sGHG1PID4VTYTN0MEW8QlZC
	nqOzeZpitU/s1EtuSBMplp7Q0pbA5dKaUBJquJ0ifwXjVY4tGxkjz2FBjVB4ol21p+ZRJH7+2c/No
	cPoulte6TToljYf/61wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKDPI-004nEK-FW; Sat, 06 Aug 2022 06:35:32 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKDPD-004n3H-GW
	for linux-mtd@lists.infradead.org; Sat, 06 Aug 2022 06:35:28 +0000
Received: by mail-pg1-x536.google.com with SMTP id r22so1929794pgm.5
        for <linux-mtd@lists.infradead.org>; Fri, 05 Aug 2022 23:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=4MKlwOIq//c0Q9bcHt7wrINt0fMZgwPxARad1s2r9GI=;
        b=djKXY7htlMXa1njgkIsinQlwZYDS2osrH3KWYiYCOb5CeF41nvnbiH1/9FWsxPl1Yi
         +ah8tpxNvXga+8vPInnn7iP60xG5uRJzEw5PfKVtb8Ba59l+FlNO+AmtKL92w2eWiN/W
         HFMA1OmvicoRpHNcQJq+nj7Kot1Yq05Uc22mT4a1GWSRxVmNnpJDNOyZU4ktmX28x/w3
         7MrLAx4h9Qg6Lgwk7ktE/ifWt2NGTx1n5WC8+VnKTgwbtIpc0jB3ggdoqOJP+Rwd+xiS
         O2cUUstZwHVLV0Ed5Ds/l8UaYjfmOpGfl42hU5sASuI/x/T6qVUX3e2Md1C/lnn5pL3i
         EGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=4MKlwOIq//c0Q9bcHt7wrINt0fMZgwPxARad1s2r9GI=;
        b=mPpi1MqqPWKrnbL7qy1i0yQfAUXLQb8QXEBPIOG4mQ6mvLg0sdSBdTqx97lqkkrW6Y
         J33NeX/n1eu3bYupYR8ZVKPguZNkal/yDFdFZ8P5Q/DE2itpkGgvbkiK/5kswzkioLvL
         ZcCA4QWugz5LmIIIDosgyJ/PLw1duSwdP+NtSaPGDPlE7RQPa7KU/T9IssqHcroy5MW4
         u133yy+eQol/15BwZNhTmYoN3g1WUADngJH8vCmG6FvGWux0pO0NjEjH7dp2MISBYAFT
         hHlnS/cO0K/z8C5Z9lkWc0eW+05RvC7y77qZUgxYUkMCDlpFC8eVb5gFy36ERXcnPzoI
         9F4A==
X-Gm-Message-State: ACgBeo1Dcy7OwAePsHqFlB3jZusN7eUbD+jlEX8zT+6MC/9skpmuWPek
	eReBJZYlQybpyijcFiVD5mLunBrhnWig9g==
X-Google-Smtp-Source: AA6agR4XH8doOJWAVilvol1arTeWbVdISelOReklpN4rT7xU/yOV6eb/AyLT0XNx+WLV8GxXrGLtFg==
X-Received: by 2002:aa7:95a8:0:b0:52d:4185:198d with SMTP id a8-20020aa795a8000000b0052d4185198dmr10106259pfk.65.1659767726106;
        Fri, 05 Aug 2022 23:35:26 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id a18-20020a63e852000000b0041b67615584sm2418452pgk.68.2022.08.05.23.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 23:35:25 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 2/8] mtd: spi-nor: sfdp: Extract volatile register offset from SCCR map
Date: Sat,  6 Aug 2022 15:34:20 +0900
Message-Id: <01473664ae2f925162cd418becf44f0405874749.1659764848.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
References: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_233527_583582_1A348F0E 
X-CRM114-Status: GOOD (  11.26  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

The volatile register offset resides in the 1st DWORD of SCCR map. Allocate
the table and copy the offset value.

The table may be allocated when the SCCR map for multi-chip is parsed.
Since we cannot assume SCCR parse is always in ahead of SCCR multi-chip,
we need to check if the table is already allocated or not.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/sfdp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 2257f1b4c2e2..3d612dc4c63c 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1206,6 +1206,7 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 static int spi_nor_parse_sccr(struct spi_nor *nor,
 			      const struct sfdp_parameter_header *sccr_header)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	u32 *dwords, addr;
 	size_t len;
 	int ret;
@@ -1222,6 +1223,17 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 
 	le32_to_cpu_array(dwords, sccr_header->length);
 
+	/* Address offset for volatile registers (die 0) */
+	if (!params->vreg_offset) {
+		params->vreg_offset = devm_kmalloc(nor->dev, sizeof(*dwords),
+						   GFP_KERNEL);
+		if (!params->vreg_offset) {
+			ret = -ENOMEM;
+			goto out;
+		}
+	}
+	params->vreg_offset[0] = dwords[0];
+
 	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[22]))
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
