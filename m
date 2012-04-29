Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOU8M-0000PM-8U
 for linux-mtd@lists.infradead.org; Sun, 29 Apr 2012 13:25:50 +0000
Received: by lboj14 with SMTP id j14so1700925lbo.36
 for <linux-mtd@lists.infradead.org>; Sun, 29 Apr 2012 06:25:46 -0700 (PDT)
Message-ID: <1335705942.1942.10.camel@koala>
Subject: Re: [PATCH v3 01/10] mtd: nand: add 'oob_required' argument to NAND
 {read,write}_page interfaces
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Sun, 29 Apr 2012 16:25:42 +0300
In-Reply-To: <20120429143631.532ce0a6@pixies.home.jungo.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
 <1335576594-25267-2-git-send-email-computersforpeace@gmail.com>
 <20120429143631.532ce0a6@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-gRHCn86aYmHb4QkjDH6F"
Mime-Version: 1.0
Cc: Li Yang <leoli@freescale.com>, Mike Dunn <mikedunn@newsguy.com>,
 Lei Wen <leiwen@marvell.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Kevin Cernekee <cernekee@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Prabhakar Kushwaha <prabhakar@freescale.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Scott Wood <scottwood@freescale.com>,
 Jamie Iles <jamie@jamieiles.com>, Thomas Gleixner <tglx@linutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Axel Lin <axel.lin@gmail.com>,
 Bastian Hecht <hechtb@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-gRHCn86aYmHb4QkjDH6F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-04-29 at 14:36 +0300, Shmulik Ladkani wrote:
> > Note: I couldn't compile-test all of these easily, as some had ARCH
> > dependencies.
> >=20
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>=20
> Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Brian, probably you take care of this, but just in case I would like to
ask to put tags like this to your patches when re-sending. I am trying
to be careful about this for several reasons: it shows that the patch
was reviewed, it saves the reviewers name in the git history which and
makes persons' contribution visible, so it is kind of a credit.

--=20
Best Regards,
Artem Bityutskiy

--=-gRHCn86aYmHb4QkjDH6F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPnUFWAAoJECmIfjd9wqK03JMQAJTyQQBEJf4tgpgCwEareJW2
jWn/6NdVDSeM1Fw7WVVqIjcH3dLIzNtEsDoVgeP8cOGvaPuunhjmAOaiVVTdrXSW
tEzAWkkkRmARiSnanTkT4U8AdEdzNcpTegIwfaJtNBNZg0ptiPlxJf84i6NG9mRu
bchabVcFXjw00crxGGc1jGGTj9BcqZ15bebDFefFHiLC4LLfmSvZpAoWkBXlvn5c
psnS9nWMc1UA0jFNMu3PuvZ0ah3WSj04jPnLJhH2mYYQDs2bHMFCTaHJIHhE3MG4
XngegC34fweHmYu0V1UB9ZAPnnh7wWPlq9N39n9d5Qr8Z3o/qWsBMDsLBjuVGb38
0TS6+9e1dV7YaL7dDI4AvXb8/j+kmbKFLcev8Ut95VDZmgUS4u8LE5RvRUHv6pES
VHbRmW3DCk3BP9Q6tC2EpHgLJOp8eqbcs+knAB8ieqQU4Ej3iaI5qBe7D4J4yPmW
6ziH6wSMkd6HxKQUCcHXbp2mgje1t/RouVP40UoX3OZFrMlj7VxeAYjqHun7H4iB
EU8tFsZs4yRGKntfAQqkj1IkGUrgKWp82VqzV9twJoj4VVoAECzh9DPezXvOvvPM
kgN3yJ0FOMpCQyPe5Zk0XzxxZMLPKXPz0rknqOy6g71idCHln/AXYdSnNbpdp766
2ogG5hQCUDlHyc1b9W2d
=Aprp
-----END PGP SIGNATURE-----

--=-gRHCn86aYmHb4QkjDH6F--
