Received: from 213-229-28-240.static.adsl-line.inode.at ([213.229.28.240]
	helo=contec-int.at)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1By7Ht-0005bo-UT
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2004 07:10:27 -0400
From: Manfred Gruber <gruber.m@utanet.at>
To: linux-mtd@lists.infradead.org
Date: Fri, 20 Aug 2004 13:15:01 +0200
References: <200408201300.05579.gruber.m@utanet.at>
	<1092999456.14552.3387.camel@hades.cambridge.redhat.com>
In-Reply-To: <1092999456.14552.3387.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Message-Id: <200408201315.01078.gruber.m@utanet.at>
Subject: Re: Number of CFI chips ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi !

Am Freitag, 20. August 2004 12:57 schrieben Sie:
> On Fri, 2004-08-20 at 13:00 +0200, Manfred Gruber wrote:
> > Hi guys !
> >
> > I am trying to find out why my 2 AM29LV256M do not work.
> > See before was: Re: JFFS2 with AM29LV256M
> >
> > I found out that CFI only detects one chip.
> >
> > What should CFI detect when I have 2 AM29LV256M chips on a 32 bit bus.
> > Each AM29LV256 has 16 bit bus with with connected to the 32bit bus. So
> > CFI has to setect 2 chips, am i right ?(wehn interleave is set to 2, and
> > buswith is set to 32)
> >
> > When it only detects one chip, my problem must be in detecting the chips
> > by CFI, is this correct ?
>
> Not necessarily. Some of our printks are confusing -- if it claims to
> have detected only one chip then it might mean one _pair_ of chips. Can
> you show exactly what it said?

this is the output, you see that i have phymaped 64MB, but cfiprobe only 
detects 32MB. also only one erase region and so on 

physmap flash device: 4000000 at 10000000
genprobe_new_chip nr of chips 2
Number of erase regions: 1
Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
Primary Algorithm Table at 0040
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum:  2.7 V
Vcc Maximum:  3.6 V
No Vpp line
Typical byte/word write timeout: 128 s
Maximum byte/word write timeout: 256 s
Typical full buffer write timeout: 128 s
Maximum full buffer write timeout: 4096 s
Typical block erase timeout: 1024 ms
Maximum block erase timeout: 16384 ms
Chip erase not supported
Device size: 0x2000000 bytes (32 MiB)
Flash Device Interface description: 0x0002
  - supports x8 and x16 via BYTE# with asynchronous interface
Max. bytes in buffer write: 0x20
Number of Erase Block Regions: 1
  Erase Region #0: BlockSize 0x10000 bytes, 512 blocks
phys_mapped_flash: Found 2 x16 devices at 0x0 in 32-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
Using buffer write method
phys_mapped_flash: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
6 RedBoot partitions found on MTD device phys_mapped_flash
Creating 6 MTD partitions on "phys_mapped_flash":
0x00000000-0x00040000 : "RedBoot"

and number of cfi chips tells :1 

thanks regards manfred
