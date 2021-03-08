Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7AD2C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:33:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FD7D651DF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FD7D651DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cbk1KDBnf/4hOWtUg/ud2zuOaBBkivrKjNdknQC0MV4=; b=eQPDt4ip+eT+jvcrdZEUAOv4k
	lXkxgRlCUUwAoPItq3nh0sR5QQ5p/umhIst6+NFhqp3fN8o2kkO9Atb/l9lpBIT0Sd+Y3yg4mYZ+P
	WPAD3xzztXLDleTDVx/J/09dVJqtxdisTywxpdr5rhSteQVnqzVfXDP42QXrX0VfGpKeRf737EFeM
	o6YLQjFilGtXgsi/6WhndxxjeQPaCb1YE0kL8aqXRxnmcYXld7/gwKDcZrkqUcGQAgvLqVBRWCS8i
	fVzcc5dvQAU9grOz4El4xb+3Ai7FnZYg/qvEcfqBCb6HBx/FayTKP/YORkPg0bQ7S3b5SzbouAJiM
	17UHUsAkQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9SF-00FVJu-QP; Mon, 08 Mar 2021 06:33:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9PH-00FUlx-5F
 for linux-mtd@desiato.infradead.org; Mon, 08 Mar 2021 06:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=u6WQpxl8CsfKoHtOrvGblBtah1Vfs9bntVv0+JL5PgQ=; b=rJo4XimxhdKhBHUI9NGTqJyG9/
 OPP7r1TuR408s9zOLH4uauO/fko+bGFVWKYILog3l3utI0QLlxZ2SwgicCqdVSESTJwOhv74roF6z
 SB6kGNALz6HWrxZO5yAvH9LIr/XyRNqZEb/x/yKgO11wI6N+fY0q6avrm0mhgaJzeb22R3hkjLMI7
 k0TE+jiA87A2D0E6P29l6QUXvY6n4wntUbggP6LEX00R/e5Seiz1pr97p/7Tl6uB8mEx45jYSRaht
 j4xmoOE5wzBoXg2+ddF6v/e98WsuJXJDLv5G8Fce1uqGOhLmUg8ib/Zfs06KEqr3DpLOvbtFKzEiS
 3C95c3GA==;
Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9P8-00F81V-AN
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 06:30:17 +0000
IronPort-SDR: h3LkEFvDZUJj18vUQPQGSAgTQEQS5GbaKPuHd3yUd9d6Ohl/sV2gqsk7amJJM/BH5IU/y1m/SB
 QTz3qex6AqjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="188084483"
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="188084483"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:19 -0800
IronPort-SDR: sRnFPwk1gbxDBaqBE17h22KiFsq+QEDcDfEQboZp0Ln+qUDtQScNalSzH5OaP3IBuI8ofyjqIX
 edJbLKDFsuuQ==
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="409181953"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:16 -0800
From: Tomas Winkler <tomas.winkler@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, linux-mtd@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, Tomas Winkler <tomas.winkler@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [RFC PATCH 05/10 v2] drm/i915/spi: implement spi access functions
Date: Mon,  8 Mar 2021 08:27:43 +0200
Message-Id: <20210308062748.208017-6-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308062748.208017-1-tomas.winkler@intel.com>
References: <20210308062748.208017-1-tomas.winkler@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_063012_924504_1E773025 
X-CRM114-Status: GOOD (  17.66  )
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

Implement spi_read() spi_erase() spi_write() functions.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Co-developed-by: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Co-developed-by: Vitaly Lubart <vitaly.lubart@intel.com>
Signed-off-by: Vitaly Lubart <vitaly.lubart@intel.com>
---
V2:
1. Rebase

 drivers/gpu/drm/i915/spi/i915_spi.c | 137 ++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/drivers/gpu/drm/i915/spi/i915_spi.c b/drivers/gpu/drm/i915/spi/i915_spi.c
index a1e7171d05db..df6a461d520d 100644
--- a/drivers/gpu/drm/i915/spi/i915_spi.c
+++ b/drivers/gpu/drm/i915/spi/i915_spi.c
@@ -9,7 +9,10 @@
 #include <linux/io.h>
 #include <linux/device.h>
 #include <linux/slab.h>
+#include <linux/sizes.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/platform_device.h>
+#include <linux/delay.h>
 #include <spi/intel_spi.h>
 
 struct i915_spi {
@@ -83,6 +86,33 @@ static inline u32 spi_read32(struct i915_spi *spi, u32 address)
 	return ioread32(base + SPI_TRIGGER_REG);
 }
 
+static inline u64 spi_read64(struct i915_spi *spi, u32 address)
+{
+	void __iomem *base = spi->base;
+
+	iowrite32(address, base + SPI_ADDRESS_REG);
+
+	return readq(base + SPI_TRIGGER_REG);
+}
+
+static void spi_write32(struct i915_spi *spi, u32 address, u32 data)
+{
+	void __iomem *base = spi->base;
+
+	iowrite32(address, base + SPI_ADDRESS_REG);
+
+	iowrite32(data, base + SPI_TRIGGER_REG);
+}
+
+static void spi_write64(struct i915_spi *spi, u32 address, u64 data)
+{
+	void __iomem *base = spi->base;
+
+	iowrite32(address, base + SPI_ADDRESS_REG);
+
+	writeq(data, base + SPI_TRIGGER_REG);
+}
+
 static int spi_get_access_map(struct i915_spi *spi)
 {
 	u32 flmap1;
@@ -139,6 +169,113 @@ static int i915_spi_is_valid(struct i915_spi *spi)
 	return 0;
 }
 
+__maybe_unused
+static unsigned int spi_get_region(const struct i915_spi *spi, loff_t from)
+{
+	unsigned int i;
+
+	for (i = 0; i < spi->nregions; i++) {
+		if ((spi->regions[i].offset + spi->regions[i].size - 1) > from &&
+		    spi->regions[i].offset <= from &&
+		    spi->regions[i].size != 0)
+			break;
+	}
+
+	return i;
+}
+
+__maybe_unused
+static ssize_t spi_write(struct i915_spi *spi, u8 region,
+			 loff_t to, size_t len, const unsigned char *buf)
+{
+	size_t i;
+	size_t len8;
+
+	spi_set_region_id(spi, region);
+
+	len8 = ALIGN_DOWN(len, sizeof(u64));
+	for (i = 0; i < len8; i += sizeof(u64)) {
+		u64 data;
+
+		memcpy(&data, &buf[i], sizeof(u64));
+		spi_write64(spi, to + i, data);
+		if (spi_error(spi))
+			return -EIO;
+	}
+
+	if (len8 != len) { /* caller ensure that write size is at least u32 */
+		u32 data;
+
+		memcpy(&data, &buf[i], sizeof(u32));
+		spi_write32(spi, to + len8, data);
+		if (spi_error(spi))
+			return -EIO;
+	}
+
+	return len;
+}
+
+__maybe_unused
+static ssize_t spi_read(struct i915_spi *spi, u8 region,
+			loff_t from, size_t len, unsigned char *buf)
+{
+	size_t i;
+	size_t len8;
+	size_t len4;
+
+	spi_set_region_id(spi, region);
+
+	len8 = ALIGN_DOWN(len, sizeof(u64));
+	for (i = 0; i < len8; i += sizeof(u64)) {
+		u64 data = spi_read64(spi, from + i);
+
+		if (spi_error(spi))
+			return -EIO;
+
+		memcpy(&buf[i], &data, sizeof(data));
+	}
+
+	len4 = len - len8;
+	if (len4 >= sizeof(u32)) {
+		u32 data = spi_read32(spi, from + i);
+
+		if (spi_error(spi))
+			return -EIO;
+		memcpy(&buf[i], &data, sizeof(data));
+		i += sizeof(u32);
+		len4 -= sizeof(u32);
+	}
+
+	if (len4 > 0) {
+		u32 data = spi_read32(spi, from + i);
+
+		if (spi_error(spi))
+			return -EIO;
+		memcpy(&buf[i], &data, len4);
+	}
+
+	return len;
+}
+
+__maybe_unused
+static ssize_t
+spi_erase(struct i915_spi *spi, u8 region, loff_t from, u64 len, u64 *fail_addr)
+{
+	u64 i;
+	const u32 block = 0x10;
+	void __iomem *base = spi->base;
+
+	for (i = 0; i < len; i += SZ_4K) {
+		iowrite32(from + i, base + SPI_ADDRESS_REG);
+		iowrite32(region << 24 | block, base + SPI_ERASE_REG);
+		/* Since the writes are via sguint
+		 * we cannot do back to back erases.
+		 */
+		msleep(50);
+	}
+	return len;
+}
+
 static int i915_spi_init(struct i915_spi *spi, struct device *device)
 {
 	int ret;
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
