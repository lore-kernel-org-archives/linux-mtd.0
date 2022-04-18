Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDF5C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Apr 2022 05:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7lHss3q1MAcsBBTarmb2Wkq3mR2GalcrgfNCj7QEcKg=; b=zISeTuoe2s9rZ0
	rerRhhegLmwqTP9pMd7nZy9aqygY1pu/oekSdiRmp3ls7oPv+f0A0uWkrrc0xooGnNjWvB1YQez0f
	XbXYigaZKM0M0syJyFoUV59//RJfoDz0bhyyQRjHUV4We1/SFBIJJRyn3At4aZSCDaKM5OkKkYcHV
	I660vSzY2xkczwi9DNdwQ9+kzC+lKKfFcpeolyDaoO2i80W6jo4qOTijOYxn08pS5kpd+UaPH7G67
	IvlvRIXlMLtRlDfk4d6bRPErWbdCdAtxCT+LUNMvM0vBcFyVM3pvhiHJ2BV84rGpMV2zm3OYqp2A6
	FzWFj4H1SdVY7Wl5Cang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngK8s-00Fhud-ER; Mon, 18 Apr 2022 05:41:42 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngK8p-00Fhtk-2F
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2022 05:41:41 +0000
Received: by mail-pg1-x52c.google.com with SMTP id t13so16999364pgn.8
 for <linux-mtd@lists.infradead.org>; Sun, 17 Apr 2022 22:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OUwlOCtftOUELKOP6hXMp6Ir6lK17mli9+AnjwXlvNo=;
 b=jyS0q4zNwF7Wb6oVPjvRStoyV8ey7fJf/KwSAfXkbLGEQEac6Kr2XFNfhW6vngpRrG
 1Dop53QfYpQ4u4Io5xfCNJnAUBWLdR6hC7g6DmVsYIyh7UZyBfj8xh8pDR5cMc+iV5bk
 RCv6bJk8FSnKQqrOFkVnLtWDdtA0VPy1KJcMDCXoIITefgkeS+dVKL6g3THA5GyVN6DY
 jhPEa5ybL1H9dMBK6/ClC33wJm1SZQXG6GvAciV6iMg5gEHL2hTHHywmE1Z2RH3fKbfJ
 soueSjeaOEAU+yYaca7Cl6ttOJqSXDbaKP3G8CNMCZ5J4KypxVdJkmgVcOuBRH3oW7A9
 nupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OUwlOCtftOUELKOP6hXMp6Ir6lK17mli9+AnjwXlvNo=;
 b=OCfRbMaAraBQMjWqrGm5aAd2+A91PNHFFp+QDx3RH0y5KgTvFKzE5sia9OZjxpascM
 2dbZXh87E9xhPqCzKRKa8215RDR6wglCYDfIkHLKQN5Fs2QPqrdqdg3cfEDIYMxjLfPf
 PtL94CLCJ0AIW2oQZ9BQ/JwicNLUqx7i2MSDUbN9Dr5rvTl7nn6iPrsJoOt3dNhOVneR
 M2bxg2O+RbxmKe2Z3wd0KgREhuzXmpfmZk3nnjc2oiVoqlqvsxLU/MCq+JlLv81LkH0/
 lRd75IwgthcAy+AfGNI/ykKfmE0kn3FQQyDimKJPV4TQ5kujol7jKyz/J2V+jdEdZGxZ
 Eoaw==
X-Gm-Message-State: AOAM532thWqG/g4GHTSulEzr0N18CUouzc2wTJSOcSz5OStMR8jmTFDj
 +O96Ne7a5iWxL1oXVHh30VMJSX5qfSE=
X-Google-Smtp-Source: ABdhPJxMhEaORNnSsICTmQA2mBJa+Yfe+UtA5OoVVf2furz7mIJybTglIqzms1/8tYI9aS1A6w+qFQ==
X-Received: by 2002:a05:6a00:26ca:b0:50a:6ac7:5003 with SMTP id
 p10-20020a056a0026ca00b0050a6ac75003mr4947957pfw.85.1650260497518; 
 Sun, 17 Apr 2022 22:41:37 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 f12-20020a056a001acc00b004fb37ecc6b2sm10810873pfv.29.2022.04.17.22.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 22:41:37 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v11 0/3] mtd: spi-nor: Add support for Infineon s25hl-t/s25hs-t
Date: Mon, 18 Apr 2022 14:41:13 +0900
Message-Id: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_224139_175630_D7DA7C01 
X-CRM114-Status: GOOD (  13.29  )
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

The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.

The datasheets can be found in the following link.
https://www.infineon.com/dgdl/Infineon-S25HS256T_S25HS512T_S25HS01GT_S25HL256T_S25HL512T_S25HL01GT_256-Mb_(32-MB)_512-Mb_(64-MB)_1-Gb_(128-MB)_HS-T_(1.8-V)_HL-T_(3.0-V)_Semper_Flash_with_Quad_SPI-DataSheet-v02_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ee674b86ee3&da=t

Device ID and SFDP dumps:
------------------------------------------------------------
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s25hl512t
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
342a1a0f0390
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion
zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450080103ff00000114000100ff84000102500100ff81000116c801
00ff8700011c580100ffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffe720faffffffff1f48eb086b00ff
88bbfeffffffffff00ffffff48eb0c2000ff00ff12d823faff8b82e7ffe3
ec031c608a857a75f766805c8cd6ddfff938f8a1000000000000bc000000
0000f7f5ffff7b920ffe21ffffdc0000800000000000c0ffc3ebc8ffe3eb
00650090060500a10065009600650095716503d0716503d000000000b02e
000088a489aa716503967165039600000000000000000000000000000000
000000000000000000000000000000000000000000000000716505d57165
05d50000a015fc65ff0804008000fc65ff4002008000fd65ff0402008000
fe0002fff1ff0100f8ff0100f8fffb03fe0302fff8fffb03f8ff0100f1ff
0100fe0104fff1ff0000f8ff0200f8fff703f8ff0200f1ff0000ff0400ff
f8ffff03
zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
8a0aa90112e154ae3a797df2c211ef61  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
------------------------------------------------------------

------------------------------------------------------------
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s25hl01gt
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
342a1b0f0390
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion
zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450080103ff00000114000100ff84000102500100ff81000116c801
00ff8700011c580100ffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffe720faffffffff3f48eb086b00ff
88bbfeffffffffff00ffffff48eb0c2000ff00ff12d823faff8b82e7ffe6
ec031c608a857a75f766805c8cd6ddfff938f8a1000000000000bc000000
0000f7f5ffff7b920ffe21ffffdc0000800000000000c0ffc3ebc8ffe3eb
00650090060500a10065009600650095716503d0716503d000000000b02e
000088a489aa716503967165039600000000000000000000000000000000
000000000000000000000000000000000000000000000000716505d57165
05d50000a015fc65ff0804008000fc65ff4002008000fd65ff0402008000
fe0002fff1ff0100f8ff0100f8fffb07fe0302fff8fffb07f8ff0100f1ff
0100fe0104fff1ff0000f8ff0200f8fff707f8ff0200f1ff0000ff0400ff
f8ffff07
zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
1ad5a0d7d7e0e656986c1e678c416a7e  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
------------------------------------------------------------

------------------------------------------------------------
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s25hs512t
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
342b1a0f0390
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion
zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450080103ff00000114000100ff84000102500100ff81000116c801
00ff8700011c580100ffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffe720faffffffff1f48eb086b00ff
88bbfeffffffffff00ffffff48eb0c2000ff00ff12d823faff8b91e8ffe3
ec031c608a857a75f766805c84d6ddfff938f8a100000000000080000000
0000f7f5ffff7b920ffe20ffffd80000800000000000c0ffc3ebc8ffe3eb
00650090060500a10065009600650095716503d0716503d000000000b02e
000088a489aa716503967165039600000000000000000000000000000000
000000000000000000000000000000000000000000000000716505d57165
05d50000ee72fc65ff0804008000fc65ff4002008000fd65ff0402008000
fe0002fff1ff0100f8ff0100f8fffb03fe0302fff8fffb03f8ff0100f1ff
0100fe0104fff1ff0100f8ff0200f8fff703f8ff0200f1ff0100ff0400ff
f8ffff03
zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
f17d9e784602187a0933edec3688e30f  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
------------------------------------------------------------

------------------------------------------------------------
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s25hs01gt
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
342b1b0f0390
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion
zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450080103ff00000114000100ff84000102500100ff81000116c801
00ff8700011c580100ffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffe720faffffffff3f48eb086b00ff
88bbfeffffffffff00ffffff48eb0c2000ff00ff12d823faff8b82e7ffe6
ec031c608a857a75f766805c8cd6ddfff938f8a1000000000000bc000000
0000f7f5ffff7b920ffe21ffffdc0000800000000000c0ffc3ebc8ffe3eb
00650090060500a10065009600650095716503d0716503d000000000b02e
000088a489aa716503967165039600000000000000000000000000000000
000000000000000000000000000000000000000000000000716505d57165
05d50000a015fc65ff0804008000fc65ff4002008000fd65ff0402008000
fe0002fff1ff0100f8ff0100f8fffb07fe0302fff8fffb07f8ff0100f1ff
0100fe0104fff1ff0000f8ff0200f8fff707f8ff0200f1ff0000ff0400ff
f8ffff07
zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
1ad5a0d7d7e0e656986c1e678c416a7e  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
------------------------------------------------------------


---
Changes in v11:
  - Rebase on top of Tudor's series
    https://patchwork.ozlabs.org/project/linux-mtd/list/?series=294490
  - Remove 'nor->info->addr_width for SMPT parse' patch
  
Changes in v10:
  - Rebase to v5.18-rc1
  - Remove dependencies on other series
  - Use nor->info->addr_width for SMPT parse
  - Add a local function for page size discovery
  - Clean up volatile QE function
  
Changes in v9:
  - Rebase to v5.17-rc6
  - Rename function and macro per mwalle's series
  - Fix some issues in ID table and fixup hook

Changes in v8:
  - Rebase to v5.17-rc4
  - Use spi_nor_read_reg and spi_nor_write_reg()
  
Changes in v7:
  - Some changes were missing in v6 patch. Fix it

Changes in v6:
  - Remove 2Gb dual die package parts and related changes to split mulit
    die package support into another series of patches  

Changes in v5:
  - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()
  - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT

Changes in v4:
  - Reword 'legacy' to 'default'
  - Rename spi_nor_read() to spi_nor_default_ready()
  - Fix dummy cycle calculation in spansion_read_any_reg()
  - Modify comment for spansion_write_any_reg()
  - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
  - Remove USE_CLSR flags from S25HL02GT and S25HS02GT

Changes in v3:
  - Split into multiple patches
  - Remove S25HL256T and S25HS256T
  - Add S25HL02GT and S25HS02GT 
  - Add support for multi-die package parts support
  - Cleanup Read/Write Any Register implementation
  - Remove erase_map fix for top/split sector layout
  - Set ECC data unit size (16B) to writesize 

Changes in v2:
  - Remove SPI_NOR_SKIP_SFDP flag and clean up related fixups
  - Check CFR3V[4] to determine page_size instead of force 512B
  - Depend on the patchset below to support non-uniform sector layout
    https://lore.kernel.org/linux-mtd/cover.1601612872.git.Takahiro.Kuwano@infineon.com/

Takahiro Kuwano (3):
  mtd: spi-nor: spansion: Add support for volatile QE  bit
  mtd: spi-nor: spansion: Add local function to  discover page size
  mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and  fixups

 drivers/mtd/spi-nor/spansion.c | 168 ++++++++++++++++++++++++++++-----
 1 file changed, 146 insertions(+), 22 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
