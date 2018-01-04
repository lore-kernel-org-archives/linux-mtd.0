Received: from mail-ve1eur01on0063.outbound.protection.outlook.com
 ([104.47.1.63] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eX6CW-0000hc-7b
 for linux-mtd@lists.infradead.org; Thu, 04 Jan 2018 14:08:57 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: mtd layer: support of hybrid flash(W25M161AW) having both NOR and
 NAND flash
Date: Thu, 4 Jan 2018 14:08:42 +0000
Message-ID: <HE1PR04MB1241937FF43AAA64AE7EE776971F0@HE1PR04MB1241.eurprd04.prod.outlook.com>
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

Hi All,

Winbond has come up with special flash i.e.  W25M161AW. It consist of Seria=
l NOR(Die #0) and Serial NAND(Die #1) flash.=20
Means both NOR, NAND flashes are placed in W25M161AW controlled by single c=
hip-select.=20

"Software Die Select (C2h)" command is being used to switch die or flash.=20
=20
It looks to be quite unique chip and wondering if any kind framework or wor=
k in progress available to handle it.=20
I know that SPI-NAND framework discussions is still in progress.  =20

Regards,
Prabhakar
