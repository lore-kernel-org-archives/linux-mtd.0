Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Ch8iA-0000MV-VW
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 10:47:40 -0500
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "Artem Bityuckiy" <dedekind@infradead.org>
Date: Wed, 22 Dec 2004 16:47:33 +0100
Message-ID: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.58.0412221537350.30689@phoenix.infradead.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: RE: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > Hi again
> > 
> > Can you do
> > 1) First run a forward and then a backward version on memory space >= 
> 2*L1 cache
> > 2) Then do two forward runs on the same memory.
> > 
> > Compare the delta between 1) and 2)
> > That should give a clue if it is worth having a backward version.
> We may do this, but frankly speaking I don't understand the goal. IMHO, we 
> believe that backward checking is better providing things with prefetching 
> is equivalent. So, IMHO, we just need to grasp with prefetching issues...

Prefetching may work well for some archs, but for low end embedded CPUs
I am not so sure. You will probably need to add arch specific code also to
do prefetching. 

> 
> > 
> > Have you look at the assembler Engler32 generates? Every instruction 
> counts
> > in such small loops.
> Which arch?

Any arch, the ones you have. All the other checksums has been optimized very
carefully over time. Engler32 is brand new and there is probably room for some
improvement.

> 
> > PS.
> >  I am levaing for Christmas in 2 hours and will be offline more or less 
> until January
> >  so I guess I won't be much help in the near future.
> Ok, we may continue discusssing on Jan :-)

Yep, I may get E-mail access were I am going so maybe I can do something.
