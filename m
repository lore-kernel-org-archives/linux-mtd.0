Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CCCC0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 07:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oXS9YbyEWTqV+LltgaoJgLjiKr+8Rb972WJjfjNNl7M=; b=wUdn9fZr3iFU6I
	aYT/j91/dK+asUdNatl5Mka4VOU8eLpDlTKakMVJb9W8GD2O8xvdNnnwnvh/VHCaK65bal8+M1re2
	DMNv0eQlXcsc/sonujBSOw+y6oB7EB92/HzLftteY8GkICI9EoY3FJAmNOGkrc2xBBsvFWNpbKheM
	bSWtJWP+d7vT4VbVbSXlWss2OME8Ft2ZK613jLpMWPiLVTWj6I9XyB98HaLZw1jmtq00W6iGPUMeH
	dbIvR/8C4jaVBWtCowRSDZBQ04g3lfW8N3v3hU9PkgABPYSvxhV1kyhRaTMubYaIJ/8Q+dmE/YLHN
	25Dr6eNVYkjwpUsa2WPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKY-009Uwo-04;
	Wed, 26 Jul 2023 07:53:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKU-009Uv3-30
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 07:53:08 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbc12181b6so64189525e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 00:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690357983; x=1690962783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DgxURezd7xMpovKkYbI4YVARAnRubfgjmfxqjMPofjs=;
        b=mCwxsEugZ2gi+GfhkMp1Rf0WSVBgVWptoYqELSfEOpfShmJlBgIkW8HkBwj/Hf6oYL
         EUzl3zlHpnBx+hkNPFe4X2jPEhjfKBIpqMaIycAy8vIq3F66Bh0pF/RGsUuMWoe+Yj4V
         lwffuXENYQuTAssxHsKsh8q4Gd7DOowl4uT+Qb0oPj6lnz1fZR440kmWMwQVd0ARme3T
         ZjPj2ZTV7fIFogPzTxbsvK1UbFq3S3e3ZBV5kGlyBJZLGPBrpH52G8/RBh0yzjqXl2nG
         cFo8KpGIU++aA1LF57bYJ5gGYsubWuY8yAQrOx7iloC3XxA3iQjXBTiKBZ92ghdi0/Os
         jteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690357983; x=1690962783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DgxURezd7xMpovKkYbI4YVARAnRubfgjmfxqjMPofjs=;
        b=OziVazUvwtHOurqN70a5iQsM6Wbp3yFilqh33ThIRrePb0mvCpe+b+IINkAKBRWInF
         BDiTl64EegGrVV2JzJTKCKjs8Ra9J+qBbJmXibYknnqkInQaBYb0FXthgvbTlFe1Eso8
         mh+3osIoyHhazeNMNKg0XYwBzGafGO8Kqwvx7f0QZsizj5TaQw8eEBgxHkmJA5amkXFK
         9AvhKXk3rasckWWND4hw2wiSHZ5Pfdifho3PumlAnvvMUAQ4rfObdm2lJibhfEyzQ9mU
         8OK59226HKrcx5D87tascf1y/SwByF3sEoE16iWl+TjJYaKq6ZjKN9Vo5BA8+sAnB2vL
         n4nw==
X-Gm-Message-State: ABy/qLbAyoEp/Axbn3E+kfJEuMnnLYnU84OiPiD0ITuElhZEYFHrOBLu
	6FF0oSpZ3L7TzKH/A25suRW8aQ==
X-Google-Smtp-Source: APBJJlG3IXSeYkqjgloD5M6PeUC36krV2b13mFZ5oQZcQJXiXIYN9wDPBgpkZnTZqk30LWC35BHCwg==
X-Received: by 2002:a05:600c:22d0:b0:3fb:40ff:1cbc with SMTP id 16-20020a05600c22d000b003fb40ff1cbcmr735273wmg.10.1690357983296;
        Wed, 26 Jul 2023 00:53:03 -0700 (PDT)
Received: from 1.. ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id h14-20020a05600c260e00b003fbca942499sm1264346wma.14.2023.07.26.00.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 00:53:02 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	takahiro.kuwano@infineon.com,
	michael@walle.cc
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 00/11] mtd: spi-nor: spansion: Add support for Infineon S28HS02GT
Date: Wed, 26 Jul 2023 10:52:46 +0300
Message-Id: <20230726075257.12985-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3880; i=tudor.ambarus@linaro.org; h=from:subject; bh=/afqJeKLuNtYmKNVMU+5YdXP5HjD85fu5MdBIhF0KIQ=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkwNDXyjz2ZW61Y78YBxsxTSQ7jMorODT6SViTC XymyVPTeKOJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZMDQ1wAKCRBLVU9HpY0U 6az8B/9l9tM7+8Os/Fxqz+s0eKdlLTjhhVKYIuGr9JQ+UQ+lF4xQmZcW8v7FYJlV/1DncVP6sXH XKB9uAmdOqQAUkNa26kdtC02xfFeCO5CRGCRoW2yPH//vKCebNvsFRHfShD0+Aa9eOcVZCl9JtX e4n+SgvGIgdpiN3UDqXzi57gGBTj6owyTzaL/dueJH5fmn5hbhu6DEHENZz4PE6InM2K9SHrQm9 bv6V2c0m/0VwAGUnCcxxQXXV7lz4hKhkY+zgeNPAPOJL9GhioGoZ/rd3ZpHHrff4vDhID3vGXA3 WqVJMxrEtiVipDGGSIPvol0sX1oRUd0Uf4+TorjJfhvgKT2b
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_005306_976852_FA201662 
X-CRM114-Status: GOOD (  11.16  )
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

v4:
- define vreg_offset for S25FS256T in the post_sfdp hook. The goal
is to use the same code base for both single and multi chip package
flashes.
- get rid of SPINOR_REG_CYPRESS_CFR{1,3,5}V as they are no longer used

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

Tudor Ambarus (3):
  mtd: spi-nor: spansion: let SFDP determine the flash and sector size
  mtd: spi-nor: spansion: switch s25hx_t to use vreg_offset for
    quad_enable()
  mtd: spi-nor: spansion: switch cypress_nor_get_page_size() to use
    vreg_offset

 drivers/mtd/spi-nor/atmel.c     |   8 +-
 drivers/mtd/spi-nor/core.c      |  23 ++-
 drivers/mtd/spi-nor/core.h      |   4 +-
 drivers/mtd/spi-nor/issi.c      |   4 +-
 drivers/mtd/spi-nor/macronix.c  |   4 +-
 drivers/mtd/spi-nor/micron-st.c |   4 +-
 drivers/mtd/spi-nor/spansion.c  | 306 +++++++++++++++++++++-----------
 drivers/mtd/spi-nor/sst.c       |   8 +-
 drivers/mtd/spi-nor/winbond.c   |   4 +-
 drivers/mtd/spi-nor/xilinx.c    |   4 +-
 10 files changed, 245 insertions(+), 124 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
