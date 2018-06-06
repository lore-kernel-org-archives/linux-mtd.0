Received: from mail-ve1eur01on0627.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::627]
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQYk2-0007Wq-6W
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2018 13:44:51 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, Poonam Aggrwal
 <poonam.aggrwal@nxp.com>, Ashish Kumar <ashish.kumar@nxp.com>, Ying Zhang
 <ying.zhang22455@nxp.com>
Subject: RE: Accessing mtd partitions from driver/i2c
Date: Wed, 6 Jun 2018 13:44:32 +0000
Message-ID: <VI1PR0402MB38542B5CEB150AD440FFA62B97650@VI1PR0402MB3854.eurprd04.prod.outlook.com>
References: <VI1PR0402MB38545D0A442329D88E4BAF7A97650@VI1PR0402MB3854.eurprd04.prod.outlook.com>
 <20180606092250.2d600a89@bbrezillon>
In-Reply-To: <20180606092250.2d600a89@bbrezillon>
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

Dear Borris,

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Wednesday, June 6, 2018 12:53 PM
> To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> Cc: linux-mtd@lists.infradead.org; marek.vasut@gmail.com; Poonam Aggrwal
> <poonam.aggrwal@nxp.com>; Ashish Kumar <ashish.kumar@nxp.com>; Ying
> Zhang <ying.zhang22455@nxp.com>
> Subject: Re: Accessing mtd partitions from driver/i2c
>=20
> Hi Prabhakar,
>=20
> On Wed, 6 Jun 2018 05:02:47 +0000
> Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:
>=20
> > Hi All,
> >
> > We have a requirement of using(read/write) one mtd partition from drive=
r/i2c.
> >
> > As per my googling  mtd->_read, mtd->_write APIs has not been used
> anywhere other than driver/mtd layer.
>=20
> It's used by at least one filesystem (JFFS2). And you should not look for=
 mtd-
> >_xxx() users but mtd_xxx() users. You should never access the mtd hooks
> directly but the wrappers that are exposed by the MTD API (mtd_read(),
> mtd_write(), mtd_erase(), ...).
>=20

I can find it's usage in driver/firmware/ folder. Looks like it is using nv=
ram.

> BTW, what's your use case? If it's about reading a piece of information f=
rom a
> RO partition, then the work initiated by Alban [1] and exposing some MTD =
parts
> are NVMEM providers should be a better match.
>=20

Currently, Linux has i2c slave framework. It is reading/writing to DDR emul=
ated as EEPROM (drivers/i2c/i2c-slave-eeprom.c).
We want something similar, where DDR will be replaced by MTD partitions for=
 read/write.=20

--pk
