Received: from mgw-ext14.nokia.com ([131.228.20.173])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GfvAC-0005sE-Vr
	for linux-mtd@lists.infradead.org; Fri, 03 Nov 2006 04:16:46 -0500
Subject: Re: [PATCH/RFC] remove len/ooblen confusion in MTD/NAND code: respin
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <20061102100659.f223d094.vwool@ru.mvista.com>
References: <20061102100659.f223d094.vwool@ru.mvista.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 03 Nov 2006 11:16:17 +0200
Message-Id: <1162545377.15435.35.camel@sauron>
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

On Thu, 2006-11-02 at 10:06 +0300, Vitaly Wool wrote:
> Hello folks,

snip

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.orig/drivers/mtd/mtdconcat.c
> +++ linux-2.6/drivers/mtd/mtdconcat.c
> @@ -278,14 +278,14 @@ concat_read_oob(struct mtd_info *mtd, lo
>  				return err;
>  		}
> =20
> -		devops.len =3D ops->len - ops->retlen;
> -		if (!devops.len)
> +		devops.ooblen =3D ops->ooblen - ops->retlen;
> +		if (!devops.ooblen)
>  			return ret;

May you please explain this code. If ops->databuf !=3D NULL,
mtd->read_oob() stores the number of read _data_ bytes. Then we
substract number of _data_ bytes from number of _OOB_ bytes
(devops.ooblen)? Looks confusing.

'struct mtd_oob_ops' is still a bit confusing. This is how it looks
after your patch:


/**
 * struct mtd_oob_ops - oob operation operands
 * @mode:       operation mode
 *
 * @len:        number of data bytes to write/read
 *
 * @retlen:     number of bytes written/read. When a data buffer is
given
 *              (datbuf !=3D NULL) this is the number of data bytes. When
 *              no data buffer is available this is the number of oob
bytes.
 *
 * @ooblen:     number of oob bytes to write/read
 * @ooboffs:    offset of oob data in the oob area (only relevant when
 *              mode =3D MTD_OOB_PLACE)
 * @datbuf:     data buffer - if NULL only oob data are read/written
 * @oobbuf:     oob data buffer
 */

struct mtd_oob_ops {
        mtd_oob_mode_t  mode;
        size_t          len;
        size_t          retlen;
        size_t          ooblen;
        uint32_t        ooboffs;
        uint8_t         *datbuf;
        uint8_t         *oobbuf;
};

The fact that retlen depends on whether datbuf is NULL is not nice. I
would prefer go further and make it like this:

/**
 * struct mtd_oob_ops - OOB operation operands
 * @mode:       operation mode
 * @len:        number of data bytes to write/read
 * @ooblen:     number of OOB bytes to write/read
 * @retlen:     number of data bytes written/read
 * @oobretlen:  number of OOB bytes written/read
 * @ooboffs:    offset of OOB data in the OOB area (only relevant when
 *              mode =3D MTD_OOB_PLACE)
 * @datbuf:     data buffer - if NULL only OOB data are read/written
 * @oobbuf:     OOB data buffer - cnnot not be NULL
 */
struct mtd_oob_ops {
        mtd_oob_mode_t  mode;
        size_t          len;
        size_t          ooblen;
        size_t          retlen;
        size_t          oobretlen;
        uint32_t        ooboffs;
        uint8_t         *datbuf;
        uint8_t         *oobbuf;
};

If we say "A" why not to say "B"?

Comments?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
