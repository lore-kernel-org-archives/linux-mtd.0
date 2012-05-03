Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPshp-000319-RI
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 09:52:14 +0000
Message-ID: <1336038932.13013.13.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v4 03/10] mtd: Blackfin NFC: utilize oob_required parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>
Date: Thu, 03 May 2012 12:55:32 +0300
In-Reply-To: <1335978904-8005-4-git-send-email-computersforpeace@gmail.com>
References: <1335978904-8005-1-git-send-email-computersforpeace@gmail.com>
 <1335978904-8005-4-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-wNejgHhkEzchKfTBON/x"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, Bryan Wu <cooloney@kernel.org>,
 Mike Dunn <mikedunn@newsguy.com>, linux-mtd@lists.infradead.org,
 Jamie Iles <jamie@jamieiles.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-wNejgHhkEzchKfTBON/x
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-02 at 10:14 -0700, Brian Norris wrote:
> Don't read/write OOB if the caller doesn't require it.
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Hi Mike, do you prefer me to accept this patch or drop?

--=20
Best Regards,
Artem Bityutskiy

--=-wNejgHhkEzchKfTBON/x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPolYUAAoJECmIfjd9wqK00ZgP/2PtBF09OyRwoeQkBHu8mHeA
hfF/tkOp+RxSf76XZPrP3AfWXSLFsvytKE1Z2HuPHp2hiyxtaCTIssVIunEeBbQm
e/TJd7vC0ovcr1EQavxGxNCmmv2s5/y4aofBNNVSnEhte0pS1d9YyuUOrFS/GHIV
Q/RPpUfFh7CDBCLHMKSp7xcKdiELX+9qZZU/QgvsDAQ76mUCUH7yC7IpaELsPlIr
aoPToK0IX/ay+QwbF5YBcIe92LH4gVF8AJX1XM9Yn1/aFfViok7epEykSrgmoVvy
D7Et16RXuDiOpQCDilzcfLUFouFenspyWnOTik7kcMZu6eGG9VElt14Ict/lAvXT
dwVkUonzwfHsyPfvdbvTfvVVvuEdUTcTwxeyW2LG+1M5v5Uuwqy7DFEjKDFHXQFL
l1EPds1QfEoFhMOfdFO+xpv8cdOD5lIsFbAAbKIU8reYDKH/+0lCzR7rGMct130H
umpbVyzbpqwRRbVucorDcBQlHn56PGuXB3YwypI7m4CU2gRvoRGqTZJr7cjBYp1p
Xhs7Mi6vOOCeMSP34Eu74eUaz9Qa59H525Zae+rDPbqozvyW7xmcCAY2Kium2pKQ
lCmm/zmFak29O6nBLMlj6/2z6Ff5xKXnU0Baeg+pWmNpnifPj/WSbMKJnHlAss7F
AFmizsbkjw6uVyetUEUD
=o8WK
-----END PGP SIGNATURE-----

--=-wNejgHhkEzchKfTBON/x--
