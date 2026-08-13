Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB5DC5CFEB
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2026 15:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2v5F7MVeHbXkDmxmFfkaFL3O5AwuyiaiZXyvMHA2+o=; b=GEgJXvr1jiI8fo
	jQnF+MuguyrsI4zYQLjgb3l+tM8pVCl79O+p4/btftg6svvdm3R4ieMExvlk4H06OUR0QXxzxbuaJ
	Zsl4gSYNfpPaH9zL3KUYmcWLK/rr3EU7Qk6GLilMU/f6zcR5ydnOj+d4UV+SFU5Ttr5AlYDLXiTE0
	4l7r+DxtRd7Ho5Uss0+R82Zw15DWJzxzoj87xds+J5qPSVlGNDe/Q9TzWK6Ahdbbmvzj6Sh55n3qc
	tg3DofkjvP+DY2jxbWkXQl5LWSQyoMg6QY62iy4kAGLcl2ixbIhNUQ1LT78AH2LZP5efItgBrVpiQ
	v4ZaD0SDF6jMHYCEoSoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXE2-00000000xP1-12Id;
	Thu, 13 Aug 2026 15:20:10 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXDt-00000000xDk-1akS
	for linux-mtd@lists.infradead.org;
	Thu, 13 Aug 2026 15:20:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C22D14E41209;
	Thu, 13 Aug 2026 15:19:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95BB0602B8;
	Thu, 13 Aug 2026 15:19:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A6E311C4E070;
	Thu, 13 Aug 2026 17:19:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786634394; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kuJO180+ZdLosOCxprt4BAEakCmT8F4JphnBce+EMCw=;
	b=ffVndZj+rMFzOUk/4qRvjKaafqYBqb8qdlA5fYR9XGl440pkgpq2dYpLLgShs/e1CCetUd
	sl/6PznTnj5F0Jo+HE9jq0quRO5Fx4rrxjvkhZJTKj1BocSfWBftJf1afMkY3/n/vkZ8Hi
	UJVduZQwor9odp2Ujt/Cj2BoVEj36GwaXoUWNPhQXZ76cDxhJNCi1ok1HJtDdATcdum4hc
	3d6Pzcgd6MgsIQuayV3OX0zWGVvHg4Uut0gaf5wY9TH85qCV+zY2/betg4qzBPQ5DzpSIv
	g3nLAno+YpyIv229euTA8ahKZuRtA1NGoer0onAXIka6etLFtYSRfdkT7h7q+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 17:19:06 +0200
Subject: [PATCH v3 06/23] mtd: spi-nor: Create an indirection on the part
 name
MIME-Version: 1.0
Message-Id: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-6-b637cf120d5c@bootlin.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_082001_711471_66EB1DDC 
X-CRM114-Status: GOOD (  14.89  )
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

We currently print through sysfs and debugfs the name of the part if the
.name field, which is legacy, has been filled in the ID table (otherwise
"(null)" is printed). These IDs had an interest until manufacturers
started re-using more and more extensively the so called unique JEDEC
IDs. At this stage, a name that was tailored for a chip sold in 2016 may
no longer be relevant for a chip sold in 2026. Still showing this name
through the various filesystems may confuse people, removing these names
cannot be done since they are now part of the user ABI (because of
sysfs).

In order to allow overwriting the .name field (which is part of a
read-only structure), let's create a spi-nor pointer which will by
default point to that .name, but which can be cleared in fixup hooks to
make sure the name is hidden on newer parts.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c    | 1 +
 drivers/mtd/spi-nor/debugfs.c | 3 +--
 drivers/mtd/spi-nor/sysfs.c   | 4 ++--
 include/linux/mtd/spi-nor.h   | 1 +
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 3a611283a9e6..cf6eccb4c423 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3492,6 +3492,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		return PTR_ERR(info);
 
 	nor->info = info;
+	nor->partname = info->name;
 
 	mutex_init(&nor->lock);
 
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 512825c3fc85..275671222588 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -82,13 +82,12 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 	struct spi_nor_flash_parameter *params = nor->params;
 	struct spi_nor_erase_map *erase_map = &params->erase_map;
 	struct spi_nor_erase_region *region = erase_map->regions;
-	const struct flash_info *info = nor->info;
 	char buf[16], *str;
 	loff_t lock_start;
 	u64 lock_length;
 	unsigned int i;
 
-	seq_printf(s, "name\t\t%s\n", info->name);
+	seq_printf(s, "name\t\t%s\n", nor->partname);
 	seq_printf(s, "id\t\t%*ph\n", SPI_NOR_MAX_ID_LEN, nor->id);
 	string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
 	seq_printf(s, "size\t\t%s\n", buf);
diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
index 643513ee891b..a2dabe4c6422 100644
--- a/drivers/mtd/spi-nor/sysfs.c
+++ b/drivers/mtd/spi-nor/sysfs.c
@@ -25,7 +25,7 @@ static ssize_t partname_show(struct device *dev,
 	struct spi_mem *spimem = spi_get_drvdata(spi);
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
 
-	return sysfs_emit(buf, "%s\n", nor->info->name);
+	return sysfs_emit(buf, "%s\n", nor->partname);
 }
 static DEVICE_ATTR_RO(partname);
 
@@ -78,7 +78,7 @@ static umode_t spi_nor_sysfs_is_visible(struct kobject *kobj,
 
 	if (attr == &dev_attr_manufacturer.attr && !nor->manufacturer)
 		return 0;
-	if (attr == &dev_attr_partname.attr && !nor->info->name)
+	if (attr == &dev_attr_partname.attr && !nor->partname)
 		return 0;
 	if (attr == &dev_attr_jedec_id.attr && !nor->info->id && !nor->id)
 		return 0;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 3a55d76ea77d..b1e573367604 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -395,6 +395,7 @@ struct spi_nor {
 	u8			*id;
 	const struct flash_info	*info;
 	const struct spi_nor_manufacturer *manufacturer;
+	const char		*partname;
 	u8			addr_nbytes;
 	u8			erase_opcode;
 	u8			read_opcode;

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
