Received: from modemcable166.48-200-24.mc.videotron.ca ([24.200.48.166]
	helo=xanadu.home)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BgEmh-0008Eb-90
	for linux-mtd@lists.infradead.org; Thu, 01 Jul 2004 23:32:20 -0400
Date: Thu, 1 Jul 2004 23:32:14 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Robert Lippmann <rlippmann@imsventures.com>
In-Reply-To: <NFBBKPKLPNGEMNKJKAIKIEBBCDAA.rlippmann@imsventures.com>
Message-ID: <Pine.LNX.4.44.0407012328180.18865-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
Subject: Re: unresoved symbol __ffs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 1 Jul 2004, Robert Lippmann wrote:

> hi all,
> 
> haven't seen this covered before, but when i try to use recent snapshots
> (late june-ish), i get this unresolved symbol when building a 2.4.26 kernel
> using linux-mips.  i assume it's because the compiler
> sets --disable-builtins when compiling.  it occurs in cfi_cmdset_0001.c
> oddly, the file compiles without warnings.  oh, and i'm using gcc 3.3.2

__ffs should be defined in linux/asm/bitops.h.  It is defined for MIPS as 
follows in 2.6.7:

/*
 * __ffs - find first bit in word.
 * @word: The word to search
 *
 * Undefined if no bit exists, so code should check against 0 first.
 */
static inline unsigned long __ffs(unsigned long word)
{
        return ffz(~word);
}

> i've tried #define __ffs ffs, but even that doesn't seem to work.

It's qite odd that it didn't compile, bit even if it did __ffs and ffs 
aren't equivalent.


Nicolas
