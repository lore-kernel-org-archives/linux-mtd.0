Received: from port61.vestas.dk ([195.41.59.61] helo=cotas2.cotas.vestas.dom)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 197spD-0005VS-In
	for <linux-mtd@lists.infradead.org>; Tue, 22 Apr 2003 09:08:23 +0100
From: Esben Nielsen <esn@cotas.dk>
To: <tglx@linutronix.de>,
 =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>,
 "Jasmine Strong" <jasmine@regolith.co.uk>
Date: Tue, 22 Apr 2003 10:07:59 +0200
References: <200304161335.50367.tglx@linutronix.de>
In-Reply-To: <200304161335.50367.tglx@linutronix.de>
MIME-Version: 1.0
Message-Id: <200304221007.59780.esn@cotas.dk>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: Holger Schurig <h.schurig@mn-logistik.de>
cc: linux-mtd@lists.infradead.org
Subject: Re: Database on JFFS2?
Reply-To: esn@cotas.dk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 16 April 2003 13:35, Thomas Gleixner wrote:
> [...]
> On Wednesday 16 April 2003 12:04, Esben Nielsen wrote:
> > I am not much into flash technology itself (NOR contra NAND), but I know
> > that on our device one write erases and rewrites one block of 128k. Each
> > block can only be erased between 1E5 and 1E6 times. We thus have to be
> > carefull as our device have to live for 20 years (yes, that is what a
> > promise our customers!).
>
> Erase is always a full block (e.g. 128K), but writes happen in small
> chunks.
>

Ah! Now I get it: You have erase a block as a whole and then you can write 
parts of it until it is full? I always believed you had to write a full block 
just to write a single byte, but this does make much more sense to me. We 
have been through similar discussions with TFFS under vxWorks where we 
couldn't find out how many times we were actually allowed to write.

> [...]
>
> JFSS2 does no write on fsync, as data are already written.

Doesn't Linux per default for any filesystem hold a write cache which needs to 
be flushed with fsync()?

Esben
