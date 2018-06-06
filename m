Received: from mail-eopbgr10088.outbound.protection.outlook.com ([40.107.1.88]
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQQb9-0002xA-Du
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2018 05:03:05 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>
CC: Poonam Aggrwal <poonam.aggrwal@nxp.com>, Ashish Kumar
 <ashish.kumar@nxp.com>, Ying Zhang <ying.zhang22455@nxp.com>
Subject: Accessing mtd partitions from driver/i2c
Date: Wed, 6 Jun 2018 05:02:47 +0000
Message-ID: <VI1PR0402MB38545D0A442329D88E4BAF7A97650@VI1PR0402MB3854.eurprd04.prod.outlook.com>
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

We have a requirement of using(read/write) one mtd partition from driver/i2=
c.=20

As per my googling  mtd->_read, mtd->_write APIs has not been used anywhere=
 other than driver/mtd layer.
Do we have any such framework/use case available in Linux which can be refe=
rred.

Any pointer/clue will be helpful

--pk

=20
