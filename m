Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SG06t-0007hT-1z
 for linux-mtd@lists.infradead.org; Fri, 06 Apr 2012 03:45:15 +0000
Received: by iaky10 with SMTP id y10so3274370iak.36
 for <linux-mtd@lists.infradead.org>; Thu, 05 Apr 2012 20:45:12 -0700 (PDT)
Date: Fri, 6 Apr 2012 11:45:48 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: Using GPMI-NAND driver on iMX28 using 3.4-rc1?
Message-ID: <20120406034542.GM7264@S2101-09.ap.freescale.net>
References: <20120404183314.GF17187@pengutronix.de>
 <CAOdLEaoboQowyx3T9ONjv-Y3q1JfFRb4ahS8CNrzeJi3N8Dczg@mail.gmail.com>
 <CAOMZO5AsbFDXHs3JRLC5=1MjZ7QrxciqV25xpZQL1Yvk3boQmw@mail.gmail.com>
 <CAOdLEaoEDr7fnswwV-Gs8tZF9Zj-RFnRa9Z=eqRFd0==OgV10Q@mail.gmail.com>
 <CAOMZO5AoFnM=cCR-kS4A1k2xY_bRd9+gN1p9bFxdyPS2-UdbkQ@mail.gmail.com>
 <4F7D3DB8.6080009@freescale.com>
 <CAOdLEaoy8ARS=awimR6fN8EcX+FrqxaSr3VUG3rP3zrNLOf+Gw@mail.gmail.com>
 <1333628861.31825.22.camel@vkoul-udesk3>
 <20120406022305.GJ7264@S2101-09.ap.freescale.net>
 <4F7E58B3.4050408@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F7E58B3.4050408@freescale.com>
Cc: Vinod Koul <vinod.koul@linux.intel.com>,
 Russell King - ARM Linux <linux@arm.linux.org.uk>,
 Fabio Estevam <festevam@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>,
 Sam Gandhi <samgandhi9@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 06, 2012 at 10:45:07AM +0800, Huang Shijie wrote:
> hi,
> >Isn't it done in mxs_dma_tx_submit() already? The gpmi driver somehow
> >misses the call to dmaengine_submit() for some case?
> >
> I checked the code again. It seems I do not miss the call to
> dmaengine_submit().
> 
I do not have nand device to play.  Maybe you want to have a check
if dma_cookie_assign (dmaengine_submit) and dma_cookie_complete
(via mxs_dma_int_handler) are being called as a pair for gpmi.

-- 
Regards,
Shawn
