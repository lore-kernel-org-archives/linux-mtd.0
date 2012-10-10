Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLx71-0007zF-FD
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 14:18:16 +0000
Message-ID: <1349878701.20594.30.camel@sauron.fi.intel.com>
Subject: Re: Offtopic: ubifs and best practice for supporting browser based
 firmware upgrades
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jaya Kumar <jayakumar.lkml@gmail.com>
Date: Wed, 10 Oct 2012 17:18:21 +0300
In-Reply-To: <CADqH6VxNTns60J6tc5a6SwdoGcetSK5sYF=a5Sf2HxDR+igCLg@mail.gmail.com>
References: <CADqH6VzVhsGvCCbokjW8TAJSq5Sj33GiHt4gZxOFZaeHtJ4JeQ@mail.gmail.com>
 <1346751620.12610.35.camel@sauron.fi.intel.com>
 <CADqH6Vw0kY=U-jymgpj_JpzLkqLb0JjK7J1C1V6qF_uo-jDFng@mail.gmail.com>
 <1348651795.24309.49.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1209261251200.19047@lnxricardw.se.axis.com>
 <1348658003.24309.70.camel@sauron.fi.intel.com>
 <CADqH6VxNTns60J6tc5a6SwdoGcetSK5sYF=a5Sf2HxDR+igCLg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-EDnKOPLMxB9dZJpnR9XD"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-EDnKOPLMxB9dZJpnR9XD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-26 at 20:38 +0800, Jaya Kumar wrote:
> I'm guessing I also need to hack the following in rename_volumes:
> desc =3D ubi_open_volume_nm(ubi->ubi_num, re->new_name, UBI_EXCLUSIVE);

Probably, you can use UBI_READONLY instead of UBI_EXCLUSIVE, I guess,
just to try if the approach works.

--=20
Best Regards,
Artem Bityutskiy

--=-EDnKOPLMxB9dZJpnR9XD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdYOtAAoJECmIfjd9wqK0cxAQAMM5W2cIIpnR4xUErEPFezNx
IxYsrYgsGggWRYtbZUnOiHOaAde1x8hta7C9JIWLIYyjiCMA5HzGrtmDnM4DeY9G
7XF8t1f8fD2ptJvyk0GTKkaCT/jmAKhxUUsoTCscZ6MCm+vrLL8+Amroigf8cFX6
Hj406KmEZuYPqWwnhJXyvYQ2kVNH93yDbe5Gq7PI14qbc3KxyCf0FRF7IIFo2Veb
zaGHxM45iWkAoS02WOtjMqiZpu5L5cbpuOOszaL5bduGUOuch/ZVUT68iJsaEPAX
p7pN5sWoxuyD4+WqUqFGXgQb9YzwXdxcHsHbqzV9CpOE6G+FLVWxrqTCWX46aKDL
0CFyFRbqHrapoEtZ6gFNa6HW/JlXVqKyVHV8nsV2R0J35JfcHvRNoWoDR+eMPmby
u751zsx90IC356Fikcy842GBxZt3AOPYLp/b0NVlQx9H4QJuSE8A3+RhmOvAEJDU
XXkPeDH53cbTVU70Jsg5IU4dgv5g3f8c8Ot2exBa9sbM0G/2dkKesp6H84NV9fbv
fD2QNVMeQmc2Grii6JbtJphJFsLJngGFjCPFufD8LLlI2cD5z9hMkDSd87XKlM+t
BerO0KfIjQ6C6NPDRDpe+Nr+hqaz7LSM2NIm0TLLKfqYYTXRdP08fEQhvuo3jLle
jKpgWp2QaJMNuEPLDV4t
=WOqB
-----END PGP SIGNATURE-----

--=-EDnKOPLMxB9dZJpnR9XD--
