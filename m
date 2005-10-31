Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EWbWN-0006gm-Lx
	for linux-mtd@lists.infradead.org; Mon, 31 Oct 2005 10:24:37 -0500
Date: Mon, 31 Oct 2005 16:24:30 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "pierre.ricadat@utbm.fr" <Pierre.Ricadat@utbm.fr>
Message-ID: <20051031152430.GC27238@wohnheim.fh-wedel.de>
References: <1130311964.435f311cf30e9@webmail2.utbm.fr>
	<20051028142739.GB1269@wohnheim.fh-wedel.de>
	<1130753526.4365edf6b2807@webmail1.utbm.fr>
	<20051031143345.GB27238@wohnheim.fh-wedel.de>
	<1130771777.4366354129c88@webmail1.utbm.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1130771777.4366354129c88@webmail1.utbm.fr>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] separate routine to check jffs2_flash_read
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 31 October 2005 16:16:17 +0100, pierre.ricadat@utbm.fr wrote:
> Quoting Jörn Engel <joern@wohnheim.fh-wedel.de>:
> > On Mon, 31 October 2005 11:12:06 +0100, pierre.ricadat@utbm.fr wrote:
> > >
> > > -free_out:
> > > -       if(!pointed)
> > > -               kfree(buffer);
> > > -#ifndef __ECOS
> > > -       else
> > > -               c->mtd->unpoint(c->mtd, buffer, ofs, len);
> > > -#endif
> > > -       return err;
> > >  }
> >
> > Nowhere in jffs2_flash_read_safe() do you call c->mtd->unpoint.  So
> > obviously your code is not equivalent to the existing.  Can you look
> > into it and see what needs to be don?
> 
> In fact the only place where we goto free_out was there :
> 
> @ line 449:
> 	if (!pointed) {
> 		buffer = kmalloc(len, GFP_KERNEL);
> 		if (unlikely(!buffer))
> 			return -ENOMEM;
> 
> 		/* TODO: this is very frequent pattern, make it a separate
> 		 * routine */
> 		err = jffs2_flash_read(c, ofs, len, &retlen, buffer);
> 		if (err) {
> 			JFFS2_ERROR("can not read %d bytes from 0x%08x, error code: %d.\n", len, ofs,
> err);
> 			goto free_out;
> 		}
> 
> 		if (retlen != len) {
> 			JFFS2_ERROR("short read at %#08x: %d instead of %d.\n", ofs, retlen, len);
> 			err = -EIO;
> 			goto free_out;
> 		}
> 	}
> 
> The goto free_out was located in a if(!pointed), so the if(!pointed) in the
> free_out will always be true, and c->mtd->unpoint will never be called.

Hmmyess, makes sense.  I'd vote for inclusion "right after the merge".

Not sure what that actually means.  If it takes too long, I might just
shrug and dump new stuff into cvs.  We've had a calm-down period for a
while now and the merge could even happen with code from some date
like today.

Jörn

-- 
The competent programmer is fully aware of the strictly limited size of
his own skull; therefore he approaches the programming task in full
humility, and among other things he avoids clever tricks like the plague. 
-- Edsger W. Dijkstra
