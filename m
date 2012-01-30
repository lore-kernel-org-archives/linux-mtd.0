From: Marek Vasut <marek.vasut@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] mtd/gpmi : add BBT support
Date: Mon, 30 Jan 2012 14:35:20 +0100
References: <1327898174-13656-1-git-send-email-b32955@freescale.com>
 <201201301324.13962.marek.vasut@gmail.com>
 <20120130131913.GE15596@pengutronix.de>
In-Reply-To: <20120130131913.GE15596@pengutronix.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201201301435.20237.marek.vasut@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, artem.bityutskiy@intel.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > The mainline incarnation of this should be able to work with the BBT just
> > fine. You can give it a go, mx28evk (the freescale kit) is supported.
> 
> Did you test? I can't find any NO_OOB option in the code. Not that you
> lose the BBTs...

I didn't. Let's also Cc Fabio here, I think he can comment on the FSL part of 
stuff better than me.

Btw. aren't we duplicating stuff here? The mx28 has some builtin badblock 
protection.
