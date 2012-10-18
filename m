Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TOmZS-00067k-K2
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2012 09:39:19 +0000
Message-ID: <1350553177.5769.307.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] Devicetree support for enc28j60 SPI Ethernet chip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Michal Vanka <mv@vanka.net>
Date: Thu, 18 Oct 2012 12:39:37 +0300
In-Reply-To: <507B04AA.1050502@vanka.net>
References: <507B04AA.1050502@vanka.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-iYU7jbEjY5Pe8jqeSAZ1"
Mime-Version: 1.0
Cc: nios2-dev@sopc.et.ntust.edu.tw, lanconelli.claudio@eptar.com,
 linux-mtd@lists.infradead.org,
 devicetree-discuss <devicetree-discuss@lists.ozlabs.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-iYU7jbEjY5Pe8jqeSAZ1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-10-14 at 20:30 +0200, Michal Vanka wrote:
> Hi,
> the following patch adds generic openfirmware/devicetree support to=20
> enc28j60 driver.
>=20
> It also adds support for custom hardware based (FPGA) "interrupt line=20
> deasserter" for processors with level triggered interrupts
> (for example Altera Nios2).

Hi, please, re-send with

devicetree-discuss@lists.ozlabs.org

in CC.

--=20
Best Regards,
Artem Bityutskiy

--=-iYU7jbEjY5Pe8jqeSAZ1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQf85ZAAoJECmIfjd9wqK0KecP/jtw/9B1DGC8guGyIzExM4Rv
fi5+N7sH20SAfv40RKONs1PdUPiANkv1GCKQjWx+ku7i7H/8ukQcL79QVOgnKPtK
VlypVFxc+UXifqE3cs7AZwjcTldsQuwKYBVwpfZwC+baLsSANiEdQ9azpm9cOQDg
6Pm6gOyJTHAwJJq+/820OqLJ13KWB8g2kmDUuUfiyhLa61QInHqRloeve+sYbUZ2
S310EV1kMvtf44QlVZuigav3KcT5+AQYe5GFfxamueaagWzZYZcxTvZVIviiiBQa
iS92HQgt2OArg43U0KBSxjMK0iaXXhjOd5He+Ys5LLOhPoZXPmszQZ2ITbTuHcge
DQlLLOdksZC7+xw6qkIp/lsbSMwO+DOhFaFSTIOR2Jh4/45HzNEPdjLa87MwowQd
3LZhfRQnPqNXLeUuHSVZYde1RXsgmrcfYJyWUqSHX33J7yROBLkuG+OkzBEJqmp2
BWQB2LWz4AJTPQ3EhlZ9o39z5geC1ie3i9VJI25OiMM7CBk0ESh1pHnIuL6tjHOk
TOJNNX+fe3z0I7xePTv9GS5qRvdgS9j5SiOP2ftIZ9c8QhTr4P8SzKrSIPYASBK4
bkCe8Q/G4ygOMXdjPkW4qZA6JE7W+J0ngVk/uy9mBFsAVZ89H/F5P6As6+0ElPNB
2pCHM4t/G/JjQ1zW5sPH
=P1q3
-----END PGP SIGNATURE-----

--=-iYU7jbEjY5Pe8jqeSAZ1--
