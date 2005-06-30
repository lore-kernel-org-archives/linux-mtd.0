Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Do0zA-0000Cc-Hu
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2005 11:29:54 -0400
Message-ID: <42C40FDD.4080606@ieee.org>
Date: Thu, 30 Jun 2005 11:29:33 -0400
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: Lindstrom James-A19027 <A19027@motorola.com>
References: <53F44AF77A9F9B458DCE1910C2E626381227BBB5@il02exm15.corp.mot.com>
In-Reply-To: <53F44AF77A9F9B458DCE1910C2E626381227BBB5@il02exm15.corp.mot.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: something drastic (relocating the BNAND media header)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Lindstrom James-A19027 wrote:
> Hi gang,
> 
> I've written twice this month asking for help getting my MD2202-D384 DoC
> working.  I've got the kernel (2.4.18 (with cerf patches) plus snapshot
> 2005-03-04 plus my hacks to get it to build) to recognize my controller,
> but the issue was that it wasn't finding a BNAND media header.  I tweaked
> my page size from 0x4000 down to 0x2000 and sure enough the code found a
> BNAND media header at 0x2000 (not a boundary it was checking, clearly,
> using the larger page size).

That is really odd.  I happen to have a couple of MD2202-D384 parts 
here, formatted with MSYS tools version 5.1.4, and my BNAND data is at 
0x4000.  Since the erasesize is 16k, there should be media headers at 
0x4000 and 0x5000 according to the specs (unless you've removed your IPL 
region in which case they should be at 0x0000 and 0x1000).

Can you use M-systems' 'dinfo' program from DOS and see what it reports 
about your erase size, media header location, etc?  Let me know if you 
need help doing this.

Also, could you please send the output of running 'mtd_debug info <device>'?

> Strangely, though, using that page size, and
> given the size of my DOC (384MB), there were >= 32768 pages and, thus, the
> mtd code complained that the nMultiplierBits was too small or something 
> like that.  I removed that check just to see if the mtd code could even see
> the partitions or anything.  It did see two partitions (which was correct)
> but things were clearly screwed up.

Nothing strange about it.  If your physical erase size really were 
0x2000, the MSYS tools would have set BlockMultiplierBits=1 (instead of 
0) to create a logical unit size of 0x4000, because the NFTL format 
requires <= 32768 logical units.  By forcing the physical erase size to 
0x2000 you break that invariant.

David and Thomas, do you have any ideas about what might be going on 
here?  It looks to me like a problem sending the proper address to the 
chip, perhaps?

> ( The back story is this: the previous engineer using these chips had used
> the MSYS drivers and formatted two EXT2 partitions onto it. )

Hmm.  I wonder if the MSYS drivers were screwed up somehow.

> So here's where the fun comes in.  Diskonchip.c doeesn't see the BNAND 
> media header at pagesize=0x4000, but at pagesize=0x2000 it sees it and says
> that nMultiplierBits isn't sane.  Does anyone think I'd have any luck if I hacked in some code that reads my media header, writes it to 0x4000 and then
> use pagesize=0x4000 as though everything were normal?  What I'd hope is that
> if I do that, and set the nPartitions to 0, then I'd be able to fdisk the 
> /dev/mtdX (X=4 in my case, as I've got 0-3 for flash).  

First of all you can't use fdisk.  You can use either the DOS-based MSYS 
tools or 'docfdisk' to alter the BNAND partition table.  You CAN fdisk 
the virtual block device created by the NFTL driver -- could that be 
what you mean?  If so, you're planning to run a standard filesystem 
(like ext2) over NFTL over diskonchip.  I don't know if this is really 
working at the moment.  Does anyone out there sucessfully do this?

I only have experience using jffs2 directly over the mtd device.  I 
highly recomment this route even if NFTL is currently working :)

To answer your actual question... if your media header really is at 
0x2000 (I have some doubt about that, but 'dinfo' should clear up the 
issue), your best be might be to use 'dformat' from DOS to reformat your 
device, rather than hacking up your own tool.

> How badly will this probably screw things up?  Should I have a fire
> extinguisher near by?  Is this likely to hose the DOC?

You'll lose your data, certainly, but you won't hose the device.  You 
can always use dformat to fix whatever problems you cause (unless you 
manage to hose the bad block table at the very end of the device, which 
would be bad).

	-Dan
