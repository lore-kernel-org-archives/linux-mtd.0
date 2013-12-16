Received: from szxga02-in.huawei.com ([119.145.14.65])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VsPVA-0007Uf-Cb
 for linux-mtd@lists.infradead.org; Mon, 16 Dec 2013 04:10:34 +0000
From: Caizhiyong <caizhiyong@hisilicon.com>
To: Huang Shijie <b32955@freescale.com>
Subject: RE: [PATCH] mtd: increase max page/OOB size to support 16K pagesize
 NAND
Date: Mon, 16 Dec 2013 04:08:43 +0000
Message-ID: <C3050A4DBA34F345975765E43127F10F25E47680@SZXEMA512-MBX.china.huawei.com>
References: <C3050A4DBA34F345975765E43127F10F25E47455@SZXEMA512-MBX.china.huawei.com>
 <20131213080118.GC24650@norris-Latitude-E6410>
 <C3050A4DBA34F345975765E43127F10F25E47537@SZXEMA512-MBX.china.huawei.com>
 <20131213151138.GA1316@gmail.com>
 <C3050A4DBA34F345975765E43127F10F25E47627@SZXEMA512-MBX.china.huawei.com>
 <20131216030649.GA27109@shlinux2.ap.freescale.net>
In-Reply-To: <20131216030649.GA27109@shlinux2.ap.freescale.net>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>,
 David Woodhouse <David.Woodhouse@intel.com>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: Huang Shijie [mailto:b32955@freescale.com]
> Sent: Monday, December 16, 2013 11:07 AM
> To: Caizhiyong
> Cc: Huang Shijie; Brian Norris; David Woodhouse; Quyaxin;
> linux-kernel@vger.kernel.org; linux-mtd@lists.infradead.org; Artem Bityut=
skiy;
> Wanglin (Albert); David Woodhouse
> Subject: Re: [PATCH] mtd: increase max page/OOB size to support 16K pages=
ize NAND
>=20
> On Mon, Dec 16, 2013 at 02:03:54AM +0000, Caizhiyong wrote:
> > > >
> > > > There are a lot of 16K page size NAND, they are used in android sys=
tem.
> > > >
> > > > Many NAND need read retry and data randomization, kernel does not s=
upport
> this
> > > feature.
> > > Brian is adding the read-retry feature.
> > >
> > > I think the data randomization should be done by the hardware.
> > > If we do it by software, it costs lot of the cpu cycles.
> > >
> > >
> > > > Kernel also does not support synchronous NAND.
> > >
> > > The synchronous NAND should be supported by the nand controller drive=
r,
> > > not the kernel.
> >
> > Yes. Those feature should be support by NAND controller hardware and dr=
iver.
> > But the driver does not know what NAND should use those feature.
> > Perhaps, the NAND id table, should add something.
> We can get the synchronous info from the ONFI nand.
>=20
> In actually, if you do not add this patch, i will change it too.
> I have several 16K nand chips on my hands now. :)

I have not found a good way to solve these problems. I expect your patch.

>=20
> thanks
> Huang Shijie
>=20
