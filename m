Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqpQG-00033j-67
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2015 21:35:23 +0000
Received: by padhk11 with SMTP id hk11so199538603pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 14:34:59 -0700 (PDT)
Date: Mon, 26 Oct 2015 14:34:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/4] mtd: fixup corner case error handling in
 mtd_device_parse_register()
Message-ID: <20151026213456.GK13239@google.com>
References: <1433200640-17858-1-git-send-email-computersforpeace@gmail.com>
 <1433200640-17858-3-git-send-email-computersforpeace@gmail.com>
 <556D6339.70607@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <556D6339.70607@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 02, 2015 at 10:03:05AM +0200, Richard Weinberger wrote:
> Am 02.06.2015 um 01:17 schrieb Brian Norris:
> > Since commit 3efe41be224c ("mtd: implement common reboot notifier
> > boilerplate"), we might try to register a reboot notifier for an MTD
> > that failed to register. Let's avoid this by making the error path
> > clearer.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> >  drivers/mtd/mtdcore.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> > index 8bbbb751bf45..03eec42dc715 100644
> > --- a/drivers/mtd/mtdcore.c
> > +++ b/drivers/mtd/mtdcore.c
> > @@ -579,9 +579,15 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
> >  		else
> >  			ret = nr_parts;
> >  	}
> > +	/* Didn't come up with either parsed OR fallback partitions */
> > +	if (ret < 0) {
> > +		pr_info("mtd: failed to find partitions\n");
> > +		goto out;
> > +	}
> >  
> > -	if (ret >= 0)
> > -		ret = mtd_add_device_partitions(mtd, real_parts, ret);
> > +	ret = mtd_add_device_partitions(mtd, real_parts, ret);
> > +	if (ret)
> > +		goto out;
> >  
> >  	/*
> >  	 * FIXME: some drivers unfortunately call this function more than once.
> > @@ -596,6 +602,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
> >  		register_reboot_notifier(&mtd->reboot_notifier);
> >  	}
> >  
> > +out:
> >  	kfree(real_parts);
> >  	return ret;
> >  }
> 
> Reviewed-by: Richard Weinberger <richard@nod.at>

Not sure why I left this one; applied to l2-mtd.git
