Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0A7C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Nov 2022 17:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O4zcLwnRrFKvSrvEmx7Rl9UauqiThsCOqMmLayH9GvY=; b=tbGpPJSzfDYXrJ
	G7uZrffANpbRRran+d1+uFr13s105r/kF8U4PWLpfiZmvGEhhXxaDNo6EzSGkUgyRTcB9a5dfCMuU
	w/sBAXaVVEeGrOPsyWo8946zzyjsdu/6HqSGjlkABj96o/cE6lDbsqvcwbi7gppdG0+neVNIevmDn
	7Wd+obdDpU4jBkUdVs+X0kEd3YbgzpMWyt4KZ4/H4ohkEyNNbGIth7IZxeKDp9P44ISCKHJLMLK8K
	fWirpBahMGiuomsNt5tUXlELC4V26VWRu+AiPdkT5Qfodpt36JdKlC8DPn9vRc1MZ6UN2f5KrLXeR
	AxUrzQsdVXEYUvu5AaBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozhsT-0033vY-4e; Mon, 28 Nov 2022 17:25:09 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozhsP-0033sg-NL
	for linux-mtd@lists.infradead.org; Mon, 28 Nov 2022 17:25:07 +0000
Received: by mail-qk1-x734.google.com with SMTP id d7so7784727qkk.3
        for <linux-mtd@lists.infradead.org>; Mon, 28 Nov 2022 09:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WISYZ1L8dfjkhr9HPz2HhCPMd5gq2zqE5S/0zz5aWa0=;
        b=hcx970gPX8djEoRWtYW0NHM3NG3c5io9Z9ad1LPZUPufe2wTe0GoeT1ULY2q0sjog7
         NncYkw5V+5VopZJInbOAWSlwue7xv6ssNaSdX5RMpm1CWKFEwvqeHvqNdotA32Ug6/Nj
         SCcBemXPE/DvCahfHVNKFZFrtEMLnF1hGcWuMS0qjtL5qMTkRQabXULrNw40xHY6K0T/
         hnooEZ1UjrCmv3U+mNOldEaKxF8/sDX5HYBFXeaKHCnSOzlmbTe+GNfXB5Jly9q66nfZ
         OElGWiZxz02rWn3kQW5D0ru7zZEKl1aYBwyt3LAk17NUxUAW604R1mCCo9WnT4cwTO/G
         xKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WISYZ1L8dfjkhr9HPz2HhCPMd5gq2zqE5S/0zz5aWa0=;
        b=I5rTdNoCt4ewIxD3IlMTGfhzlanhOQ5q48T2STOzW04Mw9aw4YpBeeBqSDGrkUb+6f
         vzUxGatocNZKW8vgIA6u0ZDKuYrLSSO42/CR6Hha1IZoH9Qpraurtx7brFiOHZW5hWFn
         HvuLD8mg4/u/Cygkb4helxgWKmxkDNBIOmInM2OqQwk8DV5b93H0zgPToq0ykEKhj6Ld
         XR4LRb5/YJ/pe+TkfO5iYxOMGF2qWDDPnWpgmFcCnxgH/8jtJ508Whgdh5fQyg6pZLJj
         XCBiCzdVlEnPaUQghL59K1gKH0aFe/FO51JjI639vVnJw6y5khHPswO+9TZGkNJHHTb6
         1r6g==
X-Gm-Message-State: ANoB5pnzYTT6oq1feXhIFqmYstmVGj1sXpBEzie9Pp0c2kj1mbD/kmUC
	eRExujGUb9vSE4q3GSKhyxCg6w==
X-Google-Smtp-Source: AA0mqf7J2PGTa8s7U3vNZDbIq6NFc/rDbfTBe35D7AbD06oqD+c+yNMjAQxBaVljPT+i/M7mRn5ZcA==
X-Received: by 2002:a05:620a:271f:b0:6fc:15c2:c4a8 with SMTP id b31-20020a05620a271f00b006fc15c2c4a8mr27490322qkp.174.1669656302813;
        Mon, 28 Nov 2022 09:25:02 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id r9-20020a05622a034900b003a526675c07sm7322712qtw.52.2022.11.28.09.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 09:25:02 -0800 (PST)
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
Subject: [PATCH] mtd: spi-nor: issi: Add in support for IS25LX256 chip, operating in 1S-1S-8S mode.
Date: Mon, 28 Nov 2022 12:24:54 -0500
Message-Id: <20221128172455.159787-1-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_092505_800569_25E86CC7 
X-CRM114-Status: GOOD (  10.86  )
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

Adds the is25lx256 entry to the nor_parts table along with the additional
fixup logic to operate in 1S-1S-8S mode while programming.

Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
---
 drivers/mtd/spi-nor/issi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 89a66a19d754..e9b32b726bf3 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -29,6 +29,21 @@ static const struct spi_nor_fixups is25lp256_fixups = {
 	.post_bfpt = is25lp256_post_bfpt_fixups,
 };
 
+static void is25lx256_post_sfdp_fixup(struct spi_nor *nor)
+{
+	/* Fixup page program command to 1S-1S-8S */
+	nor->params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_8;
+	spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP_1_1_8],
+				SPINOR_OP_PP_1_1_8, SNOR_PROTO_1_1_8);
+
+	/* Disable quad_enable */
+	nor->params->quad_enable = NULL;
+}
+
+static struct spi_nor_fixups is25lx256_fixups = {
+	.post_sfdp = is25lx256_post_sfdp_fixup,
+};
+
 static void pm25lv_nor_late_init(struct spi_nor *nor)
 {
 	struct spi_nor_erase_map *map = &nor->params->erase_map;
@@ -74,6 +89,10 @@ static const struct flash_info issi_nor_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &is25lp256_fixups },
+	{ "is25lx256",  INFO(0x9d5a19, 0, 128 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
+		.fixups = &is25lx256_fixups },
 
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
