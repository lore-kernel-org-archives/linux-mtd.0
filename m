Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W24tJ-000161-II
 for linux-mtd@lists.infradead.org; Sat, 11 Jan 2014 20:10:47 +0000
Received: by mail-pa0-f47.google.com with SMTP id kq14so6088023pab.34
 for <linux-mtd@lists.infradead.org>; Sat, 11 Jan 2014 12:10:23 -0800 (PST)
Date: Sat, 11 Jan 2014 12:10:19 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>, Caizhiyong <caizhiyong@hisilicon.com>
Subject: Re: [PATCH] mtd: nand:  assign mtd->name in find_full_id_nand
Message-ID: <20140111201019.GD1992@norris-Latitude-E6410>
References: <C3050A4DBA34F345975765E43127F10F25E47E20@SZXEMA512-MBX.china.huawei.com>
 <20131226021937.GA6752@shlinux2.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131226021937.GA6752@shlinux2.ap.freescale.net>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, Dec 26, 2013 at 10:19:39AM +0800, Huang Shijie wrote:
> On Thu, Dec 26, 2013 at 01:51:58AM +0000, Caizhiyong wrote:
> > From: Cai Zhiyong <caizhiyong@huawei.com>
> > Date: Wed, 25 Dec 2013 21:19:21 +0800
> > Subject: [PATCH] mtd: nand: assign mtd->name in find_full_id_nand
> > 
> > This patch assigned the type->name to mtd->name when mtd->name is
> > NULL in function "find_full_id_nand".
> > mtd->name is NULL may cause some problem.
> > 
> > Signed-off-by: Cai Zhiyong <caizhiyong@huawei.com>
> Acked-by: Huang Shijie <b32955@freescale.com>

Thanks, the patch looks good. Pushed to l2-mtd.git.

Wouldn't this trigger an exception when reading
/sys/class/mtd/mtdX/name? If so, should this be marked for stable?

Brian
