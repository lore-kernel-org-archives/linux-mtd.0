Subject: Re: [PATCH v4 0/6] K2G: Add QSPI support
To: Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>,
 Rob Herring <robh+dt@kernel.org>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20171003051925.8821-1-vigneshr@ti.com>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <09cc0a61-3f73-4a10-2d67-32515a7da861@ti.com>
Date: Mon, 16 Oct 2017 11:45:49 +0530
MIME-Version: 1.0
In-Reply-To: <20171003051925.8821-1-vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Tuesday 03 October 2017 10:49 AM, Vignesh R wrote:
> 
> 
> This series adds support for Cadence QSPI IP present in TI's 66AK2G SoC.
> The patches enhance the existing cadence-quadspi driver to support
> loopback clock circuit, pm_runtime support and tweaks for 66AK2G SoC.

Gentle ping on the series...

> 
> Change log:
> 
> v4:
> * New patch to fix error handling sequence in probe.
> 
> v3:
> * Fix build warnings reported by kbuild test bot.
> 
> Resend:
> * Rebase to latest linux-next.
> * Collect Acked-bys
> 
> v2:
> * Drop DT patches. Will be sent as separate series as requested by
>  maintainer.
> * Split binding docs into separate patches.
> * Address comments by Rob Herring.
> 
> Vignesh R (6):
>   mtd: spi-nor: cadence-quadspi: Add TI 66AK2G SoC specific compatible
>   mtd: spi-nor: cadence-quadspi: add a delay in write sequence
>   mtd: spi-nor: cadence-quadspi: Add new binding to enable loop-back
>     circuit
>   mtd: spi-nor: cadence-quadspi: Add support to enable loop-back clock
>     circuit
>   mtd: spi-nor: cadence-quadspi: Fix error path in probe
>   mtd: spi-nor: cadence-quadspi: Add runtime PM support
> 
>  .../devicetree/bindings/mtd/cadence-quadspi.txt    |  7 ++-
>  drivers/mtd/spi-nor/cadence-quadspi.c              | 55 +++++++++++++++++++---
>  2 files changed, 55 insertions(+), 7 deletions(-)
> 

-- 
Regards
Vignesh
