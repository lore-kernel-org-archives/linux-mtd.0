Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CfG9W-00049z-6i
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2004 06:20:07 -0500
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>, <jasmine@linuxgrrls.org>
Date: Fri, 17 Dec 2004 12:19:55 +0100
Message-ID: <JPEALJAFNGDDLOPNDIEEEEHECPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.58.0412171100470.8020@phoenix.infradead.org>
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

> On Fri, 17 Dec 2004 jasmine@linuxgrrls.org wrote:
> 
> > 
> > 
> > On Fri, 17 Dec 2004, Artem B. Bityuckiy wrote:
> > 
> > >> Another idea, calculate the CRC backwards(from the end of the buffer to the beginning).
> > >> That give better L1 cache behaviour.
> > >>
> > > Why (may be some URL)? For all archs?
> > 
> > Because the process to use the buffer after the CRC will probably start 
> > from the beginning.  Processing the CRC from the beginning to the end will 
> > tend to leave the L1 cache full of the end of the buffer and thus the next 
> > process to use it will need to reload the L1.
> > 
> > -J.
> > 
> Ok, I got it, thanks.

I wish I read all new messages before I anwer so I don't answer when someone else already has :(

Looked a little closer on csum_partial and I think JFFS3 can use it. You need
csum_fold as well:
seed = ~0;
crc = csum_fold(csum_partial(buff, len, seed));

Don't know if it is good enough for JFFS3 but it is fast.

 Jocke
