Received: from szxga01-in.huawei.com ([119.145.14.64])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vfhsg-0003QZ-Uy
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2013 03:09:41 +0000
From: Caizhiyong <caizhiyong@hisilicon.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: RE: [PATCH 2/2] mtd: cmdlinepart: support master name is not set
 when parser partition
Date: Mon, 11 Nov 2013 03:08:26 +0000
Message-ID: <C3050A4DBA34F345975765E43127F10F1C08B4C1@szxeml512-mbs.china.huawei.com>
References: <C3050A4DBA34F345975765E43127F10F1C08B3EA@szxeml512-mbs.china.huawei.com>
 <20131111030657.GA9406@gmail.com>
In-Reply-To: <20131111030657.GA9406@gmail.com>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "fengguang.wu@intel.com" <fengguang.wu@intel.com>, Artem
 Bityutskiy <dedekind1@gmail.com>,
 "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Karel Zak <kzak@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Sat, Nov 09, 2013 at 11:43:06AM +0000, Caizhiyong wrote:
> > From: Cai Zhiyong <caizhiyong@huawei.com>
> > Date: Sat, 9 Nov 2013 17:54:12 +0800
> >
> > @@ -143,5 +149,5 @@ MODULE_PARM_DESC(mtdparts, "Partitioning specificat=
ion");
> >  module_param(mtdparts, charp, 0);
> >
> >  MODULE_LICENSE("GPL");
> > -MODULE_AUTHOR("Marius Groeger <mag@sysgo.de>");
> > +MODULE_AUTHOR("Cai Zhiyong <caizhiyong@huawei.com>");
> I tested this patch with several cases, it is ok.

Thank you for test.

>=20
> But is it neccessary to change the author line?

I rewrite this module, there may be some bugs or other problems, if I keep =
the original author,
I am afraid that someone care about this.

>=20
> thanks
> Huang Shijie
