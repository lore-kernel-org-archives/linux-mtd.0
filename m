Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835F8C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 14:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zBnZCCv7HwK3L+6gBcG1TwzR3OeCIwQBO6NHRgO+24c=; b=4OYcGPY6QANyUZ
	WiIKnjw7Ecc61gZ0BsIPsflK/T6idGYvst8dDp3cEKGmT4YdhxQNL0k6dpu1AzDFEgJx225lHYauE
	v5+nXqeE4mKYVKXmMcM82wAQxEjnEuPEW3iaGr+wJnRJxIBUTOVeYpMxFZxd3/sAaobEs2i0V/Fat
	C+3jnFxi2Nij2aPeR5eKl12BWCLVPphSVWvdbXbHYsNK5GtAkMxGH35F0ckBRdtCPUZspixXAZr7G
	BPgZjEb6V3TAeW4NcDwE179CxKGaKZCEkiROd+lClySIBnIElQE8PpbGAPTABgqzMLHCVuGbsMwcQ
	gFxE4xqEMoy1dEYA0W4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGkB-00FkDa-7C; Wed, 02 Feb 2022 14:36:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFGiQ-00FjQP-Tm
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 14:34:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6D2E2B83105;
 Wed,  2 Feb 2022 14:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01CC1C004E1;
 Wed,  2 Feb 2022 14:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643812472;
 bh=ywODHyZvr4uDCNLDWnyy/wFBe/QUgJIEv5BgzUusVhA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CoYqljuXD5PJ4L3DlFIrL0x+dd8eQtJ9jNCxkJH2dtkklC9ub/QL+NNJv12uxKZIV
 O3NOj3V8xxAYsIfTGnn+pk6mzsjLqnUpDdiKbyWsffJ9c4QWcKZ0Al/GPhvfvgNDFp
 TvC4aq4lecskqpA/GEDUg+mUZnbqXlyWIW66oLsclngE7MMaeCQIPxpG6/uTCCRdu7
 dgJlMqftocc/KDBYA10pdkNDjQszuIwXM+Bif7+sDDqRts1KtbKXb3+jSidRxC1maV
 /zohwX2QPbgRH/GnsLVpgeX3fp8t64Oj8LZqg4iI3FUR1twnKR9gh11gNTBuidXp7z
 Lr5ZeiihZmCUA==
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 2/3] mtd: mchp23k256: Add SPI ID table
Date: Wed,  2 Feb 2022 14:34:03 +0000
Message-Id: <20220202143404.16070-3-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202143404.16070-1-broonie@kernel.org>
References: <20220202143404.16070-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496; h=from:subject;
 bh=ywODHyZvr4uDCNLDWnyy/wFBe/QUgJIEv5BgzUusVhA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+pZayVTWdvTpAtGCF4CVvotVY1ZqUYJOAX7Wx8vF
 wmM6A66JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfqWWgAKCRAk1otyXVSH0J0xB/
 wK21S+Sut5GuU1JWUvHh4sfSD6QVuea89oc9uFzrbKLa4+6ofyJJgwwvhmrd5iBUOv+Op/SRDBdcJJ
 cqMuPvRA21XS97EPBnC1R7fFw/VmlgavOuZO8uF9KRHCNIJW+9Io84l9Rc34QMo1b5f2xpjq7hT2zT
 uv1HY7LATyk6VqspVZXekTWpRcZfkFy+yeWJzTNn3PJkZsF64eGnsTdBO6UdwSnHU+ktfwCxaViFvd
 KsuGbF+A7ct9lmngbcnf7+2oyRrBtp7ra1mVkpKv97jPK1m8n3VtJ0M9urGzZujywsJAE25/BXZ83p
 OZn1ZxNFfJ5+wrhGBHeMub169ZlFIj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_063435_154709_A6BB421F 
X-CRM114-Status: GOOD (  14.21  )
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
index a8b31bddf14b..1a840db207b5 100644
--- a/drivers/mtd/devices/mchp23k256.c
+++ b/drivers/mtd/devices/mchp23k256.c
@@ -231,6 +231,19 @@ static const struct of_device_id mchp23k256_of_table[] = {
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
@@ -238,6 +251,7 @@ static struct spi_driver mchp23k256_driver = {
 	},
 	.probe		= mchp23k256_probe,
 	.remove		= mchp23k256_remove,
+	.id_table	= mchp23k256_spi_ids,
 };
 
 module_spi_driver(mchp23k256_driver);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
