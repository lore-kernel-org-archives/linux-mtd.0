Subject: Re: [RFC] [PATCH] [MTD] Update internal API to support 64-bit
	device size
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <4912EE49.4070202@nokia.com>
References: <4912EE49.4070202@nokia.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 14 Nov 2008 13:54:33 +0200
Message-Id: <1226663673.16925.88.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are 2 compilation warnings:

fs/jffs2/erase.c: In function =E2=80=98jffs2_erase_failed=E2=80=99:        =
                                                                           =
                                  =20
fs/jffs2/erase.c:178: warning: comparison is always true due to limited ran=
ge of data type                                                            =
                  =20
fs/jffs2/erase.c: In function =E2=80=98jffs2_erase_callback=E2=80=99:      =
                                                                           =
                                  =20
fs/jffs2/erase.c:212: warning: format =E2=80=98%08x=E2=80=99 expects type =
=E2=80=98unsigned int=E2=80=99, but argument 2 has type =E2=80=98u_int64_t=
=E2=80=99                                                           =20

And the first one points to a real problem.

> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index eae26bb..139aeb7 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -15,6 +15,8 @@
>  #include <linux/mtd/compatmac.h>
>  #include <mtd/mtd-abi.h>
> =20
> +#include <asm/div64.h>
> +
>  #define MTD_CHAR_MAJOR 90
>  #define MTD_BLOCK_MAJOR 31
>  #define MAX_MTD_DEVICES 32
> @@ -25,16 +27,16 @@
>  #define MTD_ERASE_DONE          0x08
>  #define MTD_ERASE_FAILED        0x10
> =20
> -#define MTD_FAIL_ADDR_UNKNOWN 0xffffffff
> +#define MTD_FAIL_ADDR_UNKNOWN -1LL

OK, but look at the 'jffs2_erase_failed()' function:

--------------------------------------------------------------
static void jffs2_erase_failed(struct jffs2_sb_info *c, struct jffs2_eraseb=
lock *jeb, uint32_t bad_offset)
{
        /* For NAND, if the failure did not occur at the device level for a
           specific physical page, don't bother updating the bad block tabl=
e. */
        if (jffs2_cleanmarker_oob(c) && (bad_offset !=3D MTD_FAIL_ADDR_UNKN=
OWN)) {
                /* We had a device-level failure to erase.  Let's see if we=
've
                   failed too many times. */
                if (!jffs2_write_nand_badblock(c, jeb, bad_offset)) {
                        /* We'd like to give this block another try. */
... etc ...
--------------------------------------------------------------

bad_offs is uint32_t, and bad_offset !=3D -1LL is always true, which is
a problem.

> +static inline u_int32_t mtd_div_by_ws(u_int64_t sz, struct mtd_info
> *mtd)
> +{
> +	if (mtd->writesize_shift)
> +		return sz >> mtd->writesize_shift;
> +	do_div(sz, mtd->writesize);
> +	return sz;
> +}

I would introduce mtd->writesize_mask instead of calculating it, because
it is presumably more optimal.

> +
> +static inline u_int32_t mtd_mod_by_ws(u_int64_t sz, struct mtd_info
> *mtd)
> +{
> +	if (mtd->writesize_shift)
> +		return sz & ((1 << mtd->writesize_shift) - 1);
> +	return do_div(sz, mtd->writesize);
> +}

Ditto.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
