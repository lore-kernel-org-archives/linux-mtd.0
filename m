Date: Wed, 22 Dec 2004 15:37:48 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
In-Reply-To: <JPEALJAFNGDDLOPNDIEEGEKICPAA.joakim.tjernlund@lumentis.se>
Message-ID: <Pine.LNX.4.58.0412221537350.30689@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEGEKICPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
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

> Hi again
> 
> Can you do
> 1) First run a forward and then a backward version on memory space >= 
2*L1 cache
> 2) Then do two forward runs on the same memory.
> 
> Compare the delta between 1) and 2)
> That should give a clue if it is worth having a backward version.
We may do this, but frankly speaking I don't understand the goal. IMHO, we 
believe that backward checking is better providing things with prefetching 
is equivalent. So, IMHO, we just need to grasp with prefetching issues...

> 
> Have you look at the assembler Engler32 generates? Every instruction 
counts
> in such small loops.
Which arch?

> PS.
>  I am levaing for Christmas in 2 hours and will be offline more or less 
until January
>  so I guess I won't be much help in the near future.
Ok, we may continue discusssing on Jan :-)

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
