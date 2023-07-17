Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7D7EB64DC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 11:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GeomPsPt6zza67w01Lav+8pZympRJ1aBh0tdhcm+K38=; b=IRmhJqsFNTwZIG
	fxdswGJZ8c9LSvFytvzOYzWyiFzep5gk86ePpcG4NyGw/vJkdfxTH+okT/gX+5b4cx40Y3oBQgdPP
	BuzFw5uuha70xILcuUQtWomyXQzy/nT2kprt8E9/TeJKUGv8zVvg0xK1392XgwNZNypqm0cR1LEpB
	RhfqkarHtQaQ5UJKG+ZeEcxUdNQJ+zrbHKEzqkJqsRObcedUT/FiOJu0WPX392JYhey9mjSET2rAY
	3EOaIm4LMR7UyHxPnqZlgCW8H1mkQ9+sOEcwZW1buK5f8ATvS43elDzmBPtPGpKUzcZKmBeqGIUBI
	PBUA/jFXdCUfsto6XfOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLM42-003opg-1L;
	Mon, 17 Jul 2023 11:06:50 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLM3v-003olu-2u
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 11:06:44 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-78358268d1bso226626239f.3
        for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2023 04:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689592001; x=1692184001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=haVFqWj7QwEPz8RYxJRQEPBOrTTJvQggCktBjSbVKB4=;
        b=O8LmcS3Jf0qq58gvBFtuZhHrnnwIouCgGhdhOQ9OPUT88XsfExfnHtp071pecSyIrm
         UPebMf8og6ctAdU6ZW3bU2Q6DeZS15Zk9u/vLwVZloptx+ejg0Nj9uNpjJBoWhGlYvzs
         AF2SsAy+oMIUE4ufinHCFoBw9Rqhm4eqUeHyoqIFpnIFrFmmAvMbZ6z/vFRHdGKJP7nI
         xeSnozo0yEQvD6u/q5t4MiqUgz270mi8tXetzTpDBL9Q2B3VxUliisfLFakiAHRGWzaq
         vDkabMKn26aOOgt0fr9cJzv/cheCfcD24A3jpkbs3D8+qW5qJzu1CxRekC6/CflxQNTF
         9kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689592001; x=1692184001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=haVFqWj7QwEPz8RYxJRQEPBOrTTJvQggCktBjSbVKB4=;
        b=KxEnSlFMbCEE8fZzj2R7dIuhpvw815JOn6gs2cbAlmeGORjq2ruiYd0k+5VtWapGsZ
         ZCxrWVeIxuqUT5XaxlY2lk/ARCe+43PJgIJ+CX8+EnWVEAjEmpiLNv1gKVSRT4PKDpoN
         N5ZkbV1Yu9u+m1kJnlGnjqfgaULC/Cx7h9BjvLbAqP17PV5MW88tvuBhk7mFsGsTN9x3
         W5uYunalNTb133lkHPQLX/V8/75hTAl9Xr8YnSP9jCNMmW1XKT/29ca3KJDo2n71i3Hg
         sWf5GQsEeC5aSF5Zs2WnGeHY0bZfWA1aE+mSBUKmEDV7zF8StDzCddY+z8gz6Sr/c1q+
         AxbA==
X-Gm-Message-State: ABy/qLavkGjE5Sh3jmD5MpOL6LiastNB3ejvqTvWETwjHlDjCj04ipZn
	5WwTIO69prIpioD1S5lzycE=
X-Google-Smtp-Source: APBJJlF2KECXm2ypo4ZfIADjLDCl2fo6qU4eEBprTsFoXDtohC0Im35kZyIMTwARME8rgcdfY3q3Cg==
X-Received: by 2002:a05:6602:2563:b0:783:62d0:88c with SMTP id dj3-20020a056602256300b0078362d0088cmr11201087iob.19.1689592001378;
        Mon, 17 Jul 2023 04:06:41 -0700 (PDT)
Received: from sun-virtual-machine.localdomain ([103.149.144.245])
        by smtp.gmail.com with ESMTPSA id o8-20020a02cc28000000b0042acf934cbasm4212826jap.72.2023.07.17.04.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 04:06:41 -0700 (PDT)
From: SSunk <ssunkkan@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SSunk <ssunkkan@gmail.com>
Subject: [PATCH] Add support for XMC XM25QH128C/XM25QH256C/XM25QU256C/XM25QH512C/XM25QU512C
Date: Mon, 17 Jul 2023 19:06:25 +0800
Message-Id: <20230717110625.8844-1-ssunkkan@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Add more XMC chip support

Signed-off-by: SSunk <ssunkkan@gmail.com>
---
 drivers/mtd/spi-nor/xmc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
index 051411e86339..b2374187ec4f 100644
--- a/drivers/mtd/spi-nor/xmc.c
+++ b/drivers/mtd/spi-nor/xmc.c
@@ -16,6 +16,22 @@ static const struct flash_info xmc_nor_parts[] = {
 	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
+	{ "XM25QH128C", INFO(0x204018, 0, 64 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "XM25QH256C", INFO(0x204019, 0, 64 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "XM25QU256C", INFO(0x204119, 0, 64 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "XM25QH512C", INFO(0x204020, 0, 64 * 1024, 1024)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "XM25QU512C", INFO(0x204120, 0, 64 * 1024, 1024)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+
 };
 
 const struct spi_nor_manufacturer spi_nor_xmc = {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
