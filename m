Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B0FC36002
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Mar 2025 09:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3qg3cIMPwlJVONqvIj30BYDP9pcgpgFU6NjMktW/EFc=; b=KSKYYFauuZbOfr
	pGArwDJ7ua7RojaTfzVYWELx1XJ7LCjgDDsMyYM7fsqbj3APPQOnsAeENkK/AOmgR4dtRh2uAkr/F
	qNG8oXQjY63DcQHfI2Cln+ASavc/5jKXn3gcYQs3Z1yV7yWUMR9gYqJcPOKdhcs8ybCj7Sxp+AFUX
	Ql7btFKFY+21BZw1KKDZVAyGS9pgbTSIJHluLELgMeMGBnZFXJLeZcNHvhFZyRWZGizutUQrmmoSR
	HS2S5OlP2fU54/f5a0rt+a7K6bdxR/Mq2TmWypdRt7A//EPjN61+oO4AvkKr4XrUMp8qH82LGcvdq
	QjTIU94V0hT5JxS7iIVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqBB-00000008ar7-2DWH;
	Wed, 19 Mar 2025 09:57:41 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuq21-00000008Ynw-1Qqv
	for linux-mtd@lists.infradead.org;
	Wed, 19 Mar 2025 09:48:14 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so8983556a91.3
        for <linux-mtd@lists.infradead.org>; Wed, 19 Mar 2025 02:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742377692; x=1742982492; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KiTUzGwvFyFv761R//GGBbXNIZo/DnycRt14EYeHTgo=;
        b=CPXavIwhbE/RwdMXySV+615vBd7I1w0GzcuWYjM72dZBDLdaeKThKxgLaWpSMpaxgq
         6D6PFHBQNLGg8h6sUu8H3yvNFgNsvY8yMTy8JBhOma8FTJIOThTMfxFu4yHXhoXTK7HC
         QXCzW6eNI0681VenZngE98pkzULnv73PIp+RBdsyvO9VVZDBID+moOfMr/cvHD+5RJ3Z
         6HQLaoRQLFlQwMxdf8Z+CMEXQ/5lFqznD3HdJNmGE6V68tCN7MU+kTCGo8VOz7yqJfTB
         HCvKhxav3TGx8OZa6WXgSarud5nZjkR3gBZb4SrzL03wMW9a+gvCdEgpatQOUKBNPHfK
         RMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742377692; x=1742982492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KiTUzGwvFyFv761R//GGBbXNIZo/DnycRt14EYeHTgo=;
        b=GS/Cpibg1d3Cs2JwdXRZ1MCo8z0WXskR1R4erA+3iOWoFsDhLwJvwwpyeQvtX08Ewm
         11I7+xJfOBCMVft9d+DMGnK9Zc9hsWCm68Z2BQfj5RdqQ1zSE+r0Y0nfYPNk1wATx3hB
         tu5Lysd1LOZkVidvEUXHw6SoB4gZJRVmOU2YPfpuBo11okt8F+/vTguYpehDLrflL3Aj
         vczkJTCWDTfYbxiQh+wOwohvKSwdD4xDmMX8WB4+kOiu0aE1BiYVzWxT4uI3eCt3kwcN
         WQBPQO50GKgp3gcO2MCwkHB9VF+Ut6dehkrpp+yq8I7HDR5wofaxI40W60NjdJ5Ep+qM
         Zwsg==
X-Gm-Message-State: AOJu0YwwVkTTuMN77q939BwwGdg8KMG5lDk+tQkXwQIIF4gc167QoeEY
	5XPG3Fy8LTw6M4aM1llkT3js3aO5HbK9/Qh978GdRaeUEV9EUe96
X-Gm-Gg: ASbGncsiDUbSRMInHbY1wABeu1778FoxukKbyoS+DLwUwsnG7fxmyJdGXnbmG02MYwB
	qIyGToJDvXImRn2jCH+0fKsJ8H+Nz/WcN19+9pkWHf34EO6BltEQ4aRLJUeRrRc+/6CNMicgdpd
	wW6fW3Qf7aY6CNLCV39AtWBgq4A9/W8uWEJDF0O3dED0tAqcutxGzpa0UX/osvum7kwrcEckK9A
	E+6Cy/Gm8POtN7s9HUln4MaMHJbHI0FOFyyJeLf/+yWwNnXR8zmbx5srU7dIzSp8C0ppJDtH4xr
	4h9CcJ7jgixdkJAnGjb/+Ma21OtlTVZ+HINK5GXwl2ShJVWSafgUYv86iSjlc0kI3UB3Q6vTd8z
	jax51DUB7pBjWZZ5bqKhVVBVzvj2sFIN0GKfNow==
X-Google-Smtp-Source: AGHT+IEin/jt2ASBEcMtODVnqqCgSCoRtBaLeGh0U/3tk7TLTthhHL8kXoEEhL0k2uSwLyJovIffMw==
X-Received: by 2002:a17:90b:4a11:b0:2fe:b174:31fe with SMTP id 98e67ed59e1d1-301bde51a32mr3019875a91.2.1742377692348;
        Wed, 19 Mar 2025 02:48:12 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf589bccsm1103483a91.11.2025.03.19.02.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:48:12 -0700 (PDT)
From: Takahiro Kuwano <tkuw584924@gmail.com>
X-Google-Original-From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Date: Wed, 19 Mar 2025 18:47:45 +0900
Subject: [PATCH 3/3] mtd: spi-nor: spansion: add support for CYRS17B512
MIME-Version: 1.0
Message-Id: <20250319-snor-rdid-dummy-ncycles-v1-3-fbf64e4c226a@infineon.com>
References: <20250319-snor-rdid-dummy-ncycles-v1-0-fbf64e4c226a@infineon.com>
In-Reply-To: <20250319-snor-rdid-dummy-ncycles-v1-0-fbf64e4c226a@infineon.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bacem Daassi <Bacem.Daassi@infineon.com>, 
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742377674; l=6571;
 i=Takahiro.Kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=oC9jr2u9u9kL8fmEU1SCe11rMhVquUDrj9AQX+3QGZI=;
 b=TVoDc7eh8RNj9bGWHNK0BXFWDvjHKkJETkqaH5rgr0BVxciS9BHCm8k6P8cnic04UzhJhw96c
 a84edkoKF/RAekTKOMVe2JIygSpOc0Q3j3yPei1yRrjT1d/HL00S4W/
X-Developer-Key: i=Takahiro.Kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_024813_385642_1877E343 
X-CRM114-Status: GOOD (  13.97  )
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

Add device ID info and fixups to support Infineon CYRS17B512 flash.

Although this flash has untypical features such as dummy cycles in RDID,
inverted erase polarity, larger program page size with automatic page
erase, and larger sector size, it supports basic flash commands
including SFDP.

Link: https://www.infineon.com/dgdl/Infineon-CYRS17B512_512_MB_64_MB_SERIAL_NOR_FLASH_SPI_QSPI_3-DataSheet-v07_00-EN.pdf?fileId=8ac78c8c8fc2dd9c01900eee733d45f3
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Tested on Xilinx Zynq-7000 board and Infineon internal SPI controller.

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c1601a

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion

zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450080102ff00080114000300ff84080102500300ff8700011c5803
00ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffffffffffffff7ffe2ffffffff1f48eb086b
fffffffffeffffffffffffffffff48eb142017d800ff00ffa028fdffb73f
84a2e0fb1fc4ffff7a75f7ffffff22f65dfff050f8a10000000000002c00
00000000f6fffffff30600fe21dcffff0000800000000000c0ffc3ebc0ff
c3eb00650090066500b1006501950065019671650494716504d000000000
b02e000088a489aa71650393716503930000000000000000000000000000
0000000000000000000000000000000000000000000000000000716503d4
716503d400002020

zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
a2fec0f47c5aa119e21c3d50a173e2ba  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 1S-1S-1S (fast read)
  opcode        0x0c
  mode cycles   8
  dummy cycles  8
 1S-1S-4S
  opcode        0x6c
  mode cycles   0
  dummy cycles  8
 1S-4S-4S
  opcode        0xec
  mode cycles   2
  dummy cycles  8
 4S-4S-4S
  opcode        0xec
  mode cycles   2
  dummy cycles  8

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x12
 1S-1S-4S
  opcode        0x34

zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              c1 60 1a 00 00 00
size            64.0 MiB
write size      1
page size       2048
address nbytes  4
flags           4B_OPCODES | HAS_4BAIT | HAS_16BIT_SR | SOFT_RESET

opcodes
 read           0xec
  dummy cycles  10
 erase          0xdc
 program        0x34
 8D extension   repeat

protocols
 read           1S-4S-4S
 write          1S-1S-4S
 register       1S-1S-1S

erase commands
 21 (1.00 MiB) [2]
 dc (8.00 MiB) [3]
 c7 (64.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-03ffffff |     [   3] | no

zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 67108864 (64M)
mtd.erasesize = 8388608 (8M)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

zynq> ./test_spi_cyrs17b512.sh
8+0 records in
8+0 records out
8388608 bytes (8.0MB) copied, 0.308282 seconds, 26.0MB/s
Erased 8388608 bytes from address 0x00000000 in flash
Copied 8388608 bytes from address 0x00000000 in flash to spi_read
0000000 0000 0000 0000 0000 0000 0000 0000 0000
*
0800000
2daeb1f36095b44b318410b3f4e8b5d989dcc7bb023d1426c492dab0a3053e74  spi_read
Copied 8388608 bytes from spi_test to address 0x00000000 in flash
Copied 8388608 bytes from address 0x00000000 in flash to spi_read
8f8842585053d5200d7d80bc766dcf8bbe9f4fea08499c576f67ed631050b6c3  spi_read
8f8842585053d5200d7d80bc766dcf8bbe9f4fea08499c576f67ed631050b6c3  spi_test
Erased 8388608 bytes from address 0x00000000 in flash
Copied 8388608 bytes from address 0x00000000 in flash to spi_read
2daeb1f36095b44b318410b3f4e8b5d989dcc7bb023d1426c492dab0a3053e74  spi_read
8f8842585053d5200d7d80bc766dcf8bbe9f4fea08499c576f67ed631050b6c3  spi_test
---
 drivers/mtd/spi-nor/spansion.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index bf08dbf5e7421f8725a9931e36acaf3f7348db42..5c9588b02b7e61f1b64e5dc61e5c1f976ac58508 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -758,6 +758,18 @@ static const struct spi_nor_fixups s25fs_s_nor_fixups = {
 	.post_bfpt = s25fs_s_nor_post_bfpt_fixups,
 };
 
+static int cyrs17b_late_init(struct spi_nor *nor)
+{
+	/* Fast Read requires mode cycles */
+	nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups cyrs17b_fixups = {
+	.late_init = cyrs17b_late_init,
+};
+
 static const struct flash_info spansion_nor_parts[] = {
 	{
 		.id = SNOR_ID(0x01, 0x02, 0x12),
@@ -996,6 +1008,11 @@ static const struct flash_info spansion_nor_parts[] = {
 		.name = "s28hs02gt",
 		.mfr_flags = USE_CLPEF,
 		.fixups = &s28hx_t_fixups,
+	}, {
+		/* cyrs17b512 */
+		.id = SNOR_ID(0xc1, 0x60, 0x1a),
+		.mfr_flags = USE_CLSR,
+		.fixups = &cyrs17b_fixups
 	}, {
 		.id = SNOR_ID(0xef, 0x40, 0x13),
 		.name = "s25fl004k",

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
