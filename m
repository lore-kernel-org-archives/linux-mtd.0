Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=mail.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CZL4H-00053W-8X
	for linux-mtd@lists.infradead.org; Tue, 30 Nov 2004 22:22:14 -0500
Received: from mail.magtech.com.au (localhost [127.0.0.1])
	by localhost.magtech.com.au (Postfix) with ESMTP id A868D895801
	for <linux-mtd@lists.infradead.org>;
	Wed,  1 Dec 2004 14:22:03 +1100 (EST)
Received: from [192.168.65.196] (unknown [192.168.65.196])
	by mail.magtech.com.au (Postfix) with ESMTP id 8FEF88945FF
	for <linux-mtd@lists.infradead.org>;
	Wed,  1 Dec 2004 14:22:03 +1100 (EST)
Message-ID: <41AD38DA.40008@magellan-technology.com>
Date: Wed, 01 Dec 2004 14:22:02 +1100
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
To: MTD-LIST <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: modprobe cfi_cmdset_0002 fails
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am running 2.4.27-vrs1 on an AT91RM9200DK.

I have managed to get the latest MTD code to compile with this kernel version 
and the kernel boots and executes OK (mostly)

Before I compiled in the new MTD code, the kernel detected my Smartmedia card 
and the Dataflash. Now it seems to fail.

from dmesg:

...
physmap flash device: 200000 at 10000000
CFI: Found no phys_mapped_flash device at location zero
reset unlock called 555 2aa
Search for id:(1f c0) interleave(1) type(2)
MTD jedec_match(): Check fit 0x00000000 + 0x00200000 = 0x00200000
MTD jedec_match(): check unlock addrs 0x0555 0x02aa
MTD jedec_match(): 0x0555 0x0aaa did not match
reset unlock called 555 aaa
Search for id:(1f c0) interleave(1) type(2)
MTD jedec_match(): Check fit 0x00000000 + 0x00200000 = 0x00200000
MTD jedec_match(): check unlock addrs 0x0555 0x0aaa
MTD jedec_match(): check ID's disappear when not in ID mode
reset unlock called 555 aaa
MTD jedec_match(): return to ID mode
MTD jedec_probe_chip(): matched device 0x1f,0xc0 unlock_addrs: 0x0555 0x0aaa
Found: Atmel AT49BV16X
reset unlock called 555 aaa
phys_mapped_flash: Found 1 x16 devices at 0x0 in 16-bit bank

The NOR Flash is found OK, and it comes up in /proc/mtd

kmod: failed to exec /sbin/modprobe -s -k cfi_cmdset_0002, errno = 2
Support for command set 0002 not present
gen_probe: No supported Vendor Command Set found
kmod: failed to exec /sbin/modprobe -s -k map_rom, errno = 2
...

Why does modprobe fail here? Shouldn't this already be compiled into the kernel?

regards,

Aras
