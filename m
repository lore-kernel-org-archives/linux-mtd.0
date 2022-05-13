Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA83C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 13 May 2022 13:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KkJ4bcfYsX9LAoPa/hjf+VOfPaqer+y2jYHs+bR2g4U=; b=A7gwOfQ3KKO7js
	HSLjdOKlSqaHWaXZcEfzn85zBf/qjhIs6WyHQY7aHZNqR4/zfL54t+kQijhjoQUxvuypiseg4H2pz
	hQD/ukp+1xXZzBroBvC0gUWB1/lXo+JEPcZo/WgaYC0qm0jQ6I/XINbHlJigVTiVaqrc+wSIUHSQy
	shwfkPP3q0Ur++VHYNtXhhIQNtAbJD8Nu/Wu0VX/R62LnUlskxVnU/36fxiBRZOfk2F3wsvxd9CtQ
	FGEMg8ViIXxVGXVDpWkJeBS12TURh+HqRd6olNUkEwYedPsunAxcF3owgKlAh78l1uraqxwuvxxzo
	zR1JQFOt0NDrTT931XTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npVSP-00GIKA-89; Fri, 13 May 2022 13:35:49 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npVSE-00GIDH-0f
 for linux-mtd@lists.infradead.org; Fri, 13 May 2022 13:35:41 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 62C1822249;
 Fri, 13 May 2022 15:35:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652448928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MRhm9+AKqiCcFzEMtgbAPpFPGlNCeXLEsZ2HWJ7ms0c=;
 b=ZhTR67jMRyktCADJBzMCgBxZXj5Y48+NC4yRJ2e+cLkHVKej8MxqnREkz56Kx/05gT3slt
 shj3wLY+wp3CwbGtPvULuvDRGPXlnntCSem8E5uTc/o/w2jVA4DScBmhSui79amE1ZeOHH
 nqyem7xqbK3UCQ9qct/bCAF0zhKN3cQ=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 2/6] mtd: spi-nor: sysfs: hide manufacturer if it is not set
Date: Fri, 13 May 2022 15:35:16 +0200
Message-Id: <20220513133520.3945820-3-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513133520.3945820-1-michael@walle.cc>
References: <20220513133520.3945820-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_063538_668253_DE0F3055 
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

The manufacturer may be optional when pure SFDP flashes are supported.
Hide the sysfs property if no manufacturer is set.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor | 3 +++
 drivers/mtd/spi-nor/sysfs.c                             | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
index e9ef69aef20b..c800621eff95 100644
--- a/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
+++ b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
@@ -15,6 +15,9 @@ KernelVersion:	5.14
 Contact:	linux-mtd@lists.infradead.org
 Description:	(RO) Manufacturer of the SPI NOR flash.
 
+		The attribute is not present if the flash device isn't
+		known to the kernel and is only probed by its SFDP
+		tables.
 
 What:		/sys/bus/spi/devices/.../spi-nor/partname
 Date:		April 2021
diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
index 4c3b351aef24..20563c1926f4 100644
--- a/drivers/mtd/spi-nor/sysfs.c
+++ b/drivers/mtd/spi-nor/sysfs.c
@@ -74,6 +74,8 @@ static umode_t spi_nor_sysfs_is_visible(struct kobject *kobj,
 	struct spi_mem *spimem = spi_get_drvdata(spi);
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
 
+	if (attr == &dev_attr_manufacturer.attr && !nor->manufacturer)
+		return 0;
 	if (attr == &dev_attr_jedec_id.attr && !nor->info->id_len)
 		return 0;
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
