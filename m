Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8Qtg-0004SV-TB
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 07:16:37 +0000
Message-ID: <1346656863.3061.11.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/3] mtd: cmdlinepart: sort the unsorted partitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Mon, 03 Sep 2012 10:21:03 +0300
In-Reply-To: <1346001700-26895-2-git-send-email-shijie8@gmail.com>
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
 <1346001700-26895-2-git-send-email-shijie8@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-zdNleoNaf9VFmibJimfH"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, shmulik.ladkani@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-zdNleoNaf9VFmibJimfH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-08-26 at 13:21 -0400, Huang Shijie wrote:
> +/* There are only several partitions, so the Bubble sort is enough. */
> +static inline void sort_partitons(struct mtd_partition *parts, int num_p=
arts)
> +{
> +	int i, j;
> +
> +	if (num_parts < 2)
> +		return;

Not necessary, the for loop should work for this case.
> +
> +	if (parts[0].offset =3D=3D OFFSET_CONTINUOUS)
> +		return;

Hmm, I guess the sorting function should not have this check. You
probably can just sort normally these ones, they will be the last ones.

And then we can do a separate pass where we check for overlapping
partitions and multiple OFFSET_CONTINUOUS.

> +
> +	/* sort by the offset */
> +	for (i =3D 0; i < num_parts - 1; i++) {
> +		for (j =3D 1; j < num_parts - i; j++) {
> +			if (parts[j - 1].offset > parts[j].offset) {
> +				struct mtd_partition tmp;
> +
> +				tmp =3D parts[j - 1];
> +				parts[j - 1] =3D parts[j];
> +				parts[j] =3D tmp;
> +			}
> +		}
> +	}
> +	return;
> +}


--=20
Best Regards,
Artem Bityutskiy

--=-zdNleoNaf9VFmibJimfH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRFpfAAoJECmIfjd9wqK0WxgQALleSpzV6QLNlqyrVU95eHvF
bX2FsqqU7y4Y4y5q52YaCAZxhBwjFCx37pUSpzc9rum96P1vurVG25jgIScKcaNT
MC36LPC8jxhZ9kDjraXRaWvBqXonTfj7OFj7zxAxYqE46FFeWrCWAAL94dMDGwx5
EKosvadYStw2epqwMhOhcaNzOk2X+9AZj/rUWzfvi8jKs2vTO0WYszhiUuD/hQf7
+VZU72nYZ9/2It+hR2t1nhnrrK7XVlGnF2oYXE1LtOLloWiBo5Ty7aTF0bzmJLBt
5EwRCTRCWx+KOaYkIr9eg957qRbAtBsQqXyF2hhGL35mRToJdUR1TTZWeqH5gH/A
/BSHMbyuVV7RulCGWKY1HAerWR1q+9K+vu+Uw6XSlMvTMuhgBVu4gE9DxC3tCo9g
jGbNxp4l3JjAxPLF1RjXSevGhnNHbTfEpGN/wIh31L6QlCEqGazcZcG85eGsE4yg
B/OmUoWWXSVAkaxvnKWtNDsnlI7EfcLP1x3qa+CmeROBkg7HkY9QIYEF6bYOaEpN
msaGSNKLQ89J/5N5beyEBAN0ZlrwoE0hwcwTA/84pOOmFmR/YJD7fnTeAgdKMmov
b8HWkbIEuziH5TWviiyVzokhCkBTFrEaMiBvbji4ehmRJhXSawf2etbg3d31Y5Wt
pV2WYxDCAd35x/pbcM8g
=FkGW
-----END PGP SIGNATURE-----

--=-zdNleoNaf9VFmibJimfH--
