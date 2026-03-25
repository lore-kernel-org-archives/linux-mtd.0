Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E85109C047
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2026 17:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oVMz2mAzNbv1p+jfw+2VjIKnegTgHzuuDWhErzptguA=; b=A1IAkdKX8lpEHA
	qQpzNJ2h8W83yDI6bfPbiAjstkJqfF5wIEjsdbHt82XTzTZJucG6CfEE7q6vFedAed5w9h3GSUyg9
	FA1f4IUB1NvT2/3GQLORTQ0Q6mKAAbvICXxCFw0ZUK6PfoTZqci2nPymnQobWiEIuC9EO/FCn/9B3
	6EyWjIezKYGbYbyKuoZhJheCygbP9vaX7EW9v221uTwcz6FctybxhRCA6+kDhsLPx/xS1w4uIGdBK
	wpRfb1qz7gTyqrpRctEWCDXJMUxF1JTls3KGuD4ZpjcHSRZkt0AjAqh1Q5sF7TCIp799WnmQudDla
	fxBFBqbng1K8Yrw59hEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RfC-00000003xd6-1m9A;
	Wed, 25 Mar 2026 17:05:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RfB-00000003xcw-0snz
	for linux-mtd@bombadil.infradead.org;
	Wed, 25 Mar 2026 17:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/NNlFm5wYdx/X/cIoEotMZfWV7mGMvMIKFK+lvElmOQ=; b=JYDUNZ/QwlI/9kmgQCbmUQCQfb
	nlJpvZQEGPAXz+B/38iLg32bbzMWdS7voNt1T/P8Oqgbzox7PwXdsFrqHVtAV7SgWmLps7cYFgB5L
	lqDTLMi1ieeFUHzP4GZ4Rsy10l5Ue+SNDWBAc2cQXUxdfXRunnQ9KNd4V0Q/U8/tPSB2aVaxTu+i+
	k/+KO1dH/YLep2DxmtfHHrkipGaU/RTipg5qvnpvlyg5yFd9dITerogdub5Oiu6I/jp/vTkqfOIbJ
	154biJCAOIU1y2ZKtI54zWX0k6skVF5fDRriuMiwxqmYrOIezFHGMSEsqzPqTH2pBsb+i6fLhTEuL
	A5E0AsDg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Rf8-00000006huc-1EEh
	for linux-mtd@lists.infradead.org;
	Wed, 25 Mar 2026 17:05:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5371DC580AE;
	Wed, 25 Mar 2026 17:05:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A8B2601E2;
	Wed, 25 Mar 2026 17:04:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4652210450E99;
	Wed, 25 Mar 2026 18:04:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774458295; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=/NNlFm5wYdx/X/cIoEotMZfWV7mGMvMIKFK+lvElmOQ=;
	b=upJpg+bkcB0DgFPqoDtr6gVAd+KCgjLlm1tuYIstDFTZjzQq7/Tl2s1jQNa7s7FKFLAnsx
	vTilrkaFf2NNmWqj00EKGhNB3I31sHOoacL3SSRNiQHMOYwv+cRkdyIyzLSE7DGpnt/U4q
	8sB8mQTDLmx5BcYWEnjb/GjYDKxgz2f5HDmdHrhQ1nhJW1hYIodWNaPRSDkZpSIb3KW24z
	pZCAmZyaidRZdl5ShGWdEA9wpj3TpekNknMDR1bhgXv0va8JLaoqFMmccTMzlXMlJAClQb
	X3hWyMhREg5DhSUKaFdkpk46iyHTvbsW/aIj9EWNR2dSuEzNQ4XCOCk400iCXQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: spinand: winbond: Declare the QE bit on W25NxxJW
Date: Wed, 25 Mar 2026 18:04:50 +0100
Message-ID: <20260325170450.1118324-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_170458_505739_ECA9086B 
X-CRM114-Status: GOOD (  10.73  )
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

Factory default for this bit is "set" (at least on the chips I have),
but we must make sure it is actually set by Linux explicitly, as the
bit is writable by an earlier stage.

Fixes: 6a804fb72de5 ("mtd: spinand: winbond: add support for serial NAND flash")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index e0138785e280..ad22774096e6 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -488,7 +488,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_dual_quad_dtr_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     0,
+		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&w25n01jw_ooblayout, NULL),
 		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg)),
 	SPINAND_INFO("W25N01KV", /* 3.3V */
@@ -552,7 +552,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_dual_quad_dtr_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     0,
+		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL),
 		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg)),
 	SPINAND_INFO("W25N02KV", /* 3.3V */
-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
