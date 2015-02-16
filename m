Date: Mon, 16 Feb 2015 17:49:20 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v3 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
Message-ID: <20150216164920.GF25269@lukather>
References: <1424091072-7738-1-git-send-email-maxime.ripard@free-electrons.com>
 <1424091072-7738-2-git-send-email-maxime.ripard@free-electrons.com>
 <54E1F236.4090706@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="qp4W5+cUSnZs0RIF"
Content-Disposition: inline
In-Reply-To: <54E1F236.4090706@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sudhakar Gundubogula <sudhakar@marvell.com>, Nadav Haklai <nadavh@marvell.com>,
 Boris Brezillon <boris@free-electrons.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--qp4W5+cUSnZs0RIF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2015 at 10:35:50AM -0300, Ezequiel Garcia wrote:
> On 02/16/2015 09:51 AM, Maxime Ripard wrote:
> > The NDDB register holds the data that are needed by the read and write
> > commands.
> >=20
> > However, during a read PIO access, the datasheet specifies that after e=
ach 32
> > bits read in that register, when BCH is enabled, we have to make sure t=
hat the
> > RDDREQ bit is set in the NDSR register.
> >=20
>=20
> Typo s/32 bits/32 bytes

Good catch, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--qp4W5+cUSnZs0RIF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU4h+QAAoJEBx+YmzsjxAgUT8P/ikT2mFaG5AP8o4fDW01DZpA
lj34qHVN8bqpJOAtlH8JF+QmdDQMQCO2bikz6UUAr5FmpEsj0QC6rAaHyWWYfq6m
w3Lr+YE2He33wMbZrP+y2irSVL1EvwvmiVmP0/BVAWwHGF9zjo2TpD0dDhYvwPPT
sEkdGI0vvl5Sdjjd3PrwOFF+VL8EZ6aqAELh3E9jMPPw/B9p48fcmhO84AAeaeq1
FWqZ5EtXuVSeBgqKnd6rJFViSLxs5cxuvQEuDTR57A7PVklR374p+9S/ZB8hHB5+
E4k6Ro0GboJMGywYJX7LTjXbxji5Zm7vQKStKFxc1somsLu6aLmWCK0XzQaSDdGx
2emuUpUWcIzGlFOtitaMW0qjF6egZGDoeg5MdIGo/V9qLXGEY/GpBGZ4pMIAy6wf
SlQO17RDjIp9BVvp6XywWxO9HIJI9PZrnianlmkNin8ChgS/vRvsDRR4KP2rIEPH
SvutauxhOw1oLtVKPpiAgjGIAJeNWjTuUyQVdZ/otcBE4uS88UTiSggI11AILhgU
I0YIgEx6t+XE1npvbjqjiX2bER53q76T4kw5tVdSCQd3sV81zTQ/jR/mq94D4E17
tnP77vwIoLeAII0Yk/huzaSue2QsHRBS/nhHx0YSTrbjDq/DNLF8j3wnl5rbbQ1N
aWBvJKwZtSn0sTifwA29
=x6e8
-----END PGP SIGNATURE-----

--qp4W5+cUSnZs0RIF--
