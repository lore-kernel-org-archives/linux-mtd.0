Date: Tue, 6 Sep 2016 13:21:18 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] mtd: nand: Introduce nand_data_interface
Message-ID: <20160906132118.17e2e8f8@bbrezillon>
In-Reply-To: <1473158355-22451-3-git-send-email-s.hauer@pengutronix.de>
References: <1473158355-22451-1-git-send-email-s.hauer@pengutronix.de>
 <1473158355-22451-3-git-send-email-s.hauer@pengutronix.de>
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

On Tue,  6 Sep 2016 12:39:10 +0200
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> Currently we have no data structure to fully describe a NAND timing.
> We only have struct nand_sdr_timings for NAND timings in SDR mode,
> but nothing for DDR mode and also no container to store both types
> of timing.
> This patch adds struct nand_data_interface which stores the timing
> type and a union of different timings. This can be used to pass to
> drivers in order to configure the timing.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  include/linux/mtd/nand.h | 109 ++++++++++++++++++++++++++---------------------
>  1 file changed, 60 insertions(+), 49 deletions(-)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 9af9575..19c73ef 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -568,6 +568,66 @@ struct nand_buffers {
>  	uint8_t *databuf;
>  };
>  
> +/*
> + * struct nand_sdr_timings - SDR NAND chip timings
> + *
> + * This struct defines the timing requirements of a SDR NAND chip.
> + * These information can be found in every NAND datasheets and the timings
> + * meaning are described in the ONFI specifications:
> + * www.onfi.org/~/media/ONFI/specs/onfi_3_1_spec.pdf (chapter 4.15 Timing
> + * Parameters)
> + *
> + * All these timings are expressed in picoseconds.
> + */
> +
> +struct nand_sdr_timings {
> +	u32 tALH_min;
> +	u32 tADL_min;
> +	u32 tALS_min;
> +	u32 tAR_min;
> +	u32 tCEA_max;
> +	u32 tCEH_min;
> +	u32 tCH_min;
> +	u32 tCHZ_max;
> +	u32 tCLH_min;
> +	u32 tCLR_min;
> +	u32 tCLS_min;
> +	u32 tCOH_min;
> +	u32 tCS_min;
> +	u32 tDH_min;
> +	u32 tDS_min;
> +	u32 tFEAT_max;
> +	u32 tIR_min;
> +	u32 tITC_max;
> +	u32 tRC_min;
> +	u32 tREA_max;
> +	u32 tREH_min;
> +	u32 tRHOH_min;
> +	u32 tRHW_min;
> +	u32 tRHZ_max;
> +	u32 tRLOH_min;
> +	u32 tRP_min;
> +	u32 tRR_min;
> +	u64 tRST_max;
> +	u32 tWB_max;
> +	u32 tWC_min;
> +	u32 tWH_min;
> +	u32 tWHR_min;
> +	u32 tWP_min;
> +	u32 tWW_min;
> +};
> +
> +enum nand_data_interface_type {
> +	NAND_SDR_IFACE,
> +};
> +

I know this is my code, and I'm the one to blame here, but can you
document the nand_data_interface fields (kerneldoc format)?

> +struct nand_data_interface {
> +	enum nand_data_interface_type type;
> +	union {
> +		struct nand_sdr_timings sdr;
> +	} timings;
> +};
> +
>  /**
>   * struct nand_chip - NAND Private Flash Chip Data
>   * @mtd:		MTD device registered to the MTD framework
> @@ -1026,55 +1086,6 @@ static inline int jedec_feature(struct nand_chip *chip)
>  		: 0;
>  }
>  
> -/*
> - * struct nand_sdr_timings - SDR NAND chip timings
> - *
> - * This struct defines the timing requirements of a SDR NAND chip.
> - * These informations can be found in every NAND datasheets and the timings
> - * meaning are described in the ONFI specifications:
> - * www.onfi.org/~/media/ONFI/specs/onfi_3_1_spec.pdf (chapter 4.15 Timing
> - * Parameters)
> - *
> - * All these timings are expressed in picoseconds.
> - */
> -
> -struct nand_sdr_timings {
> -	u32 tALH_min;
> -	u32 tADL_min;
> -	u32 tALS_min;
> -	u32 tAR_min;
> -	u32 tCEA_max;
> -	u32 tCEH_min;
> -	u32 tCH_min;
> -	u32 tCHZ_max;
> -	u32 tCLH_min;
> -	u32 tCLR_min;
> -	u32 tCLS_min;
> -	u32 tCOH_min;
> -	u32 tCS_min;
> -	u32 tDH_min;
> -	u32 tDS_min;
> -	u32 tFEAT_max;
> -	u32 tIR_min;
> -	u32 tITC_max;
> -	u32 tRC_min;
> -	u32 tREA_max;
> -	u32 tREH_min;
> -	u32 tRHOH_min;
> -	u32 tRHW_min;
> -	u32 tRHZ_max;
> -	u32 tRLOH_min;
> -	u32 tRP_min;
> -	u32 tRR_min;
> -	u64 tRST_max;
> -	u32 tWB_max;
> -	u32 tWC_min;
> -	u32 tWH_min;
> -	u32 tWHR_min;
> -	u32 tWP_min;
> -	u32 tWW_min;
> -};
> -
>  /* get timing characteristics from ONFI timing mode. */
>  const struct nand_sdr_timings *onfi_async_timing_mode_to_sdr_timings(int mode);
>  
