Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A31C48296
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 09:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4kvTNYOxaV7O0l3YRFXMryMuv3UrFoTOHBg9XHkCrY=; b=i7Xmq08THkFqRK
	/2/wU76Y320UcOO7ZPLisEuetL8TguFWnFVPsbEdVIsQm053gY+AnKJwFAcGMi9HG67X3q7cEg+Mu
	iTazREcV4e6PEDqwize5jYLnbpxOHt7fcG7HZcQv30Qei5KU6D9wXACPRka/1f/3+VYbn5LkwK/tY
	zXVMyL7PajMAYHTfFxTGEVXy61NaXcFSi8L67/VkxYXus5JLUP3yygS5AtD0jxpN0zIwGak7dclKg
	VxBgxXJtd49+FKwsqXiwe7Xks3yoEJL2G1HvedttPIDHIxN3U5FuU0sYmFDSat/QTN+PGTkWRMgLW
	f1ejciNiqVrfmD12n4kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTcF-00000007KBD-124u;
	Thu, 01 Feb 2024 09:44:15 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTc7-00000007K5R-1ROB
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 09:44:09 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3bda741ad7dso650918b6e.1
        for <linux-mtd@lists.infradead.org>; Thu, 01 Feb 2024 01:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706780645; x=1707385445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Inuyq/YshgmmcSw7cLKnBgk/toIut3pXwiVeDRBPMgc=;
        b=hFk4fdZqQ+ZIKm4fyDfMEsftDr++PMopaEV0degwxQ5JObfgk/rrVNVrzacxB6k8Xs
         lFRL3Fg3eqShZ5tlQnu/KyOIc4oegBxyImYZzDsE6m1CVzf2vbkGpoQpjfJ4S6dK+gtN
         wvTLgslMWu1cH1TLDgPSLXIGdimCaYSxScMz7+llXgQWEUuyZZ27gcfDAN55WEficPk0
         vzXuug7mZPgNvDreD07tvEjM/6AdscnncVejjtzHUegG1KF63vz4YfdkdHrnkE2XchNz
         JBzL+vDLDYZjkFwRuJcGYL7HsiMFjKqzHDI/jB1ukKHRwTC+ut1bwB9yz3PJyYpQaSuq
         /THA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706780645; x=1707385445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Inuyq/YshgmmcSw7cLKnBgk/toIut3pXwiVeDRBPMgc=;
        b=sfRNwj9v/w8OnkmOmcZh8KiznIX5bQ/qIRoe3iLTy7taUEg861BDCIV4/2PttEajMu
         b9zmMTLtQ1AbJGz0Qt5ob5EzfLVuWh9PGUVKakOd40SfEpyIDymLaQA2GguZbvWb//lM
         /B8QlNcnu/W74UMpB4AR0L1XQT5cv30FjkT+ZpwIL6FkVGAFzKJXAKUKsBb4WF1kVdnX
         8URRImYqoTX0ryFaxig3gSlG1+f0vwdaoGYZg9WvyvOk5jewJd8xf454nPzvRkL01Yun
         mdZQ1HfKay1IrdffGGUoYV7CPk63fPa0F2iDHTuYA5hdyXTgeL4/iwCy1I3RnweKM+wE
         oa1A==
X-Gm-Message-State: AOJu0YyS9GcE76lHxLf5La/qkJASrEyBQOiqE0tUq9OFWjxYqE52cWZv
	LUBMlFEkCw5L12Y7EqlipZHq6ix1fuGaCU3+3hqPcSbkBpnf+9B2
X-Google-Smtp-Source: AGHT+IHbPMRUzo+RR2WnBOsRxhWbETBryz+gVEyijJTbd6h0qSOrDVlHcB3otM2QWdYat9sNyH3yiw==
X-Received: by 2002:a05:6808:4498:b0:3be:c44b:f129 with SMTP id eq24-20020a056808449800b003bec44bf129mr4779516oib.11.1706780645198;
        Thu, 01 Feb 2024 01:44:05 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXyWfq0vLbuxQcCyjJAORQWkpBN0wFsl+PWALSQPGRBuGiam+UkGDXk71tbAEPKJ8zgBkqBRsVSAATcCmDqv911tYZvKI1heL5+S2wU8pqFBRTxUT/iVbVXH4Mm2JGZ1Gy4O+zS6uTXT15BR99Er2OPsQNrPW/oSboJzAn2LlKKoCupMo+8p1/QHr0ZZ2sxoQNXmhoiwgeagB/wh+EQZTDnCh/cltP3fdjYbQeGymqzLBg7tCBevNzcBWifuqJcpu64mv/UpNiwODXBQCc42JMWio6SopkSTD09E6t1I0JModSFS1N31tnLJCLgK4rD4dFwYg==
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id s14-20020a62e70e000000b006ddbeca54e0sm11307606pfh.87.2024.02.01.01.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 01:44:04 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id A46B780DCE;
	Thu,  1 Feb 2024 17:50:04 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	broonie@kernel.org
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v8 9/9] mtd: spi-nor: add support for Macronix Octal flash MX66 series
Date: Thu,  1 Feb 2024 17:43:53 +0800
Message-Id: <20240201094353.33281-10-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
References: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_014407_501533_C0CDAD19 
X-CRM114-Status: GOOD (  12.83  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

Adding Macronix Octal flash for Octal DTR support.
Adding Manufacture ID 0xC2 in last of ID table because of
Octal Flash need manufacturer fixup for enabling/disabling
Octal DTR mode.

The octaflash series can be divided into the following types:

MX66 series : Serial NOR Flash with stacked die.(Size larger than 1Gb)
LM/UM series : Up to 250MHz clock frequency with both DTR/STR operation.
LW/UW series : Support simultaneous Read-while-Write operation in multiple
               bank architecture. Read-while-write feature which means read
               data one bank while another bank is programing or erasing.

MX66LW : 3.0V Octal I/O with Read-while-Write and stack die
MX66UW : 1.8V Octal I/O with Read-while-Write and stack die

MX66LM : 3.0V Octal I/O with stacked die
Link: https://www.mxic.com.tw/Lists/Datasheet/Attachments/8748/MX66LM1G45G,%203V,%201Gb,%20v1.1.pdf

MX66UM : 1.8V Octal I/O with stacked die
Link: https://www.mxic.com.tw/Lists/Datasheet/Attachments/8711/MX66UM1G45G,%201.8V,%201Gb,%20v1.1.pdf

Those flash have been tested on Xilinx Zynq-picozed board using
MXIC SPI controller.
As below are debugfs data, the SFDP table and result of mtd-utils
tests dump.

---

zynq> cat jedec_id
c2803b
zynq> cat manufacturer
macronix
zynq> cat partname
mx66um1g45g
zynq> xxd -p sfdp
53464450080104fd00070114400000ff8701011c900000ff0a0001080001
00ff05000105200100ff84000102340100ff0000000000000000ffffffff
ffffffffe5208affffffff3f00ff00ff00ff00ffeeffffffffff00ffffff
00ff0c2010d800ff00ff897901008d1200e2cc02674430b030b0f4bdd55c
000000ff101000200000000000007ca34800000000008888000000000000
00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
727103b80000000090a3188200c069960000000000000000727100987271
00b8727100990000000072710098727100f872710099727100f900000000
00000000011501d0727106d8000086500000060100000000020001030002
00000000060100000000000072060002000000eec0697272717100d8f7f6
000a000014359c8043060f0021dcffff
zynq> md5sum sfdp
eea09d64679e64f627402b39a177e356  sfdp

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
zynq>
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              c2 80 3b c2 80 3b
size            128 MiB
write size      1
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_4BAIT | HAS_16BIT_SR | IO_MODE_EN_VOLATILE | SOFT_RESET | 1<<17

opcodes
 read           0xee
  dummy cycles  20
 erase          0x21
 program        0x12
 8D extension   invert

protocols
 read           8D-8D-8D
 write          8D-8D-8D
 register       8D-8D-8D

erase commands
 21 (4.00 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (128 MiB)

sector map
 region (in hex)   | erase mask | flags
 ------------------+------------+----------
 00000000-07ffffff |     [  23] |
zynq>
zynq> dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.099845 seconds, 20.0MB/s
zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
zynq> hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
zynq> sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
zynq> mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
zynq> sha256sum spi_*
7f7b735ea26eb74d77203c82347a06b51e1ef1f5b9a0fda956ffc4087caa2ed8  spi_read
7f7b735ea26eb74d77203c82347a06b51e1ef1f5b9a0fda956ffc4087caa2ed8  spi_test

zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

zynq> cat jedec_id
c2853b
zynq> cat manufacturer
macronix
zynq> cat partname
mx66lm1g45g
zynq> xxd -p sfdp
53464450080104fd00070114400000ff8701011c900000ff0a0001080001
00ff05000105200100ff84000102340100ff0000000000000000ffffffff
ffffffffe5208affffffff3f00ff00ff00ff00ffeeffffffffff00ffffff
00ff0c2010d800ff00ff87690100821200e2cc02673830b030b0f4bdd55c
000000ff101000200000000000007ca34800000000006666000000000000
00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
727103b80000000090a3188200c069960000000000000000727100987271
00b8727100990000000072710098727100f872710099727100f900000000
00000000011501d0727106d8000086500000060100000000020001030002
00000000060100000000000072060002000000eec0697272717100d8f7f6
0000000014351c0043060f0021dcffff
zynq> md5sum sfdp
7b46113b529d58a6335531a10f14a76e  sfdp

zynq> cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 8D-8D-8D
  opcode        0xee
  mode cycles   0
  dummy cycles  14

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x12
 8D-8D-8D
  opcode        0x12
zynq>
zynq> cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              c2 85 3b c2 85 3b
size            128 MiB
write size      1
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_4BAIT | HAS_16BIT_SR | IO_MODE_EN_VOLATILE | SOFT_RESET | 1<<17

opcodes
 read           0xee
  dummy cycles  14
 erase          0x21
 program        0x12
 8D extension   invert

protocols
 read           8D-8D-8D
 write          8D-8D-8D
 register       8D-8D-8D

erase commands
 21 (4.00 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (128 MiB)

sector map
 region (in hex)   | erase mask | flags
 ------------------+------------+----------
 00000000-07ffffff |     [  23] |
zynq>
zynq> dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.100305 seconds, 19.9MB/s
zynq> mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
zynq> hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
zynq> sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
zynq> mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
zynq> mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
zynq> sha256sum spi_*
5607ddcf8d16b481e78fc4e90b21795c19d1f9a7eb77182a20536cab82eb55a2  spi_read
5607ddcf8d16b481e78fc4e90b21795c19d1f9a7eb77182a20536cab82eb55a2  spi_test

zynq> mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 42b1e2fec4f2..ba729007a92e 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -262,6 +262,13 @@ static const struct flash_info macronix_nor_parts[] = {
 		.id = SNOR_ID(0xc2, 0x80, 0x3a),
 	}, {
 		.id = SNOR_ID(0xc2, 0x85, 0x3a),
+	}, {
+		.id = SNOR_ID(0xc2, 0x80, 0x3b),
+	}, {
+		.id = SNOR_ID(0xc2, 0x85, 0x3b),
+	}, {
+		/* Need the manufacturer fixups. Keep this last */
+		.id = SNOR_ID(0xc2),
 	}
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
