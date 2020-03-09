Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCCFC10F29
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 11:55:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5CDA2051A
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 11:55:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u2IEabCG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eO/c66Jo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5CDA2051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2Z16j2KPwPXViWIfFhLRCWs+aZfxoGpqgxxJgTTFuuk=; b=u2IEabCGMob4ZJVG8hEuEfDzqs
	v312Nm73P4Fw0olwbFtO9n+xTIauH2ddiDGPtQ1DpLISHicCidWKSzNSlxByQZpojRqH+hFtZ2YWz
	/ZJpkFtdHe+tys7nyzOGQUiLTfISTR3mmp+qWS+fYLgkbZEhO8c9Tlpjqxjmq4Yw7/iW3WhYtB8tx
	olHMiz+FEcIJEEzKS8iLR0XIQ+3UvdxARwia3xF3HCA+w2tRsP44bW/skmUoGg6LVJEX1eha5Sa0O
	i5J+S1iQi++tGP6uFWp3DB2HCfu5Bj0vrh8sq8ypkFyA9pgHhTaXNuErf1/Fr0bKgzb5n9M28KKCK
	X3HHmaDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBH0V-0007Tl-TN; Mon, 09 Mar 2020 11:55:39 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBH0S-0007S4-N7
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2020 11:55:38 +0000
Received: by mail-wr1-x441.google.com with SMTP id z15so10729953wrl.1
 for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2020 04:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=M993Xxg570Z0qNth+AfgZmhK2IPDaBi6vXhUHO9PeJw=;
 b=eO/c66Jo81J/h9ylI6Ij1ZV0ARuX3/K0UAZVUQUJqiOUYNav6uE9nWVryGj+MBba/W
 frXDBER5dI38Itmdq0khKT4tHhUV2rTFwLxqXtcA5L757P2+XLssy9O+49t4t0zjgNBi
 izCnaPHtVtfo2ICtwH6ELMf3/4KzGZgE5WjgFhv5ghduyjCWhv741drHquSecGHVbNFN
 14uEa8ig0tGAP1qmsPBrjr9xz3eR7Vhl2m9dr5dWm4trmSggnMANF/pzTkTJBC4xUgTh
 rFJD0vXviJJd78OFgGvOXZGExzuXGanziNOVMO9mp/C7ncac/hYLRGniZH9k5irvhB17
 OTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=M993Xxg570Z0qNth+AfgZmhK2IPDaBi6vXhUHO9PeJw=;
 b=H9WTx/A+Jn+TAIbo/9G6SkC7wzMKIp8UDoJ8hqkM1E7MYiTDhnakw6ULCEVEVCp1P2
 UtZ5jBbkBwCcaGjI7feqH5Ps9Y4J1s6y+fw/ySxxqbB2bo+XiZJ1axgT3NpdrU/Q0CvX
 vVjxKxypKHWUClHiLshKFiElGrDKPsM5OM7bX3P8BAuA2xchmtHXrQUwKC4WeMikwv7n
 cszpNwzhY2Hxora6TPjm+41kEo1jbD77XmZwXABqh8lIRq2yWtEo66m41f/RmqLS7Neb
 THeD597+cOU0aO/6kIFcgjgRQoBmKk4saWhKoGuohLI/bfvt8Mpuy0sQz4va4RQk4HZG
 VeyQ==
X-Gm-Message-State: ANhLgQ3TmuEoADWyoa72M49TMb/8eWFyXGXg8UhuqCaPEkM4vUc4RRmU
 I/mBVK1nH+q45slYPJ77EtM=
X-Google-Smtp-Source: ADFU+vsR4Ug2gciCuv+leVePyOHBqCXxvpvAEDC06Ybpr79hKygWqzH/+wTxC+MaiX9GNEOEilzuNA==
X-Received: by 2002:adf:f584:: with SMTP id f4mr21816282wro.77.1583754934751; 
 Mon, 09 Mar 2020 04:55:34 -0700 (PDT)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id m21sm25035226wmi.27.2020.03.09.04.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 04:55:34 -0700 (PDT)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/6] mtd: spinand: micron: Generalize the OOB layout
 structure and function names
Date: Mon,  9 Mar 2020 12:52:25 +0100
Message-Id: <20200309115230.7207-2-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309115230.7207-1-sshivamurthy@micron.com>
References: <20200309115230.7207-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_045536_758250_58A33D5C 
X-CRM114-Status: GOOD (  11.64  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Shivamurthy Shastri <sshivamurthy@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

In order to add new Micron SPI NAND devices, we generalized the OOB
layout structure and function names.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/spi/micron.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 7d7b1f7fcf71..c028d0d7e236 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -34,38 +34,38 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
-static int mt29f2g01abagd_ooblayout_ecc(struct mtd_info *mtd, int section,
-					struct mtd_oob_region *region)
+static int micron_8_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
 {
 	if (section)
 		return -ERANGE;
 
-	region->offset = 64;
-	region->length = 64;
+	region->offset = mtd->oobsize / 2;
+	region->length = mtd->oobsize / 2;
 
 	return 0;
 }
 
-static int mt29f2g01abagd_ooblayout_free(struct mtd_info *mtd, int section,
-					 struct mtd_oob_region *region)
+static int micron_8_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
 {
 	if (section)
 		return -ERANGE;
 
 	/* Reserve 2 bytes for the BBM. */
 	region->offset = 2;
-	region->length = 62;
+	region->length = (mtd->oobsize / 2) - 2;
 
 	return 0;
 }
 
-static const struct mtd_ooblayout_ops mt29f2g01abagd_ooblayout = {
-	.ecc = mt29f2g01abagd_ooblayout_ecc,
-	.free = mt29f2g01abagd_ooblayout_free,
+static const struct mtd_ooblayout_ops micron_8_ooblayout = {
+	.ecc = micron_8_ooblayout_ecc,
+	.free = micron_8_ooblayout_free,
 };
 
-static int mt29f2g01abagd_ecc_get_status(struct spinand_device *spinand,
-					 u8 status)
+static int micron_8_ecc_get_status(struct spinand_device *spinand,
+				   u8 status)
 {
 	switch (status & MICRON_STATUS_ECC_MASK) {
 	case STATUS_ECC_NO_BITFLIPS:
@@ -98,8 +98,8 @@ static const struct spinand_info micron_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&mt29f2g01abagd_ooblayout,
-				     mt29f2g01abagd_ecc_get_status)),
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
 };
 
 static int micron_spinand_detect(struct spinand_device *spinand)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
