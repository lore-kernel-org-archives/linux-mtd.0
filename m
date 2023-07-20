Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57E0EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 07:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bEvQtr9twHQ6ca35jV5TjYFyZlEUO251aMYyLQ7ZLHA=; b=ajygVhqk5riUBm
	DENVId4HLFfw8pzqAzFhLew0IUHPmiC9LNx3tB/m3QDwr/sGZzyvM2dv2m4qf7oUxoqUFAtM5Gvcl
	p3nEiJPkcUm2h17GlZNGR0YPYRifW7l8zWkS6qWUvbb2ngDEw8PFC1Qj+JDBN2eSmHDDBgfa+GUP7
	7py7BVfzweupsM7D894Q/K6gDiIPw4yI8Ra5d+sK2UUeSHFVEvDtlamObRZwySdcmaDSHvDXY9YBp
	qSYe8rDElWMo7hdMtQwAXrc/FNWe2IZICoYIYQsBSOmyY09FieQMOdXTdLNjMGUlSN7pJ4rfK5vwo
	LuqWUmakgu+iT9/qov+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNns-00A4MH-0j;
	Thu, 20 Jul 2023 07:10:24 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNnp-00A4JE-2c
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 07:10:23 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b89600a37fso2736215ad.2
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2023 00:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689837018; x=1690441818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BNj4sipWgBv3MuUsRAExWaQs3A39T+Fm/LVVJ7FgMWc=;
        b=fUvU7sN921TNobvlvb19VyGBhWzjmWv8uvBfYhvKCpZ2ppCKrqdgUmNWErCIXcxD3E
         reApmQP0PTTqZGcqS2KXiYujlfCfO/CK0477T6EkA8sVaP7LftMzV5/cN/R2FRRTper9
         nnsiADMlCRQkXunKplSM1gvsI6iKLRJ3QWSTbuOG2MrpF4fmKZiIHRMpT/s6yKtoLku/
         5erx1mjuDMLmKqLf+cArk6cSudzz/l3bK0jYrPHbFvDgRfQJKqHgV3uG2NfSCS1Ba6ox
         6lIKr+OKyi3K4nRenyo+bi59R3ZPuBc6PSG+14dKxZVK/B8ILICFtrGNmjW3oqmwZUnx
         90qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689837018; x=1690441818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNj4sipWgBv3MuUsRAExWaQs3A39T+Fm/LVVJ7FgMWc=;
        b=jXnpEjToSNMgDWCs0v4ypGUup98T8TFR+XhbD+S18nACXrveyGcRCLCwAg0kZM7iae
         dIDv8MzeTlzIgnwxuzZY3EEgKLjB/EfKmtHiMDts2aTk5y/QYhcR5SyHonDh0yBT1Pqu
         INTOl+4jTQ5MFIpSGqMYN3KadBEQJKFtH0CpqE9CaO90FX5g0BkzGoprijyXfE4zNYCf
         sFWJwKrLSizO/fNAf1iyaJVbbgyyLP5te2yoqarvpVtVkwYNEHNKMDYG5ARrAShAFkaV
         BFxQGwvcNA1eVFBMEIf/urZNOYfqdz1+6pyeWBxHbckAN0dD1OfJAqPTkm2ONe9JbmrG
         Q7bg==
X-Gm-Message-State: ABy/qLZMg+3rODpLTgBhogiaH7y+YA4a2wJBzkIcS3nGE9LPWASnzUVw
	5wW82zr1l0YL1AOxy8Q1zQHTD9Wk+Ec=
X-Google-Smtp-Source: APBJJlHG99JtMaVqK8CPll6WXpK4qZ98t//YHF0Xe/JOei82g4LJZ5NxvLBhcJnZ2pz70Hp/d6DbHA==
X-Received: by 2002:a17:902:a608:b0:1b8:987f:39c0 with SMTP id u8-20020a170902a60800b001b8987f39c0mr1068346plq.28.1689837018251;
        Thu, 20 Jul 2023 00:10:18 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm515821pld.13.2023.07.20.00.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 00:10:17 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 0/8] mtd: spi-nor: spansion: Add support for Infineon S28HS02GT
Date: Thu, 20 Jul 2023 16:09:55 +0900
Message-Id: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_001021_845130_1752FE40 
X-CRM114-Status: GOOD (  10.55  )
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

Infineon S28HS02GT is 2Gbit, multi-chip package, Octal SPI NOR flash. This
series reworks octal_dtr_enable part to support MCP and then adds ID and
fixups for S28HS02GT.

Tested on Zynq-7000 platform with Infineon SPI controller

ID, SFDP, Test logs:
---
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s28hs02gt
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
345b1c
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion
zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450080106fe00000114000100ff84000102500100ff050001055801
00ff8700011c6c0100ff88000106dc0100ff81000118040200ff0a000104
f40100ffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffffffffff7218affffffff7f000000000000
0000eeffffffffff0000ffff00000c2100ff00ff12dc23faff8b82e7ffec
ec2319497ab07ab0f766805c000000fff910c0a0000000000000bc020000
0000ffff7e7e41120ffe21ffffdc00ee800b7171656500b0ff9600000000
0c551ca20000800000000000c0ccfffb88fbfffb00650090066500b10065
009600650095716503d0716503d0a46bfb0290a579a20040288e0000ff00
0000ff0071650690716506900000000000000000716506d1716506d17165
0691716506910000ff000000ff00716505d5716505d50000a01500008008
000000080000801000000010000080180000001800000601000000008000
710600030600fc65ff0804008000fc65ff0402008000fc65ff0804008008
fd65ff0402008008fe0202fff1ff0100f8ff0100f8fffb0ffe0902fff8ff
fb0ff8ff0100f1ff0100fe0104fff1ff0100f8ff0100f8fff70ff8ff0100
f1ff0100ff0a00fff8ffff0f                                    
zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
6193b9729008b80b9a2b4bb3ce06a91d  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
zynq> test_qspi.sh
6+0 records in
6+0 records out
6291456 bytes (6.0MB) copied, 0.234679 seconds, 25.6MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
3020d73d4d0e570449faacfbadf134e074ced30e  qspi_test
3020d73d4d0e570449faacfbadf134e074ced30e  qspi_read
---

Takahiro Kuwano (8):
  mtd: spi-nor: spansion: use CLPEF as an alternative to CLSR
  mtd: spi-nor: spansion: preserve CFR2V[7] when writing MEMLAT
  mtd: spi-nor: spansion: prepare octal dtr methods for multi chip
    support
  mtd: spi-nor: spansion: switch set_octal_dtr method to use vreg_offset
  mtd: spi-nor: spansion: switch h28hx's ready() to use vreg_offset
  mtd: spi-nor: spansion: add MCP support in set_octal_dtr()
  mtd: spi-nor: spansion: add octal DTR support in RD_ANY_REG_OP
  mtd: spi-nor: spansion: add support for S28HS02GT

 drivers/mtd/spi-nor/atmel.c     |   8 +-
 drivers/mtd/spi-nor/core.c      |  23 ++--
 drivers/mtd/spi-nor/core.h      |   4 +-
 drivers/mtd/spi-nor/issi.c      |   4 +-
 drivers/mtd/spi-nor/macronix.c  |   4 +-
 drivers/mtd/spi-nor/micron-st.c |   4 +-
 drivers/mtd/spi-nor/spansion.c  | 193 ++++++++++++++++++++++++++------
 drivers/mtd/spi-nor/sst.c       |   8 +-
 drivers/mtd/spi-nor/winbond.c   |   4 +-
 drivers/mtd/spi-nor/xilinx.c    |   4 +-
 10 files changed, 201 insertions(+), 55 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
