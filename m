Date: Thu, 15 Oct 2015 11:04:28 -0600
From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Liviu Dudau <Liviu.Dudau@arm.com>,
 Rafa?? Mi??ecki <zajec5@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, jogo@openwrt.org
Subject: Re: [PATCH] mtd: document linux-specific partition parser DT binding
Message-ID: <20151015170428.GA9250@obsidianresearch.com>
References: <1444915191-28350-1-git-send-email-linus.walleij@linaro.org>
 <20151015162210.GA4545@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151015162210.GA4545@localhost>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 15, 2015 at 09:22:10AM -0700, Brian Norris wrote:

> Are you trying to use this binding, or is this just purely a mechanical
> documentation issue? I ask, because it seems that binding never really
> got reviewed at all, and others have recently tried to extend
> support

I wrote it before ARM started down the DT direction and all these
formalities were developed.

> That's not to say we can't document the old one, but I'm curious if
> there are real users. I'd also like to encourage new users to avoid the
> old one if we can make that feasible.

We continue to use it here, there is just no way to autodetect flash
partition layouts. I'm not fussed about having to change to something
else in future.

The reason the original patch exposed the cmdline parser is because
that is how the internal mechanisms work - but realistically, the
cmdline parser is a hack to get around the lack of DT partition
description. If the DT can describe the partitions it should supersede
and obsolete the old command line hack. IMHO

> Also, if we're really going to support this, we should list exactly what
> strings we support. And that's one of the problems with the existing
> binding; it supports any old string Linux supports, which doesn't match
> how we typically want to add bindings (i.e., via proposal + review).

That is why it is prefixed with linux, the review of the part parser name is
the responsibility of the MTD crew, not the DT folks.

bcm47xxpart seems like a terrible name for a partition scheme. Really,
almost any scheme can be used on any SOC, naming a partition parser
after a SOC family makes very little sense to me..

Jason
