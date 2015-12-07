MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Mon, 07 Dec 2015 14:42:25 -0800
From: Stefan Agner <stefan@agner.ch>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Daniel Mack
 <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Kukjin Kim <kgene@kernel.org>, Krzysztof
 Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ralf Baechle <ralf@linux-mips.org>,
 linux-mips@linux-mips.org, Josh Wu <josh.wu@atmel.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, Maxime Ripard
 <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@googlegroups.com, Kyungmin Park <kyungmin.park@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org,
 linux-kernel@vger.kernel.org, punnaiah choudary kalluri <punnaia@xilinx.com>
Subject: Re: [PATCH 09/23] mtd: nand: vf610: remove useless mtd->ecclayout
 assignment
In-Reply-To: <1449527178-5930-10-git-send-email-boris.brezillon@free-electrons.com>
References: <1449527178-5930-1-git-send-email-boris.brezillon@free-electrons.com>
 <1449527178-5930-10-git-send-email-boris.brezillon@free-electrons.com>
Message-ID: <97ccabe846d9410df0a28a2805b94a2e@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015-12-07 14:26, Boris Brezillon wrote:
> The NAND core layer is already taking care of ecclayout propagation. Remove
> this useless assignment.

Thx! I see, nand_scan_tail takes care of that...

Acked-by: Stefan Agner <stefan@agner.ch>

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/vf610_nfc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
> index 1c86c6b..0413e24 100644
> --- a/drivers/mtd/nand/vf610_nfc.c
> +++ b/drivers/mtd/nand/vf610_nfc.c
> @@ -794,8 +794,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
>  			goto error;
>  		}
>  
> -		/* propagate ecc.layout to mtd_info */
> -		mtd->ecclayout = chip->ecc.layout;
>  		chip->ecc.read_page = vf610_nfc_read_page;
>  		chip->ecc.write_page = vf610_nfc_write_page;
