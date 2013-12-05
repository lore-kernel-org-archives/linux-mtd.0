Received: from mail-ie0-x22d.google.com ([2607:f8b0:4001:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoOWQ-0007KP-Qb
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 02:18:35 +0000
Received: by mail-ie0-f173.google.com with SMTP id to1so28667428ieb.32
 for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2013 18:18:13 -0800 (PST)
Date: Wed, 4 Dec 2013 18:18:09 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH v5 1/3] mtd: nand: gpio: Add DT property to
 automatically determine bus width
Message-ID: <20131205021809.GK27149@ld-irv-0074.broadcom.com>
References: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
 <20131127012158.GR9468@ld-irv-0074.broadcom.com>
 <1385715364.73252787@f82.i.mail.ru>
 <20131130091738.GE29397@norris.computersforpeace.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131130091738.GE29397@norris.computersforpeace.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Rob Herring <rob.herring@calxeda.com>, linux-mtd@lists.infradead.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>, Eric Miao <eric.y.miao@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 30, 2013 at 01:17:38AM -0800, Brian Norris wrote:
> On Fri, Nov 29, 2013 at 12:56:04PM +0400, Alexander Shiyan wrote:
> > Can at least part [2/3] "mtd: nand: gpio: Use devm_gpio_request_one() where possible"
> > be applied at this time?
> 
> Probably. I was avoiding taking things out of order in the series for
> now, but I'll take another look. If it looks good and applies
> independently, then I'll take it.

Patch 2 can't be applied independently. You can rebase and resend if you
want it applied.

We still haven't resolved patch 1. It doesn't seem like quite the right
binding.

Brian
