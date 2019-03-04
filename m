Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A22C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 22:47:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 744EC2070B
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 22:47:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qmqcgvdY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Dj4GG8xc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 744EC2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkZYcgvvwMyPvEHrIms35Cr5zZJ0wFycmFIE+jfTJwM=; b=qmqcgvdYl2Zmq3
	pPv/4CrnZMONTPU3okiabW4VipD90f0wgOa7CId3p7L2iFZ/Zj9qBqBw6X/I+Yuc1gCmAWaMbLTUu
	oyJNhoXqvpAKsNH8cLNYkye1KGZmVCr2w4nFAPbRrBj6H8R51yoZIMo963ioefMAoJnZHz4OT54Ey
	RHmqLjNjMmPiGr/tY4mxHDPky+2w/kdxQlX25eUsbG3D8H+V+jLevZMK+fq6UmuEvfDRIUb2U36MH
	B7kgrf1pfHpfFLlFw7LHxSS+gDsYZQR/3q+mkC2O9/skbduiSMgWSyuukmD9/ezlXjMNp1s7GjLJM
	c0nU7ElDAe77vRv2sHWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0wN8-0001BQ-EB; Mon, 04 Mar 2019 22:47:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0wMc-0000N8-FX; Mon, 04 Mar 2019 22:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=53XGvWDhq0brHM6dOoHRXDWS7tUPlxpjkXeW7xiDiv4=; b=Dj4GG8xc17rjLxb8vGLXKvCXvT
 p84wns8B2AlfQKw897yezk62akq6W1ojg8FcO/L+9+CGh2uqT/79FOgA/K/jnNPSymQvH0SFrsofk
 lUECs9TuKmu0eVrJPyHBJCRD2QCftMUVdabZSa2Av7cEd768jI4D3vovWc5ERKqR9G/u0aiegH5K9
 52+FkVDcmu0x4CgNdqlv4vOEfEdpNl2HKMVYVg2RpgRhq2ms4ynV2OqVoTCItdvUUd+tzhfYBC9Uo
 MiprIQhi5zjeRINyHTxtx2iB3LEjG9qSvJj9ezG7slNfXZtQcsZVq/Oe/bhEF1wpY3/tcqyC8xB8Y
 gH5ZxXlw==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w77-00039A-7S; Mon, 04 Mar 2019 22:31:15 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B7269240008;
 Mon,  4 Mar 2019 22:30:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 23/36] mtd: nand: ecc: Let the software BCH ECC engine be a
 module
Date: Mon,  4 Mar 2019 23:28:28 +0100
Message-Id: <20190304222841.13899-24-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_223113_290768_AB570935 
X-CRM114-Status: GOOD (  12.70  )
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

There is no reason to prevent the software BCH ECC engine
implementation to be compiled as a module, so change the 'bool' into a
'tristate'.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc/Kconfig        | 6 +++++-
 include/linux/mtd/nand-ecc-sw-bch.h | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/ecc/Kconfig b/drivers/mtd/nand/ecc/Kconfig
index 7be48a7efda0..a9ab9bab252c 100644
--- a/drivers/mtd/nand/ecc/Kconfig
+++ b/drivers/mtd/nand/ecc/Kconfig
@@ -15,7 +15,7 @@ config MTD_NAND_ECC_SW_HAMMING_SMC
 	  The original Linux implementation had byte 0 and 1 swapped.
 
 config MTD_NAND_ECC_SW_BCH
-	bool "Software BCH ECC engine"
+	tristate "Software BCH ECC engine"
 	select BCH
 	select MTD_NAND_ECC
 	default n
@@ -25,4 +25,8 @@ config MTD_NAND_ECC_SW_BCH
 	  ECC codes. They are used with NAND devices requiring more than 1 bit
 	  of error correction.
 
+	  If you are booting from NAND and need the BCH engine in order to mount
+	  your filesystem, then do not select =m for this option unless you have
+	  an initramfs.
+
 endmenu
diff --git a/include/linux/mtd/nand-ecc-sw-bch.h b/include/linux/mtd/nand-ecc-sw-bch.h
index 509723870fc8..e72f781829c8 100644
--- a/include/linux/mtd/nand-ecc-sw-bch.h
+++ b/include/linux/mtd/nand-ecc-sw-bch.h
@@ -33,7 +33,7 @@ struct nand_ecc_sw_bch_conf {
 	unsigned char *eccmask;
 };
 
-#if defined(CONFIG_MTD_NAND_ECC_SW_BCH)
+#if IS_REACHABLE(CONFIG_MTD_NAND_ECC_SW_BCH)
 
 int nand_ecc_sw_bch_calculate(struct nand_device *nand,
 			      const unsigned char *buf, unsigned char *code);
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
