Received: from mail.karo-electronics.de ([81.173.242.67])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6DCT-0006ER-Ta
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 05:51:39 +0000
Date: Thu, 23 Jan 2014 06:51:07 +0100
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: Akinobu Mita <akinobu.mita@gmail.com>
Subject: Re: [PATCH] mtd: mtd_oobtest: fix verify errors due to incorrect
 use of prandom_bytes_state()
Message-ID: <20140123065107.099f9f86@ipc1.ka-ro>
In-Reply-To: <CAC5umyjU5xoFJ1piLoWGciT=Y+H3-nqr38FGVMR-vdKhkOO-Qw@mail.gmail.com>
References: <1389608739-10945-1-git-send-email-LW@KARO-electronics.de>
 <20140122150959.78cf2827@ipc1.ka-ro>
 <CAC5umyhC+9zwwX7Mswo2uAc0pFqp7Np1D+nFwr7Y3TS3OLT6-A@mail.gmail.com>
 <20140122164115.211a819d@ipc1.ka-ro>
 <CAC5umyjU5xoFJ1piLoWGciT=Y+H3-nqr38FGVMR-vdKhkOO-Qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Akinobu Mita wrote:
> 2014/1/23 Lothar Wa=C3=9Fmann <LW@karo-electronics.de>:
> > Hi,
> >
> > Akinobu Mita wrote:
> >> 2014/1/22 Lothar Wa=C3=9Fmann <LW@karo-electronics.de>:
> >> > Hi,
> >> >
> >> > Is anyone taking care of this?
> >> >
> >> > Lothar Wa=C3=9Fmann wrote:
> >> >> When using prandom_bytes_state() it is critical to use the same blo=
ck
> >> >> size in all invocations that are to produce the same random sequenc=
e.
> >> >> Otherwise the state of the PRNG will be out of sync if the blocksize
> >> >> is not divisible by 4.
> >> >> This leads to bogus verification errors in several tests which use
> >> >> different block sizes to initialize the buffer for writing and
> >> >> comparison.
> >> >>
> >> >> Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
> >> >> ---
> >> >>  drivers/mtd/tests/oobtest.c |   14 ++++++++++++--
> >> >>  1 files changed, 12 insertions(+), 2 deletions(-)
> >> >>
> >> >> diff --git a/drivers/mtd/tests/oobtest.c b/drivers/mtd/tests/oobtes=
t.c
> >> >> index 2e9e2d1..72c7359 100644
> >> >> --- a/drivers/mtd/tests/oobtest.c
> >> >> +++ b/drivers/mtd/tests/oobtest.c
> >> >> @@ -213,8 +213,15 @@ static int verify_eraseblock_in_one_go(int ebn=
um)
> >> >>       int err =3D 0;
> >> >>       loff_t addr =3D ebnum * mtd->erasesize;
> >> >>       size_t len =3D mtd->ecclayout->oobavail * pgcnt;
> >> >> +     int i;
> >> >> +
> >> >> +     for (i =3D 0; i < pgcnt; i++)
> >> >> +             prandom_bytes_state(&rnd_state, &writebuf[i * use_len=
],
> >> >> +                             use_len);
> >> >> +     if (len % use_len)
> >> >> +             prandom_bytes_state(&rnd_state, &writebuf[i * use_len=
],
> >> >> +                             len % use_len);
> >> >>
> >> >> -     prandom_bytes_state(&rnd_state, writebuf, len);
> >> >>       ops.mode      =3D MTD_OPS_AUTO_OOB;
> >> >>       ops.len       =3D 0;
> >> >>       ops.retlen    =3D 0;
> >>
> >> I would rather fix the use of prandom_bytes_state() in write_erasebloc=
k()
> >> than fix in verify_eraseblock_in_one_go().
> >>
> > Why and how?
>=20
> I thought that it could reduce calls of prandom_bytes_state() and
> it makes code simpler than increasing calls.
>=20
> > write_whole_device() (which calls write_eraseblock()) is used multiple
> > times with different verification methods (all blocks in one go or each
> > block individually).
> > If prandom_state_bytes() in write_eraseblock() would be changed, that
> > function would have to know, how the block are going to be checked
> > lateron to know how to set up the writebuffer.
>=20
> Instead of calling prandom_bytes_state() in the for loop in
> write_eraseblock(), call prandom_bytes_state() at once before going
> into the loop and use correct offset in writebuf in the loop.
> Although, we also need to fix verify_eraseblock() in the same way.
>=20
> Doesn't that fix this problem?
>
Of course one could fix it that way, but that would be a much more
invasive change that also needs more testing.


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
