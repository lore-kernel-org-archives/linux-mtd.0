Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bv03i-0000M1-4W
 for linux-mtd@lists.infradead.org; Fri, 14 Oct 2016 10:49:51 +0000
Date: Fri, 14 Oct 2016 12:49:28 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Weinberger <richard@nod.at>, Brian Norris
 <computersforpeace@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] UBI: Fix crash in try_recover_peb()
Message-ID: <20161014124928.5a27ed59@bbrezillon>
In-Reply-To: <20161013162458.0219177b@bbrezillon>
References: <1476367536-24782-1-git-send-email-geert@linux-m68k.org>
 <20161013162458.0219177b@bbrezillon>
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

On Thu, 13 Oct 2016 16:24:58 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi Geert,
>=20
> On Thu, 13 Oct 2016 16:05:36 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>=20
> >     drivers/mtd/ubi/eba.c: In function =E2=80=98try_recover_peb=E2=80=
=99:
> >     drivers/mtd/ubi/eba.c:744: warning: =E2=80=98vid_hdr=E2=80=99 is us=
ed uninitialized in this function
> >=20
> > The pointer vid_hdr is indeed not initialized, leading to a crash when
> > it is dereferenced.
> >=20
> > Fix this by obtaining the pointer from the VID buffer, like is done
> > everywhere else. =20
>=20
> Indeed, I don't know how I missed that one :-/.

That's really weird. I tried to recompile the kernel on my machine
(before applying your patch), to see if the compiler was complaining,
and it's not :-(.

I also coded simple functions with goto statements, to check that the
detection was working correctly, and it is.

Maybe you have some ideas why my compiler is failing to detect the
problem (I'm currently using the ubuntu cross-toolchain:
'arm-linux-gnueabi-gcc (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.1) 5.4.0
20160609').

>=20
> >=20
> > Fixes: 3291b52f9ff0acc8 ("UBI: introduce the VID buffer concept")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org> =20
>=20
> One minor comment below, otherwise
>=20
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>=20
> > ---
> > Completely untested. And I know nothing about UBI ;-)
> > ---
> >  drivers/mtd/ubi/eba.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
> > index 95c4048a371e87b6..388e46be6ad92805 100644
> > --- a/drivers/mtd/ubi/eba.c
> > +++ b/drivers/mtd/ubi/eba.c
> > @@ -741,6 +741,7 @@ static int try_recover_peb(struct ubi_volume *vol, =
int pnum, int lnum,
> >  		goto out_put;
> >  	}
> > =20
> > +	vid_hdr =3D ubi_get_vid_hdr(vidb); =20
>=20
> Can you move this assignment at variable declaration time?
>=20
> >  	ubi_assert(vid_hdr->vol_type =3D=3D UBI_VID_DYNAMIC);
> > =20
> >  	mutex_lock(&ubi->buf_mutex); =20
>=20
