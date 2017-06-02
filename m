Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dGfGh-0002Nv-Hv
 for linux-mtd@lists.infradead.org; Fri, 02 Jun 2017 05:37:05 +0000
Date: Fri, 2 Jun 2017 07:36:41 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-mtd@lists.infradead.org, andrew@lunn.ch, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] mtd: mchp23k256: device tree and mchp23lcv1024
Message-ID: <20170602073641.36be762b@bbrezillon>
In-Reply-To: <20170602032119.22282-1-chris.packham@alliedtelesis.co.nz>
References: <20170602032119.22282-1-chris.packham@alliedtelesis.co.nz>
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

Hi Chris,

Le Fri,  2 Jun 2017 15:21:14 +1200,
Chris Packham <chris.packham@alliedtelesis.co.nz> a =C3=A9crit :

> This series adds device tree support to the mchp23k256 driver and
> support for the mchp23lcv1024 chip. I suspect there are more compatible
> variants that we could now enumerate if desired.
>=20
> Note: I've included 2 patches that have already been applied to l2-mtd.gi=
t for
> context and so as not to upset the kbuild bot.
>=20
> Chris Packham (5):
>   mtd: mchp23k256: Add OF device ID table
>   mtd: mchp23k256: switch to mtd_device_register()

You should drop patches that have already been applied when sending a
new version.

>   mtd: handle partitioning on devices with 0 erasesize
>   mtd: mchp23k256: add partitioning support
>   mtd: mchp23k256: Add support for mchp23lcv1024
>=20
>  .../bindings/mtd/microchip,mchp23k256.txt          | 18 +++++
>  drivers/mtd/devices/mchp23k256.c                   | 78 ++++++++++++++++=
++----
>  drivers/mtd/mtdpart.c                              | 25 ++++---
>  3 files changed, 100 insertions(+), 21 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp2=
3k256.txt
>=20
