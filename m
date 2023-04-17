Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5FBC77B72
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Apr 2023 12:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I1UAFGVvdNoxP0x2QKGI8nsWz2THbM0qt7thHzhkaLU=; b=nSTfFG7gWxHQsr
	5g1VhEPvVUjxBzy4dyobXuQKA9xVsjQfSYZ7hS0slBAvc6SjxDAkSCVAwL65+XdF9nM2bFKtC6lvI
	sxpY0L8LC+bOqncA/7L8ABEPH3IRl5fUUpdhqvi2jEJBx1Rc1PWo/uXr8fmhxDeaAgoqrLk8IchYS
	CU4sPJTT+JiIuT+k9IZmVT6ovv4gh5yhWeKeBEDYxs+GXouFonrlICQVkatSGtSDBBjl2gZHwDDfB
	NbgnfFokz1/C5O8TjUz0ecL+SswEJAeGW9dXuhh/8rNt2BXZuc3eWZjIYzXtNc7yxbvAe/04PO9oQ
	1XGfrFvcQmzcD/PpW9Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poOMS-00GDGO-0u;
	Mon, 17 Apr 2023 12:53:36 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poOMP-00GDF0-0E
	for linux-mtd@lists.infradead.org;
	Mon, 17 Apr 2023 12:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681736013; x=1713272013;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3sG/FjAOmFFwFZ53HDQhlpYWLmIr5kYQL7tbWNDPmBg=;
  b=k+hbSNZJBTcLyxPi1Wz9vFc2+PfCYa0e5X3gnZOh2WpFeonzQQoSr6iZ
   9HhS3cexGkDCCdfgBd9tkTJ05e8JPjWOdpyHhwpWuxU9KsZqYCMKPv/A7
   My+45mPEI7W0EjTx4YHW7n1nKhMBsAho/zi9o1ZPaFTYfVCABFYvRT5bM
   wcdI5tS1hyFNWAI5UtDLxvk6gm34kjUilNUXNY/Z4MWhkwty5sHD8R6nd
   djaUE1gav3zCFL+ynBKWCegt9hiwkwsTdtzJw/0IfKDUk/nKnw2Hn9NIz
   Uuh3jPgssL8A2k6ccOqwGzsGhrJ7TaS9b0Qk0Rbc3zYIuF9PXsRMmLZj7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="342376760"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="342376760"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 05:53:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="693228291"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="693228291"
Received: from unknown (HELO localhost.localdomain) ([10.226.216.116])
  by fmsmga007.fm.intel.com with ESMTP; 17 Apr 2023 05:53:15 -0700
From: niravkumar.l.rabara@intel.com
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	niravkumar.l.rabara@intel.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: issi: add support for IS25WP01G
Date: Mon, 17 Apr 2023 20:53:04 +0800
Message-Id: <20230417125304.1968382-1-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_055333_119019_637E21E7 
X-CRM114-Status: GOOD (  11.37  )
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

From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>

Tested on Intel N5X socdk board,
random data write, erase, read - verified erase operations
random data write, read and compare - verified write/read operations

Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>

---
root@n5x:~# cat /sys/devices/platform/soc/ff8d2000.spi/spi_master/
spi0/spi0.0/spi-nor/jedec_id
9d701b
root@n5x:~# cat /sys/devices/platform/soc/ff8d2000.spi/spi_master/
spi0/spi0.0/spi-nor/manufacturer
issi
root@n5x:~# cat /sys/devices/platform/soc/ff8d2000.spi/spi_master/
spi0/spi0.0/spi-nor/partname
is25wp01g
root@n5x:~# hexdump /sys/devices/platform/soc/ff8d2000.spi/spi_master
/spi0/spi0.0/spi-nor/sfdp
0000000 4653 5044 0106 ff01 0600 1001 0030 ff00
0000010 0084 0201 0080 ff00 ffff ffff ffff ffff
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
0000030 20e5 fffb ffff 3fff eb44 6b08 3b08 bb80
0000040 fffe ffff ffff ff00 ffff eb44 200c 520f
0000050 d810 ff00 4262 00a9 6482 d302 8dec 4c69
0000060 757a 757a a4f7 5cd5 c24a ff2c 30e1 a9fa
0000070 ffff ffff ffff ffff ffff ffff ffff ffff
0000080 eeff ffff 5c21 ffdc
0000088
root@n5x:~# md5sum /sys/devices/platform/soc/ff8d2000.spi/spi_master/
spi0/spi0.0/spi-nor/sfdp
83440c0ff8676fe5292d207788693900  /sys/devices/platform/soc/ff8d2000.
spi/spi_master/spi0/spi0.0/spi-nor/sfdp
---
 drivers/mtd/spi-nor/issi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 400e2b42f45a..79132267cf0d 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -64,6 +64,8 @@ static const struct flash_info issi_nor_parts[] = {
 		PARSE_SFDP
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &is25lp256_fixups },
+	{ "is25wp01g",  INFO(0x9d701b, 0, 256 * 1024,  512)
+		PARSE_SFDP },
 	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp064",  INFO(0x9d7017, 0, 64 * 1024, 128)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
