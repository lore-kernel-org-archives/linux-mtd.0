Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c3RZK-0001Ef-6q
 for linux-mtd@lists.infradead.org; Sun, 06 Nov 2016 17:49:23 +0000
Date: Sun, 6 Nov 2016 18:49:00 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Zach Brown <zach.brown@ni.com>
Cc: <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>,
 <dedekind1@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/5] mtd: nand: Add bb_per_die and blocks_per_die
 fields to nand_chip
Message-ID: <20161106184900.1c937981@bbrezillon>
In-Reply-To: <1478024190-13713-4-git-send-email-zach.brown@ni.com>
References: <1478024190-13713-1-git-send-email-zach.brown@ni.com>
 <1478024190-13713-4-git-send-email-zach.brown@ni.com>
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

On Tue, 1 Nov 2016 13:16:28 -0500
Zach Brown <zach.brown@ni.com> wrote:

> The fields bb_per_die and blocks_per_die are useful determining the
> number of bad blocks a MTD needs to allocate. How they are set will
> depend on if the chip is ONFI, JEDEC or a full-id entry in the nand_ids
> table.
> 
> Signed-off-by: Zach Brown <zach.brown@ni.com>
> ---
>  include/linux/mtd/nand.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index d8905a2..3093827 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -771,6 +771,9 @@ nand_get_sdr_timings(const struct nand_data_interface *conf)
>   *			supported, 0 otherwise.
>   * @jedec_params:	[INTERN] holds the JEDEC parameter page when JEDEC is
>   *			supported, 0 otherwise.
> + * @bb_per_die:	[INTERN] the max number of bad blocks each die of a
> + *			this nand device will encounter their life times.
> + * @blocks_per_die:	[INTERN] The number of PEBs in a die
>   * @read_retries:	[INTERN] the number of read retry modes supported
>   * @onfi_set_features:	[REPLACEABLE] set the features for ONFI nand
>   * @onfi_get_features:	[REPLACEABLE] get the features for ONFI nand
> @@ -853,6 +856,8 @@ struct nand_chip {
>  		struct nand_onfi_params	onfi_params;
>  		struct nand_jedec_params jedec_params;
>  	};
> +	u16  bb_per_die;

Why not max_bb_per_die?
And please put a single space between the type and the field name.

> +	u32  blocks_per_die;
>  
>  	struct nand_data_interface *data_interface;
>  
