Received: from ug-out-1314.google.com ([66.249.92.170])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAV4q-0001OK-TY
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 19:50:33 +0000
Received: by ug-out-1314.google.com with SMTP id q7so166897uge.5
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Dec 2008 11:50:31 -0800 (PST)
Subject: Re: [PATCH] [UBI] 1/4 UBI volume notifications - UBI changes
From: dmitry pervushin <dpervushin@gmail.com>
To: dedekind@infradead.org
In-Reply-To: <1228818989.13686.172.camel@sauron>
References: <1228759160.7622.28.camel@hp.diimka.lan>
	<1228818989.13686.172.camel@sauron>
Content-Type: text/plain
Date: Wed, 10 Dec 2008 22:50:22 +0300
Message-Id: <1228938622.7622.60.camel@hp.diimka.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dpervushin@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-12-09 at 12:36 +0200, Artem Bityutskiy wrote:

Thanks for your review, my the only comment is inlined below.

[skipped]
> <snip>
> > +/**
> >   * ubi_get_device - get UBI device.
> >   * @ubi_num: UBI device number
> >   *
> > @@ -842,6 +870,8 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
> >  			goto out_detach;
> >  	}
> >  
> > +	/* when processing uif_init, we already might want to open the volume */
> > +	ubi_devices[ubi_num] = ubi;
> >  	err = uif_init(ubi);
> >  	if (err)
> >  		goto out_nofree;
> 
> I do not understand this change. The point is to prevent anyone from
> opening the volume before it is completely initialized. What you do -
> you allow the volume to be opened while it is in the middle of
> initialization, which is wrong. E.g., what if the initialization fails
> at some point?
> 
> And this change does not seem to be relevant to this patch.
This change is absolutely needed :)
Well, the sequence of steps is as follows:
1. uif_init calls ubi_add_volume
2. ubi_add_volume notifies everyone about volume adding
3. (successful exit is not interested to us)
4. in case of errors reported by uif_init ubi_attach_mtd_dev calls
ubi_kill_volumes
5. ubi_kill_volumes calls ubi_free_volume, which notifies everyone about
volume deleting.

In current version, "notifies about volume adding" corresponds to
ubi_create_gluebi and "...deleting" means ubi_destory_gluebi"

Does this sound right? OK, then I am replacing ubi_create_gluebi with
notification, notification function tries to open new (just appeared)
volume... and fails, because ubi_open_volume tries to ubi_get_device.
It, in turn checks the "ubi_devices[ubi_num]" which is not filled yet.

So, I do insist on the change.
