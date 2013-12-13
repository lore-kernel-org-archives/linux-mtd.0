Received: from mail-pb0-x22e.google.com ([2607:f8b0:400e:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrNV8-0007Rd-8g
 for linux-mtd@lists.infradead.org; Fri, 13 Dec 2013 07:49:35 +0000
Received: by mail-pb0-f46.google.com with SMTP id md12so2100847pbc.19
 for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2013 23:49:12 -0800 (PST)
Date: Thu, 12 Dec 2013 23:49:08 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Caizhiyong <caizhiyong@hisilicon.com>
Subject: Re: [PATCH] mtd: increase max page/OOB size to support 16K pagesize
 NAND
Message-ID: <20131213074908.GB24650@norris-Latitude-E6410>
References: <C3050A4DBA34F345975765E43127F10F25E47448@SZXEMA512-MBX.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C3050A4DBA34F345975765E43127F10F25E47448@SZXEMA512-MBX.china.huawei.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>,
 Quyaxin <quyaxin@hisilicon.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
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

On Fri, Dec 13, 2013 at 05:01:56AM +0000, Caizhiyong wrote:
> The Toshiba's TC58TEG5DCJTA pagesize is 16K, oob size is 1280 bytes.
> So increase the NAND_MAX_OOBSIZE and NAND_MAX_PAGESIZE.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

Huh? I hope you're not intentionally forging Signed-off-by lines...
Presumably the follow-up (re)send is because this one was an accident?

> Signed-off-by: Cai Zhiyong <caizhiyong@huawei.com>

Brian
