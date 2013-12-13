Received: from mail-pb0-x22a.google.com ([2607:f8b0:400e:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrNkD-0007jq-Cm
 for linux-mtd@lists.infradead.org; Fri, 13 Dec 2013 08:05:10 +0000
Received: by mail-pb0-f42.google.com with SMTP id uo5so2123550pbc.29
 for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2013 00:04:48 -0800 (PST)
Date: Fri, 13 Dec 2013 00:04:44 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: increase max page/OOB size to support 16K pagesize
 NAND
Message-ID: <20131213080444.GD24650@norris-Latitude-E6410>
References: <C3050A4DBA34F345975765E43127F10F25E47455@SZXEMA512-MBX.china.huawei.com>
 <20131213072705.GA28525@shlinux2.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131213072705.GA28525@shlinux2.ap.freescale.net>
Cc: David Woodhouse <David.Woodhouse@intel.com>,
 Caizhiyong <caizhiyong@hisilicon.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Quyaxin <quyaxin@hisilicon.com>,
 "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 13, 2013 at 03:27:12PM +0800, Huang Shijie wrote:
> On Fri, Dec 13, 2013 at 05:03:49AM +0000, Caizhiyong wrote:
> > --- a/include/linux/mtd/nand.h
> > +++ b/include/linux/mtd/nand.h
> > @@ -56,8 +56,8 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
> >   * is supported now. If you add a chip with bigger oobsize/page
> >   * adjust this accordingly.
> >   */
> > -#define NAND_MAX_OOBSIZE	744
> > -#define NAND_MAX_PAGESIZE	8192
> > +#define NAND_MAX_OOBSIZE	1280
> > +#define NAND_MAX_PAGESIZE	16384
> maybe it is time to remove these two macros.

It's like you read my mind :)

Brian
