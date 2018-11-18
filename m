Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOSC0-0001Yi-9r
 for linux-mtd@lists.infradead.org; Sun, 18 Nov 2018 18:53:13 +0000
Date: Sun, 18 Nov 2018 19:52:58 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>,
 Michal Simek <michals@xilinx.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>
Subject: Re: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Message-ID: <20181118195258.4966e2c4@xps13>
In-Reply-To: <MWHPR02MB26234433484426F333E9B60EAFDC0@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1541739641-17789-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <MWHPR02MB26234433484426F333E9B60EAFDC0@MWHPR02MB2623.namprd02.prod.outlook.com>
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

Naga Sureshkumar Relli <nagasure@xilinx.com> wrote on Thu, 15 Nov 2018
09:34:16 +0000:

> Hi Boris & Miquel,
>=20
> I am updating the driver by addressing your comments, and I have one conc=
ern,  especially in anfc_read_page_hwecc(),=20
> there I am checking for erased pages bit flips.
> Since Arasan NAND controller doesn't have multibit error detection beyond=
 24-bit( it can correct up to 24 bit),
> i.e. there is no indication from controller to detect uncorrectable error=
 beyond 24bit.
> So I took some error count as default value(MULTI_BIT_ERR_CNT  16, I put =
this based on the error count that=20
> I got while reading erased page on Micron device).
> And during a page read, will just read the error count register and compa=
re this value with the default error count(16) and if it is more=20
> Than default then I am checking for erased page bit flips.
> I am doubting that this will not work in all cases.
> In my case it is just working because the error count that it got on an e=
rased page is 16.
> Could you please suggest a way to do detect erased_page bit flips when re=
ading a page with HW-ECC?.

So the ECC engine is broken by design.

I think you should determine a number of bitflips (16 looks nice to me)
over which you declare the page bad anyway.

Now, this is generic logic: anytime a page is declared bad, you should
re-read the page in raw mode and check for the number of bitflips
manually (thanks to the helpers in the core). Again, if the number of BF
is above 16, we can assume the page is bad and increment ->ecc.failed
accordingly.


Thanks,
Miqu=C3=A8l
