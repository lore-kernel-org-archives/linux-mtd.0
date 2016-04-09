Received: from mail-io0-x22e.google.com ([2607:f8b0:4001:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aooTF-0002td-7j
 for linux-mtd@lists.infradead.org; Sat, 09 Apr 2016 08:42:22 +0000
Received: by mail-io0-x22e.google.com with SMTP id g185so157239336ioa.2
 for <linux-mtd@lists.infradead.org>; Sat, 09 Apr 2016 01:42:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201604090749.8VPOsSVm%fengguang.wu@intel.com>
References: <1460112945-9226-1-git-send-email-zajec5@gmail.com>
 <201604090749.8VPOsSVm%fengguang.wu@intel.com>
Date: Sat, 9 Apr 2016 10:42:00 +0200
Message-ID: <CACna6rwd4oka12UFJJY8Tv-d2dLr_AQxKzsJAb8LNePxD1Wrpg@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: nuc900: allow compiling with COMPILE_TEST
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: kbuild test robot <lkp@intel.com>, Steven Miao <realmz6@gmail.com>,
 adi-buildroot-devel@lists.sourceforge.net
Cc: kbuild-all@01.org, Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Wan ZongShun <mcuos.com@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9 April 2016 at 01:40, kbuild test robot <lkp@intel.com> wrote:
> [auto build test WARNING on mtd/master]
> [also build test WARNING on v4.6-rc2 next-20160408]
> [if your patch is applied to the wrong git tree, please drop us a note to help improving the system]
>
> url:    https://github.com/0day-ci/linux/commits/Rafa-Mi-ecki/mtd-nand-nuc900-allow-compiling-with-COMPILE_TEST/20160408-185814
> base:   git://git.infradead.org/linux-mtd.git master
> config: blackfin-allyesconfig (attached as .config)
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=blackfin
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/mtd/nand/nuc900_nand.c:36:0: warning: "SWRST" redefined [enabled by default]
>    arch/blackfin/mach-bf533/include/mach/defBF532.h:25:0: note: this is the location of the previous definition

Uh, I'm not sure what to do about this. The name SWRST sounds a bit
generic so I guess it shouldn't be defined by any common header.

In case of blackfin it's part of the System Interrupt Controller and
other defines are prefixed with SIC_. Maybe we should rename
blackfin's SWRST to SIC_SWRST?
