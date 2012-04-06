Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SGA2V-0000wP-I1
 for linux-mtd@lists.infradead.org; Fri, 06 Apr 2012 14:21:23 +0000
Received: by iaky10 with SMTP id y10so3926376iak.36
 for <linux-mtd@lists.infradead.org>; Fri, 06 Apr 2012 07:21:21 -0700 (PDT)
Date: Fri, 6 Apr 2012 22:21:53 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Sam Gandhi <samgandhi9@gmail.com>
Subject: Re: Using GPMI-NAND driver on iMX28 using 3.4-rc1?
Message-ID: <20120406142151.GS7264@S2101-09.ap.freescale.net>
References: <CAOdLEaoEDr7fnswwV-Gs8tZF9Zj-RFnRa9Z=eqRFd0==OgV10Q@mail.gmail.com>
 <CAOMZO5AoFnM=cCR-kS4A1k2xY_bRd9+gN1p9bFxdyPS2-UdbkQ@mail.gmail.com>
 <4F7D3DB8.6080009@freescale.com>
 <CAOdLEaoy8ARS=awimR6fN8EcX+FrqxaSr3VUG3rP3zrNLOf+Gw@mail.gmail.com>
 <1333628861.31825.22.camel@vkoul-udesk3>
 <20120406022305.GJ7264@S2101-09.ap.freescale.net>
 <4F7EC6AF.6000603@freescale.com>
 <CAOdLEaoD2sezmXbOoBdZ4h4E+A2rqf-2K9P-Y6aUt+zeASZQrw@mail.gmail.com>
 <20120406135929.GR7264@S2101-09.ap.freescale.net>
 <CAOdLEaontAAN71LkHET7thE5a30wa0EiXPg9b84EOW_GgGoQJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOdLEaontAAN71LkHET7thE5a30wa0EiXPg9b84EOW_GgGoQJg@mail.gmail.com>
Cc: Vinod Koul <vinod.koul@linux.intel.com>,
 Russell King - ARM Linux <linux@arm.linux.org.uk>,
 Wolfram Sang <w.sang@pengutronix.de>, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 06, 2012 at 07:06:41AM -0700, Sam Gandhi wrote:
...
> Well then change the name of the function
> mxs_assign_cookie_enable_chan(), my point still stands.
> 
I just do not see the need of such churn.

> As the case illustrates  cookie needs to assigned before enabling the
> channel then why not do it in that function itself.

It's simply because cookie is cookie and channel is channel.

> At worst please
> put a comment in mxs_assign_cookie_enable() that says cookie must be
> assigned prior to calling enable channel.
> 
It's the best rather than worst to me. 

-- 
Regards,
Shawn
