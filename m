Return-Path: <SRS0=Ceh7=ON=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B8FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Sep 2021 19:50:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E7A66124B
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Sep 2021 19:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E7A66124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CscGYCFGc6VPQ6KDOKj1Jf5WLT2Gj4Z/3vVwxfN563w=; b=m3wHOuKjKow1MF
	JN5l7V6x5e20fqKJBqPuJNybyYULw34eZ448Q1Zvl5Hel5tF9kKN4VSXuOYDYc9hDlMp6jPbo/AMs
	+yxIt19ZY2IB1XJyhoM8rzuYIwSZtyG9gzQ6uDqrrvTihtPC7X7mmhyQJUkiZXPU/71ovRcaOinHh
	3MLMnEAaZBhqlXf8Kdy4R52UjOuwp63/XxWy8qHjRjg+U3kwUdKt/jPCQMd+HwHEgOeT/Ajbb6l97
	mptTal6QgDgKK42Zo3NNi67kvVzADgxyI+iurQqIl1BVe7l1qfjVyyc3CSHtv+EfYH/cQjJActXrt
	/58U87+/9ig1+cVInsvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTUjY-00CV8h-HB; Thu, 23 Sep 2021 19:50:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTUiz-00CUyQ-IO
 for linux-mtd@lists.infradead.org; Thu, 23 Sep 2021 19:49:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B71A861241;
 Thu, 23 Sep 2021 19:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632426581;
 bh=bdQO08O6g0IoaN+9mdtjAVzDklEYuRkz6lGOGOOn2RA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SQ5EIiOpFHVhnTdcDKYulrJ9gpkBAaElSE13F7x2LA1MCqxdZQDKSC3LBNEYVqgd3
 G846hAjIijx4SaFdwIZul1d5flJ+DZMwaFvH8FKJH0hBbwoyDuBkO1A24dwN++TSYs
 Ua0FXhMH9kDx/fLWhMrXMCRh6YfVnGqVX51cNGNqjMSnUUeaIA8cCTVTzkMj8J7zwQ
 3lH0HBqTdRPj3gDlfJVEjqypZESa+/sTYySzBmDmFaJBQxj0M/qCwZWNqKsfiiBGKs
 gZFT+johzQkedTLMxIRkp8v00xp8Krvyc7uVpj7gGdKLLr1oWMiDl6upI/fNsW0nhn
 uwb6GRgocBguA==
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 2/3] mtd: mchp23k256: Add SPI ID table
Date: Thu, 23 Sep 2021 20:48:26 +0100
Message-Id: <20210923194827.53229-3-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210923194827.53229-1-broonie@kernel.org>
References: <20210923194827.53229-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496; h=from:subject;
 bh=bdQO08O6g0IoaN+9mdtjAVzDklEYuRkz6lGOGOOn2RA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhTNoJguRuGWtdAzoaVkZBh0v9FcwMnvC2YSqQJse4
 hpzbhLiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUzaCQAKCRAk1otyXVSH0KAeB/
 4i7D7Ml4W/QOFdA7tVgDmJ37VuOmogiF9n5rMSP0CLXCI44ji1GC0YJoboTBnzOBf/RoS5+H2Uv6DS
 da8AssUO9O5lTFoegD2BuhSJahssztK5mSOi5zb/XjmdrRpmXGBHRpQx8zVTrkzv2Zdob54Ww2vuoZ
 GchskeWT0sxZytuCVmcOOZHAmA9VCXz8CBuvGoF569vBedtMoEEQyrvRo32oPVpSaI8huJgqtwrfrL
 C1Vh7V5BTaIsVM864f5jk4iMmAzVD1oWS2lgzxbBMNtz5CKKlNxkrir1DypWpbaISV0xJjrBVA7FPW
 tJrgFV9lANU20VfkS4X++Ck6ga9MwF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_124941_679966_09B15F6D 
X-CRM114-Status: GOOD (  12.04  )
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

Currently autoloading for SPI devices does not use the DT ID table, it uses
SPI modalises. Supporting OF modalises is going to be difficult if not
impractical, an attempt was made but has been reverted, so ensure that
module autoloading works for this driver by adding an id_table listing the
SPI IDs for everything.

Fixes: 96c8395e2166 ("spi: Revert modalias changes")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/mtd/devices/mchp23k256.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
index 77c872fd3d83..7d188cdff6a2 100644
--- a/drivers/mtd/devices/mchp23k256.c
+++ b/drivers/mtd/devices/mchp23k256.c
@@ -229,6 +229,19 @@ static const struct of_device_id mchp23k256_of_table[] = {
 };
 MODULE_DEVICE_TABLE(of, mchp23k256_of_table);
 
+static const struct spi_device_id mchp23k256_spi_ids[] = {
+	{
+		.name = "mchp23k256",
+		.driver_data = (kernel_ulong_t)&mchp23k256_caps,
+	},
+	{
+		.name = "mchp23lcv1024",
+		.driver_data = (kernel_ulong_t)&mchp23lcv1024_caps,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(spi, mchp23k256_spi_ids);
+
 static struct spi_driver mchp23k256_driver = {
 	.driver = {
 		.name	= "mchp23k256",
@@ -236,6 +249,7 @@ static struct spi_driver mchp23k256_driver = {
 	},
 	.probe		= mchp23k256_probe,
 	.remove		= mchp23k256_remove,
+	.id_table	= mchp23k256_spi_ids,
 };
 
 module_spi_driver(mchp23k256_driver);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
