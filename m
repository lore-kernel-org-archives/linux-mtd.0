Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M4Uwx-0004QU-0g
	for linux-mtd@lists.infradead.org; Thu, 14 May 2009 07:01:57 +0000
Subject: Re: [PATCH] mtd: mxc_nand: fix built breakage
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20090514065611.GU29278@pengutronix.de>
References: <1242229410-11853-1-git-send-email-daniel@caiaq.de>
	<4A0AF0C7.5090104@embeddedalley.com>
	<20090513161154.GK32424@buzzloop.caiaq.de>
	<20090514065611.GU29278@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 14 May 2009 10:01:19 +0300
Message-Id: <1242284479.27996.196.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vladimir Barinov <vbarinov@embeddedalley.com>,
	Linux MTD list <linux-mtd@lists.infradead.org>,
	linux-kernel@vger.kernel.org, Daniel Mack <daniel@caiaq.de>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-05-14 at 08:56 +0200, Sascha Hauer wrote:
> On Wed, May 13, 2009 at 06:11:54PM +0200, Daniel Mack wrote:
> > On Wed, May 13, 2009 at 08:09:43PM +0400, Vladimir Barinov wrote:
> > > Please find the patch that I've sent some time ago. This patch should  
> > > fix the issue you described.
> > > http://lists.infradead.org/pipermail/linux-mtd/2009-April/025363.html
> > 
> > 
> > Ah, ok, thanks.
> > 
> > Did anyone pick it up for mainline already?
> > Sascha, I didn't see that one in your tree either.
> 
> It seems to be pure luck when the patches on the mtd list get picked up.
> Most of the time I do not even a reaction from the list or David. I
> wonder if someone will beat me up when I take the i.MX nand patches via
> my arm tree.

I've put Vladimir's patch to my l2-mtd-2.6.git tree:
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git

which means I'll be pinging David about pulling it. This is all
I can do for you, unfortunately.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
