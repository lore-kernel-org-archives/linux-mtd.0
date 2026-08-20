Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB88C5DF82
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2026 06:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmENazTFLmHOqdcvNjmFRjDkJcVtx1oi61FDAtezVVU=; b=Wzca0dQyJtuKxK
	K1QyC6jKjtcXCvMGbWZ6gr+45T1eZIGNCATo+8N1R2qryq87TpBTO+TaPjI7XfOZIBNzjgE2ApsuN
	QO2r3Rgn+EC9XIbo534GYZrjHJUB7b1TbFapo6jA4oLbuN6mcz3K11qLwj1ie4I7UEwzbXOrQxSEB
	Sw8SGZIn1ceVB5VgwEPE5qNv2XhCjwhI1eJNyC8rXWvGYD2hHhp+Hf/BraITlKG3AvB+lg22v68WC
	xoOVY0Sb81YTarSL1xrMCSLCkmXJkk991KkYqF8oPu3ZMZjX+a/xrQcWZzaUXz/dHl6IgEPB5wj7G
	cRGVO9J745/sRv3om0dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1www4U-0000000AvTX-308K;
	Thu, 20 Aug 2026 06:16:18 +0000
Received: from smtp9.infineon.com ([217.10.52.204])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1www4R-0000000AvSn-3HNC;
	Thu, 20 Aug 2026 06:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787206571; x=1818742571;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GdwFzuGK1UdR4FjKyTb+X6oq+FZH2T3An69ImtM7Ppc=;
  b=lay3hddYZhUlJ7s2A0/BdJLTlt7kpA3yrDmoHE0tJwU9c+hMiy73i55u
   vaBK5OW6aUZyvcU4ZSHmt1/skPTQKVtlR3Jq837eyBa8u33+CgYvtXwBl
   0xEQJmUnNmAeT8ROLk3ZHQ5ARHsK3zgSoH4ucm5AueSiFQ7VUjRChY98U
   g=;
X-CSE-ConnectionGUID: /uyEmksfTYOoBtcRS641hg==
X-CSE-MsgGUID: LcR1TmGsQaaDEXW8jGo70w==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="105420169"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="105420169"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 08:15:09 +0200
Received: from MUCSE811.infineon.com (172.23.29.37) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 08:15:09 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE811.infineon.com
 (172.23.29.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 08:15:09 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 08:15:09 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 13/23] mtd: spi-nor: winbond: Add support for
 W25Q01RV-Q/N
Thread-Topic: [PATCH v3 13/23] mtd: spi-nor: winbond: Add support for
 W25Q01RV-Q/N
Thread-Index: AQHdKzdPGnhUtqB1akuI02XDHR/UI7amflNQ
Date: Thu, 20 Aug 2026 06:15:08 +0000
Message-ID: <4d7597839fc542ea846fe0ddb3eb6683@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-13-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-13-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_231612_309934_D0B0F7AF 
X-CRM114-Status: GOOD (  14.11  )
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

Hi Miquel,

> There is an ID collision with the chip of same density from the JV
> family. Both chips are very similar in practice, it is mostly a matter
> of electrical differences (mostly power consumption being lower).
> 
> As a significant difference, RV chips identify themselves as supporting
> the new SFDP (rev F) field which forces an alternate write SR2
> opcode (0x31).
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> + cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> ef4020

ef4021?
I think you copied wrong log (this looks same as patch #12).

> + cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> winbond
> + xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 534644500a0101ff00080117800000ff84010102e00000ffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffe520f3ffffffff1f44eb086b083b42bbfeffffffffff
> 0000ffff44eb0c200f5210d800001602a60081e214dde96376337a757a75
> f7a4d55c39f66dffe970f9a50000000000002c0c0000000066ffffff0000
> 00000000000000000000ffffffffff0a00fe21ffdcff
> + sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 74d21fecc7faa297b3f77f1136b1dc53f78b2a432629e226675b6384153fd9f9  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> + cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
> Supported read modes by the flash
>  1S-1S-1S
>   opcode        0x13
>   mode cycles   0
>   dummy cycles  0
>  1S-1S-2S
>   opcode        0x3c
>   mode cycles   0
>   dummy cycles  8
>  1S-2S-2S
>   opcode        0xbc
>   mode cycles   2
>   dummy cycles  2
>  1S-1S-4S
>   opcode        0x6c
>   mode cycles   0
>   dummy cycles  8
>  1S-4S-4S
>   opcode        0xec
>   mode cycles   2
>   dummy cycles  4
>  4S-4S-4S
>   opcode        0xec
>   mode cycles   2
>   dummy cycles  4
> 
> Supported page program modes by the flash
>  1S-1S-1S
>   opcode        0x12
>  1S-1S-4S
>   opcode        0x34
> + cat /sys/kernel/debug/spi-nor/spi0.0/params
> name            (null)
> id              ef 40 20 00 00 00
> size            64.0 MiB
> write size      1
> page size       256
> address nbytes  4
> flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_SR_TB_BIT6 | HAS_4BIT_BP | SOFT_RESET | NO_WP |
> HAS_SR2_CMP_BIT6
> 
> opcodes
>  read           0xec
>   dummy cycles  6
>  erase          0xdc
>  program        0x34
>  8D extension   repeat
> 
> protocols
>  read           1S-4S-4S
>  write          1S-1S-4S
>  register       1S-1S-1S
> 
> erase commands
>  21 (4.00 KiB) [1]
>  dc (64.0 KiB) [3]
>  c7 (64.0 MiB)
> 
> sector map
>  region (in hex)   | erase mask | overlaid
>  ------------------+------------+---------
>  00000000-03ffffff |     [   3] | no
> 
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-03ffffff | unlocked | 1024
> + dd 'if=/dev/urandom' 'of=./spi_test' 'bs=1M' 'count=2'
> 2+0 records in
> 2+0 records out
> + mtd_debug erase /dev/mtd0 0 2097152
> Erased 2097152 bytes from address 0x00000000 in flash
> + mtd_debug read /dev/mtd0 0 2097152 spi_read
> Copied 2097152 bytes from address 0x00000000 in flash to spi_read
> + hexdump spi_read
> 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
> *
> 0200000
> + sha256sum spi_read
> 4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
> + mtd_debug write /dev/mtd0 0 2097152 spi_test
> Copied 2097152 bytes from spi_test to address 0x00000000 in flash
> + mtd_debug read /dev/mtd0 0 2097152 spi_read
> Copied 2097152 bytes from address 0x00000000 in flash to spi_read
> + sha256sum spi_read spi_test
> 950cbc701e7f6ed69837b30bbf4145fe776e6c07a7bc5b8f346d42242bdd7a63  spi_read
> 950cbc701e7f6ed69837b30bbf4145fe776e6c07a7bc5b8f346d42242bdd7a63  spi_test
> + mtd_debug erase /dev/mtd0 0 2097152
> Erased 2097152 bytes from address 0x00000000 in flash
> + mtd_debug read /dev/mtd0 0 2097152 spi_read
> Copied 2097152 bytes from address 0x00000000 in flash to spi_read
> + sha256sum spi_read spi_test
> 4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
> 950cbc701e7f6ed69837b30bbf4145fe776e6c07a7bc5b8f346d42242bdd7a63  spi_test
> + mtd_debug info /dev/mtd0
> mtd.type = MTD_NORFLASH
> mtd.flags = MTD_CAP_NORFLASH
> mtd.size = 67108864 (64M)
> mtd.erasesize = 65536 (64K)
> mtd.writesize = 1
> mtd.oobsize = 0
> regions = 0
> 
> + alias 'show_sectors=grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0/params'
> + flash_lock -u /dev/mtd0
> + flash_lock -i /dev/mtd0
> Device: /dev/mtd0
> Start: 0
> Len: 0x4000000
> Lock status: unlocked
> Return code: 0
> + mtd_debug erase /dev/mtd0 0 2097152
> Erased 2097152 bytes from address 0x00000000 in flash
> + mtd_debug write /dev/mtd0 0 2097152 spi_test
> Copied 2097152 bytes from spi_test to address 0x00000000 in flash
> + mtd_debug read /dev/mtd0 0 2097152 spi_read
> Copied 2097152 bytes from address 0x00000000 in flash to spi_read
> + sha256sum spi_read spi_test
> 950cbc701e7f6ed69837b30bbf4145fe776e6c07a7bc5b8f346d42242bdd7a63  spi_read
> 950cbc701e7f6ed69837b30bbf4145fe776e6c07a7bc5b8f346d42242bdd7a63  spi_test
> + grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-03ffffff | unlocked | 1024
> + flash_lock -l /dev/mtd0
> + flash_lock -i /dev/mtd0
> Device: /dev/mtd0
> Start: 0
> Len: 0x4000000
> Lock status: locked
> Return code: 1
> + mtd_debug erase /dev/mtd0 0 2097152
> Erased 2097152 bytes from address 0x00000000 in flash
> + mtd_debug read /dev/mtd0 0 2097152 spi_read
> Copied 2097152 bytes from address 0x00000000 in flash to spi_read
> + sha256sum spi_read spi_test
> 950cbc701e7f6ed69837b30bbf4145fe776e6c07a7bc5b8f346d42242bdd7a63  spi_read
> 950cbc701e7f6ed69837b30bbf4145fe776e6c07a7bc5b8f346d42242bdd7a63  spi_test
> + dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
> 2+0 records in
> 2+0 records out
> + mtd_debug write /dev/mtd0 0 2097152 spi_test2
> Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
> + mtd_debug read /dev/mtd0 0 2097152 spi_read2
> Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
> + sha256sum spi_read spi_read2 spi_test spi_test2
> 950cbc701e7f6ed69837b30bbf4145fe776e6c07a7bc5b8f346d42242bdd7a63  spi_read
> 950cbc701e7f6ed69837b30bbf4145fe776e6c07a7bc5b8f346d42242bdd7a63  spi_read2
> 950cbc701e7f6ed69837b30bbf4145fe776e6c07a7bc5b8f346d42242bdd7a63  spi_test
> 643412dbe0f46c2780ec8d4f609d369923829945f4bc3d7842138b2fbbc86046  spi_test2
> + grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-03ffffff |   locked | 1024
> + flash_lock -u /dev/mtd0
> + cat /sys/class/mtd/mtd0/size
> + size=67108864
> + cat /sys/class/mtd/mtd0/erasesize
> + bs=65536
> + grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params
> + sed -e 's/.*unlocked | //'
> + nsectors=1024
> + ss=65536
> + bps=1
> + flash_lock -u /dev/mtd0
> + flash_lock -l /dev/mtd0 66977792 2
> + grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-03fdffff | unlocked | 1022
>  03fe0000-03ffffff |   locked | 2
> + flash_lock -u /dev/mtd0 66977792 1
> + grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-03feffff | unlocked | 1023
>  03ff0000-03ffffff |   locked | 1
> + flash_lock -u /dev/mtd0
> + flash_lock -l /dev/mtd0 58720256 128
> + grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-037fffff | unlocked | 896
>  03800000-03ffffff |   locked | 128
> + flash_lock -u /dev/mtd0
> + flash_lock -l /dev/mtd0 0 2
> + grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-0001ffff |   locked | 2
>  00020000-03ffffff | unlocked | 1022
> + flash_lock -u /dev/mtd0 65536 1
> + grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-0000ffff |   locked | 1
>  00010000-03ffffff | unlocked | 1023
> + all_but_one=1023
> + flash_lock -u /dev/mtd0
> + flash_lock -l /dev/mtd0 65536 1023
> + grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-0000ffff | unlocked | 1
>  00010000-03ffffff |   locked | 1023
> + flash_lock -u /dev/mtd0 65536 1
> + grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-0001ffff | unlocked | 2
>  00020000-03ffffff |   locked | 1022
> + flash_lock -u /dev/mtd0
> + flash_lock -l /dev/mtd0 0 1023
> + grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-03feffff |   locked | 1023
>  03ff0000-03ffffff | unlocked | 1
> + flash_lock -u /dev/mtd0 66977792 1
> + grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
> locked sectors
>  region (in hex)   | status   | #sectors
>  ------------------+----------+---------
>  00000000-03fdffff |   locked | 1022
>  03fe0000-03ffffff | unlocked | 2
> ---
>  drivers/mtd/spi-nor/winbond.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 47a5c2cf71de..1c67a652ddcd 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -281,7 +281,7 @@ static const struct flash_info winbond_nor_parts[] = {
>                 .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
>                          SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
>         }, {
> -               /* W25Q01JV-Q/N */
> +               /* W25Q01JV-Q/N, W25Q01RV-Q/N */
>                 .id = SNOR_ID(0xef, 0x40, 0x21),
>                 .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
>                          SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
> 
> --
> 2.54.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
