Date: Wed, 11 Apr 2018 20:57:57 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>
Cc: <richard@nod.at>, linux-mediatek@lists.infradead.org,
 linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com
Subject: Re: [PATCH 5/8] mtd: rawnand: Modify ->calc_ecc_bytes() hook in
 nand_ecc_caps
Message-ID: <20180411205757.06495b7b@bbrezillon>
In-Reply-To: <1523418118-57686-6-git-send-email-xiaolei.li@mediatek.com>
References: <1523418118-57686-1-git-send-email-xiaolei.li@mediatek.com>
 <1523418118-57686-6-git-send-email-xiaolei.li@mediatek.com>
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

On Wed, 11 Apr 2018 11:41:55 +0800
Xiaolei Li <xiaolei.li@mediatek.com> wrote:

> Maybe some controllers need more information besides step size and ecc
> strength to calculate ECC bytes.
> 
> struct nand_ecc_ctrl provides lots of ECC control information include
> private ECC control data. So, add it into ->calc_ecc_bytes() interface,
> to make this hook be more flexible.

I'm not fond of this approach. Why don't you provide a different
function for the 2 cases you have (parity = 13 and parity = 14)? 

> 
> Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> ---
>  drivers/mtd/nand/raw/denali.c    |  3 +-
>  drivers/mtd/nand/raw/denali.h    |  2 +-
>  drivers/mtd/nand/raw/nand_base.c | 11 ++++--
>  include/linux/mtd/rawnand.h      | 77 ++++++++++++++++++++--------------------
>  4 files changed, 50 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> index 2a302a1..907609c 100644
> --- a/drivers/mtd/nand/raw/denali.c
> +++ b/drivers/mtd/nand/raw/denali.c
> @@ -1113,7 +1113,8 @@ static void denali_hw_init(struct denali_nand_info *denali)
>  	iowrite32(0xffff, denali->reg + SPARE_AREA_MARKER);
>  }
>  
> -int denali_calc_ecc_bytes(int step_size, int strength)
> +int denali_calc_ecc_bytes(struct nand_ecc_ctrl *ecc, int step_size,
> +			  int strength)
>  {
>  	/* BCH code.  Denali requires ecc.bytes to be multiple of 2 */
>  	return DIV_ROUND_UP(strength * fls(step_size * 8), 16) * 2;
> diff --git a/drivers/mtd/nand/raw/denali.h b/drivers/mtd/nand/raw/denali.h
> index 9ad33d2..644dffd 100644
> --- a/drivers/mtd/nand/raw/denali.h
> +++ b/drivers/mtd/nand/raw/denali.h
> @@ -328,7 +328,7 @@ struct denali_nand_info {
>  #define DENALI_CAP_HW_ECC_FIXUP			BIT(0)
>  #define DENALI_CAP_DMA_64BIT			BIT(1)
>  
> -int denali_calc_ecc_bytes(int step_size, int strength);
> +int denali_calc_ecc_bytes(struct nand_ecc_ctrl *, int, int);
>  int denali_init(struct denali_nand_info *denali);
>  void denali_remove(struct denali_nand_info *denali);
>  
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index d0b993f..e17abc8 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -6052,6 +6052,7 @@ int nand_check_ecc_caps(struct nand_chip *chip,
>  			const struct nand_ecc_caps *caps, int oobavail)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
>  	const struct nand_ecc_step_info *stepinfo;
>  	int preset_step = chip->ecc.size;
>  	int preset_strength = chip->ecc.strength;
> @@ -6076,7 +6077,7 @@ int nand_check_ecc_caps(struct nand_chip *chip,
>  			if (stepinfo->strengths[j] != preset_strength)
>  				continue;
>  
> -			ecc_bytes = caps->calc_ecc_bytes(preset_step,
> +			ecc_bytes = caps->calc_ecc_bytes(ecc, preset_step,
>  							 preset_strength);
>  			if (WARN_ON_ONCE(ecc_bytes < 0))
>  				return ecc_bytes;
> @@ -6114,6 +6115,7 @@ int nand_match_ecc_req(struct nand_chip *chip,
>  		       const struct nand_ecc_caps *caps, int oobavail)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
>  	const struct nand_ecc_step_info *stepinfo;
>  	int req_step = chip->ecc_step_ds;
>  	int req_strength = chip->ecc_strength_ds;
> @@ -6152,7 +6154,8 @@ int nand_match_ecc_req(struct nand_chip *chip,
>  
>  			nsteps = mtd->writesize / step_size;
>  
> -			ecc_bytes = caps->calc_ecc_bytes(step_size, strength);
> +			ecc_bytes = caps->calc_ecc_bytes(ecc, step_size,
> +							 strength);
>  			if (WARN_ON_ONCE(ecc_bytes < 0))
>  				continue;
>  			ecc_bytes_total = ecc_bytes * nsteps;
> @@ -6198,6 +6201,7 @@ int nand_maximize_ecc(struct nand_chip *chip,
>  		      const struct nand_ecc_caps *caps, int oobavail)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
>  	const struct nand_ecc_step_info *stepinfo;
>  	int step_size, strength, nsteps, ecc_bytes, corr;
>  	int best_corr = 0;
> @@ -6224,7 +6228,8 @@ int nand_maximize_ecc(struct nand_chip *chip,
>  
>  			nsteps = mtd->writesize / step_size;
>  
> -			ecc_bytes = caps->calc_ecc_bytes(step_size, strength);
> +			ecc_bytes = caps->calc_ecc_bytes(ecc, step_size,
> +							 strength);
>  			if (WARN_ON_ONCE(ecc_bytes < 0))
>  				continue;
>  
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 5dad59b..e7c7fdb 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -507,44 +507,6 @@ static inline void nand_hw_control_init(struct nand_hw_control *nfc)
>  }
>  
>  /**
> - * struct nand_ecc_step_info - ECC step information of ECC engine
> - * @stepsize: data bytes per ECC step
> - * @strengths: array of supported strengths
> - * @nstrengths: number of supported strengths
> - */
> -struct nand_ecc_step_info {
> -	int stepsize;
> -	const int *strengths;
> -	int nstrengths;
> -};
> -
> -/**
> - * struct nand_ecc_caps - capability of ECC engine
> - * @stepinfos: array of ECC step information
> - * @nstepinfos: number of ECC step information
> - * @calc_ecc_bytes: driver's hook to calculate ECC bytes per step
> - */
> -struct nand_ecc_caps {
> -	const struct nand_ecc_step_info *stepinfos;
> -	int nstepinfos;
> -	int (*calc_ecc_bytes)(int step_size, int strength);
> -};
> -
> -/* a shorthand to generate struct nand_ecc_caps with only one ECC stepsize */
> -#define NAND_ECC_CAPS_SINGLE(__name, __calc, __step, ...)	\
> -static const int __name##_strengths[] = { __VA_ARGS__ };	\
> -static const struct nand_ecc_step_info __name##_stepinfo = {	\
> -	.stepsize = __step,					\
> -	.strengths = __name##_strengths,			\
> -	.nstrengths = ARRAY_SIZE(__name##_strengths),		\
> -};								\
> -static const struct nand_ecc_caps __name = {			\
> -	.stepinfos = &__name##_stepinfo,			\
> -	.nstepinfos = 1,					\
> -	.calc_ecc_bytes = __calc,				\
> -}
> -
> -/**
>   * struct nand_ecc_ctrl - Control structure for ECC
>   * @mode:	ECC mode
>   * @algo:	ECC algorithm
> @@ -639,6 +601,45 @@ struct nand_ecc_ctrl {
>  };
>  
>  /**
> + * struct nand_ecc_step_info - ECC step information of ECC engine
> + * @stepsize: data bytes per ECC step
> + * @strengths: array of supported strengths
> + * @nstrengths: number of supported strengths
> + */
> +struct nand_ecc_step_info {
> +	int stepsize;
> +	const int *strengths;
> +	int nstrengths;
> +};
> +
> +/**
> + * struct nand_ecc_caps - capability of ECC engine
> + * @stepinfos: array of ECC step information
> + * @nstepinfos: number of ECC step information
> + * @calc_ecc_bytes: driver's hook to calculate ECC bytes per step
> + */
> +struct nand_ecc_caps {
> +	const struct nand_ecc_step_info *stepinfos;
> +	int nstepinfos;
> +	int (*calc_ecc_bytes)(struct nand_ecc_ctrl *ecc, int step_size,
> +			      int strength);
> +};
> +
> +/* a shorthand to generate struct nand_ecc_caps with only one ECC stepsize */
> +#define NAND_ECC_CAPS_SINGLE(__name, __calc, __step, ...)	\
> +static const int __name##_strengths[] = { __VA_ARGS__ };	\
> +static const struct nand_ecc_step_info __name##_stepinfo = {	\
> +	.stepsize = __step,					\
> +	.strengths = __name##_strengths,			\
> +	.nstrengths = ARRAY_SIZE(__name##_strengths),		\
> +};								\
> +static const struct nand_ecc_caps __name = {			\
> +	.stepinfos = &__name##_stepinfo,			\
> +	.nstepinfos = 1,					\
> +	.calc_ecc_bytes = __calc,				\
> +}
> +
> +/**
>   * struct nand_sdr_timings - SDR NAND chip timings
>   *
>   * This struct defines the timing requirements of a SDR NAND chip.
