Received: from b.relay.invitel.net ([62.77.203.4])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R5vZ6-0000nk-G6
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2011 08:20:30 +0000
Date: Tue, 20 Sep 2011 10:20:21 +0200
From: Heiko Schocher <hs@denx.de>
Subject: Re: mtd-util, flash_erase: MEMGETOOBSEL on davinci based board fail
In-reply-to: <1316506142.4849.48.camel@sauron>
To: dedekind1@gmail.com
Message-id: <4E784CC5.9020407@denx.de>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 7BIT
References: <4E784790.4010601@denx.de> <1316506142.4849.48.camel@sauron>
Cc: linux-mtd@lists.infradead.org
Reply-To: hs@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem,

Artem Bityutskiy wrote:
> On Tue, 2011-09-20 at 09:58 +0200, Heiko Schocher wrote:
>> Hello,
>>
>> I tried to use mtd-util:flash_erase on a davinci am1808 based board,
>> and get the following error:
>>
>> flash_erase -j /dev/mtd5 0 0
>> flash_erase: error!: /dev/mtd5: unable to get NAND oobinfo
>>               error 22 (Invalid argument)
> 
> What is your kernel version?

Hups, sorry forgot to post this:

Linux version 3.1.0-rc4-00086-gb0f6609 (hs@pollux.denx.de) (gcc version 4.5.1 (GCC) ) #1 PREEMPT Mon Sep 19 10:15:32 CEST 2011
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
CPU: VIVT data cache, VIVT instruction cache
Machine: EnBW CMC, model: EnBW CMC
Memory policy: ECC disabled, Data cache writethrough
DaVinci da850/omap-l138/am18x variant 0x1
[...]
physmap platform flash device: 02000000 at 60000000
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID 0x000001 Chip ID 0x002249
Amd/Fujitsu Extended Query Table at 0x0040
  Amd/Fujitsu Extended Query version 1.3.
number of CFI chips: 1
4 cmdlinepart partitions found on MTD device physmap-flash.0
Creating 4 MTD partitions on "physmap-flash.0":
0x000000000000-0x000000080000 : "U-Boot"
0x000000080000-0x000000090000 : "env1"
0x000000090000-0x0000000a0000 : "env2"
0x0000000a0000-0x000000200000 : "rest"
NAND device: Manufacturer ID: 0xad, Chip ID: 0xf1 (Hynix NAND 128MiB 3,3V 8-bit)
4 cmdlinepart partitions found on MTD device davinci_nand.1
Creating 4 MTD partitions on "davinci_nand.1":
0x000000000000-0x000000020000 : "dtb"
0x000000020000-0x000000220000 : "kernel"
0x000000220000-0x000000620000 : "rootfs"
0x000000620000-0x000008000000 : "userfs"
davinci_nand davinci_nand.1: controller rev. 2.5

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
