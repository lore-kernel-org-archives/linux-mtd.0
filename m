Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A1DC3F6B0
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Aug 2022 06:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7u+2ON2oy8klops5P4rutlbmQ5+Q3mVFpGzmjItJypg=; b=qc5Tkv4Bo4ysrQ
	VirzyHOa08N9tLmQrVVHpOq7U+tdwDl2XGEvSaGUFvs6p55DiCNuI0Y64qUEgJEPHVHHKAQ08eYJy
	Ip+oclV0x3iOHIFyJQFKEuhiWeZvildaB01PVSFWBJAXTfUaQVpOxJPLtqlQvqOkGOO60EQUEqgnt
	EMDnbZ6b3tbHOYKYvMa9x0qnNIQ3Y9aL0V9FdB0Q1AvAl4TLQVKe1GjECG58uc+qUvdiVLpuSaOb9
	q7xr9KmmULzlQ7bFfq54vnRhXtDdpDTA04Gz9Zmmha1TIPq1n7LIsYp/PVlVmEnDOgsGiPqBjCkSb
	1I/SLyWXvha26PZOTFKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKDPD-004n3X-5v; Sat, 06 Aug 2022 06:35:27 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKDP9-004mq3-FJ
	for linux-mtd@lists.infradead.org; Sat, 06 Aug 2022 06:35:25 +0000
Received: by mail-pf1-x429.google.com with SMTP id f28so3973702pfk.1
        for <linux-mtd@lists.infradead.org>; Fri, 05 Aug 2022 23:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Z4dCGOmicg8ZCFbkSoj5FvcNUbidDNK/Oywlfr/aGEg=;
        b=jT/v9S3xJZsQipnYi3SAJInb5TNqOoDUmr7MMxQ+okRwi8MvnYwIZ6+iB3Fc3FFT9l
         ji9fp3MXXROShZKj8hkY55hVVFrVMiLMEteeoLXdm65PNxO9URgQqlxdASi5OQOEhQ9A
         uu0rwf0N6xkGLeJVIh6TMaPKAxOl8axPN7jSywYkTStj9zKGnj224cbDbQRSgBhP5GTt
         k0N2rc2Cv1k32xLqeTUHjkLBs7saRjFqLDW2BZnKlXGWKY6jA73Y2T2q4Fle/2V2sZEm
         wOhi93nibe5WuzI6sk+q/iZCLbB57pv+HL+U+JwIadr2FX2XzujC1IfQSB/IOlVo6OSV
         Zx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Z4dCGOmicg8ZCFbkSoj5FvcNUbidDNK/Oywlfr/aGEg=;
        b=PgU54ZUkGQvjuE1cktnUqKJ8sh/jVtKoiwNxjmXJFnkgcaIZyHPeX0ZPIsq1ZDjIMJ
         dsHqs97Jo//L4g+YQ9iNtgLVNfLut7+hEabPOKcoxOIj9g7FWCPGZ+xj0ZjNbLsqGJsp
         1iGDHMZ8E0GZODiTn7OJ/MWUi5j1W2tHRvmSrlmkWRQ+deb9Fh1L1ill5Pf4Qwq2c2Vj
         6NwYTQ0q9gq3ecpfQcomNeXax4eYeOfsjTY5/3nCZaYHkj8bpXslacs/xZTZ7s8CzcAi
         k1QBnpt++L9lWyS0gfAcAy7kxobpxkCil0I/40ENNnd2tZWpZIgHYwY2JVs0o1a6E5RW
         wjGA==
X-Gm-Message-State: ACgBeo3DRbyS+4hnOiXlrsUernwBnBtVVAI8uMTPFmWAarS0VNWcUVTb
	kAXGZ+iADpulkmGUSOyD0HRl8q7nVmcRmA==
X-Google-Smtp-Source: AA6agR44AFoQaPHvxRgMzbiVcO9xg4sC240Pn4X9J54uE7R+HLSfV7vWzajM4Bp1oyEpBR1lqQ+w0Q==
X-Received: by 2002:a63:f74e:0:b0:41a:716c:bfc4 with SMTP id f14-20020a63f74e000000b0041a716cbfc4mr8298443pgk.14.1659767721320;
        Fri, 05 Aug 2022 23:35:21 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id a18-20020a63e852000000b0041b67615584sm2418452pgk.68.2022.08.05.23.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 23:35:20 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 0/8] mtd: spi-nor: Add support for Infineon SEMPER s25hl02gt and s25hs02gt
Date: Sat,  6 Aug 2022 15:34:18 +0900
Message-Id: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_233523_578621_7D1038F7 
X-CRM114-Status: GOOD (  11.80  )
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

Infineon SEMPER s25hl02gt and s25hs02gt are multi-chip (dual-die) package
parts and the datasheet can be found at:
https://www.infineon.com/dgdl/Infineon-S25HS02GT_S25HS04GT_S25HL02GT_S25HL04GT_2-Gb_DDP_4-Gb_QDP_HS-T_1.8-V_HL-T_3_0-V_Semper_Flash_with_Quad_SPI-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c7e7124d1017f01b9a5055b7b

The key characteristics of multi-chip devices are:
- Each die has dedicataed registers so we need to configure and check
  registers in all the dice
- Read ops can cross the die boundary
- 4-byte address mode by default
- Legacy chip-erase command is not supported

To support multi-chip devices, core and sfdp need to determine the number
of dice and volatile register offset for each die. The SCCR map and newly
added SCCR map for multi-chip params in SFDP helps to do it.

In manufacturer specific code (spansion.c), configuration and status check
are updated to support multi-chip.

The s25hl02gt and s25hs02gt support chip-erase-addressed command followed
by die address instead of legacy chip-erase command. This series does not
add support for chip-erase-addressed. Another patch set may be created to
introduced how we can utilise that command.

Tested with Xilinx Zynq-7000 platform. Existing devices that share the
same manufacturer code (S25Hx-T and S28HS512T) are also tested.

ID, SFDP, and test log:
--------------------------------------------------------------------------
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s25hl02gt
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
342a1c0f0090
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion
zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450080104ff00080114000100ff84000102500100ff81000118e001
00ff8700011c580100ff88000106c80100ffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffe720faffffffff7f48eb086b00ff
88bbfeffffffffff00ffffff48eb0c2000ff00ff12d823faff8b82e7ffec
ec031c608a857a75f766805c8cd6ddfff938c0a1000000000000bc000000
0000f7f5ffff7b920ffe21ffffdc0000800000000000c0ffc3fbc8ffe3fb
00650090066500b10065009600650095716503d0716503d000000000b02e
000088a489aa716503967165039600000000000000000000000000000000
000000000000000000000000000000000000000000000000716505d57165
05d50000a015000080080000000800008010000000100000801800000018
fc65ff0804008000fc65ff0402008000fc65ff0804008008fd65ff040200
8008fe0202fff1ff0100f8ff0100f8fffb0ffe0902fff8fffb0ff8ff0100
f1ff0100fe0104fff1ff0100f8ff0100f8fff70ff8ff0100f1ff0100ff0a
00fff8ffff0f
zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
86aef254bcfdf763bdb92e4c31667242  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
zynq> test_qspi.sh
6+0 records in
6+0 records out
6291456 bytes (6.0MB) copied, 0.231488 seconds, 25.9MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
9f433bd1566013c98b94f5ff441859314c1fc7d6  qspi_test
9f433bd1566013c98b94f5ff441859314c1fc7d6  qspi_read
--------------------------------------------------------------------------
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s25hs02gt
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
342b1c0f0090
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion
zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450080104ff00080114000100ff84000102500100ff81000118e001
00ff8700011c580100ff88000106c80100ffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffe720faffffffff7f48eb086b00ff
88bbfeffffffffff00ffffff48eb0c2000ff00ff12d823faff8b82e7ffec
ec031c608a857a75f766805c8cd6ddfff938c0a1000000000000bc000000
0000f7f5ffff7b920ffe21ffffdc0000800000000000c0ffc3fbc8ffe3fb
00650090066500b10065009600650095716503d0716503d000000000b02e
000088a489aa716503967165039600000000000000000000000000000000
000000000000000000000000000000000000000000000000716505d57165
05d50000a015000080080000000800008010000000100000801800000018
fc65ff0804008000fc65ff0402008000fc65ff0804008008fd65ff040200
8008fe0202fff1ff0100f8ff0100f8fffb0ffe0902fff8fffb0ff8ff0100
f1ff0100fe0104fff1ff0100f8ff0100f8fff70ff8ff0100f1ff0100ff0a
00fff8ffff0f
zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
86aef254bcfdf763bdb92e4c31667242  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
zynq> test_qspi.sh
6+0 records in
6+0 records out
6291456 bytes (6.0MB) copied, 0.231691 seconds, 25.9MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
58b52b293f93574507b6ffb06f0e79b57b0f1f28  qspi_test
58b52b293f93574507b6ffb06f0e79b57b0f1f28  qspi_read
--------------------------------------------------------------------------

Takahiro Kuwano (8):
  mtd: spi-nor: core: Introduce number of dice and volatile register
    offset params
  mtd: spi-nor: sfdp: Extract volatile register offset from SCCR map
  mtd: spi-nor: sfdp: Add support for SCCR map for multi-chip device
  mtd: spi-nor: spansion: Rework cypress_nor_set_page_size() for
    multi-chip device support
  mtd: spi-nor: spansion: Rework cypress_nor_quad_enable_volatile() for
    multi-chip device support
  mtd: spi-nor: spansion: Add a new ->ready() hook for multi-chip device
  mtd: spi-nor: spansion: Introduce DEF_4BAM mfr flag
  mtd: spi-nor: spansion: Add support for Infineon

 drivers/mtd/spi-nor/core.c     |   1 +
 drivers/mtd/spi-nor/core.h     |   4 +
 drivers/mtd/spi-nor/sfdp.c     |  76 +++++++++++
 drivers/mtd/spi-nor/spansion.c | 232 ++++++++++++++++++++++-----------
 4 files changed, 237 insertions(+), 76 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
