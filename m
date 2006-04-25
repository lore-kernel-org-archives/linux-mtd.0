Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FYNu5-0002TO-7P
	for linux-mtd@lists.infradead.org; Tue, 25 Apr 2006 09:48:38 -0400
Date: Tue, 25 Apr 2006 15:48:22 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20060425134822.GC3781@wohnheim.fh-wedel.de>
References: <20060424161529.GR7570@earth.li>
	<1145972592.11909.392.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1145972592.11909.392.camel@pmac.infradead.org>
Cc: Jonathan McDowell <noodles@earth.li>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] Add Amstrad Delta NAND support.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 25 April 2006 14:43:12 +0100, David Woodhouse wrote:
> 
> > +/*
> > + * These 3 functions are basically identical to the ones in nand_base.c, but
> > + * we have to call our read_byte/write_byte functions instead of readb/writeb
> > + * directly. I submitted a patch to MTD to move this to nand_base.c, but it
> > + * was deemed too intrusive.
> > + */
> 
> Thomas' decision, I assume? I think he's right -- this way it can be
> inlined in the loop rather than being a real function call for every
> byte.

We could have a nand_read_byte()/nand_write_byte() pair of macros that
are defined to readb/writeb for the generic case and to
read_byte/write_byte for CONFIG_FIND_SOME_SANE_NAME.

Jörn

-- 
My second remark is that our intellectual powers are rather geared to
master static relations and that our powers to visualize processes
evolving in time are relatively poorly developed.
-- Edsger W. Dijkstra
