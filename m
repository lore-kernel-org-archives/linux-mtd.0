Subject: Re: [PATCH 04/23] mtd: nand: s3c2410: kill the ->ecc_layout field
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
References: <1449527178-5930-1-git-send-email-boris.brezillon@free-electrons.com>
 <1449527178-5930-5-git-send-email-boris.brezillon@free-electrons.com>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Kukjin Kim <kgene@kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 Josh Wu <josh.wu@atmel.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Stefan Agner <stefan@agner.ch>, Kyungmin Park <kyungmin.park@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org,
 linux-kernel@vger.kernel.org, punnaiah choudary kalluri <punnaia@xilinx.com>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <56662696.1000705@samsung.com>
Date: Tue, 08 Dec 2015 09:38:46 +0900
MIME-version: 1.0
In-reply-to: <1449527178-5930-5-git-send-email-boris.brezillon@free-electrons.com>
Content-type: text/plain; charset=windows-1252
Content-transfer-encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08.12.2015 07:25, Boris Brezillon wrote:
> The s3c2410 is allowing board data to overload the default ECC layout
> defined inside the driver, but this feature is not used by board
> specific definitions.
> Kill this field so that we can easily move to a model where ecclayout
> are dynamically allocated by the NAND controller driver.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  arch/arm/plat-samsung/devs.c                   | 9 ---------
>  drivers/mtd/nand/s3c2410.c                     | 3 ---
>  include/linux/platform_data/mtd-nand-s3c2410.h | 1 -
>  3 files changed, 13 deletions(-)

Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
