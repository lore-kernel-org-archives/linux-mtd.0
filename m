Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MDfvT-0004lh-Sh
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 14:34:23 +0000
Date: Mon, 08 Jun 2009 23:34:11 +0900 (JST)
Message-Id: <20090608.233411.59468670.anemo@mba.ocn.ne.jp>
To: dwmw2@infradead.org
Subject: Re: [PATCH revised] mtd: remove driver-core BUS_ID_SIZE
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <1244448862.30939.76.camel@macbook.infradead.org>
References: <1244306664-23741-1-git-send-email-anemo@mba.ocn.ne.jp>
	<1244448862.30939.76.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: kay.sievers@vrfy.org, linux-mtd@lists.infradead.org, gregkh@suse.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 08 Jun 2009 09:14:22 +0100, David Woodhouse <dwmw2@infradead.org> wrote:
> >  			txx9_priv->cs = -1;
> > -			strcpy(txx9_priv->mtdname, dev_name(&dev->dev));
> > +			txx9_priv->mtdname = kstrdup(dev_name(&dev->dev),
> > +						     GFP_KERNEL);
> 
> You don't check for failure here.
> 
> With that fixed, this is your changes as an incremental patch with an
> appropriate commit log... I think it's exceeded the limit of how much
> I'd want to massage your patch while retaining your Signed-off-by:, so
> I'll give you a chance to append your S-o-b for yourself....

Oh, thanks.

> -----
> From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
> Subject: [PATCH] Fix memory leak on probe failure.
> 
> Commit 81933046ef2a615031c46171013bde2c5225ee69 ('mtd: Fix handling of
> mtdname in txx9ndfmc.c') introduced a potential memory leak. The
> 'mtdname' member of the private data structure is now allocated
> separately, but was not freed on certain error paths.
> 
> Fix that, and make things simpler by _always_ allocating it separately
> so that we don't need 'if (mtdname != dev_name()) kfree(mtdname)'...
> which gets ugly now that we're doing it more than once, and more likely
> that we'll get it wrong some time.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
