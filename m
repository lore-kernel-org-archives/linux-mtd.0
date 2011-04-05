Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q79Z0-00072Z-Oj
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 16:57:11 +0000
Received: by eyh6 with SMTP id 6so198541eyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Apr 2011 09:57:08 -0700 (PDT)
Subject: Re: [PATCH v2] MTD: Retry Read/Write Transfer Buffer Allocations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Grant Erickson <marathon96@gmail.com>
In-Reply-To: <C9C08930.27733%marathon96@gmail.com>
References: <C9C08930.27733%marathon96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 Apr 2011 19:54:27 +0300
Message-ID: <1302022467.2760.154.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-04-05 at 08:54 -0700, Grant Erickson wrote:
> Artem:
> 
> Thanks for the quick turnaround in feedback. Please see inline below.
> 
> On 4/4/11 9:39 PM, Artem Bityutskiy wrote:
> > On Mon, 2011-04-04 at 11:19 -0700, Grant Erickson wrote:
> >> + * is highly fragmented at the cost of reducing the performance of the
> >> + * requested transfer due to a smaller buffer size.
> >> + *
> >> + * A more complex but more memory-efficient implementation based on
> >> + * get_user_pages and iovecs to cover extents of those pages is a
> >> + * longer-term goal, as intimated by Linus above. However, for the
> >> + * write case, this requires yet more complex head and tail transfer
> >> + * handling when those head and tail offsets and sizes are such that
> >> + * alignment requirements are not met in the NAND subdriver.
> >> + */
> >>  #define MAX_KMALLOC_SIZE 0x20000
> >>  
> >> +static void *mtd_try_alloc(size_t *size)
> >> +{
> >> + const gfp_t flags = (GFP_KERNEL | __GFP_NOWARN);
> > 
> > I still think you'll damage the performance when you try to do
> > 
> > kmalloc(128KiB, flags)
> > 
> > because as I wrote in my previous e-mail your system will start doing
> > the following to free memory for you:
> > 
> > 1. write-back dirty FS data = overall slowdown = e.g., background mp3
> >    playback glitches
> > 2. drop FS caches = slow down later because the system will have to
> >    re-read the dropped data from the media later.
> > 3. not really sure, needs checking if this is the case, but I think
> >    the kernel may start swapping out apps.
> > 
> > This is why I suggested to use the following flags here:
> > 
> > gfp_t flags = __GFP_NOWARN | __GFP_WAIT | __GFP_NORETRY;
> 
> On my system (64 MiB RAM, 256 MiB Flash), there is no swap and under these
> allocation conditions for jffs2_scan_medium, mtd_read or mtd_write, I don't
> see the kernel doing (1), (2) or (3).

Well, the code is complex and not easy to follow if you do not know it.
But I navigated it to the 'do_try_to_free_pages()' function. This
function can be called by kmalloc(), and it does some of the things I
described. And yes, kmalloc() may cause kswapd to wake up and start
swapping, I can see it in '__alloc_pages_slowpath()'. To prevent this we
need __GFP_NO_KSWAPD flag which I suggest you to also add.

> My impression is that the above behaviors are only activated when a swap
> store exists and, in general, most systems using JFFS2 and MTD do not have
> swap.

Well, most but not all, I worked with one with swap (N900 phone).

> Regardless, adding the additional flags should not be detrimental for
> systems with no swap and, it sounds like, helpful for systems with it.

OK. But things 1 and 2 which I described are relevant for non-swap
systems anyway. Dunno why you did not observe them, probably you did not
have high enough memory pressure and your flusher threads and other
things kept the memory within limits (there are watermarks which cause
background processes to start and free RAM if you cross them).

> Regarding the suggestion of mtd_alloc_upto() or mtd_alloc_as_much(), are you
> OK exporting these from mtdchar.c or would you rather they be moved to and
> exported from mtdcore.c?

I guess mtdcore is better place.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
