Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3492BE77184
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 07:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=THqoLXWyYC274PDJLYPoQOsvYc62mi+m/pG9CXcEq8s=; b=BJKWJe2O3lNJgD
	ZHg2vp7dRiUMfP0VYzAdUOAiuqFUBHstJTBpMay0JUi5OxODd2OnguR1oHG+QapzaVGQF1vCef70g
	r4HB5KMUr+q2O34AIjA4wjCNtc8lDtQkg05QkMC/VfQhn9noGjbPO/sSOt4rKbQcJbT890vu1CwKv
	ibzAU2uuU3Fj1FD+IXJB5qoAYag7jstGG1nWy2Lit6NRUxfrjsKEIusfu42wPWvWPZT+cQZ47ZOw2
	1wYLL00Vz2QbauoYN6QkD/D1K6c8gcRDiSWdGHEwFmg97Pxvbi/YqVmTK4JfOlE6uiJaA12DMph25
	SAP9jbt0Ju3zFXyFxxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAdH-0000000123L-1zvC;
	Thu, 19 Dec 2024 07:07:39 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAcH-000000011wr-1IkH
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 07:06:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2164b1f05caso3993855ad.3
        for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 23:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734591997; x=1735196797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxGsiLCCpd9bvODv604VcdgsxqZlH3l340DprpOdrZI=;
        b=eNDQpwt03cSdCxt9n2rv+oDQEUs9ShHac2Cty3oWOUe2NVMvfPblgbY9NMfY6vSYW9
         0/tNu/Qs1UBZWoQFUbAhoykTj/n+13c50rDq13yb6S/nZSq3FZpjuv1ACVg6ZeO7z0Gg
         x/Mh9AOixYDI9bbYPn6mB3H7U2qJuexK466r40aQhw4JBa+KbwviBey0VV8ybpyzjg5z
         rPkYfc0cjDcfIZVpGhQbQmsIgMSHyntZp30ybWccmkmiTVHCR1Pc2yPX5qwz+hyNkO5C
         BSxcYLLBhCthIYTcvA9bCUiVgWAhYd5MNLOtA70F6N3dTA+7op24chjfuI3aMfa8GSxV
         ZKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734591997; x=1735196797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxGsiLCCpd9bvODv604VcdgsxqZlH3l340DprpOdrZI=;
        b=VZGTDyiSXdw+mP16XpsAiLCaXXgwOMYLlCNdFfwTwenQVwSwEP+nVR6KSzjh/37D3D
         a9rrK18bK6rs30vKJmSkK3Fi9O9MFYL8SnbQCFZJiMTAkBinsCfMYb/Ax2pXECDukNXJ
         J6ttu0vvG2V+EJcBPTDpEBC3m/1AtSUyJn0rvju35gdgsEn4emNykwFCsfUTyiCDxmdO
         4fc/yAYySc3TCdfrnTswCltISbbGRycxa03Bz08v6gRkaTQtyCJldVlDXBA5kMEFMaJ3
         i3M0EFwiOZUpdH8SZWm/cHI3JD91xhZCqRqtlKuD2Aan/Lzm+IFDCWdpP7VDyf/e4FjS
         Ga5g==
X-Gm-Message-State: AOJu0Yx1CJMC2yMIemeYFbZmmAwvkGxXFwRVtVadNOt2pz8UAtwVHSTO
	RQ2kbb9azGrvwcLxxThdDU0OIBW8pa2xHM609Px3nSgQrLcCIJOikzE6oA==
X-Gm-Gg: ASbGncvKVXVAN18TrddZw9yoOnkPp2MkCZT+Ebr6x7zp2ivTJ71BeMe87hFZH1Md+4n
	G3nAMECSKoNf4DcW5C3AVO795t42IUPU/nqP0uHrxmmzGQX0xtjiWmaZJQQYmaqzzsQt+yjXX82
	6g7ARnNNXf+je6d8p8pcX4WQdBg7xxMdLy6mhMdJXUaJMSSQEbH0fxr8TG+EoI3ZfxLlsL2W49r
	d5BiDjiR2jvx8WwN8dUPdNyUd4mZ4zfTmppKC/Qyr0uTJssUQ+HaBv+PfW5n8s5D2C70jxPpN/u
	m+MVVBIWtE2CXZipLCjlwpa9dlgOmbQ2oHUNtDLcB9w6rLddvg==
X-Google-Smtp-Source: AGHT+IHh6ZiEHdF34dEl1128A5SH02Kv5nWxm4gJk2be8lDxGgRYxg9T5LR8TnSuOT4kQgnJjjVdkg==
X-Received: by 2002:a17:902:c40d:b0:216:2bd7:1c27 with SMTP id d9443c01a7336-218d7216a54mr91414855ad.33.1734591996689;
        Wed, 18 Dec 2024 23:06:36 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b2b3e80fsm445529a12.31.2024.12.18.23.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 23:06:36 -0800 (PST)
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
Subject: [PATCH 2/2] mtd: spi-nor: spansion: Add support for S28HL02GT
Date: Thu, 19 Dec 2024 16:06:16 +0900
Message-Id: <dc6aa706253a5200ff0c0d4523c2540312575c01.1734588106.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734588106.git.Takahiro.Kuwano@infineon.com>
References: <cover.1734588106.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_230637_351758_22AF133E 
X-CRM114-Status: GOOD (  12.96  )
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

Infineon S28HL02GT is 3.0V, 2Gb Flash device with Octal interface.
It has the same functionalities with S28HS02GT.

Link: https://www.infineon.com/dgdl/Infineon-S28HS02GT_S28HS04GT_S28HL02GT_S28HL04GT_2Gb_4Gb_SEMPER_Flash_Octal_interface_1.8V_3.0V-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c7e7124d1017f0631e33714d9
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---

Tested on Xilinx Zynq-7000 board and Infineon internal SPI controller.

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
345a1c

zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion

zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450080106fe00000114000100ff84000102500100ff050001055801
00ff8700011c6c0100ff88000102dc0100ff81000118040200ff0a000104
f40100ffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffffffffff7218affffffff7f000000000000
0000eeffffffffff0000ffff00000c2100ff00ff12dc23faff8b82e7ffec
ec2319497ab07ab0f766805c000000fff910c0a1000000000000bc020000
0000ffff6e6e41120ffe21ffffdc00ee800b7171656500b0ff9600000000
0c551ca20000800000000000c0ccfffb88fbfffb00650090066500b10065
009600650095716503d0716503d0a46bfb0290a579a20040288e0000ff00
0000ff0071650690716506900000000000000000716506d1716506d17165
0691716506910000ff000000ff00716505d5716505d50000a01500008008
000000080000801000000010000080180000001800000601000000008000
710600030600fc65ff0804008000fc65ff0402008000fc65ff0804008008
fd65ff0402008008fe0202fff1ff0100f8ff0100f8fffb0ffe0902fff8ff
fb0ff8ff0100f1ff0100fe0104fff1ff0100f8ff0100f8fff70ff8ff0100
f1ff0100ff0a00fff8ffff0f

zynq> sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
505d69bc6aa512d9ac9594df95c189f0f3b2564e74be9be11b45d6923416903a  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 8D-8D-8D
  opcode        0xee
  mode cycles   0
  dummy cycles  20

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x12
 8D-8D-8D
  opcode        0x12
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              34 5a 1c 0f 00 90
size            256 MiB
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
 dc (256 KiB) [3]
 c7 (256 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-0fffffff |     [   3] | no

zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 268435456 (256M)
mtd.erasesize = 262144 (256K)
mtd.writesize = 16
mtd.oobsize = 0
regions = 0


zynq> ./test_spi.sh
random: crng init done
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 2.324596 seconds, 881.0KB/s

Erased 2097152 bytes from address 0x00000000 in flash
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read

Copied 2097152 bytes from spi_test to address 0x00000000 in flash
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
dca531fddad35d06dd7a667fb7adf847728b4b1cd0a7e4dd189e6c7c09782e51  spi_read
dca531fddad35d06dd7a667fb7adf847728b4b1cd0a7e4dd189e6c7c09782e51  spi_test

Erased 2097152 bytes from address 0x00000000 in flash
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
dca531fddad35d06dd7a667fb7adf847728b4b1cd0a7e4dd189e6c7c09782e51  spi_test


 drivers/mtd/spi-nor/spansion.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index f8d8a908c92e..bc6cba906370 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -971,6 +971,10 @@ static const struct flash_info spansion_nor_parts[] = {
 		.name = "s28hl01gt",
 		.mfr_flags = USE_CLPEF,
 		.fixups = &s28hx_t_fixups,
+	}, {
+		.id = SNOR_ID(0x34, 0x5a, 0x1c),
+		.mfr_flags = USE_CLPEF,
+		.fixups = &s28hx_t_fixups,
 	}, {
 		.id = SNOR_ID(0x34, 0x5b, 0x19),
 		.mfr_flags = USE_CLPEF,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
