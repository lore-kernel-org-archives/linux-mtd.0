Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9D5C00140
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 22:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuyiloZw2/DzK6aVzE5/Wg14xSFHIiPc4i5ElA7M8L4=; b=2g25mYZZg6WMnc
	eI2N+hdOZz//3U2hEZVejG0aTUC9mYUFqz/rTZJeVlJqAALJEI3VLtzYvDmbomt9Fxmrg8vNbgpl+
	DzmUvwz6D0WNMucLhue0t6jnztcpT8pIA3oEAMAl1rR1faBSwQzuJR4vRY+JZebZYINP2Dyf7H/cd
	/Ymzn4P/6x1AdK3NP5zNS2UiA0UOpG6oTWAKN/WhKuz6fPZgVNvId+K6Clfc1fa3+WWWqV+EkfZRI
	+jz/zgMM32PSwE64Hsxgk2Z5aTjDCQ6HASCJEMS3k+UIDwLmKC2SkKl1N97fNYSwQxHsu1hiGh4a5
	ZNTyTfghR89KbTWLX4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtrU-00Ff0o-E0; Wed, 10 Aug 2022 22:07:36 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLtrE-00Fefz-12
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 22:07:22 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id C32482224D;
	Thu, 11 Aug 2022 00:07:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1660169228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F5Gy8fj7/+fRJ03Ev0pNp8xZJdQLteKJDf4fVJZWgbk=;
	b=Y/BFcaE082PrrjtwKehAHz/WA1soCrpkV2LWVjJUJFgWge2TjIcu28AjrXeEVbKQ/KWRvk
	pwdT64rgi6AdNGsBmU50ESNQsufmiQdiJV14WLNR2F0SgU9/cb3Sfh+O2ZcJzgdbUldo6W
	YJVhrbLai/M9vGn4bWwdh8Q9UDEtcz0=
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
Subject: [PATCH v2 2/7] mtd: spi-nor: sysfs: hide manufacturer if it is not set
Date: Thu, 11 Aug 2022 00:06:49 +0200
Message-Id: <20220810220654.1297699-3-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220810220654.1297699-1-michael@walle.cc>
References: <20220810220654.1297699-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_150720_515223_5B64C654 
X-CRM114-Status: GOOD (  11.60  )
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
Reviewed-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
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
