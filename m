Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CAaj8-0002an-PD
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2004 17:02:08 -0400
Date: Thu, 23 Sep 2004 22:01:50 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
Message-ID: <20040923210150.GF25491@home.fluff.org>
References: <20040920234450.GA17169@home.fluff.org>
	<m3brfxycuf.fsf@maxwell.lnxi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m3brfxycuf.fsf@maxwell.lnxi.com>
Sender: Ben Dooks <ben@fluff.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Fix to jedec_probe unlock addresses
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 22, 2004 at 07:48:40PM -0600, Eric W. Biederman wrote:
> Ben Dooks <ben-mtd@fluff.org> writes:
> 
> > Fix unlock address calculation for non-x8 chips for the
> > cfi cmdset code, which assumes always X8
> > 
> > Patch against 2.6.9-rc2 with 19th September CVS
> > 
> > Signed-off-by: Ben Dooks <ben-mtd@fluff.org>
> > 
> > --- linux-2.6.9-rc2-bk6-mtd20040919/drivers/mtd/chips/jedec_probe.c 2004-09-20
> > 13:02:46.000000000 +0100
> > 
> > +++ linux-2.6.9-rc2-bk6-mtd20040919-work/drivers/mtd/chips/jedec_probe.c
> > 2004-09-20 23:21:40.000000000 +0100
> > 
> > @@ -2046,7 +2046,15 @@
> >  	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
> >  	       map->name, cfi_interleave(cfi), cfi->device_type*8, base, 
> >  	       map->bankwidth*8);
> > -	
> > +
> > +	/* fixup unlock addresses for the cmdset */
> > +
> > +	cfi->addr_unlock1 *= cfi_interleave(cfi) * cfi->device_type;
> > +	cfi->addr_unlock2 *= cfi_interleave(cfi) * cfi->device_type;
> > +
> > +	printk(KERN_DEBUG "unlocks at %08x,%08x\n", 
> > +	       cfi->addr_unlock1, cfi->addr_unlock2);
> > +
> >  	return 1;
> >  }
> 
> Hmm.  I think that points out a real issue but I think the bug actually
> lies in cfi_cmdset_0002.  
> 
> That fix makes below comment from cfi_cmdset_0002 clearly wrong.
> 	/*
> 	 * The CFI_DEVICETYPE_X8 argument is needed even when
> 	 * cfi->device_type != CFI_DEVICETYPE_X8.  The addresses for
> 	 * command sequences don't scale even when the device is
> 	 * wider.  This is the case for many of the cfi_send_gen_cmd()
> 	 * below.  I'm not sure, however, why some use
> 	 * cfi->device_type.
> 	 */

[snip]
 
> Does anyone have cfi cmdset 0002 devices in an interleaved configuration
> who would care to comment?

I took the jedec_probe alterations as I was unsure wether I was going
to damage anything else by changing the cfi cmdset 0002 code.

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
