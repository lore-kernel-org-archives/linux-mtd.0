Date: Fri, 17 Dec 2004 11:20:58 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
In-Reply-To: <JPEALJAFNGDDLOPNDIEEIEHDCPAA.joakim.tjernlund@lumentis.se>
Message-ID: <Pine.LNX.4.58.0412171119290.8020@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEIEHDCPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
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

On Fri, 17 Dec 2004, Joakim Tjernlund wrote:

> > 
> > > Another idea, calculate the CRC backwards(from the end of the buffer to the beginning).
> > > That give better L1 cache behaviour.
> > >
> > Why (may be some URL)? For all archs? 
> 
> example, when writing a buffer to flash you first CRC it from top to bottom.
> The bottom part of the buffer is then newer than the top of then buffer in the
> L1 cache or the top part has already been evicted from the L1 cache depending
> of the size of the buffer and size of L1 cache.
> 
> Now you start again from the top of the buffer to actually write the buffer
> to flash and you probaly need to read the data from RAM into L1 cache again.
> 
> Reading from flash will cause similar effects.
> 
> If you calculate CRC backwards you will avoid trashing the cache needlessly.
> 
>  Jocke
> 
Ok, thanks, good idea, I'll put it to the TODO file too.
 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
