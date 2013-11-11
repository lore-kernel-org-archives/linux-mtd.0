Received: from mail-pb0-x234.google.com ([2607:f8b0:400e:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VfVhK-0004Pt-Pe
 for linux-mtd@lists.infradead.org; Sun, 10 Nov 2013 14:09:09 +0000
Received: by mail-pb0-f52.google.com with SMTP id rr4so4076961pbb.25
 for <linux-mtd@lists.infradead.org>; Sun, 10 Nov 2013 06:08:45 -0800 (PST)
Date: Sun, 10 Nov 2013 22:06:59 -0500
From: Huang Shijie <shijie8@gmail.com>
To: Caizhiyong <caizhiyong@hisilicon.com>
Subject: Re: [PATCH 2/2] mtd: cmdlinepart: support master name is not set
 when parser partition
Message-ID: <20131111030657.GA9406@gmail.com>
References: <C3050A4DBA34F345975765E43127F10F1C08B3EA@szxeml512-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C3050A4DBA34F345975765E43127F10F1C08B3EA@szxeml512-mbs.china.huawei.com>
Cc: "fengguang.wu@intel.com" <fengguang.wu@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
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

On Sat, Nov 09, 2013 at 11:43:06AM +0000, Caizhiyong wrote:
> From: Cai Zhiyong <caizhiyong@huawei.com>
> Date: Sat, 9 Nov 2013 17:54:12 +0800
>  
> @@ -143,5 +149,5 @@ MODULE_PARM_DESC(mtdparts, "Partitioning specification");
>  module_param(mtdparts, charp, 0);
>  
>  MODULE_LICENSE("GPL");
> -MODULE_AUTHOR("Marius Groeger <mag@sysgo.de>");
> +MODULE_AUTHOR("Cai Zhiyong <caizhiyong@huawei.com>");
I tested this patch with several cases, it is ok.

But is it neccessary to change the author line?

thanks
Huang Shijie
