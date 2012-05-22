Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SWtf2-0007rT-TK
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 18:18:21 +0000
Received: by laap9 with SMTP id p9so5672025laa.36
 for <linux-mtd@lists.infradead.org>; Tue, 22 May 2012 11:18:17 -0700 (PDT)
Date: Tue, 22 May 2012 21:18:09 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] [RFC] UBI: Implement Fastmap support
Message-ID: <20120522211809.53bd6444@halley>
In-Reply-To: <4FBBC4EE.4040802@nod.at>
References: <1337608916-49771-1-git-send-email-richard@nod.at>
 <1337608916-49771-2-git-send-email-richard@nod.at>
 <20120522180119.2c2a10a8@pixies.home.jungo.com>
 <4FBBC4EE.4040802@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 Heinz.Egger@linutronix.de, linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Tue, 22 May 2012 18:55:10 +0200 Richard Weinberger <richard@nod.at> wrote:
> >> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> >> index 2c5ed5c..ef5d7b7 100644
> >> --- a/drivers/mtd/ubi/build.c
> >> +++ b/drivers/mtd/ubi/build.c
> >> @@ -144,6 +144,16 @@ int ubi_volume_notify(struct ubi_device *ubi, struct ubi_volume *vol, int ntype)
> >>
> >>   	ubi_do_get_device_info(ubi,&nt.di);
> >>   	ubi_do_get_volume_info(ubi, vol,&nt.vi);
> >> +
> >> +	switch (ntype) {
> >> +	case UBI_VOLUME_ADDED:
> >> +	case UBI_VOLUME_REMOVED:
> >> +	case UBI_VOLUME_RESIZED:
> >> +	case UBI_VOLUME_RENAMED:
> >> +		if (ubi_update_fastmap(ubi))
> >> +			ubi_err("Unable to update fastmap!");
> >
> > In the error case, what are the consequences leaving the older on-flash
> > fastmap? Shouldn't it be invalidated?
> 
> If the fastmap is not written complete the CRC check will fail next time 
> and we fall back to scanning mode.

There are many fail-points within 'ubi_update_fastmap' where an error
code is returned, long before it attempts writing to the media.
If 'ubi_update_fastmap' fails due to those, then the old on-flash
fastmap is still valid.
However we know a volume has been just changed.
Will the system be coherent after a sudden reboot (that occurs prior
next successful fastmap update)?

> >> diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
> >> index 5275632..299a601 100644
> >> --- a/drivers/mtd/ubi/ubi.h
> >> +++ b/drivers/mtd/ubi/ubi.h
> >> @@ -202,6 +202,39 @@ struct ubi_rename_entry {
> >>   struct ubi_volume_desc;
> >>
> >>   /**
> >> + * struct ubi_fastmap - in-memory fastmap data structure.
> >> + * @peb: PEBs used by the current fastamp
> >
> > s/fastamp/fastmap/
> >
> >> + * @ec: the erase counter of each used PEB
> >> + * @size: size of the fastmap in bytes
> >> + * @used_blocks: number of used PEBs
> >> + */
> >> +struct ubi_fastmap {
> >
> > Suggestion: maybe ubi_fastmap_location / ubi_fastmap_layout /
> > ubi_fastmap_position ? slightly more explanatory than 'ubi_fastmap'.
> 
> Good idea. ubi_fastmap_position seems good to me.

Sounds good. You could amend the comments above the struct as well.

> >> + * @root: the RB-tree where to look for
> >> + * @max_pnum: highest possible pnum
> >> + *
> >> + * This function looks for a wear leveling entry containing a eb which
> >> + * is in front of the memory.
> >
> > IMO can remove the last comment.
> 
> Documentation is like sex: when it is good, it is very, very good; and 
> when it is bad, it is better than nothing.
> - Dick Brandon

:-)

BTW what is "in front of the memory"? ;)

> >> +		if (!e) {
> >> +			spin_unlock(&ubi->wl_lock);
> >> +			return -ENOMEM;
> >
> > This is traumatic; you must return the PEB back to WL, but fail to do so
> > due to an internal error.
> 
> This is not easy. In the !e case I need memory.

Yes, I noticed this is far from trivial ;)
What troubles me, is that the system is unaware of the fault, acts
business as usual, with one less PEB.

Care to elaborate how come 'ubi->lookuptbl[pnum]' is NULL? What's the
exact flow leading to it?
 
> > (BTW the return value of ubi_wl_put_fm_peb is not tested at the call
> > sites)
> > The system is left with a missing PEB.
> > Can't we guarantee ubi_wl_put_fm_peb is called only after wl_init is
> > completed?
> 
> Why would that help?

I tried to asses why 'ubi->lookuptbl[pnum]' gets NULL, I was
probably mistaken in my analysis.

There's a bit of assymetry here.

'ubi_wl_get_fm_peb' doesn't clear the 'ubi_wl_entry' from the lookuptbl.
It does not free the 'ubi_wl_entry' either (seems like it should, no?)

However 'ubi_wl_put_fm_peb' creates a 'ubi_wl_entry' if not found in
the lookuptbl.

Formerly, wl_init was responsible for correctly populating
'ubi->lookuptbl'. Can we somehow preserve this for FM pebs as well?

Regards,
Shmulik
