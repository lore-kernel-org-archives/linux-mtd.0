Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ddX5E-0003iR-Fp
 for linux-mtd@lists.infradead.org; Fri, 04 Aug 2017 07:31:46 +0000
Date: Fri, 4 Aug 2017 09:31:23 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr, narmstrong@baylibre.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] Handle clk_prepare_enable/clk_disable_unprepare.
Message-ID: <20170804093123.48e49db1@bbrezillon>
In-Reply-To: <1501587309-20900-1-git-send-email-arvind.yadav.cs@gmail.com>
References: <1501587309-20900-1-git-send-email-arvind.yadav.cs@gmail.com>
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

On Tue,  1 Aug 2017 17:05:08 +0530
Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:

> clk_prepare_enable() can fail here and we must check its return value.
> *_probe() can fail here and we must disable clock.
> 
> Arvind Yadav (6):
>   [PATCH 1/6] mtd: nand: denali: Handle return value of clk_prepare_enable.
>   [PATCH 2/6] mtd: oxnas_nand: Handle clk_prepare_enable/clk_disable_unprepare.
>   [PATCH 3/6] mtd: nand: lpc32xx_slc: Handle return value of clk_prepare_enable.
>   [PATCH 4/6] mtd: nand: vf610_nfc: Handle return value of clk_prepare_enable.
>   [PATCH 5/6] mtd: nand: lpc32xx_mlc: Handle return value of clk_prepare_enable.
>   [PATCH 6/6] mtd: st_spi_fsm: Handle clk_prepare_enable/clk_disable_unprepare.

Applied everything except patch 4.

Thanks,

Boris

> 
>  drivers/mtd/devices/st_spi_fsm.c | 20 ++++++++++++--------
>  drivers/mtd/nand/denali_dt.c     |  4 +++-
>  drivers/mtd/nand/lpc32xx_mlc.c   |  9 +++++++--
>  drivers/mtd/nand/lpc32xx_slc.c   |  9 +++++++--
>  drivers/mtd/nand/oxnas_nand.c    | 25 ++++++++++++++++++-------
>  drivers/mtd/nand/vf610_nfc.c     |  5 ++++-
>  6 files changed, 51 insertions(+), 21 deletions(-)
> 
