Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8XcU-0003Pi-8f
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 14:27:18 +0000
Message-ID: <1346682729.3061.55.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3 0/6] UBI: add max_beb_per1024 parameter / ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 03 Sep 2012 17:32:09 +0300
In-Reply-To: <CACQ1gAiFQfAbKVRfhjy-K31MJP9YchzxmmCo4FJECoKuudeBtw@mail.gmail.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345716615.2848.229.camel@sauron.fi.intel.com>
 <20120823133655.72157b18@pixies.home.jungo.com>
 <1345725030.2848.236.camel@sauron.fi.intel.com>
 <20120823154404.51e31873@pixies.home.jungo.com>
 <1345726686.2848.241.camel@sauron.fi.intel.com>
 <CACQ1gAhs6E5jHGnTy1RhbnuzKq7uAJk0DeHfi0k73jC_8noiAg@mail.gmail.com>
 <CACQ1gAiFQfAbKVRfhjy-K31MJP9YchzxmmCo4FJECoKuudeBtw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QbeEsz2D0+y5qa94SiQA"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-QbeEsz2D0+y5qa94SiQA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-08-31 at 16:46 +0200, Richard Genoud wrote:
> diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
> --- a/drivers/mtd/ubi/vtbl.c
> +++ b/drivers/mtd/ubi/vtbl.c
> @@ -346,8 +346,8 @@ retry:
>          */
>         err =3D ubi_scan_add_used(ubi, si, new_seb->pnum, new_seb->ec,
>                                 vid_hdr, 0);
> +//     kfree(new_seb);
> +//     ubi_free_vid_hdr(ubi, vid_hdr);
>         return err;
>=20
Richard, I've sent you the fix. I've tested it and it fixes the issue.
Switching to SLUB must be hiding it somehow. Thanks for reporting!
>=20
--=20
Best Regards,
Artem Bityutskiy

--=-QbeEsz2D0+y5qa94SiQA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRL9pAAoJECmIfjd9wqK0snQP/2y6C/n4a9OYPNsdE0/mCvG3
iE8xTwszwmUR1cYL76s90pruWUxeqzc9wnUHz/RXrRlm8LtXCE4HpNmyD8d1OWqe
7acbK9Iv91zRAnGKLBW702QapaCuJwb32Pf8d6b5Zwwh825KOc87H29/tIAt+FL0
KQWTvi4dGHAsRlVA42NnudO3I0IOJcHy3it4otz+jttlaBdz20q6yQHHbJ7FtV3F
8WjU3D4iR1uC0WlZI7Gkx2uesEsVQ3vRcKXnajA7qA+wZ8QEWG5jDSahpwvZP84l
38yKJWPaLYrS9lJO8jEApJSK6TJhzHcWqtGDy9vP+OmzA8+yHBC4RRQAVRuC14xa
GD1SyfKXO1sVBYTcnIQB/E3RI4VuqUzp9TnwSk2zZi2e9JyfjvfC1mfYh21A8NXD
hlV9yVb/MyR22y5UfQWtdmu5X3N97oXk3spkg4Q0sKm/H0fGmLiKOt0PIOJSlv2d
aHdWNQmd98RHUoSMCmAXKv+hzuosJgWwf/pejY61T8eqbpTj/64KtzaL/ioxi7sw
H+pktTrZ4Di3fw+5UEHeq+KGFzcyA2HUoMmzIm44pGjuTP6Aw8q02Bfv00hjJWWS
t0YWvCOjVQmk2fjK5MYAl2QH5qmdc7o2S+48SICFm+Xd7kYfjzd1s3AqxEGaPVop
pVtjmWH2Tt3ItwOqE7Re
=JGSW
-----END PGP SIGNATURE-----

--=-QbeEsz2D0+y5qa94SiQA--
