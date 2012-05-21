From: Marek Vasut <marex@denx.de>
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/4] GPMI-NAND: Define ecc.strength
Date: Mon, 21 May 2012 04:40:09 +0200
References: <1337562140-5739-1-git-send-email-marex@denx.de>
 <201205210336.41860.marex@denx.de>
 <20120521014121.GO5427@S2101-09.ap.freescale.net>
In-Reply-To: <20120521014121.GO5427@S2101-09.ap.freescale.net>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201205210440.09310.marex@denx.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Shawn Guo,

> On Mon, May 21, 2012 at 03:36:41AM +0200, Marek Vasut wrote:
> > Dear Shawn Guo,
> > 
> > > So non-DT probe has the same issue?  Or this is a DT probe only issue?
> > 
> > I started using DT, so I'm now fixing everything to work like it used to.
> > Damn this DT conversion broke about everything.
> 
> So you are saying the issue is introduced by gpmi-nand DT conversion?

I doubt so ... but noone ever could test it without DT bindings as you 
NAKed/stalled every single attempt to add the platform binding code. So this 
code was rotting in the tree, who knows how many bugs are still in it. Now I 
guess it's about time to start squashing the bugs.

Best regards,
Marek Vasut
