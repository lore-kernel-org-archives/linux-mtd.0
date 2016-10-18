Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwMmm-00086O-2B
 for linux-mtd@lists.infradead.org; Tue, 18 Oct 2016 05:18:01 +0000
Date: Tue, 18 Oct 2016 07:17:35 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger
 <richard@nod.at>, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 10/28] UBI: fix uninitialized access of vid_hdr pointer
Message-ID: <20161018071735.1e8a0e26@bbrezillon>
In-Reply-To: <20161017221037.1781185-1-arnd@arndb.de>
References: <20161017220342.1627073-1-arnd@arndb.de>
 <20161017221037.1781185-1-arnd@arndb.de>
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

Hi Arnd,

On Tue, 18 Oct 2016 00:10:13 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> A rework of UBI that just appeared in linux-next during the merge
> window introduced caused the recover_peb to use a variable that
> is never initialized as seen from this gcc warning:
>=20
> drivers/mtd/ubi/eba.c: In function =E2=80=98recover_peb=E2=80=99:
> drivers/mtd/ubi/eba.c:744:40: error: =E2=80=98vid_hdr=E2=80=99 may be use=
d uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>=20
> It seems clear that the change to the function arguments was missing
> the initialization that I'm now adding back to restore the
> way the function was working before.

Thanks for the fix, but Geert already sent a patch for this bug a few
days ago.

Regards,

Boris

>=20
> Fixes: 3291b52f9ff0 ("UBI: introduce the VID buffer concept")
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Richard Weinberger <richard@nod.at>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/mtd/ubi/eba.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
> index 95c4048..2e152be 100644
> --- a/drivers/mtd/ubi/eba.c
> +++ b/drivers/mtd/ubi/eba.c
> @@ -719,7 +719,7 @@ static int try_recover_peb(struct ubi_volume *vol, in=
t pnum, int lnum,
>  			   struct ubi_vid_io_buf *vidb, bool *retry)
>  {
>  	struct ubi_device *ubi =3D vol->ubi;
> -	struct ubi_vid_hdr *vid_hdr;
> +	struct ubi_vid_hdr *vid_hdr =3D ubi_get_vid_hdr(vidb);
>  	int new_pnum, err, vol_id =3D vol->vol_id, data_size;
>  	uint32_t crc;
> =20
