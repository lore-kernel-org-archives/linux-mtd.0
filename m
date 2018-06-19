Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fV9OA-0002YB-DA
 for linux-mtd@lists.infradead.org; Tue, 19 Jun 2018 05:41:11 +0000
Date: Tue, 19 Jun 2018 07:40:56 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: miquel.raynal@bootlin.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek
 Vasut <marek.vasut@gmail.com>
Subject: Re: [RFC PATCH v2 5/6] mtd: rawnand: micron: add
 ONFI_FEATURE_ON_DIE_ECC to supported features
Message-ID: <20180619074056.420d5560@bbrezillon>
In-Reply-To: <20180619053125.16792-6-chris.packham@alliedtelesis.co.nz>
References: <20180619053125.16792-1-chris.packham@alliedtelesis.co.nz>
 <20180619053125.16792-6-chris.packham@alliedtelesis.co.nz>
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

On Tue, 19 Jun 2018 17:31:24 +1200
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> Add ONFI_FEATURE_ON_DIE_ECC to the set/get features list for Micron
> NAND flash.
>

Fixes: 789157e41a06 ("mtd: rawnand: allow vendors to declare (un)supported features")
Cc: <stable@vger.kernel.org>

No need to send a new version, I'll add that when queuing the patch.

Miquel, if you're okay, I'm gonna take this patch in the mtd/fixes branch
and let you deal with other patches in this series.

> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> Changes in v2:
> - New
> 
>  drivers/mtd/nand/raw/nand_micron.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
> index e582c9e61715..d1e8f57544a0 100644
> --- a/drivers/mtd/nand/raw/nand_micron.c
> +++ b/drivers/mtd/nand/raw/nand_micron.c
> @@ -66,7 +66,9 @@ static int micron_nand_onfi_init(struct nand_chip *chip)
>  
>  	if (p->supports_set_get_features) {
>  		set_bit(ONFI_FEATURE_ADDR_READ_RETRY, p->set_feature_list);
> +		set_bit(ONFI_FEATURE_ON_DIE_ECC, p->set_feature_list);
>  		set_bit(ONFI_FEATURE_ADDR_READ_RETRY, p->get_feature_list);
> +		set_bit(ONFI_FEATURE_ON_DIE_ECC, p->get_feature_list);
>  	}
>  
>  	return 0;
