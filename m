Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZzsK-0002p4-Gp
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 15:04:39 +0000
Received: by mail-io1-xd2e.google.com with SMTP id k4so1048778iop.4
 for <linux-mtd@lists.infradead.org>; Thu, 20 Dec 2018 07:04:22 -0800 (PST)
MIME-Version: 1.0
References: <CABatt_wvwVuzAMp6JX4yUireb3wAuiiF5i+=7FRGDPx3fwxrKA@mail.gmail.com>
 <2102406.fBQmoxhIU4@blindfold>
 <CABatt_zp8nzfbCBowr81ZPt48uVJk8pGHstZg6paLu6WHxK+Fw@mail.gmail.com>
 <3974794.HFKrkWXeJj@blindfold>
In-Reply-To: <3974794.HFKrkWXeJj@blindfold>
From: Martin Townsend <mtownsend1973@gmail.com>
Date: Thu, 20 Dec 2018 15:04:10 +0000
Message-ID: <CABatt_yRNnfrkysYwWuPJ=80nTa5ePNrpmvAq=B=bkcHvA5yig@mail.gmail.com>
Subject: Re: hung task detected in ubifs
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 20, 2018 at 2:28 PM Richard Weinberger <richard@nod.at> wrote:
>
> Am Donnerstag, 20. Dezember 2018, 15:19:24 CET schrieb Martin Townsend:
> > The hung task timeout is the default 2 minutes and it's setup to panic
> > so I don't know if it recovers. I'll ask them to try a longer value or
> > disable the panic and see if it recovers.
>
> Yes, please.
Done.
>
> > I checked and LOCKDEP=3Dy and the held locks are in the original trace.
> > Are there particular locking checks you would like? Currently its
> > setup like this:
> >   =E2=94=82 =E2=94=82    [*] RT Mutex debugging, deadlock detection
> >   =E2=94=82 =E2=94=82    -*- Spinlock and rw-lock debugging: basic chec=
ks
> >   =E2=94=82 =E2=94=82    -*- Mutex debugging: basic checks
> >   =E2=94=82 =E2=94=82    [ ] Wait/wound mutex debugging: Slowpath testi=
ng
> >   =E2=94=82 =E2=94=82    [*] Lock debugging: detect incorrect freeing o=
f live locks
> >   =E2=94=82 =E2=94=82    [ ] Lock debugging: prove locking correctness
>
> Hmm, this should be okay.
> So it does not look like a traditional deadlock.
>
> Basically we need to figure why and where exactly cma_alloc() hangs.
> And of course also we need to know if it is really cma_alloc().
>
> Can you please dig into that?
Will do, would CMA_DEBUG help or would it produce too much log information?
>
> Thanks,
> //richard
>
>
