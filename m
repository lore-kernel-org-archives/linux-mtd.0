Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E98CD3DEA0
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2024 17:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0NHhfzLhxkiy2O1x4illiSs75jyKuxDnCcQGAuGe8Bo=; b=vzA6LkS1GMatmB
	e1Gg6/emXXqQML3C8L4P82+aKsCA1lRs4XN1Gmz9kf2OcXwGX8vKY+vvoA9VHq+jPeCIn+orf6tYS
	3o4qexmEwzZWAJ29LE3vrrSe5TNYjNXCQN2QveSeyWQcIot7VwrIQKY8WEaQ+dP10tcKH5DG/Uyj/
	WvMulSIP7l5aUr2PVF9V9Ke+IXIBkVWoLiazwI27AUlLfSXhxOsUPUVScJNIXbPTIzA1FrcF1bOry
	+h38AAzQHxEIzRQMTFbkjCkCfwxjHIVE4+vASM3XMJkATKtI2T/TH0l5CnBWexQZuFh9TvcDzYDvV
	Rikvlq84GJQVql2IvljA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1qSI-00000001Qff-3OWy;
	Fri, 18 Oct 2024 17:08:02 +0000
Received: from smtp-23.smtpout.orange.fr ([80.12.242.23] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1qQf-00000001QNp-3Fso;
	Fri, 18 Oct 2024 17:06:26 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 1qQZtV2hkZN8O1qQatW0HN; Fri, 18 Oct 2024 19:06:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1729271178;
	bh=86Chs4ufIR1yiNI3+jlRXdlCATqvdX/rue8dEZfqmY8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=NFYt2vTChDSlF/Hz8uFqAOz7QfY9oKjoSlUy5akyaSBEv++hkr2Q+elOaa92OS9nZ
	 SIzEhw8fzbYEO3kCmCcSCy0Hsbi3ZdBA1pVFk01XW5R9hjn4oVAnDeP2wVhwA993qK
	 aeLsWd/xPsc1NdypyYuOXfjzdNMvQFEgawtadaou5J7cpM7oPSOm3MncZe9T2fAYeQ
	 ycc6LZGHeTIvjF+5gy523jKJTEtPnl2IQ/QRy89mkC17+X8lWSvBbmh0YP9yU/4k4D
	 NbsgafSHeEQOSXg6v791LqBCqJ7ngy8A0BIxnMxaMseLD4KNM7WuechRJd9Z0aAHMI
	 CZ0VGPtWBM/xQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 18 Oct 2024 19:06:18 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] mtd: spinand: Constify struct nand_ecc_engine_ops
Date: Fri, 18 Oct 2024 19:05:57 +0200
Message-ID: <72597e9de2320a4109be2112e696399592edacd4.1729271136.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_100623_192711_6A37A514 
X-CRM114-Status: GOOD (  14.11  )
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

'struct nand_ecc_engine_ops' are not modified in these drivers.

Constifying this structure moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

Update the prototype of mxic_ecc_get_pipelined_ops() accordingly.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  16709	   1374	     16	  18099	   46b3	drivers/mtd/nand/ecc-mxic.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  16789	   1294	     16	  18099	   46b3	drivers/mtd/nand/ecc-mxic.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/mtd/nand/ecc-mxic.c       |  6 +++---
 drivers/mtd/nand/ecc-sw-bch.c     |  2 +-
 drivers/mtd/nand/ecc-sw-hamming.c |  2 +-
 drivers/mtd/nand/spi/core.c       |  2 +-
 drivers/spi/spi-mtk-snfi.c        |  2 +-
 drivers/spi/spi-mxic.c            | 10 +++++-----
 include/linux/mtd/nand-ecc-mxic.h |  4 ++--
 include/linux/mtd/nand.h          |  2 +-
 8 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/ecc-mxic.c b/drivers/mtd/nand/ecc-mxic.c
index 47e10945b8d2..86895e09328f 100644
--- a/drivers/mtd/nand/ecc-mxic.c
+++ b/drivers/mtd/nand/ecc-mxic.c
@@ -723,21 +723,21 @@ static int mxic_ecc_finish_io_req_pipelined(struct nand_device *nand,
 	return ret;
 }
 
-static struct nand_ecc_engine_ops mxic_ecc_engine_external_ops = {
+static const struct nand_ecc_engine_ops mxic_ecc_engine_external_ops = {
 	.init_ctx = mxic_ecc_init_ctx_external,
 	.cleanup_ctx = mxic_ecc_cleanup_ctx,
 	.prepare_io_req = mxic_ecc_prepare_io_req_external,
 	.finish_io_req = mxic_ecc_finish_io_req_external,
 };
 
-static struct nand_ecc_engine_ops mxic_ecc_engine_pipelined_ops = {
+static const struct nand_ecc_engine_ops mxic_ecc_engine_pipelined_ops = {
 	.init_ctx = mxic_ecc_init_ctx_pipelined,
 	.cleanup_ctx = mxic_ecc_cleanup_ctx,
 	.prepare_io_req = mxic_ecc_prepare_io_req_pipelined,
 	.finish_io_req = mxic_ecc_finish_io_req_pipelined,
 };
 
-struct nand_ecc_engine_ops *mxic_ecc_get_pipelined_ops(void)
+const struct nand_ecc_engine_ops *mxic_ecc_get_pipelined_ops(void)
 {
 	return &mxic_ecc_engine_pipelined_ops;
 }
diff --git a/drivers/mtd/nand/ecc-sw-bch.c b/drivers/mtd/nand/ecc-sw-bch.c
index 405552d014a8..0d9310dd6f52 100644
--- a/drivers/mtd/nand/ecc-sw-bch.c
+++ b/drivers/mtd/nand/ecc-sw-bch.c
@@ -384,7 +384,7 @@ static int nand_ecc_sw_bch_finish_io_req(struct nand_device *nand,
 	return max_bitflips;
 }
 
-static struct nand_ecc_engine_ops nand_ecc_sw_bch_engine_ops = {
+static const struct nand_ecc_engine_ops nand_ecc_sw_bch_engine_ops = {
 	.init_ctx = nand_ecc_sw_bch_init_ctx,
 	.cleanup_ctx = nand_ecc_sw_bch_cleanup_ctx,
 	.prepare_io_req = nand_ecc_sw_bch_prepare_io_req,
diff --git a/drivers/mtd/nand/ecc-sw-hamming.c b/drivers/mtd/nand/ecc-sw-hamming.c
index 254db2e7f8bb..f2d0effad9d2 100644
--- a/drivers/mtd/nand/ecc-sw-hamming.c
+++ b/drivers/mtd/nand/ecc-sw-hamming.c
@@ -638,7 +638,7 @@ static int nand_ecc_sw_hamming_finish_io_req(struct nand_device *nand,
 	return max_bitflips;
 }
 
-static struct nand_ecc_engine_ops nand_ecc_sw_hamming_engine_ops = {
+static const struct nand_ecc_engine_ops nand_ecc_sw_hamming_engine_ops = {
 	.init_ctx = nand_ecc_sw_hamming_init_ctx,
 	.cleanup_ctx = nand_ecc_sw_hamming_cleanup_ctx,
 	.prepare_io_req = nand_ecc_sw_hamming_prepare_io_req,
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 4d76f9f71a0e..b1df7f627161 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -337,7 +337,7 @@ static int spinand_ondie_ecc_finish_io_req(struct nand_device *nand,
 	return ret;
 }
 
-static struct nand_ecc_engine_ops spinand_ondie_ecc_engine_ops = {
+static const struct nand_ecc_engine_ops spinand_ondie_ecc_engine_ops = {
 	.init_ctx = spinand_ondie_ecc_init_ctx,
 	.cleanup_ctx = spinand_ondie_ecc_cleanup_ctx,
 	.prepare_io_req = spinand_ondie_ecc_prepare_io_req,
diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index debe0e3c1c8b..4169d622f28c 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -776,7 +776,7 @@ static int mtk_snand_ecc_finish_io_req(struct nand_device *nand,
 	return snf->ecc_stats.failed ? -EBADMSG : snf->ecc_stats.bitflips;
 }
 
-static struct nand_ecc_engine_ops mtk_snfi_ecc_engine_ops = {
+static const struct nand_ecc_engine_ops mtk_snfi_ecc_engine_ops = {
 	.init_ctx = mtk_snand_ecc_init_ctx,
 	.cleanup_ctx = mtk_snand_ecc_cleanup_ctx,
 	.prepare_io_req = mtk_snand_ecc_prepare_io_req,
diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 9699e0bb6a5e..809767d3145c 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -649,7 +649,7 @@ static int mxic_spi_transfer_one(struct spi_controller *host,
 /* ECC wrapper */
 static int mxic_spi_mem_ecc_init_ctx(struct nand_device *nand)
 {
-	struct nand_ecc_engine_ops *ops = mxic_ecc_get_pipelined_ops();
+	const struct nand_ecc_engine_ops *ops = mxic_ecc_get_pipelined_ops();
 	struct mxic_spi *mxic = nand->ecc.engine->priv;
 
 	mxic->ecc.use_pipelined_conf = true;
@@ -659,7 +659,7 @@ static int mxic_spi_mem_ecc_init_ctx(struct nand_device *nand)
 
 static void mxic_spi_mem_ecc_cleanup_ctx(struct nand_device *nand)
 {
-	struct nand_ecc_engine_ops *ops = mxic_ecc_get_pipelined_ops();
+	const struct nand_ecc_engine_ops *ops = mxic_ecc_get_pipelined_ops();
 	struct mxic_spi *mxic = nand->ecc.engine->priv;
 
 	mxic->ecc.use_pipelined_conf = false;
@@ -670,7 +670,7 @@ static void mxic_spi_mem_ecc_cleanup_ctx(struct nand_device *nand)
 static int mxic_spi_mem_ecc_prepare_io_req(struct nand_device *nand,
 					   struct nand_page_io_req *req)
 {
-	struct nand_ecc_engine_ops *ops = mxic_ecc_get_pipelined_ops();
+	const struct nand_ecc_engine_ops *ops = mxic_ecc_get_pipelined_ops();
 
 	return ops->prepare_io_req(nand, req);
 }
@@ -678,12 +678,12 @@ static int mxic_spi_mem_ecc_prepare_io_req(struct nand_device *nand,
 static int mxic_spi_mem_ecc_finish_io_req(struct nand_device *nand,
 					  struct nand_page_io_req *req)
 {
-	struct nand_ecc_engine_ops *ops = mxic_ecc_get_pipelined_ops();
+	const struct nand_ecc_engine_ops *ops = mxic_ecc_get_pipelined_ops();
 
 	return ops->finish_io_req(nand, req);
 }
 
-static struct nand_ecc_engine_ops mxic_spi_mem_ecc_engine_pipelined_ops = {
+static const struct nand_ecc_engine_ops mxic_spi_mem_ecc_engine_pipelined_ops = {
 	.init_ctx = mxic_spi_mem_ecc_init_ctx,
 	.cleanup_ctx = mxic_spi_mem_ecc_cleanup_ctx,
 	.prepare_io_req = mxic_spi_mem_ecc_prepare_io_req,
diff --git a/include/linux/mtd/nand-ecc-mxic.h b/include/linux/mtd/nand-ecc-mxic.h
index b125926e458c..0da4b2999576 100644
--- a/include/linux/mtd/nand-ecc-mxic.h
+++ b/include/linux/mtd/nand-ecc-mxic.h
@@ -16,7 +16,7 @@ struct mxic_ecc_engine;
 
 #if IS_ENABLED(CONFIG_MTD_NAND_ECC_MXIC) && IS_REACHABLE(CONFIG_MTD_NAND_CORE)
 
-struct nand_ecc_engine_ops *mxic_ecc_get_pipelined_ops(void);
+const struct nand_ecc_engine_ops *mxic_ecc_get_pipelined_ops(void);
 struct nand_ecc_engine *mxic_ecc_get_pipelined_engine(struct platform_device *spi_pdev);
 void mxic_ecc_put_pipelined_engine(struct nand_ecc_engine *eng);
 int mxic_ecc_process_data_pipelined(struct nand_ecc_engine *eng,
@@ -24,7 +24,7 @@ int mxic_ecc_process_data_pipelined(struct nand_ecc_engine *eng,
 
 #else /* !CONFIG_MTD_NAND_ECC_MXIC */
 
-static inline struct nand_ecc_engine_ops *mxic_ecc_get_pipelined_ops(void)
+static inline const struct nand_ecc_engine_ops *mxic_ecc_get_pipelined_ops(void)
 {
 	return NULL;
 }
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 1e4208040956..0e2f228e8b4a 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -293,7 +293,7 @@ enum nand_ecc_engine_integration {
 struct nand_ecc_engine {
 	struct device *dev;
 	struct list_head node;
-	struct nand_ecc_engine_ops *ops;
+	const struct nand_ecc_engine_ops *ops;
 	enum nand_ecc_engine_integration integration;
 	void *priv;
 };
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
