Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T1ye8-0001pl-V6
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 11:53:53 +0000
Message-ID: <1345118316.3393.218.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 3/4] UBI: use the whole MTD device size to get
 bad_peb_limit
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Thu, 16 Aug 2012 14:58:36 +0300
In-Reply-To: <20120816113254.2950cf36@pixies.home.jungo.com>
References: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
 <1341937423-16516-4-git-send-email-richard.genoud@gmail.com>
 <1345043331.3393.151.camel@sauron.fi.intel.com>
 <20120816113254.2950cf36@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Tn8o4o3FwOwLTg8lFSe2"
Mime-Version: 1.0
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Tn8o4o3FwOwLTg8lFSe2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-16 at 11:32 +0300, Shmulik Ladkani wrote:
> > -	default 2
> > -	range 0 25
> > +	int "Maximum expected bad eraseblock count per 1024 eraseblocks"
> > +	default 20
> > +	range 2 256
>=20
> Those defconfigs that explicilty set an original LIMIT should be
> adjusted as well, as the units have changed, no?

Yes, I'll do this, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Tn8o4o3FwOwLTg8lFSe2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLOBsAAoJECmIfjd9wqK0C3AP/17EZpWpsfrSJVrEGhg7cf9k
D9ty2qSIZxi4GpwpV8ou067n2ILsQKdbvLWbE6fHve5qbS1fw0qUD5io7zN2TCUB
8s9oQkp1XHkoR8kB+nZ4VhuNn64hW+o5pfHEx7YuSekuhpLe49QpW/9LofOOuqQm
4Yx24koz+2maJLKjzD8/UmyLozVLxsqBOsdsY2YNIEEVkXH2N0bv6x0v7miDo8Nk
aS7BeuaOY67wt2rY8D/+PaiFjNSCM0srTZ8fgRq5yXKcLuD9Xsj7tArLwHc/k11p
yeUhWFSrk7kGJ/gLhQrX8iykJ3Ozyls2a6Tjl44TGYThW3xjOvXPiQby0MsYIqta
+JJAxB8PAIz5Pt7pJxSgCjAcPyjO0V8RXwA46cJAdxJMla2q+57MFUTAWiDAhb7i
Fo94vK9d7fiP11Ms7Ed6ODgdfO1eaYXr17QkgxdkguUmE1Dtx0PSoH0mxMDEMC3Q
zSBCgVA8aqMUFqRBVPDj/dvLIFyWYe1sNi1xGSd/x0B2ml5Mz1WsnYxvrrLJaTSg
FzCAZbY4fO/TsADHhPVtjFsqMklVP/ZU7iHCKZcNuNvCmARknWOEjRxt164CNku3
o6EBtasflneC93ZyCNnoeAVnpAuPeJ+aOtA9MbRVLhRfFkkgsedeStTUVt+FbA1M
xyxm0WTbzxVAdCc9iYSW
=KQdV
-----END PGP SIGNATURE-----

--=-Tn8o4o3FwOwLTg8lFSe2--
