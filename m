Received: from mail-db5eur03on0627.outbound.protection.outlook.com
 ([2a01:111:f400:fe0a::627]
 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQtRb-0005G8-Qx
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2018 11:51:10 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, Poonam Aggrwal
 <poonam.aggrwal@nxp.com>, Ashish Kumar <ashish.kumar@nxp.com>, Ying Zhang
 <ying.zhang22455@nxp.com>, Alban Bedel <albeu@free.fr>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>
Subject: RE: Accessing mtd partitions from driver/i2c
Date: Thu, 7 Jun 2018 11:50:51 +0000
Message-ID: <AM6PR0402MB3847574FC7205E4F4E27020997640@AM6PR0402MB3847.eurprd04.prod.outlook.com>
References: <VI1PR0402MB38545D0A442329D88E4BAF7A97650@VI1PR0402MB3854.eurprd04.prod.outlook.com>
 <20180606092250.2d600a89@bbrezillon>
 <VI1PR0402MB38542B5CEB150AD440FFA62B97650@VI1PR0402MB3854.eurprd04.prod.outlook.com>
 <20180606155629.2c2a2e45@bbrezillon>
In-Reply-To: <20180606155629.2c2a2e45@bbrezillon>
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
> Sent: Wednesday, June 6, 2018 7:26 PM
> To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> Cc: linux-mtd@lists.infradead.org; marek.vasut@gmail.com; Poonam Aggrwal
> <poonam.aggrwal@nxp.com>; Ashish Kumar <ashish.kumar@nxp.com>; Ying
> Zhang <ying.zhang22455@nxp.com>; Alban Bedel <albeu@free.fr>; Srinivas
> Kandagatla <srinivas.kandagatla@linaro.org>
> Subject: Re: Accessing mtd partitions from driver/i2c
>=20
> +Alban and Srinivas
>=20
> On Wed, 6 Jun 2018 13:44:32 +0000
> Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:
>=20
> > Dear Borris,
> >
> > > -----Original Message-----
> > > From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> > > Sent: Wednesday, June 6, 2018 12:53 PM
> > > To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> > > Cc: linux-mtd@lists.infradead.org; marek.vasut@gmail.com; Poonam
> > > Aggrwal <poonam.aggrwal@nxp.com>; Ashish Kumar
> > > <ashish.kumar@nxp.com>; Ying Zhang <ying.zhang22455@nxp.com>
> > > Subject: Re: Accessing mtd partitions from driver/i2c
> > >
> > > Hi Prabhakar,
> > >
> > > On Wed, 6 Jun 2018 05:02:47 +0000
> > > Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:
> > >
> > > > Hi All,
> > > >
> > > > We have a requirement of using(read/write) one mtd partition from
> > > > driver/i2c.
> > > >
> > > > As per my googling  mtd->_read, mtd->_write APIs has not been used
> > > anywhere other than driver/mtd layer.
> > >
> > > It's used by at least one filesystem (JFFS2). And you should not
> > > look for mtd-
> > > >_xxx() users but mtd_xxx() users. You should never access the mtd
> > > >hooks
> > > directly but the wrappers that are exposed by the MTD API
> > > (mtd_read(), mtd_write(), mtd_erase(), ...).
> > >
> >
> > I can find it's usage in driver/firmware/ folder. Looks like it is
> > using nvram.
> >
> > > BTW, what's your use case? If it's about reading a piece of
> > > information from a RO partition, then the work initiated by Alban
> > > [1] and exposing some MTD parts are NVMEM providers should be a
> > > better match.
> >
> > Currently, Linux has i2c slave framework. It is reading/writing to DDR
> > emulated as EEPROM (drivers/i2c/i2c-slave-eeprom.c). We want something
> > similar, where DDR will be replaced by MTD partitions for read/write.
>=20
> Then NVMEM is the solution you're looking for. Alban, Srinivas, can you a=
gree
> on something regarding the DT bindings so that we can finally get this fe=
ature
> merged?
>=20

Patch set[1] shared by you, only supports read.=20
Can this framework also support write?

--pk

[1] https://patchwork.ozlabs.org/project/linux-mtd/list/?series=3D35728
