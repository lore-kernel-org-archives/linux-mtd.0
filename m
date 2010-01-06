Received: from [80.91.229.12] (helo=lo.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NSd9R-0000GA-Uf
	for linux-mtd@lists.infradead.org; Wed, 06 Jan 2010 21:10:50 +0000
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NSd8n-0008Go-VW
	for linux-mtd@lists.infradead.org; Wed, 06 Jan 2010 22:10:05 +0100
Received: from chipmunk.wormnet.eu ([195.195.131.226])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2010 22:10:05 +0100
Received: from alex by chipmunk.wormnet.eu with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2010 22:10:05 +0100
To: linux-mtd@lists.infradead.org
From: Alexander Clouter <alex@digriz.org.uk>
Subject: Re: [PATCH 4/4] MTD: include ar7part in the list of partitions parsers
Date: Wed, 6 Jan 2010 20:28:10 +0000
Message-ID: <qb8f17-41q.ln1@chipmunk.wormnet.eu>
References: <201001032117.37459.florian@openwrt.org>
	<1262552177.3181.5891.camel@macbook.infradead.org>
	<2ve717-7pt.ln1@chipmunk.wormnet.eu>
	<201001050941.42161.florian@openwrt.org>
Sender: news <news@ger.gmane.org>
Cc: linux-mips@linux-mips.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In gmane.linux.ports.mips.general Florian Fainelli <florian@openwrt.org> wrote:
>
>> [snipped]
>> 
>> It simply pulls apart the 'PROM' (aka ADAM2) config and uses that to
>> build the partition table.
> 
> This is indeed simple but if I recall right the rationale behind ar7part was 
> to create a sane partition layout no matter if the bootloader was ADAM2 or 
> PSPBoot and the root filesystem type. JFFS2 and squashfs do not have the same 
> erase-block size alignment constraints, ar7part deals with that too.
> 
I am not convinced that is a good idea, one main reason is ar7part.c has 
gotten terribly wrong the partition table ('loader' is too small[1] and 
'rootfs' overlaps with the 'linux' partition').

This is what I have from ADAM2's perspective:
----
Adam2_AR7WRD > printenv
[snipped]
mtd0                  0x900e0000,0x903f0000 <-- rootfs
mtd1                  0x90020000,0x900e0000 <-- kernel
mtd2                  0x90000000,0x90020000 <-- adam2 bootloader
mtd3                  0x903f0000,0x90400000 <-- configuration
mtd4                  0x90020000,0x903f0000 <-- kernel + rootfs
----

Linux spits out:
----
physmap platform flash device: 00800000 at 10000000
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
physmap-flash.0: Swapping erase regions for broken CFI table.
number of CFI chips: 1
cmdlinepart partition parsing not available
RedBoot partition parsing not available
4 ar7part partitions found on MTD device physmap-flash.0
Creating 4 MTD partitions on "physmap-flash.0":
0x000000000000-0x000000010000 : "loader"
0x0000003f0000-0x000000400000 : "config"
0x000000020000-0x0000003f0000 : "linux"
0x0000000d0000-0x0000003f0000 : "rootfs"
----

My patch munched on whatever prom_getenv() returned, which from what I 
can tell looking at arch/mips/ar7/prom.c will work for both PSPBoot and 
ADAM2?

Are there some strange mtd environment variables I am yet to see out in 
the wild or does my patch simply not work for PSPBoot primed kit?  If 
not can you give me some 'spiel' to play around with?

Cheers

[1] okay, ADAM2 weighs in at less than 64kiB however it is not outside 
	the realm of possibility someone will port u-boot to AR7 which 
	would benefit from the full 128kiB of space?

-- 
Alexander Clouter
.sigmonster says: A man who turns green has eschewed protein.
