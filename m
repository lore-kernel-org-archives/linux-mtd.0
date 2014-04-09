Received: from mail-pb0-x232.google.com ([2607:f8b0:400e:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXkho-0000L1-8b
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 05:05:51 +0000
Received: by mail-pb0-f50.google.com with SMTP id md12so2009102pbc.37
 for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2014 22:05:24 -0700 (PDT)
Date: Tue, 8 Apr 2014 22:05:15 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [l2-mtd:spinor 125/128] ERROR: "spi_nor_ids"
 [drivers/mtd/devices/m25p80.ko] undefined!
Message-ID: <20140409050515.GA4400@brian-ubuntu>
References: <5344c1be.z3phCxZtgQ0NsWcF%fengguang.wu@intel.com>
 <5344CE4A.2000003@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5344CE4A.2000003@freescale.com>
Cc: kbuild test robot <fengguang.wu@intel.com>, linux-mtd@lists.infradead.org,
 kbuild-all@01.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 09, 2014 at 12:36:26PM +0800, Huang Shijie wrote:
> 于 2014年04月09日 11:42, kbuild test robot 写道:
> 
> >tree:   git://git.infradead.org/users/dedekind/l2-mtd.git spinor

Wow, you build every branch, not just those in -next?

> >head:   677a19bd871f1599891f3b75a689ea2da119cb08
> >commit: ca9c7429a9b6d4cee346a871a7a14789bfc69c8d [125/128] mtd: m25p80: use the SPI nor framework
> >config: make ARCH=x86_64 allmodconfig
> >
> >All error/warnings:
> >
> >>>ERROR: "spi_nor_ids" [drivers/mtd/devices/m25p80.ko] undefined!
> >>>ERROR: "spi_nor_scan" [drivers/mtd/devices/m25p80.ko] undefined!
> I missed to add the CONFIG_MTD_SPI_NOR_BASE to the *defconfig.
> 
> I guess it caused this compiler error.

No, it's actually because you didn't use EXPORT_SYMBOL(). I already have
a patch queued up. I'll send it out soon.

Brian
