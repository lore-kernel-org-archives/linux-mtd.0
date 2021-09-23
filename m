Return-Path: <SRS0=Ceh7=ON=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29776C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Sep 2021 19:50:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC8C461241
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Sep 2021 19:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC8C461241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M9QI9zljbdNEJaYoj1f8I8FOmYotokTLtDe2DGxIQf8=; b=DA3PLJCJNeRLPn
	ydJw5TvK18Z/n/4/+e2MkECFoQCgPitdqRVq+nyIEDO2uviRBzWupoYGipqmdYJzSJWxXDdVFrEro
	WRIm4dyntv8HIuGghBaa3Kt/0LEERiN3+gHflRVLJpil51u1UcNkcdMiHBnhIpVti5dq/UADpyHIl
	SYy9P+hXRrykapvPohH30P1w6lhkXVWE913fNdPnaIELqdi6rkIcWgA9AnyphowMwtbZ0aJgZbKVn
	qYNaPd7MeGwaV/g6uBwXUaFAAA79oLJLnL7V/3MO5Eo1ZNOpcyjDTM+i7X4AuUglb4FTAWji6vQFn
	532TvptgdhKAEh1fx5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTUjG-00CV38-32; Thu, 23 Sep 2021 19:49:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTUix-00CUxQ-0z
 for linux-mtd@lists.infradead.org; Thu, 23 Sep 2021 19:49:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32F996124D;
 Thu, 23 Sep 2021 19:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632426578;
 bh=opI35Q9sbQzgJ/4oACHZNchwZwdqa6+M1cb7l0QGVcs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QVQNuGRt2VhBB/VayFtnokYLBnSG/AVRITXPuwNasrwjrkuOInqVf6FhZx1Nizxz3
 sIvuu5/Dz2LtWdYfRrgKru60jEwnLBa0xOaMTH4IStEzqs/ba7MFqFW2LH9xk81Uig
 yLu+Xtue6vseo34rsslEBnjtmnIpES2dzhMj963beWdMBD/V0XEClIvRvxRDpO35iM
 LqEL+PHdLOb44SorOkocA9PfYqzBwJDmYP0zdlwesR9jjAzJWYyD3+QgXUkJJpz5ZG
 vyxRV5mrLidS4sRGoKjIz/5fKY+xsMUNrfxwhZTRoegdEhQFBktrUy8cRIWAIlwbH2
 GE+jpxNZ4rTlQ==
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 1/3] mtd: dataflash: Add SPI ID table
Date: Thu, 23 Sep 2021 20:48:25 +0100
Message-Id: <20210923194827.53229-2-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210923194827.53229-1-broonie@kernel.org>
References: <20210923194827.53229-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1386; h=from:subject;
 bh=opI35Q9sbQzgJ/4oACHZNchwZwdqa6+M1cb7l0QGVcs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhTNoINTJowRAF4Nv/Glwnw07nvQ/r+IH6w3PsTsVu
 n09gJVGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUzaCAAKCRAk1otyXVSH0GIhB/
 40E8pKnY++J9O05TH9YE7ipxOI5phP1ScWyN16P8OfSt89lxGf/kJYNBLngDBceSJwAkz890KqRmAb
 pK+xMN6lLcCGbkHUWi/ezRrkF+YGZ0jzAef5OmjX5T2yNjVlg2QtMqyJ0lGgnNlyrDXxyVAFE84Wg3
 enc8UW1wULv4RYpC+1BkX3mM81v0mA+4XmpFMnoaSrBpYsD2S0ivHQLTt7a2r/GjrqcC/Jgz2APAJz
 sD3YlDAPaiWWCmLZ/X2hcxrjvJ/kPZheCQH4z3Uz8NAJB/Ly70abDFoGkrmmmVxADMjqILv28KNfc4
 Z3GZtEcQvB7ayhjZVKaSQarKRoW5H+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_124939_131122_11C206F6 
X-CRM114-Status: GOOD (  12.48  )
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
 drivers/mtd/devices/mtd_dataflash.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 9802e265fca8..9fc0146013ee 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -105,6 +105,13 @@ static const struct of_device_id dataflash_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, dataflash_dt_ids);
 #endif
 
+static const struct spi_device_id dataflash_spi_ids[] = {
+	{ .name = "at45", },
+	{ .name = "dataflash", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, dataflash_spi_ids);
+
 /* ......................................................................... */
 
 /*
@@ -930,6 +937,7 @@ static struct spi_driver dataflash_driver = {
 
 	.probe		= dataflash_probe,
 	.remove		= dataflash_remove,
+	.id_table	= dataflash_spi_ids,
 
 	/* FIXME:  investigate suspend and resume... */
 };
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
