Date: Thu, 18 Dec 2014 13:06:53 -0800
From: Tony Lindgren <tony@atomide.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: GPMC clock question
Message-ID: <20141218210653.GI23854@atomide.com>
References: <54933CC1.9010301@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54933CC1.9010301@vanguardiasur.com.ar>
Cc: linux-omap@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Guido =?utf-8?B?TWFydMOtbmV6?= <guido@vanguardiasur.com.ar>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> [141218 12:49]:
> Tony, Roger:
> 
> As far as I can see, the GPMC interface clock (GPMC_FCLK) is not
> properly modeled in the devicetree. Instead, hwmod magic seems to be used.

I guess you mean the functional clock not interface clock?
 
> arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c:
> struct omap_hwmod_ocp_if am33xx_l3_s__gpmc = {
>         .master         = &am33xx_l3_s_hwmod,
>         .slave          = &am33xx_gpmc_hwmod,
>         .clk            = "l3s_gclk",
>         .addr           = am33xx_gpmc_addr_space,
>         .user           = OCP_USER_MPU,
> };
> 
> I'd like to know what would be the appropriate DT model for this clock.
> Perhaps, as child of CORE_M4_CLK, divided by 2:
> 
> gpmc_fclk: gpmc_fclk {
>                 #clock-cells = <0>;
>                 compatible = "fixed-factor-clock";
>                 clocks = <&dpll_core_m4_ck>;
>                 clock-mult = <1>;
>                 clock-div = <2>;
>         };
> 
> How does it look? Also, I'm wondering if this works OK when used with
> the hwmod stuff.

Hmm we do have clocks or aliases for l3s_gclk, so it's there as otherwise
the GPMC would not work at all :) Sure with device tree only systems we
should have the clock phandle directly available though.

Note that the hwmod code takes care of runtime PM clock gating for the
drivers. But the clock entry for am33xx_l3_s__gpmc should be coming
from .dts. Please also check out the hwmod dts related changes Felipe
posted last week, that might allow populating .clk from .dts already.

Regards,

Tony
