Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TXw4P-0000yC-Pk
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 15:37:06 +0000
Message-ID: <1352734659.2262.9.camel@sauron.fi.intel.com>
Subject: Re: [question]MTD:unstable bit issues?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hejianet <hejianet@linux.vnet.ibm.com>
Date: Mon, 12 Nov 2012 17:37:39 +0200
In-Reply-To: <50877953.9040602@linux.vnet.ibm.com>
References: <50877953.9040602@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-r050RknohLoRaNHGNEkv"
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


--=-r050RknohLoRaNHGNEkv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-24 at 13:14 +0800, hejianet wrote:
> I search google and find it might be relevant to "unstable bits
> issue"(bit-flip) in nand.
> I wonder is the bit-flip the possible reason to cause such a 4k all-zero
> hole?
> Thanks for any suggestion.

I do not think it is related to unstable bits. It may be related to
JFFS2 having a bug and not flushing the write-buffer on fsync, so fsync
does not work. Check that.

--=20
Best Regards,
Artem Bityutskiy

--=-r050RknohLoRaNHGNEkv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQoRfDAAoJECmIfjd9wqK0b+0QAKZTgat+qgZ1WIaK1AOGzilt
28l59mpGMDU+fqEk6LseA5FUDysl2HqU0g/TKM/ADnGkdF3lAIVOf06I/pze5q5T
xruTkvCy/WhlbwIofbH0rEFR8XT7APIJDqwE8KL883vhCJ4yA18F1uCrWhObVuHY
J7WABJHaCG9LtKU597frI5tupDDe2GSwD2IM+Wkez79XVvCW8b7tt13KlRlu3JRO
2CQ7aOaitBNx7RElVWiy6PfF/0rCFpsiJag++kt1E3G5A2fxfuwnH8l/oMP55rJZ
9eTA2zWEDsscvF9CkU9MHq6Oq80cH0mVcuRha85zvklyG0IW/lzKwxIi7a3ccQRt
tVz0ZvclqeTCZLrzAEFGYbuob4ZfDLWWEM3Ztu+N+SGA3Dg+KkprCfxHZS7eF0kK
ahh15UstDk4kr4FW2PwxjnZ2oomoMw8jiZr+PF1+E1jvyJKn7JWfUKIr/LPfS7lh
H0EcLrChd0SfFQ44yXIUUwfDwYNRHsHbPx0QFHKfelDxDhbe2T2wozGbxbi4uEZs
TlSdA+KzunwJi1C8BWk9sGxtO3W0pe0L1s45+8PFeR7Ur74c7H19yfDdywEdro6d
hGe4aCss9oZtXkSmfIorcVidvxpLY0Oef+DzUoezpv05HORMMWA1uEpNVX+7loX9
yLHGuPTFTEadlTHdH6/f
=xYDJ
-----END PGP SIGNATURE-----

--=-r050RknohLoRaNHGNEkv--
