Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7mqw-0000hf-DN
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 19:30:36 +0000
Date: Wed, 3 Oct 2018 21:30:12 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Cc: <miquel.raynal@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>, michals@xilinx.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 nagasuresh12@gmail.com
Subject: Re: [LINUX PATCH v11 2/3] mtd: rawnand: Add an option to get sdr
 timing mode number
Message-ID: <20181003213012.021cebed@bbrezillon>
In-Reply-To: <1537878031-22253-3-git-send-email-naga.sureshkumar.relli@xilinx.com>
References: <1537878031-22253-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1537878031-22253-3-git-send-email-naga.sureshkumar.relli@xilinx.com>
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

On Tue, 25 Sep 2018 17:50:30 +0530
Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:

> Some NAND controllers needs sdr timing mode value, instead of

			^need SDR

> timings parameters. i.e the NAND controller will change its operating

	  s/parameters//

> mode by just configuring the sdr timing mode number. so add mode parameter

							^ So, add a mode field 

> in struct nand_sdr_timings.

  ^ to ...

> 
> Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> ---
> Changes in v11:
>  - None
> ---
>  drivers/mtd/nand/raw/nand_timings.c | 6 ++++++
>  include/linux/mtd/rawnand.h         | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
> index ebc7b5f..1ec7a28 100644
> --- a/drivers/mtd/nand/raw/nand_timings.c
> +++ b/drivers/mtd/nand/raw/nand_timings.c
> @@ -56,6 +56,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
>  			.tWHR_min = 120000,
>  			.tWP_min = 50000,
>  			.tWW_min = 100000,
> +			.mode = 0,
>  		},
>  	},
>  	/* Mode 1 */
> @@ -98,6 +99,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
>  			.tWHR_min = 80000,
>  			.tWP_min = 25000,
>  			.tWW_min = 100000,
> +			.mode = 1,
>  		},
>  	},
>  	/* Mode 2 */
> @@ -140,6 +142,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
>  			.tWHR_min = 80000,
>  			.tWP_min = 17000,
>  			.tWW_min = 100000,
> +			.mode = 2,
>  		},
>  	},
>  	/* Mode 3 */
> @@ -182,6 +185,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
>  			.tWHR_min = 80000,
>  			.tWP_min = 15000,
>  			.tWW_min = 100000,
> +			.mode = 3,
>  		},
>  	},
>  	/* Mode 4 */
> @@ -224,6 +228,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
>  			.tWHR_min = 80000,
>  			.tWP_min = 12000,
>  			.tWW_min = 100000,
> +			.mode = 4,
>  		},
>  	},
>  	/* Mode 5 */
> @@ -266,6 +271,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
>  			.tWHR_min = 80000,
>  			.tWP_min = 10000,
>  			.tWW_min = 100000,
> +			.mode = 5,
>  		},
>  	},
>  };
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index efb2345..3bf2cea 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -723,6 +723,7 @@ struct nand_ecc_ctrl {
>   * @tWHR_min: WE# high to RE# low
>   * @tWP_min: WE# pulse width
>   * @tWW_min: WP# transition to WE# low
> + * @mode: sdr timing mode value

      @mode: ONFI timing mode

>   */
>  struct nand_sdr_timings {
>  	u64 tBERS_max;
> @@ -763,6 +764,7 @@ struct nand_sdr_timings {
>  	u32 tWHR_min;
>  	u32 tWP_min;
>  	u32 tWW_min;
> +	u8 mode;
>  };
>  
>  /**

With this addressed, you can add

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
