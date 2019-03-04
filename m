Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F71C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:11:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0529F206B6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:11:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LszJU5rO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="A9qcx+qu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0529F206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zVcSWZknnr7egCG7fJQl77IAi2rt0/Goz1/b2Eld+f8=; b=LszJU5rOHwpIiA
	2ARWkz3CgORyXYWWRlAj+h5nSDeqK717dENQlpL3iHl/qh/u+8bxUvk6AF9lgcPSOBFW98K2j5kWb
	sZzAm9dXaV/AuL56xaT5c5uouxIs/QzngeS2vHiYhBceWnglGfXFQm6yrlWzVHVKBxHA9v4RGdL/A
	XkQfQ2Unim5RYEzUaoB3BBZrgp4+e4sUqzx9TdmVQve7l4IMnDQlGrQM3QbqL0O0CnVofLSQJF60m
	+YEPlFj5S6Fxh2ARY5IzpPRken+slYyn6/5WgbzIt1lpk6lG5AXZAnS9is5CuGpeW+/0b0lXgyDn6
	2y7avkTM8gJw9BadhogA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0wkG-0008Kz-8M; Mon, 04 Mar 2019 23:11:40 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0wjR-0007DE-2P; Mon, 04 Mar 2019 23:10:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hiqpnzy7BGoIAaPQncXhQxbROW5TComNop1PY07IZnA=; b=A9qcx+quV4xSkccePH/VFXvp2b
 tQvmfhAE+Std5iatPX53Lul5dmKpPhoOCvwdxRj1tzrVWRv5ubHDeYKl66YKLJ+P5KMmzMAr/VwtS
 GiiBkYDi5H8HIBz16Q0WGP7lVMDHqEHP2icnA2t9VFgs/A7r9nC1UWA3Feb/vesYSip6J4WRRkNmn
 sTLXD2I3QOqFZCu8z96fXXqYST/AxOu5rTQKEIqw6JgzIs5/ygOCJnIXBO++8dff9CWYyg4rnv0VZ
 so1liIjYrGNMN7SmnVf1TTqGH5zFH2Ha1F6uI4O9hxOo+dBBi+Gw+c7/F9xtxIqwHon10rD8PEHzY
 Dbv3odiw==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w7z-0001FI-SQ; Mon, 04 Mar 2019 22:32:08 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 9DDAA240005;
 Mon,  4 Mar 2019 22:31:41 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 34/36] mtd: nand: Add helpers to manage ECC engines and
 configurations
Date: Mon,  4 Mar 2019 23:28:39 +0100
Message-Id: <20190304222841.13899-35-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_173208_159217_6BABEDE7 
X-CRM114-Status: GOOD (  16.81  )
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
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add the logic in the NAND core to find the right ECC engine depending
on the NAND chip requirements and the user desires. Right now, the
choice may be made between (more will come):
* software Hamming
* software BCH
* on-die (SPI-NAND devices only)

Once the ECC engine has been found, the ECC engine must be
configured.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/core.c  | 124 +++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h |   4 ++
 2 files changed, 128 insertions(+)

diff --git a/drivers/mtd/nand/core.c b/drivers/mtd/nand/core.c
index 0a2be5e6d669..bed8977d94da 100644
--- a/drivers/mtd/nand/core.c
+++ b/drivers/mtd/nand/core.c
@@ -207,6 +207,130 @@ int nanddev_mtd_max_bad_blocks(struct mtd_info *mtd, loff_t offs, size_t len)
 }
 EXPORT_SYMBOL_GPL(nanddev_mtd_max_bad_blocks);
 
+/**
+ * nanddev_get_ecc_engine() - Find and get a suitable ECC engine
+ * @nand: NAND device
+ */
+static int nanddev_get_ecc_engine(struct nand_device *nand)
+{
+	int provider;
+
+	/* Read the user desires in terms of ECC engine/configuration */
+	nand_ecc_read_user_conf(nand);
+
+	provider = nand->ecc.user_conf.provider;
+	if (provider == NAND_ECC_INVALID)
+		provider = nand->ecc.defaults.provider;
+
+	switch (provider) {
+	case NAND_ECC_NONE:
+		return 0;
+	case NAND_ECC_SOFT:
+		nand->ecc.engine = nand_ecc_get_sw_engine(nand);
+		break;
+	case NAND_ECC_ON_DIE:
+		nand->ecc.engine = nand_ecc_get_ondie_engine(nand);
+		break;
+	case NAND_ECC_HW:
+		pr_err("Hardware ECC engines not supported yet\n");
+		break;
+	default:
+		pr_err("Missing ECC engine provider\n");
+	}
+
+	if (!nand->ecc.engine)
+		return  -EINVAL;
+
+	return 0;
+}
+
+/**
+ * nanddev_put_ecc_engine() - Dettach and put the in-use ECC engine
+ * @nand: NAND device
+ */
+static int nanddev_put_ecc_engine(struct nand_device *nand)
+{
+	switch (nand->ecc.ctx.conf.provider) {
+	case NAND_ECC_HW:
+		pr_err("Hardware ECC engines not supported yet\n");
+		break;
+	case NAND_ECC_NONE:
+	case NAND_ECC_SOFT:
+	case NAND_ECC_ON_DIE:
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+/**
+ * nanddev_find_ecc_configuration() - Find a suitable ECC configuration
+ * @nand: NAND device
+ */
+static int nanddev_find_ecc_configuration(struct nand_device *nand)
+{
+	int ret;
+
+	if (!nand->ecc.engine)
+		return -ENOTSUPP;
+
+	ret = nand_ecc_init_ctx(nand);
+	if (ret)
+		return ret;
+
+	if (!nand_ecc_correction_is_enough(nand))
+		pr_warn("WARNING: %s: the ECC used on your system is too weak compared to the one required by the NAND chip\n",
+			nand->mtd.name);
+
+	return 0;
+}
+
+/**
+ * nanddev_ecc_engine_init() - Initialize an ECC engine for the chip
+ * @nand: NAND device
+ */
+int nanddev_ecc_engine_init(struct nand_device *nand)
+{
+	int ret;
+
+	/* Look for the ECC engine to use */
+	ret = nanddev_get_ecc_engine(nand);
+	if (ret) {
+		pr_err("No ECC engine found\n");
+		return ret;
+	}
+
+	/* No ECC engine requested */
+	if (!nand->ecc.engine)
+		return 0;
+
+	/* Configure the engine: balance user input and chip requirements */
+	ret = nanddev_find_ecc_configuration(nand);
+	if (ret) {
+		pr_err("No suitable ECC configuration\n");
+		nanddev_put_ecc_engine(nand);
+
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nanddev_ecc_engine_init);
+
+/**
+ * nanddev_ecc_engine_cleanup() - Cleanup ECC engine initializations
+ * @nand: NAND device
+ */
+void nanddev_ecc_engine_cleanup(struct nand_device *nand)
+{
+	if (nand->ecc.engine)
+		nand_ecc_cleanup_ctx(nand);
+
+	nanddev_put_ecc_engine(nand);
+}
+EXPORT_SYMBOL_GPL(nanddev_ecc_engine_cleanup);
+
 /**
  * nanddev_init() - Initialize a NAND device
  * @nand: NAND device
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 3498d22fe893..b3a5506a891b 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -832,6 +832,10 @@ bool nanddev_isreserved(struct nand_device *nand, const struct nand_pos *pos);
 int nanddev_erase(struct nand_device *nand, const struct nand_pos *pos);
 int nanddev_markbad(struct nand_device *nand, const struct nand_pos *pos);
 
+/* ECC related functions */
+int nanddev_ecc_engine_init(struct nand_device *nand);
+void nanddev_ecc_engine_cleanup(struct nand_device *nand);
+
 /* BBT related functions */
 enum nand_bbt_block_status {
 	NAND_BBT_BLOCK_STATUS_UNKNOWN,
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
