Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IAm1J-00026C-UL
	for linux-mtd@lists.infradead.org; Tue, 17 Jul 2007 08:19:15 -0400
Subject: Re: UBI: PATCH: -EINTR do not causes ubi to switch to read-only mode.
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vinit Agnihotri <vinit.agnihotri@gmail.com>
In-Reply-To: <9b52d64c0707170452v6c8b8ae0vf2dcf7304947a0c0@mail.gmail.com>
References: <9b52d64c0707170452v6c8b8ae0vf2dcf7304947a0c0@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 17 Jul 2007 15:18:53 +0300
Message-Id: <1184674733.3531.155.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vinit,

your patch again does not apply. Please, try to save your own mail and
apply it with git-am.

Also few notes below.

On Tue, 2007-07-17 at 17:22 +0530, Vinit Agnihotri wrote:
> With reference to previous mails, I am posting patch to handle -EINTR
> separately.
> Now ubi wont switch to read-only mode on receiving -EINTR signal while
> writing or erasing.
>=20
> patch is here:

It is better to include the commit message you would like to see in the
commit instead.

> Signed-off-by: Vinit Agnihotri <vinit.agnihotri@gmail.com>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
This line is unneeded.

> diff -ruN linux-2.6.18.3-vanila/drivers/mtd/ubi/eba.c
> linux-2.6.18.3-mod/drivers/mtd/ubi/eba.c
> --- linux-2.6.18.3-vanila/drivers/mtd/ubi/eba.c	2007-07-09
> 14:28:28.000000000 +0530
> +++ linux-2.6.18.3-mod/drivers/mtd/ubi/eba.c	2007-07-17 16:59:28.00000000=
0 +0530
> @@ -616,6 +616,10 @@
>  			ubi_warn("failed to write data to PEB %d", pnum);
>  			if (err =3D=3D -EIO && ubi->bad_allowed)
>  				err =3D recover_peb(ubi, pnum, vol_id, lnum, buf, offset, len);
> +			if (err =3D=3D -EINTR) {
> +				leb_write_unlock(ubi, vol_id, lnum);
> +				return err;
There is already return statement below. Also it would be nice to add
-ENOMEM check here as well.

>  			if (err)
>  				ubi_ro_mode(ubi);
>  		}
> @@ -673,7 +677,18 @@
>=20
>  write_error:
>  	if (err !=3D -EIO || !ubi->bad_allowed) {
> -		ubi_ro_mode(ubi);
> +		if (err =3D=3D -EINTR) {
> +			err =3D ubi_wl_put_peb(ubi, pnum, 1);	=09
> +			if (err || ++tries > UBI_IO_RETRIES) {
No need to retry if user wants to interrupt. Just put, unlock and return
-EINTR up.

> +				ubi_ro_mode(ubi);
> +				leb_write_unlock(ubi, vol_id, lnum);
> +				ubi_free_vid_hdr(ubi, vid_hdr);
> +				return err;
> +			}
> +			err =3D -EINTR;
> +		}
> +		else
} else

> +			ubi_ro_mode(ubi);
>  		leb_write_unlock(ubi, vol_id, lnum);
>  		ubi_free_vid_hdr(ubi, vid_hdr);
>  		return err;
> @@ -799,7 +814,17 @@
>  		 * something nasty and unexpected happened. Switch to read-only
>  		 * mode just in case.
>  		 */
> -		ubi_ro_mode(ubi);
> +		if (err =3D=3D -EINTR) {
> +			err =3D ubi_wl_put_peb(ubi, pnum, 1);	=09
> +			if (err || ++tries > UBI_IO_RETRIES) {
> +				ubi_ro_mode(ubi);
> +				leb_write_unlock(ubi, vol_id, lnum);
> +				ubi_free_vid_hdr(ubi, vid_hdr);
> +				return err;
> +			}
Similar.

> +			err =3D -EINTR;
> +		} else
> +			ubi_ro_mode(ubi);
>  		leb_write_unlock(ubi, vol_id, lnum);
>  		ubi_free_vid_hdr(ubi, vid_hdr);
>  		return err;
> diff -ruN linux-2.6.18.3-vanila/drivers/mtd/ubi/wl.c
> linux-2.6.18.3-mod/drivers/mtd/ubi/wl.c
> --- linux-2.6.18.3-vanila/drivers/mtd/ubi/wl.c	2007-07-09
> 14:28:28.000000000 +0530
> +++ linux-2.6.18.3-mod/drivers/mtd/ubi/wl.c	2007-07-17 16:37:44.000000000=
 +0530
> @@ -1103,6 +1103,10 @@
>  		 * this physical eraseblock for erasure again would cause
>  		 * errors again and again. Well, lets switch to RO mode.
>  		 */
> +		if (err =3D=3D -EINTR) {
> +			err =3D schedule_erase(ubi, e, 0);
> +			return -EINTR;
> +		}
Please, amend comments as well otherwise they do not match the code.

>  		ubi_ro_mode(ubi);
>  		return err;
>  	}
--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
