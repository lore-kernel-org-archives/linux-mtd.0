Received: from anchor-post-35.mail.demon.net ([194.217.242.85])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B0MlK-0003Lr-HR
	for linux-mtd@lists.infradead.org; Mon, 08 Mar 2004 15:33:50 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Simon Haynes <simon@baydel.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 8 Mar 2004 15:10:09 +0000
References: <403C6FC3.1941.DDC08@localhost> <403DD3A0.4494.196896@localhost>
	<1078327901.4619.21.camel@hades.cambridge.redhat.com>
In-Reply-To: <1078327901.4619.21.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <AC8EC7070E8A@baydel.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 03 Mar 2004 3:31 pm, David Woodhouse wrote:
> On Thu, 2004-02-26 at 11:08 +0000, Simon Haynes wrote:
> > Beyond that I don't really know what I am looking for in the log. I can
>
> We could try to be slightly quieter about such things, but then we might
> actually miss something which _is_ a problem. Better to be concerned
> when there isn't a problem, than to be blissfully unaware when there
> _is_ one. Perhaps.

As you suggested I have changed the JFFS2 remount code to flush wbuf when the 
filesystem is mounted read only. As I said via IRC I have performed tens of 
reboots and I have not seen any CRC messages. 

Now on occasions, when the kernel is mounting JFFS2 as root on NAND I get.

NAND device: Manufacturer ID: 0xec, Chip ID: 0x79 (Samsung NAND 128MiB 3,3V)
Creating 3 MTD partitions on "NAND 128MiB 3,3V":
0x00000000-0x01000000 : "Boot / config partition"
mtd: Giving out device 0 to Boot / config partition
0x01000000-0x05000000 : "JFFS2 Root Filesystem partition"
mtd: Giving out device 1 to JFFS2 Root Filesystem partition
0x05000000-0x08000000 : "Write Cache Backup partition"
mtd: Giving out device 2 to Write Cache Backup partition
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 4096)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
jffs2: Erase block size too small (16KiB). Using virtual blocks size (32KiB) 
instead
ofs 0x00c00400 has already been seen. Skipping
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00c00408: 0x273c 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00c00420: 0x404d 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00c00424: 0x404d 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00c00428: 0x404d 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00c0043c: 0x0f33 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00c00440: 0x88f8 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00c00444: 0x4d61 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00c00448: 0x2039 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00c0044c: 0x343a 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00c00450: 0x3a32 
instead
Further such events for this erase block will not be printed

Can you suggest what might be going on ?

Cheers

Simon.
