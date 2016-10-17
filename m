Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bw5gp-0002b8-M6
 for linux-mtd@lists.infradead.org; Mon, 17 Oct 2016 11:02:47 +0000
Date: Mon, 17 Oct 2016 13:02:18 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Richard Weinberger <richard@nod.at>, Brian Norris
 <computersforpeace@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, MTD Maling List
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] UBI: Fix crash in try_recover_peb()
Message-ID: <20161017130218.1d2e19e3@bbrezillon>
In-Reply-To: <CAMuHMdVJJxN2bU6JVsia9uDMonczqMw3SiAu-eygnHVLUqcqMg@mail.gmail.com>
References: <1476367536-24782-1-git-send-email-geert@linux-m68k.org>
 <20161013162458.0219177b@bbrezillon>
 <CAMuHMdVJJxN2bU6JVsia9uDMonczqMw3SiAu-eygnHVLUqcqMg@mail.gmail.com>
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

On Mon, 17 Oct 2016 10:00:25 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Boris,
>=20
> On Thu, Oct 13, 2016 at 4:24 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Thu, 13 Oct 2016 16:05:36 +0200
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > =20
> >>     drivers/mtd/ubi/eba.c: In function =E2=80=98try_recover_peb=E2=80=
=99:
> >>     drivers/mtd/ubi/eba.c:744: warning: =E2=80=98vid_hdr=E2=80=99 is u=
sed uninitialized in this function
> >>
> >> The pointer vid_hdr is indeed not initialized, leading to a crash when
> >> it is dereferenced.
> >>
> >> Fix this by obtaining the pointer from the VID buffer, like is done
> >> everywhere else. =20
> >
> > Indeed, I don't know how I missed that one :-/.
> > =20
> >>
> >> Fixes: 3291b52f9ff0acc8 ("UBI: introduce the VID buffer concept")
> >> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org> =20
> >
> > One minor comment below, otherwise
> >
> > Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com> =20
>=20
> Thanks!
>=20
> >> ---
> >> Completely untested. And I know nothing about UBI ;-)
> >> ---
> >>  drivers/mtd/ubi/eba.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
> >> index 95c4048a371e87b6..388e46be6ad92805 100644
> >> --- a/drivers/mtd/ubi/eba.c
> >> +++ b/drivers/mtd/ubi/eba.c
> >> @@ -741,6 +741,7 @@ static int try_recover_peb(struct ubi_volume *vol,=
 int pnum, int lnum,
> >>               goto out_put;
> >>       }
> >>
> >> +     vid_hdr =3D ubi_get_vid_hdr(vidb); =20
> >
> > Can you move this assignment at variable declaration time? =20
>=20
> I can do that. However, that moves the call to ubi_get_vid_hdr() _before_
> the call to ubi_io_read_vid_hdr().
>=20
> While that would still work (ubi_get_vid_hdr() would just return a pointe=
r to
> the not-yet-read data), I think it's better to not move it, to prevent pe=
ople
> from accidentally trying to use it before the data has been read.

Well, maybe. I just thought it would be safer to assign it as early as
possible to avoid another 'uninitialized var' bug if move code around
again (which will happen soon ;-)).

Anyway, it's not that important, I'll let Richard take the version
he prefers.

Thanks again for the fix.

Boris
