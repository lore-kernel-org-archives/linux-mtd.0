Received: from szxga01-in.huawei.com ([119.145.14.64])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9oQ1-0005AF-Kl
 for linux-mtd@lists.infradead.org; Thu, 15 Aug 2013 03:40:15 +0000
From: Caizhiyong <caizhiyong@huawei.com>
To: Brian Norris <computersforpeace@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: RE: [PATCH] block: add command line partition parser
Date: Thu, 15 Aug 2013 03:38:47 +0000
Message-ID: <C3050A4DBA34F345975765E43127F10F1C063B36@szxeml512-mbx.china.huawei.com>
References: <C3050A4DBA34F345975765E43127F10F1C061D75@szxeml512-mbs.china.huawei.com>
 <20130805152206.76462cc4a42e51b16a0532f1@linux-foundation.org>
 <C3050A4DBA34F345975765E43127F10F1C06237C@szxeml512-mbs.china.huawei.com>
 <20130814155742.d3cd651e40e552696667e4f2@linux-foundation.org>
 <CAN8TOE-aGcKQNayzEVQaS1wJ_Uqp3RAZ5pTuVEhaaY9f487-xA@mail.gmail.com>
In-Reply-To: <CAN8TOE-aGcKQNayzEVQaS1wJ_Uqp3RAZ5pTuVEhaaY9f487-xA@mail.gmail.com>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Wanglin \(Albert\)" <albert.wanglin@huawei.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>, Karel Zak <kzak@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: Brian Norris [mailto:computersforpeace@gmail.com]
> Sent: Thursday, August 15, 2013 8:12 AM
> To: Andrew Morton
> Cc: Caizhiyong; Karel Zak; linux-mtd@lists.infradead.org;
> linux-kernel@vger.kernel.org; Wanglin (Albert); Artem Bityutskiy; Shmulik=
 Ladkani;
> Huang Shijie
> Subject: Re: [PATCH] block: add command line partition parser
>=20
> On Wed, Aug 14, 2013 at 3:57 PM, Andrew Morton
> <akpm@linux-foundation.org> wrote:
> > On Tue, 13 Aug 2013 06:02:17 +0000 Caizhiyong <caizhiyong@huawei.com> w=
rote:
> >
> >> move the command line parser to a separate module, and change it into
> >> library-style code.
> >>
> >> reference: https://lkml.org/lkml/2013/8/6/550
>=20
> The most recent patch is an addendum to this linked patch then?
>=20
> > Well OK.  But to prove the library's usefulness and to generally clean
> > up the kernel, someone needs to sign up to the task of converting
> > drivers/mtd/cmdlinepart.c to use this code.
> >
> > I've been hopefully cc'ing various MTD people but am not being
> > overwhelmed with waves of enthusiasm ;)
>=20
> "I've been" implies that you have done so prior to this email. And
> "people" implies more than one person. I see that you CC'd David
> Woodhouse over a week ago, but he's fairly silent these days on MTD
> things. It's Artem or me who handle most of the day-to-day of MTD. And
> this is the first time I've seen this! (BTW, please include
> linux-mtd@lists.infradead.org for anything involving MTD.)
>=20
> This seems reasonable, and I'd be willing to work with this proposal.
>=20
> Caizhiyong, can you submit a clear single patch (or series of
> patches), CC'd to linux-mtd at least? Then we can see about supporting
> it in MTD. It doesn't look too difficult, but I need to check that it
> faithfully mimics the capability we currently rely on. There have been
> previous discussions on changing it, but this was rejected in favor of
> allowing more flexibility. Here's part of one such conversation:
>=20
> http://lists.infradead.org/pipermail/linux-mtd/2012-August/043599.html
> http://lists.infradead.org/pipermail/linux-mtd/2012-September/043825.html
> http://lists.infradead.org/pipermail/linux-mtd/2012-December/045322.html
>=20
> So I would recommend:
> (1) consider carefully the implications of your command-line format
> now, rather than later
> (2) if you want MTD to use it, it needs to support the features we use no=
w

It is fully functional reference MTD, :-).

>=20
> Some particular cases to consider: overlapping partitions (how do
> block devices handle overlapping partitions?), out-of-order
> specification, zero sized partitions, mixed syntax (some specified
> with an offset, some not), multiple '-' partitions.

I think the 'offset' just is used to hide some MTD space.
There are two way:
1) redefine the 'offset' as a gap between forward partition and next partit=
ion.
2) add code forbid command line partitions overlapping and out-of-order.

I recommend 1), it seems to solve those problem(overlapping and out-of-orde=
r), but it will affect habit.

>=20
> Anyway, if you resend, we can review.
>=20
> Thanks,
> Brian
