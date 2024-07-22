Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B495AC3DA59
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2024 08:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LjuMw3bsVDl7NdB9mhULNLmpouznFvLSjx9GXzzsLpc=; b=a9wl8pkAnpRAHr
	nXu52aMmcsuYbkktAb7QlcYGhRs17jb2WJfL3ln46lU1X2+9IXqc0uH5ytp5vapK6ZKs4NDYGkbrR
	gAExWXsMET2boqGGybyRbXI5/+pvJcn5yD2sQjNSlr8Ce187pugzDyitTzVQ+KWdbj+xEtGNoeFL+
	g2eNw0xIrzKX23ujTsIIYjq8Y2wGw06y4FRcB+9qHzYCrxPQ0ooBwFHQVCvluK+eubVKHWOWTfK1J
	iXxYaPL6C3lHXjpegnV4FFdfKBdCzaKXj8P8c+af6k1WhPDc08ntAME4wZOrCNRkpBU3GN7ZQJMAY
	yD8B7TqzJXvlQpnaZfLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVolF-00000008wZM-1w7h;
	Mon, 22 Jul 2024 08:51:13 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVolC-00000008wYo-1B67
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jul 2024 08:51:11 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1fbc3a9d23bso24062765ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 22 Jul 2024 01:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721638269; x=1722243069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hxNiJ7wIiKjtvnc9wwX6TLuO6qWJsPU7G3qlk/ncD28=;
        b=ctPwI9xBV/aaiPkDzqT7DNAVVDFEb+UZvLEMdJhqglhzH9l8qwz+qot0+hc/4EDnHv
         u/2Q6IyL4WtTEww3xIQnYDrWCnyskCuLLS8Lvevq8n1KmcXU9XfpZhtymq9gs4ZunLnm
         i4mnfgm1+OY8Lzg9ZNCJPEQOBPJYT7gMDSI9rJop4KmSSoanSngAkDl4XAumTCUPmtAF
         z+g9iGGBDCkelD+DGfoV8tNFBnDEbfQlU/fAVmKMnvlHNWb1mPqwGb+YKn5OtgCD93jU
         3WPnJBLgxGFxFU2wf/chjyOA7aDUu3M6ceC5fRbSsduIY4Zhxh7CszSSh9tlkRdcnjRH
         adCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721638269; x=1722243069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxNiJ7wIiKjtvnc9wwX6TLuO6qWJsPU7G3qlk/ncD28=;
        b=UkDBWOyRabldOhoTR9tDA6g7mwqd0jZtuq6WD+ma5VMpsM3hgBKbEsEI71aIls1D6X
         DBgTDjXcKqLlHi0Wo3tB1gzfJWVvECpJtTIj8LgMykH0tSYtEu10q19kf3TTPXsdrMYI
         9LUAUTZvORTnxSB4jNBPbBXBihiCn0yKA6qVqVEPFaSZ24CHYbfqw9q61gBOhOBTT2ZO
         F+HNMFKUNKoVdEwBY1mhzaIARjCUr45XjbqtfztsPL4TqXVxbAfiPAZifEbLFT6cXJ36
         V7pHepKVmCdhi4YrC6X+JRj+dMlx37QAQR2PNe48Vo4YaGUJLSzpiWia4ZfQEJQ7owau
         9i3w==
X-Forwarded-Encrypted: i=1; AJvYcCWNwt2cSOnZNG19gr89yPbznnUuYOfiGGJrIOZ9udRxNmGEvLdsa3mv/3hZ8nBSt8QnteD8Ah8AXXmS7uNMh4T6YKn5obWZFCnZM4jPYw==
X-Gm-Message-State: AOJu0YyyzQP3/ihAzkjG2aYEju0XHdgXZSojDvo9OKgPUjouhqDlaH0a
	miCyBlns3axsINobzyu+3NGA3+NJ3w4J92F/Sj+Kn5K8d6rxF94l69601A==
X-Google-Smtp-Source: AGHT+IGKgNP7LZLV8Nh4qEhVssgvvhPdOq1y1eJcYk/0NCSYIznF+emvZE8rAuEoJgc+yEYtJiP+bg==
X-Received: by 2002:a17:903:1d0:b0:1fd:a264:9433 with SMTP id d9443c01a7336-1fda26497f6mr10504635ad.29.1721638269015;
        Mon, 22 Jul 2024 01:51:09 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f2abbffsm49366185ad.116.2024.07.22.01.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 01:51:08 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 6B8F0805EC;
	Mon, 22 Jul 2024 17:00:49 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: leoyu@mxic.com.tw,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2] mtd: spi-nor: macronix: Add support for serial NOR flash
Date: Mon, 22 Jul 2024 16:49:52 +0800
Message-Id: <20240722084952.608770-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_015110_350795_37478A8F 
X-CRM114-Status: GOOD (  13.39  )
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

MX66U1G45G and MX66L2G45G are Macronix serial NOR flash.

These flashes have been tested on Xilinx Zynq-picozed board
using MXIC SPI controller.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2201c
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 06 01 02 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
00000010  c2 00 01 04 10 01 00 ff  84 00 01 02 c0 00 00 ff  |................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 fb ff ff ff ff 7f  44 eb 08 6b 08 3b 04 bb  |. ......D..k.;..|
00000040  fe ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.. .R|
00000050  10 d8 00 ff 87 49 bd 00  84 d2 04 e2 44 03 67 38  |.....I......D.g8|
00000060  30 b0 30 b0 f7 bd ff 5c  4a 9e 29 ff f0 50 f9 85  |0.0....\J.)..P..|
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000080  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000090  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000a0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000b0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000c0  7f 8f ff ff 21 5c dc ff  ff ff ff ff ff ff ff ff  |....!\..........|
000000d0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000e0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000f0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000100  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000110  00 36 00 27 9d f9 c0 64  85 cb ff ff ff ff ff ff  |.6.'...d........|
00000120
zynq> sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
9af233495e5cffd2f38e9e2b8334a0d51c01fa93e9a17a991f674c8d6a350358  /sys/bus/spi/devices/spi0.0/p
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 1S-1S-2S
  opcode        0x3c
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbc
  mode cycles   0
  dummy cycles  4
 1S-1S-4S
  opcode        0x6c
  mode cycles   0
  dummy cycles  8
 1S-4S-4S
  opcode        0xec
  mode cycles   2
  dummy cycles  4
 4S-4S-4S
  opcode        0xec
  mode cycles   2
  dummy cycles  4

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x12
 1S-4S-4S
  opcode        0x3e
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              c2 20 1c c2 20 1c
size            256 MiB
write size      1
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_4BAIT | SOFT_RESET

opcodes
 read           0xec
  dummy cycles  6
 erase          0x21
 program        0x3e
 8D extension   none

protocols
 read           1S-4S-4S
 write          1S-4S-4S
 register       1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (256 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-0fffffff |     [ 1  ] | no
zynq> dd if=/dev/urandom of=/tmp/spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.083620 seconds, 23.9MB/s
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
2c63296c93c97967e87279c3a4d4a9a5af4e7c2b9d2bc58579c3f01a6c522dfa  /tmp/spi_read
2c63296c93c97967e87279c3a4d4a9a5af4e7c2b9d2bc58579c3f01a6c522dfa  /tmp/spi_test
zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> sha256sum /tmp/spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read
2c63296c93c97967e87279c3a4d4a9a5af4e7c2b9d2bc58579c3f01a6c522dfa  /tmp/spi_test

zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 268435456 (256M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2253b
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2253b
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
zynq> hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 06 01 02 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
00000010  c2 00 01 04 10 01 00 ff  84 00 01 02 c0 00 00 ff  |................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 fb ff ff ff ff 3f  44 eb 08 6b 08 3b 04 bb  |. .....?D..k.;..|
00000040  fe ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.. .R|
00000050  10 d8 00 ff 89 49 bd 00  8d 12 00 e2 44 03 67 44  |.....I......D.gD|
00000060  30 b0 30 b0 f7 bd d5 5c  4a 9e 29 ff f0 50 f9 85  |0.0....\J.)..P..|
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000080  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000090  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000a0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000b0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000c0  7f 8f ff ff 21 5c dc ff  ff ff ff ff ff ff ff ff  |....!\..........|
000000d0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000e0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000f0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000100  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000110  00 20 00 17 9d f9 c0 64  85 cb ff ff ff ff ff ff  |. .....d........|
00000120
zynq> sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
ef47525560aa30ca7eb4634eb2eb15a0aa618d3b61f774933f9935d05fb475f6  /sys/bus/spi/devices/spi0.0/p
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 1S-1S-2S
  opcode        0x3c
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbc
  mode cycles   0
  dummy cycles  4
 1S-1S-4S
  opcode        0x6c
  mode cycles   0
  dummy cycles  8
 1S-4S-4S
  opcode        0xec
  mode cycles   2
  dummy cycles  4
 4S-4S-4S
  opcode        0xec
  mode cycles   2
  dummy cycles  4

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x12
 1S-4S-4S
  opcode        0x3e
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              c2 25 3b c2 25 3b
size            128 MiB
write size      1
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_4BAIT | SOFT_RESET

opcodes
 read           0xec
  dummy cycles  6
 erase          0x21
 program        0x3e
 8D extension   none

protocols
 read           1S-4S-4S
 write          1S-4S-4S
 register       1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (128 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-07ffffff |     [ 1  ] | no
zynq> dd if=/dev/urandom of=/tmp/spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.083028 seconds, 24.1MB/s
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
45b3b6898c7dccd9bdc3cabd42d25ce6a875f4bdebe0b2a5d51632c67ecdc4a2  /tmp/spi_read
45b3b6898c7dccd9bdc3cabd42d25ce6a875f4bdebe0b2a5d51632c67ecdc4a2  /tmp/spi_test
zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 /tmp/spi_read
Copied 2097152 bytes from address 0x00000000 in flash to /tmp/spi_read
zynq> sha256sum /tmp/spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  /tmp/spi_read
45b3b6898c7dccd9bdc3cabd42d25ce6a875f4bdebe0b2a5d51632c67ecdc4a2  /tmp/spi_test

zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

 drivers/mtd/spi-nor/macronix.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index ea6be95e75a5..387836b27605 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -90,6 +90,10 @@ static const struct flash_info macronix_nor_parts[] = {
 		.name = "mx66l1g45g",
 		.size = SZ_128M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc2, 0x20, 0x1c),
+		.size = SZ_256M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xc2, 0x23, 0x14),
 		.name = "mx25v8035f",
@@ -143,6 +147,11 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0xc2, 0x25, 0x3b),
+		.size = SZ_128M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x3c),
 		.name = "mx66u2g45g",
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
