Date: Tue, 26 Apr 2016 19:30:02 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Han Xu <han.xu@nxp.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Huang Shijie
 <shijie.huang@intel.com>, Fabio Estevam <fabio.estevam@freescale.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, Stefan Christ <s.christ@phytec.de>
Subject: Re: [PATCH v2] gpmi-nand: Handle ECC Errors in erased pages
Message-ID: <20160426193002.187aefc2@bbrezillon>
In-Reply-To: <1461587712-16403-1-git-send-email-mpa@pengutronix.de>
References: <1461587712-16403-1-git-send-email-mpa@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 25 Apr 2016 14:35:12 +0200
Markus Pargmann <mpa@pengutronix.de> wrote:

> ECC is only calculated for written pages. As erased pages are not
> actively written the ECC is always invalid. For this purpose the
> Hardware BCH unit is able to check for erased pages and does not raise
> an ECC error in this case. This behaviour can be influenced using the
> BCH_MODE register which sets the number of allowed bitflips in an erased
> page. Unfortunately the unit is not capable of fixing the bitflips in
> memory.
> 
> To avoid complete software checks for erased pages, we can simply check
> buffers with uncorrectable ECC errors because we know that any erased
> page with errors is uncorrectable by the BCH unit.
> 
> This patch adds the generic nand_check_erased_ecc_chunk() to gpmi-nand
> to correct erased pages. To have the valid data in the buffer before
> using them, this patch moves the read_page_swap_end() call before the
> ECC status checking for-loop.
> 
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> [Squashed patches by Stefan and Boris to check ECC area]
> Cc: Stefan Christ <s.christ@phytec.de>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> ---

Applied, thanks.

Boris
-- 
Boris Brezillon, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
