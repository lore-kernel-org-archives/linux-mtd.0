Received: from lilium.sigma-star.at ([109.75.188.150])
 by casper.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ebpvI-0004oU-I4
 for linux-mtd@lists.infradead.org; Wed, 17 Jan 2018 15:46:46 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Martin Townsend <mtownsend1973@gmail.com>
Cc: hs@denx.de, u-boot@lists.denx.de, kmpark@infradead.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ubi: Fix filesystem corruption on detach when fastmap
 enabled
Date: Wed, 17 Jan 2018 16:47:15 +0100
Message-ID: <1612877.xbAM7MeHb7@blindfold>
In-Reply-To: <CABatt_y_6D+unmRT_L3nScxN=RnPuAxSiykSwPkwNp6298OakQ@mail.gmail.com>
References: <CABatt_wEa+jiSmutzZrjyRFXqypPTbfdo_Z8CVDhuuRMUXjA6w@mail.gmail.com>
 <8925017.tvIN1CM1GY@blindfold>
 <CABatt_y_6D+unmRT_L3nScxN=RnPuAxSiykSwPkwNp6298OakQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Martin,

Am Dienstag, 16. Januar 2018, 15:13:04 CET schrieb Martin Townsend:
> > Martin, can you please explain what corruption you see?
> > From reading the code I'd assume that you miss volumes but a full scan
> > would recover everything.
> 
> I didn't do much analysis of the corruption I'm afraid.  When I tried
> to reattach the the c->empty flag was set to true and indeed all the
> EBA tables were reporting an empty filesystem even after a reboot.

Sounds like what I'd expect.

> Not sure if this was recoverable, how do you trigger a full scan?

Booting a kernel without Fastmap support. B-)

> > For Linux I suggest this fix:
> > 
> > From 48287459cf8717cffac5aed423937cd7ba4360ab Mon Sep 17 00:00:00 2001
> > From: Richard Weinberger <richard@nod.at>
> > Date: Tue, 16 Jan 2018 14:12:46 +0100
> > Subject: [PATCH] ubi: fastmap: Don't flush fastmap work on detach
> > 
> > At this point UBI volumes have already been free()'ed and fastmap can no
> > longer access these data structures.
> > 
> > Fixes: 74cdaf24004a ("UBI: Fastmap: Fix memory leaks while closing the WL
> > sub- system")
> > Signed-off-by: Richard Weinberger <richard@nod.at>
> > Cc: stable@vger.kernel.org
> > ---
> > 
> >  drivers/mtd/ubi/fastmap-wl.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
> > index 4f0bd6b4422a..69dd21679a30 100644
> > --- a/drivers/mtd/ubi/fastmap-wl.c
> > +++ b/drivers/mtd/ubi/fastmap-wl.c
> > @@ -362,7 +362,6 @@ static void ubi_fastmap_close(struct ubi_device *ubi)
> > 
> >  {
> >  
> >         int i;
> > 
> > -       flush_work(&ubi->fm_work);
> > 
> >         return_unused_pool_pebs(ubi, &ubi->fm_pool);
> >         return_unused_pool_pebs(ubi, &ubi->fm_wl_pool);
> > 
> > --
> > 2.13.6
> > 
> > In U-Boot you can do the same.
>
> Richard: This will work but just want to check that ubi_wl_close is
> supposed to never write out to the filesystem or will never do so in
> future, if so maybe a something in the comments above ubi_wl_close to
> ensure this?

Hmm, not sure if I got this question.
The filesystem sits above UBI. If we reach ubi_wl_close() all users ontop of 
UBI are gone. There is no UBIFS mounted anymore.

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
