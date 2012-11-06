Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TVms2-0001uk-9C
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2012 17:23:27 +0000
Message-ID: <5099478A.50901@ti.com>
Date: Tue, 6 Nov 2012 11:23:22 -0600
From: Jon Hunter <jon-hunter@ti.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH 1/3] omap gpmc : add support of setting CYCLE2CYCLEDELAY
 and BUSTURNAROUND
References: <1352220277-4251-1-git-send-email-matthieu.castet@parrot.com>
In-Reply-To: <1352220277-4251-1-git-send-email-matthieu.castet@parrot.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 11/06/2012 10:44 AM, Matthieu CASTET wrote:
> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>

I think you need to have something in the changelog for the patch
describing why this change is needed and what device this has been
tested on.

> ---
>  arch/arm/mach-omap2/gpmc.c             |    7 ++++++-
>  arch/arm/plat-omap/include/plat/gpmc.h |    2 ++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
> index 8ab1e1b..3957ffc 100644
> --- a/arch/arm/mach-omap2/gpmc.c
> +++ b/arch/arm/mach-omap2/gpmc.c
> @@ -333,8 +333,13 @@ int gpmc_cs_set_timings(int cs, const struct gpmc_timings *t)
>  
>  	if (gpmc_capability & GPMC_HAS_WR_DATA_MUX_BUS)
>  		GPMC_SET_ONE(GPMC_CS_CONFIG6, 16, 19, wr_data_mux_bus);
> -	if (gpmc_capability & GPMC_HAS_WR_ACCESS)
> +	if (gpmc_capability & GPMC_HAS_WR_ACCESS) {
> +		/* XXX check on which hardware it is supported */

I understand that you may not have all the documentation but lets fix
this now.

> +		GPMC_SET_ONE(GPMC_CS_CONFIG6,  0,  3, busturnaround);
> +		GPMC_SET_ONE(GPMC_CS_CONFIG6,  8, 11, cycle2cycledelay);

Looking at the documentation for OMAP2420, OMAP3430, OMAP4430 and
OMAP5430, the above fields are present and same size location for all
OMAP devices. So this does not need to be done under the HAS_WR_ACCESS
field test. In fact, I believe that Afzal was going to add these fields
in a patch and was doing it for all devices [1].

>  		GPMC_SET_ONE(GPMC_CS_CONFIG6, 24, 28, wr_access);
> +	}
>  
>  	/* caller is expected to have initialized CONFIG1 to cover
>  	 * at least sync vs async
> diff --git a/arch/arm/plat-omap/include/plat/gpmc.h b/arch/arm/plat-omap/include/plat/gpmc.h
> index 2e6e259..34ca454 100644
> --- a/arch/arm/plat-omap/include/plat/gpmc.h
> +++ b/arch/arm/plat-omap/include/plat/gpmc.h
> @@ -131,6 +131,8 @@ struct gpmc_timings {
>  	/* The following are only on OMAP3430 */
>  	u16 wr_access;		/* WRACCESSTIME */
>  	u16 wr_data_mux_bus;	/* WRDATAONADMUXBUS */
> +	u16 cycle2cycledelay;	/* CYCLE2CYCLEDELAY */
> +	u16 busturnaround;		/* BUSTURNAROUND */

So you should be able to move these out of OMAP3430 specific as they are
generic.

Cheers
Jon

[1] http://marc.info/?l=linux-omap&m=134037095705900&w=2
