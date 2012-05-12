Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1STCtf-0004Ju-Dq
 for linux-mtd@lists.infradead.org; Sat, 12 May 2012 14:02:13 +0000
Received: by lbbgg6 with SMTP id gg6so3119185lbb.36
 for <linux-mtd@lists.infradead.org>; Sat, 12 May 2012 07:02:08 -0700 (PDT)
Message-ID: <1336831313.5707.2.camel@koala>
Subject: Re: MTD: Add fixup for S29NS512P NOR flash.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Javier Martin <javier.martin@vista-silicon.com>
Date: Sat, 12 May 2012 17:01:53 +0300
In-Reply-To: <1336731341-615-1-git-send-email-javier.martin@vista-silicon.com>
References: <1336731341-615-1-git-send-email-javier.martin@vista-silicon.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-NGT9aM561zZ9xnWItJMr"
Mime-Version: 1.0
Cc: Gernot.Hoyler@spansion.com, Artem.Bityutskiy@nokia.com,
 joakim.tjernlund@transmode.se, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, tabe@mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-NGT9aM561zZ9xnWItJMr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-11 at 12:15 +0200, Javier Martin wrote:
> Spansion S29NS512P flash uses a 16bit transfer to report number
> of sectors instead of two 8bit accesses as CFI specifies.
>=20
> Signed-off-by: Javier Martin <javier.martin@vista-silicon.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |   14 ++++++++++++++
>  1 files changed, 14 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_=
cmdset_0002.c
> index 23175ed..5873b1f 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -332,6 +332,19 @@ static void fixup_s29gl032n_sectors(struct mtd_info =
*mtd)
>  	}
>  }
> =20
> +static void fixup_s29ns512p_sectors(struct mtd_info *mtd)
> +{
> +	struct map_info *map =3D mtd->priv;
> +	struct cfi_private *cfi =3D map->fldrv_priv;
> +
> +	/*
> +	 *  S29NS512P flash uses more than 8bits to report number of sectors,
> +	 * which is not permitted by CFI.
> +	 */
> +	cfi->cfiq->EraseRegionInfo[0] =3D 0x020001ff;
> +	pr_warning("%s: Bad S29NS512P CFI data, adjust to 512 sectors\n", mtd->=
name);

What is the purpose of printing this warning - how the user should act
upon it? If you successfully work-around a known HW issue, you should
not warn. HW workarounds are normal.

--=20
Best Regards,
Artem Bityutskiy

--=-NGT9aM561zZ9xnWItJMr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPrm1RAAoJECmIfjd9wqK0SKQP/2ZsRJxi4RUu4t6dA0ot8kPt
s56sJmysWwVtkN2vHIk2tSy3/CeZ7LIuP7P3nfU48RVHtpUk9AxPj8oC9jl5lyAc
4d1/14bq11GJcM8s/ln+HkcXb5Qt3i3JzNFB+vIQbe7juH52CgP0f5mNc/5V9sNp
kqpK4kfMTK0lBZHnqH5OXoe8jZ7iYb7JEJLG7lfBqV06LGdVoEg/Ntv7lugUa/pR
44RJaMGRMUzUa1RmRBN2ZkZWSllC05s1vGNMEAgJXcFODRnNBagyk6JvJH88zVwg
iTQOZeFzRhYVMlTvx061HJ7GXAI9ndUtGqy4n0DHjvPWfo+svo/yG7NwK7Pe1I90
eZBCnc8xpRxz5RnJOBwspFJnpjCwQTKZKo5dnV56SV7zc5D9neKkGhCI3BvMdx4c
DKq+eKqQGJzmmGqlns6LoGcGuoO4yu7gTEo8OBGJuVuyef/Yvg4obRdFxq0soCaa
5SDeX6G424HV6V7D4Rzq9wUCIA1UCt+fGgNYGi00NjebeMu2Sjoop+EzLQ8mPwEq
ipYg9W7g7ewviNzwmpjeAMPzJptsb7T4uxitGov6YB5uJPPJyEhEqJhoWFQLNAjS
FMTDqj3/kMqzFsnYS3O424wjN2oydEdolU75jd8jLlGtxOuec3uFdsj3fiWohMqz
TRl4tb6WSteaBtvfCcDy
=yg63
-----END PGP SIGNATURE-----

--=-NGT9aM561zZ9xnWItJMr--
