Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEAxf-0002cT-MD
 for linux-mtd@lists.infradead.org; Thu, 03 May 2018 09:55:42 +0000
Date: Thu, 3 May 2018 11:55:27 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Arushi Singhal <arushisinghal19971997@gmail.com>
Cc: boris.brezillon@free-electrons.com, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: nand: do not initialise statics to 0 or NULL
Message-ID: <20180503115527.35b2b2ae@bbrezillon>
In-Reply-To: <20180324101727.GA748@seema-Inspiron-15-3567>
References: <20180324101727.GA748@seema-Inspiron-15-3567>
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

Hi Arushi,

On Sat, 24 Mar 2018 15:47:27 +0530
Arushi Singhal <arushisinghal19971997@gmail.com> wrote:

> This patch fixes the checkpatch.pl error to ams-delta.c.
> ERROR: do not initialise statics to 0 or NULL

Can you rebase on top of nand/next [1] and use
"mtd: rawnand: ams-delta: " for the subject prefix?

Thanks,

Boris

[1]http://git.infradead.org/linux-mtd.git/shortlog/refs/heads/nand/next

> 
> Signed-off-by: Arushi Singhal <arushisinghal19971997@gmail.com>
> ---
>  drivers/mtd/nand/ams-delta.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/ams-delta.c
> index 6e7f6e0..8e89452 100644
> --- a/drivers/mtd/nand/ams-delta.c
> +++ b/drivers/mtd/nand/ams-delta.c
> @@ -35,7 +35,7 @@
>  /*
>   * MTD structure for E3 (Delta)
>   */
> -static struct mtd_info *ams_delta_mtd = NULL;
> +static struct mtd_info *ams_delta_mtd;
>  
>  /*
>   * Define partitions for flash devices
