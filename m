Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ox2A7-0003in-Sy
	for linux-mtd@lists.infradead.org; Sat, 18 Sep 2010 18:29:24 +0000
Received: by bwz19 with SMTP id 19so5022053bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Sep 2010 11:29:21 -0700 (PDT)
Subject: Re: Pull request for 2.6.36
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20100830124347.GK1473@pengutronix.de>
References: <20100823064024.GP27749@pengutronix.de>
	<1282865865.29421.47.camel@localhost>
	<20100827105538.GB1473@pengutronix.de>
	<1283083179.2131.33.camel@brekeke>
	<20100830124347.GK1473@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 18 Sep 2010 21:29:17 +0300
Message-ID: <1284834557.1721.67.camel@brekeke>
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

On Mon, 2010-08-30 at 14:43 +0200, Sascha Hauer wrote:
> The following changes since commit d1b113bb028999e82a8528e1484be8c23fb5a7d9:
> 
>   Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-2.6 (2010-08-23 18:30:30 -0700)
> 
> are available in the git repository at:
> 
>   git://git.pengutronix.de/git/imx/linux-2.6.git mtd-imx-nand
> 
> John Ogness (1):
>       mxc_nand: Do not do byte accesses to the NFC buffer.
> 
> Sascha Hauer (1):
>       mxc_nand: configure pages per block for v2 controller
> 
>  drivers/mtd/nand/mxc_nand.c |   47 +++++++++++++++++++++++-------------------
>  1 files changed, 26 insertions(+), 21 deletions(-)

FYI, both patches were merged upstream.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
