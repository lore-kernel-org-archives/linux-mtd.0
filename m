Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ucrq9-0000T4-D3
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 06:39:02 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Artem
 Bityutskiy" <dedekind1@gmail.com>
Subject: RE: [PATCH] UBI: optimize vid-header IO read checks
Date: Thu, 16 May 2013 06:38:35 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9C4E67@DBDE04.ent.ti.com>
References: <1367157069-18994-1-git-send-email-pekon@ti.com>
In-Reply-To: <1367157069-18994-1-git-send-email-pekon@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,=20

Requesting feedbacks/comments on this one too ?
This should be independent of previous one..

with regards, pekon

> -----Original Message-----
> From: Gupta, Pekon
> Sent: Sunday, April 28, 2013 7:21 PM
> To: linux-mtd@lists.infradead.org
> Cc: Gupta, Pekon
> Subject: [PATCH] UBI: optimize vid-header IO read checks
>=20
> From: "Gupta, Pekon" <pekon@ti.com>
>=20
> This patch is extension of earlier patch
> 	'UBI: optimize erase-header IO read checksUBI'
>=20
> During mounting of UBI device, ec_hdr and vid_hdr of all PEB are
> scanned.
> This patch tries to reduce the PEB scan time, by optimizing
> ubi_io_read_vid_hdr
> based on following analysis.
> -------------------------------------------------------------------------=
-
> EC_HDR	VID_HDR	CONCLUSION		NEXT STEP
> -------------------------------------------------------------------------=
-
> valid	valid	PEB contains data	map PEB to corresponding LEB
> valid	blank	PEB is free		attach to free list
> valid	invalid	PEB may contain data	try recovering data
>=20
> invalid valid	PEB may contain data	try recovering data
> invalid blank	PEB is free[1]		schedule for erasure
> invalid invalid	underministic		schedule for erasure
> -------------------------------------------------------------------------=
-
>=20
> EC_HDR or VID_HDR may read 'invalid' due to following reasons:
> (a) contains non-UBI data.
> (b) block is completely erased.
> (b) header corrupted due to power-failure during program or erase
> operation.
> (c) header corrupted due to bitflips after program or erase operation.
>=20
> Signed-off-by: Gupta, Pekon <pekon@ti.com>
> ---
>  drivers/mtd/ubi/io.c | 110 +++++++++++++++++++++++++++++++------
> --------------
>  1 file changed, 68 insertions(+), 42 deletions(-)
>=20
> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> index 0b9b0af..1446137 100644
> --- a/drivers/mtd/ubi/io.c
> +++ b/drivers/mtd/ubi/io.c
> @@ -532,7 +532,7 @@ static int nor_erase_prepare(struct ubi_device
> *ubi, int pnum)
>  	 */
>  	err1 =3D ubi_io_read_vid_hdr(ubi, pnum, &vid_hdr, 0);
>  	if (err1 =3D=3D UBI_IO_BAD_HDR_EBADMSG || err1 =3D=3D
> UBI_IO_BAD_HDR ||
> -	    err1 =3D=3D UBI_IO_FF) {
> +	    err1 =3D=3D UBI_IO_FF || err1 =3D=3D UBI_IO_FF_BITFLIPS) {
>  		struct ubi_ec_hdr ec_hdr;
>=20
>  		err1 =3D ubi_io_read_ec_hdr(ubi, pnum, &ec_hdr, 0);
> @@ -829,7 +829,6 @@ int ubi_io_write_ec_hdr(struct ubi_device *ubi,
> int pnum,
>  {
>  	int err;
>  	uint32_t crc;
> -
>  	dbg_io("write EC header to PEB %d", pnum);
>  	ubi_assert(pnum >=3D 0 &&  pnum < ubi->peb_count);
>=20
> @@ -998,60 +997,87 @@ int ubi_io_read_vid_hdr(struct ubi_device
> *ubi, int pnum,
>  	p =3D (char *)vid_hdr - ubi->vid_hdr_shift;
>  	read_err =3D ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
>  			  ubi->vid_hdr_alsize);
> -	if (read_err && read_err !=3D UBI_IO_BITFLIPS &&
> !mtd_is_eccerr(read_err))
> -		return read_err;
> -
> -	magic =3D be32_to_cpu(vid_hdr->magic);
> -	if (magic !=3D UBI_VID_HDR_MAGIC) {
> -		if (mtd_is_eccerr(read_err))
> +	switch (read_err) {
> +	case -EBADMSG:
> +		/* un-correctable bit-flips detected
> +		 * Case-1: hdr_crc !=3D crc(vid_hdr)
> +		 *	uncorrectable bit-flips detected within header
> region.
> +		 *	header data cannot be trusted.
> +		 * Case-2: hdr_crc =3D=3D crc(vid_hdr)
> +		 *	uncorrectable bit-flip do not effect header
> region.
> +		 *	header data can be parsed.
> +		 */
> +		crc =3D crc32(UBI_CRC32_INIT, vid_hdr,
> UBI_VID_HDR_SIZE_CRC);
> +		hdr_crc =3D be32_to_cpu(vid_hdr->hdr_crc);
> +		if (hdr_crc =3D=3D crc)
> +			goto good_vid_hdr;
> +		else
>  			return UBI_IO_BAD_HDR_EBADMSG;
> +		break;
>=20
> -		if (ubi_check_pattern(vid_hdr, 0xFF,
> UBI_VID_HDR_SIZE)) {
> +	case 0:
> +	case UBI_IO_BITFLIPS:
> +		/* check whether this is UBI vid-hdr */
> +		magic =3D be32_to_cpu(vid_hdr->magic);
> +		if (magic =3D=3D UBI_VID_HDR_MAGIC) {
> +			/* check hdr-crc (data integrity check) */
> +			crc =3D crc32(UBI_CRC32_INIT, vid_hdr,
> +
> 	UBI_VID_HDR_SIZE_CRC);
> +			hdr_crc =3D be32_to_cpu(vid_hdr->hdr_crc);
> +			if (hdr_crc =3D=3D crc) {
> +				goto good_vid_hdr;
> +			} else {
> +				if (verbose) {
> +					ubi_warn("bad vid_hdr CRC at
> PEB %d",
> +
> 	pnum);
> +					ubi_dump_vid_hdr(vid_hdr);
> +				}
> +				ubi_warn("bad vid_hdr CRC at PEB %d",
> pnum);
> +				if (read_err)
> +					return
> UBI_IO_BAD_HDR_EBADMSG;
> +				else
> +					return UBI_IO_BAD_HDR;
> +			}
> +
> +		/* BUT UNLIKE EC_HDR, we need to explicit check for
> +		* vid-hdr(data) =3D=3D all(0xFF) because vid_hdr is written
> only
> +		* when PEB is mapped to LEB, Thus valid free PEB will still
> +		* have blank vid_hdr.
> +		*/
> +		} else if (ubi_check_pattern(vid_hdr, 0xFF,
> +
> 	UBI_VID_HDR_SIZE)) {
>  			if (verbose)
> -				ubi_warn("no VID header found at PEB
> %d, only 0xFF bytes",
> -					 pnum);
> -			dbg_bld("no VID header found at PEB %d, only
> 0xFF bytes",
> -				pnum);
> -			if (!read_err)
> -				return UBI_IO_FF;
> -			else
> -				return UBI_IO_FF_BITFLIPS;
> -		}
> +				ubi_warn("No vid_hdr found at PEB %d",
> pnum);
> +			dbg_bld("No vid_hdr found at PEB %d", pnum);
> +			return (read_err) ? UBI_IO_FF_BITFLIPS :
> UBI_IO_FF;
>=20
> -		if (verbose) {
> -			ubi_warn("bad magic number at PEB %d: %08x
> instead of %08x",
> -				 pnum, magic, UBI_VID_HDR_MAGIC);
> -			ubi_dump_vid_hdr(vid_hdr);
> +		/* its a programmed page, but does not contain UBI
> vid_hdr */
> +		} else {
> +			if (verbose) {
> +				ubi_warn("invalid vid_hdr at PEB %d",
> pnum);
> +				ubi_dump_vid_hdr(vid_hdr);
> +			}
> +			dbg_bld("invalid vid_hdr at PEB %d", pnum);
> +			return UBI_IO_BAD_HDR_EBADMSG;
>  		}
> -		dbg_bld("bad magic number at PEB %d: %08x instead of
> %08x",
> -			pnum, magic, UBI_VID_HDR_MAGIC);
> -		return UBI_IO_BAD_HDR;
> -	}
> -
> -	crc =3D crc32(UBI_CRC32_INIT, vid_hdr, UBI_VID_HDR_SIZE_CRC);
> -	hdr_crc =3D be32_to_cpu(vid_hdr->hdr_crc);
> +		break;
>=20
> -	if (hdr_crc !=3D crc) {
> -		if (verbose) {
> -			ubi_warn("bad CRC at PEB %d, calculated %#08x,
> read %#08x",
> -				 pnum, crc, hdr_crc);
> -			ubi_dump_vid_hdr(vid_hdr);
> -		}
> -		dbg_bld("bad CRC at PEB %d, calculated %#08x, read
> %#08x",
> -			pnum, crc, hdr_crc);
> -		if (!read_err)
> -			return UBI_IO_BAD_HDR;
> -		else
> -			return UBI_IO_BAD_HDR_EBADMSG;
> +	default:
> +		/* -EIO (may be incomplete page reads) */
> +		return read_err;
>  	}
>=20
> +good_vid_hdr:
>  	err =3D validate_vid_hdr(ubi, vid_hdr);
>  	if (err) {
>  		ubi_err("validation failed for PEB %d", pnum);
>  		return -EINVAL;
>  	}
>=20
> -	return read_err ? UBI_IO_BITFLIPS : 0;
> +	if (read_err)
> +		return UBI_IO_BITFLIPS;
> +	else
> +		return 0;
>  }
>=20
>  /**
> --
> 1.8.1
