Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3AEC00140
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 22:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17DJYHIWTzT0/yEits7IgwBEbDkCIEzDP5voS3ds/lo=; b=A3WVNpTCrvmxQj
	+RyNdGGmO86bA2NPDSCj/lRYFSRImv2FzPepF6IxuJQRbVAIfTPraImAIQWpTuWk1v/pF3t/Za7vp
	RHxnwR2zKwsXyhikhMI8cOLw6aj17ee5TE9OSROM8Bhf4Q1YfFDy2SU75XhEq0v+1Pdejl+Sr6fQn
	J3rpSRr5hcPdZPTUXoWm5olLWyVhxYJJxreEV+EF62VNPczZ32DZIrkZu/saBEQt9K5L2wyUYYJGd
	wrw92q/+oYdj1A9VPQa45DMXyUNLoKWYTPuS9w+7RHXjACkH1Fe8zp2pyOq84CFVdMqNiXzEiOPxq
	sT1+ok3ToHmdtp0wDyvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtrn-00FfNo-5I; Wed, 10 Aug 2022 22:07:55 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtrE-00Feg3-Vc
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 22:07:25 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 2395922249;
	Thu, 11 Aug 2022 00:07:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1660169228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g2De5E540FunuP4dEM9cpbByUgpl79Iu+l9aO+cTF+4=;
	b=immiMyp+oGhwYoqjG6utYL/AWHv0VS/NZ/qjiz8EY79YYYWDgvc0TmBJiQp4STkX0RqEIM
	nPuW8ajC0dGjokKwRmfn5F3Zh4nd/5pjYldprJTJOp53OZ7MVfTURsHjhncMpyxg/gZSlW
	sgrG6J1RTx0FgphB4oW2ZfTpQrJfyf0=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Walle <michael@walle.cc>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 1/7] mtd: spi-nor: hide jedec_id sysfs attribute if not present
Date: Thu, 11 Aug 2022 00:06:48 +0200
Message-Id: <20220810220654.1297699-2-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220810220654.1297699-1-michael@walle.cc>
References: <20220810220654.1297699-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_150721_365918_0D731EDC 
X-CRM114-Status: GOOD (  13.78  )
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

Some non-jedec compliant flashes (like the Everspin flashes) don't have
an ID at all. Hide the attribute in this case.

Fixes: 36ac02286265 ("mtd: spi-nor: add initial sysfs support")
Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 .../ABI/testing/sysfs-bus-spi-devices-spi-nor      |  3 +++
 drivers/mtd/spi-nor/sysfs.c                        | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
index d76cd3946434..e9ef69aef20b 100644
--- a/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
+++ b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
@@ -5,6 +5,9 @@ Contact:	linux-mtd@lists.infradead.org
 Description:	(RO) The JEDEC ID of the SPI NOR flash as reported by the
 		flash device.
 
+		The attribute is not present if the flash doesn't support
+		the "Read JEDEC ID" command (9Fh). This is the case for
+		non-JEDEC compliant flashes.
 
 What:		/sys/bus/spi/devices/.../spi-nor/manufacturer
 Date:		April 2021
diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
index 9aec9d8a98ad..4c3b351aef24 100644
--- a/drivers/mtd/spi-nor/sysfs.c
+++ b/drivers/mtd/spi-nor/sysfs.c
@@ -67,6 +67,19 @@ static struct bin_attribute *spi_nor_sysfs_bin_entries[] = {
 	NULL
 };
 
+static umode_t spi_nor_sysfs_is_visible(struct kobject *kobj,
+					struct attribute *attr, int n)
+{
+	struct spi_device *spi = to_spi_device(kobj_to_dev(kobj));
+	struct spi_mem *spimem = spi_get_drvdata(spi);
+	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
+
+	if (attr == &dev_attr_jedec_id.attr && !nor->info->id_len)
+		return 0;
+
+	return 0444;
+}
+
 static umode_t spi_nor_sysfs_is_bin_visible(struct kobject *kobj,
 					    struct bin_attribute *attr, int n)
 {
@@ -82,6 +95,7 @@ static umode_t spi_nor_sysfs_is_bin_visible(struct kobject *kobj,
 
 static const struct attribute_group spi_nor_sysfs_group = {
 	.name		= "spi-nor",
+	.is_visible	= spi_nor_sysfs_is_visible,
 	.is_bin_visible	= spi_nor_sysfs_is_bin_visible,
 	.attrs		= spi_nor_sysfs_entries,
 	.bin_attrs	= spi_nor_sysfs_bin_entries,
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
