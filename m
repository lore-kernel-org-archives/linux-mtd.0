Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaI6z-0007uk-Hx
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 05:10:17 +0000
Received: by mail-pa0-f43.google.com with SMTP id bj1so10485818pad.2
 for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2014 22:09:55 -0700 (PDT)
Date: Tue, 15 Apr 2014 22:09:52 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Caizhiyong <caizhiyong@hisilicon.com>
Subject: Re: [PATCH] mtd: nand: remove unused function input parameter
Message-ID: <20140416050952.GK3131@norris-Latitude-E6410>
References: <C3050A4DBA34F345975765E43127F10F25E47D50@SZXEMA512-MBX.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C3050A4DBA34F345975765E43127F10F25E47D50@SZXEMA512-MBX.china.huawei.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 25, 2013 at 12:40:50PM +0000, Caizhiyong wrote:
> From: Cai Zhiyong <caizhiyong@huawei.com>
> Date: Wed, 25 Dec 2013 20:11:15 +0800
> Subject: [PATCH] mtd: nand: remove unused function input parameter
> 
> The nand_get_flash_type parameter "busw" input value is not used by any
> branch, and it is updated before use it in the function, so remove it, 
> define the "busw" as an internal variable.
> 
> Signed-off-by: Cai Zhiyong <caizhiyong@huawei.com>

I merged this patch and sent it upstream for 3.15-rc1, but I don't think
I ever sent you a notification... here goes:

Applied, thanks!

Brian
