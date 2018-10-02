Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7GTv-00031d-Du
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2018 08:56:54 +0000
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?0JzRj9GB0L7QtdC00L7QsiDQkC7Qri4=?= <myasoedovau@ircoc.vrn.ru>,
 linux-mtd@lists.infradead.org
Cc: "David Oberhollenzer (david.oberhollenzer@sigma-star.at)"
 <david.oberhollenzer@sigma-star.at>
Subject: Re: How to organize UBI volumes and power crash
Date: Tue, 02 Oct 2018 10:56:23 +0200
Message-ID: <10059393.qm9dNCvvdv@blindfold>
In-Reply-To: <5BB331EC.60204@ircoc.vrn.ru>
References: <5BB32167.1040902@ircoc.vrn.ru>
 <CAFLxGvzDTi+tU6LT7r4QpxvM=f+mg5j8VOfyV5gZihu5-UWreg@mail.gmail.com>
 <5BB331EC.60204@ircoc.vrn.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag, 2. Oktober 2018, 10:53:00 CEST schrieb =D0=9C=D1=8F=D1=81=D0=
=BE=D0=B5=D0=B4=D0=BE=D0=B2 =D0=90.=D0=AE.:
> Thank ypu, Richard.
>=20
> >  Both UBI and UBIFS must not corrupt upon a powercut, if you face such =
an
> issue, please report. This could be a bug or a hardware problem.
>=20
> But http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits=20
> says about such possible problems (unstable bits).

This problem is highly theoretical and so far I have never seen it.
So far anyone that claimed to suffer from that was wrong and it turned out =
that
it was some other issue.

It is time to remove that paragraph from the website since it confuses user
over and over.
David, can you please file and merge a patch?
=20
>  >  The general recommendation is having the MTD partition and therefore=
=20
> the UBI device as large as possible such that the wear leveling large.
> 02.10.2018 11:41, Richard Weinberger =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=
=D0=BB:
>=20
> Do you mean one MTD partition for first UBI volume, and second MTD=20
> partition for another one?

No, just one UBI device on one MTD partition with multiple UBI volumes.

Thanks,
//richard
