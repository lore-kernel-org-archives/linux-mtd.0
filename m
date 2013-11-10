Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VfZSO-0006jm-AW
 for linux-mtd@lists.infradead.org; Sun, 10 Nov 2013 18:09:57 +0000
Date: Sun, 10 Nov 2013 15:09:02 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH 2/2] mtd: cmdlinepart: support master name is not set
 when parser partition
Message-ID: <20131110180900.GA2478@localhost>
References: <C3050A4DBA34F345975765E43127F10F1C08B3EA@szxeml512-mbs.china.huawei.com>
 <20131111030657.GA9406@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131111030657.GA9406@gmail.com>
Cc: "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Caizhiyong <caizhiyong@hisilicon.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Karel Zak <kzak@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "fengguang.wu@intel.com" <fengguang.wu@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 10, 2013 at 10:06:59PM -0500, Huang Shijie wrote:
> On Sat, Nov 09, 2013 at 11:43:06AM +0000, Caizhiyong wrote:
> > From: Cai Zhiyong <caizhiyong@huawei.com>
> > Date: Sat, 9 Nov 2013 17:54:12 +0800
> >  
> > @@ -143,5 +149,5 @@ MODULE_PARM_DESC(mtdparts, "Partitioning specification");
> >  module_param(mtdparts, charp, 0);
> >  
> >  MODULE_LICENSE("GPL");
> > -MODULE_AUTHOR("Marius Groeger <mag@sysgo.de>");
> > +MODULE_AUTHOR("Cai Zhiyong <caizhiyong@huawei.com>");
> I tested this patch with several cases, it is ok.
> 

Can you summarize such cases? Or maybe better, just share them all :)
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
