Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564F3C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 09:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kXNAkuCC3mZ2zrr4H/u8QmclGRD1vRe94lzf/mZt5SQ=; b=wWd6eT1jIQNkxI
	I/PXsno6B9xPOQu2XuJwrnzyjNAiQrIPsvgazww/sKYANrVHvQmVoNzyFxnIYWhxD9Nzjxt6zphgV
	sel8NKETFdlSd/R30bVP028FZkfREhEbFOYdx6HU+BDWTH0dfyV9vF/4m2zPf+Z//QQqfjfwMX9SC
	4X3VfQ/PfV97AlAjo2Xj8j177jd9MfsNpfERA79cg5A3ALcKqT5v2ZNmL2SmyMsoPuHTVBsbqc69m
	1AUaP5yROrpCMbFd/JmfrIW6nScNedkCSaHsIS6Dw0UBf7DsgAnRK7tzhs6GkLol61/BC92Am5/ts
	uX8BgWxDnVPmg7g8CHaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzE4R-000VZZ-F8; Thu, 09 Jun 2022 09:03:16 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzE11-000Tmt-D4
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 08:59:48 +0000
Received: by mail-pg1-x52b.google.com with SMTP id y187so21284800pgd.3
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2022 01:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N3xXFOz1ahH26aWAh7dx496kkM8FljSDIL9zei2dr5A=;
        b=SdJru8cSJEN20uLtxJrWHj4AwK3mrGtVZ3y64FnBRcPucbmeNtrLCchk4dyYR5Nyr6
         KRIBz6dWinFuMbTaDwvfMS5JoEOSsv5cDKDGAnlPPvoojI+j0cZyeV5ea3GoULRl6CFZ
         a7ECKUlS6BOShYosPT68rMQNBeukT/naEcETMJ3I9Ov2Hg+zH/c2wW8i64qgRAGb687e
         S+UzbqgZdgjAs/MQCs6NWGFtoxHcNL4oWq5IAb0nCCaC6L3/P7Q6MOaEikt7DoNut4sy
         kkUuEYtED75yUWkjZgidT/U/+l9NBiImPJRqWDx8kNGXTzy/GEkYWXfbfvkwlzlgLHHx
         ub/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N3xXFOz1ahH26aWAh7dx496kkM8FljSDIL9zei2dr5A=;
        b=x+lo4lB7KoQ+5jygCQfvWlVsC+Zjfx+YnLjLwBt/fWbgYB6I4dWKRZbNvdAHVqMhUO
         8n1PqU92ycevg/jCso8OgFJfWbV5xUlKTvy08v/wLoXXAXmwySBQJ903G0V6lO26PS6X
         k8kAIaS0mMX87gPNEUwbtRqYAUE9ZqKr9zy4sWDqBlAmUymsfLQTWZ5zwXdrrFH/MAAu
         ZdVe/YTB6ulRnW0JDPIJtMa3IbsBMCtr9edrZptjBCLe4k3sXNDkEocES+72Lz7TDSAa
         fHqgE+1U6CGNOfR0ZRxqdSdHCYmpMv3L2oLIkBCySNcfPrjxHtAeC+OE16n4uuEsY/ut
         qbNg==
X-Gm-Message-State: AOAM532GAexgia26BA87pbGyd0oP2+O7EQTB20LKD5djPlw8FThPU+Bh
	0I+AtS/tgVLNxMwH5Uf2Eflr0t8B9v4=
X-Google-Smtp-Source: ABdhPJy/Jc1myCZeTS9BlrDTVH/xT940Ms9ltBWQGoV9ogVD8t6LvI6pNC8/FmGjLi29QykRrjav4w==
X-Received: by 2002:a65:6044:0:b0:3fc:674:8f5a with SMTP id a4-20020a656044000000b003fc06748f5amr33876035pgp.436.1654765180986;
        Thu, 09 Jun 2022 01:59:40 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
        by smtp.gmail.com with ESMTPSA id ja13-20020a170902efcd00b00168adae4eb2sm575997plb.262.2022.06.09.01.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 01:59:40 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	p.yadav@ti.com,
	michael@walle.cc,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v16 0/8] mtd: spi-nor: Add support for Infineon s25hl-t/s25hs-t
Date: Thu,  9 Jun 2022 17:57:37 +0900
Message-Id: <cover.1654741888.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_015943_531023_D83C71BE 
X-CRM114-Status: GOOD (  15.15  )
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
6291456 bytes (6.0MB) copied, 0.230748 seconds, 26.0MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
8fd5e1d95c3a5b8d7d66ade561f51fe5257897ff  qspi_test
8fd5e1d95c3a5b8d7d66ade561f51fe5257897ff  qspi_read
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
6291456 bytes (6.0MB) copied, 0.230827 seconds, 26.0MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
3c4cc1be627a88da0364b2a866fbb6ac04dba80e  qspi_test
3c4cc1be627a88da0364b2a866fbb6ac04dba80e  qspi_read
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
6291456 bytes (6.0MB) copied, 0.230878 seconds, 26.0MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
50b8cc948f8b05fa5650a6d0ba74be8f95ff3332  qspi_test
50b8cc948f8b05fa5650a6d0ba74be8f95ff3332  qspi_read
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
6291456 bytes (6.0MB) copied, 0.230712 seconds, 26.0MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
e9515a880d836d9fdfa8b2b7c870825fd8300cc1  qspi_test
e9515a880d836d9fdfa8b2b7c870825fd8300cc1  qspi_read
------------------------------------------------------------

Changes in v16:
  - stop restoring read_opcode, read_dummy and addr_nbytes to uninitialized
    state at SFDP parsing time

Changes in v15:
  - add missing read any reg call in volatile quad enable method (patch 8/8)

Changes in v14:
  - add prerequisite patches for s25hl-t/s25hs-t addition.
  - squash volatile quad enable method to the patch that adds the flashes
    to avoid unused function warning.

Changes in v13:
  - Remove patch, Call set_4byte_addr_mode() before spi_nor_quad_enalbe()
  - Remove patch, Rename local macro
  - Use 3-byte address width in cypress_nor_quad_enable_volatile()
  - Add post_sfdp to fix 3 byte erase opcode in 4BAIT

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
    https://lore.kernel.org/linux-mtd/cover.1601612872.git.Takahiro.Kuwano@infineon.com/*** BLURB HERE ***


Takahiro Kuwano (7):
  mtd: spi-nor: s/addr_width/addr_nbytes
  mtd: spi-nor: Do not change nor->addr_nbytes at SFDP  parsing time
  mtd: spi-nor: core: Return error code from set_4byte_addr_mode()
  mtd: spi-nor: core: Couple the number of address  bytes with the
    address mode
  mtd: spi-nor: Do not change nor->params->addr_nbytes at 4BAIT parsing
    time
  mtd: spi-nor: spansion: Add local function to discover page size
  mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and fixups

Tudor Ambarus (1):
  mtd: spi-nor: core: Shrink the storage size of the flash_info's
    addr_nbytes

 drivers/mtd/spi-nor/controllers/hisi-sfc.c  |   2 +-
 drivers/mtd/spi-nor/controllers/nxp-spifi.c |   8 +-
 drivers/mtd/spi-nor/core.c                  | 155 +++++++++--------
 drivers/mtd/spi-nor/core.h                  |  14 +-
 drivers/mtd/spi-nor/issi.c                  |   2 +-
 drivers/mtd/spi-nor/otp.c                   |  12 +-
 drivers/mtd/spi-nor/sfdp.c                  |  31 ++--
 drivers/mtd/spi-nor/spansion.c              | 183 +++++++++++++++++---
 drivers/mtd/spi-nor/xilinx.c                |   2 +-
 include/linux/mtd/spi-nor.h                 |   4 +-
 10 files changed, 280 insertions(+), 133 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
