Received: from mail-la0-f45.google.com ([209.85.215.45])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLAF2-0001A4-71
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 12:48:36 +0000
Received: by labgd6 with SMTP id gd6so10889161lab.7
 for <linux-mtd@lists.infradead.org>; Tue, 10 Feb 2015 04:48:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201502101155.44137.marex@denx.de>
References: <CAOMZO5BgY1YXdnoKpZJW6k9AdrDFZH=6mdCfuB=9aSVZukAV8A@mail.gmail.com>
 <20150209221859.GS18140@ld-irv-0074>
 <CAOMZO5BMrA1HGXXoriwbAk53Kmkr8GcQbEt75CuT_voeqW3s6Q@mail.gmail.com>
 <201502101155.44137.marex@denx.de>
Date: Tue, 10 Feb 2015 10:48:11 -0200
Message-ID: <CAOMZO5A8rj5z5=xStGpfCyhXtoCOU6BsB5gbbiPJjQzfd1jmXQ@mail.gmail.com>
Subject: Re: m25p80 spi1.0: unrecognized JEDEC id
From: Fabio Estevam <festevam@gmail.com>
To: Marek Vasut <marex@denx.de>, Stefan Wahren <stefan.wahren@i2se.com>
Content-Type: text/plain; charset=UTF-8
Cc: Huang Shijie <shijie8@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

On Tue, Feb 10, 2015 at 8:55 AM, Marek Vasut <marex@denx.de> wrote:
> On Tuesday, February 10, 2015 at 12:39:22 AM, Fabio Estevam wrote:

> Was the clock patch mucking with FRAC0 and FRAC1 merged by any chance?

Thanks for your suggestion! You are right: If I revert Stefan's patch:

commit 039e5970750775f102b255de9bf914e04955c6da ("clk: mxs: Fix
invalid 32-bit access to frac registers")

then the SPI NOR flash is probed correctly on mx28evk.

Stefan,

Could you please take a look?

Thanks,

Fabio Estevam
