Received: from mail-eopbgr770041.outbound.protection.outlook.com
 ([40.107.77.41] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP03l-0004R2-L4
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 07:02:58 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>, "robh@kernel.org"
 <robh@kernel.org>, Michal Simek <michals@xilinx.com>
Subject: RE: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Date: Tue, 20 Nov 2018 07:02:08 +0000
Message-ID: <BN6PR02MB2610C7D048E4A192E041BE14AFD90@BN6PR02MB2610.namprd02.prod.outlook.com>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1541739641-17789-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <MWHPR02MB26234433484426F333E9B60EAFDC0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181118204324.373ca9cc@bbrezillon>
 <MWHPR02MB2623AAEC160F40F061E23194AFD80@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181119090246.49060019@bbrezillon>
In-Reply-To: <20181119090246.49060019@bbrezillon>
Content-Language: en-US
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

Hi Boris,

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Monday, November 19, 2018 1:33 PM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Cc: miquel.raynal@bootlin.com; richard@nod.at; dwmw2@infradead.org;
> computersforpeace@gmail.com; marek.vasut@gmail.com; linux-mtd@lists.infra=
dead.org; linux-
> kernel@vger.kernel.org; nagasuresh12@gmail.com; robh@kernel.org; Michal S=
imek
> <michals@xilinx.com>
> Subject: Re: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for =
Arasan NAND
> Flash Controller
>=20
> On Mon, 19 Nov 2018 06:20:28 +0000
> Naga Sureshkumar Relli <nagasure@xilinx.com> wrote:
>=20
> > H Boris,
> >
> > > -----Original Message-----
> > > From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> > > Sent: Monday, November 19, 2018 1:13 AM
> > > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > > Cc: miquel.raynal@bootlin.com; richard@nod.at; dwmw2@infradead.org;
> > > computersforpeace@gmail.com; marek.vasut@gmail.com;
> > > linux-mtd@lists.infradead.org; linux- kernel@vger.kernel.org;
> > > nagasuresh12@gmail.com; robh@kernel.org; Michal Simek
> > > <michals@xilinx.com>
> > > Subject: Re: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support
> > > for Arasan NAND Flash Controller
> > >
> > > On Thu, 15 Nov 2018 09:34:16 +0000
> > > Naga Sureshkumar Relli <nagasure@xilinx.com> wrote:
> > >
> > > > Hi Boris & Miquel,
> > > >
> > > > I am updating the driver by addressing your comments, and I have
> > > > one concern,  especially in anfc_read_page_hwecc(), there I am chec=
king for erased pages
> bit flips.
> > > > Since Arasan NAND controller doesn't have multibit error detection
> > > > beyond 24-bit( it can correct up to 24 bit), i.e. there is no
> > > > indication from controller to detect
> > > uncorrectable error beyond 24bit.
> > >
> > > Do you mean that you can't detect uncorrectable errors, or just that
> > > it's not 100% sure to detect errors above max_strength?
> > Yes, in Arasan NAND controller there is no way to detect uncorrectable =
errors beyond 24-
> bit.
>=20
> So how do you detect uncorrectable errors when the strength is less than
> 24bits?
Below or equal to the level of ECC strength, controller will definitely cor=
rect.=20
But beyond the level of ECC strength, it won't even detect the errors.
>=20
> > >
> > > > So I took some error count as default value(MULTI_BIT_ERR_CNT  16, =
I
> > > > put this based on the error count that I got while reading erased p=
age on Micron device).
> > > > And during a page read, will just read the error count register and
> > > > compare this value with the default error count(16) and if it is mo=
re Than default then I
> am
> > > checking for erased page bit flips.
> > >
> > > Hm, that's wrong, especially if you set ecc_strength to something > 1=
6.
> > Ok
> > >
> > > > I am doubting that this will not work in all cases.
> > >
> > > It definitely doesn't.
> > Ok
> > >
> > > > In my case it is just working because the error count that it got o=
n an erased page is 16.
> > > > Could you please suggest a way to do detect erased_page bit flips w=
hen reading a page
> with
> > > HW-ECC?.
> > >
> > > I'm a bit lost. Is the problem only about bitflips in erase pages, or=
 is it also impacting reads
> of
> > > written pages that lead to uncorrectable errors.
> > Yes, it is for both. But in case of read errors that we can't detect be=
yond 24-bit, then the
> answer from HW design team
> > Is that the flash part is bad.
> > Unfortunately till now we haven't ran into that situation(read errors o=
f written pages beyond
> 24-bit).
>=20
> Can you please run nandbiterrs (availaible in mtd-utils). I fear your
> device won't pass the test.
Yes, nandbiterror test is passing till 24bit, after that it is failing.
>=20
> > But we are hitting this because of erased page reading(needed in case o=
f ubifs).
> >
> > >
> > > Don't you have a bit (or several bits) reporting when the ECC engine =
was not able to
> correct
> > > data? I you do, you should base the "detect bitflips in erase pages" =
logic on this information.
> > Bit reporting for several bit errors is there only for Hamming(1bit cor=
rection and 2bit
> detection) but not in BCH.
> >
>=20
> Then I tend to agree with Miquel: your ECC engine is broken, and I'm
> not even sure how to deal with that yet.
So as per the Miquel's suggestion, can I proceed to add the below one?
"you should re-read the page in raw mode and check for the number of bitfli=
ps manually (thanks to the helpers in the core). Again, if the number of BF=
 is above 16, we can assume the page is bad and increment ->ecc.failed acco=
rdingly."

Thanks,
Naga Sureshkumar Relli
