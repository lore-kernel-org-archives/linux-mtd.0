Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF55C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 14:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A/vwq131czsInzkheHxKsDqw07RJUo4Hn4I9T3muGOI=; b=ow6i9I+yNsfWLA
	LTwfzV1SANMy3o4s75STrGUmxhOGpBPT/KX4FnOgJCwTygHNAeEC0T+ugkqXYvoqgAwNJ+cl4dTKs
	ZjIPUvETVEdvj3+O8we6eSNkCHPAUH4GwkebgCjQPuT9wJPFcdn7WW7zY5rQDdbWZQA8mfiGEK68q
	4OYGrjrMtA5fGaeesNmSMyEidcnUabc4rrcuHM5FqVNcZnmNPFS2hhllVhWVvePohET9ERglQ/iaZ
	MJXaeMbrVn2pY9rT4UpDTzryDGNc7s17PqnBI2ekgLuHAdg/mLNGw2GUK91g0NsAVOpqS4fd0avvS
	jP8atYe7kq9AjjWEN5+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGjB-00Fjpk-74; Wed, 02 Feb 2022 14:35:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFGiN-00FjOA-Rd
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 14:34:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B02CC618D5;
 Wed,  2 Feb 2022 14:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F7B3C340EF;
 Wed,  2 Feb 2022 14:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643812470;
 bh=36df6yLJszbsCLq5lCoN34Rw+Z+PE/HwwKmISQqlVAU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gXCCtz3OxCSjc69uRkfmpTbJk/6Gyt256b37BlX4RU4MJTJMRTZBhvPPBlMPsCetn
 MQ7rqH7dcJAuQ0SG74d7i9wx7juWORN9Q7B1Z7Bwc9/T06WJp592tKfW7VIiYE7HkD
 nvzU8t+I8Ss1wb8Vof9ylFqQ1EAl/VHt0lrG0WW67dOLjnphqWGrN+LYy/f4WhpqWB
 OA6TN1EoTp8hi7rlnNBlLOFpO3i7a8zzpgDBm89vhgoPQcPBQaAPcdtJbS9zLqe5gR
 tdCe31P11/dF4OoPf6BXY4O1vQnWqqjyvFRt82od55PKeby8P3MA7xgYtsqGJ+zH+y
 I1HjIZSUzi2+A==
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 1/3] mtd: dataflash: Add SPI ID table
Date: Wed,  2 Feb 2022 14:34:02 +0000
Message-Id: <20220202143404.16070-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202143404.16070-1-broonie@kernel.org>
References: <20220202143404.16070-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1386; h=from:subject;
 bh=36df6yLJszbsCLq5lCoN34Rw+Z+PE/HwwKmISQqlVAU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+pZZhJO6oLbdyw+BujbaYu/oF/CrJZiJ96A8tLNE
 Gdk6q7mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfqWWQAKCRAk1otyXVSH0AbECA
 CHA70VO2yoFDAVjdbf9sHQxFmIEPwv1vfsMvhocrhfZaeFQKAj5Eai6EuGdS2Nj4Kjl7W5dyQw7dl2
 AwaIKbPc/lh31wq0mR/5odE/F0AvmK6b00ZikbLiI1nETnMne7O+nUJO7biquyxSUGbeMtLMUtPwDi
 2sdZCYtlCv53G68oWmPs4k2JXG8mYGIJTZY8EDoh93MYVLagwIZhC2F28b4HNkrSZC6whNkKwAp8xN
 lsxam/oWuZYdcKSv0+bu1I84dpQvSOhgBhmrMDVTnOpACPch+QCoviblb9hucQr9NPsRApn3N/k9Zf
 P8pp3fhY6glJZ2cfBJ+rF97US5iAYi
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_063432_027686_032AE91C 
X-CRM114-Status: GOOD (  14.75  )
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
index 734878abaa23..3ae18cbf5cd1 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -112,6 +112,13 @@ static const struct of_device_id dataflash_dt_ids[] = {
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
@@ -938,6 +945,7 @@ static struct spi_driver dataflash_driver = {
 
 	.probe		= dataflash_probe,
 	.remove		= dataflash_remove,
+	.id_table	= dataflash_spi_ids,
 
 	/* FIXME:  investigate suspend and resume... */
 };
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
