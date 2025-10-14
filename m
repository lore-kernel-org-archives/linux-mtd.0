Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4A5CCD184
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Oct 2025 18:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=76x5J+M98KzWTVg/owGI/88dEAF+4f838DZ3l+P1vu4=; b=elnizG3AIfuRWL
	iNugwfezYj/GeOkr7FYmrjLtYSBjEYVvDx4UQSSYjeC3Wj/AI3fcjhT/mUouh8Fp3DMBrbA4MRmJR
	Inm5ogPlj2in3BDdZb2uR6IOoF65jruM1f5nmv/NlYZk4dHQ0dzTgcn1wVlaJgG3xC6PD00qtxzGG
	d9CouK15JKxboyOsDOdJlRrhx4owfLtqFlkRr6ZESHkvbj9u7aqmNk5Qd4cr2wil2bJGSA3ccfG+B
	tMVd5fQbFaFfefMnOxQvjaQuqJhhxq8D9dX7njtbmc3bTFhRf9mzmddLdRbKzZAI97YkIcqTrtYpm
	Th/5k5TLGcCspupCiU8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jiD-0000000HBJ3-1nHr;
	Tue, 14 Oct 2025 18:25:29 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ji9-0000000HBHQ-1GI0
	for linux-mtd@lists.infradead.org;
	Tue, 14 Oct 2025 18:25:27 +0000
Message-ID: <92e99a96-5582-48a5-a4f9-e9b33fcff171@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760466313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kbCE1DWgGJd3qA3tQKajQkPc5p8CkEpKZnECNMQysVg=;
	b=qvAqzUALs1UNMEXsiL37POSOu4zESnjmyZ8ydUSMmpo0ciHPpTUS1EiclVg07dnqcnO+nr
	alC3vdqSvdiRQsnWs4wTPT3J9lNWK26Vc7Ek0wAN4ayFTWYqSA4D4kSaae1xURCG9k2qbc
	uZ/TNC3g4VnnFEhUrPAhvAWNMmcj67Y=
Date: Tue, 14 Oct 2025 14:25:10 -0400
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
 <mafs0ecreontu.fsf@kernel.org>
 <4888cefa-e8be-4f0d-9d4a-c82f9ff6cda0@linux.dev>
 <mafs05xcpo9sz.fsf@kernel.org>
 <26a795ac-e6ff-4363-a8b9-38793a9be794@linux.dev>
 <mafs0ikgnn07u.fsf@kernel.org>
 <d00d42ce-4262-4736-8c73-5d2544e86d33@linux.dev>
 <33cbbac1-c247-4644-b555-998eea6e8305@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <33cbbac1-c247-4644-b555-998eea6e8305@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_112525_639994_5FC94C64 
X-CRM114-Status: GOOD (  20.77  )
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

On 10/13/25 03:30, Tudor Ambarus wrote:
> Sean,
> 
> On 10/10/25 4:45 PM, Sean Anderson wrote:
> 
>>> ... or, you know, read the data sheet, write the driver, and _test_ if
>>> it actually works?
>> 
>> Which I did.
> 
> cut
> 
>> - Locking is not in your suggested test procedure for new flashes
>>   (although it probably should be if you're so gung ho about mistrusting
>>   datasheets). 
> 
> cut
> 
>> There is no evidence that the status register has three bits (except
>> when the flash has 64 eraseblocks or fewer), and there overwhelming
>> evidence to the contrary.
> 
> Nobody challenged that your flash has 4 BP bits.

Pratyush just did! And what I mean is that ALL of these flashes should
have these flags added. It shouldn't be the case that random developers
have to slowly trickle in patches every other year as they discover that
locking is broken across the board.

> I/we just want the proof
> that you did the tests, i.e. show the output of the mtd-utils locking tests.

# flash_lock -u /dev/mtd/by-name/spi0.1
# flash_lock -i /dev/mtd/by-name/spi0.1
Device: /dev/mtd/by-name/spi0.1
Start: 0
Len: 0x8000000
Lock status: unlocked
Return code: 0
# test() {
> mtd=/dev/mtd/by-name/$1
> start=$(($2 * 64 * 1024))
> size=$(($3 * 64 * 1024))
> dd if=/dev/urandom of=$1 bs=64k count=$3 status=none && \
> mtd_debug erase $mtd $start $size && \
> mtd_debug write $mtd $start $size $1 && \
> dd if=$mtd bs=64k skip=$2 count=$3 status=none | sha256sum $1 - && \
> rm $1
> }
# test spi0.1 0 64
Erased 4194304 bytes from address 0x00000000 in flash
Copied 4194304 bytes from spi0.1 to address 0x00000000 in flash
8cb208e9ae82e57fb192e1bb6cabc6573e1de23abcba5d65d95217a8aca64f3f  spi0.1
8cb208e9ae82e57fb192e1bb6cabc6573e1de23abcba5d65d95217a8aca64f3f  -
# flash_lock -l /dev/mtd/by-name/spi0.1
# flash_lock -i /dev/mtd/by-name/spi0.1
Device: /dev/mtd/by-name/spi0.1
Start: 0
Len: 0x8000000
Lock status: locked
Return code: 1
# test
[95099.230842] spi-nor spi0.1: Erase operation failed.
[95099.235746] spi-nor spi0.1: Attempted to modify a protected sector.
While erasing blocks from 0x00000000-0x00400000 on /dev/mtd/by-name/spi0.1: Input/output error
# flash_lock -u /dev/mtd/by-name/spi0.1
# test spi0.1 64
83a8dc6125ec9672d18f7f18f92e16f867354dbe8e2f3b0aca52b9d0ad7d8ffe  spi0.1
83a8dc6125ec9672d18f7f18f92e16f867354dbe8e2f3b0aca52b9d0ad7d8ffe  -
# flash_lock -l /dev/mtd/by-name/spi0.1 $((1024 * 64 * 1024)) 1024
# flash_lock -i /dev/mtd/by-name/spi0.1 
Device: /dev/mtd/by-name/spi0.1
Start: 0
Len: 0x8000000
Lock status: unlocked <<<< Wrong!
Return code: 0
# test spi0.1 0 64
Erased 4194304 bytes from address 0x00000000 in flash
Copied 4194304 bytes from spi0.1 to address 0x00000000 in flash
cd56cebf0dce3276c595f7787d1b3b35db467786e15f9c401d5f11570073d41f spi0.1
cd56cebf0dce3276c595f7787d1b3b35db467786e15f9c401d5f11570073d41f -
# test spi0.1 1024 64
[97011.257102] spi-nor spi0.1: Erase operation failed.
[97011.262006] spi-nor spi0.1: Attempted to modify a protected sector.
MEMERASE: Input/output error
# flash_lock -u /dev/mtd/by-name/spi0.1
# flash_lock -l /dev/mtd/by-name/spi0.1 0 1024
# flash_lock -i /dev/mtd/by-name/spi0.1 
Device: /dev/mtd/by-name/spi0.1
Start: 0
Len: 0x8000000
Lock status: unlocked <<<< Wrong again!
Return code: 0
# test spi0.1 0 64
[98127.697206] spi-nor spi0.1: Erase operation failed.
[98127.702116] spi-nor spi0.1: Attempted to modify a protected sector.
MEMERASE: Input/output error
# test spi0.1 1024 64
Erased 4194304 bytes from address 0x04000000 in flash
Copied 4194304 bytes from spi0.1 to address 0x04000000 in flash
3c0fb61b64b3d0a8eb9503b39180b45bccc6d3e840482ccf36faa194a80c4b8f  spi0.1
3c0fb61b64b3d0a8eb9503b39180b45bccc6d3e840482ccf36faa194a80c4b8f  -

So MEMISLOCKED is not really working properly, but the actual lock
functionality is fine. All of the above was done with the write-protect
input high. Setting it low, unlocking fails:

# flash_lock -u /dev/mtd/by-name/spi0.1 
flash_lock: error!: could not unlock device: /dev/mtd/by-name/spi0.1

            error 5 (Input/output error)

> I also need you to dump the sysfs/debugs entries.

# cat /sys/bus/spi/devices/spi0.1/spi-nor/partname
n25q00a
# cat /sys/bus/spi/devices/spi0.1/spi-nor/jedec_id 
20bb21
# cat /sys/bus/spi/devices/spi0.1/spi-nor/manufacturer 
st
# hexdump -C /sys/bus/spi/devices/spi0.1/spi-nor/sfdp         
00000000  53 46 44 50 06 01 01 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
00000010  84 00 01 02 80 00 00 ff  ff ff ff ff ff ff ff ff  |................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 fb ff ff ff ff 3f  29 eb 27 6b 27 3b 27 bb  |. .....?).'k';'.|
00000040  ff ff ff ff ff ff 27 bb  ff ff 29 eb 0c 20 10 d8  |......'...).. ..|
00000050  0f 52 00 00 24 4a 99 00  8b 8e 03 e1 ac 01 27 38  |.R..$J........'8|
00000060  7a 75 7a 75 fb bd d5 5c  4a 0f 82 ff 81 bd 3d 36  |zuzu...\J.....=6|
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000080  ff e7 ff ff 21 dc ff ff                           |....!...|
00000088
# sha256sum /sys/bus/spi/devices/spi0.1/spi-nor/sfdp 
e49dfee6eeb73c55e94c07a8c7d352dd7d8774b830a64ed1059ef6e7bc833668  /sys/bus/spi/devices/spi0.1/spi-nor/sfdp

# cat /sys/kernel/debug/spi-nor/spi0.1/capabilities
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
# cat /sys/kernel/debug/spi-nor/spi0.1/params      
name		n25q00a
id		20 bb 21 10 44 00
size		128 MiB
write size	1
page size	256
address nbytes	4
flags		HAS_SR_TB | NO_OP_CHIP_ERASE | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_4BIT_BP | HAS_SR_BP3_BIT6 | SOFT_RESET

opcodes
 read		0xbc
  dummy cycles	8
 erase		0xdc
 program	0x12
 8D extension	none

protocols
 read		1S-2S-2S
 write		1S-1S-1S
 register	1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 dc (64.0 KiB) [3]

sector map
 region (in hex)   | erase mask | flags
 ------------------+------------+----------
 00000000-07ffffff |     [ 123] | 

# mtd_debug info /dev/mtd/by-name/spi0.1
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1 
mtd.oobsize = 0 
regions = 0

> It's true that the locking tests are not yet described in
> https://docs.kernel.org/driver-api/mtd/spi-nor.html, that's why I encouraged
> you to show us how you did the testing and maybe to contribute and extend
> the documentation.

And my point is that the original submitters did not test locking. So
you should assume that the locking flags are not working, rather than
assume that they are tested and intentionally omitted.

--Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
