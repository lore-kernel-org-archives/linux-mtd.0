Received: from cmsrelay03.mx.net ([165.212.11.112])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AtBiK-0005mF-8m
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2004 20:21:04 +0000
Message-ID: <00e101c3f593$80c3f770$fd0ba8c0@briantpc>
From: "Brian T" <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
References: <06b601c3f4dd$594d1700$fd0ba8c0@briantpc>
Date: Tue, 17 Feb 2004 14:20:34 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: Intel 28F128 - Linux-2.4.24 broke jffs2 v2.2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ahha,

It turns out this only happens with the Micron Q-Flash MT28F128J3 part, and
not the Intel 28F128 part.  I know this used to work with the 2.4.20 + JFFS2
v2.1 MTD patch.  Did someone goof the algorithm for the Micron chip
detection?

We have seen places where the Micron part required the Intel data sheet
algorithm and the Intel part didn't (pertaining to the extended status
register).

Wouldn't anyone be able to point me in the right direction for a fix?

Thanks,

-Brian


> Hi,
>
> For about a year I have been using Kernel 2.4.20 + JFFS2 v2.1, and am
> attempting to upgrate to 2.4.24 and the CVS from 14 Feb 04.  I am getting
> some strange debugging values.  It looks like the Intel flash is in "Read
> Identifier Codes" mode, rather than "Read Array" Mode.
>
> The jffs2_scan_eraseblock() output seems to be consistant regardless of
> changes made to the kernel config.
>
> Below my sig is the boot output with MTD debugging =  3 / JFFS2 = 2
>
> Any help would be appreciated.
>
> Thanks,
>
> -Brian T.
>
>
> Loading.......................................................
> Linux version 2.4.24 (root@smog) (gcc version 2.96 20000731 (Red Hat Linux
> .....
> Search for id:(89 18) interleave(1) type(2)
> Search for id:(89 18) interleave(1) type(2)
> Search for id:(89 18) interleave(1) type(2)
> Search for id:(89 18) interleave(1) type(2)
> Search for id:(89 18) interleave(1) type(2)
> Search for id:(89 18) interleave(2) type(1)
> Search for id:(89 18) interleave(2) type(1)
> Search for id:(89 18) interleave(2) type(1)
> Search for id:(89 18) interleave(2) type(1)
> Search for id:(89 18) interleave(2) type(1)
> Search for id:(89 00) interleave(2) type(2)
> Search for id:(89 00) interleave(2) type(2)
> Search for id:(89 00) interleave(2) type(2)
> Search for id:(89 00) interleave(2) type(2)
> Search for id:(89 00) interleave(2) type(2)
> JEDEC: Found no SnapGear AMD device at location zero
> SnapGear Intel: Found 1 x16 devices at 0x0 in 16-bit mode
>  Intel/Sharp Extended Query Table at 0x0031
> cfi_cmdset_0001: Erase suspend on write enabled
> Using buffer write method
> SnapGear Intel: Found 1 x16 devices at 0x0 in 16-bit mode
>  Intel/Sharp Extended Query Table at 0x0031
> cfi_cmdset_0001: Erase suspend on write enabled
> Using buffer write method
> SNAPGEAR: Intel flash device size = 16384K
> Creating 6 MTD partitions on "SnapGear Intel":
> 0x00000000-0x000e0000 : "JBM kernel"
> mtd: Giving out device 0 to JBM kernel
> 0x00100000-0x00fe0000 : "JBM filesystem"
> mtd: Giving out device 1 to JBM filesystem
> 0x000e0000-0x00100000 : "JBM config"
> mtd: Giving out device 2 to JBM config
> 0x00000000-0x01000000 : "JBM Intel"
> mtd: Giving out device 3 to JBM Intel
> 0x00fe0000-0x01000000 : "JBM BIOS Config"
> mtd: Giving out device 4 to JBM BIOS Config
> 0x00fe0000-0x01000000 : "JBM BIOS"
> mtd: Giving out device 5 to JBM BIOS
> JBMgw137 Battery Backed RAM device: 1f000 at 18021000
> Creating 1 MTD partitions on "JBMgw137 Battery Backed RAM":
> 0x00000000-0x0001f000 : "JBM-Battery-Backed RAM"
> mtd: Giving out device 6 to JBM-Battery-Backed RAM
> NET4: Linux TCP/IP 1.0 for NET4.0
> IP Protocols: ICMP, UDP, TCP, IGMP
> IP: routing cache hash table of 512 buckets, 4Kbytes
> TCP: Hash tables configured (established 2048 bind 4096)
> Linux IP multicast router 0.06 plus PIM-SM
> ip_conntrack version 2.1 (256 buckets, 2048 max) - 292 bytes per conntrack
> ip_tables: (C) 2000-2002 Netfilter core team
> arp_tables: (C) 2002 David S. Miller
> NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
> NET4: Ethernet Bridge 008 for NET4.0
> NET4: Linux IPX 0.47 for NET4.0
> IPX Portions Copyright (c) 1995 Caldera, Inc.
> IPX Portions Copyright (c) 2000, 2001 Conectiva, Inc.
> mtdblock_open
> ok
> mtdblock: read on "JBM filesystem" at 0x400, size 0x200
> mtdblock: read on "JBM filesystem" at 0x600, size 0x200
> mtdblock_release
> ok
> mtdblock_open
> ok
> mtdblock: read on "JBM filesystem" at 0x400, size 0x200
> mtdblock: read on "JBM filesystem" at 0x600, size 0x200
> mtdblock_release
> ok
> mtdblock_open
> ok
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000:
> 0x0089 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008:
> 0x00ff instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000000c:
> 0x00ff instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000010:
> 0x00ff instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000014:
> 0x00ff instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000018:
> 0x00ff instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000001c:
> 0x00ff instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020:
> 0x0051 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024:
> 0x0059 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000038:
> 0x0036 instead
> Further such events for this erase block will not be printed
> Empty flash at 0x0000010c ends at 0x00000110
> Empty flash at 0x0000030c ends at 0x00000310
> Empty flash at 0x0000050c ends at 0x00000510
> Empty flash at 0x0000070c ends at 0x00000710
> Empty flash at 0x0000090c ends at 0x00000910
> ...blah blah blah...
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
