Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TZ0Hq-0000iV-H6
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2012 14:19:23 +0000
Message-ID: <1352989200.2221.57.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] nand_wait : warn if the nand is busy on exit
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Thu, 15 Nov 2012 16:20:00 +0200
In-Reply-To: <1352124044-31627-1-git-send-email-matthieu.castet@parrot.com>
References: <1352124044-31627-1-git-send-email-matthieu.castet@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-MpTpfcBenE5KY58Kiljt"
Mime-Version: 1.0
Cc: Ivan Djelic <ivan.djelic@parrot.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-MpTpfcBenE5KY58Kiljt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-11-05 at 15:00 +0100, Matthieu CASTET wrote:
> This patch allow to detect buggy driver/hardware with
> bad RnB (dev_ready) management or when timeout occurs in polling mode.
>=20
> This works when dev_ready is set or not set.
> There are 2 methods to wait for an erase/program command completion:
>=20
> 1. Wait until nand RnB pin goes high (that's what chip->dev_ready usually=
 does)
> 2. Poll the device: send a status (0x70) command and read status byte in =
a loop
>    until bit NAND_STATUS_READY is set
>=20
> In all cases, you should send a status command after completion, to check=
 if
> the operation was successful. And if the operation completed, the status =
should
> have bit NAND_STATUS_READY set.
>=20
> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
> CC: Ivan Djelic <ivan.djelic@parrot.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-MpTpfcBenE5KY58Kiljt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQpPoQAAoJECmIfjd9wqK03ZwP+wTpHGybUrVHX5mt477tfS1S
iHNTOu3HV4PPIQYRR2aoGxvCGjH4RugIPCChQrhHhdIw3mKQn3XDzF+g+SvBAOSp
cKCWhz2mU3aaNQuZt0keWSUwkTy24Y1/g8osrxBfuxr/YbTZO58aRZDPw90H7MSu
cS2sYPWUBtIhaaILhLztPqHVeytXAn5owH8uY7600ctX6LTC1RycMUGlIJyvlWUt
wvbzOLIXKOyW3LrSNCGBw/j/8st9b4se8zf3S44o2b9LXIYby7l3zGZYPJQEVsjT
wiblYQ3z20O1y4/Rt4mAEGWKit0AjtDYRHaYcrT+dlMhB9CPJtyIGQS32WTrWpxU
BQDpQcHLsPfoYyw+QURPuSMEbA4wtB/3PTHeqWvsIXNPNDJgFqJhKxK+etODerdZ
+KyB+aPUFDQ3oynmrM98Ij5ADwVY7cX0C/Kr8ZLzYDQUMAK8BFQ4pFp8blF2uAEi
pHXDHvFFi+wXTbV2qeKeXfBLtfOUA0pBj12cmi1DcK86RL3VcckCv+cYLjE+bGF6
1mYoz3hZgDi3NPRzYLMCU69BD8XrpAKFQxtp2UIfiyL5LTJyMXOOOEGxBwSLcyPY
GBHHJ3gJ+VmVdfAZ2n0HMyt+SIwunw9u1wcfsPahd4G6E6K4+jIyhfUpNNey/yPK
2pHea6UQXrqc1cVYSGTI
=Bclv
-----END PGP SIGNATURE-----

--=-MpTpfcBenE5KY58Kiljt--
