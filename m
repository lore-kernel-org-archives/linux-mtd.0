Received: from mail-wg0-f53.google.com ([74.125.82.53])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1hyW-0007z3-Le
 for linux-mtd@lists.infradead.org; Thu, 18 Dec 2014 20:47:10 +0000
Received: by mail-wg0-f53.google.com with SMTP id l18so2710230wgh.12
 for <linux-mtd@lists.infradead.org>; Thu, 18 Dec 2014 12:46:46 -0800 (PST)
Message-ID: <54933CC1.9010301@vanguardiasur.com.ar>
Date: Thu, 18 Dec 2014 17:44:49 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>
Subject: GPMC clock question
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-omap@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?R3VpZG8gTWFydMOtbmV6?= <guido@vanguardiasur.com.ar>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tony, Roger:

As far as I can see, the GPMC interface clock (GPMC_FCLK) is not
properly modeled in the devicetree. Instead, hwmod magic seems to be used.

arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c:
struct omap_hwmod_ocp_if am33xx_l3_s__gpmc = {
        .master         = &am33xx_l3_s_hwmod,
        .slave          = &am33xx_gpmc_hwmod,
        .clk            = "l3s_gclk",
        .addr           = am33xx_gpmc_addr_space,
        .user           = OCP_USER_MPU,
};

I'd like to know what would be the appropriate DT model for this clock.
Perhaps, as child of CORE_M4_CLK, divided by 2:

gpmc_fclk: gpmc_fclk {
                #clock-cells = <0>;
                compatible = "fixed-factor-clock";
                clocks = <&dpll_core_m4_ck>;
                clock-mult = <1>;
                clock-div = <2>;
        };

How does it look? Also, I'm wondering if this works OK when used with
the hwmod stuff.

Thanks a lot in advance!
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
