Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffuE0-00010O-3M
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 21:43:09 +0000
Date: Wed, 18 Jul 2018 23:42:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Abhishek Sahu <absahu@codeaurora.org>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 4/5] mtd: rawnand: qcom: update BBT related flags
Message-ID: <20180718234255.4e51c188@xps13>
In-Reply-To: <20180718234144.158217f2@xps13>
References: <1530863519-5564-1-git-send-email-absahu@codeaurora.org>
 <1530863519-5564-5-git-send-email-absahu@codeaurora.org>
 <20180718231526.38046099@xps13>
 <20180718233637.49a39751@bbrezillon>
 <20180718234144.158217f2@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Abhishek,

Miquel Raynal <miquel.raynal@bootlin.com> wrote on Wed, 18 Jul 2018
23:41:44 +0200:

> Hi Boris,
>=20
> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Wed, 18 Jul 2018
> 23:36:37 +0200:
>=20
> > On Wed, 18 Jul 2018 23:15:26 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >  =20
> > > Hi Abhishek,
> > >=20
> > > Abhishek Sahu <absahu@codeaurora.org> wrote on Fri,  6 Jul 2018
> > > 13:21:58 +0530:
> > >    =20
> > > > Remove the NAND_SKIP_BBTSCAN to use RAM based BBT.     =20
> > >=20
> > > Unless I am understanding it the wrong way, NAND_SKIP_BBTSCAN will sk=
ip
> > > the scan of the on-chip BBT and will scan every block to construct a
> > > RAM, based BBT thanks to the BBM.
> > >=20
> > > So flash based BBT is already unused and removing this flag is a
> > > mistake, right?   =20
> >  =20
> > ->scan_bbt() is also taking care of building the in-RAM BBT based on   =
=20
> > BBM when no on-flash BBT is provided, so I think it's the right thing
> > to do. =20
>=20
> Oh right. Then doing so is harmless.

Could you please update the commit log to reflect this aspect?

>=20
> Thanks for the clarification.
> Miqu=C3=A8l
