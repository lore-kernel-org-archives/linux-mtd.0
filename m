Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC86C54E64
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2024 12:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bdcN8P1sR6x0XKRihcDbEu9w719PN5U4/Qcspg89BBc=; b=4WI0hJp6MGs6aY
	fDK6oFcwePZMkfPX8A7RUjYlSiR7Gb69Qkb8x2f7OZA5BMnbR0SpyV4IDizSoh9epl7VC8SFC2mw5
	WJrDm4VZFgbqfhRvDnkSCGw3m1OQJvCjSUWSdiuaUVS+b336M9+oXln0s6YwzJy+n4xNucTyKj0QU
	bEJ6tPEsDu5NVLuLLH5SKt/2PXK6Gt6SUnH0frFX0J++sc/rnA0NJWkOXytRsBbjLjM5EEkFAmoSi
	5Wz9J5gCfUzUQ12/2DtS/yI6/qpBffpaV3LPysm+z7wL2gzndOLnQiioDu8zwBUxBkJHhiQbFImwf
	mVLpJ53JwIbCL43TFMVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpoqV-0000000Dti1-08Au;
	Thu, 28 Mar 2024 12:27:03 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpoqF-0000000DtQF-3PK4
	for linux-mtd@lists.infradead.org;
	Thu, 28 Mar 2024 12:26:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711628808; x=1743164808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jD9b2EQdkHTxRF/wrwHTfsIHz7uTUs2VLMamN2+Y2L8=;
  b=mQcuEAzUOn3j5BSoJ82tmGznP+MdT/za/TuIl5B2ise4uHj+21Ht7Psq
   Xm3Gac3Tn7RiZ9GaWSXV3nNLGLu32GB1UPD9V0JV/k8aisk79Ii/OVuHc
   RGDFXBvMhhKh2B876w3gROR/oV4XAS4ICp2KRn5ODxq0F/7m/pqKGjrBf
   861oJ55Ol+16L/fW3pLIQZVDmdniPcN+tELTxZoWJ5SB4NDPtxUapaMwI
   N9eeZaFlQ+ys+s11AqyBqMiYQ9h92USfRx5U/Js57nTbGEQfJ7+RSmpQu
   b97+16d9pWqeg7AyM2rrwmUQ33/ZIYIDQsgT7O+qBwv+Fkc5yRhH6/kzL
   w==;
X-CSE-ConnectionGUID: YRSAwhsKSquZ01msm/+kpQ==
X-CSE-MsgGUID: ghrr+h8XTJGKTCRgBSdCDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17505519"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="17505519"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 05:26:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="16657595"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 05:26:45 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
	Vitaly Lubart <vitaly.lubart@intel.com>,
	linux-mtd@lists.infradead.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/13] spi: intel-dg: align 64bit read and write
Date: Thu, 28 Mar 2024 14:22:33 +0200
Message-Id: <20240328122236.1718111-11-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328122236.1718111-1-alexander.usyskin@intel.com>
References: <20240328122236.1718111-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_052648_124639_B3BEDBF5 
X-CRM114-Status: GOOD (  11.31  )
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

GSC SPI HW errors on quad access overlapping 1K border.
Align 64bit read and write to avoid readq/writeq over 1K border.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/spi/spi-intel-dg.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/spi/spi-intel-dg.c b/drivers/spi/spi-intel-dg.c
index 9e8be7713f1a..d626e9526631 100644
--- a/drivers/spi/spi-intel-dg.c
+++ b/drivers/spi/spi-intel-dg.c
@@ -231,6 +231,24 @@ static ssize_t spi_write(struct intel_dg_spi *spi, u8 region,
 		len_s -= to_shift;
 	}
 
+	if (!IS_ALIGNED(to, sizeof(u64)) &&
+	    ((to ^ (to + len_s)) & GENMASK(31, 10))) {
+		/*
+		 * Workaround reads/writes across 1k-aligned addresses
+		 * (start u32 before 1k, end u32 after)
+		 * as this fails on hardware.
+		 */
+		u32 data;
+
+		memcpy(&data, &buf[0], sizeof(u32));
+		spi_write32(spi, to, data);
+		if (spi_error(spi))
+			return -EIO;
+		buf += sizeof(u32);
+		to += sizeof(u32);
+		len_s -= sizeof(u32);
+	}
+
 	len8 = ALIGN_DOWN(len_s, sizeof(u64));
 	for (i = 0; i < len8; i += sizeof(u64)) {
 		u64 data;
@@ -289,6 +307,23 @@ static ssize_t spi_read(struct intel_dg_spi *spi, u8 region,
 		from += from_shift;
 	}
 
+	if (!IS_ALIGNED(from, sizeof(u64)) &&
+	    ((from ^ (from + len_s)) & GENMASK(31, 10))) {
+		/*
+		 * Workaround reads/writes across 1k-aligned addresses
+		 * (start u32 before 1k, end u32 after)
+		 * as this fails on hardware.
+		 */
+		u32 data = spi_read32(spi, from);
+
+		if (spi_error(spi))
+			return -EIO;
+		memcpy(&buf[0], &data, sizeof(data));
+		len_s -= sizeof(u32);
+		buf += sizeof(u32);
+		from += sizeof(u32);
+	}
+
 	len8 = ALIGN_DOWN(len_s, sizeof(u64));
 	for (i = 0; i < len8; i += sizeof(u64)) {
 		u64 data = spi_read64(spi, from + i);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
