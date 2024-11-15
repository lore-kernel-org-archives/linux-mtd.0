Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA632D6DDED
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2024 11:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H2s3skfdtnRzCNXyitwZfc5ysE1srd85a69fqULTxHQ=; b=PxmJv7BmXUd6/g
	zf+KYl2LXokbL9K8Pb/8+0t3XHFpklDjeCrOpxq7K05E2UV2DKaWAmSaSd2yhqjsLnQFPwYpjmuwx
	FgHJn/Ok55+6WMyZI7nHgvn0PXQX739vDFOtRyEruUYJkAWLMxkHwPnrNqZzacex3dbggRPSkCC9P
	kEk1QllP8laUGPyEbtJ996/HyMXdOI3fpbA4uCB8Oxm6/nis+RzrKaSMm3T6EwjyCujFScIHUDdfO
	GVZR9COLkHL+bNvfAqsesCor0ulo32nQcYoCFaEqn8dYd+8ad47jjRwa1t4iyqz+WkhKZa/q2EAdh
	tyLnS/Cn+o39AK+t1UTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBuOa-00000002Vqu-2mLu;
	Fri, 15 Nov 2024 11:21:48 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBuOX-00000002Vpr-0qjc;
	Fri, 15 Nov 2024 11:21:46 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539ee1acb86so1656760e87.0;
        Fri, 15 Nov 2024 03:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731669703; x=1732274503; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zO3noysIfMN1J6IY+uuFQEwLmggKDAy7JsEEfwk6lds=;
        b=EwY9PU7+8HQI+Qmag/DNmjyUUoWaOsdSCRxsVQgKvz7beiwMAHUGmt4sGbCwfexCj+
         qDmBGvdmndWZApqyFLWy7CmvO4O38WRkEl/UK6cZEuGy06kHVUqUlyl0H22h3gSTwYga
         anqqjqziMlp+119glQOZGdDmb2J2xQS5wUWZl/i9WqcKpWwWIwhegJFu6pUj2f9xPAOj
         9dceYKOluB2MOmw+0djj9WnbdGGMAupjf29ItTI2KDYPPirAU5CjlB/VKe9zIMwTLRsn
         t6KBRszHkE2j8cZ5xXcpxE45ZLLzFKNPeQ/iyWdJiZCcGEmaasx5mwLUYP1XTwsHZG+S
         xWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731669703; x=1732274503;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zO3noysIfMN1J6IY+uuFQEwLmggKDAy7JsEEfwk6lds=;
        b=tV9Zarn5dIpjjefuw3NvhQzanozXbTp48USs8ZTr+sznlLNWVqCZKt1oa4mbX6JP4E
         cbbHilvrFWzowhhWAoHFb1gWI+qgv8dZfAO+f/J8Onc7KwuOgJuQpx1R8dM+8TBMI2LE
         cVN/SzGsPAxcW6AGqyODG5Ju4GtDhCIe5zst1pzwCMVwRgMQBOUU6NqNmcQp8Qj9VH9K
         YDIEGP93EXh9X5FbNXxP1YxGEonxwUP5PO07yhVX8f7V+0aB1POo7ffkHnLpLJER/yh5
         i1Y5QUk/NBipBbNkcoTViDqV7T3100qReeim1brUkIWkuqWn0UOv/tosgJYcMLZLa70q
         vwXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6gmKDYi4gm6dWEKY3dl35MVhTyyoo0ZzopMnH72bwRdJq5uZ0i3yb4YDZLLZJKQ7v1e5MBFSn6kdDV/+sL5nQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwatooyDUn7CGMnzLcTXK3Wrr2H0+djCqhIkz1uFHDLV5h1WhYp
	bHrOREQXYSH73Tyvdscm4k1TsbXyst3/3AlbJrhUg0/lEpWzIGy0
X-Google-Smtp-Source: AGHT+IG2Nv/kAUebbnR8w53YV5AaYSUtDKzgxW0PKar/3L6rGbdcRnHc//D5S5zbsm0cxaAwDAGPMA==
X-Received: by 2002:a05:6512:3c9d:b0:536:55a8:6f78 with SMTP id 2adb3069b0e04-53dab29abecmr1233640e87.17.1731669702860;
        Fri, 15 Nov 2024 03:21:42 -0800 (PST)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da64f2aecsm524610e87.18.2024.11.15.03.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 03:21:41 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 15 Nov 2024 12:21:28 +0100
Subject: [PATCH v3] mtd: spi-nor: atmel: add at25sf321 entry
MIME-Version: 1.0
Message-Id: <20241115-spi-nor-v3-1-93ec584177cb@gmail.com>
X-B4-Tracking: v=1; b=H4sIALcuN2cC/2WMQQ6CMBBFr0K6tqYzKFBW3sO4gHaASYSS1jQaw
 t0tbCRx+X7+e4sI5JmCqLNFeIoc2E0J8lMmzNBMPUm2iQUqvICCSoaZ5eS8tAZ1oStLjepEes+
 eOn7vpfsj8cDh5fxnD0fY1v9GBAnSlnhtu7ZUQObWjw0/z8aNYmtEPHiofx4mj6AoTK6VItBHb
 13XL28BqtbWAAAA
X-Change-ID: 20241018-spi-nor-dc29698dea0f
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4667;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=tThtjTxdYs9vJVKFOy+4jb+6O5TsVYutmbrI2Y84p4Y=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnNy6+7Dw3gwoC8g4enE2DHNSdR7jdje+GjxOV1
 EtNjuxYFqCJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZzcuvgAKCRCIgE5vWV1S
 MrkrD/wI3mCeQtkhRtJ6mCoSSU0mYisrVX+ROff4OWkft4RXhYzNbsKfihxZIgVIzDdGJ/mXZKp
 np969s/Tio8WYbnAVWb4RLvDYjXFYs5aFCWQW95K92jPcYFjX0HBzC5uvXs67613rPyQWzUCZ/O
 EShb7a72rkcw7hmgplQkMv71vJcXnu4BcLbDZP+Glla+NW47IlhSnQ05Unb8wThdMAgN2FaZuwt
 gkqjR9BUdvw+EFG48MuFcT2B1OhdTU31R+xvTp3utbitDRqDT4xMqlnO9nS0a9Q+5kkt8XyFxPW
 wF09F72H+HVu1dWZeGJtkXGk5vqqaqebXMDhW0irB8gR8nq0rzj64DF5uQO8pEUjN9PxoXWHX8K
 F6Oy84u/cg7nm46Fi/yw3tEhoR7Suo4JJzNNFeh+Aj9UfeUfSWYEpNHc/Ooz3SIu3NfO7oBP8me
 w9yQiVEn3lvJz4AbrLRxhSTRDTHyNRhIb+u0PBHg6nESl/NLVfBRaOWFlXBpj+i+sORGKOsVodW
 oaql41Vswfh1QF7szdK1KeSa/NYXznCu8+JnSHhcpncr2YkxoZNn47O8b1TsKHKhv4B3srFindQ
 rJG18sG64mMGNfuRjy8+oZGby8/xLEvq63Lp36AZHIa3Tv3VC50AO735fnl0kMoz+TZDZkj4nDy
 10zQG88cpCI9ogQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_032145_256568_44C24418 
X-CRM114-Status: GOOD (  11.82  )
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

Add entry for the at25sf321 32Mbit SPI flash.

This flash is populated on a custom board and was tested at
10MHz frequency using the "ti,da830-spi" SPI controller.

Link:
https://www.renesas.com/en/document/dst/at25sf321-datasheet?r=1608801

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
root# cat /sys/class/spi_master/spi1/spi1.1/spi-nor/partname
at25sf321

root# cat /sys/class/spi_master/spi1/spi1.1/spi-nor/jedec_id
1f8701

root# cat /sys/class/spi_master/spi1/spi1.1/spi-nor/manufacturer
atmel

root# cat /sys/kernel/debug/spi-nor/spi1.1/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x03
  mode cycles   0
  dummy cycles  0
 1S-1S-1S (fast read)
  opcode        0x0b
  mode cycles   0
  dummy cycles  8
 1S-1S-2S
  opcode        0x3b
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbb
  mode cycles   4
  dummy cycles  0
 1S-1S-4S
  opcode        0x6b
  mode cycles   0
  dummy cycles  8
 1S-4S-4S
  opcode        0xeb
  mode cycles   2
  dummy cycles  4

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x02

root# mtd_debug  info /dev/mtd6
mtd.type = MTD_NORFLASH
mtd.flags = MTD_BIT_WRITEABLE
mtd.size = 65536 (64K)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1 
mtd.oobsize = 0 
regions = 0

SINGLE
======
spi-rx-bus-width = <1>;
spi-tx-bus-width = <1>;

root# cat /sys/kernel/debug/spi-nor/spi1.1/params
name            at25sf321
id              1f 87 01
size            4.00 MiB
write size      1
page size       256
address nbytes  3
flags           HAS_16BIT_SR

opcodes
 read           0x0b
  dummy cycles  8
 erase          0x20
 program        0x02
 8D extension   none

protocols
 read           1S-1S-1S
 write          1S-1S-1S
 register       1S-1S-1S

erase commands
 20 (4.00 KiB) [0]
 d8 (64.0 KiB) [1]
 c7 (4.00 MiB)

sector map
 region (in hex)   | erase mask | flags
 ------------------+------------+----------
 00000000-003fffff |     [01  ] |

DUAL
======
spi-rx-bus-width = <2>;
spi-tx-bus-width = <2>;

root# cat /sys/kernel/debug/spi-nor/spi1.1/params 
name            at25sf321
id              1f 87 01
size            4.00 MiB
write size      1
page size       256
address nbytes  3
flags           HAS_16BIT_SR | SOFT_RESET

opcodes
 read           0x0b
  dummy cycles  8
 erase          0x20
 program        0x02
 8D extension   repeat

protocols
 read           1S-1S-1S
 write          1S-1S-1S
 register       1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (4.00 MiB)

sector map
 region (in hex)   | erase mask | flags
 ------------------+------------+----------
 00000000-003fffff |     [ 123] | 

QUAD
======
spi-rx-bus-width = <4>;
spi-tx-bus-width = <4>;

root# cat /sys/kernel/debug/spi-nor/spi1.1/params
name            at25sf321
id              1f 87 01
size            4.00 MiB
write size      1
page size       256
address nbytes  3
flags           HAS_16BIT_SR | SOFT_RESET

opcodes
 read           0x0b
  dummy cycles  8
 erase          0x20
 program        0x02
 8D extension   repeat

protocols
 read           1S-1S-1S
 write          1S-1S-1S
 register       1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (4.00 MiB)

sector map
 region (in hex)   | erase mask | flags
 ------------------+------------+----------
 00000000-003fffff |     [ 123] |
---
Changes in v3:
- Add SPI_NOR_DUAL_READ and SPI_NOR_QUAD_READ flags
- Link to v2: https://lore.kernel.org/r/20241029-spi-nor-v2-1-e166c3900e19@gmail.com

Changes in v2:
- Change from at25sf321b to at25sf321
- Link to v1: https://lore.kernel.org/r/20241018-spi-nor-v1-1-d725bfb701ec@gmail.com
---
 drivers/mtd/spi-nor/atmel.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 45d1153a04a07b7c61f46b117311b24ab695038f..ff9462d9b8ed83f44ee99a7f3b70b99b4d455e9b 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -238,6 +238,11 @@ static const struct flash_info atmel_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK,
 		.no_sfdp_flags = SECT_4K,
 		.fixups = &at25fs_nor_fixups
+	}, {
+		.id = SNOR_ID(0x1f, 0x87, 0x01),
+		.name = "at25sf321",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	},
 };
 

---
base-commit: 200289db261f0c8131a5756133e9d30966289c3b
change-id: 20241018-spi-nor-dc29698dea0f

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
