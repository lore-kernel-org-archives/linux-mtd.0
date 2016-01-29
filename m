Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aPDZM-00033Y-Gm
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2016 18:14:53 +0000
Received: by mail-pf0-x241.google.com with SMTP id x125so4142241pfb.0
 for <linux-mtd@lists.infradead.org>; Fri, 29 Jan 2016 10:14:32 -0800 (PST)
Date: Fri, 29 Jan 2016 10:14:29 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mason <slash.tmp@free.fr>, Sebastian Frias <sf84@laposte.net>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: RFC on large number of hacks in mtd core files
Message-ID: <20160129181429.GA7968@google.com>
References: <56A24C22.2050607@free.fr> <20160123031635.GB90611@google.com>
 <56A35BA2.3040906@free.fr> <56A65CBA.9050705@free.fr>
 <20160129172717.24a12c3d@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160129172717.24a12c3d@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 29, 2016 at 05:27:17PM +0100, Boris Brezillon wrote:
> On Mon, 25 Jan 2016 18:34:50 +0100
> Mason <slash.tmp@free.fr> wrote:
> > @@ -2888,16 +2951,29 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
> >  	sanitize_string(p->model, sizeof(p->model));
> >  	if (!mtd->name)
> >  		mtd->name = p->model;
> > +
> >  	mtd->writesize = le32_to_cpu(p->byte_per_page);
> > -	mtd->erasesize = le32_to_cpu(p->pages_per_block) * mtd->writesize;
> > +
> > +	/*
> > +	 * pages_per_block and blocks_per_lun may not be a power-of-2 size
> > +	 * (don't ask me who thought of this...). MTD assumes that these
> > +	 * dimensions will be power-of-2, so just truncate the remaining area.
> > +	 */
> > +	mtd->erasesize = 1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
> > +	mtd->erasesize *= mtd->writesize;
> > +
> 
> Hm, I'd like to have a real example (all the chips I've seen so far
> are using power-of-2 here). And even if that's the case, then this means
> we should patch nand_base to deal with that.
> 
> >  	mtd->oobsize = le16_to_cpu(p->spare_bytes_per_page);
> > -	chip->chipsize = le32_to_cpu(p->blocks_per_lun);
> > +
> > +	/* See erasesize comment */
> > +	chip->chipsize = 1 << (fls(le32_to_cpu(p->blocks_per_lun)) - 1);
> 
> Ditto.

It looks like he borrowed these from this commit of mine:

commit 4355b70cf48363c50a9de450b01178c83aba8f6a
Author: Brian Norris <computersforpeace@gmail.com>
Date:   Tue Aug 27 18:45:10 2013 -0700

    mtd: nand: hack ONFI for non-power-of-2 dimensions

As evidenced in the commit subject ("hack"), it's debatably a shortcut
that could have been dealt with in other ways.

Brian
