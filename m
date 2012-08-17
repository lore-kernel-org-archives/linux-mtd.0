Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2NpB-0007Hf-IQ
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 14:46:58 +0000
Message-ID: <1345215093.1003.1.camel@sauron.fi.intel.com>
Subject: Re: gluebi and flash file systems using the OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Diego COSTE <diego.coste@st.com>
Date: Fri, 17 Aug 2012 17:51:33 +0300
In-Reply-To: <500FCB91.30009@st.com>
References: <500FCB91.30009@st.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-unSVmtmtVlmP3zBk/IEb"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-unSVmtmtVlmP3zBk/IEb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-07-25 at 12:33 +0200, Diego COSTE wrote:
> So here are the questions:
> Does gluebi provide an OOB emulation so that we can use *any* flash file
> system that uses the OOB ?
> Or do we have to force the FS not to use the OOB ?

No, OOB is not available on gluebi emulated MTD devices. However, since
it is emulation layer, and UBI itself does not care about what is in
OOB, I do not see why you could not add OOB support to gluebi.

--=20
Best Regards,
Artem Bityutskiy

--=-unSVmtmtVlmP3zBk/IEb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLlp1AAoJECmIfjd9wqK0NXUP/1fxvCV9nnVk61JNPGGi+i7J
zzQXA+16urpDLB+utPrPXqPgxPP69euHrMwjJlj5ky37uSZgTVJ5rfxSKqZ1X/9I
+i8IdnW6hlbHSHnFsCdBtZFZwpQ7slgnI6ePm7KnN+WbGKdA49F5lunlIh9csYHk
JYiNMJ9sZBC/XeqysDiI+Mc7ME+OqIm/oMG90WTU4NdBfCwoSr+C18Qx4NfwY6ej
OMjNGrRWRY2DwjuA8I5ulsyAoCU2sUsrFKIFWiS1lC62ZRF20k6D4R3yrUPMLNp4
HIw3OUiSwTsxX2a4ei7/Vt8rM7CVkNRHIZ7aaJob3GyJggL1t8q3/RuokTjoGOe/
28syH2e8memw0la0l1ZKxDkhoPY4EYueuQs9JMVTyNQcAVL3ZRxXSHhUt2ZPllPJ
+assX1JLKo2rApHsFB/951gHTLpbLfgr25OL1t8jsOBwfEmfS79wA6bztC0YhZ2C
wRIejQ9tXb8nCkdLnhG35rmjR2r0wHbaIu9fKibqE7EYOeck/8hKP9uu+OWH7AWH
sNfOT7EErXgaz4a3T7ilZr4kQNZntGCYVp7O0sEZWhNDUH/ENw0VdzMMkYdF4MKp
udj6OBYAPiRHsZvSD/pVEQo4P/o69gBjM1oCDr6AmNA2S1yxdEIeVTw5dFiSlXHJ
9nyazrZnfP2yt9I7ZYb2
=UiBs
-----END PGP SIGNATURE-----

--=-unSVmtmtVlmP3zBk/IEb--
