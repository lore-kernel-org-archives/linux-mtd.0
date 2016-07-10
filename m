Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bM2e7-0000VW-3V
 for linux-mtd@lists.infradead.org; Sun, 10 Jul 2016 00:30:55 +0000
Received: by mail-pa0-x244.google.com with SMTP id ib6so10443007pad.3
 for <linux-mtd@lists.infradead.org>; Sat, 09 Jul 2016 17:30:33 -0700 (PDT)
Date: Sat, 9 Jul 2016 17:30:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jonas Gorski <jogo@openwrt.org>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 John Crispin <john@phrozen.org>
Subject: Re: [PATCH v2] MTD: lantiq: handle NO_XIP on cfi0001 flash
Message-ID: <20160710003024.GA147054@google.com>
References: <1465245341-16026-1-git-send-email-hauke@hauke-m.de>
 <CAOiHx=kit1Fz2hTmyxStzCfGDDpc4vcx06E2JVmwve8tTWo7Gg@mail.gmail.com>
 <910195ee-2b46-bb69-472c-15c6321e9e5d@hauke-m.de>
 <CAOiHx=mbRCU_Wh+vaT+RZcjJWTvBautp9eAJT_Gv7JyfVfQ8Yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOiHx=mbRCU_Wh+vaT+RZcjJWTvBautp9eAJT_Gv7JyfVfQ8Yw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 06, 2016 at 11:54:52PM +0200, Jonas Gorski wrote:
> * actually AFAICT XIP isn't supported at all, at least not on MIPS.

I believe we recently determined that all mainline uses of MTD XIP are
defunct and/or broken. And I know very little about them, and care about
them even less.

Here's a piece of the last conversation I remember about it:

http://lists.infradead.org/pipermail/linux-mtd/2016-March/065997.html

Brian
