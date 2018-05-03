Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEDxV-00041l-PV
 for linux-mtd@lists.infradead.org; Thu, 03 May 2018 13:07:43 +0000
Date: Thu, 3 May 2018 15:07:15 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: add default values for dynamic timings
Message-ID: <20180503150715.656ae787@bbrezillon>
In-Reply-To: <20180503121620.13450-1-miquel.raynal@bootlin.com>
References: <20180503121620.13450-1-miquel.raynal@bootlin.com>
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

Hi Miquel,

On Thu,  3 May 2018 14:16:20 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Some timings like tBERS (block erase time), tCCs (change column setup
> time), tPROG (page program time) and tR (page read time) are derived
> from the ONFI parameter page. They are set in the SDR interface only
> under certain circumstances: the chip is ONFI compliant and
> ->setup_data_interface() is populated.

The later is not true, is it? It seems that we use timing mode 0 even
for setup where ->setup_data_interface() is not implemented [1].

> 
> The former makes the use of these timings unreliable if the driver uses
> one of these four values with a non-ONFI chip, while the latter is a
> problem for drivers not populating ->setup_data_interface() hook but
> using these delays nonetheless in the code.
> 
> Fix this situation by taking the highest possible value for each
> timing (stored as unsigned 16-bit entries in the parameter page).
> 
> This makes tBERS, tPROG and tR maximum times being ~65ms while typical
> values are at most a few milliseconds. As these are timeouts, it is not
> impacting at all on the performances in nominal use.
> 
> tCCS minimum time (delay to wait after a change column) becomes ~65us
> while typical values are a few hundred nanoseconds. This might have an
> impact depending on the driver's implementation.

I think we should do things differently for tCCS and tR. The ONFI spec
says:

"
For execution of the first Read Parameter Page command, prior to
complete initialization, a tR value of 200 microseconds and tCCS value
of 500 ns shall be used. For page reads, including execution of
additional Read Parameter Page commands after initialization is
complete, the value for tR and tCCS contained in the parameter page
shall be used.
"

So tR = 200us and tCCS = 500ns sound like better default values for non
ONFI chips.

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_timings.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
> index 7c4e4a371bbc..848446f8004c 100644
> --- a/drivers/mtd/nand/raw/nand_timings.c
> +++ b/drivers/mtd/nand/raw/nand_timings.c
> @@ -13,6 +13,8 @@
>  #include <linux/export.h>
>  #include <linux/mtd/rawnand.h>
>  
> +#define ONFI_DYN_TIMING_MAX U16_MAX
> +
>  static const struct nand_data_interface onfi_sdr_timings[] = {
>  	/* Mode 0 */
>  	{
> @@ -24,6 +26,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
>  			.tALH_min = 20000,
>  			.tALS_min = 50000,
>  			.tAR_min = 25000,
> +			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
> +			.tCCS_min = 1000UL * ONFI_DYN_TIMING_MAX,
>  			.tCEA_max = 100000,
>  			.tCEH_min = 20000,
>  			.tCH_min = 20000,
> @@ -38,6 +42,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
>  			.tFEAT_max = 1000000,
>  			.tIR_min = 10000,
>  			.tITC_max = 1000000,
> +			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
> +			.tR_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
>  			.tRC_min = 100000,
>  			.tREA_max = 40000,
>  			.tREH_min = 30000,
> @@ -66,6 +72,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
>  			.tALH_min = 10000,
>  			.tALS_min = 25000,
>  			.tAR_min = 10000,
> +			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
> +			.tCCS_min = 1000UL * ONFI_DYN_TIMING_MAX,
>  			.tCEA_max = 45000,
>  			.tCEH_min = 20000,
>  			.tCH_min = 10000,
> @@ -80,6 +88,8 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
>  			.tFEAT_max = 1000000,
>  			.tIR_min = 0,
>  			.tITC_max = 1000000,
> +			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
> +			.tR_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
>  			.tRC_min = 50000,
>  			.tREA_max = 30000,
>  			.tREH_min = 15000,

Instead of adding those definitions for each mode, maybe you can add
an 'else' statement in the code to fill those fields with the
default/max values when the NAND is not ONFI.

Regards,

Boris

[1]https://elixir.bootlin.com/linux/v4.17-rc3/source/drivers/mtd/nand/raw/nand_base.c#L5867
