Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OqaEb-0002Oi-U5
	for linux-mtd@lists.infradead.org; Tue, 31 Aug 2010 23:27:23 +0000
Received: by yxf34 with SMTP id 34so3374478yxf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 Aug 2010 16:27:20 -0700 (PDT)
Subject: Re: Pull request: i.MX nand driver updates
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20100827105538.GB1473@pengutronix.de>
References: <20100823064024.GP27749@pengutronix.de>
	<1282865865.29421.47.camel@localhost>
	<20100827105538.GB1473@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Sep 2010 02:27:16 +0300
Message-ID: <1283297236.2018.61.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	John Ogness <john.ogness@linutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-08-27 at 12:55 +0200, Sascha Hauer wrote:
> The patch from John Ogness is a bug fix. 'configure pages per block for
> v2 controller' can be considered a bug fix since before this patch we
> relied on some register bits being set correctly by the bootloader.
> One patch can wait for the next merge window I think.
> I updated the branch to contain the following:

I do not know what dwmw2 would answer, but I think it is wrong to send a
pull request based on something which is not in the tree you want to get
it. If dwmw2 pulls your tree, he will also pull all the other stuff, and
then get beaten by Linus for basing things on a random commit.

Anyway, I cherry-picked those 2 patches and put them to my
l2-mtd-2.6.git tree to the for-2.6.36 branch, and will bug dwmw2.

Please, send the rest of your stuff for 2.6.37 as well.

Also, please, use "mtd:" prefix for all your patches.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
