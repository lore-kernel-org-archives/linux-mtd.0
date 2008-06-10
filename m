Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K64O8-0000w3-Mh
	for linux-mtd@lists.infradead.org; Tue, 10 Jun 2008 13:59:53 +0000
Date: Tue, 10 Jun 2008 14:59:51 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Holger Schurig <hs4233@mail.mn-solutions.de>
Subject: Re: CFI-0002 NOR flash blocking CPU on status register reads
Message-ID: <20080610135951.GB31112@shareable.org>
References: <20080610130945.GB28565@shareable.org>
	<200806101548.40059.hs4233@mail.mn-solutions.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200806101548.40059.hs4233@mail.mn-solutions.de>
Cc: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Holger Schurig wrote:
> > Won't the CPU read the initial boot instructions from this
> > flash, get programming status bytes instead of CPU
> > instructions, and thus get confused?
> 
> The bootloader could/should make sure that every block is in the 
> correct state for Linux.

Even the bootloader cannot start, if the flash is not in the correct
programming state - even though bootloader partition is not touched.

(The bootloader instructions are temporarily replaced by garbage while
programming _any_ blocks.)

However, see my other reply.  If the board's reset signal is wired to
the flash, it should force the flash into a suitable state prior to
reading the bootloader.  I have to check if they wired the reset
signal properly: these schematics have too many zero-ohm links which
might be there or not on manufactured boards.

-- Jamie
