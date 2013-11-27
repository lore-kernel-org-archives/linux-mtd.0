Received: from mail-in-16.arcor-online.net ([151.189.21.56])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlksY-00080e-OP
 for linux-mtd@lists.infradead.org; Wed, 27 Nov 2013 19:34:32 +0000
Date: Wed, 27 Nov 2013 20:34:06 +0100
From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress@arcor.de>
Subject: Re: JFFS2 Garbage collection issue
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OFC2D68B7C.CF5FC776-ONC1257C30.00395D40-C1257C30.0039B49A@transmode.se>
 (from joakim.tjernlund@transmode.se on Wed Nov 27 11:30:18 2013)
Message-Id: <1385580846.2836.1@deneb.(none)>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 protocol="application/pgp-signature"; boundary="=-exgiuFe6OF+QyVIgHQdM"
Cc: linux-mtd@lists.infradead.org, "Albrecht,
 Harald" <harald.albrecht@elreha.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-exgiuFe6OF+QyVIgHQdM
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jocke:

Am 27.11.13 11:30 schrieb(en) Joakim Tjernlund:
> BTW, I guess you got logging to file such as syslog on your system? JFFS2=
 really don't do well with small incremental writes. I recommend you turn s=
uch logging off.

Does the delay by the gc process happen only when the jffs2 fs is mounted, =
or also during the normal operation when many updates occur?

Background: I had a similar issue as Harald with a NVRAM which is used to h=
old quickly changing event buffers and logs.  My solution was to wait for t=
he gc process during the startup of the system, before the "main" applicati=
on is launched.  However, if this could also happen *after* the initial sca=
n has finished, this would be bad news for me, as I then probably would nee=
d the SIG(STOP|CONT) approach...

Thanks,
Albrecht.=

--=-exgiuFe6OF+QyVIgHQdM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iD8DBQBSlkkun/9unNAn/9ERAuEUAKCKx3N9Cx2o0QI6XTU482gMFgX0YwCgnceU
SAN3065O3wxAtO2FybCLZ8k=
=W6+u
-----END PGP SIGNATURE-----

--=-exgiuFe6OF+QyVIgHQdM--
