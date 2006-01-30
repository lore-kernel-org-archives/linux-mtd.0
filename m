Received: from home-gw.koi8.net ([24.234.115.112])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F3eAO-0002oU-2S
	for linux-mtd@lists.infradead.org; Mon, 30 Jan 2006 13:54:27 -0500
Date: Mon, 30 Jan 2006 09:53:01 -0800 (PST)
From: Sergey Kubushyn <ksi@koi8.net>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <43DDCA1A.2050907@ru.mvista.com>
Message-ID: <Pine.LNX.4.31ksi3.0601300928120.17650-100000@home-gw.koi8.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: yuri.golovach@mindspeed.com, manningc2@actrix.gen.nz,
	linux-mtd@lists.infradead.org, yaffs@stoneboat.aleph1.co.uk
Subject: Re: [Yaffs] Re: [PATCH] treat OOB as a single chunk of oobavail
 bytes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 30 Jan 2006, Vitaly Wool wrote:

You guys are creating unneeded entities. There is no need to change the
kernel for YAFFS2 to work. It can be done with a rather simple mtdiff2.c
rewrite in YAFFS2 tree that took me less than a day to do. Furthermore, my
patch is in the list so you can even save that day by simply applying it and
make the thing work with a _stock_ kernel, right now.

You're taking a long path instead adding unnecessary functionality to Linux
kernel. How d'ya think, how much time will it take for all those CVS MTD
changes to make it into the mainstream kernel? And you can get YAFFS2
working for everybody with _any_ stock kernel right now by just applying the
patch to mtdiff2.c.

There is another unnecessary complication -- your CVS MTD changes would go
into something like, say, 2.6.22 kernel and they would not fit into the
older ones. That means that everybody will be forced to switch to a newer
kernel that is not such an easy task for those who use highly customized
kernels they are happy with. E.g. ARM architecture underwent quite a
substantial changes after 2.6.12 so it is NOT just a matter of easy patch
fitting into a new kernel, it's quite a rewrite.

Furthermore, there are places where those kernels undergo some kind of
regulatory body certification (e.g. Gaming Board or DOD) that takes
significant time and effort to do over and over again. They simply don't
like any updates, once the code is certified it's effectively frozen.

Unfortunately enough for YAFFS it's not driven by a reason or common sence,
personal likes and dislikes are ruling here... Somebody got insulted so he
rejects all reasonable arguments just because they come from a person he
doesn't like. That might be fine for preschool kids, but we're supposedly
professionals here, aren't we? And this is simply ridiculous for a
professional to behave in such a way...

> Hello Sergey,
>
> I'm afraid I haven't got your allusions... Anyway, you might want to
> learn more about main principles of modularity.
>
> Best regards,
>    Vitaly
>
> Sergey Kubushyn wrote:
>
> >On Sun, 29 Jan 2006, Vitaly Wool wrote:
> >
> >Guys, can you explain what is the need for such a change in the first
> place?
> >Another round of confusion? Forcing everybody to upgrade their
> painfully
> >crafted kernels (your CVS version won't apply to e.g. 2.6.12 kernel
> that was
> >the last one before rather major change in ARM architecture, will
> it?)?
> >
> >Why don't just fix YAFFS2 itself to make it work with a stock kernel?
> It's
> >easy to do and the appropriate patch is out for quite a long time,
> tested
> >and works for everyone. Patch for YAFFS2 it is, not for kernel.
> >
> >Occam was a wise man so it does make sence to use his razor... Belly
> cover
> >weared without a need is harmful (C) K.Prutkov ....
> >
> >
> >
> >>Hi Charles,
> >>
> >>no it's not yet in CVS. I think I'll be able to commit it if we get
> any
> >>positive feedback on this patch (i. e. if it's actually working for
> >>anyone else than me :))
> >>As for write_oobfree, it looks to be  useful for JFFSx to stop
> messing
> >>with oobinfos in JFFSx code.
> >>
> >>Best regards,
> >>  Vitaly
> >>
> >>Charles Manning wrote:
> >>
> >>
> >>
> >>>On Friday 27 January 2006 01:51, Vitaly Wool wrote:
> >>>
> >>>
> >>>
> >>>
> >>>>Hi Yuri,
> >>>>
> >>>>well, lemme just summarize what you hafta do in order to make
> YAFFS2
> >>>>work with my patches.
> >>>>
> >>>>1. Apply the following patch to the mtd code:
> >>>>
> >>>>
> >>>>
> >>http://lists.infradead.org/pipermail/linux-mtd/2005-December/014648.ht
> ml
> >>
> >>
> >>>>(yes, it's a single patch!)
> >>>>2. Modify the fs/yaffs2/yaffs_mtdif2.c to use
> >>>>
> >>>>
> >>read_oobfree/write_oobfree
> >>
> >>
> >>>>where appropriate.
> >>>>
> >>>>Hope that helps,
> >>>>
> >>>>  Vitaly
> >>>>
> >>>>
> >>>>
> >>>Hi Vitaly
> >>>
> >>>Is this in CVS yet? If not, I hope it will be there soon.
> >>>
> >>>From what I see, this is going to be just what we need.
> >>>
> >>>YAFFS2 does not need to write_oobfree as a seperate function (it is
> >>>always written as a single page write). YAFFS2 only needs
> >>>
> >>>
> >>read_oobfree.
> >>
> >>
> >>>However, YAFFS1 could use the write_oobfree function at some future
> >>>date if YAFFS1 gets moved to this interface to remove the current
> >>>reliance on hanging the ugly ECC parameter stuff through the
> >>>
> >>>
> >>interface.
> >>
> >>
> >>>I am pretty busy right now, but will try get the YAFFS2 side sorted
> >>>ASAP. If the YAFFS2 stuff is CVSed before the mtd then I'll just
> >>>
> >>>
> >>point
> >>
> >>
> >>>people to this patch.
> >>>
> >>>Thanx!
> >>>
> >>>Charles
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>
> >>
> >>_______________________________________________
> >>yaffs mailing list
> >>yaffs@stoneboat.aleph1.co.uk
> >>http://stoneboat.aleph1.co.uk/cgi-bin/mailman/listinfo/yaffs
> >>
> >>
> >>
> >
> >---
> >******************************************************************
> >*  KSI@home    KOI8 Net  < >  The impossible we do immediately.  *
> >*  Las Vegas   NV, USA   < >  Miracles require 24-hour notice.   *
> >******************************************************************
> >
> >
> >
> >
>

---
******************************************************************
*  KSI@home    KOI8 Net  < >  The impossible we do immediately.  *
*  Las Vegas   NV, USA   < >  Miracles require 24-hour notice.   *
******************************************************************
