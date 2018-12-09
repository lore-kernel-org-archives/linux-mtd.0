Subject: Re: [PATCH 0/3] spi-nor: Add Octal SPI support
To: Boris Brezillon <boris.brezillon@bootlin.com>, Marek Vasut
 <marek.vasut@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Brian Norris
 <computersforpeace@gmail.com>, Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20181003165603.2579-1-vigneshr@ti.com>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <0e4286ea-85d1-a909-17c0-47f9506b3e5a@ti.com>
Date: Sun, 9 Dec 2018 14:17:18 +0530
MIME-Version: 1.0
In-Reply-To: <20181003165603.2579-1-vigneshr@ti.com>
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

Hi Boris,

On 03/10/18 10:26 PM, Vignesh R wrote:
> This series adds support for octal mode of mt35x flash. Also, adds
> support for OSPI version of Cadence QSPI controller.
> 
> Based on top of patches adding basic support for mt35xu512aba here:
> https://patchwork.ozlabs.org/cover/971437/
> 
> Vignesh R (3):
>   mtd: spi-nor: Add Octal mode support for mt35xu512aba


>   dt-bindings: cadence-quadspi: Add new compatible for AM654 SoC
>   mtd: spi-nor: cadence-quadspi: Add support for Octal SPI controller

Could you consider above two patches for v4.21 once [1][2] are merged?

[1] https://patchwork.ozlabs.org/patch/1006717/
[2] https://patchwork.ozlabs.org/patch/1006715/

Let me know if this needs to be re-posted.

> 
>  .../devicetree/bindings/mtd/cadence-quadspi.txt       |  1 +
>  drivers/mtd/spi-nor/cadence-quadspi.c                 |  9 +++++++++
>  drivers/mtd/spi-nor/spi-nor.c                         | 11 ++++++++++-
>  include/linux/mtd/spi-nor.h                           |  2 ++
>  4 files changed, 22 insertions(+), 1 deletion(-)
> 

-- 
Regards
Vignesh
