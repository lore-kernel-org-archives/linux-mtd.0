Date: Fri, 17 Dec 2004 11:01:07 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: jasmine@linuxgrrls.org
In-Reply-To: <Pine.LNX.4.61.0412171045400.11077@hex.linuxgrrls.org>
Message-ID: <Pine.LNX.4.58.0412171100470.8020@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEGEHCCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412171053080.8020@phoenix.infradead.org>
	<Pine.LNX.4.61.0412171045400.11077@hex.linuxgrrls.org>
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

On Fri, 17 Dec 2004 jasmine@linuxgrrls.org wrote:

> 
> 
> On Fri, 17 Dec 2004, Artem B. Bityuckiy wrote:
> 
> >> Another idea, calculate the CRC backwards(from the end of the buffer to the beginning).
> >> That give better L1 cache behaviour.
> >>
> > Why (may be some URL)? For all archs?
> 
> Because the process to use the buffer after the CRC will probably start 
> from the beginning.  Processing the CRC from the beginning to the end will 
> tend to leave the L1 cache full of the end of the buffer and thus the next 
> process to use it will need to reload the L1.
> 
> -J.
> 
Ok, I got it, thanks.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
