Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF0BC54EBC
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Jan 2023 21:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZX9lGExT7cCENJlPlF/s7luZ6wWS45FcLKb0upYUVR8=; b=haVxin47MbGupX
	9ToT8gKfC3PmrhNUronxcTfxeXpCbl4AxY9K1FEfr5dFnSvNOVzNAC662pv3FHeiycme8Ca6iYtCl
	tyhZYlE/7BetfjxzJSCdepITYhTWQs+5fn7zeM0tu3VJHTQ6xTO1CghuTidxpiq7NgXKTwPJ4s3AB
	xyMv/jJzWKOT6x9frps0GxlmLwodZjMh6vHnt6JY4fiqOL2wC4sUSPFVcDv0Fq/e2EeUNJgeucB4F
	l412SOMntvtywxEMdgfNIWLGXdDsTvZBa7VBdE4Unv3qzUS7Omxg7EY4Wf+16T/ePOZdE2Uqzk2l2
	vEt083dotYXubc9sRGnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEGz7-008VHB-1K; Sat, 07 Jan 2023 21:44:13 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEGz4-008VFy-Do
	for linux-mtd@lists.infradead.org; Sat, 07 Jan 2023 21:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673127850; x=1704663850;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MwAPMW/T/jeDvYqPDbytyr8qYLB7Sr93oLXdTum30WU=;
  b=mMeH/iszGR53uHvIKqs91kIQvNYYdNDNkmYYrqQsajstafoMR77N8lhS
   T4h26qmJ0sfKZ0c7U0WKti4h0q0JPfCklsAxgsftyWGeb9wNsZIx4oEap
   7JiF/MA3X3kIslDmF4i7iYa9qWKojmnN0Wx175W1rux8iBp4rsjGx7I3B
   a3DxdMwvYdUtExoXy+lrl8yjqvQ40gaSPdXRlyvTa2RU6A/TgS4D+ur55
   +duNDLxk+7I4zdfpK3TVDWHdqWKT5TaQGfgXO7/Kc+cjyyqHTQsjtieL3
   Ck2V4phDiuv9Jwr4wlz4KG6ZsOe2mV50MyYj+tGZvUeX13uD39VJpEi8a
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10583"; a="324686288"
X-IronPort-AV: E=Sophos;i="5.96,309,1665471600"; 
   d="scan'208";a="324686288"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2023 13:44:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10583"; a="830228272"
X-IronPort-AV: E=Sophos;i="5.96,309,1665471600"; 
   d="scan'208";a="830228272"
Received: from twinkler-lnx.jer.intel.com ([10.12.87.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2023 13:44:04 -0800
From: Tomas Winkler <tomas.winkler@intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Tomas Winkler <tomas.winkler@intel.com>
Subject: [PATCH v2] mtd: spi-nor: macronix: add support for mx77l51250f
Date: Sat,  7 Jan 2023 23:43:45 +0200
Message-Id: <20230107214345.2524851-1-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_134410_622975_247E6991 
X-CRM114-Status: GOOD (  10.48  )
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

Add support for mx77l51250f spi-nor chips.

SPI NOR sysfs:

$ cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
mx77l51250f
$ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2751a
$ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
$ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060103ff00060110300000ffc2000104100100ff030001020001
00ff84000102c00000ffffffffffffffffffe520f3ffffffff1f44eb086b
083b04bbeeffffffffff00ffffff00ff0c200f5210d800ff8341bd0082a7
04db4403373830b030b0f7a9d55c009e29fff050f985ffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffff7f0ff0ff215cdcffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffff3c9b96f0c5a4c2ffffffffffffff
ffff003600279df9c064fecfffffffffffff

$ md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
36fb8e3e6f82c45bfabea45ec73c08a8
/sys/bus/spi/devices/spi0.0/spi-nor/sfdp

Note: The test_qspi.sh wasn not run as this device in intel setup is used
      for BIOS and platform firmware storage.

Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
V2:
1. This chip supports SFDP, parse it instead of the manual configuration.
2. Add required output of sysfs attributes 

 drivers/mtd/spi-nor/macronix.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 6853ec9ae65d..6c3b4192a8ae 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -100,6 +100,8 @@ static const struct flash_info macronix_nor_parts[] = {
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx77l51250f", INFO(0xc2751a, 0, 64 * 1024, 4096)
+		PARSE_SFDP },
 };
 
 static void macronix_nor_default_init(struct spi_nor *nor)
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
