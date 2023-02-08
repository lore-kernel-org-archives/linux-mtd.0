Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB57DC05027
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 05:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c7zqcRZNuEXiXCbR/uvnS9ciGZk/YvhF2GrExdTve2M=; b=RdKWQc4BSQIZCy
	Xa3UimMbIpRljBemKuLb7w1wzUTw9x/kGvTGNykDlzzxstJ0Oi4Y4QXO3qV8zgBY8tmehX2J1jiss
	tjdwktDgsXZOePSNrHAFmrOE/uKe4+N6DwBFHV8zN6MRbYaiEJvbFC5g2jnlSFUrwTllaNMFasa5Z
	bD6pVGiH/9egphtIR35N6eOf8hzCUYLvo2DFSrOCIMZ0xQVFyb88HdIz1u0sD0NMvVrhMgq+hDEBr
	y0JjSl/7L5vtazCli9EhHxayYIsLqI9QDQ+w/ungNuqFzc+VwqBNK2T3ZQVkL55jOkGSsTZKNdTOE
	jq3rBoUvwkUeApTXRGow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdPg-00EDzc-Cp; Wed, 08 Feb 2023 05:54:36 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdPb-00EDy7-7j
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2023 05:54:33 +0000
Received: by mail-pl1-x629.google.com with SMTP id g13so13333186ple.10
        for <linux-mtd@lists.infradead.org>; Tue, 07 Feb 2023 21:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ntkHlHPMDufMlrx8vNBhjgx8Y1JLY5bQcwRl3gj38+E=;
        b=WP91nL4sMDBqRoaY4mEDmbXFLrET1z4GDcsSFZhRKZYY89LECAqeQ2TEde05nE7eh1
         Ajw7l9VvlatQBPWEpSBzODQ/nvYjxElj6By18hPjS/5nHwnv2BkQDWOLCjRmqLwLYN6s
         hTX4B/EBMKxfL+QKxhTNkwRiISiNRc8MI9WYg8SMI2UG0MudhrZebjB9ivyrEP86HfPV
         1mfJeKpBDy2MObxawiVQQ4khMFzhvGeBqHqqIF9s8J3BjvjWqQsmZGshl7sILWpVWI22
         zyztfNLCJcrheHddkA+pnL4K90YZGEPEI3snK5znu3a1j4q1JzCLe29z65nmwYL9OZaF
         w5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntkHlHPMDufMlrx8vNBhjgx8Y1JLY5bQcwRl3gj38+E=;
        b=w1tQCRTRSEcyCadumLTGuVV7CRnzcLgYf+kuWHzkJHfvln3oILo+J96lWzOf+1Np6R
         46n2tShqTt1TYA1auxjl+IOSZlyuzY+4rAle4vPh3TfKXtZlcm3Tm+wEcbGIgGOrlx8w
         0yq+YdK5YIqkxQhBZy9IcqQryqjhED114H35phB/2hTt+2W+IoelLsFzfpcSlT+WlJXd
         QtxDz68Q5NZuXRlaB/ywfDe9QHSUYphruBgNDyAd9DTYf0bkIFceWBTLwHJqLbhXnkpE
         wKgKGpDtVyweYMmKHIQXqqNrKc4lSkehMvNekLTekmOGWQ+acPc9QR9HVf6s3WEY6l+w
         YZDw==
X-Gm-Message-State: AO0yUKXjdSyGjnHCwotmrIuqyYe/S6Gwy685Hgul6/tEJZP0pdoFRG5G
	oluID+kDcckB7m9jFMO3dk7FFqcsNYo=
X-Google-Smtp-Source: AK7set8KkCCQOyVq0gIYGqRpideuma8hPDBiEy/NxJd4b8lYi6pM47/I7uZL/7aKf0S6ZP4fULFzug==
X-Received: by 2002:a05:6a21:6d97:b0:be:b106:3191 with SMTP id wl23-20020a056a216d9700b000beb1063191mr5429742pzb.49.1675835667409;
        Tue, 07 Feb 2023 21:54:27 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id r16-20020a638f50000000b004eca54eab50sm8915954pgn.28.2023.02.07.21.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 21:54:26 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 0/8] mtd: spi-nor: Add support for Infineon SEMPER s25hl02gt and s25hs02gt
Date: Wed,  8 Feb 2023 14:53:37 +0900
Message-Id: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_215431_335033_FB0E569D 
X-CRM114-Status: GOOD (  13.41  )
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

Changes in v2:
  - s/return 0/continue in cypress_nor_quad_enable_volatile()
  - Stop introducing DEF_4BAM flag. Handle it in post_bfpt_fixup() instead

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
  mtd: spi-nor: spansion: Set params->addr_mode_nbytes = 4 for multi-die
    parts
  mtd: spi-nor: spansion: Add support for Infineon

 drivers/mtd/spi-nor/core.c     |   1 +
 drivers/mtd/spi-nor/core.h     |   4 +
 drivers/mtd/spi-nor/sfdp.c     |  76 +++++++++++
 drivers/mtd/spi-nor/spansion.c | 232 ++++++++++++++++++++++-----------
 4 files changed, 236 insertions(+), 77 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
