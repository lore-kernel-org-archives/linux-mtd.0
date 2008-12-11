Received: from mail-ew0-f13.google.com ([209.85.219.13])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAhni-0006Iq-Nt
	for linux-mtd@lists.infradead.org; Thu, 11 Dec 2008 09:25:43 +0000
Received: by ewy6 with SMTP id 6so1361428ewy.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Dec 2008 01:25:41 -0800 (PST)
Subject: Re: [PATCH] [UBI] 1/4 UBI volume notifications - UBI changes
From: dmitry pervushin <dpervushin@gmail.com>
To: dedekind@infradead.org
In-Reply-To: <1228975678.13686.367.camel@sauron>
References: <1228759160.7622.28.camel@hp.diimka.lan>
	<1228818989.13686.172.camel@sauron>
	<1228938622.7622.60.camel@hp.diimka.lan>
	<1228975678.13686.367.camel@sauron>
Content-Type: text/plain
Date: Thu, 11 Dec 2008 12:25:32 +0300
Message-Id: <1228987532.7622.66.camel@hp.diimka.lan>
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

On Thu, 2008-12-11 at 08:07 +0200, Artem Bityutskiy wrote:
> > [skipped]
> > > <snip>
> > > > +/**
> > > >   * ubi_get_device - get UBI device.
> > > >   * @ubi_num: UBI device number
> > > >   *
> > > > @@ -842,6 +870,8 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
> > > >  			goto out_detach;
> > > >  	}
> > > >  
> > > > +	/* when processing uif_init, we already might want to open the volume */
> > > > +	ubi_devices[ubi_num] = ubi;
> > > >  	err = uif_init(ubi);
> > > >  	if (err)
> > > >  		goto out_nofree;
> > > 
> > > I do not understand this change. The point is to prevent anyone from
> > > opening the volume before it is completely initialized. What you do -
> > > you allow the volume to be opened while it is in the middle of
> > > initialization, which is wrong. E.g., what if the initialization fails
> > > at some point?
> > > 
> > > And this change does not seem to be relevant to this patch.
> > This change is absolutely needed :)
> > Well, the sequence of steps is as follows:
> > 1. uif_init calls ubi_add_volume
> > 2. ubi_add_volume notifies everyone about volume adding
> > 3. (successful exit is not interested to us)
> > 4. in case of errors reported by uif_init ubi_attach_mtd_dev calls
> > ubi_kill_volumes
> > 5. ubi_kill_volumes calls ubi_free_volume, which notifies everyone about
> > volume deleting.

Isn't it better then to protect the critical section in uif_init and
open_volume by mutexes? Now it looks as you are adding volumes on
non-existing-yet device.

> What may happen is
> 
> 1. You make the UBI device visible by doing 'ubi_devices[ubi_num] =
> ubi'.
> 2. You call 'uif_init()' which starts adding volumes. Suppose it added N
> volumes out of M (M > N).
> 3. Some other task opens the UBI device, opens volume L (L <= N), and
> starts utilizing it. E.g., it might mounted by UBIFS.
> 4. 'uif_init()' fails to add volume S (S > N <= M), and all resources,
> including the opened volume L will be freed, and the system is in
> trouble.
> 
> > In current version, "notifies about volume adding" corresponds to
> > ubi_create_gluebi and "...deleting" means ubi_destory_gluebi"
> > 
> > Does this sound right? OK, then I am replacing ubi_create_gluebi with
> > notification, notification function tries to open new (just appeared)
> > volume... and fails, because ubi_open_volume tries to ubi_get_device.
> > It, in turn checks the "ubi_devices[ubi_num]" which is not filled yet.
> 
> I think the solution is to call notifiers _after_ _everything_ is
> successfully initialized and has no chances to fail anymore, i.e., at
> the very end of 'ubi_attach_mtd_dev()' function.
> 
