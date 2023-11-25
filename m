Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57BBC636D0
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Nov 2023 12:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hm9Ar0ZZrTXPJwFrtVbqCrk1DoU1BeOIzMN/zxizxJ8=; b=m1RDDdvKKA/bcz
	z3U33Bzo8PBBccumYe1FHsUtQMD8N8T5ZDvMbJj1CWRwxIVoFxj2ChU/zuyYlyZrVyL+2uC0NY0p0
	lvC6UJusgPDgFFN7IYaR7eL21Rk6qJscswOYQynALc/Nw4sIq0JjTVkHKSnYMXAxFbNzk0c/j85DS
	d4qTyPdvgM1CRjPMXbPtowBoI1v3EVxRt/perKlo/tGun+to9hOUcnD4bctsZaDy6m3+Cjlysm8VA
	kCVe9yZ+r50j/AwvpBDQ1qH7+yt+Z0ifuTaXMgn2eu68+uqok2lC4RrpsId2AiMF+2MCxWcRC3bB2
	F+x5lujbsah6ORO522Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6rt5-009Egh-1i;
	Sat, 25 Nov 2023 12:35:55 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6rt1-009Eem-2e
	for linux-mtd@lists.infradead.org;
	Sat, 25 Nov 2023 12:35:54 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c6b30aca06so33685001fa.3
        for <linux-mtd@lists.infradead.org>; Sat, 25 Nov 2023 04:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700915749; x=1701520549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6SZmI3Pvpo+nrX5dodxgt+vurPd9z+DUMvPpLGMSBc=;
        b=lg3vvTRTXV+VU60ZM0mcgJPjvghiMP6g8aEciOj4wxATVBspkQS2hWAqEfACYEnL2b
         bNVuJTM9GIL3bPguD2YV4emTypfd0Keccltg8W+qibnIHhIZU0kUPMYp6hvwZwrcEShQ
         4YG4fmpuJa/9/SfoEd46cUN63xfVsVI0ygZsPNr6JB1OBMgMJlYNhoDf1dLBQahGkR2G
         kJnkGF3X/DjP9R70nIz+cu0IHDjEolTYAINCiXvNhqy1N+8CB/E8lgK7+l6Jv++AiNnZ
         WVQaZJZAAvzPcsSeLleG6jfII0d0eSNPP0OM68roCHcAL1mCqnlWY1jZ7NzMQNIZ5m5p
         +Uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700915749; x=1701520549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6SZmI3Pvpo+nrX5dodxgt+vurPd9z+DUMvPpLGMSBc=;
        b=QVf9EB4odUHb16okqbcblCXd84EME1aKknkcY+AfyxoSREkXxq3WGt4X0SgHMtgFnT
         vcfuZKZxB7JDlDXdvGnnAeT/LuDvGvh+hhGiMofNVPm68dlbHrWWEP9dkcmYuYXZQ66V
         m9KidPX50A/N5hHOQjMTKscqJmg4kzTwhvRG9zL4XWbAPvTlpR2mBVmIMqWM23FzRAvP
         xysyAePSUCH4QZj+TGOx+7IcQTI58rzwqDaS8P84julfFY7+y9xJZgvrFoV0EtYU74gd
         zPZkp3VwkcqvY4fQsWVsVsz3mqkzQwVDvbrEtWEl/9TbaDuLaFRkvZjxCaMknINSzUhp
         SBiA==
X-Gm-Message-State: AOJu0Yx4ig9lkLU7CQGkxJ23Y5PwDt7JYUsz4GmqaSGqxYbzBmR55Y4x
	EWKpfn/L51MccVmh7gUA1sWxKg==
X-Google-Smtp-Source: AGHT+IFnlUNbv1bzqaYWlHJAnWS/4VIO5P4jsKT4o64p9qsT9PebV/XdwK9R3AlLMTWb39ivK7Wbcw==
X-Received: by 2002:a2e:8811:0:b0:2c0:20c4:925a with SMTP id x17-20020a2e8811000000b002c020c4925amr3819642ljh.26.1700915749523;
        Sat, 25 Nov 2023 04:35:49 -0800 (PST)
Received: from 1.. ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id lv23-20020a170906bc9700b009f28db2b702sm3390163ejb.209.2023.11.25.04.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 04:35:49 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	fastevam@denx.de
Cc: linux-mtd@lists.infradead.org,
	takahiro.kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 3/5] mtd: spi-nor: micron-st: enable die erase for multi die flashes
Date: Sat, 25 Nov 2023 14:35:27 +0200
Message-Id: <20231125123529.55686-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231125123529.55686-1-tudor.ambarus@linaro.org>
References: <20231125123529.55686-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=15251; i=tudor.ambarus@linaro.org; h=from:subject; bh=mUCYe9d/EUp4D3V/P7y4Cpq/h/1M8gZWgBseZTqz10w=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlYeoRAV2gAmwDVCEJKBJpMuDSYjhIomMvFwzRf cji/nZYFNWJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZWHqEQAKCRBLVU9HpY0U 6Xp6B/9AcftybY10gH+pn84gJURdIKDUeClcf6ZVdr1zzEpxhQ1MRZGhRNWC+D6hTw1M7GWSTsD gpMCUzvSK15HuWriGB2r/VdXHMp/hQerZ+Vq27nsAmEbiHmbvhPuu/Wqq60bx7Djvpbuqa8UVaJ 6mep/lMKGbjlLkPPwpO7F98HS2UWEGGrs//x6ZVob7Yx+OmnCysBROTNXycUlT0XDjn8cUmDfR3 IgfGYLko2VL6dyoxrmwHYhv5kblKZ0IEucnzEPHQqF/uiCSDsCOu+mMjMZhwMpMr5IJGZgoHATQ OTJRNDKEIlFBIRwnZtqM8mLEJPeUmASaiXSZ+KuX8dnY6aWy
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_043551_862759_F4D72BC0 
X-CRM114-Status: GOOD (  17.27  )
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

Enable die erase for multi die flashes, it will speed the erase time.

Unfortunately, Micron does not provide a 4-byte opcode equivalent for
the die erase. The SFDP 4BAIT table fails to consider the die erase too,
the standard can be improved. Thus we're forced to enter in the 4 byte
address mode in order to benefit of the die erase.

Tested on n25q00. This flash defines the 4BAIT SFDP table, thus it will
use the 4BAIT opcodes for reads, page programs or erases, with the
exception that it will use the die erase command in the 4 byte address
mode.

Link: https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/n25q/n25q_1gb_3v_65nm.pdf?rev=b6eba74759984f749f8c039bc5bc47b7
Link: https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_l_02g_cbb_0.pdf?rev=43f7f66fc8da4d7d901b35fa51284c8f
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---

Tested on sama5d2_xplained using the "atmel,sama5d2-qspi" spi controller
and by operating the flash at 80MHz.

root@sama5d2-xplained-emmc:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/partname
n25q00
root@sama5d2-xplained-emmc:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/jedec_id 
20ba21
root@sama5d2-xplained-emmc:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/manufacturer 
st
root@sama5d2-xplained-emmc:~# xxd -p /sys/bus/spi/devices/spi1.0/spi-nor/sfdp         
53464450060101ff00060110300000ff84000102800000ffffffffffffff
ffffffffffffffffffffffffffffffffffffe520fbffffffff3f29eb276b
273b27bbffffffffffff27bbffff29eb0c2010d80f520000244a99008b8e
03e1ac0127387a757a75fbbdd55c4a0f82ff81bd3d36ffffffffffffffff
ffffffffffffffffffe7ffff21dcffff
root@sama5d2-xplained-emmc:~# sha256sum /sys/bus/spi/devices/spi1.0/spi-nor/sfdp
e49dfee6eeb73c55e94c07a8c7d352dd7d8774b830a64ed1059ef6e7bc833668  /sys/bus/spi/devices/spi1.0/spi-nor/sfdp

root@sama5d2-xplained-emmc:~# cat /sys/kernel/debug/spi-nor/spi1.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-1S (fast read)
  opcode	0x0c
  mode cycles	0
  dummy cycles	8
 1S-1S-2S
  opcode	0x3c
  mode cycles	1
  dummy cycles	7
 1S-2S-2S
  opcode	0xbc
  mode cycles	1
  dummy cycles	7
 2S-2S-2S
  opcode	0xbc
  mode cycles	1
  dummy cycles	7
 1S-1S-4S
  opcode	0x6c
  mode cycles	1
  dummy cycles	7
 1S-4S-4S
  opcode	0xec
  mode cycles	1
  dummy cycles	9
 4S-4S-4S
  opcode	0xec
  mode cycles	1
  dummy cycles	9

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x12
 1S-1S-4S
  opcode	0x34
 1S-4S-4S
  opcode	0x3e

 root@sama5d2-xplained-emmc:~# cat /sys/kernel/debug/spi-nor/spi1.0/params
name		n25q00
id		20 ba 21 10 40 00
size		128 MiB
write size	1
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_4BIT_BP | HAS_SR_BP3_BIT6 | SOFT_RESET

opcodes
 read		0xec
  dummy cycles	10
 erase		0x21
 program	0x3e
 8D extension	none

protocols
 read		1S-4S-4S
 write		1S-4S-4S
 register	1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 dc (64.0 KiB) [3]
 c4 (128 MiB)

sector map
 region (in hex)   | erase mask | flags
 ------------------+------------+----------
 00000000-07ffffff |     [ 123] | 
 
root@sama5d2-xplained-emmc:~# dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.1 MB, 2.0 MiB) copied, 1.40662 s, 1.5 MB/s
root@sama5d2-xplained-emmc:~# mtd_debug erase /dev/mtd1 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
root@sama5d2-xplained-emmc:~# mtd_debug read /dev/mtd1 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
root@sama5d2-xplained-emmc:~# hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
root@sama5d2-xplained-emmc:~# sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
root@sama5d2-xplained-emmc:~# mtd_debug write /dev/mtd1 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
root@sama5d2-xplained-emmc:~# mtd_debug read /dev/mtd1 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
root@sama5d2-xplained-emmc:~# sha256sum spi*
15608dfc2a8ef8352c1ec18863592002d8bb54195f0163794ac78c8599496808  spi_read
15608dfc2a8ef8352c1ec18863592002d8bb54195f0163794ac78c8599496808  spi_test
root@sama5d2-xplained-emmc:~# mtd_debug erase /dev/mtd1 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
root@sama5d2-xplained-emmc:~# mtd_debug read /dev/mtd1 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
root@sama5d2-xplained-emmc:~# sha256sum spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
15608dfc2a8ef8352c1ec18863592002d8bb54195f0163794ac78c8599496808  spi_test

root@sama5d2-xplained-emmc:~# mtd_debug info /dev/mtd1
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1 
mtd.oobsize = 0 
regions = 0

root@sama5d2-xplained-emmc:~# time mtd_debug erase /dev/mtd1 0 134217728
Erased 134217728 bytes from address 0x00000000 in flash

real	0m6.900s
user	0m0.000s
sys	0m6.899s

root@sama5d2-xplained-emmc:~# echo "ta writes something into the first die" > firstdie
root@sama5d2-xplained-emmc:~# echo "ta writes something into the second die" > seconddie
root@sama5d2-xplained-emmc:~# echo "ta writes something into the 3rd die 33333" > thirddie
root@sama5d2-xplained-emmc:~# echo "ta writes something into the 4th die 444444" > fourthdie

root@sama5d2-xplained-emmc:~# ls -al
total 176168
drwx------ 3 root root      4096 Apr 29 00:48 .
drwxr-xr-x 3 root root      4096 Mar  9  2018 ..
-rw-r--r-- 1 root root        39 Apr 29 00:45 firstdie
-rw-r--r-- 1 root root        44 Apr 29 00:48 fourthdie
-rw-r--r-- 1 root root        40 Apr 29 00:45 seconddie
-rw-r--r-- 1 root root   2097152 Apr 29 00:42 spi_read
-rw-r--r-- 1 root root   2097152 Apr 29 00:40 spi_test
-rw-r--r-- 1 root root        43 Apr 29 00:47 thirddie

root@sama5d2-xplained-emmc:~# mtd_debug write /dev/mtd1 0 39 firstdie
Copied 39 bytes from firstdie to address 0x00000000 in flash
root@sama5d2-xplained-emmc:~# mtd_debug write /dev/mtd1 33554432 40 seconddie 
Copied 40 bytes from seconddie to address 0x02000000 in flash
root@sama5d2-xplained-emmc:~# mtd_debug write /dev/mtd1 67108864 43 thirddie 
Copied 43 bytes from thirddie to address 0x04000000 in flash
root@sama5d2-xplained-emmc:~# mtd_debug write /dev/mtd1 100663296 44 fourthdie 
Copied 44 bytes from fourthdie to address 0x06000000 in flash
root@sama5d2-xplained-emmc:~# mtd_debug read /dev/mtd1 0 134217728 read
Copied 134217728 bytes from address 0x00000000 in flash to read
root@sama5d2-xplained-emmc:~# hexdump -C read
00000000  74 61 20 77 72 69 74 65  73 20 73 6f 6d 65 74 68  |ta writes someth|
00000010  69 6e 67 20 69 6e 74 6f  20 74 68 65 20 66 69 72  |ing into the fir|
00000020  73 74 20 64 69 65 0a ff  ff ff ff ff ff ff ff ff  |st die..........|
00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
*
02000000  74 61 20 77 72 69 74 65  73 20 73 6f 6d 65 74 68  |ta writes someth|
02000010  69 6e 67 20 69 6e 74 6f  20 74 68 65 20 73 65 63  |ing into the sec|
02000020  6f 6e 64 20 64 69 65 0a  ff ff ff ff ff ff ff ff  |ond die.........|
02000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
*
04000000  74 61 20 77 72 69 74 65  73 20 73 6f 6d 65 74 68  |ta writes someth|
04000010  69 6e 67 20 69 6e 74 6f  20 74 68 65 20 33 72 64  |ing into the 3rd|
04000020  20 64 69 65 20 33 33 33  33 33 0a ff ff ff ff ff  | die 33333......|
04000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
*
06000000  74 61 20 77 72 69 74 65  73 20 73 6f 6d 65 74 68  |ta writes someth|
06000010  69 6e 67 20 69 6e 74 6f  20 74 68 65 20 34 74 68  |ing into the 4th|
06000020  20 64 69 65 20 34 34 34  34 34 34 0a ff ff ff ff  | die 444444.....|
06000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
*
08000000

root@sama5d2-xplained-emmc:~# time mtd_debug erase /dev/mtd1 0 134217728
Erased 134217728 bytes from address 0x00000000 in flash

real	0m3.800s
user	0m0.001s
sys	0m3.751s
root@sama5d2-xplained-emmc:~# echo "ta writes a something crossing the dice" > cross-dice
root@sama5d2-xplained-emmc:~# ls -al
total 176172
drwx------ 3 root root      4096 Apr 29 00:54 .
drwxr-xr-x 3 root root      4096 Mar  9  2018 ..
-rw-r--r-- 1 root root        40 Apr 29 00:54 cross-dice

root@sama5d2-xplained-emmc:~# mtd_debug write /dev/mtd1 67108857 40 cross-dice 
Copied 40 bytes from cross-dice to address 0x03fffff9 in flash
root@sama5d2-xplained-emmc:~# mtd_debug read /dev/mtd1 0 134217728 read
Copied 134217728 bytes from address 0x00000000 in flash to read
root@sama5d2-xplained-emmc:~# hexdump -C read
00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
*
03fffff0  ff ff ff ff ff ff ff ff  ff 74 61 20 77 72 69 74  |.........ta writ|
04000000  65 73 20 61 20 73 6f 6d  65 74 68 69 6e 67 20 63  |es a something c|
04000010  72 6f 73 73 69 6e 67 20  74 68 65 20 64 69 63 65  |rossing the dice|
04000020  0a ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
04000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
*
08000000
root@sama5d2-xplained-emmc:~# mtd_debug read /dev/mtd1 67108857 40 read       
Copied 40 bytes from address 0x03fffff9 in flash to read
root@sama5d2-xplained-emmc:~# hexdump -C read
00000000  74 61 20 77 72 69 74 65  73 20 61 20 73 6f 6d 65  |ta writes a some|
00000010  74 68 69 6e 67 20 63 72  6f 73 73 69 6e 67 20 74  |thing crossing t|
00000020  68 65 20 64 69 63 65 0a                           |he dice.|
00000028
root@sama5d2-xplained-emmc:~# 

 drivers/mtd/spi-nor/core.c      | 32 ++++++++++++++++---------------
 drivers/mtd/spi-nor/micron-st.c | 34 +++++++++++++++++++++++++++++----
 2 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 479494cf00c9..52e5b569ddfd 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2935,6 +2935,9 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 			return ret;
 	}
 
+	/* Needed by some flashes late_init hooks. */
+	spi_nor_init_flags(nor);
+
 	if (nor->info->fixups && nor->info->fixups->late_init) {
 		ret = nor->info->fixups->late_init(nor);
 		if (ret)
@@ -2948,7 +2951,6 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 	if (!params->set_4byte_addr_mode)
 		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_brwr;
 
-	spi_nor_init_flags(nor);
 	spi_nor_init_fixup_flags(nor);
 
 	/*
@@ -3186,6 +3188,18 @@ int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 	struct spi_nor_flash_parameter *params = nor->params;
 	int ret;
 
+	if (enable) {
+		/*
+		 * If the RESET# pin isn't hooked up properly, or the system
+		 * otherwise doesn't perform a reset command in the boot
+		 * sequence, it's impossible to 100% protect against unexpected
+		 * reboots (e.g., crashes). Warn the user (or hopefully, system
+		 * designer) that this is bad.
+		 */
+		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
+			  "enabling reset hack; may not recover from unexpected reboots\n");
+	}
+
 	ret = params->set_4byte_addr_mode(nor, enable);
 	if (ret && ret != -ENOTSUPP)
 		return ret;
@@ -3234,20 +3248,8 @@ static int spi_nor_init(struct spi_nor *nor)
 
 	if (nor->addr_nbytes == 4 &&
 	    nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
-	    !(nor->flags & SNOR_F_4B_OPCODES)) {
-		/*
-		 * If the RESET# pin isn't hooked up properly, or the system
-		 * otherwise doesn't perform a reset command in the boot
-		 * sequence, it's impossible to 100% protect against unexpected
-		 * reboots (e.g., crashes). Warn the user (or hopefully, system
-		 * designer) that this is bad.
-		 */
-		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
-			  "enabling reset hack; may not recover from unexpected reboots\n");
-		err = spi_nor_set_4byte_addr_mode(nor, true);
-		if (err)
-			return err;
-	}
+	    !(nor->flags & SNOR_F_4B_OPCODES))
+		return spi_nor_set_4byte_addr_mode(nor, true);
 
 	return 0;
 }
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 8920547c12bf..b63f1e9b97d0 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -11,6 +11,7 @@
 /* flash_info mfr_flag. Used to read proprietary FSR register. */
 #define USE_FSR		BIT(0)
 
+#define SPINOR_OP_MT_DIE_ERASE	0xc4	/* Chip (die) erase opcode */
 #define SPINOR_OP_RDFSR		0x70	/* Read flag status register */
 #define SPINOR_OP_CLFSR		0x50	/* Clear flag status register */
 #define SPINOR_OP_MT_DTR_RD	0xfd	/* Fast Read opcode in DTR mode */
@@ -192,6 +193,30 @@ static struct spi_nor_fixups mt25qu512a_fixups = {
 	.post_bfpt = mt25qu512a_post_bfpt_fixup,
 };
 
+static int st_nor_four_die_late_init(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
+	params->n_dice = 4;
+
+	/*
+	 * Unfortunately the die erase opcode does not have a 4-byte opcode
+	 * correspondent for these flashes. The SFDP 4BAIT table fails to
+	 * consider the die erase too. We're forced to enter in the 4 byte
+	 * address mode in order to benefit of the die erase.
+	 */
+	return spi_nor_set_4byte_addr_mode(nor, true);
+}
+
+static struct spi_nor_fixups n25q00_fixups = {
+	.late_init = st_nor_four_die_late_init,
+};
+
+static struct spi_nor_fixups mt25q02_fixups = {
+	.late_init = st_nor_four_die_late_init,
+};
+
 static const struct flash_info st_nor_parts[] = {
 	{
 		.name = "m25p05-nonjedec",
@@ -366,16 +391,17 @@ static const struct flash_info st_nor_parts[] = {
 		.name = "n25q00",
 		.size = SZ_128M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
-			 SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE,
+			 SPI_NOR_BP3_SR_BIT6,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
+		.fixups = &n25q00_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xba, 0x22),
 		.name = "mt25ql02g",
 		.size = SZ_256M,
-		.flags = NO_CHIP_ERASE,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
+		.fixups = &mt25q02_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x15),
 		.name = "n25q016a",
@@ -433,16 +459,16 @@ static const struct flash_info st_nor_parts[] = {
 		.id = SNOR_ID(0x20, 0xbb, 0x21),
 		.name = "n25q00a",
 		.size = SZ_128M,
-		.flags = NO_CHIP_ERASE,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
+		.fixups = &n25q00_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x22),
 		.name = "mt25qu02g",
 		.size = SZ_256M,
-		.flags = NO_CHIP_ERASE,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
+		.fixups = &mt25q02_fixups,
 	}
 };
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
