From: David Woodhouse <dwmw2@infradead.org>
To: Per Hedblom <per.hedblom@abem.se>
In-Reply-To: <20041111155005.D5E253800A@smtp1-2-sn3.vrr.skanova.net>
References: <20041111155005.D5E253800A@smtp1-2-sn3.vrr.skanova.net>
Content-Type: text/plain
Message-Id: <1100188953.8191.1422.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 11 Nov 2004 16:02:33 +0000
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: RE: [JFFS2] GC patch for eCos port
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-11-11 at 16:50 +0100, Per Hedblom wrote:
> > Can you elaborate? I've seen very few patches submitted, and from that
> > I've inferred that we've been doing a good job of keeping the eCos port
> > working.
>  
> That's true, but I am afraid that jffs2 has not been stressed and tested
> enough in eCos. We have spent a lot of time without finding serious bugs
> like this and I don't expect it to be stable yet.

True. But please do keep reporting them. It shouldn't be hard to keep
the eCos port working, assuming the core code is OK. The glue layer to
plug it into the operating system code isn't the hard part.

> Just wanted to give everybody an honest hint on memory usage and that eCos
> users should use the pool implementation and I think that an updated ecos
> implementation should include a fully pool supported memory management. 

Yeah. We already have something like that in the Linux version, with the
slab caches for different objects. It's still dynamic though, because we
can allocate more slab pages at runtime; it's not a fixed pool.

> I have seen the skeleton but think I need some more guidance about how to
> protect file operations and the gc operations from each other (what kind of
> locking is needed?) before I give it a try.

No locking is required for that purpose. Look at fs/jffs2/background.c
in my CVS tree -- the Linux implementation of the background thread. The
only locking there is to synchronise starting and killing the thread.

-- 
dwmw2
