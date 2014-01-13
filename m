Received: from szxga03-in.huawei.com ([119.145.14.66])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2YvH-0003ni-L9
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 04:14:49 +0000
From: Caizhiyong <caizhiyong@hisilicon.com>
To: Brian Norris <computersforpeace@gmail.com>, Huang Shijie
 <b32955@freescale.com>
Subject: RE: [PATCH] mtd: nand:  assign mtd->name in find_full_id_nand
Date: Mon, 13 Jan 2014 04:12:45 +0000
Message-ID: <C3050A4DBA34F345975765E43127F10F25E48C13@SZXEMA512-MBX.china.huawei.com>
References: <C3050A4DBA34F345975765E43127F10F25E47E20@SZXEMA512-MBX.china.huawei.com>
 <20131226021937.GA6752@shlinux2.ap.freescale.net>
 <20140111201019.GD1992@norris-Latitude-E6410>
In-Reply-To: <20140111201019.GD1992@norris-Latitude-E6410>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Quyaxin <quyaxin@hisilicon.com>, "Wanglin
 \(Albert\)" <albert.wanglin@hisilicon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: Brian Norris [mailto:computersforpeace@gmail.com]
> Sent: Sunday, January 12, 2014 4:10 AM
> To: Huang Shijie; Caizhiyong
> Cc: linux-mtd@lists.infradead.org; Wanglin (Albert); David Woodhouse;
> linux-kernel@vger.kernel.org; Artem Bityutskiy
> Subject: Re: [PATCH] mtd: nand: assign mtd->name in find_full_id_nand
>=20
> Hi,
>=20
> On Thu, Dec 26, 2013 at 10:19:39AM +0800, Huang Shijie wrote:
> > On Thu, Dec 26, 2013 at 01:51:58AM +0000, Caizhiyong wrote:
> > > From: Cai Zhiyong <caizhiyong@huawei.com>
> > > Date: Wed, 25 Dec 2013 21:19:21 +0800
> > > Subject: [PATCH] mtd: nand: assign mtd->name in find_full_id_nand
> > >
> > > This patch assigned the type->name to mtd->name when mtd->name is
> > > NULL in function "find_full_id_nand".
> > > mtd->name is NULL may cause some problem.
> > >
> > > Signed-off-by: Cai Zhiyong <caizhiyong@huawei.com>
> > Acked-by: Huang Shijie <b32955@freescale.com>
>=20
> Thanks, the patch looks good. Pushed to l2-mtd.git.
>=20
> Wouldn't this trigger an exception when reading
> /sys/class/mtd/mtdX/name? If so, should this be marked for stable?

View the source code, if mtd->name is NULL, cat "/sys/class/mtd/mtdX/name" =
will get string "(null)".

static ssize_t mtd_name_show(struct device *dev, struct device_attribute *a=
ttr, char *buf)
{
	struct mtd_info *mtd =3D dev_get_drvdata(dev);

	return snprintf(buf, PAGE_SIZE, "%s\n", mtd->name);
}
