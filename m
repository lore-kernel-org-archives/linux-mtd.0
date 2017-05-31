Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFwzX-0005DY-13
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 06:20:24 +0000
Date: Wed, 31 May 2017 08:20:01 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Peter Pan =?UTF-8?B?5r2Y5qCL?= (peterpandong)" <peterpandong@micron.com>
Cc: "arnaud.mouiche@gmail.com" <arnaud.mouiche@gmail.com>, "richard@nod.at"
 <richard@nod.at>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "thomas.petazzoni@free-electrons.com"
 <thomas.petazzoni@free-electrons.com>, "marex@denx.de" <marex@denx.de>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "peterpansjtu@gmail.com" <peterpansjtu@gmail.com>,
 "linshunquan1@hisilicon.com" <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v6 00/15] A SPI NAND framework under generic NAND framework
Message-ID: <20170531082001.01d11e3d@bbrezillon>
In-Reply-To: <74cb9a07bd3247fd86002ef97509828f@SIWEX4H.sing.micron.com>
References: <74cb9a07bd3247fd86002ef97509828f@SIWEX4H.sing.micron.com>
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

Le Wed, 31 May 2017 01:12:16 +0000,
Peter Pan =E6=BD=98=E6=A0=8B (peterpandong) <peterpandong@micron.com> a =C3=
=A9crit :

> Hi Boris,
> =20
> On Thu, May 30, 2017 at 5:00 AM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > Hi Peter,
> >=20
> > On Wed, 24 May 2017 15:06:56 +0800
> > Peter Pan <peterpandong@micron.com> wrote:
> >  =20
> > > First of all, thank Boris and Marek for your priceless comments
> > > on v5 and thank everyone reviewed and tested on my previous series.
> > > I can never be here without your help. This series comes to v6
> > > and it becomes much better with your help.
> > >
> > > SPI NAND is a new NAND family device with SPI protocol as
> > > its interface. And its command set is totally different
> > > with parallel NAND.
> > >
> > > Our first attempt to SPI NAND was more than 2 years ago[1].
> > > At that time, I didn't make BBT shareable and there were
> > > too many duplicate code with parallel NAND, so that serie
> > > stoped. But the discussion never stops. Now Boris has a plan
> > > to make a generic NAND framework which can be shared with
> > > both parallel and SPI NAND. Now the first step of the
> > > new generic NAND framework is finished. And it is waiting
> > > for a user. After discussion with Boris. We both think it's
> > > time to rebuild SPI NAND framework based on the new NAND
> > > framework and send out for reviewing.
> > >
> > > This series includes two part. The first part (patch 1 to 9)
> > > is a new generic NAND framework from Boris Brezillon, which
> > > is from Biris's nand/generic branch[2]. The second part
> > > (patch 10 to 15) introductes a SPI NAND framework based on
> > > the new generic NAND framework.
> > >
> > > This series only supports basic SPI NAND features and uses
> > > generic spi controller for data transfer. ECC support is removed
> > > since it's not in a good structure and more important, it should
> > > be shared between different NAND devices, which means it should
> > > be in new NAND core. Support different types of ECC and advanced
> > > SPI NAND features is the next step.
> > >
> > > This series is based on nand/next branch and is tested on
> > > Xilinx Zedboard with Micron MT29F2G01ABAGDSF SPI NAND chip. =20
> >=20
> > As you can see, I started to review this v6, but I don't expect you to
> > send a new version (at least not immediately).
> >=20
> > Here is the plan: I'll finish reviewing the series, and while I'm
> > reviewing I'll try to address my own comments. Once the review/changes
> > are done, I'll push a nand/spi branch to the github repo [1] and ask
> > you and Arnaud to review/test the whole thing. If you're happy with
> > my changes (it should only be minor changes to your
> > initial implementation) I'll ask you to send a v7. I'll then wait for
> > 4.13-rc1 to be out and apply everything to my nand/next branch (I
> > expect a few conflicting changes in the nand/mtd area caused by the
> > migration to the new doc format, that's why I'd like to wait one more
> > cycle).
> >=20
> > If everything goes well, we should be good for 4.14, and the patches
> > will have spent enough time in linux-next to discover obvious bugs.
> >=20
> > Let me know if you have a problem with this approach. =20
>=20
> You plan is great, I'm OK with it. Looking forward to merge SPI NAND
> to main line :)

I'm still expecting replies to my review(s) to know if the changes I
plan to do are correct ;-).
