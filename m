Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4591EC48BC3
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 20:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GcYgi2bQpwXY4NkHm2GGrlmB7YGnj6xOyoiSMKcD+50=; b=We+8vwL9p5O5cA
	Mdx5tenH4nZHc965pJUJe1oMkmZFiGh7i4H44mc+F0/k9HhoP9BEdoUz1ofzD2VD4QUIre1Bh748x
	9UnwFhyaWYaEZXmiKX0j4Wb1vgaNhmM5kEjMBIvnP+dmiCFP+0eLHiBYCcCqsRVmQsTusY0TiqnOB
	saUpWBdDQyxfQAeBxScQ3dtJ2f/8O6ENL1GfqfYu3Fe12EiJ7W6zo+/JgvOV5/sDQoF63lcmV86Yf
	VWuLlOt5Z3J9opQ3Oeg3Rzg75PAs8ZmxcdA4cpZqgjCwV9U6SqoXpaAvE9HTXM0gCPQn1haenBefH
	MTV1iF5WWbeaw57oZKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcWL9-0000000G2yw-0Iwh;
	Tue, 20 Feb 2024 20:03:43 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcWL5-0000000G2xA-1leS
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 20:03:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-412700a7207so6877455e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 20 Feb 2024 12:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708459416; x=1709064216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nv7+yFK9n5VmWtu0mqH5ORYhJIf9Kx3iQ/yYWuoADPM=;
        b=P9ohaAZhnnDtXI/nqmsnnHIKeP2uF2UB6olU000iyVtUPGAuKF66HgFQgrOI2s9cEm
         dnRg9xNwlEzq3IDe0vo/bWh8mG/K1shR7zBSI77H3xI+EwqPBc3FZTkwD8idlY2t7IDv
         Kv3QhnHMgvAXeKTDXSP9fzWylp5gavnNqE3zQZmSDOqtZJI/Zdn8eMN4bzym7xJBkwZP
         27JVtXQirfkcDz73KfaMAX/+jQRdVCaUqaeKokSqaxJBsVgUbJN7Eh+5/oNqkBDDMOa2
         if3BpflWHFkXXxB5EBq3VVRuffGukqK1eJxrAa8Zns+azAck0Sjzd0uaZszY6HjWe7J0
         UVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708459416; x=1709064216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nv7+yFK9n5VmWtu0mqH5ORYhJIf9Kx3iQ/yYWuoADPM=;
        b=PqJj8gu+YO0U1l4mW/nIYgCZbXKUOfDLL+47fxOZlKLsrO67KngthRwFIKt4VKgdFa
         hX0jL6sWciOuy2bkns4STz3X11i/Q4/+gqfpImEaYjWUX4tFCeTjSeofrw71jr0E7b0a
         yihUVqW9JaPaAo/ywtkwu5LcfhiupVrfimJHwqtq4l9zWiXtBjUC/2FYYKVGiSvLvKsl
         x2FzIC3dHtgffNqzg+vQZT4GDqixyfgIP4uDA+fLhpIEbWx2la4j/M+QT2vBVZ3qK7EL
         lBqXALTS5w6JOgGiFg/K5pOo+l6kZ2nlHRcibiMZKLt5WM9ADuq7zLmGSEo8KSq3dMl2
         u/CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYKAf2218ezam4hbtWnFl3Qbib16KbnI+CONnSYL4tzuTFsicmiWqOod4BOwpZwv0z0acCkkrR9aO5EnsesfCEZcagj2iEtAwmfMrEvQ==
X-Gm-Message-State: AOJu0YxAxYaUK4ISCFN16SUQfKcfe5HCMsq430xsEJPcnbdi2+1h9b1s
	TfryUhgmfG5aDrH/WUfSqzHqSOn43JrUNswFa3X4BuqRrkwoDQh8
X-Google-Smtp-Source: AGHT+IEM+Bk6HvcZ+x9oKGd6+MSXBHv6fbx/PMbTluktnlEjiuzxJ+ncYLh7048GIgpCKQ2pScg9BA==
X-Received: by 2002:a5d:4104:0:b0:33b:5f1d:5ef4 with SMTP id l4-20020a5d4104000000b0033b5f1d5ef4mr10028927wrp.1.1708459415563;
        Tue, 20 Feb 2024 12:03:35 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id x4-20020adff644000000b0033b792ed609sm14539955wrp.91.2024.02.20.12.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 12:03:35 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: David Bauer <mail@david-bauer.net>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2] mtd: spi-nor: Add support for BoHong bh25q128as
Date: Tue, 20 Feb 2024 21:03:23 +0100
Message-ID: <20240220200325.19089-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_120339_491116_EE31427A 
X-CRM114-Status: GOOD (  18.74  )
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

From: David Bauer <mail@david-bauer.net>

Add MTD support for the BoHong bh25q128as SPI NOR chip.
The chip has 16MB of total capacity, divided into a total of 256
sectors, each 64KB sized. The chip also supports 4KB sectors.
Additionally, it supports dual and quad read modes.

Datasheet is public and can be found at the referenced link.

Functionality was verified on an Tenbay WR1800K / MTK MT7621 board.

Link: https://www.e-interlink.com.tw/userUpload/files/BH25Q128AS_v1_0.pdf
Signed-off-by: David Bauer <mail@david-bauer.net>
[ reworked to new flash_info format ]
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Read/write/erase test are done by flashing and installing an OpenWrt
image on the spi and by using overlayfs on it confirming correct
read/write.

root@OpenWrt:/tmp/tmp2# cat /sys/bus/spi/devices/spi0.0/spi-nor/partname 
bh25q128as
root@OpenWrt:/tmp/tmp2# cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id 
684018
root@OpenWrt:/tmp/tmp2# cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer 
bohong

root@OpenWrt:/# xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450000101ff00000109300000ff68000103600000ffffffffffffff
ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
083b42bbeeffffffffff00ffffff44eb0c200f5210d800ffffffffffffff
ffffffffffff003600279ef97764fcebffff

root@OpenWrt:/# sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
e2e374124e998c9c430a5a4c368ded374186637f48301dcb3943b81af2987995  /sys/bus/spi/devices/spi0.0/spi-np

root@OpenWrt:/tmp/tmp2# hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp 
00000000  53 46 44 50 00 01 01 ff  00 00 01 09 30 00 00 ff  |SFDP........0...|
00000010  68 00 01 03 60 00 00 ff  ff ff ff ff ff ff ff ff  |h...`...........|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 f1 ff ff ff ff 07  44 eb 08 6b 08 3b 42 bb  |. ......D..k.;B.|
00000040  ee ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.. .R|
00000050  10 d8 00 ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000060  00 36 00 27 9e f9 77 64  fc eb ff ff              |.6.'..wd....|
0000006c

root@OpenWrt:/tmp/tmp2# sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
e2e374124e998c9c430a5a4c368ded374186637f48301dcb3943b81af2987995  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

root@OpenWrt:/tmp/tmp2# cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x03
  mode cycles	0
  dummy cycles	0
 1S-1S-2S
  opcode	0x3b
  mode cycles	0
  dummy cycles	8
 1S-2S-2S
  opcode	0xbb
  mode cycles	2
  dummy cycles	2
 1S-1S-4S
  opcode	0x6b
  mode cycles	0
  dummy cycles	8
 1S-4S-4S
  opcode	0xeb
  mode cycles	2
  dummy cycles	4

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x02

root@OpenWrt:/tmp/tmp2# cat /sys/kernel/debug/spi-nor/spi0.0/params
name		bh25q128as
id		68 40 18
size		16.0 MiB
write size	1
page size	256
address nbytes	3
flags		HAS_16BIT_SR

opcodes
 read		0x03
  dummy cycles	0
 erase		0xd8
 program	0x02
 8D extension	none

protocols
 read		1S-1S-1S
 write		1S-1S-1S
 register	1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (16.0 MiB)

sector map
 region (in hex)   | erase mask | flags
 ------------------+------------+----------
 00000000-00ffffff |     [ 123] | 

Changes v2:
- Drop wrong copyright header
- Drop name
- Add requested info about sfpd and others

 drivers/mtd/spi-nor/Makefile |  1 +
 drivers/mtd/spi-nor/bohong.c | 18 ++++++++++++++++++
 drivers/mtd/spi-nor/core.c   |  1 +
 drivers/mtd/spi-nor/core.h   |  1 +
 4 files changed, 21 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/bohong.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 5e68468b72fc..c8849cf5124f 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -2,6 +2,7 @@
 
 spi-nor-objs			:= core.o sfdp.o swp.o otp.o sysfs.o
 spi-nor-objs			+= atmel.o
+spi-nor-objs			+= bohong.o
 spi-nor-objs			+= eon.o
 spi-nor-objs			+= esmt.o
 spi-nor-objs			+= everspin.o
diff --git a/drivers/mtd/spi-nor/bohong.c b/drivers/mtd/spi-nor/bohong.c
new file mode 100644
index 000000000000..8ba4f3a32040
--- /dev/null
+++ b/drivers/mtd/spi-nor/bohong.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/mtd/spi-nor.h>
+
+#include "core.h"
+
+static const struct flash_info bohong_parts[] = {
+	{
+		.id = SNOR_ID(0x68, 0x40, 0x18),
+		.size = SZ_16M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	},
+};
+
+const struct spi_nor_manufacturer spi_nor_bohong = {
+	.parts = bohong_parts,
+	.nparts = ARRAY_SIZE(bohong_parts),
+};
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4129764fad8c..29c28ee683a1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2037,6 +2037,7 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
 
 static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_atmel,
+	&spi_nor_bohong,
 	&spi_nor_eon,
 	&spi_nor_esmt,
 	&spi_nor_everspin,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index d36c0e072954..c293568ae827 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -601,6 +601,7 @@ struct sfdp {
 
 /* Manufacturer drivers. */
 extern const struct spi_nor_manufacturer spi_nor_atmel;
+extern const struct spi_nor_manufacturer spi_nor_bohong;
 extern const struct spi_nor_manufacturer spi_nor_eon;
 extern const struct spi_nor_manufacturer spi_nor_esmt;
 extern const struct spi_nor_manufacturer spi_nor_everspin;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
