Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 197t4V-0005f8-4R
	for <linux-mtd@lists.infradead.org>; Tue, 22 Apr 2003 09:24:11 +0100
Date: Tue, 22 Apr 2003 10:24:07 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Esben Nielsen <esn@cotas.dk>
Message-ID: <20030422082407.GA13335@wohnheim.fh-wedel.de>
References: <200304161335.50367.tglx@linutronix.de>
	<200304221007.59780.esn@cotas.dk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200304221007.59780.esn@cotas.dk>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: Holger Schurig <h.schurig@mn-logistik.de>
cc: tglx@linutronix.de
cc: linux-mtd@lists.infradead.org
cc: Jasmine Strong <jasmine@regolith.co.uk>
Subject: Re: Database on JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 22 April 2003 10:07:59 +0200, Esben Nielsen wrote:
> On Wednesday 16 April 2003 13:35, Thomas Gleixner wrote:
> >
> > Erase is always a full block (e.g. 128K), but writes happen in small
> > chunks.
> 
> Ah! Now I get it: You have erase a block as a whole and then you can write 
> parts of it until it is full? I always believed you had to write a full block 
> just to write a single byte, but this does make much more sense to me. We 
> have been through similar discussions with TFFS under vxWorks where we 
> couldn't find out how many times we were actually allowed to write.

:)

> > JFSS2 does no write on fsync, as data are already written.
> 
> Doesn't Linux per default for any filesystem hold a write cache which needs to 
> be flushed with fsync()?

Linux is designed for disk io, it holds a buffer cache that is flushed
to disk as a whole on sync, for any mount point on umount and for any
file on fsync. Sync also happens regularly every 30s.

With flash, many things are different. Latency is very small, compared
to disks, and it doesn't (usually) make sense to hold any writes back
from the medium. No cache -> no need for (f)sync.

The cache came back with NAND flash, but you don't use it and don't
need to worry about it.

Jörn

-- 
Write programs that do one thing and do it well. Write programs to work
together. Write programs to handle text streams, because that is a
universal interface. 
-- Doug MacIlroy
