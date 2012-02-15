Date: Wed, 15 Feb 2012 11:56:28 -0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v5 1/2] mxs-dma : move the mxs dma.h to a more common place
Message-ID: <20120215195627.GC2399@r65073-Latitude-D630>
References: <1329110756-14434-1-git-send-email-b32955@freescale.com>
 <1329110756-14434-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1329110756-14434-2-git-send-email-b32955@freescale.com>
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

On Mon, Feb 13, 2012 at 01:25:55PM +0800, Huang Shijie wrote:
> Move the header to a more common place.
> The mxs dma engine is not only used in mx23/mx28, but also used
> in mx50/mx6q.  It will also be used in the future chips.
> 
> Rename it to mxs-dma.h, and create a new folder include/linux/fsl/ to
> store the Freescale's header files.
> 
> change mxs-dma driver, mxs-mmc driver, gpmi-nand driver, mxs-saif driver
> to the new header file.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Acked-by: Shawn Guo <shawn.guo@linaro.org>
