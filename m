Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXBNn-0002Ar-1m
 for linux-mtd@lists.infradead.org; Sun, 24 Jun 2018 20:13:13 +0000
Date: Sun, 24 Jun 2018 22:12:59 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Kees Cook <keescook@chromium.org>
Cc: Richard Weinberger <richard@nod.at>, LKML
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Linux
 mtd <linux-mtd@lists.infradead.org>, Ivan Djelic <ivan.djelic@parrot.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>
Subject: Re: [PATCH v3] lib/bch: Remove VLA usage
Message-ID: <20180624221259.3c39c77e@bbrezillon>
In-Reply-To: <CAGXu5j+A4jXuf_TO0UF0zp-7kHUEFP8FZY=+mat96CaQ-a87LQ@mail.gmail.com>
References: <20180531184525.GA11068@beast> <20180601110921.GC4695@parrot.com>
 <CAGXu5jJVX5tk3w5etreTPJpoEzXfF9bFD4GNNW69yRHZTEBYiA@mail.gmail.com>
 <20180620093805.6d9c602e@bbrezillon>
 <CAGXu5j+A4jXuf_TO0UF0zp-7kHUEFP8FZY=+mat96CaQ-a87LQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 20 Jun 2018 11:16:11 -0700
Kees Cook <keescook@chromium.org> wrote:

> On Wed, Jun 20, 2018 at 12:38 AM, Boris Brezillon
> <boris.brezillon@bootlin.com> wrote:
> > Hi Kees,
> >
> > On Tue, 19 Jun 2018 16:48:17 -0700
> > Kees Cook <keescook@chromium.org> wrote:
> > =20
> >> On Fri, Jun 1, 2018 at 4:09 AM, Ivan Djelic <ivan.djelic@parrot.com> w=
rote: =20
> >> > On Thu, May 31, 2018 at 11:45:25AM -0700, Kees Cook wrote: =20
> >> >> In the quest to remove all stack VLA usage from the kernel[1], this
> >> >> allocates a fixed size stack array to cover the range needed for
> >> >> bch. This was done instead of a preallocation on the SLAB due to
> >> >> performance reasons, shown by Ivan Djelic:
> >> >>
> >> >>  little-endian, type sizes: int=3D4 long=3D8 longlong=3D8
> >> >>  cpu: Intel(R) Core(TM) i5 CPU         650  @ 3.20GHz
> >> >>  calibration: iter=3D4.9143=C2=B5s niter=3D2034 nsamples=3D200 m=3D=
13 t=3D4
> >> >>
> >> >>    Buffer allocation |  Encoding throughput (Mbit/s)
> >> >>  ---------------------------------------------------
> >> >>   on-stack, VLA      |   3988
> >> >>   on-stack, fixed    |   4494
> >> >>   kmalloc            |   1967
> >> >>
> >> >> So this change actually improves performance too, it seems.
> >> >>
> >> >> The resulting stack allocation can get rather large; without
> >> >> CONFIG_BCH_CONST_PARAMS, it will allocate 4096 bytes, which
> >> >> trips the stack size checking:
> >> >>
> >> >> lib/bch.c: In function =E2=80=98encode_bch=E2=80=99:
> >> >> lib/bch.c:261:1: warning: the frame size of 4432 bytes is larger th=
an 2048 bytes [-Wframe-larger-than=3D]
> >> >>
> >> >> Even the default case for "allmodconfig" (with CONFIG_BCH_CONST_M=
=3D14 and
> >> >> CONFIG_BCH_CONST_T=3D4) would have started throwing a warning:
> >> >>
> >> >> lib/bch.c: In function =E2=80=98encode_bch=E2=80=99:
> >> >> lib/bch.c:261:1: warning: the frame size of 2288 bytes is larger th=
an 2048 bytes [-Wframe-larger-than=3D]
> >> >>
> >> >> But this is how large it's always been; it was just hidden from
> >> >> the checker because it was a VLA. So the Makefile has been adjusted=
 to
> >> >> silence this warning for anything smaller than 4500 bytes, which sh=
ould
> >> >> provide room for normal cases, but still low enough to catch any fu=
ture
> >> >> pathological situations.
> >> >>
> >> >> [1] https://lkml.kernel.org/r/CA+55aFzCG-zNmZwX4A2FQpadafLfEzK6CC=
=3DqPXydAacU1RqZWA@mail.gmail.com
> >> >>
> >> >> Signed-off-by: Kees Cook <keescook@chromium.org>
> >> >> ---
> >> >> v3: fix r_bytes to whole-word size
> >> >> v2: switch to fixed-size stack array
> >> >> ---
> >> >>  lib/Makefile |  1 +
> >> >>  lib/bch.c    | 23 +++++++++++++++--------
> >> >>  2 files changed, 16 insertions(+), 8 deletions(-) =20
> >> >
> >> >
> >> > The patch looks good to me. It also passed my regression tests.
> >> >
> >> > Reviewed-by: Ivan Djelic <ivan.djelic@parrot.com>
> >> > Tested-by: Ivan Djelic <ivan.djelic@parrot.com> =20
> >>
> >> Thanks for the review and testing!
> >>
> >> Who's the best person to carry this patch? =20
> >
> > Looks like all users of this lib are in drivers/mtd, so I can take the
> > patches if you want, but I can also let you take them if you prefer. =20
>=20
> I'd love it if you could take it; thank you!

Applied to mtd/next.

Thanks,

Boris
