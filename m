Received: from mailout03.sul.t-online.com ([194.25.134.81])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18MZSo-0002iI-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2002 19:57:42 +0000
Date: Thu, 12 Dec 2002 21:28:14 +0100
From: Jochen Schaeuble <psionic@psionic.de>
To: Tobias Otto-Adamczak <toa@indakom.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: slram and buffer cache
Message-ID: <20021212202814.GB5027@psionic.de>
Reply-To: psionic@psionic.de
References: <Pine.LNX.4.31.0212112004250.12431-100000@www.optixsoft.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.31.0212112004250.12431-100000@www.optixsoft.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,
I haven't used mtdblock for a while now so I'm not absolutely sure if
this is correct. The "cache_size" of the mtdblock driver is initialized
with the erasesize specified in the slram driver (0x10000 if you haven't
changed anything). If you want uncached operation you should set this
value to
(*curmtd)->mtdinfo->erasesize = 0x0; (slram.c line 180).
I had no time to check this but from reading the source I think this is
correct. Please let me know if this works for you. If so it might be a
good idea to make this size configurable.

Greets,
  Jochen

On Wed, Dec 11, 2002 at 08:23:02PM +0100, Tobias Otto-Adamczak wrote:
> Hi,
> 
> I have a custom board with 32MB SDRAM, 16MB Flash and 512K SRAM here. I
> use the slram driver to access the SRAM (which isn't used otherwise by
> the kernel). I created an 512K ext2 fs image and copied it to the SRAM
> using an mtd char dev. I was able to mount this SRAM area as a mtd block
> device (using mtdblock_ro) and read/write files to the ext2 fs.
> 
> My problem is the buffer cache for the block devices. I do not want
> write operations to the SRAM being delayed. What can I do to avoid that
> ? I searched for some hours today but to no avail.
> 
> [maybe OT for this list]
> How is this problem solved for "normal" ram disks ?
> 
> Regards
> Tobias
> 
