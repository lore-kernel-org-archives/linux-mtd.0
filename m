Received: from portail2.utbm.fr ([193.48.246.11] helo=portail1.utbm.fr)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EWbOZ-0006Ro-Bb
	for linux-mtd@lists.infradead.org; Mon, 31 Oct 2005 10:16:28 -0500
Received: from portail2.utbm.fr (localhost.localdomain [127.0.0.1])
	by portail1.utbm.fr (8.12.8/jtpda-5.4) with ESMTP id j9VFGLgf001707
	for <linux-mtd@lists.infradead.org>; Mon, 31 Oct 2005 16:16:21 +0100
Received: from webmail1.utbm.fr ([192.168.1.88])
	by portail2.utbm.fr (8.12.8/8.12.8) with ESMTP id j9VFGL2b001701
	for <linux-mtd@lists.infradead.org>; Mon, 31 Oct 2005 16:16:21 +0100
Message-ID: <1130771777.4366354129c88@webmail1.utbm.fr>
Date: Mon, 31 Oct 2005 16:16:17 +0100
From: "pierre.ricadat@utbm.fr" <Pierre.Ricadat@utbm.fr>
To: linux-mtd@lists.infradead.org
References: <1130311964.435f311cf30e9@webmail2.utbm.fr>
	<20051028142739.GB1269@wohnheim.fh-wedel.de>
	<1130753526.4365edf6b2807@webmail1.utbm.fr>
	<20051031143345.GB27238@wohnheim.fh-wedel.de>
In-Reply-To: <20051031143345.GB27238@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] separate routine to check jffs2_flash_read
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quoting Jörn Engel <joern@wohnheim.fh-wedel.de>:

> On Mon, 31 October 2005 11:12:06 +0100, pierre.ricadat@utbm.fr wrote:
> >
> > -free_out:
> > -       if(!pointed)
> > -               kfree(buffer);
> > -#ifndef __ECOS
> > -       else
> > -               c->mtd->unpoint(c->mtd, buffer, ofs, len);
> > -#endif
> > -       return err;
> >  }
>
> Nowhere in jffs2_flash_read_safe() do you call c->mtd->unpoint.  So
> obviously your code is not equivalent to the existing.  Can you look
> into it and see what needs to be don?

In fact the only place where we goto free_out was there :

@ line 449:
	if (!pointed) {
		buffer = kmalloc(len, GFP_KERNEL);
		if (unlikely(!buffer))
			return -ENOMEM;

		/* TODO: this is very frequent pattern, make it a separate
		 * routine */
		err = jffs2_flash_read(c, ofs, len, &retlen, buffer);
		if (err) {
			JFFS2_ERROR("can not read %d bytes from 0x%08x, error code: %d.\n", len, ofs,
err);
			goto free_out;
		}

		if (retlen != len) {
			JFFS2_ERROR("short read at %#08x: %d instead of %d.\n", ofs, retlen, len);
			err = -EIO;
			goto free_out;
		}
	}

The goto free_out was located in a if(!pointed), so the if(!pointed) in the
free_out will always be true, and c->mtd->unpoint will never be called.

-- 
Pierre Ricadat
