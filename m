Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 19zllI-0005S5-OW
	for <linux-mtd@lists.infradead.org>; Thu, 18 Sep 2003 00:31:04 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1063838749.2690.0.camel@imladris.demon.co.uk>
References: <E19zkca-0001jO-CD@phoenix.infradead.org>
	 <1063838749.2690.0.camel@imladris.demon.co.uk>
Message-Id: <1063841392.1183.637.camel@tubarao.lnxi.com>
Mime-Version: 1.0
Date: 17 Sep 2003 17:29:52 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-/iqFiwYwSmOH6vwS41d7"
cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/drivers/mtd/chips cfi_cmdset_0002.c,1.76,1.77
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-/iqFiwYwSmOH6vwS41d7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-09-17 at 16:45, David Woodhouse wrote:

> You just broke the 2.6 build.


Thanks.  Sometimes I'm so excited about "fixing" something that I don't
think past the end of my nose.

I backed out the problem and will drop in a better fix soon.

--=20
Thayne Harbaugh
Linux Networx

--=-/iqFiwYwSmOH6vwS41d7
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA/aO5wfsBPTKE6HMkRAtpxAJ9oFtP5h4Cw76rwtLNaOBne2gD34ACePs3i
ZwuLWNPVMxiPV+EwqBc8Kqg=
=JAAp
-----END PGP SIGNATURE-----

--=-/iqFiwYwSmOH6vwS41d7--
