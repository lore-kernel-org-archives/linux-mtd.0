Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ucrog-0000QF-Sm
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 06:37:32 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Artem
 Bityutskiy (artem.bityutskiy@linux.intel.com)"
 <artem.bityutskiy@linux.intel.com>
Subject: RE: [PATCH] UBI: optimize erase-header IO read checks
Date: Thu, 16 May 2013 06:37:03 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9C4E56@DBDE04.ent.ti.com>
References: <1367212058-10429-1-git-send-email-pekon@ti.com>
In-Reply-To: <1367212058-10429-1-git-send-email-pekon@ti.com>
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

Any feedbacks/comments on below..

with regards, pekon

>=20
> From: "Gupta, Pekon" <pekon@ti.com>
>=20
> During mounting of UBI volume, ec_hdr and vid_hdr of all PEB are
> scanned.
> This scanning helps:
> - To re-create PEB to LEB map.
> - To filter out bad PEB or alien (non-UBI) PEB.
> - To identify corrupt PEB, and recover data.
> This volume recovery time is critical for some use-cases where system
> should
> should be back online as soon as possible after the fault (like power-
> failure).
>=20
> This patch tries to optimize the erase-header IO reads by
> - re-ordering data checks based on below analysis.
> - removing ubi_check_pattern(ec_hdr, 0xFF, UBI_EC_HDR_SIZE)
> 	(checking of 0xFF in page-data)
> 	- REASON1: even if first few bytes 'sizeof(ec_hdr)' of page-data
> are
> 		0xFF, still it does not guarantee that page is erased |
> blank.
> 	- REASON2: As per analysis below, pages with invalid magic-
> number need
> 		 to be erased in most of the conditions. Thus explicit
> checking
> 		 of 0xFF in page-data can be avoided.
>=20
> MTD device driver can return following return-code for read access
> (mtd_read)
> -------------------------------------------------------------------------=
-
> RETURN_VALUE	REASON
> 	NEXT STEP
> -------------------------------------------------------------------------=
-
> 0		no errors or bit-flips detected		parse data
>=20
> EUCLEAN		correctable bit-flips detected		parse
> data & scrub PEB
>=20
> EBADMSG		uncorrectable bit-flip detected		parse
> data & scrub PEB
>=20
> <others>	device error or incomplete data		reject
> data
> -------------------------------------------------------------------------=
-
>=20
> Parsing the read_data can result in following combinations:
> -------------------------------------------------------------------------=
-
>                 MAGIC
> ECC	HDR_CRC	NUMBER	CONCLUSION
> 	NEXT STEP
> -------------------------------------------------------------------------=
-
> OK	valid	valid*	valid UBI erase_header		parse header
> EUCLEAN	valid	valid*	valid UBI erase_header		parse
> header
> EBADMSG	valid	valid*	valid UBI erase_header		parse
> header
>=20
> OK	invalid	valid	corrupted UBI erase_header	depends on
> vid_hdr
> EUCLEAN	invalid	valid	corrupted UBI erase_header	depends
> on vid_hdr
> EBADMSG invalid	--	undeterministic_data**
> 	schedule for erasure
>=20
> OK	invalid	invalid	undeterministic_data**		schedule
> for erasure
> EUCLEAN	invalid	invalid	undeterministic_data**
> 	schedule for erasure
> EBADMSG invalid	invalid	undeterministic_data**
> 	schedule for erasure
> -------------------------------------------------------------------------=
-
>=20
> where
> 'valid*': As hdr_crc covers magic-number field so matching of hdr_crc
> 	implicitely indicates matching of magic=3Dnumber.
>=20
> underministic_data**: page-data can be any of the following
> 	(a) programmed page (non-UBI data)
> 	(c) erased page	without bit-flips
> 	(d) erased page	with bit-flips
> 	(d) valid UBI erase_header with un-recoverable bit-flips
> 	    corrupting erase-header content.
>=20
> Signed-off-by: Gupta, Pekon <pekon@ti.com>
> ---
>  drivers/mtd/ubi/attach.c |  10 ++++
>  drivers/mtd/ubi/io.c     | 119 ++++++++++++++++++-----------------------=
-
> -----
>  2 files changed, 56 insertions(+), 73 deletions(-)
>=20
> diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
> index c071d41..9dff909 100644
> --- a/drivers/mtd/ubi/attach.c
> +++ b/drivers/mtd/ubi/attach.c
> @@ -848,6 +848,16 @@ static int scan_peb(struct ubi_device *ubi, struct
> ubi_attach_info *ai,
>  		return add_to_list(ai, pnum, UBI_UNKNOWN,
> UBI_UNKNOWN,
>  				   UBI_UNKNOWN, 1, &ai->erase);
>  	case UBI_IO_BAD_HDR_EBADMSG:
> +		/* un=3Drecoverable erase-header
> +		* unknown erase-count: can be set to mean erase-
> count.
> +		* unknown image_seq: cannot determine if PEB was
> programmed
> +		* unknown version: cannot determine UBI protocol to
> use
> +		* So no point in checking vid_hdr, schedule this PEB for
> erase.
> +		*/
> +		ai->empty_peb_count +=3D 1;
> +		return add_to_list(ai, pnum, UBI_UNKNOWN,
> UBI_UNKNOWN,
> +				   UBI_UNKNOWN, 1, &ai->erase);
> +
>  	case UBI_IO_BAD_HDR:
>  		/*
>  		 * We have to also look at the VID header, possibly it is
> not
> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> index bf79def..624365b 100644
> --- a/drivers/mtd/ubi/io.c
> +++ b/drivers/mtd/ubi/io.c
> @@ -537,7 +537,7 @@ static int nor_erase_prepare(struct ubi_device
> *ubi, int pnum)
>=20
>  		err1 =3D ubi_io_read_ec_hdr(ubi, pnum, &ec_hdr, 0);
>  		if (err1 =3D=3D UBI_IO_BAD_HDR_EBADMSG || err1 =3D=3D
> UBI_IO_BAD_HDR ||
> -		    err1 =3D=3D UBI_IO_FF)
> +		    err1 =3D=3D UBI_IO_FF || err1 =3D=3D UBI_IO_FF_BITFLIPS)
>  			/*
>  			 * Both VID and EC headers are corrupted, so we
> can
>  			 * safely erase this PEB and not afraid that it will
> be
> @@ -741,93 +741,66 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi,
> int pnum,
>  		       struct ubi_ec_hdr *ec_hdr, int verbose)
>  {
>  	int err, read_err;
> -	uint32_t crc, magic, hdr_crc;
> +	uint32_t crc, hdr_crc;
>=20
>  	dbg_io("read EC header from PEB %d", pnum);
>  	ubi_assert(pnum >=3D 0 && pnum < ubi->peb_count);
>=20
>  	read_err =3D ubi_io_read(ubi, ec_hdr, pnum, 0,
> UBI_EC_HDR_SIZE);
> -	if (read_err) {
> -		if (read_err !=3D UBI_IO_BITFLIPS &&
> !mtd_is_eccerr(read_err))
> -			return read_err;
> -
> -		/*
> -		 * We read all the data, but either a correctable bit-flip
> -		 * occurred, or MTD reported a data integrity error
> -		 * (uncorrectable ECC error in case of NAND). The former
> is
> -		 * harmless, the later may mean that the read data is
> -		 * corrupted. But we have a CRC check-sum and we will
> detect
> -		 * this. If the EC header is still OK, we just report this as
> -		 * there was a bit-flip, to force scrubbing.
> -		 */
> -	}
> -
> -	magic =3D be32_to_cpu(ec_hdr->magic);
> -	if (magic !=3D UBI_EC_HDR_MAGIC) {
> -		if (mtd_is_eccerr(read_err))
> -			return UBI_IO_BAD_HDR_EBADMSG;
> -
> -		/*
> -		 * The magic field is wrong. Let's check if we have read all
> -		 * 0xFF. If yes, this physical eraseblock is assumed to be
> -		 * empty.
> +	switch (read_err) {
> +	case -EBADMSG:
> +		/* un-correctable bit-flips detected
> +		 * Case-1: hdr_crc !=3D crc(ec_hdr)
> +		 *	uncorrectable bit-flips detected within header
> region.
> +		 *	header data cannot be trusted.
> +		 * Case-2: hdr_crc =3D=3D crc(ec_hdr)
> +		 *	uncorrectable bit-flip do not effect header
> region.
> +		 *	header data can be parsed.
>  		 */
> -		if (ubi_check_pattern(ec_hdr, 0xFF, UBI_EC_HDR_SIZE))
> {
> -			/* The physical eraseblock is supposedly empty
> */
> -			if (verbose)
> -				ubi_warn("no EC header found at PEB
> %d, only 0xFF bytes",
> -					 pnum);
> -			dbg_bld("no EC header found at PEB %d, only
> 0xFF bytes",
> -				pnum);
> -			if (!read_err)
> -				return UBI_IO_FF;
> -			else
> -				return UBI_IO_FF_BITFLIPS;
> -		}
> -
> -		/*
> -		 * This is not a valid erase counter header, and these are
> not
> -		 * 0xFF bytes. Report that the header is corrupted.
> -		 */
> -		if (verbose) {
> -			ubi_warn("bad magic number at PEB %d: %08x
> instead of %08x",
> -				 pnum, magic, UBI_EC_HDR_MAGIC);
> -			ubi_dump_ec_hdr(ec_hdr);
> -		}
> -		dbg_bld("bad magic number at PEB %d: %08x instead of
> %08x",
> -			pnum, magic, UBI_EC_HDR_MAGIC);
> -		return UBI_IO_BAD_HDR;
> -	}
> -
> -	crc =3D crc32(UBI_CRC32_INIT, ec_hdr, UBI_EC_HDR_SIZE_CRC);
> -	hdr_crc =3D be32_to_cpu(ec_hdr->hdr_crc);
> -
> -	if (hdr_crc !=3D crc) {
> -		if (verbose) {
> -			ubi_warn("bad EC header CRC at PEB %d,
> calculated %#08x, read %#08x",
> -				 pnum, crc, hdr_crc);
> -			ubi_dump_ec_hdr(ec_hdr);
> +		crc =3D crc32(UBI_CRC32_INIT, ec_hdr,
> UBI_EC_HDR_SIZE_CRC);
> +		hdr_crc =3D be32_to_cpu(ec_hdr->hdr_crc);
> +		if (hdr_crc =3D=3D crc)
> +			/* implicitely checks magic-number also */
> +			goto good_ec_hdr;
> +		else
> +			/* undeterministic data */
> +			return  UBI_IO_BAD_HDR_EBADMSG;
> +		break;
> +	case 0:
> +	case UBI_IO_BITFLIPS:
> +		crc =3D crc32(UBI_CRC32_INIT, ec_hdr,
> UBI_EC_HDR_SIZE_CRC);
> +		hdr_crc =3D be32_to_cpu(ec_hdr->hdr_crc);
> +		/* In a stable UBI system, most PEB will match hdr_crc */
> +		if (likely(hdr_crc =3D=3D crc)) {
> +			/* magic-number check implicetely covered in
> CRC */
> +			goto good_ec_hdr;
> +		} else {
> +			/* Not a vid-hdr. It can be:
> +			 * - programmed page with non-UBI data
> +			 * - completely erased block
> +			 */
> +			if (verbose) {
> +				ubi_warn("bad magic number in ec-hdr
> of PEB %d"
> +								, pnum);
> +				ubi_dump_ec_hdr(ec_hdr);
> +			}
> +			dbg_bld("bad magic number in ec-hdr of PEB
> %d", pnum);
> +			return  UBI_IO_BAD_HDR_EBADMSG;
>  		}
> -		dbg_bld("bad EC header CRC at PEB %d, calculated
> %#08x, read %#08x",
> -			pnum, crc, hdr_crc);
> +		break;
>=20
> -		if (!read_err)
> -			return UBI_IO_BAD_HDR;
> -		else
> -			return UBI_IO_BAD_HDR_EBADMSG;
> +	default:
> +		/* -EIO (may be incomplete page reads) */
> +		return read_err;
>  	}
>=20
> -	/* And of course validate what has just been read from the
> media */
> +good_ec_hdr:
>  	err =3D validate_ec_hdr(ubi, ec_hdr);
>  	if (err) {
>  		ubi_err("validation failed for PEB %d", pnum);
>  		return -EINVAL;
>  	}
> -
> -	/*
> -	 * If there was %-EBADMSG, but the header CRC is still OK, report
> about
> -	 * a bit-flip to force scrubbing on this PEB.
> -	 */
> +	 /* UBI_IO_BITFLIPS it will force scrubbing this PEB*/
>  	return read_err ? UBI_IO_BITFLIPS : 0;
>  }
>=20
> --
> 1.8.1
