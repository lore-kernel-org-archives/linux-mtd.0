Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23CCC0502A
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Aug 2022 05:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qf+lK92DRnM8c3oklOJX/19Ly1eIYK+vo2Dj6tLVNIU=; b=dwgLcc04OYB5nf
	jtMceiT+bZaOyWNCoYpOjnmW6DQCv2dYsK3uVuCGPnz2NlYyBBcLwWgvUYUwTFb4890ZdYADEEalM
	xIwxldpkalmCbOUDQFzcT6GEJlCyNJP5AMHs8XwTgD/4RyEJV4sAAk8K/Sej7xINK0ea4NWn+O5BK
	KHL6V++zKuaDffcO2ioeo1c32oQ3cuFtcfhXZB2qtfQF2me3VdDxaRCHAQdqDXm6ApUrPQcELi0Bp
	Ea0tGu5gSHu107wqwG9dM6RIjrIbNUVE8uKH2ZaoCfx1njVMihxA8oz0Wz8PANSA1cxhz9Z8QUStU
	AFdHsbhJLcIcnhdRsQzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTFp9-003oPc-B7; Wed, 31 Aug 2022 04:59:35 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTFp5-003oLZ-3D
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2022 04:59:33 +0000
Received: by mail-pg1-x534.google.com with SMTP id 73so4194567pga.1
        for <linux-mtd@lists.infradead.org>; Tue, 30 Aug 2022 21:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=QRaPesGGRrmraEMUQn76GLjQqoe8VOwFrpHmAahWcHE=;
        b=NT8CapbASwhrjM4ZrOTk5CddcoIoF691kOGTke+kTuUIZyImVxZmEZq8vNBXOvjyQp
         fVDQKHSO1JMpfDdYyyU/S1e6bluA9JoV2UJC4A1JNeXmLUoE8AAW9ThnXrWjFi3acq/4
         17Rqd4CZkRaYkjZU6vefoysJuW6WwuOS+KVr1Bs7iqZaMBcHZSAsODLykhqEEnN5eJGi
         bxywde9NigVKIonAoCwzwLcwDm2eWb4Hf87ZKaIITkp+KLsNSrOI/bTCSp56rSeduGF+
         9Ntp6xkGwM9JYy0+irV1nU3I2QNc3TnXDy1YU4MBKSPUtv5riOE0fCWAfOUvWQ1cBzJk
         s6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=QRaPesGGRrmraEMUQn76GLjQqoe8VOwFrpHmAahWcHE=;
        b=jauz3GoRrsjmL5YOz2cHX3hltxZQR169uuDnxQhXrNiEyL8SCETq5gTUrEiq4RAkE7
         9vTwqegxGNM4s+JfwhQxxz8DW2FWTaUuIvb8AUlg9+ONd8oXOFudsdBQB2G74pM4MpXN
         bk9ZuQlbe1oxxCDr7MqGnVDnj0wPAalLO6ha2271L3LNIBgGVedD7Oj/awTQzWK+ge5t
         Z49SkjbITmU6YOtJ8AaUSa19eKw2nXlcrr1E4bIPL0VJMW/S8XlxVZZiHG+QXhL5AWHH
         XfC3Dt0kjPPAbfLF/lcdztbwf+RRUWY8oddGmPG0IHOVTM7JdN8EQxrwz2l6Yo+uos1b
         EZWQ==
X-Gm-Message-State: ACgBeo0+FoNjxcSMYTQqxzZrldlu8fq2T70GtJDooPJkas30H6ymLmsb
	UavFTe7wFGCXDwuE8jnovlnMUu6fs70=
X-Google-Smtp-Source: AA6agR7yMPZI/lL52tod0x6czueZlO+BXfW/AGpdwXL23mgllfEkGKmYs8GSFiewQzBZzkRXUr1XkQ==
X-Received: by 2002:a63:581d:0:b0:42b:399:f15a with SMTP id m29-20020a63581d000000b0042b0399f15amr20724055pgb.337.1661921967268;
        Tue, 30 Aug 2022 21:59:27 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id w13-20020aa7954d000000b005367ef405e0sm10178519pfq.85.2022.08.30.21.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 21:59:26 -0700 (PDT)
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
Subject: [PATCH v2 0/4] mtd: spi-nor: spansion: Add support for s28hl512t, s28hl01gt, and s28hs01gt
Date: Wed, 31 Aug 2022 13:59:02 +0900
Message-Id: <cover.1661915569.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_215931_204173_689B40FD 
X-CRM114-Status: UNSURE (   8.56  )
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

v2 removes NO_SFDP_FLAGS by adding read and page program settings in xSPI
profile 1.0 parse.

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

Takahiro Kuwano (4):
  mtd: spi-nor: sfdp: Update params->hwcaps.mask at xSPI profile 1.0
    table parse
  mtd: spi-nor: spansion: Remove NO_SFDP_FLAGS from s28hs512t info
  mtd: spi-nor: spansion: Rename s28hs512t prefix
  mtd: spi-nor: spansion: Add s28hl512t, s28hl01gt, and  s28hs01gt info

 drivers/mtd/spi-nor/sfdp.c     |  7 ++++++
 drivers/mtd/spi-nor/spansion.c | 45 +++++++++++++++++++++-------------
 2 files changed, 35 insertions(+), 17 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
