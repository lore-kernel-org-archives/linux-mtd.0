Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2cEJ-0006h3-UM
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 07:46:40 +0000
Received: by mail-pd0-f177.google.com with SMTP id q10so7059278pdj.36
 for <linux-mtd@lists.infradead.org>; Sun, 12 Jan 2014 23:46:17 -0800 (PST)
Date: Sun, 12 Jan 2014 23:46:13 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Caizhiyong <caizhiyong@hisilicon.com>
Subject: Re: [PATCH] mtd: nand:  assign mtd->name in find_full_id_nand
Message-ID: <20140113074613.GI1992@norris-Latitude-E6410>
References: <C3050A4DBA34F345975765E43127F10F25E47E20@SZXEMA512-MBX.china.huawei.com>
 <20131226021937.GA6752@shlinux2.ap.freescale.net>
 <20140111201019.GD1992@norris-Latitude-E6410>
 <C3050A4DBA34F345975765E43127F10F25E48C13@SZXEMA512-MBX.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C3050A4DBA34F345975765E43127F10F25E48C13@SZXEMA512-MBX.china.huawei.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Quyaxin <quyaxin@hisilicon.com>,
 "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 13, 2014 at 04:12:45AM +0000, Caizhiyong wrote:
> > -----Original Message-----
> > From: Brian Norris [mailto:computersforpeace@gmail.com]
> > Sent: Sunday, January 12, 2014 4:10 AM
> > 
> > On Thu, Dec 26, 2013 at 10:19:39AM +0800, Huang Shijie wrote:
> > > On Thu, Dec 26, 2013 at 01:51:58AM +0000, Caizhiyong wrote:
> > > > From: Cai Zhiyong <caizhiyong@huawei.com>
> > > > Date: Wed, 25 Dec 2013 21:19:21 +0800
> > > > Subject: [PATCH] mtd: nand: assign mtd->name in find_full_id_nand
> > > >
> > > > This patch assigned the type->name to mtd->name when mtd->name is
> > > > NULL in function "find_full_id_nand".
> > > > mtd->name is NULL may cause some problem.
> > > >
> > > > Signed-off-by: Cai Zhiyong <caizhiyong@huawei.com>
> > > Acked-by: Huang Shijie <b32955@freescale.com>
> > 
> > Thanks, the patch looks good. Pushed to l2-mtd.git.
> > 
> > Wouldn't this trigger an exception when reading
> > /sys/class/mtd/mtdX/name? If so, should this be marked for stable?
> 
> View the source code, if mtd->name is NULL, cat "/sys/class/mtd/mtdX/name" will get string "(null)".
> 
> static ssize_t mtd_name_show(struct device *dev, struct device_attribute *attr, char *buf)
> {
> 	struct mtd_info *mtd = dev_get_drvdata(dev);
> 
> 	return snprintf(buf, PAGE_SIZE, "%s\n", mtd->name);
> }

Thanks, I forgot that the kernel's printf-like functions handle NULL
pointers gracefully. In that case, this probably doesn't need to be in
-stable.

Brian
