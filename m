Date: Wed, 22 Dec 2004 16:21:34 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: jasmine@linuxgrrls.org
In-Reply-To: <Pine.LNX.4.61.0412221553470.15289@hex.linuxgrrls.org>
Message-ID: <Pine.LNX.4.58.0412221620430.30689@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.61.0412221553470.15289@hex.linuxgrrls.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Subject: RE: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

IMHO he understood that - you have already kindly explained. He just meant 
that he would like to measure the benefit from passing data from different 
ends...

jasmine@linuxgrrls.org wrote:
> This is nothing to do with prefetching.
> 
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
> you save a little more because at the end of b(), the cache is full of 
> the start of D[], so c() is ready to run.
> 
> Does this clarify?
> 
> -J.
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
