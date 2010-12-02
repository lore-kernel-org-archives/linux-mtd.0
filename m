Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PNzxR-0007lf-No
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 03:35:48 +0000
Received: by fxm19 with SMTP id 19so2864677fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Dec 2010 19:35:43 -0800 (PST)
Subject: Re: UBIFS oops after remount ro
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfgang Wegner <wolfgang@leila.ping.de>
In-Reply-To: <20101129170223.GF23237@leila.ping.de>
References: <20101126135005.GV23237@leila.ping.de>
	<1290785057.2552.14.camel@localhost>
	<20101129131807.GB23237@leila.ping.de>
	<1291040469.2141.10.camel@koala> <20101129151729.GE23237@leila.ping.de>
	<1291049157.2141.17.camel@koala> <20101129170223.GF23237@leila.ping.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Dec 2010 05:35:34 +0200
Message-ID: <1291260934.14534.6.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-11-29 at 18:02 +0100, Wolfgang Wegner wrote:
> Hi Artem,
> 
> On Mon, Nov 29, 2010 at 06:45:57PM +0200, Artem Bityutskiy wrote:
> > 
> > I cannot judge for sure, but this looks like non-UBIFS issue in 2.6.32,
> > so merging the stable 2.6.32.X tree can help. I make sense in general to
> > merge stable tree as well.
> 
> the problem is I still have some "marvell" tree
> (from git.marvell.com/orion.git) and am not sure if there is anything
> special in it.

Mostly vendors change drivers and board files. They usually do not touch
core functionality. So you can try to merge 2.6.32

> Would the "stock" 2.6.35.x from
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
> be an option in your opinion, too? I seem to remember the marvell tree
> was completely merged in between (right now digging through the commits
> to make it clear), so I could get an all shiny, new kernel when having
> to do any kind of merge at all...

Probably 2.6.35 would be good.

Anyway, the problem is that I do not really have time to drive you
through debugging of your issue. I only have time to get "big" results
from you and provide some help in form of my opinion :-(

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
