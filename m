Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA85C5321D
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2024 03:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uoP8D1249DUKS3a0BWFv6K39mSU0YFl6GqXHdC6AMQc=; b=zdg5R1eJ2r7cLR
	qXKBsSIGSVRYuII2+nffhtK1LdpARGV0mxDKm+4dRqrFWHlHczhoMOivYXanaDv23+ZldrRB6KY+p
	NNY3UZwc2x+TFAdeT83Cl+t0IataJdSLEQxdyfaoTNMJFXwN7iVsCnPOf6PqOw3RWRgsVwOvpMJRV
	Y51QVl8P6sM2HGJqflnGpfhaQuRRgI3Xsej1yKeADb7GNigKQ1h7r8tiyl+xE8qIz4X9Nr+NB/ac3
	lktxrD0QZ2UQNEN75mVf/Ds3qlF/YGiNxKkygYdgD8GMUmzjzsLCymQhAea+8fVQDgczXznOk23gb
	2+tHFSvADiOk3Z6Cjscg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjs4m-00000004TtY-2ZIM;
	Fri, 30 Aug 2024 03:13:28 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjs0Q-00000004TIh-48rs
	for linux-mtd@lists.infradead.org;
	Fri, 30 Aug 2024 03:09:00 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20219a0fe4dso11710385ad.2
        for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2024 20:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724987338; x=1725592138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KuQTixSPx4OS87AYXUyEdg+MFe4vx1/yILc0i5h5c/o=;
        b=btLKQ0mZ4O8znr3ygX7Fl5btIVTdLx6MTo+LbmQE61TIrxaFbPwt4GSZu88QZklMU6
         iDNI3cSVeBC9m6B1c1B/EoJ6//8jQ975yFuIOVrJTaZLO9jZinw9MpRXKkY6molqxSZA
         541VP0fgOGIeGHQXaEdwW+6GhYnfaA+fFCBVTtv6gP/vhr8OvQDkJSXGgGsGmGpMbZln
         oE/DNBPEMVWowxo/H3KEBPjXOUCRkRChXdDN6UkQkL9R3QPnDzWLoDi67rJusdA/SLcH
         SLl/wIWo//fjqyXmevdnAe+aoyfd6p5QzmuAYXvQWGNCLEoqZ3cnpHoCU77Bp3aJ46jk
         Jhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724987338; x=1725592138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KuQTixSPx4OS87AYXUyEdg+MFe4vx1/yILc0i5h5c/o=;
        b=I/zifDTvak50jS5lIG/ZZoRMAf8eGAZeG0EYoFfWGvSIBbRnof2x86Kf8RMf56Z9OJ
         jFkKw3D7c2yfWENz3grx+eNWA0nBLJXRxpyt+SOABYj44GULrD3znPNyhhQd/aXyf1nF
         QsGClgOMvcqcxqv1slHhtQlNqzbbbZNWY0yf41c6HCN0lCMmf6dcdSLBd65Khlg7WKfC
         wohldYXzZFKkC5DUVg4zDym5cXfiYhSzMlSslpqKV8ar/IC1fKL0TOJAtD3O6CQTpEH9
         Bwlue5OxVweD9yI+uxfoOLirbpEN2X69WtpDqgq48nRdILjdscezK1af00A8kYueY06u
         +Mew==
X-Gm-Message-State: AOJu0Yw7H+iWIosy7Uj/P4qp9iV6wZnppcGauyU+j9FGSH7d1DLjn5Lf
	7+hhkv67X+RVA11KFTEbNQsFB0KW3XF0raevFI7I38Y4iEdKnECeRmKRYA==
X-Google-Smtp-Source: AGHT+IF7VqECO46wxl84htI+/yu5XX/ra0dZw5ukLCGd2JAfRC/gqtkkVFBswC3IE0Y0DIMwE8HsmA==
X-Received: by 2002:a17:902:e5c1:b0:202:1033:8d25 with SMTP id d9443c01a7336-2050c388593mr52773105ad.35.1724987337462;
        Thu, 29 Aug 2024 20:08:57 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515550badsm18009495ad.241.2024.08.29.20.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 20:08:57 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH] mtd: spi-nor: spansion: Add support for S28HS256T
Date: Fri, 30 Aug 2024 12:08:41 +0900
Message-Id: <20240830030841.24500-1-Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_200859_057455_D93B51F2 
X-CRM114-Status: GOOD (  12.24  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Infineon S28HS256T is 256Mb Octal SPI device which has same
functionalities with 512Mb and 1Gb parts.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Datasheet can be found:
https://www.infineon.com/dgdl/Infineon-S28HS256T_S28HL256T_256Mb_SEMPER_Flash_Octal_interface_1_8V_3-DataSheet-v02_00-EN.pdf?fileId=8ac78c8c8fc2dd9c018fc66787aa0657

Tested on Xilinx Zynq-7000 board and Infineon internal SPI controller.

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s28hs256t

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
345b19

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450080105fe00000114000100ff84000102500100ff050001055801
00ff8700011c6c0100ff0a000104dc0100ff81000116ec0100ffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffffffffff7218affffffff0f000000000000
0000eeffffffffff0000ffff00000c2100ff00ff12dc23faff8b82e7ffe1
ec2319497ab07ab0f766805c000000fff910f8a10000087c0000bc020000
0000ffff8e8e41129fff21ffffdc00ee800b7171656500b0ff96a80b0000
0c551ca20000800000000000c0ccffeb88fbffeb00650090060500a10065
009600650095716503d0716503d0a46bfb0290a579a20040288e0000ff00
0000ff0071650690716506900000000000000000716506d1716506d17165
0691716506910000ff000000ff00716505d5716505d50000a01500000601
000000000080710500004306fc65ff0804008000fc65ff4002008000fd65
ff0402008000fe0002fff1ff0100f8ff0100f8fffb01fe0102fff8fffb01
f8ff0100f1ff0100fe0204fff1ff0000f8ff0200f8fff701f8ff0200f1ff
0000ff0400fff8ffff01

zynq> sha256sum  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
4e3ebd30c193c4dc3cd25bf751caf2c7d97306413fc9b58404dc07a9a3e99989  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 1S-1S-8S
  opcode        0x7c
  mode cycles   0
  dummy cycles  8
 8D-8D-8D
  opcode        0xee
  mode cycles   0
  dummy cycles  24

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x12
 8D-8D-8D
  opcode        0x12

zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params
name            s28hs256t
id              34 5b 19 0f 03 90
size            32.0 MiB
write size      16
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_4BAIT | HAS_16BIT_SR | IO_MODE_EN_VOLATILE | SOFT_RESET | ECC

opcodes
 read           0xee
  dummy cycles  24
 erase          0xd8
 program        0x12
 8D extension   repeat

protocols
 read           8D-8D-8D
 write          8D-8D-8D
 register       8D-8D-8D

erase commands
 21 (4.00 KiB) [2]
 dc (256 KiB) [3]
 c7 (32.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-0001ffff |     [  2 ] | no
 00020000-0003ffff |     [   3] | yes
 00040000-01ffffff |     [   3] | no


zynq> test_spi.sh
random: crng init done
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 3.491336 seconds, 586.6KB/s

Erased 2097152 bytes from address 0x00000000 in flash

Copied 2097152 bytes from address 0x00000000 in flash to spi_read

0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000

4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read

Copied 2097152 bytes from spi_test to address 0x00000000 in flash

Copied 2097152 bytes from address 0x00000000 in flash to spi_read

b84316fcef69ba344f83fd5ffa34a4a18e05a7beb288ae5eab867166d810f504  spi_read
b84316fcef69ba344f83fd5ffa34a4a18e05a7beb288ae5eab867166d810f504  spi_test

Erased 2097152 bytes from address 0x00000000 in flash

Copied 2097152 bytes from address 0x00000000 in flash to spi_read

4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
b84316fcef69ba344f83fd5ffa34a4a18e05a7beb288ae5eab867166d810f504  spi_test

zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 33554432 (32M)
mtd.erasesize = 262144 (256K)
mtd.writesize = 16
mtd.oobsize = 0
regions = 3

region[0].offset = 0x00000000
region[0].erasesize = 4096 (4K)
region[0].numblocks = 32
region[0].regionindex = 0
region[1].offset = 0x00020000
region[1].erasesize = 131072 (128K)
region[1].numblocks = 1
region[1].regionindex = 1
region[2].offset = 0x00040000
region[2].erasesize = 262144 (256K)
region[2].numblocks = 127
region[2].regionindex = 2

---
 drivers/mtd/spi-nor/spansion.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 6cc237c24e07..1390fe6f811d 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -966,6 +966,11 @@ static const struct flash_info spansion_nor_parts[] = {
 		.name = "s28hl01gt",
 		.mfr_flags = USE_CLPEF,
 		.fixups = &s28hx_t_fixups,
+	}, {
+		.id = SNOR_ID(0x34, 0x5b, 0x19),
+		.name = "s28hs256t",
+		.mfr_flags = USE_CLPEF,
+		.fixups = &s28hx_t_fixups,
 	}, {
 		.id = SNOR_ID(0x34, 0x5b, 0x1a),
 		.name = "s28hs512t",
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
