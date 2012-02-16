Date: Wed, 15 Feb 2012 18:12:23 -0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v5 2/2] mxs-dma : rewrite the last parameter of
 mxs_dma_prep_slave_sg()
Message-ID: <20120216021223.GF30946@r65073-Latitude-D630>
References: <1329110756-14434-1-git-send-email-b32955@freescale.com>
 <1329110756-14434-3-git-send-email-b32955@freescale.com>
 <20120215195552.GB2399@r65073-Latitude-D630>
 <4F3C6466.9000500@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F3C6466.9000500@freescale.com>
Cc: alsa-devel@alsa-project.org, cjb@laptop.org, vinod.koul@intel.com,
 broonie@opensource.wolfsonmicro.com, linux-mmc@vger.kernel.org,
 w.sang@pengutronix.de, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, artem.bityutskiy@intel.com, lrg@ti.com,
 linux-arm-kernel@lists.infradead.org, LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 16, 2012 at 10:05:26AM +0800, Huang Shijie wrote:
> Hi Shawn:
> >I'm trying to give it a test.  But it does not apply on either mainline
> >or next tree.  You probably had a wrong base for this patch.
> >
> thanks for your work.
> 
> As the previous email said, this patch set bases on :[PATCH v2]
> mtd/gpmi : add gpmi support for mx6q.
> 
Then you are doing something wrong.  This series should be based on
mainline, and then you add imx6q support on top of this series.

-- 
Regards,
Shawn
