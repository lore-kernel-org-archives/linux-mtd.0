Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07F3C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Nov 2021 08:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2OSyfuIOt3WeRkvWxpLG/WD3fhc3SIiNC8iAc0ZvJIY=; b=WmJ5HlhpMQebEB
	Whgj4lHAV3++eVKenpMd8DHSyOmiiM8AInvWoQdNB5Pce5Z7gP5Hu0/uroze8RLMoewsAdVtF0ZPT
	6vQWtmYY/V6IubyCzYiTZY8LsBgLwbjUqgFWvPYtonKXEo67u8n3fI/Yw33rRHC3tz3MCrJ8u+Ysu
	X1L/r9PuWJu8xDbfqLhp3oW9XnOWqVzpDRETze5VN2G92CYxkMQytxTYXFeCsG7i75DkkBFFNFvRO
	0IpCHZr37Vf3z3g0hqFuZH8EVsOcqNU2xgXyGyGCpf+DAtXuuzOoM8Y6aZi5c54OHmTQ22sOCWuM3
	CVAiRpKR+M05CH5ZDhtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mryZz-0047xP-AH; Tue, 30 Nov 2021 08:33:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mryYy-0047YX-Qp; Tue, 30 Nov 2021 08:32:35 +0000
X-UUID: 7bcff6161cbf4d92a4cc44e31ff87d01-20211130
X-UUID: 7bcff6161cbf4d92a4cc44e31ff87d01-20211130
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1933531433; Tue, 30 Nov 2021 01:32:30 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Nov 2021 00:32:28 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 30 Nov 2021 16:32:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 30 Nov 2021 16:32:25 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: <miquel.raynal@bootlin.com>, <broonie@kernel.org>
CC: <xiangsheng.hou@mediatek.com>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: [RFC, v4,
 4/5] mtd: spinand: Move set/get OOB databytes to each ECC engines
Date: Tue, 30 Nov 2021 16:32:01 +0800
Message-ID: <20211130083202.14228-5-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130083202.14228-1-xiangsheng.hou@mediatek.com>
References: <20211130083202.14228-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_003232_947559_17AB1478 
X-CRM114-Status: GOOD (  21.32  )
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

Move set/get OOB databytes to each ECC engines when in AUTO mode.
For read/write in AUTO mode, the OOB bytes include not only free
date bytes but also ECC data bytes. And for some special ECC engine,
the data bytes in OOB may be mixed with main data. For example,
mediatek ECC engine will be one more main data byte swap with BBM.
So, just put these operation in each ECC engine to distinguish
the differentiation.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 drivers/mtd/nand/ecc-sw-bch.c           | 71 ++++++++++++++++---
 drivers/mtd/nand/ecc-sw-hamming.c       | 71 ++++++++++++++++---
 drivers/mtd/nand/spi/core.c             | 93 +++++++++++++++++--------
 include/linux/mtd/nand-ecc-sw-bch.h     |  4 ++
 include/linux/mtd/nand-ecc-sw-hamming.h |  4 ++
 include/linux/mtd/spinand.h             |  4 ++
 6 files changed, 198 insertions(+), 49 deletions(-)

diff --git a/drivers/mtd/nand/ecc-sw-bch.c b/drivers/mtd/nand/ecc-sw-bch.c
index 405552d014a8..bda31ef8f0b8 100644
--- a/drivers/mtd/nand/ecc-sw-bch.c
+++ b/drivers/mtd/nand/ecc-sw-bch.c
@@ -238,7 +238,9 @@ int nand_ecc_sw_bch_init_ctx(struct nand_device *nand)
 	engine_conf->code_size = code_size;
 	engine_conf->calc_buf = kzalloc(mtd->oobsize, GFP_KERNEL);
 	engine_conf->code_buf = kzalloc(mtd->oobsize, GFP_KERNEL);
-	if (!engine_conf->calc_buf || !engine_conf->code_buf) {
+	engine_conf->oob_buf = kzalloc(mtd->oobsize, GFP_KERNEL);
+	if (!engine_conf->calc_buf || !engine_conf->code_buf ||
+	    !engine_conf->oob_buf) {
 		ret = -ENOMEM;
 		goto free_bufs;
 	}
@@ -267,6 +269,7 @@ int nand_ecc_sw_bch_init_ctx(struct nand_device *nand)
 	nand_ecc_cleanup_req_tweaking(&engine_conf->req_ctx);
 	kfree(engine_conf->calc_buf);
 	kfree(engine_conf->code_buf);
+	kfree(engine_conf->oob_buf);
 free_engine_conf:
 	kfree(engine_conf);
 
@@ -283,6 +286,7 @@ void nand_ecc_sw_bch_cleanup_ctx(struct nand_device *nand)
 		nand_ecc_cleanup_req_tweaking(&engine_conf->req_ctx);
 		kfree(engine_conf->calc_buf);
 		kfree(engine_conf->code_buf);
+		kfree(engine_conf->oob_buf);
 		kfree(engine_conf);
 	}
 }
@@ -299,22 +303,42 @@ static int nand_ecc_sw_bch_prepare_io_req(struct nand_device *nand,
 	int total = nand->ecc.ctx.total;
 	u8 *ecccalc = engine_conf->calc_buf;
 	const u8 *data;
-	int i;
+	int i, ret = 0;
 
 	/* Nothing to do for a raw operation */
 	if (req->mode == MTD_OPS_RAW)
 		return 0;
 
-	/* This engine does not provide BBM/free OOB bytes protection */
-	if (!req->datalen)
-		return 0;
-
 	nand_ecc_tweak_req(&engine_conf->req_ctx, req);
 
 	/* No more preparation for page read */
 	if (req->type == NAND_PAGE_READ)
 		return 0;
 
+	if (req->ooblen) {
+		memset(engine_conf->oob_buf, 0xff,
+		       nanddev_per_page_oobsize(nand));
+
+		if (req->mode == MTD_OPS_AUTO_OOB) {
+			ret = mtd_ooblayout_set_databytes(mtd, req->oobbuf.out,
+							  engine_conf->oob_buf,
+							  req->ooboffs,
+							  mtd->oobavail);
+			if (ret)
+				return ret;
+		} else {
+			memcpy(engine_conf->oob_buf + req->ooboffs,
+			       req->oobbuf.out, req->ooblen);
+		}
+
+		engine_conf->src_oob_buf = (void *)req->oobbuf.out;
+		req->oobbuf.out = engine_conf->oob_buf;
+	}
+
+	/* This engine does not provide BBM/free OOB bytes protection */
+	if (!req->datalen)
+		return 0;
+
 	/* Preparation for page write: derive the ECC bytes and place them */
 	for (i = 0, data = req->databuf.out;
 	     eccsteps;
@@ -344,12 +368,36 @@ static int nand_ecc_sw_bch_finish_io_req(struct nand_device *nand,
 	if (req->mode == MTD_OPS_RAW)
 		return 0;
 
-	/* This engine does not provide BBM/free OOB bytes protection */
-	if (!req->datalen)
-		return 0;
-
 	/* No more preparation for page write */
 	if (req->type == NAND_PAGE_WRITE) {
+		if (req->ooblen)
+			req->oobbuf.out = engine_conf->src_oob_buf;
+
+		nand_ecc_restore_req(&engine_conf->req_ctx, req);
+		return 0;
+	}
+
+	if (req->ooblen) {
+		memset(engine_conf->oob_buf, 0xff,
+		       nanddev_per_page_oobsize(nand));
+
+		if (req->mode == MTD_OPS_AUTO_OOB) {
+			ret = mtd_ooblayout_get_databytes(mtd,
+							  engine_conf->oob_buf,
+							  req->oobbuf.in,
+							  req->ooboffs,
+							  mtd->oobavail);
+			if (ret)
+				return ret;
+		} else {
+			memcpy(engine_conf->oob_buf,
+			       req->oobbuf.in + req->ooboffs, req->ooblen);
+		}
+	}
+
+	/* This engine does not provide BBM/free OOB bytes protection */
+	if (!req->datalen) {
+		req->oobbuf.in = engine_conf->oob_buf;
 		nand_ecc_restore_req(&engine_conf->req_ctx, req);
 		return 0;
 	}
@@ -379,6 +427,9 @@ static int nand_ecc_sw_bch_finish_io_req(struct nand_device *nand,
 		}
 	}
 
+	if (req->ooblen)
+		req->oobbuf.in = engine_conf->oob_buf;
+
 	nand_ecc_restore_req(&engine_conf->req_ctx, req);
 
 	return max_bitflips;
diff --git a/drivers/mtd/nand/ecc-sw-hamming.c b/drivers/mtd/nand/ecc-sw-hamming.c
index 254db2e7f8bb..c90ff31e9656 100644
--- a/drivers/mtd/nand/ecc-sw-hamming.c
+++ b/drivers/mtd/nand/ecc-sw-hamming.c
@@ -507,7 +507,9 @@ int nand_ecc_sw_hamming_init_ctx(struct nand_device *nand)
 	engine_conf->code_size = 3;
 	engine_conf->calc_buf = kzalloc(mtd->oobsize, GFP_KERNEL);
 	engine_conf->code_buf = kzalloc(mtd->oobsize, GFP_KERNEL);
-	if (!engine_conf->calc_buf || !engine_conf->code_buf) {
+	engine_conf->oob_buf = kzalloc(mtd->oobsize, GFP_KERNEL);
+	if (!engine_conf->calc_buf || !engine_conf->code_buf ||
+	    !engine_conf->oob_buf) {
 		ret = -ENOMEM;
 		goto free_bufs;
 	}
@@ -522,6 +524,7 @@ int nand_ecc_sw_hamming_init_ctx(struct nand_device *nand)
 	nand_ecc_cleanup_req_tweaking(&engine_conf->req_ctx);
 	kfree(engine_conf->calc_buf);
 	kfree(engine_conf->code_buf);
+	kfree(engine_conf->oob_buf);
 free_engine_conf:
 	kfree(engine_conf);
 
@@ -537,6 +540,7 @@ void nand_ecc_sw_hamming_cleanup_ctx(struct nand_device *nand)
 		nand_ecc_cleanup_req_tweaking(&engine_conf->req_ctx);
 		kfree(engine_conf->calc_buf);
 		kfree(engine_conf->code_buf);
+		kfree(engine_conf->oob_buf);
 		kfree(engine_conf);
 	}
 }
@@ -553,22 +557,42 @@ static int nand_ecc_sw_hamming_prepare_io_req(struct nand_device *nand,
 	int total = nand->ecc.ctx.total;
 	u8 *ecccalc = engine_conf->calc_buf;
 	const u8 *data;
-	int i;
+	int i, ret;
 
 	/* Nothing to do for a raw operation */
 	if (req->mode == MTD_OPS_RAW)
 		return 0;
 
-	/* This engine does not provide BBM/free OOB bytes protection */
-	if (!req->datalen)
-		return 0;
-
 	nand_ecc_tweak_req(&engine_conf->req_ctx, req);
 
 	/* No more preparation for page read */
 	if (req->type == NAND_PAGE_READ)
 		return 0;
 
+	if (req->ooblen) {
+		memset(engine_conf->oob_buf, 0xff,
+		       nanddev_per_page_oobsize(nand));
+
+		if (req->mode == MTD_OPS_AUTO_OOB) {
+			ret = mtd_ooblayout_set_databytes(mtd, req->oobbuf.out,
+							  engine_conf->oob_buf,
+							  req->ooboffs,
+							  mtd->oobavail);
+			if (ret)
+				return ret;
+		} else {
+			memcpy(engine_conf->oob_buf + req->ooboffs,
+			       req->oobbuf.out, req->ooblen);
+		}
+
+		engine_conf->src_oob_buf = (void *)req->oobbuf.out;
+		req->oobbuf.out = engine_conf->oob_buf;
+	}
+
+	/* This engine does not provide BBM/free OOB bytes protection */
+	if (!req->datalen)
+		return 0;
+
 	/* Preparation for page write: derive the ECC bytes and place them */
 	for (i = 0, data = req->databuf.out;
 	     eccsteps;
@@ -598,12 +622,36 @@ static int nand_ecc_sw_hamming_finish_io_req(struct nand_device *nand,
 	if (req->mode == MTD_OPS_RAW)
 		return 0;
 
-	/* This engine does not provide BBM/free OOB bytes protection */
-	if (!req->datalen)
-		return 0;
-
 	/* No more preparation for page write */
 	if (req->type == NAND_PAGE_WRITE) {
+		if (req->ooblen)
+			req->oobbuf.out = engine_conf->src_oob_buf;
+
+		nand_ecc_restore_req(&engine_conf->req_ctx, req);
+		return 0;
+	}
+
+	if (req->ooblen) {
+		memset(engine_conf->oob_buf, 0xff,
+		       nanddev_per_page_oobsize(nand));
+
+		if (req->mode == MTD_OPS_AUTO_OOB) {
+			ret = mtd_ooblayout_get_databytes(mtd,
+							  engine_conf->oob_buf,
+							  req->oobbuf.in,
+							  req->ooboffs,
+							  mtd->oobavail);
+			if (ret)
+				return ret;
+		} else {
+			memcpy(engine_conf->oob_buf,
+			       req->oobbuf.in + req->ooboffs, req->ooblen);
+		}
+	}
+
+	/* This engine does not provide BBM/free OOB bytes protection */
+	if (!req->datalen) {
+		req->oobbuf.in = engine_conf->oob_buf;
 		nand_ecc_restore_req(&engine_conf->req_ctx, req);
 		return 0;
 	}
@@ -633,6 +681,9 @@ static int nand_ecc_sw_hamming_finish_io_req(struct nand_device *nand,
 		}
 	}
 
+	if (req->ooblen)
+		req->oobbuf.in = engine_conf->oob_buf;
+
 	nand_ecc_restore_req(&engine_conf->req_ctx, req);
 
 	return max_bitflips;
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index c58f558302c4..9033036086f2 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -267,6 +267,12 @@ static int spinand_ondie_ecc_init_ctx(struct nand_device *nand)
 	if (!engine_conf)
 		return -ENOMEM;
 
+	engine_conf->oob_buf = kzalloc(nand->memorg.oobsize, GFP_KERNEL);
+	if (!engine_conf->oob_buf) {
+		kfree(engine_conf);
+		return -ENOMEM;
+	}
+
 	nand->ecc.ctx.priv = engine_conf;
 
 	if (spinand->eccinfo.ooblayout)
@@ -279,16 +285,40 @@ static int spinand_ondie_ecc_init_ctx(struct nand_device *nand)
 
 static void spinand_ondie_ecc_cleanup_ctx(struct nand_device *nand)
 {
-	kfree(nand->ecc.ctx.priv);
+	struct spinand_ondie_ecc_conf *engine_conf = nand->ecc.ctx.priv;
+
+	kfree(engine_conf->oob_buf);
+	kfree(engine_conf);
 }
 
 static int spinand_ondie_ecc_prepare_io_req(struct nand_device *nand,
 					    struct nand_page_io_req *req)
 {
+	struct spinand_ondie_ecc_conf *engine_conf = nand->ecc.ctx.priv;
 	struct spinand_device *spinand = nand_to_spinand(nand);
+	struct mtd_info *mtd = spinand_to_mtd(spinand);
 	bool enable = (req->mode != MTD_OPS_RAW);
+	int ret;
 
-	memset(spinand->oobbuf, 0xff, nanddev_per_page_oobsize(nand));
+	if (req->ooblen && req->type == NAND_PAGE_WRITE) {
+		memset(engine_conf->oob_buf, 0xff,
+		       nanddev_per_page_oobsize(nand));
+
+		if (req->mode == MTD_OPS_AUTO_OOB) {
+			ret = mtd_ooblayout_set_databytes(mtd, req->oobbuf.out,
+							  engine_conf->oob_buf,
+							  req->ooboffs,
+							  mtd->oobavail);
+			if (ret)
+				return ret;
+		} else {
+			memcpy(engine_conf->oob_buf + req->ooboffs,
+			       req->oobbuf.out, req->ooblen);
+		}
+
+		engine_conf->src_oob_buf = (void *)req->oobbuf.out;
+		req->oobbuf.out = engine_conf->oob_buf;
+	}
 
 	/* Only enable or disable the engine */
 	return spinand_ecc_enable(spinand, enable);
@@ -306,8 +336,32 @@ static int spinand_ondie_ecc_finish_io_req(struct nand_device *nand,
 		return 0;
 
 	/* Nothing to do when finishing a page write */
-	if (req->type == NAND_PAGE_WRITE)
+	if (req->type == NAND_PAGE_WRITE) {
+		if (req->ooblen)
+			req->oobbuf.out = engine_conf->src_oob_buf;
+
 		return 0;
+	}
+
+	if (req->ooblen) {
+		memset(engine_conf->oob_buf, 0xff,
+		       nanddev_per_page_oobsize(nand));
+
+		if (req->mode == MTD_OPS_AUTO_OOB) {
+			ret = mtd_ooblayout_get_databytes(mtd,
+							  engine_conf->oob_buf,
+							  req->oobbuf.in,
+							  req->ooboffs,
+							  mtd->oobavail);
+			if (ret)
+				return ret;
+		} else {
+			memcpy(engine_conf->oob_buf,
+			       req->oobbuf.in + req->ooboffs, req->ooblen);
+		}
+
+		req->oobbuf.in = engine_conf->oob_buf;
+	}
 
 	/* Finish a page read: check the status, report errors/bitflips */
 	ret = spinand_check_ecc_status(spinand, engine_conf->status);
@@ -360,7 +414,6 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 				      const struct nand_page_io_req *req)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
-	struct mtd_info *mtd = spinand_to_mtd(spinand);
 	struct spi_mem_dirmap_desc *rdesc;
 	unsigned int nbytes = 0;
 	void *buf = NULL;
@@ -403,16 +456,9 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 		memcpy(req->databuf.in, spinand->databuf + req->dataoffs,
 		       req->datalen);
 
-	if (req->ooblen) {
-		if (req->mode == MTD_OPS_AUTO_OOB)
-			mtd_ooblayout_get_databytes(mtd, req->oobbuf.in,
-						    spinand->oobbuf,
-						    req->ooboffs,
-						    req->ooblen);
-		else
-			memcpy(req->oobbuf.in, spinand->oobbuf + req->ooboffs,
-			       req->ooblen);
-	}
+	if (req->ooblen)
+		memcpy(req->oobbuf.in, spinand->oobbuf + req->ooboffs,
+		       req->ooblen);
 
 	return 0;
 }
@@ -421,7 +467,6 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
 				     const struct nand_page_io_req *req)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
-	struct mtd_info *mtd = spinand_to_mtd(spinand);
 	struct spi_mem_dirmap_desc *wdesc;
 	unsigned int nbytes, column = 0;
 	void *buf = spinand->databuf;
@@ -433,27 +478,17 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
 	 * must fill the page cache entirely even if we only want to program
 	 * the data portion of the page, otherwise we might corrupt the BBM or
 	 * user data previously programmed in OOB area.
-	 *
-	 * Only reset the data buffer manually, the OOB buffer is prepared by
-	 * ECC engines ->prepare_io_req() callback.
 	 */
 	nbytes = nanddev_page_size(nand) + nanddev_per_page_oobsize(nand);
-	memset(spinand->databuf, 0xff, nanddev_page_size(nand));
+	memset(spinand->databuf, 0xff, nbytes);
 
 	if (req->datalen)
 		memcpy(spinand->databuf + req->dataoffs, req->databuf.out,
 		       req->datalen);
 
-	if (req->ooblen) {
-		if (req->mode == MTD_OPS_AUTO_OOB)
-			mtd_ooblayout_set_databytes(mtd, req->oobbuf.out,
-						    spinand->oobbuf,
-						    req->ooboffs,
-						    req->ooblen);
-		else
-			memcpy(spinand->oobbuf + req->ooboffs, req->oobbuf.out,
-			       req->ooblen);
-	}
+	if (req->ooblen)
+		memcpy(spinand->oobbuf + req->ooboffs, req->oobbuf.out,
+		       req->ooblen);
 
 	if (req->mode == MTD_OPS_RAW)
 		wdesc = spinand->dirmaps[req->pos.plane].wdesc;
diff --git a/include/linux/mtd/nand-ecc-sw-bch.h b/include/linux/mtd/nand-ecc-sw-bch.h
index 9da9969505a8..c4730badb77b 100644
--- a/include/linux/mtd/nand-ecc-sw-bch.h
+++ b/include/linux/mtd/nand-ecc-sw-bch.h
@@ -18,6 +18,8 @@
  * @code_size: Number of bytes needed to store a code (one code per step)
  * @calc_buf: Buffer to use when calculating ECC bytes
  * @code_buf: Buffer to use when reading (raw) ECC bytes from the chip
+ * @oob_buf: Buffer to use when handle the data in OOB area.
+ * @src_oob_buf: Pointer be used to store source OOB buffer pointer when write
  * @bch: BCH control structure
  * @errloc: error location array
  * @eccmask: XOR ecc mask, allows erased pages to be decoded as valid
@@ -27,6 +29,8 @@ struct nand_ecc_sw_bch_conf {
 	unsigned int code_size;
 	u8 *calc_buf;
 	u8 *code_buf;
+	u8 *oob_buf;
+	void *src_oob_buf;
 	struct bch_control *bch;
 	unsigned int *errloc;
 	unsigned char *eccmask;
diff --git a/include/linux/mtd/nand-ecc-sw-hamming.h b/include/linux/mtd/nand-ecc-sw-hamming.h
index c6c71894c575..88788d53b911 100644
--- a/include/linux/mtd/nand-ecc-sw-hamming.h
+++ b/include/linux/mtd/nand-ecc-sw-hamming.h
@@ -19,6 +19,8 @@
  * @code_size: Number of bytes needed to store a code (one code per step)
  * @calc_buf: Buffer to use when calculating ECC bytes
  * @code_buf: Buffer to use when reading (raw) ECC bytes from the chip
+ * @oob_buf: Buffer to use when handle the data in OOB area.
+ * @src_oob_buf: Pointer be used to store source OOB buffer pointer when write
  * @sm_order: Smart Media special ordering
  */
 struct nand_ecc_sw_hamming_conf {
@@ -26,6 +28,8 @@ struct nand_ecc_sw_hamming_conf {
 	unsigned int code_size;
 	u8 *calc_buf;
 	u8 *code_buf;
+	u8 *oob_buf;
+	void *src_oob_buf;
 	unsigned int sm_order;
 };
 
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 3aa28240a77f..23b86941fbf6 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -312,9 +312,13 @@ struct spinand_ecc_info {
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure
  * @status: status of the last wait operation that will be used in case
  *          ->get_status() is not populated by the spinand device.
+ * @oob_buf: Buffer to use when handle the data in OOB area.
+ * @src_oob_buf: Pointer be used to store source OOB buffer pointer when write
  */
 struct spinand_ondie_ecc_conf {
 	u8 status;
+	u8 *oob_buf;
+	void *src_oob_buf;
 };
 
 /**
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
