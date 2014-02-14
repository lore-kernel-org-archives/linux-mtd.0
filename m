Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEG27-0004aC-W3
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2014 10:30:12 +0000
Date: Fri, 14 Feb 2014 07:29:32 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v5 0/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140214102931.GA19307@localhost>
References: <1392321426-18256-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392365505.12215.38.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1392365505.12215.38.camel@sauron.fi.intel.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 14, 2014 at 10:11:45AM +0200, Artem Bityutskiy wrote:
> Thanks Ezequiel,
> 

No problem. Thanks for reviewing, I know you're very busy these days.

> On Thu, 2014-02-13 at 16:57 -0300, Ezequiel Garcia wrote:
> > As soon as this gets merged into UBI kernel core, I'll submit the mtd-utils
> > userspace tools, as well as start preparing some documentation for the mtd
> > website, and the docbook.
> 
> Ideally the docs should come along with the driver.
> 

OK.

> > I'd be willing to drop read-support is that makes this feature acceptable;
> > but I guess that would make it pretty useless :-)
> 
> Well, it was your decision.
> 

Of course.

> I only asked to remove the compile-time option. And if there are
> limitations, document them.
> 
> I pointed that there is a standard 'blkdev' tool which has '--setro' and
> '--setrw' options, and you could try to use that for _run-time_ RO/RW
> toggling.
> 

Hm... yes. I just forgot to write it here. The commit log in the patch
mentions it (BLKROSET ioctl). I think it's good idea.

> >   * Dropped write-support
> 
> Fine with me too, thanks, but please, do not allude you was pushed to do
> this.
>

Oh, I don't feel pushed. Sorry if it sounded like that.

The idea was to re-submit with the minimum set of features we all seemed to
agree. Write support can be added (and probably will be), your suggestion
is probably a good idea.

> >   * Dropped cached access
> 
> Thanks. This little tiny compile options make more harm than benefit.
> They break from time, because people usually use one of the
> configurations, and rarely test the changed.
> 

Fair enough.

> If you want to save people 128KiB of ram or something, do it a better
> way. For example, we have memory shrinker in the kernel. Register your
> your shrinker and free that buffer in case of memory pressure. Allocate
> it back if needed later using "gentle" allocation techniques (NORETRY,
> NOFS, etc).
> 

Ah, good. I was trying to find something like this. I also thought about
a custom block ioctl. But this sounds better.

I'll try to cook up a v6, with the docs.

I'd rather not add write-support or cache *now*. Uncached, read-only
is enough for now to support squashfs rootfs, which is something people
ask about from time to time, I think.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
