Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AiVa5-0000Jt-Mt
	for linux-mtd@lists.infradead.org; Mon, 19 Jan 2004 09:20:26 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Li Yang-r58472 <LeoLi@motorola.com>
In-Reply-To: <01139FC052A0D411900B00508B9535FC0F0D25BB@ZCH07EXM04.corp.mot.com>
References: 
	 <01139FC052A0D411900B00508B9535FC0F0D25BB@ZCH07EXM04.corp.mot.com>
Content-Type: text/plain
Message-Id: <1074503876.14499.40.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 19 Jan 2004 09:17:56 +0000
Content-Transfer-Encoding: 7bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: jffs2+mtd+big endian problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-01-19 at 16:43 +0800, Li Yang-r58472 wrote:
> Hi,
> 
> I'm doing a JFFS2 port to a PowerPC target board.  I have several
> questions while porting.
> 
> 1. Which kind of endian should I use in JFFS2?  Mkfs.jffs2 (older
> version, I have tried the new binary on JFFS2 website, the big-endian
> option breaks) can generate images of the two endian types.

There are two options. First, you can try a fixed version of mkfs.jffs2
which gets the byte-swapping right. I've uploaded the current CVS
version, 1.39, to sources.redhat.com now -- I think that should be OK.

Second, you could use the current CVS JFFS2 code (you should probably
use that anyway since it has a lot of optimisations missing from older
kernels), and make it use little-endian images by defining
JFFS2_LITTLE_ENDIAN instead of JFFS2_NATIVE_ENDIAN at about line 90 of
include/linux/jffs2.h

> 2. I added a new map file in driver/mtd/maps directory.  Which
> read/write/memcpy operation should I use?  __raw_readw() or readw()?
> Or Inw()?  They determined whether to swap bytes.

That depends on how your hardware is wired up. It's probably best not to
try this with JFFS2, which introduces its own endianness complexity...
try it with raw read/write (and the erase ioctl of course) on the
/dev/mtd devices. Read and write data in units of 1, 2 and 4 bytes at
various offsets and see what you get.

> I have tried several cases.  When I use little-endian fs and
> __raw_read(), the JFFS2 mount got error: jffs2_scan_eraseblock():
> Magic bitmask 0x1985 not found at 0x00000000: 0x8519 instead.  
> 
> However, after I change to use big-endian fs, mount can be successful.
> Create new file on JFFS2 got error: Node totlen on flash (0x44000000)
> != totlen in node ref (0x00000044).  Seems data written to flash are
> 32-bit byte-swaped.

That's odd. If you look in the image file you downloaded to the board,
is it telling the truth? Do you actually see (00,00,00,44) or
(44,00,00,00). Can you make the actual image available to me to play
with, and I'll tell you whether it's a valid image and your board
mapping is at fault, or whether it's an invalid image.

> Has anyone here done JFFS2 on Powerpc Big-endian system?  What are
> your options?

Mostly people using JFFS2 on PPC are using it in big-endian mode, I
think.

-- 
dwmw2
