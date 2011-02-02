Received: from aa013-1msr.fastwebnet.it ([62.101.93.133])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PkfGW-00007G-De
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2011 16:09:09 +0000
From: Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
To: linux-mtd@lists.infradead.org
Subject: Re: Support for SST 39VF6402B has been officially added or I need to
	patch the kernel?
Date: Wed, 2 Feb 2011 17:09:04 +0100
References: <201101301935.38730.fabio.giovagnini@aurion-tech.com>
	<AANLkTiktds1RAAZK6ynUOL3L0hsqXjR99mcBsCeagD5B@mail.gmail.com>
	<201102021441.17956.fabio.giovagnini@aurion-tech.com>
In-Reply-To: <201102021441.17956.fabio.giovagnini@aurion-tech.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201102021709.04929.fabio.giovagnini@aurion-tech.com>
Cc: Guillaume LECERF <glecerf@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Just for understanding:
I did git form sh-2.6 branch of the kernel;
I did checkout v2.6.37

I read
http://osdir.com/ml/linux-kernel/2009-06/msg14219.html

But in my files I do not have nothing of these.
Why this?

Thanks


On Wednesday 02 February 2011 14:41:17 Fabio Giovagnini wrote:
> Hi Guillaume,
> with configuration I need to select in mtd kernel configuration?
> No I see;
> physmap platform flash device: 00400001 at 20400000
> physmap-flash: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID
> 0x0000bf Chip ID 0x00236c
> NOR chip too large to fit in mapping. Attempting to cope...
> number of CFI chips: 1
> Reducing visibility of 8192KiB chip to 4096KiB
> cmdlinepart partition parsing not available
> Searching for RedBoot partition table in physmap-flash at offset 0x3ff001
> No RedBoot partition table detected in physmap-flash
> Using physmap partition information
> Creating 3 MTD partitions on "physmap-flash":
> 0x000000000000-0x000000040000 : "Bootloader"
> 0x000000040000-0x000000200000 : "Kernel"
> 0x000000200000-0x000000400001 : "Flash_FS"
> mtd: partition "Flash_FS" doesn't end on an erase block -- force read-only
> sh-rtc sh-rtc: rtc core: registered sh as rtc0
> cpuidle: using governor ladder
> sh_cmt sh_cmt.0: kept as earlytimer
> sh_cmt sh_cmt.1: used for clock events
> sh_mtu2 sh_mtu2.0: kept as earlytimer
> sh_mtu2 sh_mtu2.1: used for clock events
> heartbeat: version 0.1.2 loaded
> oprofile: using timer interrupt.
> sh-rtc sh-rtc: setting system clock to 1970-01-01 00:00:00 UTC (0)
> jffs2: Flash size not aligned to erasesize, reducing to 2048KiB
> Node at 0x00000fe8 with length 0x0000002c would run over the end of the
> erase block
> Perhaps the file system was created with the wrong erase size?
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000ff0:
> 0xa026 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001000:
> 0x4d49 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001004:
> 0x0402 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001008:
> 0xdd74 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000100c:
> 0xcd96 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001010:
> 0x6d74 instead
> Node at 0x00001fe0 with length 0x0000002d would run over the end of the
> erase block
> Perhaps the file system was created with the wrong erase size?
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001fe8:
> 0xd721 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00002000:
> 0x6f62 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00002004:
> 0xbd2b instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00002008:
> 0x7074 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000200c:
> 0x63ff instead
> Node at 0x00002fd0 with length 0x00000046 would run over the end of the
> erase block
> Perhaps the file system was created with the wrong erase size?
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00002fd8:
> 0x4ae1 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00002ff0:
> 0x4d49 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00002ff4:
> 0x4d49 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000300c:
> 0x559c instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003010:
> 0x5e2e instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003014:
> 0x030d instead
> Node at 0x00003e24 with length 0x00000480 would run over the end of the
> erase block
> Perhaps the file system was created with the wrong erase size?
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003e2c:
> 0x5c8a instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003e3c:
> 0x03e8 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003e44:
> 0x4d49 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003e48:
> 0x4d49 instead
> 
> 
> Could you suggest me what iI have to investigate?
> 
> 
> Thanks in advance
> 
> On Sunday 30 January 2011 19:57:31 Guillaume LECERF wrote:
> > 2011/1/30 Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>:
> > >        Thanks
> > 
> > Yes.

-- 
Ing. Fabio Giovagnini

Aurion s.r.l.
P.I e C.F.
00885711200
skype: aurion.giovagnini
Tel. +39.051.594.78.24
Fax. +39.051.082.14.49
Cell. +39.335.83.50.919
www.aurion-tech.com
