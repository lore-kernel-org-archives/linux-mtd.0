Received: from szxga03-in.huawei.com ([119.145.14.66])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VsNYd-0005u9-HW
 for linux-mtd@lists.infradead.org; Mon, 16 Dec 2013 02:05:21 +0000
From: Caizhiyong <caizhiyong@hisilicon.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: RE: [PATCH] mtd: increase max page/OOB size to support 16K pagesize
 NAND
Date: Mon, 16 Dec 2013 02:03:54 +0000
Message-ID: <C3050A4DBA34F345975765E43127F10F25E47627@SZXEMA512-MBX.china.huawei.com>
References: <C3050A4DBA34F345975765E43127F10F25E47455@SZXEMA512-MBX.china.huawei.com>
 <20131213080118.GC24650@norris-Latitude-E6410>
 <C3050A4DBA34F345975765E43127F10F25E47537@SZXEMA512-MBX.china.huawei.com>
 <20131213151138.GA1316@gmail.com>
In-Reply-To: <20131213151138.GA1316@gmail.com>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>,
 David Woodhouse <David.Woodhouse@intel.com>, Quyaxin <quyaxin@hisilicon.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> >
> > There are a lot of 16K page size NAND, they are used in android system.
> >
> > Many NAND need read retry and data randomization, kernel does not suppo=
rt this
> feature.
> Brian is adding the read-retry feature.
>=20
> I think the data randomization should be done by the hardware.
> If we do it by software, it costs lot of the cpu cycles.
>
>=20
> > Kernel also does not support synchronous NAND.
>=20
> The synchronous NAND should be supported by the nand controller driver,
> not the kernel.

Yes. Those feature should be support by NAND controller hardware and driver=
.
But the driver does not know what NAND should use those feature.
Perhaps, the NAND id table, should add something.

Looking forward to your feedback.
Best regards.
Cai Zhiyong.
