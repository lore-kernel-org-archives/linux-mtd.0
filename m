Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikukk.artecdesign.ee)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H1le0-00015I-52
	for linux-mtd@lists.infradead.org; Tue, 02 Jan 2007 10:33:44 -0500
Date: Tue, 2 Jan 2007 17:35:21 +0200
From: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: [PATCH] [MTD] cs553x_nand.c: support partitions;
	cs553x_cleanup() fix
Message-Id: <20070102173521.ac8f2e7c.indrek.kruusa@artecdesign.ee>
In-Reply-To: <1167748858.3836.7.camel@zod.rchland.ibm.com>
References: <20070102162144.52a71884.indrek.kruusa@artecdesign.ee>
	<1167748858.3836.7.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 02 Jan 2007 08:40:58 -0600
Josh Boyer <jwboyer@linux.vnet.ibm.com> wrote:

> On Tue, 2007-01-02 at 16:21 +0200, Indrek Kruusa wrote:
> > Hi!
> > 
> > Patch for drivers/mtd/nand/cs553x_nand.c:
> > - support partitions
> > - cs553x_cleanup(): try the cleanup for all chip selects
> 
> Some small nit picks.
> 
> > 
> > Signed-off-by: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
> > 
> > 
> > --- cs553x_nand.c_git	2007-01-02 15:13:06.000000000 +0200
> > +++ cs553x_nand.c	2007-01-02 15:45:38.000000000 +0200
> 
> Patches should have a strip level of 1.


Oh my, sure. I will resend the patch.

> 
> > @@ -273,12 +273,21 @@
> >  	return 0;
> >  }
> > 
> > +
> > +#ifdef CONFIG_MTD_PARTITIONS
> > +const char *part_probes[] = { "cmdlinepart", NULL };
> > +#endif
> > +
> > +
> >  static int __init cs553x_init(void)
> >  {
> >  	int err = -ENXIO;
> >  	int i;
> >  	uint64_t val;
> > 
> > +	int mtd_parts_nb = 0;
> > +	struct mtd_partition *mtd_parts = 0;
> 
> Pointers should be initialized with NULL.  Otherwise sparse will
> complain.


Noted.

> 
> > +
> >  	/* If the CPU isn't a Geode GX or LX, abort */
> >  	if (!is_geode())
> >  		return -ENXIO;
> > @@ -307,9 +316,20 @@
> >  	   do mtdconcat etc. if we want to. */
> >  	for (i = 0; i < NR_CS553X_CONTROLLERS; i++) {
> >  		if (cs553x_mtd[i]) {
> > -			add_mtd_device(cs553x_mtd[i]);
> > 
> >  			/* If any devices registered, return success. Else the last error. */
> > +#ifdef CONFIG_MTD_PARTITIONS
> > +			cs553x_mtd[i]->name = "cs553x_nand";
> 
> You assign the same name to all the devices?


Yes... haven't worried about that too much (I have only one NAND chip in use ;)). Will investigate what and why needs to be done.


thanks,
Indrek
