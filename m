Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A4Lur-00076U-0E
	for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2003 15:55:53 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: linux-mtd@lists.infradead.org
Message-Id: <1064933671.8896.183.camel@tubarao.lnxi.com>
Mime-Version: 1.0
Date: 30 Sep 2003 08:54:31 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-RssytKoiA37RXEEAfY94"
Subject: Updates for cfi_cmdset_0002 and jedec_probe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-RssytKoiA37RXEEAfY94
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I've been dormant for a while.  I'm now making some long needed updates
to jedet_probe and cfi_cmdset_0002.  I have a list of patches that were
sent in that I'm going through:

Stefano Babic:
erase/write patch
http://lists.infradead.org/pipermail/linux-mtd/2003-August/008385.html

Fillod Stephane:
oops fixup
http://lists.infradead.org/pipermail/linux-mtd/2003-August/008399.html
buffered-mode write
http://lists.infradead.org/pipermail/linux-mtd/2003-August/008426.html

Carolyn Smith:
sbc8240

I haven't been ignoring anyone - I'm just a bit backlogged.  If anyone
else has patches then speak up now.

Thanks for everyone's patience.

--=20
Thayne Harbaugh
Linux Networx

--=-RssytKoiA37RXEEAfY94
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA/eZknfsBPTKE6HMkRApZGAJ9qeE7tCg4vbEgCovhGIporbTdQ0ACeKQUv
1gRdhQM2ocUpcUQXRojo/UU=
=cxT7
-----END PGP SIGNATURE-----

--=-RssytKoiA37RXEEAfY94--
