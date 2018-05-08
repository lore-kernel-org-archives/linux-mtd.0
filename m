Received: from mail1.bemta8.messagelabs.com ([216.82.243.195])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fG6Wy-0001tQ-Ku
 for linux-mtd@lists.infradead.org; Tue, 08 May 2018 17:36:18 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, PACKHAM Chris
 <chris.packham@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, "Joakim
 Tjernlund" <joakim.tjernlund@infinera.com>
Subject: RE: [PATCH] mtd: cfi_cmdset_0002: Change erase functions to retry for
 error
Date: Tue, 8 May 2018 17:35:48 +0000
Message-ID: <TY1PR01MB0954B3DF0974C4FC2DD04924DC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <TY1PR01MB0954474CBDBF98D0E3D3E648DC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <20180508132037.152cc581@bbrezillon>
 <TY1PR01MB095425A96233A864806D0635DC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <20180508191144.5d8412b6@bbrezillon>
In-Reply-To: <20180508191144.5d8412b6@bbrezillon>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris-san,

Thanks for your reviewing.

> > This is needed to prevent the flash erase error caused only once.
> > It was caused by the error case of chip_good() in the do_erase_oneblock=
().
> > Also it was confirmed on the MACRONIX flash device MX29GL512FHT2I-11G.
> > But the error issue behavior is not able to reproduce at this moment.
>=20
> Hm, that's a problem. How can you be sure the retry approach fixes the
> issue if you can't reproduce the it?

  I can reproduce the flash write error by the same reproduction method.
  And the error can be resolved by the same approach fixes as below.
    <http://lists.infradead.org/pipermail/linux-mtd/2018-May/080794.html>
  So it seems that the erase error also can be resolved by the changes.

> > The flash controller is parallel Flash interface integrated on BCM53003=
.
> >
> > Also the change is possible to resolve other erase error.
> > For example the Erase suspend issue was caused on Cypress AMD NOR flash=
.
> >   S29GL01GS / S29GL512S / S29GL256S / S29GL128S
>=20
> Is the Erase suspend issue related to this problem?

  I am not sure about the issue behavior detail since the issue is not caus=
ed on my environment.
  The issue was mentioned by Jocke-san on the following mail.
    <http://lists.infradead.org/pipermail/linux-mtd/2018-April/080518.html>
  Also I am asking to him to try the original patch on this thread.

Regards,
Ikegami
