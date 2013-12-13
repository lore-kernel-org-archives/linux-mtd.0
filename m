Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrUPW-0000Sa-MU
 for linux-mtd@lists.infradead.org; Fri, 13 Dec 2013 15:12:15 +0000
Received: by mail-pa0-f51.google.com with SMTP id fa1so140915pad.10
 for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2013 07:11:51 -0800 (PST)
Date: Fri, 13 Dec 2013 23:11:39 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Caizhiyong <caizhiyong@hisilicon.com>
Subject: Re: [PATCH] mtd: increase max page/OOB size to support 16K pagesize
 NAND
Message-ID: <20131213151138.GA1316@gmail.com>
References: <C3050A4DBA34F345975765E43127F10F25E47455@SZXEMA512-MBX.china.huawei.com>
 <20131213080118.GC24650@norris-Latitude-E6410>
 <C3050A4DBA34F345975765E43127F10F25E47537@SZXEMA512-MBX.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C3050A4DBA34F345975765E43127F10F25E47537@SZXEMA512-MBX.china.huawei.com>
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

On Fri, Dec 13, 2013 at 11:10:10AM +0000, Caizhiyong wrote:
> 
> There are a lot of 16K page size NAND, they are used in android system.
> 
> Many NAND need read retry and data randomization, kernel does not support this feature.
Brian is adding the read-retry feature.

I think the data randomization should be done by the hardware.
If we do it by software, it costs lot of the cpu cycles.


> Kernel also does not support synchronous NAND.

The synchronous NAND should be supported by the nand controller driver,
not the kernel.


thanks
Huang Shijie
