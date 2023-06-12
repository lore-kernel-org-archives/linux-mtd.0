Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121A7C7EE2E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 10:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/nCE+8zn6ov2pUIArmDbuDASLqEVpHLHgVd986O2YIs=; b=b4Gp8SfNqU7Bwl
	EbfF7SnFEazxHi3jLYkp7h/INz/xAvtbdhzkxDt9q2ErZlP2SbjWFgRYddG3qw6IvWKVJtO/zb2EW
	ix+z1vMghT3ak21zPLkfzVG3xB9SY44o4CJAikHGXJ9nk/j+6vBPpgBCRJq8yVXOVZrpFJCqcXaUA
	Mkmsu/X0Fmxu5aJ8g2CaP2m1ukwAeCi8cfUvp25KW37BgLlJu2dzKgFXojCV3wAqAd5vhjt4NMYoQ
	trF9yUwvvUlnWNWgYZfB/oRM2ZVi+KLJ794yMD0ehHmLyiSZp5UwsOLyrAzp4BEh0IYXzoZMRK7UR
	/a0XpiztS0W/PytREOjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ePb-003QFV-0V;
	Mon, 12 Jun 2023 10:04:35 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ePY-003QEI-1i
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jun 2023 10:04:33 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-665a18f5643so234376b3a.0
        for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2023 03:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686564270; x=1689156270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ll/wZd+lUvMZMVAaL7mELtfWJS5Jd4P0kMzK9p0tNQ=;
        b=bDq7C38d8QMSJSyTNO2K3z9+uiG01+561yn9FKEHRqCaCQjw9drluMOLy9dZ5QGmVS
         rDkSCVDVNNcuCItIR4IF493ZzqyY4olzvsqMjFJBZ7Ryzj33WrPx3GXgAq1/BdppID0n
         XfLUqY2bSaDyJjVCsDW8LQBDAdD1upCkrX0K3cvFtyBBuKTD7Cz1iCYdKybbIFDZsVgt
         wqd5nGHj6QJJIQw862kBxl0PVzwmNlakzIwIbf8Le6y00lJqEHJjAmqBEapChGDBHcdQ
         Vi+LpJpVrZaJkyyzI/ArsEgeP3R/z5gbPimoy2QY9mZHsacry+RP3ubqlFxRiA0y7yqN
         ybmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686564270; x=1689156270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ll/wZd+lUvMZMVAaL7mELtfWJS5Jd4P0kMzK9p0tNQ=;
        b=Y+sfTK3wN99wZT30EFy38QC5EIhwOL5HpDWqGyzc0qFw87ZAiaWD9G+0xy6Y3FjGR7
         Cx0sjHta5QvEkxesOYStQ+ufYrrM/haBWoYtc8P9cCn/5yet3Qx5kkgQv1zknF54Mh1i
         8+ql0FWm5sLQWbqd2L5sOs/pNkBxAWKdTEePgSLLEImTIOxs8ROM7wITqAuS9Rbka8DB
         4aGRATqPMRXc3yYEJUOowQjAiitR6ke/64d93yBJ6btnOluzs7/iHxFTzyxITTN8t3PZ
         VjtkROqlyqEovZKo4RbxqSofezE+woZbKtTNaFdDwL7JSNCo36bsMtpOQAsE1DU6eEUq
         WlDg==
X-Gm-Message-State: AC+VfDxIy9RB1cn1VJhpd2AR+wQzsEYWUpesMXWjGM8GynMmIAMHSJ32
	zYpIdlGqUg2f2RrSyDJG4eBJrPzX45w=
X-Google-Smtp-Source: ACHHUZ4bS+PoQzqxL9J+U/7FhR2xnjgDYgp7kt7dM9N8UJ/p9UeA9LpPlrdCIhr4qTyo6x6J4UNvqg==
X-Received: by 2002:a05:6a00:2da3:b0:652:a559:b2c5 with SMTP id fb35-20020a056a002da300b00652a559b2c5mr10739298pfb.13.1686564270332;
        Mon, 12 Jun 2023 03:04:30 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79211000000b00662610cf7a8sm6723376pfo.172.2023.06.12.03.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 03:04:29 -0700 (PDT)
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
Subject: [PATCH 0/5] mtd: spi-nor: spansion: Add support for Infineon S28HS02GT
Date: Mon, 12 Jun 2023 19:04:04 +0900
Message-Id: <cover.1686557139.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_030432_571371_5BE29F25 
X-CRM114-Status: UNSURE (   7.91  )
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

Takahiro Kuwano (5):
  mtd: spi-nor: spansion: Preserve CFR2V[7:4] at latency update
  mtd: spi-nor: spansion: Rework cypress_nor_octal_dtr_enable()
  mtd: spi-nor: spansion: Rework octal_dtr_enable() for MCP
  mtd: spi-nor: spansion: Octal DTR support in RD_ANY_REG_OP
  mtd: spi-nor: spansion: Add S28HS02GT ID and fixups

 drivers/mtd/spi-nor/spansion.c | 187 +++++++++++++++++++++++----------
 1 file changed, 130 insertions(+), 57 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
