Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6zCI-0007X5-Lm
 for linux-mtd@lists.infradead.org; Sat, 25 Jan 2014 09:06:39 +0000
Received: by mail-pa0-f42.google.com with SMTP id kl14so4161739pab.29
 for <linux-mtd@lists.infradead.org>; Sat, 25 Jan 2014 01:06:16 -0800 (PST)
Date: Sat, 25 Jan 2014 01:06:10 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 0/4] m25p80 Quad/Dual updates
Message-ID: <20140125090610.GD3162@norris-Latitude-E6410>
References: <1390309159-19643-1-git-send-email-geert@linux-m68k.org>
 <20140123020153.GA6229@shlinux2.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140123020153.GA6229@shlinux2.ap.freescale.net>
Cc: Marek Vasut <marex@denx.de>, linux-spi@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-mtd@lists.infradead.org,
 Sourav Poddar <sourav.poddar@ti.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 23, 2014 at 10:01:56AM +0800, Huang Shijie wrote:
> On Tue, Jan 21, 2014 at 01:59:15PM +0100, Geert Uytterhoeven wrote:
> Hi Brian:
>   should I rebase the SPI-NOR framework on this patch set?

Probably, but I would wait a bit.

I will probably try to take the first two patches of Geert's patch set
for 3.14, as they are a trivial improvement and a bugfix to other queued
material, while the rest will likely wait. And I still don't think we've
taken a close enough look at your existing series for it to be worth an
additional patch submission just yet. But it's up to you.

Brian
