Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9617C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 11:22:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BA7460F9C
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 11:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BA7460F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DDT9hqOutLqm+qd5nTsMUcmTP+kM7YSLa921NtjajAY=; b=W9b79x3jSsfPim
	dXJGIjhEi3ggeidrlq9zkCBD0b290j8E9uOn/O2zDWhqA6HLDncB6K694c3mcX0cltWlypFEkZosv
	vS2JyWoXdQLfKw/A8/MDVCJFHjmv9ekhaAEjltsSAftKywCvat4vYQbT3Kt0T/f+rWkkM86LU/zUp
	y3z6MaUH0z4hGETRt9ZBuzf1Qml207LAu/K53nz380XotCTGvL/lcVr+s2+QljAOpfBUQNIiXqM5Z
	3/v/WqPafe901D4s7PdbU1V+vWEwpycHvRDQTtebkygsMA33mhghY7/PjH8IhDQwEXDhIXFI7KXlO
	Dtxm9GjfbdKXr/iNyrZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYRSx-00H4uS-Ee; Thu, 07 Oct 2021 11:21:35 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYRSt-00H4t0-Rg
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 11:21:33 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="287108356"
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="287108356"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 04:21:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="568597047"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 07 Oct 2021 04:21:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 0BEEA291; Thu,  7 Oct 2021 14:21:33 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Lima <mauro.lima@eclypsium.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [PATCH v2 3/3] Documentation / MTD: Rename the intel-spi driver
Date: Thu,  7 Oct 2021 14:21:32 +0300
Message-Id: <20211007112132.30934-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007112132.30934-1-mika.westerberg@linux.intel.com>
References: <20211007112132.30934-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_042131_965488_CDC57415 
X-CRM114-Status: GOOD (  16.50  )
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

Since the driver is renamed (and moved) update the BIOS upgrade guide
accordingly from intel-spi to spi-intel. Keep the guide under MTD
documentation because this is pretty much still about MTD and SPI-NOR.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 Documentation/driver-api/mtd/index.rst                    | 2 +-
 .../driver-api/mtd/{intel-spi.rst => spi-intel.rst}       | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename Documentation/driver-api/mtd/{intel-spi.rst => spi-intel.rst} (94%)

diff --git a/Documentation/driver-api/mtd/index.rst b/Documentation/driver-api/mtd/index.rst
index 436ba5a851d7..6a4278f409d7 100644
--- a/Documentation/driver-api/mtd/index.rst
+++ b/Documentation/driver-api/mtd/index.rst
@@ -7,6 +7,6 @@ Memory Technology Device (MTD)
 .. toctree::
    :maxdepth: 1
 
-   intel-spi
+   spi-intel
    nand_ecc
    spi-nor
diff --git a/Documentation/driver-api/mtd/intel-spi.rst b/Documentation/driver-api/mtd/spi-intel.rst
similarity index 94%
rename from Documentation/driver-api/mtd/intel-spi.rst
rename to Documentation/driver-api/mtd/spi-intel.rst
index 0465f6879262..df854f20ead1 100644
--- a/Documentation/driver-api/mtd/intel-spi.rst
+++ b/Documentation/driver-api/mtd/spi-intel.rst
@@ -1,5 +1,5 @@
 ==============================
-Upgrading BIOS using intel-spi
+Upgrading BIOS using spi-intel
 ==============================
 
 Many Intel CPUs like Baytrail and Braswell include SPI serial flash host
@@ -11,12 +11,12 @@ avoid accidental (or on purpose) overwrite of the content.
 Not all manufacturers protect the SPI serial flash, mainly because it
 allows upgrading the BIOS image directly from an OS.
 
-The intel-spi driver makes it possible to read and write the SPI serial
+The spi-intel driver makes it possible to read and write the SPI serial
 flash, if certain protection bits are not set and locked. If it finds
 any of them set, the whole MTD device is made read-only to prevent
 partial overwrites. By default the driver exposes SPI serial flash
 contents as read-only but it can be changed from kernel command line,
-passing "intel-spi.writeable=1".
+passing "spi_intel.writeable=1".
 
 Please keep in mind that overwriting the BIOS image on SPI serial flash
 might render the machine unbootable and requires special equipment like
@@ -32,7 +32,7 @@ Linux.
     serial flash. Distros like Debian and Fedora have this prepackaged with
     name "mtd-utils".
 
- 3) Add "intel-spi.writeable=1" to the kernel command line and reboot
+ 3) Add "spi_intel.writeable=1" to the kernel command line and reboot
     the board (you can also reload the driver passing "writeable=1" as
     module parameter to modprobe).
 
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
