Received: from cmsout02.mbox.net ([165.212.64.32])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0ocJ-0003Cs-G8
	for linux-mtd@lists.infradead.org; Fri, 27 Aug 2004 17:50:41 -0400
Message-ID: <05b901c48c7f$df752c70$fd0ba8c0@briantpc>
From: "Brian T" <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 27 Aug 2004 16:50:29 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Error: jffs2_decompress returned -5
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

So,

After patching 2.4.27 with the snapshot from today, and adding "__ffs" to
compatmac.h , everything compiles, but then when reading my jffs2 file
system I get this :

SnapGear Intel: Found 1 x16 devices at 0x0 in 8-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
SnapGear Intel: Found 1 x16 devices at 0x0 in 8-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
SNAPGEAR: Intel flash device size = 16384K
Creating 6 MTD partitions on "SnapGear Intel":
0x00000000-0x000e0000 : "JBM kernel"
0x00100000-0x00fe0000 : "JBM filesystem"
0x000e0000-0x00100000 : "JBM config"
0x00000000-0x01000000 : "JBM Intel"
0x00fe0000-0x01000000 : "JBM BIOS Config"
0x00fe0000-0x01000000 : "JBM BIOS"
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 8192)
Linux IP multicast router 0.06 plus PIM-SM
ip_conntrack version 2.1 (512 buckets, 4096 max) - 288 bytes per conntrack
ip_tables: (C) 2000-2002 Netfilter core team
arp_tables: (C) 2002 David S. Miller
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
NET4: Ethernet Bridge 008 for NET4.0
NET4: Linux IPX 0.47 for NET4.0
IPX Portions Copyright (c) 1995 Caldera, Inc.
IPX Portions Copyright (c) 2000, 2001 Conectiva, Inc.
VFS: Mounted root (jffs2 filesystem) readonly.
Freeing unused kernel memory: 68k freed
JFFS2 compression type 0x06 not available.
Error: jffs2_decompress returned -5
JFFS2 compression type 0x06 not available.
Error: jffs2_decompress returned -5
Kernel panic: No init found.  Try passing init= option to kernel.


I haven't seen those errors before.   Anyone care to point me in the right
direction?

Thanks,

-Brian
