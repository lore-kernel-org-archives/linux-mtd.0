Received: from smtp-ext.int-evry.fr ([157.159.11.17])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HkecC-000419-Kv
	for linux-mtd@lists.infradead.org; Sun, 06 May 2007 07:09:22 -0400
From: Florian Fainelli <florian.fainelli@telecomint.eu>
To: linux-mtd@lists.infradead.org
Subject: Re: Finding ERASE_INFO from a Flash datasheet
Date: Sun, 6 May 2007 13:07:54 +0200
References: <200704281324.50082.florian.fainelli@telecomint.eu>
	<C7B3B39B-93F7-4210-99F9-5A9920542C52@logicaloutcome.ca>
In-Reply-To: <C7B3B39B-93F7-4210-99F9-5A9920542C52@logicaloutcome.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4737387.n4TEJxIlQ9";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200705061307.57801.florian.fainelli@telecomint.eu>
Cc: Glenn Henshaw <thraxisp@logicaloutcome.ca>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart4737387.n4TEJxIlQ9
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello Glenn,

Thank you very much for those informations. I think I had a try at putting =
8=20
erase regions of 4k but I did not change the erase command. Also, I am not=
=20
sure linux-2.6 accepts 8 ERASEINFO, last I tried it generated a warning.

Anyway, if you can send me patch I could have a try and resend an updated=20
version to linux-mtd.

Thanks.

Le lundi 30 avril 2007, Glenn Henshaw a =E9crit=A0:
> On 28-Apr-07, at 7:24 AM, Florian Fainelli wrote:
> > Hello all,
> >
> > I am using a box which has a SST 39VF6402B flash [1] driven by
> > jedec. This
> > flash is not yet referenced in the Linux kernel, and once I got the
> > right
> > erase informations, I will submit a patch to add it.
> >
> > For the moment, I have defined 4 strictly identical erase
> > informations :
> > ERASE_INFO(0x2000, 256), which makes me avoid this message "Sum of
> > regions
> > (400000) !=3D total size of set of interleaved chips (800000)". I am
> > pretty
> > sure these informations are completely wrong.
>
>    I'm using 6401B devices, but configured for both. I have 8 regions
> configured as ERASE_INFO(0x1000, 256).
>
>    It should be noted that the SST part has two erase modes: 4k and
> 64k blocks. If you want to use the small block erase mode, you will
> need to change the erase command from an 0x50 to 0x30.
>
>    I can provide a patch for the 2.4.27 kernel if you are interested.
>
> > If anyone has some clues about this, I will be glad finishing my
> > patch ;)
> >
> > Thank you very much in advance.
> >
> > [1] : http://www.sst.com/downloads/datasheet/S71288.pdf



=2D-=20
Cordialement, Florian Fainelli
=2D--------------------------------------------

--nextPart4737387.n4TEJxIlQ9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.3 (GNU/Linux)

iD8DBQBGPbcNmx9n1G/316sRAgozAJ4sIICpZ/kVU2x12jITAHEvDIR14ACfR/3k
rvb1ribQFXW9Gqw2SdD8O1s=
=TzK7
-----END PGP SIGNATURE-----

--nextPart4737387.n4TEJxIlQ9--
