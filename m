Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CfG0A-0003tc-Kl
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2004 06:10:27 -0500
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Date: Fri, 17 Dec 2004 12:10:20 +0100
Message-ID: <JPEALJAFNGDDLOPNDIEEIEHDCPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.58.0412171053080.8020@phoenix.infradead.org>
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

> 
> > Another idea, calculate the CRC backwards(from the end of the buffer to the beginning).
> > That give better L1 cache behaviour.
> >
> Why (may be some URL)? For all archs? 

example, when writing a buffer to flash you first CRC it from top to bottom.
The bottom part of the buffer is then newer than the top of then buffer in the
L1 cache or the top part has already been evicted from the L1 cache depending
of the size of the buffer and size of L1 cache.

Now you start again from the top of the buffer to actually write the buffer
to flash and you probaly need to read the data from RAM into L1 cache again.

Reading from flash will cause similar effects.

If you calculate CRC backwards you will avoid trashing the cache needlessly.

 Jocke
