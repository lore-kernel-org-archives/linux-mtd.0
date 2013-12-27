Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VwZ1A-0000OF-49
 for linux-mtd@lists.infradead.org; Fri, 27 Dec 2013 15:08:04 +0000
Received: by mail-pa0-f46.google.com with SMTP id kp14so7431754pab.5
 for <linux-mtd@lists.infradead.org>; Fri, 27 Dec 2013 07:07:40 -0800 (PST)
Date: Fri, 27 Dec 2013 23:07:24 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Caizhiyong <caizhiyong@hisilicon.com>
Subject: Re: [PATCH] mtd: nand: remove NAND_MAX_OOBSIZE and NAND_MAX_PAGESIZE
Message-ID: <20131227150721.GA1953@gmail.com>
References: <C3050A4DBA34F345975765E43127F10F25E480C3@SZXEMA512-MBX.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C3050A4DBA34F345975765E43127F10F25E480C3@SZXEMA512-MBX.china.huawei.com>
Cc: "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>, Rashika Kheria <rashika.kheria@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 27, 2013 at 01:03:32PM +0000, Caizhiyong wrote:
> From: Cai Zhiyong <caizhiyong@huawei.com>
> Date: Fri, 27 Dec 2013 20:23:09 +0800
> Subject: [PATCH] mtd: nand: remove NAND_MAX_OOBSIZE and NAND_MAX_PAGESIZE
> 
> remove NAND_MAX_OOBSIZE and NAND_MAX_PAGESIZE, dynamic allocate
> NAND buffer after detecting NAND writesize and oobsize.
> 
>  - save memory. when use MACRO allocate static buffer, use a small
>    page size NAND chip, the buffer is still 8k, the memory is wasted.
> 
>  - reduce maintenance. NAND chip pagesize and oobsize update frequently,
>    allocate buffer according to the detecting size will reduce maintenance.
> 
>  - this fix was suggested by Brian Norris [computersforpeace@gmail.com]
>                          and Huang Shijie [b32955@freescale.com]

I have already sent out a patch set to remove these macros several days ago. :(


thanks
Huang Shijie
