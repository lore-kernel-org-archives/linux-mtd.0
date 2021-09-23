Return-Path: <SRS0=Ceh7=ON=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABA6C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Sep 2021 19:51:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAA1561241
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Sep 2021 19:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAA1561241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+rK/7FGYE+JkCuFPtXe7nBXczACbZ4Gerb3gdea0hI4=; b=RO+i4MqoxwzKo+
	ROFnOwwMNd/4DtGSmL+9iDqxQPu0gIFO/VMpElT7Ngri7KSpnnmndqSpjuvyqc4hWtHaw5KiVL7eH
	i4INGcohSjauHkPbW97fZHDsejxASHJjwk3znmbeo2y1IqV2VldRHemjum39gjt156pGsQ0p2hlFI
	VCMgLQ8EK35LcOrnYtO7jzfCV3bAzKJpAD/WOij4u7v7DWAUM504KgIpwckjF5iQJOSzDLPPI2CwY
	1Hn5gnVAY6K98EJu3m8tXNlDks1b6lM7Rt7kh/Qg6MuMa2D1f/XgRLkluT/PaMg6kCRQyzHLt1PnH
	DLa7164Xj1i2IRajm2rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTUk0-00CVHP-5m; Thu, 23 Sep 2021 19:50:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTUj2-00CUzR-3Y
 for linux-mtd@lists.infradead.org; Thu, 23 Sep 2021 19:49:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A0086124B;
 Thu, 23 Sep 2021 19:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632426583;
 bh=GQZhZesCbw2bnhDgtQfmS5zti9ScrxLGcSl4K6kGSZ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y07Klmg8mbhs5OzkHtlb6zOZJhlDmuvxkwgATbDglMKLk+5AZfnm8UDEUp9GZyvSM
 mj3Ebqx3cbhBZ2EylG8o+pcgdknC+/+WisYD/CPirUK7Q9w9WTIpSFVX+thLk8AD+t
 dnd5LrBPzxr/ytOQkL65pN7c5U8rl635u4cIuq5qGl03BzHcq+/3z5qLcxjxysmEAz
 HO2bq17EoTtbMy/St13wtR+KeVNQZQQRYBRtK6Vc0QMkW82VGcrYl5YD5VL5xqKVo+
 M/kwhe00kX7/qPJ/7330NWie672guDZZ2+16lYm+awHu9W7WMFjzueD+TJ/XvU+smU
 WZNzZ5q9Ih+2Q==
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 3/3] mtd: mchp48l640: Add SPI ID table
Date: Thu, 23 Sep 2021 20:48:27 +0100
Message-Id: <20210923194827.53229-4-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210923194827.53229-1-broonie@kernel.org>
References: <20210923194827.53229-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1392; h=from:subject;
 bh=GQZhZesCbw2bnhDgtQfmS5zti9ScrxLGcSl4K6kGSZ4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhTNoJNb6Qyq5PQE1x9jNzj+NLE5xA0RO6D08+XNT0
 XcvpgqaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUzaCQAKCRAk1otyXVSH0GP/B/
 0aETrWQgxF+UDEqV8olMnlI//j5fJDHFtRRgY4fORXSKxe/Q2wNePhWH+Y4N4v7n9wxAtq38ZLRfO3
 2DvmPGmtehcUrsK6iwp10l9/Rm8cWbgJ/an9PHZ+6dkdZ2PJJl1mjBXOqIDTy8GbI4gkYCpQKdyUft
 vNHIruV98pF8ecePliCSaLVSiHeZS2OUqbbbNuWpae49cmQxta7AOBMeXiZFH+fdPMe9F1qZl+Qoek
 1BeTtbHq3EMSoUUxNTnE1QZZ+z2h+BP21q9jjn3J/93LXcnNIh+pkvjcjFu90mpZa60KJPBhzkjH74
 BgkGUS00x6Ch5E4QL3HkB99ninMZh5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_124944_206161_0F54FE64 
X-CRM114-Status: GOOD (  12.66  )
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
 drivers/mtd/devices/mchp48l640.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/devices/mchp48l640.c b/drivers/mtd/devices/mchp48l640.c
index efc2003bd13a..3434322dad58 100644
--- a/drivers/mtd/devices/mchp48l640.c
+++ b/drivers/mtd/devices/mchp48l640.c
@@ -356,6 +356,15 @@ static const struct of_device_id mchp48l640_of_table[] = {
 };
 MODULE_DEVICE_TABLE(of, mchp48l640_of_table);
 
+static const struct spi_device_id mchp48l640_spi_ids[] = {
+	{
+		.name = "48l640",
+		.driver_data = (kernel_ulong_t)&mchp48l640_caps,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(spi, mchp48l640_spi_ids);
+
 static struct spi_driver mchp48l640_driver = {
 	.driver = {
 		.name	= "mchp48l640",
@@ -363,6 +372,7 @@ static struct spi_driver mchp48l640_driver = {
 	},
 	.probe		= mchp48l640_probe,
 	.remove		= mchp48l640_remove,
+	.id_table	= mchp48l640_spi_ids,
 };
 
 module_spi_driver(mchp48l640_driver);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
