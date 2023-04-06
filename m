Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4612EC76196
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 06:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xClLN/yOLeI6QB/rLjlURIOSqlFpDnNgjhwjHSp53aM=; b=Di94qOLFwh9vkz
	6Tb9s2r2OVB36F/PUYyy14WyNF0GyfPDys6+hJIf82aen5HF1Au+UJ9mPipPDKqj91cixrrXQ/hBf
	vILMEABm3wmy8nb37OreyVqsFlmb0q7Ueu4pvbVhGPYl9tl58k5jxmepV91rJQirz02Jg55GMvaAL
	or02WjAP8NWHpzuXFtYxTNSYpMU7y3zYp7U9pLYL+EJl9MwimxtYFtO6xe/a/mMNJgvM5lnkXDXV2
	W80xfALBdr7KtqSU8y+/O8mDpJvQwCDBuQw4MxQlZnbqnk0/OQUqEDoyGDhJQV80x4WN9az8UQ6vO
	FiLkxtsZ3aEG+EqO59zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIxv-006T0W-2R;
	Thu, 06 Apr 2023 06:19:23 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIxs-006Sx9-1O
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 06:19:22 +0000
Received: by mail-pj1-x1036.google.com with SMTP id lr16-20020a17090b4b9000b0023f187954acso39688005pjb.2
        for <linux-mtd@lists.infradead.org>; Wed, 05 Apr 2023 23:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680761956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dvQs+iIViijn2fy9TPl8VTOZNzyWkVna8pi38q3iIH4=;
        b=gmbYqZG4OpNKHNVNZ2eclCRTtTrqLpErah0UXRPiIHQ/f9p7CPN9KhG0hwKIXcjLbx
         tvWKCJob9h/Eb4rbfy+wHFBnOtOLCriYIkIZKs7SFXEb/+u9CNeLaQraY+6Z6dgUCThh
         9JBqa1Id5Mb4OxEeSX1/zj2ULbTX/C6PvgoBRT3t9Y8rfGl3Evt9hPQRrnZCDaAx8rBX
         63COddOVaahr5SW0aYROz3yVIaAyXeNJeASheRZqdjSTTCE5/uW+9cwfqp9VoihQvxe3
         2Sqe/VXFbRIFHcIawbL1vEJvZPMO/eHkQYhHK213uIV5quv9uealdq8GA+8dFj93VzXf
         M/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680761956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvQs+iIViijn2fy9TPl8VTOZNzyWkVna8pi38q3iIH4=;
        b=49KQQc6VnpVYuisQa346fAr56fKcbWe8q/bOSvOh1va+bnvfZaAY6GD8Kg/hQW8qp2
         zaUQQvY7plAD9lIYtr/0ZmbasRAshOnq5b0mi5EgJh8q6rE+fc7LvqS8RvCBroZndwLL
         FnA4S8QNO89XX3bPtsYBT+dw/9gXtEz2yhKlDUa+pGlRWuW+SiXFU4HhIqNwPvMPlA3b
         De/LBifR4ynnjwEUTH+dRMBoA/qQc8AbkIbNjXSt0iM+y1YSpCAFcagTuDqg15qEJ+vj
         +GyY07iZLrKvYy9Hf+YH4OHh3f3JcOvTnM5gpjTUfGgFRCaw1cPUP2HQ7cXi0GJZVmoV
         FSLw==
X-Gm-Message-State: AAQBX9fX04CfxQveeatJQ3X9vx4B69ZBxHPMhNX8JX/RiWu3gJIy2i9x
	Bz8tObFP//9GJvxzNBJJQ+G7UVHE6le0kQ==
X-Google-Smtp-Source: AKy350Zni/x2dZkvGB2P5gveRERAkgfMi+yw5ROukUxQ/Kx5TEd1FQTrLOwbxgEX7UHHsiZTiQfIaw==
X-Received: by 2002:a05:6a20:47c8:b0:e1:3bde:3a98 with SMTP id ey8-20020a056a2047c800b000e13bde3a98mr2052686pzb.52.1680761955727;
        Wed, 05 Apr 2023 23:19:15 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-38-119.msd.spmode.ne.jp. [49.98.38.119])
        by smtp.gmail.com with ESMTPSA id 18-20020aa79152000000b0062dbafd2980sm450542pfi.65.2023.04.05.23.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 23:19:15 -0700 (PDT)
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
Subject: [PATCH v3 0/8] mtd: spi-nor: Add support for Infineon SEMPER s25hl02gt and s25hs02gt
Date: Thu,  6 Apr 2023 15:18:51 +0900
Message-Id: <cover.1680749577.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_231920_482752_4C1A1F79 
X-CRM114-Status: GOOD (  16.16  )
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

Changes in v3
  - include Tudor's prerequisite patches: "mtd: spi-nor: spansion: Rename
    method to cypress_nor_get_page_size" "mtd: spi-nor: Allow post_sfdp hook
	to return errors"
  - s/num_of_dice/n_dice
  - fix typos in "mtd: spi-nor: core: Introduce number of dice and volatile
    register offset params"
  - use SFDP_DWORD() for SFDP indexes
  - limit the number of dices to 256 as a higher number of dices is improbable,
    thus we assume the table value is wrong
  - reworked common methods for multi-chip devices and single chip devices.
     When SCCR or SCCR_MC are fined use the value of the Volatile Register
	 offsets defined in the tables, otherwise use the statically defined ones
	 from the driver.

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

Takahiro Kuwano (6):
  mtd: spi-nor: Extract volatile register offset from SCCR map
  mtd: spi-nor: sfdp: Add support for SCCR map for multi-chip device
  mtd: spi-nor: spansion: Rework cypress_nor_set_page_size() for
    multi-chip device support
  mtd: spi-nor: spansion: Rework cypress_nor_quad_enable_volatile() for
    multi-chip device support
  mtd: spi-nor: spansion: Add a new ->ready() hook for multi-chip device
  mtd: spi-nor: spansion: Add support for Infineon

Tudor Ambarus (2):
  mtd: spi-nor: spansion: Rename method to cypress_nor_get_page_size
  mtd: spi-nor: Allow post_sfdp hook to return errors

 drivers/mtd/spi-nor/core.h      |   6 +-
 drivers/mtd/spi-nor/micron-st.c |   4 +-
 drivers/mtd/spi-nor/sfdp.c      | 103 +++++++++++-
 drivers/mtd/spi-nor/spansion.c  | 281 ++++++++++++++++++++++++--------
 4 files changed, 319 insertions(+), 75 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
