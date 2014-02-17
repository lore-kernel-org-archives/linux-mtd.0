Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFM7f-00024N-87
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2014 11:12:28 +0000
Date: Mon, 17 Feb 2014 08:11:14 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v6 0/3] ubi: Add block interface
Message-ID: <20140217111113.GA21782@localhost>
References: <1392581041-8099-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392632392.12215.125.camel@sauron.fi.intel.com>
 <20140217104830.GA21761@localhost>
 <1392634420.12215.154.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1392634420.12215.154.camel@sauron.fi.intel.com>
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

On Mon, Feb 17, 2014 at 12:53:40PM +0200, Artem Bityutskiy wrote:
> On Mon, 2014-02-17 at 07:48 -0300, Ezequiel Garcia wrote:
> > On Mon, Feb 17, 2014 at 12:19:52PM +0200, Artem Bityutskiy wrote:
> > > Thanks!
> > > 
> > > On Sun, 2014-02-16 at 17:03 -0300, Ezequiel Garcia wrote:
> > > > The main target of this patch is supporting lighter, read-only
> > > > filesystem,
> > > > by putting a squashfs on top of ubiblock. And since squashfs already
> > > > provides
> > > > a file cache (which is even configurable), a first uncached
> > > > implementation
> > > > it's good enough for now.
> > > 
> > > Doesn't Linux provide a fake inode for _every_ block device, and uses
> > > page-cache to cache pages?
> > > 
> > > There is even entire special-purpose file-system for managing these fake
> > > block device inodes, see fs/block_dev.c
> > > 
> > > static struct file_system_type bd_type = {
> > >         .name           = "bdev",
> > >         .mount          = bd_mount,
> > >         .kill_sb        = kill_anon_super,
> > > };
> > > 
> > > I am really not sure which other cache do we need. The only thing coming
> > > to my mind is about emulating a HW disk cache in software. But I would
> > > not go that far without a really good reason.
> > > 
> > 
> > If we ever re-add the write support, it would be natural to implement it
> > using a 1-LEB cache. Block sectors are much much smaller than LEB's
> > (around three orders of magnitude), so we would want to read an entire
> > LEB into a 1-LEB buffer, update the buffer, and then write it back.
> > 
> > In this scheme, it's almost straightforward to keep this buffer around
> > as a cache, and only write-back to disk when the new read/write requests
> > asks for a different LEB.
> > 
> > IIRC, this is the main reason why we had the 1-LEB cache.
> 
> May be. But you are submitting R/O driver. And yet talk about caches and
> write support in several places. Caches are only relevant to write
> support. Write support is absent. Let's focus on what is present.
> 
> Feel free to put all the thoughts about a possible write support
> implementation to a single big comment in the code. That's fine. I do
> not object. I just want to focus on what is present.
> 

Totally agreed. Those comments were just a product of my own inertia.

If at all possible, take a look at the website doc and I'll push a new
round soon.

Thanks for the review,
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
