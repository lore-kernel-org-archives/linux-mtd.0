Received: from av1-2-sn3.vrr.skanova.net ([81.228.9.106])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CSHD6-00061n-1b
	for linux-mtd@lists.infradead.org; Thu, 11 Nov 2004 10:50:10 -0500
From: "Per Hedblom" <per.hedblom@abem.se>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Date: Thu, 11 Nov 2004 16:50:03 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1100181523.8191.1410.camel@hades.cambridge.redhat.com>
Message-Id: <20041111155005.D5E253800A@smtp1-2-sn3.vrr.skanova.net>
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

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: Thursday, November 11, 2004 2:59 PM

Thank you for your explanation. We will rerun our tests.

> Can you elaborate? I've seen very few patches submitted, and from that
> I've inferred that we've been doing a good job of keeping the eCos port
> working.
 
That's true, but I am afraid that jffs2 has not been stressed and tested
enough in eCos. We have spent a lot of time without finding serious bugs
like this and I don't expect it to be stable yet.

> 
> > * it uses a lot of memory and memory management - a eCos system without
> > memory management needs fixed memory pools to run stable for a long
> time.
> > We use a lot of small files and if someone is considering jffs2 for a
> new
> > design I would recommend reserving a ram space for jffs2 that is in the
> > range of the flash area in use.
> 
> Yeah. That's sort of inherent to the design, unfortunately. We're toying
> with ways to improve it, but it's hard.
> 
Just wanted to give everybody an honest hint on memory usage and that eCos
users should use the pool implementation and I think that an updated ecos
implementation should include a fully pool supported memory management. We
currently runs the system with dynamic allocation to find out how may blocks
of different types that we need and then use this data to initialize a
static pool. 

> > * it doesn't do gc as a thread in eCos. This means that it almost always
> > want to do gc at the time when you need to write data.
> 
> People have reported this a few times. Each time I replied that it was
> easy for them to make it work if they care, and if they know how to do
> this stuff in eCos. Nobody did, so I even threw in the skeleton
> gcthread.c for eCos to give people a head-start.... and still nobody's
> implemented it.
> 

I have seen the skeleton but think I need some more guidance about how to
protect file operations and the gc operations from each other (what kind of
locking is needed?) before I give it a try.

Tanks,
Per Hedblom
