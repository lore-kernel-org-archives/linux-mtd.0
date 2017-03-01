Received: from galois.linutronix.de ([2a01:7a0:2:106d:700::1])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cj0vc-0004Sd-8n
 for linux-mtd@lists.infradead.org; Wed, 01 Mar 2017 09:52:14 +0000
Date: Wed, 1 Mar 2017 10:51:45 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ubi/upd: always flush after prepared for an update
Message-ID: <20170301095145.47n6kyjrjmok5sk2@linutronix.de>
References: <20170222161521.4foobhoyelnrad7h@linutronix.de>
 <a0902bd5-b4d9-5b2d-c909-115c4523c370@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a0902bd5-b4d9-5b2d-c909-115c4523c370@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2017-02-28 22:02:14 [+0100], Richard Weinberger wrote:
> Sebastian,
Hi Richard,

> > diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
> > index 0134ba32a057..39712560b4c1 100644
> > --- a/drivers/mtd/ubi/upd.c
> > +++ b/drivers/mtd/ubi/upd.c
> > @@ -148,11 +148,11 @@ int ubi_start_update(struct ubi_device *ubi, struct ubi_volume *vol,
> >  			return err;
> >  	}
> >  
> > -	if (bytes == 0) {
> > -		err = ubi_wl_flush(ubi, UBI_ALL, UBI_ALL);
> > -		if (err)
> > -			return err;
> > +	err = ubi_wl_flush(ubi, UBI_ALL, UBI_ALL);
> > +	if (err)
> > +		return err;
> 
> Unconditionally calling ubi_wl_flush() will slow down ubiupdatevol.
> Wouldn't it make sense to flush only if bytes is 0 or differs from the old value?

Do you think it will slow down the whole process as such? Usually you
don't have a lot of empty PEBs around so at some point you will force
one worker to get an empty PEB. And even if you could write everything
without the need to complete the erase process then
ubi_more_update_data() will also invoke ubi_wl_flush() before
clear_update_marker() which completes the process.

> Thanks,
> //richard

Sebastian
