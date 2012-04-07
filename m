Subject: Re: [PATCH] mxs-dma : assign the dma cookie before we enable the
 dma channel
From: Vinod Koul <vinod.koul@linux.intel.com>
To: Shawn Guo <shawn.guo@linaro.org>
In-Reply-To: <20120407081359.GT7264@S2101-09.ap.freescale.net>
References: <1333776575-3462-1-git-send-email-shijie8@gmail.com>
 <20120407081359.GT7264@S2101-09.ap.freescale.net>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 07 Apr 2012 22:06:02 +0530
Message-ID: <1333816562.31825.26.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: samgandhi9@gmail.com, linux@arm.linux.org.uk,
 Huang Shijie <shijie8@gmail.com>, w.sang@pengutronix.de,
 linux-mtd@lists.infradead.org, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2012-04-07 at 16:14 +0800, Shawn Guo wrote:
> On Sat, Apr 07, 2012 at 01:29:35AM -0400, Huang Shijie wrote:
> > The dma chain may finished very fast, so an interrupt may arises before
> > we assign the dma cookie. In this case, the mxs_dma_int_handler() may
> > hit the BUG_ON() in dma_cookie_complete().
> > 
> > So assign the dma cookie before we enable the dma channel.
> > 
> > Acked-by: Sam Gandhi <samgandhi9@gmail.com>
> > Signed-off-by: Huang Shijie <shijie8@gmail.com>
> 
> Acked-by: Shawn Guo <shawn.guo@linaor.org>
> 
> The mxs mmc and audio still works with the change.
> 
Thanks, I will apply this on 4/18.
I am away till then :-)

-- 
~Vinod
