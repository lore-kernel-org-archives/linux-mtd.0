Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgEbV-0006jp-I6
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 14:06:06 +0000
Received: by mail-pd0-f172.google.com with SMTP id w10so6954776pde.3
 for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2013 06:05:40 -0800 (PST)
Date: Tue, 12 Nov 2013 22:03:57 -0500
From: Huang Shijie <shijie8@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 2/2] mtd: cmdlinepart: support master name is not set
 when parser partition
Message-ID: <20131113030351.GA8465@gmail.com>
References: <C3050A4DBA34F345975765E43127F10F1C08B3EA@szxeml512-mbs.china.huawei.com>
 <20131111030657.GA9406@gmail.com> <20131110180900.GA2478@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131110180900.GA2478@localhost>
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

On Sun, Nov 10, 2013 at 03:09:02PM -0300, Ezequiel Garcia wrote:
> 
> Can you summarize such cases? Or maybe better, just share them all :)
I just test it with cases such as(my nand is just 1G):
   (1) mtdparts=gpmi-nand:16m(boot),16m(kernel),600m(dtb),600m(ok),-(rootfs)
   (2) mtdparts=gpmi-nand:16m(boot),16m(kernel),600m(ok),-(rootfs)
   (3) mtdparts=gpmi-nand:16m(boot),16m(kernel),600m(dtb),600m(ok),600m(ok2),-(rootfs)

thanks
Huang Shijie
