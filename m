Received: from linuxgrrls.org ([212.18.228.66] helo=mail.linuxgrrls.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Ch8uv-0000sd-ST
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 11:00:51 -0500
Date: Wed, 22 Dec 2004 15:59:46 +0000 (GMT)
From: jasmine@linuxgrrls.org
To: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
In-Reply-To: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>
Message-ID: <Pine.LNX.4.61.0412221553470.15289@hex.linuxgrrls.org>
References: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: RE: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Wed, 22 Dec 2004, Joakim Tjernlund wrote:

[going backwards]
> Prefetching may work well for some archs, but for low end embedded CPUs
> I am not so sure. You will probably need to add arch specific code also to
> do prefetching.

This is nothing to do with prefetching.

Imagine you have three functions, a(), b() and c().  They all
work through a block of data D[] which is of a size >> cache size.

a() runs, loading data into cache as it works through the data.
At the end of a()'s run, the cache predominantly contains data from
the end of D[], because that was the last part to be accessed.

b() then runs, and needs data from the start of D[], so the cache
discards all the lines it loaded for a() and reloads them.  At the
end of b()'s runm the cache predominantly contains data from the
last part of D[], again, because that was the last part to be accessed.

c() finally runs, needs the start of D[].  The cache dumps all those
lines once more and reloads them again.


Now:  what happens if b() starts from the end of D[]?  You save a little 
time because the data b() needs to start with is already in cache.  And 
you save a little more because at the end of b(), the cache is full of the 
start of D[], so c() is ready to run.

Does this clarify?

-J.
