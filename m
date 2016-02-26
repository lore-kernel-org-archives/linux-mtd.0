Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZPxe-0005iP-4d
 for linux-mtd@lists.infradead.org; Fri, 26 Feb 2016 21:30:10 +0000
Date: Fri, 26 Feb 2016 22:28:51 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring
 <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>
Subject: Re: [PATCH 1/3] of: mtd: add helper reading "nand-ecc-algo" from DT
Message-ID: <20160226222851.7821d371@bbrezillon>
In-Reply-To: <CACna6rzRROfYwagsBGo5b8d_bydUBrJ=9RvGZSt1G85xP=gKaw@mail.gmail.com>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
 <20160224144652.14068468@bbrezillon>
 <CACna6rxemvBOu9fy9KP0327TsqonO7dFY5EsQjf1k9Ln6hX8cw@mail.gmail.com>
 <20160225210946.6c842f4b@bbrezillon>
 <CACna6ryVuqSLv8WdzzGUQzpA-F35JxXoHoa2jcLzZeHaXtoexA@mail.gmail.com>
 <20160226175506.75d6c7b0@bbrezillon>
 <CACna6rzRROfYwagsBGo5b8d_bydUBrJ=9RvGZSt1G85xP=gKaw@mail.gmail.com>
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

On Fri, 26 Feb 2016 22:24:21 +0100
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> On 26 February 2016 at 17:55, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Fri, 26 Feb 2016 17:30:47 +0100
> > Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
> >> What about:
> >> 1) Adding new nand-ecc-algo as this patch does
> >> 2) Deprecating "soft_bch" value from nand-ecc-mode property
> >>
> >
> > Sounds good to me.
>=20
> I have problems understanding "soft" values which maps to the
> NAND_ECC_SOFT. What exactly algorithm is that? It uses functions from
> drivers/mtd/nand/nand_ecc.c but this file isn't really helpful. I was
> only able to find "3-byte ECC" phase. Kconfig config MTD_NAND_ECC also
> doesn't have any description. I also tried looking at
> Documentation/mtd/nand_ecc.txt but still no luck.
>=20
> Does this algorithm has any name?
>=20

AFAIR, nand_ecc.c is implementing Hamming ECC.

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
