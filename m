Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195krX-0004WM-GN
	for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2003 12:13:59 +0100
Date: Wed, 16 Apr 2003 13:13:53 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20030416111353.GE25858@wohnheim.fh-wedel.de>
References: <20030415171123.GH7721@wohnheim.fh-wedel.de>
	<200304161204.32557.esn@cotas.dk> <200304161335.50367.tglx@linutronix.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200304161335.50367.tglx@linutronix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: Holger Schurig <h.schurig@mn-logistik.de>
cc: linux-mtd@lists.infradead.org
cc: esn@cotas.dk
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

On Wed, 16 April 2003 13:35:50 +0200, Thomas Gleixner wrote:
> [lots of good information]
> 
> JFSS2 does no write on fsync, as data are already written.

This is true for NOR, but how about the wbuf for NAND? How does that
respond to sync/fsync?
iirc it used to ignore sync completely so people could potentially get
into trouble if they write-sync-poweroff with <2s between write and
poweroff.

Jörn

-- 
With a PC, I always felt limited by the software available. On Unix, 
I am limited only by my knowledge.
-- Peter J. Schoenster
