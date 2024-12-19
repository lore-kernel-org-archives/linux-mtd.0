Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924C5E7718C
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 07:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n45cBfu0cYYZCAiUlSGEy8DLSOXoQ6dFoim1cmidmQc=; b=XTBmt8fCqI8/3t
	U5w04UWw4jS8753B3Q2aVL+ykrVIzxsT0pRMfL4nifh6joxlprPyEx4rw+1EKbNgPtFndshQHjfaH
	JDoDgm7iIZnnXvl1Tjay01rz6KuKbYd94SOqSsKvfg4kKWZL56J09mYfFkO0TJ5dmqSpSgvjFpTn5
	HrGj5f1WVcEZBAwrxvM/gCi9dWQqvOwZ+AoHX3xcupgrLGh/wPhxblV+CEwefYXmwR33dMz+TmQ4S
	bI8oQqXniM07IRS6O+VCNB01uzPlWtskf0hovq3vuQPTcCKRkNDNMsrDNqS/1CteTUNVcedXpcPts
	qBUR+QCZ+VKzErgxkb/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAdG-00000001239-48ly;
	Thu, 19 Dec 2024 07:07:38 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAcE-000000011vx-0VXw
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 07:06:35 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-728d1a2f180so362281b3a.1
        for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 23:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734591993; x=1735196793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83oeqEftNEh1KoYzP3TwHEzjcl8SJ+e8cIc3dF/Ejzw=;
        b=KGOr9HO0w01Zp55hq1thnotEszJxWcB0O3wrYtaLyQTAdeGsuNzRcpBTywq5NY7Zci
         1o5qiC+q723d1rlNaY8M0ChxyrEPpnDi1RSlzNm+3mEzIl9lD1k25znxf4pu1a7lV5Mb
         iuldFLRsjeN4r9YUWfMwBuZD24Y94R1x1ffZeZhkyMzWGLT4GcJ7FN1RZalCtnDJYXOr
         DDELfDArHe72zto8Rh1E8CrnalwdgnnpYSYb09DJV/sjEevjrbSDJwV/yeCjf1ZhV7x3
         1HGiUDiMGBdLdwSHMP0G5TIO/BdShkKUhmTjrpAe5Hz5O0qDUJ1A+askluaMgoqKfUqF
         YDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734591993; x=1735196793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83oeqEftNEh1KoYzP3TwHEzjcl8SJ+e8cIc3dF/Ejzw=;
        b=l7Oo5QCIOGO0WQjnTuoMPvqlNyQ+mXx5weKZyQzzEA+JIb33y8Jjthevw56zguAiRQ
         mpyJ6K4UxcS2UmUJovK5cC/Iq6jLmyv27LtxNPLGcTr5nUsQwcqW0uK8YiFTRJaKBiCs
         k4Z0apFn0xsQZKBCwB9vp6hAjI0nqXw9zTZl83Q0nawWXhpkDYdIS2epZEOXSaubhAJy
         VQPT8k6VUJw9hUOQFN/S701wECMWrLbfN8HU4pt0cAC1lGxg0ypXD6IP77bgc/RA//k2
         nv2Ed6nSyP+MMQ1j+NRurWVvLFgvHq9rhXGOHwpRT0SI8pKFpcXEf1zX2j2hZ5bMoyiJ
         pxLw==
X-Gm-Message-State: AOJu0YyEbkVJt9Hycfz4vBsxcow5hU3PlofwUQEXKzyERPoH7ELRWlpI
	1j2komPgI5lFnRVMbCOzSpP0kL+o8S9NsJfQw5NdVxTwA0cgDDQ5140FIg==
X-Gm-Gg: ASbGncsPS7uBGTzMVbsFQ9JSUyylwLvqJFB+k4sx9Si2EqXF/svRCIcDHKZt5+JOlAb
	KfOjJmzoGPQdPCsPHlABDRuGLIIF4DvfToa7Aqp6d9RF04JIgivyVqFmO3LqPp4J8Mu1WeMa2ii
	olsAlCs2+CAlTTqgRtj3Q7w+piDFUzz42cyInfuS3qjX2nEGlkU7u95fYJNSScjkSA8uJ754HfT
	9y7wg00mOVCkwHSoycARcrYHVQ+WbANG0wdjNvXlhyGYTMx0ygM0QpJ8fxeGha2tPKUDD3+EPr7
	elslczFuRbSV18WOnzo4E0bvcBMmo0MCGJsOkUx9hrhyQlU32w==
X-Google-Smtp-Source: AGHT+IH33Fa1lHApbMESdEVT5wvvfeKqXhqs650XBjq3qTeOv6j5cXQkSPERLQDFWv2bCwUmZ23KpA==
X-Received: by 2002:a05:6a20:7fa6:b0:1e3:c763:74d4 with SMTP id adf61e73a8af0-1e5c6d6b62dmr3354361637.0.1734591993032;
        Wed, 18 Dec 2024 23:06:33 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b2b3e80fsm445529a12.31.2024.12.18.23.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 23:06:32 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 1/2] mtd: spi-nor: spansion: Add support for S28HL256T
Date: Thu, 19 Dec 2024 16:06:15 +0900
Message-Id: <f052b04693f1100e725e076fd8a0ae339f8002c4.1734588106.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734588106.git.Takahiro.Kuwano@infineon.com>
References: <cover.1734588106.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_230634_169697_5A92A468 
X-CRM114-Status: GOOD (  13.14  )
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

Infineon S28HL256T is 3.0V, 256Mb Flash device with Octal interface.
It has the same functionalities with S28HS256T(1.8V).

Link: https://www.infineon.com/dgdl/Infineon-S28HS256T_S28HL256T_256Mb_SEMPER_Flash_Octal_interface_1_8V_3-DataSheet-v02_00-EN.pdf?fileId=8ac78c8c8fc2dd9c018fc66787aa0657
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---

Tested on Xilinx Zynq-7000 board and Infineon internal SPI controller.

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
345a19

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
fffffffffffffffffffffffffffffffff7218affffffff0f000000000000
0000eeffffffffff0000ffff00000c2100ff00ff12dc23faff8b82e7ffe1
ec2319497ab07ab0f766805c000000fff910f8a10000087c0000bc020000
0000ffff7e7e41129fff21ffffdc00ee800b7171656500b0ff96a80b0000
0c551ca20000800000000000c0ccffeb88fbffeb00650090060500a10065
009600650095716503d0716503d0a46bfb0290a579a20040288e0000ff00
0000ff0071650690716506900000000000000000716506d1716506d17165
0691716506910000ff000000ff00716505d5716505d50000a01500000601
000000000080710500004306fc65ff0804008000fc65ff4002008000fd65
ff0402008000fe0002fff1ff0100f8ff0100f8fffb01fe0102fff8fffb01
f8ff0100f1ff0100fe0204fff1ff0000f8ff0200f8fff701f8ff0200f1ff
0000ff0400fff8ffff01

zynq> sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
c6192565cabd0fdf52af924e204ed18b5bd2dc5f129a680da8cb0bda34d5464b  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 1S-1S-8S
  opcode        0x7c
  mode cycles   0
  dummy cycles  8
 8D-8D-8D
  opcode        0xee
  mode cycles   0
  dummy cycles  24

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x12
 8D-8D-8D
  opcode        0x12


zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              34 5a 19 0f 03 90
size            32.0 MiB
write size      16
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_4BAIT | HAS_16BIT_SR | IO_MODE_EN_VOLATILE | SOFT_RESET | ECC

opcodes
 read           0xee
  dummy cycles  24
 erase          0xdc
 program        0x12
 8D extension   repeat

protocols
 read           8D-8D-8D
 write          8D-8D-8D
 register       8D-8D-8D

erase commands
 21 (4.00 KiB) [2]
 dc (256 KiB) [3]
 c7 (32.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-0001ffff |     [  2 ] | no
 00020000-0003ffff |     [   3] | yes
 00040000-01ffffff |     [   3] | no


zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 33554432 (32M)
mtd.erasesize = 262144 (256K)
mtd.writesize = 16
mtd.oobsize = 0
regions = 3

region[0].offset = 0x00000000
region[0].erasesize = 4096 (4K)
region[0].numblocks = 32
region[0].regionindex = 0
region[1].offset = 0x00020000
region[1].erasesize = 131072 (128K)
region[1].numblocks = 1
region[1].regionindex = 1
region[2].offset = 0x00040000
region[2].erasesize = 262144 (256K)
region[2].numblocks = 127
region[2].regionindex = 2

zynq> ./test_spi.sh
random: crng init done
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 3.049923 seconds, 671.5KB/s

Erased 2097152 bytes from address 0x00000000 in flash
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read

Copied 2097152 bytes from spi_test to address 0x00000000 in flash
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
d97ac743a6fa312253c374d13a6b61f8f6a11c6cb34f37e7449de93f404383bb  spi_read
d97ac743a6fa312253c374d13a6b61f8f6a11c6cb34f37e7449de93f404383bb  spi_test

Erased 2097152 bytes from address 0x00000000 in flash
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
d97ac743a6fa312253c374d13a6b61f8f6a11c6cb34f37e7449de93f404383bb  spi_test


 drivers/mtd/spi-nor/spansion.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 5a88a6096ca8..f8d8a908c92e 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -957,6 +957,10 @@ static const struct flash_info spansion_nor_parts[] = {
 		.name = "s25hs02gt",
 		.mfr_flags = USE_CLPEF,
 		.fixups = &s25hx_t_fixups
+	}, {
+		.id = SNOR_ID(0x34, 0x5a, 0x19),
+		.mfr_flags = USE_CLPEF,
+		.fixups = &s28hx_t_fixups,
 	}, {
 		.id = SNOR_ID(0x34, 0x5a, 0x1a),
 		.name = "s28hl512t",
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
