Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TfTZD-0001ax-Dq
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 10:48:04 +0000
Message-ID: <1354531729.30168.189.camel@sauron.fi.intel.com>
Subject: Re: UBI wl_tree_add problems after PEB scrubbed
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Zach Sadecki <zsadecki@itwatchdogs.com>, Richard Weinberger
 <richard@nod.at>
Date: Mon, 03 Dec 2012 12:48:49 +0200
In-Reply-To: <50B8CB36.3010604@itwatchdogs.com>
References: <50B8CB36.3010604@itwatchdogs.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Z8nGPsB9PipIaoHJdby0"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Z8nGPsB9PipIaoHJdby0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-11-30 at 09:05 -0600, Zach Sadecki wrote:
> Every time I see UBI scrub a PEB with fixable bit-flips (on my custom=20
> Freescale i.MX28 board) the background thread has problems shortly=20
> thereafter.  I'm not exactly sure where to start debugging this and I'm=
=20
> hoping someone can help point me in the right direction.  Below are=20
> kernel messages showing the problem from 2 different runs (in which both=
=20
> ended up with a hung CPU).  This is using kernel 3.7-rc7.
>=20
> Also worth noting is that I had to modify the gpmi-nand driver to=20
> actually report max_bitflips back to the MTD layer to even get to this=
=20
> point (before that everything would just run along happily until it hit=
=20
> an uncorrectable ECC error).  I will submit a patch for this once=20
> everything seems OK...

Ack, reproducible on nandsim with=20

sudo sh -c 'echo 1 > /sys/kernel/debug/ubi/ubi0/tst_emulate_bitflips'

I did not confirm this by bisecting, but it seems it is fastmap that
broke it.

And looking at fastmap changes, I immediately see some thing completely
bogus, not related to this:


/**
 * __wl_get_peb - get a physical eraseblock.
 * @ubi: UBI device description object
 *
 * This function returns a physical eraseblock in case of success and a
 * negative error code in case of failure. Might sleep.
 */
static int __wl_get_peb(struct ubi_device *ubi)

Might sleep? Well, yes, because it calls=20

ubi_self_check_all_ff()

But then why is this:

       spin_lock(&ubi->wl_lock);
       peb =3D __wl_get_peb(ubi);
       spin_unlock(&ubi->wl_lock);

Bogus.

Richard, could you please re-test fastmap with all debugging enabled?
I see at least one bug already.

Namely these ones: chk_gen  chk_io  tst_disable_bgt

Also, it seems UBI is completely broken ATM - it craps out immediately
on the first bit-flip. Let me revert fastmap and check if it is fastmap.

--=20
Best Regards,
Artem Bityutskiy

--=-Z8nGPsB9PipIaoHJdby0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQvIORAAoJECmIfjd9wqK0k5UP/R32+46xb9QKfrLJCIsftLJ0
JEAq0d5fEEL+TE5Rehk2SWY/Q8TKM5xHGkEWahTPIxV5X2PEQH8IA6pD49Stwu2S
Vh+MoAaBKFicuNjKK3W6Rb+Gspeq9lQDtmr1n2g12W69oWQj4ILneosU98rqdAzk
vSGdtwxHEeJSDkwgRagzUx5OA3ct2ss/ELPw2bnMZ3K0bwaOOamdA9xN3UbeSKmu
BLxRUamZSHRCzV0f1WUeygIKzavjtqw3uhiXGKtBlF2TmA6hi7z8zaHl09EIBxbz
DiWTZ2MFwCOCYYCPGwGR26jzjdSiwHHB0BRRVJE302qv0y4ngVUYmtcVc84cTnWw
rQtiVVv3YWZMkA6qzvfFOl8dx/p2wtnTeuopfJruuSX5MgK1eTbVYPiR+q7y90ty
+Xek8MAkLNvkvbvsinGlAHK3bPmhnOHn7uMvG4vVXIA+j3bmWYWMmFfLe9YDRIR+
CmcfsmCDh2jfXwAeZP5ncAd/pfCvMTDhevTIvetX7T2AUF6aV45YK4UJl2o60CNL
LKrujr0RS7/Q89vRo/rJC9MSIKOpIZ9oXSaJ7TeM/28auRrCHaA+6+Dz2L+CmCm1
iMk9dE3Y08okC4gRjwiPmNLVQei/Vc3qSpnhaOVaVerV4AQM5vrNhTJurToNxb2U
ojjqOMbKt5NHw6GoXuZi
=RZED
-----END PGP SIGNATURE-----

--=-Z8nGPsB9PipIaoHJdby0--
