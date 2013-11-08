Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VebjE-0000aU-SM
 for linux-mtd@lists.infradead.org; Fri, 08 Nov 2013 02:23:21 +0000
Message-ID: <527C4BBF.1060108@freescale.com>
Date: Fri, 8 Nov 2013 10:26:07 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: gpmi-lib: Make checkpatch happy
References: <1383874123-30125-1-git-send-email-festevam@gmail.com>
In-Reply-To: <1383874123-30125-1-git-send-email-festevam@gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA11=D4=C208=C8=D5 09:28, Fabio Estevam =D0=B4=B5=C0:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>
> Fix the following checkpatch warnings:
>
> WARNING: line over 80 characters
> #268: FILE: mtd/nand/gpmi-nand/gpmi-lib.c:268:
> +	* consecutive reboots. The latter case has not been seen on the MX23 =
yet,
>
> WARNING: space prohibited before semicolon
> #356: FILE: mtd/nand/gpmi-nand/gpmi-lib.c:356:
> +		(target.tRHOH_in_ns >=3D 0) ;
>
> WARNING: space prohibited before semicolon
> #1006: FILE: mtd/nand/gpmi-nand/gpmi-lib.c:1006:
> +		BF_GPMI_TIMING0_DATA_SETUP(hw.data_setup_in_cycles)       ;
>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/g=
pmi-nand/gpmi-lib.c
> index aaced29..c7a578c 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> @@ -265,8 +265,8 @@ int bch_set_geometry(struct gpmi_nand_data *this)
>  	* chip, otherwise it will lock up. So we skip resetting BCH on the MX=
23.
>  	* On the other hand, the MX28 needs the reset, because one case has b=
een
>  	* seen where the BCH produced ECC errors constantly after 10000
> -	* consecutive reboots. The latter case has not been seen on the MX23 =
yet,
> -	* still we don't know if it could happen there as well.
> +	* consecutive reboots. The latter case has not been seen on the MX23
> +	* yet, still we don't know if it could happen there as well.
>  	*/
>  	ret =3D gpmi_reset_block(r->bch_regs, GPMI_IS_MX23(this));
>  	if (ret)
> @@ -353,7 +353,7 @@ static int gpmi_nfc_compute_hardware_timing(struct =
gpmi_nand_data *this,
>  	improved_timing_is_available =3D
>  		(target.tREA_in_ns  >=3D 0) &&
>  		(target.tRLOH_in_ns >=3D 0) &&
> -		(target.tRHOH_in_ns >=3D 0) ;
> +		(target.tRHOH_in_ns >=3D 0);
> =20
>  	/* Inspect the clock. */
>  	nfc->clock_frequency_in_hz =3D clk_get_rate(r->clock[0]);
> @@ -1003,7 +1003,7 @@ void gpmi_begin(struct gpmi_nand_data *this)
>  	/* [1] Set HW_GPMI_TIMING0 */
>  	reg =3D BF_GPMI_TIMING0_ADDRESS_SETUP(hw.address_setup_in_cycles) |
>  		BF_GPMI_TIMING0_DATA_HOLD(hw.data_hold_in_cycles)         |
> -		BF_GPMI_TIMING0_DATA_SETUP(hw.data_setup_in_cycles)       ;
> +		BF_GPMI_TIMING0_DATA_SETUP(hw.data_setup_in_cycles);
> =20
>  	writel(reg, gpmi_regs + HW_GPMI_TIMING0);
> =20
Acked-by: Huang Shijie <b32955@freescale.com>
