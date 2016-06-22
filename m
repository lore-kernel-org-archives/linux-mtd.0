Received: from pinova.rz.uni-augsburg.de ([137.250.2.102])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFjOi-0006Ya-Tx
 for linux-mtd@lists.infradead.org; Wed, 22 Jun 2016 14:44:58 +0000
From: =?ISO-8859-1?Q?J=F6rg_Pf=E4hler?= <pfaehler@isse.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] ubi: Make recover_peb power cut aware
Date: Wed, 22 Jun 2016 16:44:40 +0200
Message-ID: <2124396.xJgUrQUc0H@pfaehler-pc>
In-Reply-To: <1466461910-18858-1-git-send-email-richard@nod.at>
References: <1466461910-18858-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Reviewed-by: J=F6rg Pf=E4hler <pfaehler@isse.de>

Am Dienstag, 21. Juni 2016, 00:31:50 CEST schrieb Richard Weinberger:
> recover_peb() was never power cut aware,
> if a power cut happened right after writing the VID header
> upon next attach UBI would blindly use the new partial written
> PEB and all data from the old PEB is lost.
>=20
> In order to make recover_peb() power cut aware, write the new
> VID with a proper crc and copy_flag set such that the UBI attach
> process will detect whether the new PEB is completely written
> or not.
> We cannot directly use ubi_eba_atomic_leb_change() since we'd
> have to unlock the LEB which is facing a write error.
>=20
> Cc: stable@vger.kernel.org
> Reported-by: J=F6rg Pf=E4hler <pfaehler@isse.de>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/eba.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
> index 5780dd1..ebf5172 100644
> --- a/drivers/mtd/ubi/eba.c
> +++ b/drivers/mtd/ubi/eba.c
> @@ -575,6 +575,7 @@ static int recover_peb(struct ubi_device *ubi, int pn=
um,
> int vol_id, int lnum, int err, idx =3D vol_id2idx(ubi, vol_id), new_pnum,
> data_size, tries =3D 0; struct ubi_volume *vol =3D ubi->volumes[idx];
>  	struct ubi_vid_hdr *vid_hdr;
> +	uint32_t crc;
>=20
>  	vid_hdr =3D ubi_zalloc_vid_hdr(ubi, GFP_NOFS);
>  	if (!vid_hdr)
> @@ -599,14 +600,8 @@ retry:
>  		goto out_put;
>  	}
>=20
> -	vid_hdr->sqnum =3D cpu_to_be64(ubi_next_sqnum(ubi));
> -	err =3D ubi_io_write_vid_hdr(ubi, new_pnum, vid_hdr);
> -	if (err) {
> -		up_read(&ubi->fm_eba_sem);
> -		goto write_error;
> -	}
> +	ubi_assert(vid_hdr->vol_type =3D=3D UBI_VID_DYNAMIC);
>=20
> -	data_size =3D offset + len;
>  	mutex_lock(&ubi->buf_mutex);
>  	memset(ubi->peb_buf + offset, 0xFF, len);
>=20
> @@ -621,6 +616,19 @@ retry:
>=20
>  	memcpy(ubi->peb_buf + offset, buf, len);
>=20
> +	data_size =3D offset + len;
> +	crc =3D crc32(UBI_CRC32_INIT, ubi->peb_buf, data_size);
> +	vid_hdr->sqnum =3D cpu_to_be64(ubi_next_sqnum(ubi));
> +	vid_hdr->copy_flag =3D 1;
> +	vid_hdr->data_size =3D cpu_to_be32(data_size);
> +	vid_hdr->data_crc =3D cpu_to_be32(crc);
> +	err =3D ubi_io_write_vid_hdr(ubi, new_pnum, vid_hdr);
> +	if (err) {
> +		mutex_unlock(&ubi->buf_mutex);
> +		up_read(&ubi->fm_eba_sem);
> +		goto write_error;
> +	}
> +
>  	err =3D ubi_io_write_data(ubi, ubi->peb_buf, new_pnum, 0, data_size);
>  	if (err) {
>  		mutex_unlock(&ubi->buf_mutex);


=2D------------------------------------------------------------------------=
=2D------------
J=F6rg Pf=E4hler
Lehrstuhl f=FCr Softwaretechnik
Institut f=FCr Software and Systems Engineering
Universit=E4t Augsburg

Universit=E4tsstr. 6a, Raum 3014
tel:      (+49) 821/598-2229
e-mail:   pfaehler@isse.de<mailto:pfaehler@isse.de>
=2D------------------------------------------------------------------------=
=2D------------
