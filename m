Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647E3C43217
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 06:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8HXkYdKsyOBfRpLxCCNCLMjvvdZu9bthysS8vNt5Dzc=; b=FExTyUOwCduLGH
	XcLwC8fOQOF6g4y3op4tpHK5xEvpZgeZlFOGN7YZO8EJk89MUjV/E7kIuLoAx6BvzOHWoqfYN1Ra7
	xxsFo7LgiuynYzILrBb36Wfa9/NQDF/Kce4i75yH/Y34f+HoNLXTaNoNeBIvXEPe5WSB8vK/z+Zm9
	oUgvwbYcUn9b561/VKbAj9X1zHW+WsWwvuoEXX8h9aaIzBR7dA0+zmbrpTuS7wm4ON2zHPK/BzT8S
	oxqOV9p9ef2YgyakFgnWAs+qhd4kKAgxb3Bu7O91zvoeYbp4I9gieBZKAdRJcIQQRE9I1ipNG97OI
	dK2quIxlRNZ+j5c58CfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhQVR-00BmrZ-KA; Thu, 21 Apr 2022 06:41:33 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhQVL-00BmoU-DW
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 06:41:29 +0000
Received: by mail-pl1-x629.google.com with SMTP id s17so3941534plg.9
 for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2022 23:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IXkTiHxiHOafXmNSsFOBaOqnW1RUUVR5+J7z9ZYzKH8=;
 b=mlf9amW48zNAp7D6rIvKZlzoCXOkZ9EkypHZNPDHsDtRIZ78daRywuDdQdW5coaLKb
 W+lsyVfNSj8GNhFcSe/JY0YVBLbldLZ2FTmb3GzN5ei7ki8KDARebmCiBl/HzvJQ8Hkc
 DLqZqV4dBbNZl+dfc+zoKwSUNlsejuE+nltmfdSaEVqKLnnXF6wq6Hm3m+MOE2YeSVPv
 NmdtNzlI8v2AHSSBNggdkDLb2cQsBwWxoG0zAMY6/49MXAWTKJf+6Pd/VY0+K3VzflQs
 rcNi9PJQ5es08hWOP/rBESUcGGbcUKiAvl1XU7db+ovs/w+6s+ua4ge2LefebTriDQAe
 5KmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IXkTiHxiHOafXmNSsFOBaOqnW1RUUVR5+J7z9ZYzKH8=;
 b=FJsMCWzBjWCbfz6J5i1bEXjXWoUgTGb/EJYupDnCjOCTsumKxCnFYymKQtJPuRpBBI
 0amNuKpJHS2KSQOH15PVPB+fgr5EvA7/lf00D4VrpE0QhjkIHui1wWOnRSs5ktps3pUN
 L77FPiz5QOTk2RtOr7/2z6UqHUDeZR/wNJyclaEsfIQ9ExMnYKrrry7qsqfCSiNgNyMZ
 JbJog2IpIBOtq08f2oCMGkXzzOSzWEgtk4Rua3TsQKw9V3qhRCr6sgHdANxSZdlfWiNj
 xVpYZAEEepd+YqryILt1v37jfWBPp2oxGbuf64BYjTX6ipHwMK87tvBXOJVGNgCm8I14
 WuKA==
X-Gm-Message-State: AOAM530/35QicWdA6O2LXl3BjQdphaQhVw0K3dc8gJFGePuJUhytKl7I
 I3NKT4/RS5ESqPTjiwjDr6eNl+laPd8=
X-Google-Smtp-Source: ABdhPJxUnyzKmRbRIu9wHhggR9WpiGsVE6wCIWExGUroaqzDUvNKQ5jmV6I13Rvu5XmpmIxfF3S4Gw==
X-Received: by 2002:a17:90b:3e84:b0:1d2:c015:2182 with SMTP id
 rj4-20020a17090b3e8400b001d2c0152182mr8756203pjb.232.1650523284036; 
 Wed, 20 Apr 2022 23:41:24 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 x184-20020a6286c1000000b0050ad3051f53sm2075037pfd.147.2022.04.20.23.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 23:41:23 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v12 0/6] mtd: spi-nor: Add support for Infineon s25hl-t/s25hs-t
Date: Thu, 21 Apr 2022 15:40:50 +0900
Message-Id: <cover.1650519576.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_234127_536543_9357437B 
X-CRM114-Status: GOOD (  15.17  )
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

Device ID, SFDP, and test script output:
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
zynq> test_qspi.sh
6+0 records in
6+0 records out
6291456 bytes (6.0MB) copied, 0.223713 seconds, 26.8MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
2db89a163be5c065f0e9cfb215b3ee5897746cf1  qspi_test
2db89a163be5c065f0e9cfb215b3ee5897746cf1  qspi_read
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
zynq> test_qspi.sh
6+0 records in
6+0 records out
6291456 bytes (6.0MB) copied, 0.222716 seconds, 26.9MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
b0305b8bc72dbf86d26569d8609975a090ecd3d4  qspi_test
b0305b8bc72dbf86d26569d8609975a090ecd3d4  qspi_read
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
zynq> test_qspi.sh
6+0 records in
6+0 records out
6291456 bytes (6.0MB) copied, 0.223581 seconds, 26.8MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
a24351bb22e998ba88206acc4dd6a631848ad83c  qspi_test
a24351bb22e998ba88206acc4dd6a631848ad83c  qspi_read
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
zynq> test_qspi.sh
6+0 records in
6+0 records out
6291456 bytes (6.0MB) copied, 0.223877 seconds, 26.8MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
193dd2f50b5655b8656c6236d640147b2fea1be9  qspi_test
193dd2f50b5655b8656c6236d640147b2fea1be9  qspi_read
------------------------------------------------------------

---
Changes in v12:
  - Rebase on top of Tudor's series
    https://patchwork.ozlabs.org/project/linux-mtd/list/?series=295933
    https://patchwork.ozlabs.org/project/linux-mtd/list/?series=294533
  - New patch: Retain nor->addr_width at 4BAIT parse
  - New patch: Call set_4byte_addr_mode() before spi_nor_quad_enalbe()
  - New patch: Rename local macro
  
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

Takahiro Kuwano (6):
  mtd: spi-nor: Retain nor->addr_width at 4BAIT parse
  mtd: spi-nor: core: Call set_4byte_addr_mode() before
    spi_nor_quad_enalbe()
  mtd: spi-nor: spansion: Rename local macros
  mtd: spi-nor: spansion: Add support for volatile QE bit
  mtd: spi-nor: spansion: Add local function to discover page size
  mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and fixups

 drivers/mtd/spi-nor/core.c     |  37 +++--
 drivers/mtd/spi-nor/sfdp.c     |   1 -
 drivers/mtd/spi-nor/spansion.c | 258 +++++++++++++++++++++++++--------
 3 files changed, 219 insertions(+), 77 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
