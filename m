Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPORQ-00032V-IG
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 01:33:17 +0000
Received: by ghbf11 with SMTP id f11so147194ghb.36
 for <linux-mtd@lists.infradead.org>; Tue, 01 May 2012 18:33:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1335902181-18110-1-git-send-email-mikedunn@newsguy.com>
References: <1335902181-18110-1-git-send-email-mikedunn@newsguy.com>
Date: Tue, 1 May 2012 18:33:14 -0700
Message-ID: <CAN8TOE8XOaWttCcWEhjRS_dNLe5nG+Qs_xBRsimAHUvX34U=6Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: use ecc_strength to determine whether to perform
 bitflip_threshold test
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 1, 2012 at 12:56 PM, Mike Dunn <mikedunn@newsguy.com> wrote:
> This patch replaces bitflip_threshold with ecc_strength as the value used=
 to
> determine whether the device has ecc capability. =A0I think this is more =
correct
> because bitflip_threshold can be changed via sysfs.

This isn't the only reason. More simply, there's the reason that
ecc_strength is the natural measure of "do I have ECC", not
bitflip_threshold, even if we can often say that ecc_strength !=3D 0 if
and only if bitflip_threshold !=3D 0.

> Sorry for wanting to make tweaks after reviews and Ivan's testing. =A0It'=
s
> optional, low risk, and I did test it. =A0Thanks!

Aside from the review and testing, this kind of "fixup" usually makes
sense to just squash into the original patch ("mtd: driver _read()
returns max_bitflips; mtd_read() returns -EUCLEAN"), right?

> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index b5bb628..5757307 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -815,7 +815,7 @@ int mtd_read(struct mtd_info *mtd, loff_t from, size_=
t len, size_t *retlen,
> =A0 =A0 =A0 =A0ret_code =3D mtd->_read(mtd, from, len, retlen, buf);
> =A0 =A0 =A0 =A0if (unlikely(ret_code < 0))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret_code;
> - =A0 =A0 =A0 if (mtd->bitflip_threshold =3D=3D 0)
> + =A0 =A0 =A0 if (mtd->ecc_strength =3D=3D 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0; =A0 =A0 =A0 /* device lacks ecc =
*/
> =A0 =A0 =A0 =A0return ret_code >=3D mtd->bitflip_threshold ? -EUCLEAN : 0=
;
> =A0}

I had meant to suggest this on the original patch but never got around to i=
t.

For this patch (on its own, or in combo with the patch it fixes up):

Reviewed-by: Brian Norris <computersforpeace@gmail.com>
