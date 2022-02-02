Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E7CC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 14:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LtiCvnokhQnOYqgYNZKy/7rvAmImz0o56p1ivJfp8Vw=; b=hK1st2ceBGNsG9
	aeNjAQZaabwMePPqbCLeV5L9ruevvr3Fu/uYeJhnDfiN3paZmPjJsDPKHOz9xBbvk/v975yRU5B+t
	h+1P/m0zNNr1NpwrGNsfamZwwS0GS2LzuZ+Pc9Z1Xn5gXfxFfAvC6U+NEz73aiKFRzCcUVh7/0FJg
	IJWKauDgx54ljJplWOUJfRf5cW4QR5RoiBFWz+RKtsoRhB3HaSX2b/TH4FcQXuH06B40ZocvBfS/x
	VnFtYQDOv9xHJqx3ff211Ol88f6SfjlSlbP6tpnKHzMnDiHyowJ41irCiiOvxZNAdVDUmYxY93BWo
	Bz0JcIVeiYjdAkV83b3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGjf-00Fjzi-NQ; Wed, 02 Feb 2022 14:35:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFGiQ-00FjQj-Vk
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 14:34:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8028D618CB;
 Wed,  2 Feb 2022 14:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7742C340EB;
 Wed,  2 Feb 2022 14:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643812473;
 bh=IxTZ/tiEL4nTjsVIQha26qOnUAwNRPSmZV3wz4dDNyA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JOO72JXWIJPJRIkfhCvW4Hr4/IhvRM10tUJoGoBFd8uViZjok7XFYB0S6xsVMltiq
 B12HfLK7ILfTZdwHHAMoMhN/CI7c8z++Bp2rTcaAHBLFaEyu3yRIRZNFonc5ur568P
 /tXsxWftHUZdZvGKiTsxeCUajspH/MET0Qyu0RxqZr/IykOWW/NjcyJovU5rUT3w+0
 73beBHqjZJdoInQG218VYH8womSV8+EFqe9xGR+uCVfJT0m6O615KhrBftYZSTGYkG
 JlJjkG7ikPTkWjLpRMdV0tXOLPyM+BuCzPUZe3Gsyjn5t252XJ3wYJ5dYOzDlP6nzX
 4y45vs2LfyN7A==
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 3/3] mtd: mchp48l640: Add SPI ID table
Date: Wed,  2 Feb 2022 14:34:04 +0000
Message-Id: <20220202143404.16070-4-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202143404.16070-1-broonie@kernel.org>
References: <20220202143404.16070-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1392; h=from:subject;
 bh=IxTZ/tiEL4nTjsVIQha26qOnUAwNRPSmZV3wz4dDNyA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+pZaSAO8tY7W4fjhYI6nAkJ5IF9EctUuCGwWgFvK
 zXkXCIaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfqWWgAKCRAk1otyXVSH0M6QB/
 9Hl/dKBZy2fVxUR5CRb4ZDT2bsDRfRhYm5veLvgAHHaivCr2BLOd/npoEu3ZVjZv1uqcJlCKNXUnqP
 yLLhi1av2lltKn6ZPNF44Q98/Hk/Tbi6A/m++WIU9Fv4oY+KC+SYIsDsiIx3Hwtg8rsRLcSkf2F+Ly
 MPBkULUbheBOctaeKqjaBXEBX/tJG1Ac1SbuerInyKXjRNE+l+Vm62cYYU9E8IvXoBDFczkmF+Zvhv
 h52wl7BUJojRBrb/w6rUDdy65zqJPP6Ufm0nyTSvofi03ZdDMDiiB3xJ4uWP6UnC0EeLGkQgZiAS48
 liIjc3LDu9yYZrjdZ/PkFAn+jhJ4uP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_063435_130886_67F88D09 
X-CRM114-Status: GOOD (  14.65  )
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
index 231a10790196..b9cf2b4415a5 100644
--- a/drivers/mtd/devices/mchp48l640.c
+++ b/drivers/mtd/devices/mchp48l640.c
@@ -359,6 +359,15 @@ static const struct of_device_id mchp48l640_of_table[] = {
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
@@ -366,6 +375,7 @@ static struct spi_driver mchp48l640_driver = {
 	},
 	.probe		= mchp48l640_probe,
 	.remove		= mchp48l640_remove,
+	.id_table	= mchp48l640_spi_ids,
 };
 
 module_spi_driver(mchp48l640_driver);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
