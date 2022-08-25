Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899FAC3F6B0
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Aug 2022 02:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gkBzK8zzxlmrtGTPIx5nt95D6xH+2GvTb3vLX9x7r74=; b=cC5v/SMculQGAx
	MjGbau5FsVMG6K8ZG7gigIHQgzxlvsT5adRjfga/MbWxk9fXVGbzGQtc72780XB4iGRDlU7EjcJxd
	2Efk8fFECKvuw2GTM9eiwYY21biDo/oAnuabYkKDe+83sbtddukwHxGx9kcl2IHaMSGXMOrB/CpYQ
	FzPgip9m0qu8du/2KKR8xp4ZEJ7jlODp8ZcL5GGL5SwqvVIqpCLFg6M2ARYFXVjCsg+ExR4WI9YAv
	bQFljMnM/KcxftXLjmUg1rp6ztElmgv+V3QHkOMoFXIW0nrj2SA8YzRWOMRxM8MCOh18Bue2UAB8g
	bTQgshW6nlbWz5ALKvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR2Ug-004MPR-7P; Thu, 25 Aug 2022 02:21:18 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR2UT-004MKu-0C
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2022 02:21:06 +0000
Received: by mail-pg1-x52f.google.com with SMTP id v4so16621241pgi.10
        for <linux-mtd@lists.infradead.org>; Wed, 24 Aug 2022 19:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=dZ2xuf2xX/Q2YYhQEaphYPZN3tyPMUeVXcoCxIVGKyY=;
        b=LruRZpTJyIXnAj+pFiufqMF1LtAD4xM7UGQD7Q5aIEbVQG3qUBhvqQOgtyfLo/Fh0n
         q8xN+vOzUdRCOKcWtkEX3S+H31b3VPUOwytNW+uB2tl3BdvnXXBQWRANkaa+F6gYT+zm
         hHyoatB9aIyzNbYMqeNDQtHYD6RiEMEPtgHN16mS5bwzqO2nOx78lV9/SCeGJ3nY6HQC
         QoeyLwM/iBKqH0edjWSEds8pspqzO3RQEztoCIN46ZxxVgr5WWfvayfdJh9+ddh655WH
         kjPrBjKZ1EtZGH6tMtibdK/akJkt7wV/YrpF6DCaMMfMB/X/8QDSNxbD3xZepqgDMHct
         Zylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=dZ2xuf2xX/Q2YYhQEaphYPZN3tyPMUeVXcoCxIVGKyY=;
        b=T+OKve1A1djppllD8nJjo0xjh2Z4XiwYDyfIHDtj+dgZWO8WkT1jQSUhHbkKdQgmA1
         MX5ojPe0gMeRmNom+oDLeRZ5idyacbJnOT060gsgIy1EBDPTXrYjRInjHRrJeodbKHzw
         PBuIHULSYZfErwUMHRDsqaI0X9ysx4KzPCRpfCF7bIisH9pa0Y7WLrn3DQWBBbinuj1s
         jQQyo8MWNby6ELaFHNNMfs96C0FiopS/ausEXU4kVCHhMsWdQNh7haKFjJt0oc+iwORF
         F6T/kNuf0vulVjedSFSm4c9GTe6PpD745gkW3mLO6UV9ZVcM3Gm0stmPt+5XOcLyzaNV
         UYcQ==
X-Gm-Message-State: ACgBeo2d+rVaOERwG65NxsDapaOcUTONTH69RobEf5fke5009RoZwgZR
	k6++7eT7sHUfNYGlbeQABrMzKHmP9xc=
X-Google-Smtp-Source: AA6agR5uOVbzMdTIH9aEj0/oRSrs2U3Ehq3z3jZ8xhkASqNmyld/fMuAnlXVy6evvT4AL8esUeGMkg==
X-Received: by 2002:a65:6953:0:b0:42a:4612:2d7b with SMTP id w19-20020a656953000000b0042a46122d7bmr1473927pgq.253.1661394060521;
        Wed, 24 Aug 2022 19:21:00 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id g15-20020aa796af000000b00536c7a1012csm6447917pfk.184.2022.08.24.19.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 19:21:00 -0700 (PDT)
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
Subject: [PATCH 0/2] mtd: spi-nor: spansion: Add support for s28hl512t, s28hl01gt, and s28hs01gt
Date: Thu, 25 Aug 2022 11:20:16 +0900
Message-Id: <cover.1661392740.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_192105_094384_040B3081 
X-CRM114-Status: UNSURE (   8.05  )
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

These devices are variants of s28hs512t(1.8V 512Mb) with different
density(1Gb) and power supply voltage(3V).

Datasheet:
https://www.infineon.com/dgdl/Infineon-S28HS256T_S28HS512T_S28HS01GT_S28HL256T_S28HL512T_S28HL01GT_256-Mb_(32-MB)_512-Mb_(64-MB)_1-Gb_(128-MB)_HS-T_(1.8-V)_HL-T_(3.0-V)_Semper_Flash_with_Octal_Interface-DataSheet-v03_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ee6bca96f97&da=t

Tested on Zynq-7000 platform with Infineon SPI controller

ID, SFDP, Test logs:
-------------------------------------------------------------------------
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s28hl512t
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
345a1a
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion
zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450080105fe00000114000100ff84000102500100ff050001055801
00ff8700011c6c0100ff0a000104dc0100ff81000116ec0100ffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffe7218affffffff1f000000000000
0000eeffffffffff0000ffff00000c2100ff00ff12dc23faff8b91e8ffe3
ec031c6030b030b0f766805c000000fff9f810a000000000000084020000
0000ffff7e7e43120ffe21ffffdc00ee809b0000000000b08c95a80b0000
0c551ca20000800000000000c0ccffeb88fbffeb00650090060500a10065
009600650095716503d0716503d0a46bfb0290a579a20040288e0000ff00
0000ff0071650690716506900000000000000000716506d1716506d17165
0691716506910000ff000000ff00716505d5716505d50000ee7200000601
000000008000710600030600fc65ff0804008000fc65ff4002008000fd65
ff0402008000fe0002fff1ff0100f8ff0100f8fffb03fe0302fff8fffb03
f8ff0100f1ff0100fe0104fff1ff0100f8ff0200f8fff703f8ff0200f1ff
0100ff0400fff8ffff03
zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
b7661a9fd55106d44f80f06e5b38f592  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
zynq> test_qspi.sh
6+0 records in
6+0 records out
6291456 bytes (6.0MB) copied, 0.231607 seconds, 25.9MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
7ca01dfbd718151b749ab6ac05f316d199bbda25  qspi_test
7ca01dfbd718151b749ab6ac05f316d199bbda25  qspi_read
-------------------------------------------------------------------------
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s28hl01gt
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
345a1b
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion
zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450080105fe00000114000100ff84000102500100ff050001055801
00ff8700011c6c0100ff0a000104dc0100ff81000116ec0100ffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffffffffff7218affffffff3f000000000000
0000eeffffffffff0000ffff00000c2100ff00ff12dc23faff8b82e7ffe6
ec031c607ab07ab0f766805c000000fff910f8a0000000000000bc020000
0000ffff7e7e41120ffe21ffffdc00ee800b7171656500b0ff96a80b0000
0c551ca20000800000000000c0ccffeb88fbffeb00650090060500a10065
009600650095716503d0716503d0a46bfb0290a579a20040288e0000ff00
0000ff0071650690716506900000000000000000716506d1716506d17165
0691716506910000ff000000ff00716505d5716505d50000a01500000601
000000000080710500004306fc65ff0804008000fc65ff4002008000fd65
ff0402008000fe0002fff1ff0100f8ff0100f8fffb07fe0302fff8fffb07
f8ff0100f1ff0100fe0104fff1ff0000f8ff0200f8fff707f8ff0200f1ff
0000ff0400fff8ffff07
zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
0fbb3fac2bc788513976d01840fd598f  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
zynq> test_qspi.sh
6+0 records in
6+0 records out
6291456 bytes (6.0MB) copied, 0.231796 seconds, 25.9MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
296c691a4653e0f5c334e1a9953d8cb4b1038d47  qspi_test
296c691a4653e0f5c334e1a9953d8cb4b1038d47  qspi_read
-------------------------------------------------------------------------
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s28hs01gt
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
345b1b
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion
zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450080105fe00000114000100ff84000102500100ff050001055801
00ff8700011c6c0100ff0a000104dc0100ff81000116ec0100ffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffffffffff7218affffffff3f000000000000
0000eeffffffffff0000ffff00000c2100ff00ff12dc23faff8b82e7ffe6
ec031c607ab07ab0f766805c000000fff910f8a0000000000000bc020000
0000ffff8e8e41120ffe21ffffdc00ee800b7171656500b0ff96a80b0000
0c551ca20000800000000000c0ccffeb88fbffeb00650090060500a10065
009600650095716503d0716503d0a46bfb0290a579a20040288e0000ff00
0000ff0071650690716506900000000000000000716506d1716506d17165
0691716506910000ff000000ff00716505d5716505d50000a01500000601
000000000080710500004306fc65ff0804008000fc65ff4002008000fd65
ff0402008000fe0002fff1ff0100f8ff0100f8fffb07fe0302fff8fffb07
f8ff0100f1ff0100fe0104fff1ff0000f8ff0200f8fff707f8ff0200f1ff
0000ff0400fff8ffff07
zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
08db437d1890431e1d35284579100222  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
zynq> test_qspi.sh
6+0 records in
6+0 records out
6291456 bytes (6.0MB) copied, 0.232206 seconds, 25.8MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
1af7d491e78b33caa6c72d2f0062658dafe52451  qspi_test
1af7d491e78b33caa6c72d2f0062658dafe52451  qspi_read
-------------------------------------------------------------------------

Takahiro Kuwano (2):
  mtd: spi-nor: spansion: Rename s28hs512t prefix
  mtd: spi-nor: spansion: Add s28hl512t, s28hl01gt, and s28hs01gt info

 drivers/mtd/spi-nor/spansion.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
