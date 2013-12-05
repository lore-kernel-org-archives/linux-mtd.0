Received: from moutng.kundenserver.de ([212.227.17.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoVir-0004g8-KL
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 09:59:54 +0000
Message-ID: <52A04E75.3010609@corscience.de>
Date: Thu, 05 Dec 2013 10:59:17 +0100
From: =?ISO-8859-1?Q?Andreas_Bie=DFmann?=
 <andreas.biessmann@corscience.de>
MIME-Version: 1.0
To: Enric Balletbo Serra <eballetbo@gmail.com>,
 Peter Meerwald <pmeerw@pmeerw.net>
Subject: Re: OMAP3 NAND ECC selection
References: <alpine.DEB.2.01.1312051000270.17561@pmeerw.net>
 <CAFqH_50vhgJ=ktqmYRo+ZO1bbRmiME+kXVt6sLJL91q9A2S7TA@mail.gmail.com>
In-Reply-To: <CAFqH_50vhgJ=ktqmYRo+ZO1bbRmiME+kXVt6sLJL91q9A2S7TA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qVx4k1UPMsU5E761B1hTjnwQ1HoP5mE2I"
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qVx4k1UPMsU5E761B1hTjnwQ1HoP5mE2I
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On 12/05/2013 10:47 AM, Enric Balletbo Serra wrote:
> 2013/12/5 Peter Meerwald <pmeerw@pmeerw.net>:

<snip>

>> I'd like to be able to update MLO and u-boot from within a booted Linu=
x
>> system on the device (I have to resort to u-boot for that where I can
>> control the ECC scheme used)
>>
>=20
> Meanwhile, to do this we use a small userspace program created by
> Javier Martinez in order to flash the MLO in our OMAP3 boards. See
>=20
> http://git.isee.biz/?p=3Dpub/scm/writeloader.git;a=3Dsummary

we used another aproach here. See

http://article.gmane.org/gmane.linux.drivers.mtd/43804

Best regards

Andreas Bie=DFmann


--qVx4k1UPMsU5E761B1hTjnwQ1HoP5mE2I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJSoE56AAoJEHPlkEBPIQBj2yQP+wUceDc8iTs/uXQpsHv3oMh2
mVF6BWi1HZuGf20XLn+VPVpytk5kHw1VQUmrnv7xz05fVYodo56Tyhdd7rm3/7Ci
o9FqzHpJmOQ1CaJqlKtxZhrbNik3AMvVgkSG2So5Sf1Tnt6nQM7ob2Rvj+jdlvkR
JVd1vO228+kWMiKCerVQLxTM4tms93GyUFtDO6VFiEkwc2G7htZU0VCZTC6uBW7L
mUs9YyB1uw7w++NrnwULclrASTC+DIjwk/f2uFMsYm28O6wZ/33imB5BAmnWxP5Y
vtddzPbLBJxBbuiMAlTKJseEapIh1TqIkYij12G0pVkB1nKKCK0598Gre9AA/ja/
iEj9TYNFd+Y39DcQCt4gCHh6bu4z8LBJjw+jGvDYUbAoDmd2T4MA8m+XmqGtaNvL
//tiwbluEHYRMoYQ2Vs+oUHvdt5LjMYzbsaiDXcJT4skylcQRRmHswKb4BT5yrZs
LUkULii6CWmYuvXcJZSYFfYi4wi3/vEDVg5TjsW8edaVFhTdY0I5ew3vAeB8qb+E
w0qunwsmnbdvmifMIshL5W89SXuQWQ1Ykr3w6vZ29EnOKc+CrH5rmVRbQ8zg7wxz
hczmd25k/Adtc3OFeje1fWGJoO6Mvxe8TYUPGvJB6udVuPde/KTqYokQKliyEWdf
TkEFS3lka/T9jIeHaC8+
=hd4+
-----END PGP SIGNATURE-----

--qVx4k1UPMsU5E761B1hTjnwQ1HoP5mE2I--
