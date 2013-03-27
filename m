Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UKlyi-0005mZ-89
 for linux-mtd@lists.infradead.org; Wed, 27 Mar 2013 08:45:06 +0000
Received: from dbdp20.itg.ti.com ([172.24.170.38])
 by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2R8j0n3018246
 for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2013 03:45:01 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
 by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2R8ix4j010099
 for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2013 14:15:00 +0530 (IST)
From: "Gupta, Pekon" <pekon@ti.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH] mtd: nand: subpage write support for hardware based ECC
 schemes
Date: Wed, 27 Mar 2013 08:44:56 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9A50DA@DBDE01.ent.ti.com>
References: <1363352378-2825-1-git-send-email-pekon@ti.com>
In-Reply-To: <1363352378-2825-1-git-send-email-pekon@ti.com>
Content-Language: en-US
Content-Type: multipart/mixed;
 boundary="_002_20980858CB6D3A4BAE95CA194937D5E73E9A50DADBDE01entticom_"
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--_002_20980858CB6D3A4BAE95CA194937D5E73E9A50DADBDE01entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Can someone please test following patch on non-TI devices ?
I have tested this on Micron NAND using TI-OMAP controller:
	MT29F2G08AADWP: 	2K/64 (page=3D2048, subpage=3D512)
	MT29F4G08ABxx:	4K/224 (page=3D4096, subpage=3D1024)
(1) using mtd/tests/mtd_subpage.ko
(2) using UBIFS image of different sizes
	(attaching a generic script to create UBIFS image.)
(3) using loosely written nand-raw test, which writes in multiples of
	subpage lengths=20

But due to un-availability I couldn't test it on other boards.
So, any ACKs | NAKs will help to improve this further.


with regards, pekon


> From: "Gupta, Pekon" <pekon@ti.com>
>=20
> This patch adds support for subpage (partial-page) writes when using
> hardware based ECC schemes.
> Advantages:
> (1) reduces storage overhead when using file-systems like UBIFS, which
> store LEB header at page-size granularity.
> (2) allows independent subpage writes, thereby increasing NAND
> storage
> efficiency for non-page aligned data.
>=20
> Signed-off-by: Gupta, Pekon <pekon@ti.com>
> ---
>  drivers/mtd/nand/nand_base.c | 99
> ++++++++++++++++++++++++++++++++++++++------
>  include/linux/mtd/nand.h     |  8 +++-
>  2 files changed, 92 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c
> b/drivers/mtd/nand/nand_base.c
> index 4321415..5138b6b 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1127,7 +1127,7 @@ static int nand_read_page_swecc(struct
> mtd_info *mtd, struct nand_chip *chip,
>  }
>=20
>  /**
> - * nand_read_subpage - [REPLACEABLE] software ECC based sub-page
> read function
> + * nand_read_subpage - [REPLACEABLE] ECC based sub-page read
> function
>   * @mtd: mtd info structure
>   * @chip: nand chip info structure
>   * @data_offs: offset of requested data within the page
> @@ -1979,6 +1979,67 @@ static int nand_write_page_hwecc(struct
> mtd_info *mtd, struct nand_chip *chip,
>  	return 0;
>  }
>=20
> +
> +/**
> + * nand_write_subpage_hwecc - [REPLACABLE] hardware ECC based
> subpage write
> + * @mtd:	mtd info structure
> + * @chip:	nand chip info structure
> + * @column:	column address of subpage within the page
> + * @data_len:	data length
> + * @oob_required: must write chip->oob_poi to OOB
> + */
> +static int nand_write_subpage_hwecc(struct mtd_info *mtd,
> +				struct nand_chip *chip, uint32_t offset,
> +				uint32_t data_len, const uint8_t
> *data_buf,
> +				int oob_required)
> +{
> +	uint8_t *oob_buf  =3D chip->oob_poi;
> +	uint8_t *ecc_calc =3D chip->buffers->ecccalc;
> +	int ecc_size      =3D chip->ecc.size;
> +	int ecc_bytes     =3D chip->ecc.bytes;
> +	int ecc_steps     =3D chip->ecc.steps;
> +	uint32_t *eccpos  =3D chip->ecc.layout->eccpos;
> +	uint32_t start_step =3D offset / ecc_size;
> +	uint32_t end_step   =3D (offset + data_len - 1) / ecc_size;
> +	int oob_bytes       =3D mtd->oobsize / ecc_steps;
> +	int step, i;
> +
> +	for (step =3D 0; step < ecc_steps; step++) {
> +		/* configure controller for WRITE access */
> +		chip->ecc.hwctl(mtd, NAND_ECC_WRITE);
> +
> +		/* write data (untouched subpages already masked by
> 0xFF) */
> +		chip->write_buf(mtd, data_buf, ecc_size);
> +
> +		/* mask ECC of un-touched subpages by padding 0xFF */
> +		if ((step < start_step) || (step > end_step))
> +			memset(ecc_calc, 0xff, ecc_bytes);
> +		else
> +			chip->ecc.calculate(mtd, data_buf, ecc_calc);
> +
> +		/* mask OOB of un-touched subpages by padding 0xFF
> */
> +		/* if oob_required, preserve OOB metadata of written
> subpage */
> +		if (!oob_required || (step < start_step) || (step >
> end_step))
> +			memset(oob_buf, 0xff, oob_bytes);
> +
> +		data_buf +=3D ecc_size;
> +		ecc_calc +=3D ecc_bytes;
> +		oob_buf  +=3D oob_bytes;
> +	}
> +
> +	/* copy calculated ECC for whole page to chip->buffer->oob */
> +	/* this include masked-value(0xFF) for unwritten subpages */
> +	ecc_calc =3D chip->buffers->ecccalc;
> +	for (i =3D 0; i < chip->ecc.total; i++)
> +		chip->oob_poi[eccpos[i]] =3D ecc_calc[i];
> +
> +	/* write OOB buffer to NAND device */
> +	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
> +
> +	return 0;
> +}
> +
> +
>  /**
>   * nand_write_page_syndrome - [REPLACEABLE] hardware ECC
> syndrome based page write
>   * @mtd: mtd info structure
> @@ -2031,6 +2092,8 @@ static int nand_write_page_syndrome(struct
> mtd_info *mtd,
>   * nand_write_page - [REPLACEABLE] write one page
>   * @mtd: MTD device structure
>   * @chip: NAND chip descriptor
> + * @offset: address offset within the page
> + * @data_len: length of actual data to be written
>   * @buf: the data to write
>   * @oob_required: must write chip->oob_poi to OOB
>   * @page: page number to write
> @@ -2038,15 +2101,25 @@ static int nand_write_page_syndrome(struct
> mtd_info *mtd,
>   * @raw: use _raw version of write_page
>   */
>  static int nand_write_page(struct mtd_info *mtd, struct nand_chip
> *chip,
> -			   const uint8_t *buf, int oob_required, int page,
> -			   int cached, int raw)
> +		uint32_t offset, int data_len, const uint8_t *buf,
> +		int oob_required, int page, int cached, int raw)
>  {
> -	int status;
> +	int status, subpage;
> +
> +	if (!(chip->options & NAND_NO_SUBPAGE_WRITE) &&
> +		chip->ecc.write_subpage)
> +		subpage =3D offset || (data_len < mtd->writesize);
> +	else
> +		subpage =3D 0;
>=20
>  	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
>=20
>  	if (unlikely(raw))
> -		status =3D chip->ecc.write_page_raw(mtd, chip, buf,
> oob_required);
> +		status =3D chip->ecc.write_page_raw(mtd, chip, buf,
> +							oob_required);
> +	else if (subpage)
> +		status =3D chip->ecc.write_subpage(mtd, chip, offset,
> data_len,
> +							 buf,
> oob_required);
>  	else
>  		status =3D chip->ecc.write_page(mtd, chip, buf,
> oob_required);
>=20
> @@ -2160,7 +2233,7 @@ static int nand_do_write_ops(struct mtd_info
> *mtd, loff_t to,
>=20
>  	uint8_t *oob =3D ops->oobbuf;
>  	uint8_t *buf =3D ops->datbuf;
> -	int ret, subpage;
> +	int ret;
>  	int oob_required =3D oob ? 1 : 0;
>=20
>  	ops->retlen =3D 0;
> @@ -2175,10 +2248,6 @@ static int nand_do_write_ops(struct mtd_info
> *mtd, loff_t to,
>  	}
>=20
>  	column =3D to & (mtd->writesize - 1);
> -	subpage =3D column || (writelen & (mtd->writesize - 1));
> -
> -	if (subpage && oob)
> -		return -EINVAL;
>=20
>  	chipnr =3D (int)(to >> chip->chip_shift);
>  	chip->select_chip(mtd, chipnr);
> @@ -2227,9 +2296,9 @@ static int nand_do_write_ops(struct mtd_info
> *mtd, loff_t to,
>  			/* We still need to erase leftover OOB data */
>  			memset(chip->oob_poi, 0xff, mtd->oobsize);
>  		}
> -
> -		ret =3D chip->write_page(mtd, chip, wbuf, oob_required,
> page,
> -				       cached, (ops->mode =3D=3D
> MTD_OPS_RAW));
> +		ret =3D chip->write_page(mtd, chip, column, bytes, wbuf,
> +					oob_required, page, cached,
> +					(ops->mode =3D=3D
> MTD_OPS_RAW));
>  		if (ret)
>  			break;
>=20
> @@ -3458,6 +3527,10 @@ int nand_scan_tail(struct mtd_info *mtd)
>  			chip->ecc.read_oob =3D nand_read_oob_std;
>  		if (!chip->ecc.write_oob)
>  			chip->ecc.write_oob =3D nand_write_oob_std;
> +		if (!chip->ecc.read_subpage)
> +			chip->ecc.read_subpage =3D nand_read_subpage;
> +		if (!chip->ecc.write_subpage)
> +			chip->ecc.write_subpage =3D
> nand_write_subpage_hwecc;
>=20
>  	case NAND_ECC_HW_SYNDROME:
>  		if ((!chip->ecc.calculate || !chip->ecc.correct ||
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 7ccb3c5..7d81403f 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -354,6 +354,7 @@ struct nand_hw_control {
>   *		any single ECC step, 0 if bitflips uncorrectable, -EIO hw
> error
>   * @read_subpage:	function to read parts of the page covered by
> ECC;
>   *			returns same as read_page()
> + * @write_subpage:	function to write parts of the page covered by
> ECC.
>   * @write_page:	function to write a page according to the ECC
> generator
>   *		requirements.
>   * @write_oob_raw:	function to write chip OOB data without ECC
> @@ -385,6 +386,9 @@ struct nand_ecc_ctrl {
>  			uint8_t *buf, int oob_required, int page);
>  	int (*read_subpage)(struct mtd_info *mtd, struct nand_chip
> *chip,
>  			uint32_t offs, uint32_t len, uint8_t *buf);
> +	int (*write_subpage)(struct mtd_info *mtd, struct nand_chip
> *chip,
> +			uint32_t offset, uint32_t data_len,
> +			const uint8_t *data_buf, int oob_required);
>  	int (*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
>  			const uint8_t *buf, int oob_required);
>  	int (*write_oob_raw)(struct mtd_info *mtd, struct nand_chip
> *chip,
> @@ -520,8 +524,8 @@ struct nand_chip {
>  	int (*errstat)(struct mtd_info *mtd, struct nand_chip *this, int
> state,
>  			int status, int page);
>  	int (*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
> -			const uint8_t *buf, int oob_required, int page,
> -			int cached, int raw);
> +			uint32_t offset, int data_len, const uint8_t *buf,
> +			int oob_required, int page, int cached, int raw);
>  	int (*onfi_set_features)(struct mtd_info *mtd, struct nand_chip
> *chip,
>  			int feature_addr, uint8_t *subfeature_para);
>  	int (*onfi_get_features)(struct mtd_info *mtd, struct nand_chip
> *chip,
> --
> 1.8.1


--_002_20980858CB6D3A4BAE95CA194937D5E73E9A50DADBDE01entticom_
Content-Type: application/octet-stream; name="create_ubi_image.sh"
Content-Description: create_ubi_image.sh
Content-Disposition: attachment; filename="create_ubi_image.sh"; size=2062;
	creation-date="Wed, 27 Mar 2013 08:40:28 GMT";
	modification-date="Wed, 27 Mar 2013 08:25:34 GMT"
Content-Transfer-Encoding: base64

IyEvYmluL3NoCiMtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIAojIERlc2NyaXB0aW9uOiBnZW5lcmljIHNjcmlwdCB0
byBjcmVhdGUgVUJJIGltYWdlIGZvciBOQU5EIGRldmljZXMKIwkJd2l0aCBkaWZmZXJlbnQgcGFn
ZSBzaXplcy4KIwojIEF1dGhvcjogCVBla29uIEd1cHRhIChwZWtvbkB0aS5jb20pCiMgVXNhZ2U6
CWNyZWF0ZV91YmlfaW1hZ2Uuc2ggPFBBR0VfU0laRT4gPFNVQlBBR0VfU0laRT4gXAojCQkJCQkJ
PFBBUlRJVElPTl9TSVpFPgojIEhpc3Rvcnk6CiMgdmVyc2lvbiAxLjEJcGVrb24KIwkJYWRkZWQg
Y2FsY3VsYXRpb24gb2YgTEVCX1NJWkUgd2hpbGUgdXNpbmcgc3VicGFnZXMKIwojLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLSAKIy0tIHJlbW92ZSBvbGQgZmlsZXMgLS0Kcm0gLXYgdWJpLnViaWZzICB1YmkuaW1nIHVi
aW5pemUuY2ZnCgojLS0gdXNlciBpbnB1dHMgLS0KUEFHRV9TSVpFPSQxClNVQlBBR0VfU0laRT0k
MgpQQVJUSVRJT05fU0laRT0kMwoKaWYgdGVzdCAteiAkMSB8fCB0ZXN0IC16ICQyICB8fCB0ZXN0
IC16ICQzCnRoZW4KZWNobyAiRXJyb3I6IGluY29tcGxldGUgaW5wdXRzIgplY2hvICJVc2FnZTog
Y3JlYXRlX3ViaV9pbWFnZS5zaCA8UEFHRV9TSVpFPiA8U1VCUEFHRV9TSVpFPiA8UEFSVElUSU9O
X1NJWkU+IgpleGl0CmZpCgoKIy0tIGNhbGN1bGF0ZSBVQkkgcGFyYW1ldGVyIC0tClBFQl9TSVpF
PSQoKCA2NCBcKiAkUEFHRV9TSVpFICkpCgojIExFQiBzaXplID0JUEVCX1NJWkUgLSBudW1iZXJf
b2ZfcGFnZXNfdXNlZF9mb3JfVUJJX2hlYWRlcnMgKiBQQUdFX1NJWkUKIwkJbnVtYmVyX29mX3Bh
Z2VzX3VzZWRfZm9yX1VCSV9oZWFkZXIgPSAxIGlmIHVzaW5nIHN1Yi1wYWdlcwojCQludW1iZXJf
b2ZfcGFnZXNfdXNlZF9mb3JfVUJJX2hlYWRlciA9IDIgaWYgbm90IHVzaW5nIHN1Yi1wYWdlcwpp
ZiB0ZXN0ICRQQUdFX1NJWkUgLW5lICRTVUJQQUdFX1NJWkUKdGhlbgoJTEVCX1NJWkU9JCgoICRQ
RUJfU0laRSAtICgxIFwqICRQQUdFX1NJWkUpICkpCmVsc2UKCUxFQl9TSVpFPSQoKCAkUEVCX1NJ
WkUgLSAoMiBcKiAkUEFHRV9TSVpFKSApKQpmaQoKTEVCX0NPVU5UPSQoKCAkUEFSVElUSU9OX1NJ
WkUgLyAkTEVCX1NJWkUgKSkKCmVjaG8gIkxPRzogUEFHRV9TSVpFCT0JJFBBR0VfU0laRSIKZWNo
byAiTE9HOiBTVUJQQUdFX1NJWkUJPQkkU1VCUEFHRV9TSVpFIgplY2hvICJMT0c6IFBFQl9TSVpF
CT0JJFBFQl9TSVpFIgplY2hvICJMT0c6IExFQl9TSVpFCT0JJExFQl9TSVpFIgplY2hvICJMT0c6
IExFQl9DT1VOVAk9CSRMRUJfQ09VTlQiCgoKIy0tIGdlbmVyYXRlIHViaW5pemUuY2ZnIC0tCmVj
aG8gIlt1Ymlmc10iICAgICAgICAgICAgICAgIAk+PiB1YmluaXplLmNmZyAKZWNobyAibW9kZT11
YmkiICAgICAgICAgICAgICAgCT4+IHViaW5pemUuY2ZnIAplY2hvICJpbWFnZT11YmkudWJpZnMi
ICAgICAgICAJPj4gdWJpbml6ZS5jZmcgCmVjaG8gInZvbF9pZD0wIiAgICAgICAgICAgICAgIAk+
PiB1YmluaXplLmNmZyAKZWNobyAidm9sX3NpemU9JFBBUlRJVElPTl9TSVpFIgk+PiB1YmluaXpl
LmNmZyAKZWNobyAidm9sX3R5cGU9ZHluYW1pYyIgICAgICAgCT4+IHViaW5pemUuY2ZnIAplY2hv
ICJ2b2xfbmFtZT10ZXN0IiAgICAgICAgIAk+PiB1YmluaXplLmNmZyAKZWNobyAidm9sX2ZsYWdz
PSdhdXRvcmVzaXplJyIgCT4+IHViaW5pemUuY2ZnIAplY2hvICJ2b2xfYWxpZ25tZW50PTEiICAg
ICAgICAJPj4gdWJpbml6ZS5jZmcgCgojLS0gZ2VuZXJhdGUgVUJJIGltYWdlIC0tCm1rZnMudWJp
ZnMgIC1vIHViaS51YmlmcyAgLW0gJFBBR0VfU0laRSAgLWUgJExFQl9TSVpFICAtYyAkTEVCX0NP
VU5UICAtciByb290ZnMgIAp1YmluaXplICAgICAtbyB1YmkuaW1nICAgIC1tICRQQUdFX1NJWkUg
IC1wICRQRUJfU0laRSAgLXMgJFNVQlBBR0VfU0laRSAgLU8gJFNVQlBBR0VfU0laRSAgLXYgIHVi
aW5pemUuY2ZnCg==

--_002_20980858CB6D3A4BAE95CA194937D5E73E9A50DADBDE01entticom_--
