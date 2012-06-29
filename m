Message-ID: <4FED42A8.40301@freescale.com>
Date: Fri, 29 Jun 2012 13:52:40 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 3/3] mtd: gpmi: change the code for clocks
References: <1340941925-14591-1-git-send-email-shijie8@gmail.com>
 <1340941925-14591-3-git-send-email-shijie8@gmail.com>
 <20120629020650.GB28932@S2101-09.ap.freescale.net>
In-Reply-To: <20120629020650.GB28932@S2101-09.ap.freescale.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>,
 linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B406=E6=9C=8829=E6=97=A5 10:06, Shawn Guo =E5=86=99=E9=
=81=93:
>>   		gpmi_regs + HW_GPMI_TIMING1);
>> > =20
>> >    	/* Get the timing information we need. */
>> >  -	nfc->clock_frequency_in_hz =3D clk_get_rate(r->clock);
>> >  +	nfc->clock_frequency_in_hz =3D clk_get_rate(r->clock[0]);
>> >    	clock_period_in_ns =3D 1000000000 / nfc->clock_frequency_in_hz;
>> > =20
>> >    	gpmi_nfc_compute_hardware_timing(this,&hw);
>> >  @@ -784,8 +812,7 @@ err_out:
>> > =20
>> >    void gpmi_end(struct gpmi_nand_data *this)
>> >    {
>> >  -	struct resources *r =3D&this->resources;
>> >  -	clk_disable_unprepare(r->clock);
>> >  +	gpmi_disable_clk(this);
>> >    }
>> > =20
>> >    /* Clears a BCH interrupt. */
>> >  diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/n=
and/gpmi-nand/gpmi-nand.c
>> >  index 941cfb7..edda3b1 100644
>> >  --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> >  +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> >  @@ -464,9 +464,59 @@ acquire_err:
>> >    	return -EINVAL;
>> >    }
>> > =20
>> >  +static void gpmi_put_clks(struct gpmi_nand_data *this)
>> >  +{
>> >  +	struct resources *r =3D&this->resources;
>> >  +	struct clk *clk;
>> >  +	int i;
>> >  +
>> >  +	for (i =3D 0; i<  GPMI_CLK_MAX; i++) {
>> >  +		clk =3D r->clock[i];
>> >  +		if (clk) {
>> >  +			clk_put(clk);
>> >  +			r->clock[i] =3D NULL;
>> >  +		}
>> >  +	}
>> >  +}
>> >  +
>> >  +static char *extra_clks_for_mx6q[] =3D {
>> >  +	"gpmi_apb", "gpmi_bch", "gpmi_bch_apb", "per1_bch",
>> >  +};
>> >  +
>> >  +static int __devinit gpmi_get_clks(struct gpmi_nand_data *this)
>> >  +{
>> >  +	struct resources *r =3D&this->resources;
>> >  +	char **extra_clks =3D NULL;
>> >  +	struct clk *clk;
>> >  +	int i;
>> >  +
>> >  +	r->clock[0] =3D clk_get(&this->pdev->dev, NULL);
>> >  +	if (IS_ERR(r->clock[0]))
>> >  +		goto err_clock;
>> >  +
>> >  +	/* Get extra clocks */
>> >  +	if (GPMI_IS_MX6Q(this))
>> >  +		extra_clks =3D extra_clks_for_mx6q;
> We probably do not need this tweaking.  We can have the driver always
> take all those 5 clocks, and I think the current imx28 clock driver
> can just work with it, because the gpmi-nand clkdev lookup has NULL
> con_id and all those 5 clocks can match the same one on imx28.
>
I think your method makes the code hard to understand.
My code is more clear in logic.

thanks
Huang Shijie
