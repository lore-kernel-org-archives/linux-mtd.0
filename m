Date: Fri, 4 Jan 2019 19:14:15 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Maxime
 Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: sunxi: Use struct_size() in devm_kzalloc()
Message-ID: <20190104191415.126e4a07@bbrezillon>
In-Reply-To: <20190104172637.GA28084@embeddedor>
References: <20190104172637.GA28084@embeddedor>
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

Hi Gustavo,

On Fri, 4 Jan 2019 11:26:37 -0600
"Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote:

> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array. For example:
> 
> struct foo {
>     int stuff;
>     void *entry[];
> };
> 
> instance = devm_kzalloc(dev, sizeof(struct foo) + sizeof(void *) * count, GFP_KERNEL);
> 
> Instead of leaving these open-coded and prone to type mistakes, we can
> now use the new struct_size() helper:
> 
> instance = devm_kzalloc(dev, struct_size(instance, entry, count), GFP_KERNEL);
> 
> This code was detected with the help of Coccinelle.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> index e828ee50a201..f66fffe663bf 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -1870,10 +1870,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
>  		return -EINVAL;
>  	}
>  
> -	chip = devm_kzalloc(dev,
> -			    sizeof(*chip) +
> -			    (nsels * sizeof(struct sunxi_nand_chip_sel)),
> -			    GFP_KERNEL);
> +	chip = devm_kzalloc(dev, struct_size(chip, sels, nsels), GFP_KERNEL);
>  	if (!chip) {
>  		dev_err(dev, "could not allocate chip\n");
>  		return -ENOMEM;

I posted the same patch a few days back [1].

[1]http://patchwork.ozlabs.org/patch/1013855/
