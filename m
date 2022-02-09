Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F657C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 12:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wl7mrml8wArkiKZRSwBHriWhq74dsWE31zo7f59SHpY=; b=GhZ6bVbPJO0e/+
	Ksnrc+4WBF5kOoE7UN0cMUksLvj7iJqPCpoZGQ5fwOMZywwMV+Afb3wvgKwzobrOzfYIhoimdMJLV
	7ePo5AObaqSR+Qzq3oI9zawyhTU59XwpvwnDKbX+ctA2oeFD/iCqgFpDEvyCcR5slrFITQSX+lxDK
	RwSrJIxjQeSjd66rZ0OP6y1xPNRLDC+BF7K1icB95rucj7psWUWGwRAd1YjzZkL+1B8mckWIkU/VR
	h9BCCJ2L57DDi58uHk7pQXLKGSFbi1aiWXBSCGfKgwWDs6zXpVKlCbBnPpXmjtgFMPJtzH9vT5ibt
	f9zdSxYZ/On226pNj9QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHm48-00HaoH-BF; Wed, 09 Feb 2022 12:27:20 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHm45-00Ham1-Bh
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 12:27:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644409637; x=1675945637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oFpIUGw14AgMHkvnE4GJbUCRxPCab9r82lvUt1HTyGE=;
 b=YHn57CDur5IpCcPkUPqpsOS5DDHaXILCfsJmjdwrRhYu4mH6apAwhF89
 Bw3HqT8DxIqakQU4KPJAc3o8v0OIFMTnPCN7TD8EPK/vRyjAnpF3GzbQy
 TZqtfTT8hzIS53x0q3lLLIekpvblL+fsngrjTu2qgp2TPyvUMwD/ZsK3C
 kd59VwjRxzPsBdERU7d3WMbcJPm4fpY4t1Yl8sDS3PXHq0H9CgU57Q97X
 f1tcSSJAy6a3pyjcDE/uT22OuX0eZ9Gxg0MQaARpUZrF/LUr0sUVOLf0s
 mLt4ZaupXcNZqqvND2OzV5XflKxLSUBuAAQ5/tAYjcq9ZVDQ/dkkt48h1 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="273727944"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="273727944"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 04:26:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="585546840"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 09 Feb 2022 04:26:52 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 61BC556A; Wed,  9 Feb 2022 14:27:07 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Lima <mauro.lima@eclypsium.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans-Gert Dahmen <hans-gert.dahmen@immu.ne>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [PATCH v6 3/3] Documentation / MTD: Rename the intel-spi driver
Date: Wed,  9 Feb 2022 15:27:06 +0300
Message-Id: <20220209122706.42439-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209122706.42439-1-mika.westerberg@linux.intel.com>
References: <20220209122706.42439-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_042717_433534_98169727 
X-CRM114-Status: GOOD (  16.67  )
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Mauro Lima <mauro.lima@eclypsium.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
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
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
