Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZcoN-000879-9b
 for linux-mtd@lists.infradead.org; Wed, 19 Dec 2018 14:27:01 +0000
Date: Wed, 19 Dec 2018 15:26:47 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, "robh@kernel.org"
 <robh@kernel.org>, "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>, Michal Simek
 <michals@xilinx.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 martin.lund@keep-it-simple.com
Subject: Re: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Message-ID: <20181219152647.76f77711@xps13>
In-Reply-To: <MWHPR02MB26237B932D7F3CCEE0476FE0AFBD0@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <MWHPR02MB2623AAEC160F40F061E23194AFD80@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181119090246.49060019@bbrezillon>
 <BN6PR02MB2610C7D048E4A192E041BE14AFD90@BN6PR02MB2610.namprd02.prod.outlook.com>
 <20181120120244.7d2442b5@bbrezillon>
 <20181120133624.3fa4742d@xps13>
 <MWHPR02MB26238A2271B33470ABFA1023AFD40@MWHPR02MB2623.namprd02.prod.outlook.com>
 <MWHPR02MB26239C2B2A7050310BEF1E9CAFA70@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181212091135.1d0cc9a6@xps13>
 <MWHPR02MB26236CEF8A2110B20C825198AFA70@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181212100931.149b0cac@xps13>
 <MWHPR02MB2623EDA15BE59304795F3034AFA70@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181212141825.69711c57@xps13>
 <MWHPR02MB26235AE6567A06EF4C6362E6AFBC0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181217174114.24196d17@xps13>
 <MWHPR02MB26237B932D7F3CCEE0476FE0AFBD0@MWHPR02MB2623.namprd02.prod.outlook.com>
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

Hi Naga,

+ Martin

Naga Sureshkumar Relli <nagasure@xilinx.com> wrote on Tue, 18 Dec 2018
05:33:53 +0000:

> Hi Miquel,
>=20
> > -----Original Message-----
> > From: Miquel Raynal [mailto:miquel.raynal@bootlin.com]
> > Sent: Monday, December 17, 2018 10:11 PM
> > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > Cc: Boris Brezillon <boris.brezillon@bootlin.com>; robh@kernel.org; ric=
hard@nod.at; linux-
> > kernel@vger.kernel.org; marek.vasut@gmail.com; linux-mtd@lists.infradea=
d.org;
> > nagasuresh12@gmail.com; Michal Simek <michals@xilinx.com>;
> > computersforpeace@gmail.com; dwmw2@infradead.org
> > Subject: Re: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support fo=
r Arasan
> > NAND Flash Controller
> >=20
> > Hi Naga,
> >=20
> > [...]
> >  =20
> > > Inserted biterror @ 48/7
> > > Successfully corrected 25 bit errors per subpage Inserted biterror @
> > > 50/7 ECC failure, invalid data despite read success
> > > root@xilinx-zc1751-dc2-2018_1:~#
> > >
> > > But even in this case also, driver is saying ECC failure but read suc=
cess.
> > > That means controller is able to detect errors on read page up to 24 =
bit only.
> > > After that there is no way to say to the upper layers that the page i=
s bad because of the =20
> > limitation in the controller.
> >=20
> > This is more than a "limitation", the design is broken. I am not sure h=
ow to support such
> > controller, and I am not sure if we even want to. =20
>=20
> The number of errors that are correctable is limited by a parameter 't'(t=
otal number of errors),
> If there is a condition that the number of errors greater than 't', then =
the controller won't be able to detect that.
> I guess this concept is same for other controllers as well.
> In Arasan it is limited to 24-bit.
>=20
> Even, in case of Hamming, it is 1-bit error correction and 2-bit error de=
tection.
> What will happen if there are multiple errors(greater than 2-bit)?

Ok let's use the Hamming comparison in your ECC engine case.

-> hamming:
 * 0 bf: everything is fine
 * 1 bf: will be detected, corrected, signaled
 * 2 bf: will be detected, not corrected, signaled
 * 3+ bf: don't care

-> BCH:
 * 0 bf: everything is fine
 * 1-24 bf: will be detected, corrected, signaled
 * 25 bf: everything is fine
 * 26+ bf: don't care

Do you see the problem?

In the 25 bf case, the controller is reporting that everything went
fine while it should report that it detected an uncorrectable
situation.

Here are two leads to solve this issue, please investigate them both:
1/ Talk to your colleagues that developed the RTL, ask if there is a
   hidden/reserved bit for that purpose that is not documented.
2/ Search for a status in the registers that might indicate that an
   error occurred, for instance "0 bf corrected" and "bf have been
   detected".

NB: I know that, with a BCH ECC engine, error detection at (strength +
1) is not 100% sure but statistically it will almost always be detected
and in this case we need the controller to warn the user!


Thanks,
Miqu=C3=A8l
