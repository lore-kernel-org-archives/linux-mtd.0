Date: Wed, 21 Dec 2011 12:58:06 +0800
From: Shawn Guo <shawn.guo@freescale.com>
To: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 0/4] Fix the left DMA_NONE from dma_transfer_direction
 migration
Message-ID: <20111221045805.GE5983@S2101-09.ap.freescale.net>
References: <1323791286-29574-1-git-send-email-shawn.guo@linaro.org>
 <1324373044.1641.10096.camel@vkoul-udesk3>
 <20111220125401.GA5129@S2101-09.ap.freescale.net>
 <1324440424.1641.10104.camel@vkoul-udesk3>
 <20111221044517.GD5983@S2101-09.ap.freescale.net>
 <1324442451.1641.10109.camel@vkoul-udesk3>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1324442451.1641.10109.camel@vkoul-udesk3>
Cc: Artem Bityutskiy <artem.bityutskiy@intel.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Chris Ball <cjb@laptop.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 21, 2011 at 10:10:51AM +0530, Vinod Koul wrote:
> On Wed, 2011-12-21 at 12:45 +0800, Shawn Guo wrote:
> > > 
> > The term PIO here may not the one on your mind.  I call it 'mxs-dma
> > pio'.  In this mode, mxs-dma hardware can write values into mmc
> > controller register without cpu involved.
> what do you mean by values here?
> 
The register values that we want to write to mmc controller registers
in this case.

-- 
Regards,
Shawn
