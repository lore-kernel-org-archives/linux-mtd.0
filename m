Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Al9R6-0001JU-Fx
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2004 16:18:04 +0000
To: David Woodhouse <dwmw2@infradead.org>
References: <m3u12jr8y4.fsf@maxwell.lnxi.com>
	<1075099329.17157.97.camel@lapdancer.baythorne.internal>
	<m3bror89u9.fsf@maxwell.lnxi.com>
	<1075102799.17157.209.camel@lapdancer.baythorne.internal>
	<m3brorf4hg.fsf@maxwell.lnxi.com>
	<1075109506.19924.45.camel@imladris.demon.co.uk>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 26 Jan 2004 09:20:04 -0700
In-Reply-To: <1075109506.19924.45.camel@imladris.demon.co.uk>
Message-ID: <m3ektmbs23.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: Q: Filesystem choice..
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse <dwmw2@infradead.org> writes:

> On Mon, 2004-01-26 at 02:23 -0700, Eric W. Biederman wrote:
> 
> Fix up some other assumptions about the first byte in any given page
> also being the first byte in a node, and fix up the garbage-collection
> which will need to have enough workspace to decompress and recompress
> the largest block it may encounter, and it should work.

Cool.  Then if it comes up I will look.
 
> > My real question here is how difficult is it to disable compression?
> > Or can compression be deliberately disabled on a per file basis?
> 
> It's not too hard. To disable it completely you just need to change a
> few #defines in os-linux.h. The support for disabling it on a per-file
> basis isn't complete, but there are flags allocated in the inode
> structure to keep track of it.

Nice.
 
> > I have a truly perverse case I would like to ask your opinion about.
> > A filesystem composed of 2 8K erase blocks?  That is one of the
> > weird special cases that flash chips often support.  I could
> > only store my parameter file in there but it would be interesting.
> 
> To be honest, at that size I'd just do it directly via /dev/mtd0. Put
> the file directly on the flash with a checksum. Alternate between the
> eraseblocks each time it changes, then erase the old copy.

Right that would work, and I might do that.  If could put a fs in
there I get some extensibility benefits.  As well as being able to
write a couple copies of my small file before I switch to the next
erase block.  The extensibility is that other pieces of firmware
could have their own files of settings, decoupling things a little bit.

If I could get the degenerate case to work without needing gross hacks
jffs2 would have scaled down to a useful level.

Primarily I am interested in not reinventing if I can, and it looks
like that may be a possibility.

> > And a last question. jffs2 rounds all erase blocks up to a common size
> > doesn't it?
> 
> Yes.

Thanks for information.

I'm not quite certain where I will go with this but it has made
where the trade offs pretty clear.

Eric
