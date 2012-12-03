Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TfT83-0004qy-Oz
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 10:20:01 +0000
Message-ID: <1354530053.30168.183.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] mtd nand : onfi need to be probed in 8 bits mode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Mon, 03 Dec 2012 12:20:53 +0200
In-Reply-To: <1352199105-30215-1-git-send-email-matthieu.castet@parrot.com>
References: <1352199105-30215-1-git-send-email-matthieu.castet@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-d/HHFsvuMD/VWbXqdJiT"
Mime-Version: 1.0
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-d/HHFsvuMD/VWbXqdJiT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-11-06 at 11:51 +0100, Matthieu CASTET wrote:
> - NAND_CMD_READID want an address that it is not scaled on x16 device (it=
 is always 0x20)
> - NAND_CMD_PARAM want 8 bits data
>=20
> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>

Pushed this one to l2-mtd.git, thanks!


--=20
Best Regards,
Artem Bityutskiy

--=-d/HHFsvuMD/VWbXqdJiT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQvH0FAAoJECmIfjd9wqK03kwQAJFxXPZBLAZ3DvX3LI9VgPIV
4hMytaNdjE0sDRtdVXVVpPmo35bFxFq9dbkYmwmpvm1amhsgr08h9whNfCNlxyXY
Y+/68GWX0VshmnxYwm0hL3TobInM9m1sKdn47u373HAZwIk0lyJK7xBrxcUIn3Br
wJnSI7KSovKGDXjC+NLBal4oShzqymiBKrZiWRdOxoX9IIxUxVcjG+bTxXrKI/k/
KhiJWab8rlml4yduMyMvIVgWgdSB6cama4GrsVlfG7Uc/kWqtyAIeZ5sN9aEgnCY
ntw/RaKGktUVmHTn7Ug/QfvNL1Q6BcSfo+Ke8NHHzEwPlCquShT7toE0PjUpOUHV
hm4C240/s4/LzFnkTXGsSIOSJmIVFsE2iPQWUb/3VOC3NsZSK/J9Mq/4yC1B4Gxg
P1SlCE/VnGwv+UtNTBGa4uwvzulu9KejJKdD1zP6bZLWG9yV/zJm90gQlXVz0v3B
coJV3Mo8A0musZGrJ6CKmDQMoozlyzau0z8RBj4+e09DYl2bE+jeURag6isG32a0
AUurjou1nE2WlVHw6qt+MTXcD0ywiOYfIcIyu4YkyVJK1HHcJD+1iIIQrB5eRoCJ
1bhklfH9BczJVzczMCwrOzel15EDwpOHy7h1amabVAD6Z/JepkTboEJUNwFs3I8Y
crkMxenosFVz1iSsEMr6
=VUyU
-----END PGP SIGNATURE-----

--=-d/HHFsvuMD/VWbXqdJiT--
