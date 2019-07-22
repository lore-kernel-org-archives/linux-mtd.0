Return-Path: <SRS0=6YPz=VT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C88DC76188
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 06:01:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D05521955
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 06:01:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CiOyOIdn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qA6B8TEQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D05521955
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ECmeYJvqogdllhA0gt9D755GihC5T0blKPwkrU5L+ao=; b=CiOyOIdnrl0xHH
	dGtoUqMKvMRHAa+6bBFcLLbhXAo5AyK2xzLmtVEY+HoHrcgLElFbMbE+R8kLDWZZIjKTPdMtVP1Qy
	AOmjuFn00NXNyWsR4KxXuwYgmqAdAanHRz8KjrTYSZQjaNvmPMc/hls/GSY1mDZWprIyC62PPbMTC
	YM4PdrH97qlAqCNUQ3k3F7luiJMgxtWFqWzSiYQVbotHOC4tn3XjDVUKRql6rB5Q3gVIOzU2rsgIO
	URLIEnLziAkLH5rXvRBLlYUXiq4R6udyA0TTMtKFKXT8HpcvmJ9RtSlpOHWp25QQLY3zKNGBFnUol
	reuG0SlFGTfQYU74YLFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpROG-0002Lp-FS; Mon, 22 Jul 2019 06:01:40 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpRJu-0006B7-Uf
 for linux-mtd@lists.infradead.org; Mon, 22 Jul 2019 05:57:12 +0000
Received: by mail-ed1-x544.google.com with SMTP id r12so4687269edo.5
 for <linux-mtd@lists.infradead.org>; Sun, 21 Jul 2019 22:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=kwPXLWN6H/COBfq884oPFZycA/+QGtJcjDeTrXDDWXs=;
 b=qA6B8TEQd3lxAieBE5VShYd/sB2OekDZ7Wip64ey/4vmgfB2ZuTx5Ap++zZxQw2Bn2
 VnNdRK4E+Zl2U/nHs8h5fpJY7tlpaTP18X0yd/07GmFPqNW+JVuJJMDFcP9HspjEyNvc
 RpRpCL5sBViuPKHNPlChq6q5JBX3bpP9rqMaI0ypkwS4Pd1EtwU1CpAziFbkdwUG4LUK
 0EiMpQhWAJAqEWrjvSa+awIR5dWOr+cdHvzSNaaCy66Kpj1ZXhq2lIcORgD8Ym8d+rZZ
 6KPPC5qtiHV/EVhfWHBHAbfw6Mak4n6ZPBpI33URJsy2odYg4TlMSalo3jTmFMpORmwi
 CCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=kwPXLWN6H/COBfq884oPFZycA/+QGtJcjDeTrXDDWXs=;
 b=TcOL1s150WEW5OJQuYTYsdaO1C/Iy1kqodrhGzpZlXoLGoEIObcBfbnP5BJlM5RLn3
 PuXhNpRtezK6f/D6ngTd8BYDpQtPNLcHXT2ykVpi7D8JVjPq14Vqgkb4v1Dxxped7U6v
 E5QJV7u2QrRhJ78tOY8F2kwKfw9FX0cp/i50t6SB+XqSdO/Y0SED8Qisw6ta4EPm4Dej
 DbHHOBpBAaqW9veU39VfdiYS+84NbzdMYlAoL80SEi6aXA1A0S5GGEVSBR8Z2vA5+SlY
 PF460e3bFrP/dg9Bdwz4io3ETbTfHy6MP6Afn+D2bG4wdJG9+CzQdDzvf1oLloM1Z6LO
 RC3g==
X-Gm-Message-State: APjAAAWGTLGhDYmcRLLfXAscS4x9+vlpUGiZS4nIWPbFbpai/37AqSpt
 CvWyn8EQQcfjUnnhNvnzGt8=
X-Google-Smtp-Source: APXvYqwCtu9XPj5RwCf+z9IbEvNwKl31zZN+U2AKja8o8344MGFPPgPlXldvB082TO9Ayxm07z1GJQ==
X-Received: by 2002:a17:906:4bcb:: with SMTP id
 x11mr51998939ejv.1.1563775029720; 
 Sun, 21 Jul 2019 22:57:09 -0700 (PDT)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id a6sm10351725eds.19.2019.07.21.22.57.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 21 Jul 2019 22:57:09 -0700 (PDT)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Shivamurthy Shastri <sshivamurthy@micron.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jeff Kletsky <git-commits@allycomm.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 liaoweixiong <liaoweixiong@allwinnertech.com>
Subject: [PATCH 5/8] mtd: spinand: micron: prepare for generalizing driver
Date: Mon, 22 Jul 2019 07:56:18 +0200
Message-Id: <20190722055621.23526-6-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722055621.23526-1-sshivamurthy@micron.com>
References: <20190722055621.23526-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190721_225711_216789_CC8C215A 
X-CRM114-Status: GOOD (  11.74  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

Generalize OOB layout structure and function names.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
---
 drivers/mtd/nand/spi/micron.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 7d7b1f7fcf71..95bc5264ebc1 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -34,38 +34,38 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
-static int mt29f2g01abagd_ooblayout_ecc(struct mtd_info *mtd, int section,
-					struct mtd_oob_region *region)
+static int micron_ooblayout_ecc(struct mtd_info *mtd, int section,
+				struct mtd_oob_region *region)
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
+static int micron_ooblayout_free(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *region)
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
+static const struct mtd_ooblayout_ops micron_ooblayout_ops = {
+	.ecc = micron_ooblayout_ecc,
+	.free = micron_ooblayout_free,
 };
 
-static int mt29f2g01abagd_ecc_get_status(struct spinand_device *spinand,
-					 u8 status)
+static int micron_ecc_get_status(struct spinand_device *spinand,
+				 u8 status)
 {
 	switch (status & MICRON_STATUS_ECC_MASK) {
 	case STATUS_ECC_NO_BITFLIPS:
@@ -98,8 +98,8 @@ static const struct spinand_info micron_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&mt29f2g01abagd_ooblayout,
-				     mt29f2g01abagd_ecc_get_status)),
+		     SPINAND_ECCINFO(&micron_ooblayout_ops,
+				     micron_ecc_get_status)),
 };
 
 static int micron_spinand_detect(struct spinand_device *spinand)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
