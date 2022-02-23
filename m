Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ADEC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 14:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rz/X2JQ2UjxMqRZxOBlrjaASdic3qdlPs0XUDFnhIHI=; b=InDXzb7DpNAWcB
	mCprOelATBLo4eX7bAXj6XC5/SJWMuD6Faburtke04SgcuvgTdFatouRioAwbE0+COFq9KFfxMnYf
	8+81+r0k/S9JKZoux51DMpjxCNRWhxIixOSBXda9AhL3QtBOBb3W+yQ41OsclQJCsTNjOjJ7hes2J
	ogosE15cqxmRpAk1ybQWE2VO+YUi1LYMcb+3lEjqM1oe2PXA8CUzMPibXn/+ppvPnC0ihInqER2Z9
	CyFA0T9Z2XnreVprFFLq2IVSkgbcyKdYvz5lrsE7T+2Oyxb2qhD1IDZWUrGA0UdQJG876K3SBMZR/
	pvGKgtQr79HLHVtbrmUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMsg9-00Ekaz-3F; Wed, 23 Feb 2022 14:31:41 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrwK-00EZYk-Le
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 13:44:27 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3FB1C22441;
 Wed, 23 Feb 2022 14:44:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645623857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0AaEL49bVNyArPkAHpyLUsNVUBDXrbZNlfI++WTggmA=;
 b=at5saJJpY1lu4kbyfwL8XFB8mGT93lYhkB3RHO3DCqqjXMZ0aO6vV7YKfQ7CVTMMehtvjX
 QHL70/up3DO17LaQ10TLb14HinB26DK5s/n25hdZBINK8Vp68uKV5p9NB+RhqjPKAxqAL0
 ETmrUqerrM0LdKVOt/GM8HdnDtysj40=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v5 30/32] mtd: spi-nor: spansion: rename vendor specific
 functions and defines
Date: Wed, 23 Feb 2022 14:43:56 +0100
Message-Id: <20220223134358.1914798-31-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223134358.1914798-1-michael@walle.cc>
References: <20220223134358.1914798-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_054420_929117_F3967E3D 
X-CRM114-Status: GOOD (  13.06  )
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

Drop the generic spi_nor prefix for all the spansion functions.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Tested-by: Pratyush Yadav <p.yadav@ti.com> # on mt35xu512aba, s28hs512t
---
 drivers/mtd/spi-nor/spansion.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 32d3301ce385..f24e546e04a5 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -309,10 +309,10 @@ static const struct flash_info spansion_nor_parts[] = {
 };
 
 /**
- * spi_nor_clear_sr() - Clear the Status Register.
+ * spansion_nor_clear_sr() - Clear the Status Register.
  * @nor:	pointer to 'struct spi_nor'.
  */
-static void spi_nor_clear_sr(struct spi_nor *nor)
+static void spansion_nor_clear_sr(struct spi_nor *nor)
 {
 	int ret;
 
@@ -336,13 +336,13 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_sr_ready_and_clear() - Query the Status Register to see if the flash
- * is ready for new commands and clear it if there are any errors.
+ * spansion_nor_sr_ready_and_clear() - Query the Status Register to see if the
+ * flash is ready for new commands and clear it if there are any errors.
  * @nor:	pointer to 'struct spi_nor'.
  *
  * Return: 1 if ready, 0 if not ready, -errno on errors.
  */
-static int spi_nor_sr_ready_and_clear(struct spi_nor *nor)
+static int spansion_nor_sr_ready_and_clear(struct spi_nor *nor)
 {
 	int ret;
 
@@ -356,7 +356,7 @@ static int spi_nor_sr_ready_and_clear(struct spi_nor *nor)
 		else
 			dev_err(nor->dev, "Programming Error occurred\n");
 
-		spi_nor_clear_sr(nor);
+		spansion_nor_clear_sr(nor);
 
 		/*
 		 * WEL bit remains set to one when an erase or page program
@@ -384,7 +384,7 @@ static void spansion_nor_late_init(struct spi_nor *nor)
 	}
 
 	if (nor->info->mfr_flags & USE_CLSR)
-		nor->params->ready = spi_nor_sr_ready_and_clear;
+		nor->params->ready = spansion_nor_sr_ready_and_clear;
 }
 
 static const struct spi_nor_fixups spansion_nor_fixups = {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
