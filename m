Received: from h000.c000.snv.cp.net ([209.228.32.64] helo=c000.snv.cp.net)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bzg0j-0008AP-9M
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2004 14:27:13 -0400
Message-ID: <412B8875.90108@bergeron.com>
Date: Tue, 24 Aug 2004 14:27:01 -0400
From: Christopher M Bergeron <christopher@bergeron.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <412B53F9.5030006@bergeron.com>
	<1093360220.14552.12475.camel@hades.cambridge.redhat.com>
In-Reply-To: <1093360220.14552.12475.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Can jffs2 support XIP extensions?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Unfortunately, boot time is my primary concern.  However, I'm planning 
on booting an uncompressed linux kernel which should save quite a bit of 
boot time.  I'd be curious to know how much of an improvement is gained 
by using XIP in an uncompressed kernel without XIP - versus - 
uncompressed kernel _with_ XIP.

I would tend to think the difference is quite small, or OLS wouldn't 
have benchmarked with a compressed kernel against an uncompressed one.  
I think I'll steer clear of XIP for now...

Since we're on the topic, does anyone have any pointers, website links 
or kernel patches that have tips on accelerating kernel boot time?

Thanks!
-CB



David Woodhouse wrote:

>On Tue, 2004-08-24 at 10:43 -0400, Christopher M Bergeron wrote:
>  
>
>>Does anyone know if jffs2 can utilize/support XIP (eXecute In Place)?  
>>I've read that only CramFS can work wit it.  I'm a little unclear about 
>>how XIP works and it's implications with jffs2 / CramFS.
>>Can anyone shed any light on this for me?
>>    
>>
>
>If you want Linux rather than something smaller, like eCos, then you
>almost certainly don't want XIP.
>
>XIP is for obvious reasons mutually exclusive with compression. You
>throw away flash space in order to save RAM and to make data and code
>access by the CPU slower.
>
>Flash is more expensive than RAM -- your board will be cheaper if you
>use half the flash and compress its contents, than it would be if you
>use half the _RAM_ and XIP instead.
>
>If you really really really care about power, then you might care that
>RAM actually takes more power at runtime than flash does. But then we'd
>just laugh at you for using Linux instead of something much smaller and
>in particular without a periodic timer tick :)
>
>In order to use XIP, you muck with the MMU to make mmap() of files on
>the file system actually set up page tables to point at the flash chip.
>You then have to care a lot about leaving the flash chip in read mode at
>all times when userspace might be looking at it. 
>
>Because cramfs is a read-only file system, it's easy enough to do this.
>The files which are marked for XIP are carefully arranged so that each
>logical page is physically page-aligned on the medium to allow the MMU
>to map it. It would be a lot harder to achieve that in JFFS2, and
>largely pointless. 
>
>The only reason for using XIP under Linux which is even vaguely sane is
>to improve boot time. But since the figures shown at OLS were comparing
>apples and oranges -- compressed non-XIP kernel vs. uncompressed XIP
>kernel, with a lot of the time taken being the actual decompression, I'm
>not entirely convinced. There may well be better alternatives, without
>the runtime and hardware overhead.
>
>  
>
