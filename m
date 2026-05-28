Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09465CD5BD5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2026 05:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2MzHJqA4r9FP0OiZuQrR4A0duRPU2F1LTwgtofeYlis=; b=NeuOC0d/V1mgmu
	eUzrBwoa8qGDM/jjGYGQej+zHQkT+tIN+f9FqZbauNimyP7DubFRVumY4+P0IFnlm99+FLcv+h4OD
	d4/W/Ti0HXB+Yh/9WEBlgYzP/bt9Mt1VbFPelq6128lV+N7kI8AVleM90mClRnxBpwEFnp/CR1VSH
	wZvvLKTq+HITtGcCwb0kZnyVlZJJMQSGi38VOGKNuq0fSykzTO4AqmOXR8ssKbu4wCsrNzt2GW9jn
	XsmZSByBux3CJuRHwycTqH4wHJTV3taTCn7mZmlbQHGih26cMDm85OuNJwcuu4YWbrMyHiJ22cAJn
	WDKdPrxKQEvdkXOvlBlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTAT-000000058I8-3J6A;
	Thu, 28 May 2026 05:20:29 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTAQ-000000058Hj-3gtI
	for linux-mtd@lists.infradead.org;
	Thu, 28 May 2026 05:20:28 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-369002b26f4so7302043a91.3
        for <linux-mtd@lists.infradead.org>; Wed, 27 May 2026 22:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779945625; x=1780550425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjGtLzO2HanIiK43HgLOPftGVf4OR0HNAd0NSMfxuBo=;
        b=Nb+UvMIRffoVoGGbGwR1M0nSxAIe5fTSoIQ5VjkMGFp7QUlaxHk1O9D9CJhvmxZZF/
         fKjQQfIshkH/F1GQg/Ii/d4/SUMFRZnKV0DodXJWwfGeWks5CJlPBFb6sdMu9pcJgw9+
         /5RL7FE7h6W5UoDizPPYXV2DC2WMKxZDP0fg8TOq7aIf3cmeVnzy09YcZqUEq0j7Tj9m
         yp2wy6S7QYR50m64cPH7zHTi0R53IW09TGMGfCcuROgmRfud6AsC2wf5zwxW6+ydE4Zj
         qIhhvdMRYxbHkFnBIDybM2KGgqrCl1gKq75Rm62g8S970EiDoMtCDw61HdAM42ozsfn6
         Ptsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779945625; x=1780550425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjGtLzO2HanIiK43HgLOPftGVf4OR0HNAd0NSMfxuBo=;
        b=BolFOWhm9Bh1D26YuCA10dI3gzDreD7xGRqGgBlj9zsgKkZrHHekGamoD4CY9+4M9u
         vtPC5mO3EXILdq8romHwbkEEGS3/98yj/FaCiv4kBECN1BwCH7Yasy6NroW7ogz+YtIy
         vuLS/RPCbMThZwYTbmQAXAbsy688KeOPPvAs0WJQeOHYKI2Uqv0Y2mX+tHKe7JOqRfN4
         uzSoACslc9MHy5fSBL8kpscWOr8bndlNz6URT9GyA2zdrE8kTIzKbhf00cKYkF0znQ9m
         /oKMyrAAfkUQkU0peq7PUI6G5Oafcekh3ro9CnWquq7nKlHf8C+s0jasZ+SFZ87179nz
         Kxpw==
X-Gm-Message-State: AOJu0YzDbMkX4t9h2BzBo36/9L4i8xZClkgOtGLw9mjBQ+6ZDceVvv2E
	k4ey9KwZKuiqNj7ptMlsoCrApxYqkgRhXNZF7/62U0/DonD8pa6bYcRz
X-Gm-Gg: Acq92OHipTxSIUa1rc8d4ko9lc47M03633OhbHFnfVU0o792QXEFO4Oft6f6p6p9dOm
	jR2BoWk+MGZZvsvsbxF2CU63DZFD9R46QVP2jD+jm0PW/prFPJQebjzMO+aNRu5JjLUuW4P9+1F
	gw2JZ7ygkntht8uXrhGWd+8O5gRp59LiBQOTbm5bCw0/cchpOI2UnJiEpSX7o/eL+8es7rhZ6op
	VN5e2GXo31e1viQ68gaBvXggWBFXoSfp4q31qAlCYtqyH4vlNBYH508I+FKjlxL3iqXrSmeLIMG
	I930YHrwqvQ2Vi6AAmDWoKiecUL749Zvo2vW172lSNKlLz+gEw043mw3XAEw8zJuWR9Yp8GDoSe
	GJ8kHfKHSYy4CYE9dvQSTOtJnxlDQjxwhGTd48CmAEVmEiiJI94WwIasqZoIO6r0CILAFcNgyYz
	vHsbyORtr6UbvEENISfMEL2CiFmoxIcGPMMNYCeF1md9gD22fiYKZ3PyUA
X-Received: by 2002:a17:90b:2b4e:b0:35f:d56d:1c45 with SMTP id 98e67ed59e1d1-36a6772ff38mr27327004a91.12.1779945625363;
        Wed, 27 May 2026 22:20:25 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b9096dc30sm581434a91.17.2026.05.27.22.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 22:20:16 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 2708D4163B6F;
	Thu, 28 May 2026 13:20:14 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH] mtd: spi-nor: Add support for MX25L12833F and MX25L12845G
Date: Thu, 28 May 2026 13:17:51 +0800
Message-Id: <20260528051751.1648246-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_222026_940782_485515A1 
X-CRM114-Status: GOOD (  14.90  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Add support for Macronix MX25L12833F and MX25L12845G.

The SFDP tables for these flashes only declare 1-4-4 Page Program
support in 4-byte address mode. However, since these parts operate
in 3-byte address mode, the standard SFDP parsing does not automatically
enable this capability. To address this, this patch introduces
macronix_4pp3b_late_init_fixups() to explicitly enable the 1-4-4
Page Program.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
- mx25l12833f

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id 
c22018

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer 
macronix

zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060102ff00060110300000ffc2000104100100ff84000102c000
00ffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
083b04bbfeffffffffff00ffffff44eb0c200f5210d800ff8241bd0081e5
7bc64403673830b030b0f7bdd55c4abe29ffe1d0ffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffff0000ffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffff003600279df9c06485cbffffffffffff

zynq> sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp 
c7c4287a584fa23f4f5037a90ab0ee6ddc6ff3f0cee89889e54465e86542c85e  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities 
Supported read modes by the flash
 1S-1S-1S
  opcode        0x03
  mode cycles   0
  dummy cycles  0
 1S-1S-2S
  opcode        0x3b
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbb
  mode cycles   0
  dummy cycles  4
 1S-1S-4S
  opcode        0x6b
  mode cycles   0
  dummy cycles  8
 1S-4S-4S
  opcode        0xeb
  mode cycles   2
  dummy cycles  4
 4S-4S-4S
  opcode        0xeb
  mode cycles   2
  dummy cycles  4

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x02
 1S-4S-4S
  opcode        0x38

zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params 
name            (null)
id              c2 20 18 c2 20 18
size            16.0 MiB
write size      1
page size       256
address nbytes  3
flags           HAS_LOCK | HAS_4BIT_BP | SOFT_RESET

opcodes
 read           0xeb
  dummy cycles  6
 erase          0xd8
 program        0x38
 8D extension   none

protocols
 read           1S-4S-4S
 write          1S-4S-4S
 register       1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (16.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-00ffffff |     [   3] | no

zynq> dd if=/dev/urandom of=/tmp/spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.085447 seconds, 23.4MB/s

zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read

zynq> hexdump /tmp/spi_read 
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000

zynq> sha256sum /tmp/spi_read 
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read

zynq> mtd_debug write /dev/mtd0 0 2097152 /tmp/spi_test
Copied 2097152 bytes from /tmp/spi_test to address 0x00000000 in flash

zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read

zynq> sha256sum /tmp/spi*
847f8009f10c04d3664098f210f5eb5a54cf9e08bd24dbdb1a983c56e3f89256  /tmp/spi_read
847f8009f10c04d3664098f210f5eb5a54cf9e08bd24dbdb1a983c56e3f89256  /tmp/spi_test

zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read

zynq> sha256sum /tmp/spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read
847f8009f10c04d3664098f210f5eb5a54cf9e08bd24dbdb1a983c56e3f89256  /tmp/spi_test

zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 16777216 (16M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1 
mtd.oobsize = 0 
regions = 0

- mx25l12845g

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id 
c22018

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer 
macronix

zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060102ff00060110300000ffc2000104100100ff84000102c000
00ffffffffffffffffffffffffffffffffffe520f9ffffffff0744eb086b
083b04bbfeffffffffff00ffffff44eb0c200f5210d800ffd659dd00829f
03cd4403673830b030b0f7bdd55c4abe29fff0d0ffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffff0000ffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffff003600279df9c06485cbffffffffffff

zynq> sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp 
b8b7ec394194bb45effdfa2cd4de23f6a7d05a16ff44a23f86e6d10bc9a83375  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities 
Supported read modes by the flash
 1S-1S-1S
  opcode        0x03
  mode cycles   0
  dummy cycles  0
 1S-1S-2S
  opcode        0x3b
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbb
  mode cycles   0
  dummy cycles  4
 1S-1S-4S
  opcode        0x6b
  mode cycles   0
  dummy cycles  8
 1S-4S-4S
  opcode        0xeb
  mode cycles   2
  dummy cycles  4
 4S-4S-4S
  opcode        0xeb
  mode cycles   2
  dummy cycles  4

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x02
 1S-4S-4S
  opcode        0x38

zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              c2 20 18 c2 20 18
size            16.0 MiB
write size      1
page size       256
address nbytes  3
flags           HAS_LOCK | HAS_4BIT_BP | SOFT_RESET

opcodes
 read           0xeb
  dummy cycles  6
 erase          0xd8
 program        0x38
 8D extension   none

protocols
 read           1S-4S-4S
 write          1S-4S-4S
 register       1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (16.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-00ffffff |     [   3] | no

zynq> dd if=/dev/urandom of=/tmp/spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.083618 seconds, 23.9MB/s

zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read

zynq> hexdump /tmp/spi_read 
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000

zynq> sha256sum /tmp/spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read

zynq> mtd_debug write /dev/mtd0 0 2097152 /tmp/spi_test
Copied 2097152 bytes from /tmp/spi_test to address 0x00000000 in flash

zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read

zynq> sha256sum /tmp/spi*
ec344b7d2b0022ee54bf94de71b889e5fd3087a5487dcee789e0a0b056bfc6ae  /tmp/spi_read
ec344b7d2b0022ee54bf94de71b889e5fd3087a5487dcee789e0a0b056bfc6ae  /tmp/spi_test

zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read

zynq> sha256sum /tmp/spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read
ec344b7d2b0022ee54bf94de71b889e5fd3087a5487dcee789e0a0b056bfc6ae  /tmp/spi_test

zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 16777216 (16M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1 
mtd.oobsize = 0 
regions = 0

 drivers/mtd/spi-nor/macronix.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index e97f5cbd9..e91808ad1 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -83,6 +83,18 @@ mx25l3255e_late_init_fixups(struct spi_nor *nor)
 	return 0;
 }
 
+static int
+macronix_4pp3b_late_init_fixups(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_4_4;
+	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_4_4],
+				SPINOR_OP_PP_1_4_4, SNOR_PROTO_1_4_4);
+
+	return 0;
+}
+
 static const struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
 	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
@@ -96,6 +108,10 @@ static const struct spi_nor_fixups mx25l3255e_fixups = {
 	.late_init = mx25l3255e_late_init_fixups,
 };
 
+static const struct spi_nor_fixups macronix_4pp3b_fixups = {
+	.late_init = macronix_4pp3b_late_init_fixups,
+};
+
 static const struct flash_info macronix_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xc2, 0x20, 0x10),
@@ -130,9 +146,10 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
-		/* MX25L12805D */
+		/* MX25L12805D, MX25L12833F, MX25L12845G */
 		.id = SNOR_ID(0xc2, 0x20, 0x18),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
+		.fixups = &macronix_4pp3b_fixups,
 	}, {
 		/* MX25L25635E, MX25L25645G */
 		.id = SNOR_ID(0xc2, 0x20, 0x19),
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
