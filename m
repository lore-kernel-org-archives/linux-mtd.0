Subject: Re: [PATCH] dmaengine: mxs-dma: skip request_irq for NO_IRQ
From: "Koul, Vinod" <vinod.koul@intel.com>
To: Shawn Guo <shawn.guo@freescale.com>
In-Reply-To: <20110707032441.GF4034@S2100-06.ap.freescale.net>
References: <20110630052855.GE25931@S2100-06.ap.freescale.net>
	<1309421193-7785-1-git-send-email-shawn.guo@linaro.org>
	<20110707001530.GE4034@S2100-06.ap.freescale.net>
	<1310004360.20150.16.camel@psiaudioba-mobl1>
	<20110707032441.GF4034@S2100-06.ap.freescale.net>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 14 Jul 2011 05:01:35 +0530
Message-ID: <1310599895.1536.30.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, Shawn Guo <shawn.guo@linaro.org>,
	linux-mtd@lists.infradead.org, Wolfram Sang <w.sang@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-07-07 at 11:24 +0800, Shawn Guo wrote:
> On Thu, Jul 07, 2011 at 07:36:00AM +0530, Vinod Koul wrote:
> > On Thu, 2011-07-07 at 08:15 +0800, Shawn Guo wrote:
> > > On Thu, Jun 30, 2011 at 04:06:33PM +0800, Shawn Guo wrote:
> > > > In general, the mxs-dma users get separate irq for each channel,
> > > > but gpmi is special one which has only one irq shared by all gpmi
> > > > channels.  It causes mxs_dma channel allocation function fail for
> > > > all other gpmi channels except the first one calling into the
> > > > function.
> > > > 
> > > > The patch gets request_irq call skipped for NO_IRQ case, and leaves
> > > > this gpmi specific quirk to gpmi driver to sort out.  It will fix
> > > > above problem if gpmi driver sets chan_irq as gpmi irq for only one
> > > > channel and NO_IRQ for all the rest channels.
> > > > 
> > > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > > > Cc: Vinod Koul <vinod.koul@intel.com>
> > > > ---
> > > 
> > > Hi Vinod,
> > > 
> > > Can you please take this patch?
> > > 
> > > Regards,
> > > Shawn
> > Looks okay to me. Have queued it up and should show up in my tree latest by early next week.
> > I am on road, hence the delay...
> > 
> No problem.  Thanks, Vinod.
Applied, Thanks
-- 
~Vinod
