From: David Woodhouse <dwmw2@infradead.org>
To: Christopher M Bergeron <christopher@bergeron.com>
In-Reply-To: <412B53F9.5030006@bergeron.com>
References: <412B53F9.5030006@bergeron.com>
Content-Type: text/plain
Message-Id: <1093360220.14552.12475.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 24 Aug 2004 16:10:20 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Can jffs2 support XIP extensions?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-08-24 at 10:43 -0400, Christopher M Bergeron wrote:
> Does anyone know if jffs2 can utilize/support XIP (eXecute In Place)?  
> I've read that only CramFS can work wit it.  I'm a little unclear about 
> how XIP works and it's implications with jffs2 / CramFS.
> Can anyone shed any light on this for me?

If you want Linux rather than something smaller, like eCos, then you
almost certainly don't want XIP.

XIP is for obvious reasons mutually exclusive with compression. You
throw away flash space in order to save RAM and to make data and code
access by the CPU slower.

Flash is more expensive than RAM -- your board will be cheaper if you
use half the flash and compress its contents, than it would be if you
use half the _RAM_ and XIP instead.

If you really really really care about power, then you might care that
RAM actually takes more power at runtime than flash does. But then we'd
just laugh at you for using Linux instead of something much smaller and
in particular without a periodic timer tick :)

In order to use XIP, you muck with the MMU to make mmap() of files on
the file system actually set up page tables to point at the flash chip.
You then have to care a lot about leaving the flash chip in read mode at
all times when userspace might be looking at it. 

Because cramfs is a read-only file system, it's easy enough to do this.
The files which are marked for XIP are carefully arranged so that each
logical page is physically page-aligned on the medium to allow the MMU
to map it. It would be a lot harder to achieve that in JFFS2, and
largely pointless. 

The only reason for using XIP under Linux which is even vaguely sane is
to improve boot time. But since the figures shown at OLS were comparing
apples and oranges -- compressed non-XIP kernel vs. uncompressed XIP
kernel, with a lot of the time taken being the actual decompression, I'm
not entirely convinced. There may well be better alternatives, without
the runtime and hardware overhead.

-- 
dwmw2
