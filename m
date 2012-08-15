Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T1d7R-0005JN-Ia
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 12:54:42 +0000
Message-ID: <1345035562.3393.141.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] nand: nand_bbt: Export nand_update_bbt
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Date: Wed, 15 Aug 2012 15:59:22 +0300
In-Reply-To: <CAOMZO5ApXx6WB8XkrsMAgM+haJko=6WgiNby3yEj-N7tnktu+w@mail.gmail.com>
References: <1343514616-9019-1-git-send-email-festevam@gmail.com>
 <1343514616-9019-2-git-send-email-festevam@gmail.com>
 <CAOMZO5ApXx6WB8XkrsMAgM+haJko=6WgiNby3yEj-N7tnktu+w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QOBIVYn5sZH3ioq1+fp8"
Mime-Version: 1.0
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 linux-mtd@lists.infradead.org, marex.vasut@denx.de, kernel@pengutronix.de,
 shawn.guo@linaro.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-QOBIVYn5sZH3ioq1+fp8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-08-14 at 19:50 -0300, Fabio Estevam wrote:
> Artem,
>=20
> On Sat, Jul 28, 2012 at 7:30 PM, Fabio Estevam <festevam@gmail.com> wrote=
:
> > From: Fabio Estevam <fabio.estevam@freescale.com>
> >
> > When building MTD_NAND_GPMI_NAND as module, the following error shows u=
p:
> >
> > ERROR: "nand_update_bbt" [drivers/mtd/nand/gpmi-nand/gpmi_nand.ko] unde=
fined!
> >
> > Export nand_update_bbt to fix it.
> >
> > Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
>=20
> Any comments on this series, please?

If you need something to be merged upstream urgently, please, bug dwmw2
because I do not merge MTD stuff to Linus anyway. You guys can reach him
at the #mtd channel in OFTC faster than by e-mail.

Otherwise, I will come to this patch later. I have a lot of not
responded e-mails/patches in my mailbox, and I start looking at the
oldest first. So at some point I will reach this one as well.

--=20
Best Regards,
Artem Bityutskiy

--=-QOBIVYn5sZH3ioq1+fp8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQK50qAAoJECmIfjd9wqK02rYQAJsQj+yYSbRzycnxA2wH9SW7
sK4qU539zpvNiRQUUCeyF3yQrqfdr4s22cBZkhfOwVAcnPsVIzilIPG+PCwj1hFE
vV2fwOLedcbLbpM7nJWokRPWweoXgT/SUjIjZvVinMEySy90f0a75fYEDZ/lIAaV
aSlUryDRea6UMJ4U60gZnPJzhtH2SW/k2/WLe2iXRaK8bJAquG/PUY9RO95ODl6/
iqLLgcuOr79Qhwk84/XmM91FUU8g+5jjioeO6jKPEuarlXpNBxQGQidI2ndNP6l/
AB4gDaHaD+bkk0pI7mRqh30/j08x98zzKNO1mJgMFLavzJKgTwVY1sbFWt2+4r0Z
PxoSCZSuj1dMTSAnvVdfilQS0GiDeISWrmYLgjL3K3KWPaldDJHMcvOTMS95JYYf
ev8W/Rw981MWqubHaRMuUEwl7xkmaiw53xE4atHmOEM/yjmwa2Ss+san1yVVxeIC
As+GkV2WM5Q1oCWdboRLyHoF/tAbTp/gMTXRKid87M7r4WJsQ5EJojCKFsXVM+gB
Czf8C/3ODjhw7xAadJoUkoeUxVBldaAWbiV8Cpjk4Tk3O6M8ceeyT/2JVMOqJPaf
JaLp3wj0mW8ASIuaa2bUDtciMVgUg31mSKY/3+s0grW35beMe9/YzDpZLV1Xnxev
kNpXQP9WmnvRRomLMGqm
=aE7F
-----END PGP SIGNATURE-----

--=-QOBIVYn5sZH3ioq1+fp8--
