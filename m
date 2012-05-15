Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUGbl-0007rk-RF
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 12:12:06 +0000
Message-ID: <1337084131.2528.189.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] UBI: add lnum to struct ubi_work
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Tue, 15 May 2012 15:15:31 +0300
In-Reply-To: <alpine.DEB.2.00.1205151339020.18866@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205142046080.12448@eristoteles.iwoars.net>
 <1337080498.2528.161.camel@sauron.fi.intel.com>
 <1337081204.2528.171.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1205151339020.18866@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-KiRwr6k2JqEoF9pmeWgG"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-KiRwr6k2JqEoF9pmeWgG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-15 at 13:47 +0200, Joel Reardon wrote:
> For vol_id, its straightforward everywhere except: ubi_wl_init_scan()
>=20
> where scheduling erase on the:
>=20
> struct ubi_scan_leb *seb
>=20
> appears to lack access to the volume id.  Should we add vol_id to
> ubi_scan_leb, and in ubi_scan() run:
>=20
>         ubi_rb_for_each_entry(rb1, sv, &si->volumes, rb) {
>                 ubi_rb_for_each_entry(rb2, seb, &sv->root, u.rb)
> 			seb->vol_id =3D sv->vol_id;
>=20
> Or is there a simpler way?

I guess yes. Add this field as a separate patch please.

--=20
Best Regards,
Artem Bityutskiy

--=-KiRwr6k2JqEoF9pmeWgG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPskjjAAoJECmIfjd9wqK0L04P/3YUCWbRk79CushnlErJeMbq
cq1CFkjoHQoyN0z137GKiMrtVHn1h+V8Le+FpUjSGLOCcqqUTuv0womZdqjeoVUo
KgCkgRwrKbP9pMNd+lgbwVLOh+0eDH+bCC9xFz8gLvN8Vp76/uIB84Nm/VoLOif1
1aKvcP0VtoME8zdE9CIRcXf2VRWUPe4da6koNoEK0tKrJswnfWe8tovaSm8xEChf
eFHFCi6Hm+MMcQS5HfDeMe8Gvg07nRIZ1Cvh6G1HZ2lTpQ/YszHsSxPAYpVzceC4
zOgUqk6IVNc2WlJwuvNElyKD4wzN2lxlNGVdo1zvmZWAVuboUzZleSogd+3GHUxA
wBlplsNh5rcpOIqdKpmHlNJl8SQvi6rAWzZkMhRd5hgodloA0lobBdLT/9ivHaDv
ryT1vnHs0L3VPZF2mdzkyunBQq7I2A2KAqSbZXQPescy1VMB9upUv7KWMQ3OftMn
cEsKEE0kd+bccvIpYXEtH53L1XX+XjdXED7KDTQ/b1dCcHHi1qY2BZJ+TzBdjLSi
MJXB8BjE8Un0Hh2Pi3VD/vC6CoGK7wPG/WLCg/uBuea6jHorZnR1U6VljujdiBx8
Tu+l1PVFyeqTIB0Xo55ycoa/dhrF4LMwfc9xo3VUnBPbWBFuet5/i8eabI8XatjL
GAYGRcZZB3UOhm3WQski
=NbV2
-----END PGP SIGNATURE-----

--=-KiRwr6k2JqEoF9pmeWgG--
