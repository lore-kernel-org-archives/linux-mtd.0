Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9tIc-0003et-Jr
	for <linux-mtd@lists.infradead.org>; Wed, 15 Oct 2003 22:35:19 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9FLYGS01849
	for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2003 10:34:16 +1300
Received: from sunstorm.tait.co.nz (sunstorm.tait.co.nz [172.25.40.9])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9FLYGS01843
	for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2003 10:34:16 +1300
Received: from tait.co.nz ([172.25.110.7])
 by sunstorm.tait.co.nz (iPlanet Messaging Server 5.1 (built May  7 2001))
 with ESMTP id <0HMT00IEHIL26G@sunstorm.tait.co.nz> for
 linux-mtd@lists.infradead.org; Thu, 16 Oct 2003 10:34:14 +1300 (NZDT)
Date: Thu, 16 Oct 2003 10:34:10 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
In-reply-to: <1066111497.3172.37.camel@imladris.demon.co.uk>
To: mtd list <linux-mtd@lists.infradead.org>
Message-id: <3F8DBD52.1020100@tait.co.nz>
MIME-version: 1.0
References: <3F8B814D.3050408@tait.co.nz>
 <1066111497.3172.37.camel@imladris.demon.co.uk>
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT
Subject: Re: Mount of jffs2 partition fails
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Tue, 2003-10-14 at 17:53 +0000, Robin Gilks wrote:
> 
> 
>>/ # mount -t jffs2 /dev/mtdblock1 /mnt
>>Write clean marker to block at 0x000d0000 failed: -30
> 
> 
> -30 is also -EROFS but we don't normally see it there so we don't have a
> nice helpful message telling you the reason :)
> 
> I have no clue why your flash allows erases but not writes. This is a
> flash hardware/driver problem, not JFFS2. Can you do more testing on the
> raw /dev/mtd0 device itself using
> read/write/ioctl(MEMERASE)/ioctl(MEMUNLOCK) to see what you need to do
> to make it work?

I've concluded that the ST chip I'm using, although being Intel command 
set compatible, requires a different approach. That being the case I 
enabled the ST chip option and on booting I now get the following.


Physically mapped flash: Found 1 x16 devices at 0x0 in 16-bit mode
kmod: failed to exec /sbin/modprobe -s -k cfi_cmdset_0003, errno = 2
Support for command set 0003 not present
gen_probe: No supported Vendor Command Set found
kmod: failed to exec /sbin/modprobe -s -k jedec_probe, errno = 2
kmod: failed to exec /sbin/modprobe -s -k map_rom, errno = 2

The items to note here are
1. cfi_cmdset_0003 does not exist, its replaced (as far as I can see) by
cfi_cmdset_0020
2. I'm not using any modules so why is the kernel trying to load some!!
3. when I try to use the alternate Jedec probe method, I get a compile 
error in jedec_probe.c of:
jedec_probe.c:1756: error: parse error before "jedec_probe_init"
jedec_probe.c:1757: warning: return type defaults to `int'
jedec_probe.c:1762: error: parse error before "jedec_probe_exit"
jedec_probe.c:1763: warning: return type defaults to `int'
jedec_probe.c:1767: warning: type defaults to `int' in declaration of 
`module_init'
jedec_probe.c:1767: warning: parameter names (without types) in function 
declaration
jedec_probe.c:1767: warning: data definition has no type or storage class
jedec_probe.c:1768: warning: type defaults to `int' in declaration of 
`module_exit'
jedec_probe.c:1768: warning: parameter names (without types) in function 
declaration
jedec_probe.c:1768: warning: data definition has no type or storage class

I take it that the code concerned has only ever been tested as modules? 
I'll try that in the meantime but that will require major work on my 
root filesystem :-((


-- 
Robin Gilks
Senior Design Engineer          Phone: (+64)(3) 357 1569
Tait Electronics                Fax  :  (+64)(3) 359 4632
PO Box 1645 Christchurch        Email : robin.gilks@tait.co.nz
New Zealand
