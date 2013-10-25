Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZfNS-0001cj-4r
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 11:16:26 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: RE: [PATCH v2 0/5] Assorted OMAP2 NAND clean-ups
Date: Fri, 25 Oct 2013 11:15:57 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA2AE2A@DBDE04.ent.ti.com>
References: <1382696277-9063-1-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1382696277-9063-1-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "marek.belisko@gmail.com" <marek.belisko@gmail.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> -----Original Message-----
> From: Ezequiel Garcia [mailto:ezequiel.garcia@free-electrons.com]
[...]

> Pekon, Brian: Do you think this solution might work for 8-bit and 16-bit
> devices?
>=20
I think NAND_BUSWIDTH_AUTO (without GPMC changes) would fail in
following scenarios..

Case-1: configuring gpmc,device-width=3D1 from DT when using x16 device.
As your NAND driver is using NAND_BUSWIDTH_AUTO, it should
ignore this DT config, and based on ONFI params it should work as x16

Case-2: configuring gpmc,device-width=3D2 from DT when using x8 device.
As your NAND driver is using NAND_BUSWIDTH_AUTO, it should
ignore this DT config, and based on ONFI params it should work as x8

NAND device may get detected correctly, but try doing write and read
to NAND, and I think, it would fail for Case-2 at-least..=20
Can you please check ?


> I've been going through the GPMC code again, and it looks like some clean=
ing
> is needed
> there two, but that's a different story!
>=20
Actually having NAND_BUSWIDTH_AUTO would require change in GPMC
driver also.. please refer my comments in..=20
http://lists.infradead.org/pipermail/linux-mtd/2013-October/049284.html

reason of failure is given above...


with regards, pekon
