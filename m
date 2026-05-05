Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78656CD3427
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2026 13:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H7ZX7Xsksj6QAfeLK/K+ZzZ9pf27AYMyUmIiRn/NwGk=; b=ZBlj6kybh2KLuV
	eK+BvdFPehiRVi6j7Xjsum9Sp3Ff2208HAVFSw/Wx64nhxprmyTKjXX7c7sWD5PWJ4cOeZHCExv1G
	nqSiMnElYsQcxnHhIeTUe9uPWmQx9hc4wx3/AIp4hwAR/USUbbF5inLksWYloyZD5+n6bA7tRAGz0
	eXQRcy2w2EBW/LqbBZarfYEbZTiiO5jpB57Q2TUfY1QkQnHXlZeqGOyYYZjsiBCnrZRCqf1HP2e/D
	/rdATQVLvXuPcqtJxqgi1gZ3NQ2YWQQUzA3LP/qKqaZghlW32UjpjKDiKNv0Gvw+FAa33AALi11wQ
	bsvyL6nota9NK2Szgp/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGAH-0000000GOMm-1cWI;
	Tue, 05 May 2026 13:50:21 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGAD-0000000GOLw-3D7F
	for linux-mtd@lists.infradead.org;
	Tue, 05 May 2026 13:50:19 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-362bb3260f1so3879337a91.2
        for <linux-mtd@lists.infradead.org>; Tue, 05 May 2026 06:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777989016; x=1778593816; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ewLiIdJotfMhHu6eZbrTUAkpKyXTg+TsGK/YRVTV8S4=;
        b=YFGfZ7MC2GihfygebfGwGtOHmpb9HVNXmLTAlPMAZobK0/cqAGhObu5582RLJRak99
         HTHOtUL/SpZuQ0ampEg+JMLoMyfZWaLNYXaROixvzbLc0FflatY61BY6wvSdNCQLDxA8
         waile+gCdRVJZNHvHokOlZeu1n9ki833JRuMxLAQcQQJJ+JTfjGb5lwhn2IsGgqHGJCO
         gf2T5f3DEDpimGe61qcdNc2Y+XmxOj+BmP/htz6ZusO+hFslkJnZPQI+SBo5SD9uN5yA
         y1OyX1+fxkLcdjMwoWP16fGUCrJkAY17dbm3pA26X8h45IFeTE3C5sacvmeVL7wMSYHb
         IZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777989016; x=1778593816;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewLiIdJotfMhHu6eZbrTUAkpKyXTg+TsGK/YRVTV8S4=;
        b=Q1e703Me2xm6S88uSb41vV7RVmY+pn6k+stk6qOhHRQw4A9/iiSoT9XLqzAV6dXT2F
         rdT5jCXC7zOsOO33uKTaVsjmnvf3WLS168a+qFMLVT4zufXrnz3aPFfsuLQUcYaquB6m
         PShUfvBR32UvA4ho7XNzl11pU2CduJz33+pc4ebglWbw9LdsI0XJYj9MCB+nZtNT/7jV
         7lTXdbi2CzsDLwBWeQqqm4qg+pPFcY3VUp7tBOIRIIVORzVZzxn1TEwIf2OA5UhkXwDI
         BtqjOvGrsQ+qiorn6YNBNz5G+6y6HzcNz8Qm/1VV1jRg/QRRn0Bgi3coGS2cpwW2OGAU
         uj1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+AItZ0Viwif+rWdNymP+nfAx2Do17gADad11eZbUYvqbNtoSGdDuLeadQNLEhPGedCNCYk4qkJTQc=@lists.infradead.org
X-Gm-Message-State: AOJu0YztIZPk0cPV4My6sEC4Hudn1eb0C8wueWV98X2/edbD6re6s9gx
	Pmb3whrZW2iLW6ZflUYlbABwFwY2NjE7XVhvpwj5boyex/4DAo9PQHju
X-Gm-Gg: AeBDies3JddKorPgDAqAbf91emJP6lvQ65iPckigCWo/lCOgM9AbZ7aiDSbxwW9RwqD
	AgZIx6D8rgovyKooE0lezsDovJ+rMwrLX5Y0QlEP5lmRcUyaUjzsjiK2ynPKvYQMk7cNyfuzIC7
	FMUPe624dkAusi1fDXTV4N1AhsU8WIvOPsgbhR0UJQWJ/R7cHhRk9H2JX1aIQoUi5RJOq2Y6af7
	WMmNikJIpbFWOByVbgpYmTZcQpqmDuUYyPFZl2e9fnA75kbjH5CnOOX4d7o3ujYBtw0sRucBdz+
	tkp2ArqL/runXRLfD3dBEwFTSNWWE9xyId34KOY/D0TYMIavvTdRDxfMv08/kQRF+myjrwjIAvB
	Ii2dG8uhm9kIefrFQjRLTv8cBJNyjMS0c46sn+3hxB4+oag/wJboblyP1u6+cq/GW8mlengxddc
	lcUKMz4Pkjibmhc8NtBxHKqGPLiNgWubOBOjj3DcJI5zBtiEX2UlQbQA==
X-Received: by 2002:a17:90b:35c8:b0:361:472e:3be6 with SMTP id 98e67ed59e1d1-3650ced3bf0mr13427050a91.26.1777989014523;
        Tue, 05 May 2026 06:50:14 -0700 (PDT)
Received: from Fantast-WT.localdomain ([120.229.37.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec03cf53sm19988441a91.16.2026.05.05.06.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:50:13 -0700 (PDT)
Date: Tue, 5 May 2026 21:50:05 +0800
From: Teng Wu <gigadevice2025@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	teng.wu@gigadevice.com
Subject: [PATCH] mtd: spi-nor: Add support for GD25/GD55 series flashes
Message-ID: <afn1jToCHwRmNXjK@Fantast-WT.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_065017_841433_9B1C744D 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

From 2918d966442e91ff85d493363ff2e7fee92b05de Mon Sep 17 00:00:00 2001
From: Teng Wu <gigadevice2025@gmail.com>
Date: Wed, 22 Apr 2026 16:17:22 +0800
Subject: [PATCH] mtd: spi-nor: Add support for GD25/GD55 series flashes

Add support for following Gigadevice SPI NOR flashes:

- gd25(b/lb)512mf (64MB)
- gd55(b/lb)01gf  (128MB)
- gd55(b/lb)02gf  (256MB)

Link: https://github.com/WT-886/DATASHEET

Signed-off-by: Teng Wu <gigadevice2025@gmail.com>

---
Test logs:

	test1-> gd25b512mf

root@ast2700-default:~# cat /sys/bus/spi/devices/spi0.1/spi-nor/partname
gd25b512mf
root@ast2700-default:~# cat /sys/bus/spi/devices/spi0.1/spi-nor/jedec_id
c8401a
root@ast2700-default:~# cat /sys/bus/spi/devices/spi0.1/spi-nor/manufacturer
gigadevice
root@ast2700-default:~# hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 06 01 02 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
00000010  c8 00 01 03 90 00 00 ff  84 00 01 02 c0 00 00 ff  |................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 f3 ff ff ff ff 7f  44 eb 08 6b 08 3b 42 bb  |. ......D..k.;B.|
00000040  fe ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.. .R|
00000050  10 d8 00 ff d6 39 a5 fe  82 d6 14 62 ec 62 16 33  |.....9.....b.b.3|
00000060  7a 75 7a 75 04 bd d5 5c  29 06 04 00 08 50 00 01  |zuzu...\)....P..|
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000080  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000090  00 36 00 27 9d f9 77 64  8f cb ff ff ff ff ff ff  |.6.'..wd........|
000000a0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000b0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000c0  ff 0e ff ff 21 5c dc ff                           |....!\..|
000000c8
root@ast2700-default:~# sha256sum /sys/bus/spi/devices/spi0.1/spi-nor/sfdp
2fc728b7dbdb15daf3e685ca7f42c4894fbaa44cbbf7324910578b683744727a  /sys/bus/spi/devices/spi0.1/spi-nor/sfdp
root@ast2700-default:~#
root@ast2700-default:~# cat /sys/kernel/debug/spi-nor/spi0.1/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 1S-1S-1S (fast read)
  opcode        0x0c
  mode cycles   0
  dummy cycles  8
 1S-1S-2S
  opcode        0x3c
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbc
  mode cycles   2
  dummy cycles  2
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
 1S-1S-4S
  opcode        0x34
root@ast2700-default:~#
root@ast2700-default:~# cat /sys/kernel/debug/spi-nor/spi0.1/params
name            gd25b512mf
id              c8 40 1a c8 40 1a
size            64.0 MiB
write size      1
page size       256
address nbytes  4
flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | SOFT_RESET

opcodes
 read           0x6c
  dummy cycles  8
 erase          0xdc
 program        0x34
 8D extension   none

protocols
 read           1S-1S-4S
 write          1S-1S-4S
 register       1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (64.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-03ffffff |     [   3] | no

root@ast2700-default:~# dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 5.688872 seconds, 360.0KB/s

root@ast2700-default:~# ./mtd_debug erase /dev/mtd6 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

root@ast2700-default:~# ./mtd_debug read /dev/mtd6 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

root@ast2700-default:~# hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000

root@ast2700-default:~# sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read

root@ast2700-default:~# ./mtd_debug write /dev/mtd6 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash

root@ast2700-default:~# ./mtd_debug read /dev/mtd6 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

root@ast2700-default:~# sha256sum spi*
3a4031c0260d6d4b5c3491a8c481318cb42f36f5a67ce260c6f7206067eaf8eb  spi_read
3a4031c0260d6d4b5c3491a8c481318cb42f36f5a67ce260c6f7206067eaf8eb  spi_test

root@ast2700-default:~# ./mtd_debug info /dev/mtd6
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 67108864 (64M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

	test2-> gd25lb512mf

root@ast2700-default:/tmp# cat /sys/bus/spi/devices/spi1.0/spi-nor/partname
gd25lb512mf
root@ast2700-default:/tmp# cat /sys/bus/spi/devices/spi1.0/spi-nor/jedec_id
c8601a
root@ast2700-default:/tmp# cat /sys/bus/spi/devices/spi1.0/spi-nor/manufacturer
gigadevice
root@ast2700-default:/tmp# hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 06 01 02 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
00000010  c8 00 01 03 90 00 00 ff  84 00 01 02 c0 00 00 ff  |................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 f3 ff ff ff ff 7f  44 eb 08 6b 08 3b 42 bb  |. ......D..k.;B.|
00000040  fe ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.. .R|
00000050  10 d8 00 ff d6 39 a5 fe  82 d6 14 62 ec 62 16 33  |.....9.....b.b.3|
00000060  7a 75 7a 75 04 bd d5 5c  29 06 04 00 08 50 00 01  |zuzu...\)....P..|
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000080  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000090  00 36 00 27 9d f9 77 64  8f cb ff ff ff ff ff ff  |.6.'..wd........|
000000a0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000b0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000c0  ff 0e ff ff 21 5c dc ff                           |....!\..|
000000c8
root@ast2700-default:/tmp# sha256sum /sys/bus/spi/devices/spi1.0/spi-nor/sfdp
8fa8a248e0aabc3648138c46c5445826c4a2e7ffdb8808d5e9a86332c2b9662e  /sys/bus/spi/devices/spi1.0/spi-nor/sfdp
root@ast2700-default:/tmp#

root@ast2700-default:/tmp# cat /sys/kernel/debug/spi-nor/spi1.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 1S-1S-1S (fast read)
  opcode        0x0c
  mode cycles   0
  dummy cycles  8
 1S-1S-2S
  opcode        0x3c
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbc
  mode cycles   2
  dummy cycles  2
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
 1S-1S-4S
  opcode        0x34

root@ast2700-default:/tmp# cat /sys/kernel/debug/spi-nor/spi1.0/params
name            gd25lb512mf
id              c8 60 1a c8 60 1a
size            64.0 MiB
write size      1
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_4BAIT | HAS_16BIT_SR | NO_READ_CR | SOFT_RESET

opcodes
 read           0x3c
  dummy cycles  8
 erase          0xdc
 program        0x12
 8D extension   repeat

protocols
 read           1S-1S-2S
 write          1S-1S-1S
 register       1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (64.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-03ffffff |     [   3] | no

root@ast2700-default:/tmp# dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.034673 seconds, 57.7MB/s

root@ast2700-default:/tmp# ./mtd_debug erase /dev/mtd8 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

root@ast2700-default:/tmp# ./mtd_debug read /dev/mtd8 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

root@ast2700-default:/tmp# hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000

root@ast2700-default:/tmp# sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read

root@ast2700-default:/tmp# ./mtd_debug write /dev/mtd8 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash

root@ast2700-default:/tmp# ./mtd_debug read /dev/mtd8 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

root@ast2700-default:/tmp# sha256sum spi*
fd231c1af2c378eb4f114c4d0cb1988540eb05c6f8fd90c46633441248f037a3  spi_read
fd231c1af2c378eb4f114c4d0cb1988540eb05c6f8fd90c46633441248f037a3  spi_test

root@ast2700-default:/tmp# ./mtd_debug info /dev/mtd8
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 67108864 (64M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

	test3-> gd55b01gf

root@ast2700-default:/tmp# dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.034361 seconds, 58.2MB/s
root@ast2700-default:/tmp# cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
gd55b01gf
root@ast2700-default:/tmp# cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c8401b
root@ast2700-default:/tmp# cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
gigadevice
root@ast2700-default:/tmp# hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 06 01 02 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
00000010  c8 00 01 03 90 00 00 ff  84 00 01 02 c0 00 00 ff  |................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 f3 ff ff ff ff 3f  44 eb 08 6b 08 3b 42 bb  |. .....?D..k.;B.|
00000040  fe ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.. .R|
00000050  10 d8 00 ff d6 39 a5 fe  82 d6 14 62 ec 62 16 33  |.....9.....b.b.3|
00000060  7a 75 7a 75 04 bd d5 5c  29 06 74 00 08 50 00 01  |zuzu...\).t..P..|
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000080  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000090  00 36 00 27 9d f9 77 64  8f cb ff ff ff ff ff ff  |.6.'..wd........|
000000a0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000b0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000c0  ff 0e ff ff 21 5c dc ff                           |....!\..|
000000c8
root@ast2700-default:/tmp# sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
154e574f72e35c9c959f12b2af9db45fdfc6a6c4fa8a18e708f338fab5fd2e43  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
root@ast2700-default:/tmp#
root@ast2700-default:/tmp# cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 1S-1S-1S (fast read)
  opcode        0x0c
  mode cycles   0
  dummy cycles  8
 1S-1S-2S
  opcode        0x3c
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbc
  mode cycles   2
  dummy cycles  2
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
 1S-1S-4S
  opcode        0x34
root@ast2700-default:/tmp# cat /sys/kernel/debug/spi-nor/spi0.0/params
name            gd55b01gf
id              c8 40 1b c8 40 1b
size            128 MiB
write size      1
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_4BAIT | HAS_16BIT_SR | SOFT_RESET

opcodes
 read           0x6c
  dummy cycles  8
 erase          0xdc
 program        0x34
 8D extension   none

protocols
 read           1S-1S-4S
 write          1S-1S-4S
 register       1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (128 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-07ffffff |     [   3] | no
root@ast2700-default:/tmp# dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.035863 seconds, 55.8MB/s

root@ast2700-default:/tmp# ./mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

root@ast2700-default:/tmp# ./mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

root@ast2700-default:/tmp# hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000

root@ast2700-default:/tmp# sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read

root@ast2700-default:/tmp# ./mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash

root@ast2700-default:/tmp# ./mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

root@ast2700-default:/tmp# sha256sum spi*
0c10262e00676c994a3e341447a44e12411a3a9e92700b4aa22f0d1e11817486  spi_read
0c10262e00676c994a3e341447a44e12411a3a9e92700b4aa22f0d1e11817486  spi_test

root@ast2700-default:/tmp# ./mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

	test4-> gd55lb01gf

root@ast2700-default:/tmp# cat /sys/bus/spi/devices/spi1.0/spi-nor/partname
gd55lb01gf
root@ast2700-default:/tmp# cat /sys/bus/spi/devices/spi1.0/spi-nor/jedec_id
c8601b
root@ast2700-default:/tmp# cat /sys/bus/spi/devices/spi1.0/spi-nor/manufacturer
gigadevice
root@ast2700-default:/tmp# hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 06 01 02 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
00000010  c8 00 01 03 90 00 00 ff  84 00 01 02 c0 00 00 ff  |................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 f3 ff ff ff ff 7f  44 eb 08 6b 08 3b 42 bb  |. ......D..k.;B.|
00000040  fe ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.. .R|
00000050  10 d8 00 ff d6 39 a5 fe  82 d6 14 62 ec 62 16 33  |.....9.....b.b.3|
00000060  7a 75 7a 75 04 bd d5 5c  29 06 04 00 08 50 00 01  |zuzu...\)....P..|
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000080  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000090  00 36 00 27 9d f9 77 64  8f cb ff ff ff ff ff ff  |.6.'..wd........|
000000a0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000b0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000c0  ff 0e ff ff 21 5c dc ff                           |....!\..|
000000c8
root@ast2700-default:/tmp# sha256sum /sys/bus/spi/devices/spi1.0/spi-nor/sfdp
efb1f201a7c3e24390e177446b89c94106201c11cca24fe27472635053f695d9  /sys/bus/spi/devices/spi1.0/spi-nor/sfdp
root@ast2700-default:/tmp#

root@ast2700-default:/tmp# cat /sys/kernel/debug/spi-nor/spi1.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 1S-1S-1S (fast read)
  opcode        0x0c
  mode cycles   0
  dummy cycles  8
 1S-1S-2S
  opcode        0x3c
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbc
  mode cycles   2
  dummy cycles  2
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
 1S-1S-4S
  opcode        0x34
root@ast2700-default:/tmp# cat /sys/kernel/debug/spi-nor/spi1.0/params
name            gd55lb01gf
id              c8 60 1b c8 60 1b
size            128 MiB
write size      1
page size       256
address nbytes  4
flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | NO_READ_CR | SOFT_RESET

opcodes
 read           0x3c
  dummy cycles  8
 erase          0xdc
 program        0x12
 8D extension   repeat

protocols
 read           1S-1S-2S
 write          1S-1S-1S
 register       1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (128 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-07ffffff |     [   3] | no
root@ast2700-default:/tmp#

root@ast2700-default:/tmp# dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.034935 seconds, 57.2MB/s

root@ast2700-default:/tmp# ./mtd_debug erase /dev/mtd8 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

root@ast2700-default:/tmp# ./mtd_debug read /dev/mtd8 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

root@ast2700-default:/tmp# hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000

root@ast2700-default:/tmp# sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read

root@ast2700-default:/tmp# ./mtd_debug write /dev/mtd8 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash

root@ast2700-default:/tmp# ./mtd_debug read /dev/mtd8 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

root@ast2700-default:/tmp# sha256sum spi*
9426559bd5db4978c41d08a81d950b0cdc258dc8890bc63b66e9343da2860650  spi_read
9426559bd5db4978c41d08a81d950b0cdc258dc8890bc63b66e9343da2860650  spi_test

root@ast2700-default:/tmp# ./mtd_debug info /dev/mtd8
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 67108864 (64M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

	 test5-> gd55b02gf

root@ast2700-default:/work# cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
gd55b02gf
root@ast2700-default:/work# cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c8401c
root@ast2700-default:/work# cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
gigadevice
root@ast2700-default:/work# hexdump -Cv /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 06 01 02 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
00000010  c8 00 01 03 90 00 00 ff  84 00 01 02 c0 00 00 ff  |................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 f3 ff ff ff ff 7f  44 eb 08 6b 08 3b 42 bb  |. ......D..k.;B.|
00000040  fe ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.. .R|
00000050  10 d8 00 ff d6 39 a5 fe  82 d6 14 62 ec 62 16 33  |.....9.....b.b.3|
00000060  7a 75 7a 75 04 bd d5 5c  29 06 04 00 08 50 00 01  |zuzu...\)....P..|
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000080  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000090  00 36 00 27 9d f9 77 64  8f cb ff ff ff ff ff ff  |.6.'..wd........|
000000a0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000b0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000c0  ff 0e ff ff 21 5c dc ff                           |....!\..|
000000c8
root@ast2700-default:/work# sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
450bcdb73ecde4913e7893a0390f052843080c2e5d252258f193dfad840be139  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
root@ast2700-default:/work#
root@ast2700-default:/work# cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 1S-1S-1S (fast read)
  opcode        0x0c
  mode cycles   0
  dummy cycles  8
 1S-1S-2S
  opcode        0x3c
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbc
  mode cycles   2
  dummy cycles  2
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
 1S-1S-4S
  opcode        0x34
root@ast2700-default:/work# cat /sys/kernel/debug/spi-nor/spi0.0/params
name            gd55b02gf
id              c8 40 1c c8 40 1c
size            256 MiB
write size      1
page size       256
address nbytes  4
flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | SOFT_RESET

opcodes
 read           0x6c
  dummy cycles  8
 erase          0xdc
 program        0x34
 8D extension   none

protocols
 read           1S-1S-4S
 write          1S-1S-4S
 register       1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (256 MiB)

sector map
 region (in hex)   | erase mask | flags
 ------------------+------------+----------
 00000000-0fffffff |     [ 123] |
root@ast2700-default:/work#
root@ast2700-default:/work# dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 5.420572 seconds, 377.8KB/s

root@ast2700-default:/work# ./mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
root@ast2700-default:/work# ./mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

root@ast2700-default:/work# hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000

root@ast2700-default:/work# sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read

root@ast2700-default:/work# ./mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash

root@ast2700-default:/work# ./mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

root@ast2700-default:/work# sha256sum spi*
9a4bd863407df7dceaa1ad45845fe6c19d862b72edea8ebeb69a7b0d1cf35a6a  spi_read
9a4bd863407df7dceaa1ad45845fe6c19d862b72edea8ebeb69a7b0d1cf35a6a  spi_test

root@ast2700-default:/work# ./mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 268435456 (256M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

	test6-> gd55lb02gf

root@ast2700-default:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/partname
gd55lb02gf
root@ast2700-default:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/jedec_id
c8601c
root@ast2700-default:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/manufacturer
gigadevice
root@ast2700-default:~# hexdump -Cv  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 06 01 02 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
00000010  c8 00 01 03 90 00 00 ff  84 00 01 02 c0 00 00 ff  |................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 f3 ff ff ff ff 7f  44 eb 08 6b 08 3b 42 bb  |. ......D..k.;B.|
00000040  fe ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.. .R|
00000050  10 d8 00 ff d6 39 a5 fe  82 d6 14 62 ec 62 16 33  |.....9.....b.b.3|
00000060  7a 75 7a 75 04 bd d5 5c  29 06 04 00 08 50 00 01  |zuzu...\)....P..|
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000080  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000090  00 36 00 27 9d f9 77 64  8f cb ff ff ff ff ff ff  |.6.'..wd........|
000000a0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000b0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
000000c0  ff 0e ff ff 21 5c dc ff                           |....!\..|
000000c8
root@ast2700-default:~# sha256sum /sys/bus/spi/devices/spi1.0/spi-nor/sfdp
8cad1f887c45925f160e70013e605c0467cef85ae2f923627b928b9f79c607b0  /sys/bus/spi/devices/spi1.0/spi-nor/sfdp
root@ast2700-default:~#

root@ast2700-default:~# cat /sys/kernel/debug/spi-nor/spi1.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 1S-1S-1S (fast read)
  opcode        0x0c
  mode cycles   0
  dummy cycles  8
 1S-1S-2S
  opcode        0x3c
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbc
  mode cycles   2
  dummy cycles  2
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
 1S-1S-4S
  opcode        0x34
root@ast2700-default:~# cat /sys/kernel/debug/spi-nor/spi1.0/params
name            gd55lb02gf
id              c8 60 1c c8 60 1c
size            256 MiB
write size      1
page size       256
address nbytes  4
flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | NO_READ_CR | SOFT_RESET

opcodes
 read           0x3c
  dummy cycles  8
 erase          0xdc
 program        0x12
 8D extension   repeat

protocols
 read           1S-1S-2S
 write          1S-1S-1S
 register       1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (256 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-0fffffff |     [   3] | no
root@ast2700-default:~#

root@ast2700-default:~# dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 6.810931 seconds, 300.7KB/s

root@ast2700-default:~# ./mtd_debug erase /dev/mtd7 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

root@ast2700-default:~# ./mtd_debug read /dev/mtd7 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

root@ast2700-default:~# hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000

root@ast2700-default:~# sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read

root@ast2700-default:~# ./mtd_debug write /dev/mtd7 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash

root@ast2700-default:~# ./mtd_debug read /dev/mtd7 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

root@ast2700-default:~# sha256sum spi*
b27ca6e0442b035d15659d44bed55389ca3283995c71186c5da3fe8f72597d3d  spi_read
b27ca6e0442b035d15659d44bed55389ca3283995c71186c5da3fe8f72597d3d  spi_test

root@ast2700-default:~# ./mtd_debug info /dev/mtd7
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 268435456 (256M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0
---
 drivers/mtd/spi-nor/gigadevice.c | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 317065490e32..47c2306e3fb0 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -81,6 +81,42 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x40, 0x1a),
+		.name = "gd25b512mf",
+		.size = SZ_64M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x1a),
+		.name = "gd25lb512mf",
+		.size = SZ_64M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x40, 0x1b),
+		.name = "gd55b01gf",
+		.size = SZ_128M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x1b),
+		.name = "gd55lb01gf",
+		.size = SZ_128M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x40, 0x1c),
+		.name = "gd55b02gf",
+		.size = SZ_256M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xc8, 0x60, 0x1c),
+		.name = "gd55lb02gf",
+		.size = SZ_256M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	},
 };
 
-- 
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
