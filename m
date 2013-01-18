Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tw90M-0004L5-KT
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2013 10:16:59 +0000
Message-ID: <1358504294.21816.8.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd/nand: Print source of error message
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tormod Volden <lists.tormod@gmail.com>
Date: Fri, 18 Jan 2013 12:18:14 +0200
In-Reply-To: <CAArsGabYJQseWmJ8Tf6iQju_WvVrNTmKXrLpn8N==5x7LqF-pg@mail.gmail.com>
References: <1357986867-22396-1-git-send-email-lists.tormod@gmail.com>
 <1358430969.2731.253.camel@sauron.fi.intel.com>
 <CAArsGabYJQseWmJ8Tf6iQju_WvVrNTmKXrLpn8N==5x7LqF-pg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-mBWTXCDPMIp6yv9tYQNS"
Mime-Version: 1.0
Cc: Vikram Narayanan <vikram186@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-mBWTXCDPMIp6yv9tYQNS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2013-01-17 at 23:58 +0100, Tormod Volden wrote:
> Thanks! I guess the intention of the colon at the end was that the
> calling function would fill in more details, but if this does not
> happen it is better without. In that case it should even be a \n at
> the end though...

Just added the "\n" character.

--=20
Best Regards,
Artem Bityutskiy

--=-mBWTXCDPMIp6yv9tYQNS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ+SFmAAoJECmIfjd9wqK0668P+wckHzjwl+R38R/hiB0NXs1+
n8a2WJ1+d1qB4PIQfFFFRUc+aZX3xgsvPw9KSprhiTx5MNecztfXFTcveD0gZFVp
G4mNVtqljyqXy/2A8p6aUTbExYZ/WjxmL0NotkdaP4vBm7y06c+Qi1TRxzKJW6ek
GwUBnjvG21lah+/qm9INTHrKVMoMrD8+GQAAfioswNg15rpaId/NL/oZAVYEAPmW
AEL+1gistMpDyeoWuMG0GJiMx8h+q2H1AB9cqHXkAOgusYW0svIjzDVqhSE0TaYz
5/g83f9ij+Ydvy33F9yMaUhO4voWabPR6hz57g2tBekUJdetVH8u5eMPe/L/BtRs
Jzcgke3q6wfQEaAD5N4TalQtZ3vlXpT+46OlZzvLHtrqFswN2JuHOVHVDCHzUUFx
IFn4KznP8JpuuFocXFcZ6bY5XDR9P8Bh8gzcqg9n7QdB7OlK0LcpiOzLcK/SqoLy
XlY+M3BwtWDOM+n2GCIGvbfujz6gofJ7JHLFhNyVlkaAhCqicEWZVUYGlwb70ifK
nOPk7x9+uq7FyyigUFSL7OigMNW5VSH+U6qWM83XDNy3doZ6OSeCOHS08U+wMSLt
9vrC1D406QiCYqWqfb6ocuK1Uld/q/kqMr9YKQtGFmDlEp4SAJcEgexSpdJTlgbP
TOayTLk64tMNvv3X9uqN
=g0Tn
-----END PGP SIGNATURE-----

--=-mBWTXCDPMIp6yv9tYQNS--
