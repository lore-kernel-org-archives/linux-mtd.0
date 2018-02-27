Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eqiSg-0000au-NY
 for linux-mtd@lists.infradead.org; Tue, 27 Feb 2018 16:50:44 +0000
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 <devicetree@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Nadav Haklai <nadavh@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Antoine Tenart <antoine.tenart@bootlin.com>
Subject: Re: [PATCH v2 0/2] Update 64-bit DT with new NAND controller bindings
References: <20180219222045.1927-1-miquel.raynal@bootlin.com>
Date: Tue, 27 Feb 2018 17:50:31 +0100
In-Reply-To: <20180219222045.1927-1-miquel.raynal@bootlin.com> (Miquel
 Raynal's message of "Mon, 19 Feb 2018 23:20:43 +0100")
Message-ID: <87inaijs14.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,
=20
 On lun., f=C3=A9vr. 19 2018, Miquel Raynal <miquel.raynal@bootlin.com> wro=
te:

> Hello,
>
> These two patches have already been submitted and accepted by Gregory
> and were stacked for 4.17. But since then a small modification happened
> due to a request from Rob Herring. Also, armada-cp110-[master/slave].dtsi
> files became armada-cp110.dtsi due to the DT de-duplication work from
> Thomas Petazzoni. This small series should replace the two patches
> laying in the mvebu tree and should apply cleanly.
>
> Thank you,
> Miqu=C3=A8l
>
> Changes since v1:
>   - Renamed a NAND property: s/marvell,rb/nand-rb/ which is already
>     documented.
>   - Rebased on v4.16-rc1.
>
> Miquel Raynal (2):
>   arm64: dts: marvell: use reworked NAND controller driver on Armada 7K
>   arm64: dts: marvell: use reworked NAND controller driver on Armada 8K


Both applied on mvebu/dt64

Thanks,

Gregory

>
>  arch/arm64/boot/dts/marvell/armada-7040-db.dts | 50 ++++++++++++++++----=
------
>  arch/arm64/boot/dts/marvell/armada-8040-db.dts | 44 +++++++++++++-------=
---
>  arch/arm64/boot/dts/marvell/armada-cp110.dtsi  |  8 ++---
>  3 files changed, 61 insertions(+), 41 deletions(-)
>
> --=20
> 2.14.1
>

--=20
Gregory Clement, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
