Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C815C4167B
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Dec 2023 21:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QkBD6OW3NW+3E2vwjrvh2B167GDKReqDSeBRocmTXU=; b=5DTXM+VVW0QqbtrXChvyw6nLGF
	iXSsoWY3IGbAY8qySiRA4p63obH8xTxYXAF5FAl/wHj2r6cSnwm3nCARzaf+XGlD6loFnksuohUlw
	8f+IbDaWDz3aufdobZ5Vq1++a5eobhLVTYhGw9luccOj2ZPVUBVXBK8yA2Gymrj4oYuEIA7mdcSRe
	6EeRsoFsEvU5TiJEg9gdJO2OwGRrPFbzTF/9HXSrWrQ0V409dZmLaj7sh4GoNIHfxLV4+9Tmy2xl1
	G0fOqLQLoqWpfA9zjhiEQx0iC7ZcNKpRRul2zqdlmLUfJYvfZgwxI3/m5IJMGar/LrFALjkBaNPWk
	LDrIxUPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAG2s-005cBF-26;
	Mon, 04 Dec 2023 21:00:02 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAG2p-005cAn-07
	for linux-mtd@lists.infradead.org;
	Mon, 04 Dec 2023 21:00:01 +0000
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 20F2F876DA;
	Mon,  4 Dec 2023 21:59:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1701723595;
	bh=SmAvWJjBSFrmv67o9Uu6ysguaUrpN+50gXjQo05+N7g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ks5JPrOJvCgScLceDnfY8bT+W8LmLLvZZ/IXiA5upfpFlWiRLdTpOkC/7Sta7Gwxf
	 eOb50Hw873ylHu1boHUpji3k88yc55fORWAIBItop9Ly3sh2O0JqUXKiQUtR1yTe0E
	 Mu1Q1NbeVfcsBa2DbYJwoJD5T3YMBKxMCxiH+esfnve0E3qJ5HeNx8djNGzl7FPVR3
	 mB1/8e8x63415AJgcN3oHw2h2iBGw6rdIVrhV1yOwm4FJxLaQiRSiqorjgznZ8vuHx
	 t0nXhBDLkGhZ1JG9Pr8T7Z0CXOKzV+ZGdQ0E6PkD6ChfUtCZhorMeHAlVv0hMS1iXU
	 XVfUJuSXIyyjw==
MIME-Version: 1.0
Date: Mon, 04 Dec 2023 17:59:55 -0300
From: Fabio Estevam <festevam@denx.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, michael@walle.cc, linux-mtd@lists.infradead.org,
 takahiro.kuwano@infineon.com, bacem.daassi@infineon.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] mtd: spi-nor: introduce die erase
In-Reply-To: <f9dc82f3-070a-42cd-a92d-83d031647867@linaro.org>
References: <20231125123529.55686-1-tudor.ambarus@linaro.org>
 <d7ce98eb-c920-413f-bbe9-059077a9dda7@linaro.org>
 <6156a51f7eadc9594404bb0eacabe1a6@denx.de>
 <f9dc82f3-070a-42cd-a92d-83d031647867@linaro.org>
Message-ID: <8de7595d8f4839187fdbbe7e139016bc@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_125959_447914_1F97C769 
X-CRM114-Status: GOOD (  10.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 30/11/2023 07:42, Tudor Ambarus wrote:

> Thanks, will do. Would you please replicate the tests that I did in
> patch 3/5 for mt25qu01q? You'll have to modify a bit the offsets for 
> the
> die and cross die tests.


Here it goes.

Can this series be applied now?

:~# cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
mt25qu01g

:~# cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
20bb21104400

:~# cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
st

:~# xxd -p  
/sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
53464450060101ff00060110300000ff84000102800000ffffffffffffff
ffffffffffffffffffffffffffffffffffffe520fbffffffff3f29eb276b
273b27bbffffffffffff27bbffff29eb0c2010d80f520000244a99008b8e
03e1ac0127387a757a75fbbdd55c4a0f82ff81bd3d36ffffffffffffffff
ffffffffffffffffffe7ffff21dcffff

:~# sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
e49dfee6eeb73c55e94c07a8c7d352dd7d8774b830a64ed1059ef6e7bc833668  
/sys/bus/spi/devices/spi0.0/spi-nor/sfdp

:~# cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
  1S-1S-1S
   opcode	0x13
   mode cycles	0
   dummy cycles	0
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

:~# cat /sys/kernel/debug/spi-nor/spi0.0/params
name		mt25qu01g
id		20 bb 21 10 44 00
size		128 MiB
write size	1
page size	256
address nbytes	4
flags		4B_OPCODES | HAS_4BAIT | HAS_16BIT_SR | SOFT_RESET

opcodes
  read		0x6c
   dummy cycles	8
  erase		0x21
  program	0x12
  8D extension	none

protocols
  read		1S-1S-4S
  write		1S-1S-1S
  register	1S-1S-1S

erase commands
  21 (4.00 KiB) [1]
  dc (64.0 KiB) [3]
  c4 (128 MiB)

sector map
  region (in hex)   | erase mask | flags
  ------------------+------------+----------
  00000000-07ffffff |     [ 123] |
root@mcde3000a:~#

:~# dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.0303915 s, 69.0 MB/s

:~# mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
:~# hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
:~# sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  
spi_read
:~# mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash

:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
:~# sha256sum spi*
d5c15629e1fa019941cb820eff6ffd2a9008b5796bb23a67c351f42af48ce180  
spi_read
d5c15629e1fa019941cb820eff6ffd2a9008b5796bb23a67c351f42af48ce180  
spi_test
:~# mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
:~# sha256sum spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  
spi_read
d5c15629e1fa019941cb820eff6ffd2a9008b5796bb23a67c351f42af48ce180  
spi_test
:~# mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0


real	0m0.005s
user	0m0.001s
sys	0m0.005s
:~# time mtd_debug erase /dev/mtd0 0 134217728
Erased 134217728 bytes from address 0x00000000 in flash

real	0m1.768s
user	0m0.001s
sys	0m1.609s
:~# echo "ta writes something into the first die" > firstdie
:~# echo "ta writes something into the second die" > seconddie
:~# ls -al
total 4112
drwx------ 2 root root    4096 Dec  4 20:36 .
drwxr-xr-x 4 root root    4096 Mar  9  2018 ..
-rw-r--r-- 1 root root      39 Dec  4 20:36 firstdie
-rw-r--r-- 1 root root      40 Dec  4 20:36 seconddie
-rw-r--r-- 1 root root 2097152 Dec  4 20:35 spi_read
-rw-r--r-- 1 root root 2097152 Dec  4 20:32 spi_test
:~# mtd_debug write /dev/mtd0 0 39 firstdie
Copied 39 bytes from firstdie to address 0x00000000 in flash
:~# mtd_debug write /dev/mtd0 67108864 40 seconddie
Copied 40 bytes from seconddie to address 0x04000000 in flash
:~# mtd_debug read /dev/mtd0 0 134217728 read
Copied 134217728 bytes from address 0x00000000 in flash to read
:~# hexdump -C read
00000000  74 61 20 77 72 69 74 65  73 20 73 6f 6d 65 74 68  |ta writes 
someth|
00000010  69 6e 67 20 69 6e 74 6f  20 74 68 65 20 66 69 72  |ing into 
the fir|
00000020  73 74 20 64 69 65 0a ff  ff ff ff ff ff ff ff ff  |st 
die..........|
00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  
|................|
*
04000000  74 61 20 77 72 69 74 65  73 20 73 6f 6d 65 74 68  |ta writes 
someth|
04000010  69 6e 67 20 69 6e 74 6f  20 74 68 65 20 73 65 63  |ing into 
the sec|
04000020  6f 6e 64 20 64 69 65 0a  ff ff ff ff ff ff ff ff  |ond 
die.........|
04000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  
|................|
*
08000000
:~# time mtd_debug erase /dev/mtd0 0 134217728
Erased 134217728 bytes from address 0x00000000 in flash

real	0m2.029s
user	0m0.001s
sys	0m1.853s

:~# echo "ta writes a something crossing the dice" > cross-dice
:~# mtd_debug write /dev/mtd0 67108857 40 cross-dice
Copied 40 bytes from cross-dice to address 0x03fffff9 in flash

:~# mtd_debug read /dev/mtd0 0 134217728 read
Copied 134217728 bytes from address 0x00000000 in flash to read
:~# hexdump -C read
00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  
|................|
*
03fffff0  ff ff ff ff ff ff ff ff  ff 74 61 20 77 72 69 74  |.........ta 
writ|
04000000  65 73 20 61 20 73 6f 6d  65 74 68 69 6e 67 20 63  |es a 
something c|
04000010  72 6f 73 73 69 6e 67 20  74 68 65 20 64 69 63 65  |rossing the 
dice|
04000020  0a ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  
|................|
04000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  
|................|
*
08000000
:~# mtd_debug read /dev/mtd0 67108857 40 read
Copied 40 bytes from address 0x03fffff9 in flash to read
:~# hexdump -C read
00000000  74 61 20 77 72 69 74 65  73 20 61 20 73 6f 6d 65  |ta writes a 
some|
00000010  74 68 69 6e 67 20 63 72  6f 73 73 69 6e 67 20 74  |thing 
crossing t|
00000020  68 65 20 64 69 63 65 0a                           |he dice.|
00000028
:~#

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
