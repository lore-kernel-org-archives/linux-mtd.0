Received: from mail-qa0-f49.google.com ([209.85.216.49])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1kUW-0001dS-L8
 for linux-mtd@lists.infradead.org; Thu, 18 Dec 2014 23:28:21 +0000
Received: by mail-qa0-f49.google.com with SMTP id s7so1534748qap.36
 for <linux-mtd@lists.infradead.org>; Thu, 18 Dec 2014 15:27:58 -0800 (PST)
Message-ID: <54936290.3090500@vanguardiasur.com.ar>
Date: Thu, 18 Dec 2014 20:26:08 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Tony Lindgren <tony@atomide.com>
Subject: Re: GPMC clock question
References: <54933CC1.9010301@vanguardiasur.com.ar>
 <20141218210653.GI23854@atomide.com>
In-Reply-To: <20141218210653.GI23854@atomide.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-omap@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?windows-1252?Q?Guido_Mart=EDnez?= <guido@vanguardiasur.com.ar>,
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



On 12/18/2014 06:06 PM, Tony Lindgren wrote:
> * Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> [141218 12:49]:
>> Tony, Roger:
>>
>> As far as I can see, the GPMC interface clock (GPMC_FCLK) is not
>> properly modeled in the devicetree. Instead, hwmod magic seems to be used.
> 
> I guess you mean the functional clock not interface clock?
>  
>> arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c:
>> struct omap_hwmod_ocp_if am33xx_l3_s__gpmc = {
>>         .master         = &am33xx_l3_s_hwmod,
>>         .slave          = &am33xx_gpmc_hwmod,
>>         .clk            = "l3s_gclk",
>>         .addr           = am33xx_gpmc_addr_space,
>>         .user           = OCP_USER_MPU,
>> };
>>
>> I'd like to know what would be the appropriate DT model for this clock.
>> Perhaps, as child of CORE_M4_CLK, divided by 2:
>>
>> gpmc_fclk: gpmc_fclk {
>>                 #clock-cells = <0>;
>>                 compatible = "fixed-factor-clock";
>>                 clocks = <&dpll_core_m4_ck>;
>>                 clock-mult = <1>;
>>                 clock-div = <2>;
>>         };
>>
>> How does it look? Also, I'm wondering if this works OK when used with
>> the hwmod stuff.
> 
> Hmm we do have clocks or aliases for l3s_gclk, so it's there as otherwise
> the GPMC would not work at all :) Sure with device tree only systems we
> should have the clock phandle directly available though.
> 

Right.

> Note that the hwmod code takes care of runtime PM clock gating for the
> drivers.

Not entirely sure how that works, but I'll take a look.

> But the clock entry for am33xx_l3_s__gpmc should be coming
> from .dts.

Right.

> Please also check out the hwmod dts related changes Felipe
> posted last week, that might allow populating .clk from .dts already.
> 

Ah, nice. I'll take a look.

Thanks Tony!
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
