Date: Fri, 11 Dec 2015 16:10:08 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Hartley
 Sweeten <hsweeten@visionengravers.com>, Ryan Mallon <rmallon@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Imre
 Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, Tony
 Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, Alexander Clouter
 <alex@digriz.org.uk>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Gregory CLEMENT
 <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Marek
 Vasut <marek.vasut@gmail.com>, Steven Miao <realmz6@gmail.com>, Mikael
 Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-cris-kernel@axis.com, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni
 <alexandre.belloni@free-electrons.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Maxim Levitsky
 <maximlevitsky@gmail.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof
 Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai
 <wens@csie.org>, linux-sunxi@googlegroups.com, Stefan Agner
 <stefan@agner.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org, Dinh Nguyen <dinguyen@altera.com>, Dan
 Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v5 01/58] mtd: nand: denali: add missing nand_release()
 call in denali_remove()
Message-ID: <20151211161008.056a0f47@bbrezillon>
In-Reply-To: <1449842554-29898-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1449734442-18672-2-git-send-email-boris.brezillon@free-electrons.com>
 <1449842554-29898-1-git-send-email-boris.brezillon@free-electrons.com>
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

+ Dinh (who made commit 2a0a288ec258)

Also added back the Fixes tag.

On Fri, 11 Dec 2015 15:02:34 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Unregister the NAND device from the NAND subsystem when removing a denali
> NAND controller, otherwise the MTD attached to the NAND device is still
> exposed by the MTD layer, and accesses to this device will likely crash
> the system.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Fixes: 2a0a288ec258 ("mtd: denali: split the generic driver and PCI layer")

> ---
> Changes since v4:
> - remove Cc stable and fixes tags
> - calculate the dma buffer size before calling nand_release()
> 
>  drivers/mtd/nand/denali.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 67eb2be..fdfea05 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1622,9 +1622,11 @@ EXPORT_SYMBOL(denali_init);
>  /* driver exit point */
>  void denali_remove(struct denali_nand_info *denali)
>  {
> +	int bufsize = denali->mtd.writesize + denali->mtd.oobsize;
> +
> +	nand_release(&denali->mtd);
>  	denali_irq_cleanup(denali->irq, denali);
> -	dma_unmap_single(denali->dev, denali->buf.dma_buf,
> -			 denali->mtd.writesize + denali->mtd.oobsize,
> +	dma_unmap_single(denali->dev, denali->buf.dma_buf, bufsize,
>  			 DMA_BIDIRECTIONAL);
>  }
>  EXPORT_SYMBOL(denali_remove);



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
