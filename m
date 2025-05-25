Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B91AC54FB3
	for <linux-mtd@archiver.kernel.org>; Sun, 25 May 2025 14:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRSlBXnieWnQRF5MokRxPBPqc/Q0EWcpjS2TvJN4Xpk=; b=lNikaSGMUc878A
	/+tKq6PfOb69MrHLLW/vrgGGjjGRr/see0eMd4JQYcp8wdigY7qAMufoyhWY+pxjfEkBEvfj21Yck
	Nk9YZGN1n+URnhDoZ0MKrfHQlqiMyEn5RHpNz3h5/IgA7ar8uWZyOnEwdgQkHT3SE+/vI/9l1GmE4
	+MdaagUrnmj5MCjUzMWaPE843gMm/HVMjzjrvk/NR+SDeX3Ney2hgi73YopdGVevr39k6+OiSgsGV
	CmalYX/rpiHf1G18U6u1AFHZiYVf/c/HjblSFKVwf9aehqusHn/uZWJcmRAjaoDA0MnBoJtrUGG8O
	Bsxkt1hw8ccOCBGM2y+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJCpH-00000007E9w-1ssj;
	Sun, 25 May 2025 14:59:47 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJCpF-00000007E7t-00A2;
	Sun, 25 May 2025 14:59:46 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-234549aed3cso2087185ad.1;
        Sun, 25 May 2025 07:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748185184; x=1748789984; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXejBFEj6FRPX9mWDkSnn+w1UiFxF9d3DIj79kC12jY=;
        b=ensP7tpQLKdnVuxvkiO760nOwUvtAYVyI5QONrOMkHkoqe4li/UT2LLVtdwu7FU9Mt
         tJ9wYPdrSp+ra3n0w5256VmQO/w9MbooG/CoH+0tugGuW/Gygl7mh8Xsu9rys/PRhf2t
         n6yGmiVwlbDRGTwIZQPac7jeScS/UwdpHAfwJA0fLwLWnZpR0JHX+keqsVC542UL6Pcr
         1vo9aUnnfpUIeepgd/xp0aQT61fZ43BBdcfj70GBRzVi0bKEWJ50+knt31rlgaeK//Vb
         THbvl3eDYkd4fov5wdS/Xq0RSa84HB7uJTs/SIczONME4FONreFDLFUow03KBo1jDL/9
         PtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748185184; x=1748789984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXejBFEj6FRPX9mWDkSnn+w1UiFxF9d3DIj79kC12jY=;
        b=h3eTIduFvIJiYV6TPytAMyQGTJSvMXUCoxdDEKBLJebHaWcehAgzCW4GOQ9OEwavfc
         wjNylMp/GmvNmNSlDtb21WLcKO/9X3ESz5fXQmgg+VB+U9ts4FtzMBW6vTpkSs85b+5i
         B7cHx+sESKPqAHEp6MQpOy5D9faP0Vkw07iK4d7jz0gI9OgDXOfRYtRbq+caR6mE8vnL
         iCpysj83gn2VwGb+9Q0+7j+F5PVJ2CqeyURpWNYqVzkK/C265SHrQiKHV2TWvr6un53h
         D3awDDc/S73wqagJhypj+KaAh6+pjj1SOniWRomOuHliL2yT8Mz+6DCgLTnalIuWNM7h
         D4wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnFxhZ0dvXenqtI3Jot2qeiEbUJLjgO2B2nOalIJoewu/oxlkXuZcP4zSu1oRBSAr7mvBhkS4OaNJLcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9f9sv7TKHXE9FYahY2cxrO/3AMCCJhH3lRT3UAmQETlDargbJ
	KfHqKzrai95dv6Uogz+i1h4csTUme7L39wzvWR8tJLA+R+kDx96TQs9N
X-Gm-Gg: ASbGncuj/PpmAUDhO2m7jpZAupC/LLcYkREeTQhTPx3nvvpJcTGORG3RXlhyuwLQHdV
	Fm/+9zZKJID9S6XV+bU2N1OuTZufrN7Ab99jsoxsICcElbvDhoCDJmygF3wXbZ/7VNz+lWdbMlw
	dmkCjPmbcSOliWfmFEsGO2KssghhNvKsV8SNNo/MUcY6nfel9l1/XQLAdy5DqpNWebiUqOJ0+dX
	Gn4gRbdenDH6JwyCdDGKWED/f+P/xr5jXqwKL+o11hJ/MbueGeDKz+KOnxaGnWmdFTNsVBZtbtM
	MEuXbQzNynbrA/D6GWSOXCnLMQZI3LdM8R6EdZTizL0=
X-Google-Smtp-Source: AGHT+IGpOn2nt4PyX10sWV3ae3HVZcjQVmBHlpCN7r+ofLFDskuKSTxzG6u7YqEh4FeY/mojwGAmSQ==
X-Received: by 2002:a17:902:e78c:b0:224:1eab:97b2 with SMTP id d9443c01a7336-23414fda854mr101170205ad.53.1748185183789;
        Sun, 25 May 2025 07:59:43 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2343f8e2fbesm12204845ad.250.2025.05.25.07.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 07:59:43 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 25 May 2025 22:58:42 +0800
Subject: [PATCH v2 2/3] mtd: spi-nor: Add GD25LB512ME GigaDevice flash_info
MIME-Version: 1.0
Message-Id: <20250525-sfg-spifmc-v2-2-a3732b6f5ab4@gmail.com>
References: <20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com>
In-Reply-To: <20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748185167; l=5052;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=NWZjWwn9bggPj1MEcmOLOCAvWAB+LiAQaYSOX4JjTAY=;
 b=hBZ9eo0GjgMXLNujvFODlvmX5r9TUOBoz1q/wOVzuySCOg8us5GMhMWN2ZdSLtG7KtKdhmW1i
 YzuMbOt+6UhBFuwE+pW+lBOlRNFaYBAQKooQBz4XRnuFNlbPN48k0bj
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_075945_050513_D34CF7C6 
X-CRM114-Status: GOOD (  12.99  )
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

Add GD25LB512ME SPI-NOR flash information.

The following SFDP dump was generated after applying the current commit.

------------------------------------------------------------------------
This flash is populated on the SG2042 Pioneer board and was tested at
100MHz frequency using the spi-sg2044-nor SPI controller.

root@localhost ~ # cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
gd25lb512me
root@localhost ~ # cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c8671a
root@localhost ~ # cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
gigadevice
root@localhost ~ # xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060102ff00060110300000ffc8000103900000ff84000102c000
00ffffffffffffffffffffffffffffffffffe520eaffffffff1f44eb086b
003b00bbfeffffffffff00ffffff44eb0c200f5210d800ffd531b1fe83d6
1458ec6006337a757a7504bdd55c2906740008500001ffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffff002050169df9
8156d9c8ffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffff38ff0ff215cdcff
root@localhost ~ # sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
859eb314b0500aa3e3dc5a1ad514f1013387c7aaa40147ed2d616ffc4b6d851c  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
root@localhost ~ # #Dump debugfs data
root@localhost ~ # cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-4S
  opcode	0x6c
  mode cycles	0
  dummy cycles	8
 1S-4S-4S
  opcode	0xec
  mode cycles	2
  dummy cycles	4
 4S-4S-4S
  opcode	0xec
  mode cycles	2
  dummy cycles	4

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x12
 1S-1S-4S
  opcode	0x34
 1S-4S-4S
  opcode	0x3e
root@localhost ~ # cat /sys/kernel/debug/spi-nor/spi0.0/params
name		gd25lb512me
id		c8 67 1a ff c8 67
size		64.0 MiB
write size	1
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | SOFT_RESET

opcodes
 read		0x13
  dummy cycles	0
 erase		0x21
 program	0x12
 8D extension	none

protocols
 read		1S-1S-1S
 write		1S-1S-1S
 register	1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (64.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-03ffffff |     [ 1  ] | no
root@localhost ~ # dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.0279486 s, 75.0 MB/s
root@localhost ~ # mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
root@localhost ~ # mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
root@localhost ~ # hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
root@localhost ~ # sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
root@localhost ~ # mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
root@localhost ~ # mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
root@localhost ~ # sha256sum spi*
a2ebfaebe38974847a4efb628b29a72f1d50e78c17318869d8954b033dc32e5d  spi_read
a2ebfaebe38974847a4efb628b29a72f1d50e78c17318869d8954b033dc32e5d  spi_test
root@localhost ~ # mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 67108864 (64M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 drivers/mtd/spi-nor/gigadevice.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index ef1edd0add70e6ca501620798a779d621d6bb00d..223b2f598ecd651ce8df6789dfbaf938c534f94f 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -33,6 +33,15 @@ static const struct spi_nor_fixups gd25q256_fixups = {
 	.post_bfpt = gd25q256_post_bfpt,
 };
 
+static void gd25lb512me_default_init(struct spi_nor *nor)
+{
+	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+}
+
+static const struct spi_nor_fixups gd25lb512me_fixups = {
+	.default_init = gd25lb512me_default_init,
+};
+
 static const struct flash_info gigadevice_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xc8, 0x40, 0x15),
@@ -82,6 +91,14 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x67, 0x1a),
+		.name = "gd25lb512me",
+		.size = SZ_64M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
+		.fixups = &gd25lb512me_fixups,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
 	},
 };
 

-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
