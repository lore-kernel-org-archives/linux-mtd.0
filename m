Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Ch9Cs-0001ai-N1
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 11:19:26 -0500
Date: Wed, 22 Dec 2004 17:19:08 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: jasmine@linuxgrrls.org
Message-ID: <20041222161908.GD9783@wohnheim.fh-wedel.de>
References: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.61.0412221553470.15289@hex.linuxgrrls.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.61.0412221553470.15289@hex.linuxgrrls.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 22 December 2004 15:59:46 +0000, jasmine@linuxgrrls.org wrote:
> On Wed, 22 Dec 2004, Joakim Tjernlund wrote:
> [going backwards]
> >Prefetching may work well for some archs, but for low end embedded CPUs
> >I am not so sure. You will probably need to add arch specific code also to
> >do prefetching.
> 
> This is nothing to do with prefetching.

Maybe we could do both?  Adding a prefetch now and then inside the
loop, using <linux/prefetch.h> may help as well.

> Imagine you have three functions, a(), b() and c().  They all
> work through a block of data D[] which is of a size >> cache size.
> 
> a() runs, loading data into cache as it works through the data.
> At the end of a()'s run, the cache predominantly contains data from
> the end of D[], because that was the last part to be accessed.
> 
> b() then runs, and needs data from the start of D[], so the cache
> discards all the lines it loaded for a() and reloads them.  At the
> end of b()'s runm the cache predominantly contains data from the
> last part of D[], again, because that was the last part to be accessed.
> 
> c() finally runs, needs the start of D[].  The cache dumps all those
> lines once more and reloads them again.
> 
> 
> Now:  what happens if b() starts from the end of D[]?  You save a little 
> time because the data b() needs to start with is already in cache.  And 
> you save a little more because at the end of b(), the cache is full of the 
> start of D[], so c() is ready to run.
> 
> Does this clarify?

Sure does.  Actually, your earlier mail already did.  Very simple
concept, yet totally new to me.  Thanks!

Jörn

-- 
"Error protection by error detection and correction."
-- from a university class
