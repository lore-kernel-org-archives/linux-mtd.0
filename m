Message-ID: <BLU436-SMTP255283C042EDEF59D9BA0CFB8910@phx.gbl>
From: Bill Pringlemeir <bpringle@sympatico.ca>
To: Shawn Guo <shawnguo@kernel.org>
CC: Stefan Agner <stefan@agner.ch>, dwmw2@infradead.org,
 computersforpeace@gmail.com, sebastian@breakpoint.cc, robh+dt@kernel.org,
 pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
 galak@codeaurora.org, shawn.guo@linaro.org, kernel@pengutronix.de,
 boris.brezillon@free-electrons.com, marb@ixxat.de, aaron@tastycactus.com,
 bpringlemeir@gmail.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/6] ARM: vf610: enable NAND Flash Controller
References: <1434668319-6651-1-git-send-email-stefan@agner.ch>
 <1434668319-6651-5-git-send-email-stefan@agner.ch>
 <20150708093801.GG28488@tiger>
Date: Wed, 8 Jul 2015 10:32:54 -0400
In-Reply-To: <20150708093801.GG28488@tiger> (Shawn Guo's message of "Wed, 8
 Jul 2015 17:38:01 +0800")
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On  8 Jul 2015, shawnguo@kernel.org wrote:
> On Fri, Jun 19, 2015 at 12:58:37AM +0200, Stefan Agner wrote:
>> Enable the NAND Flash Controller driver which is part of the Vybrid
>> SoC by default.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>> arch/arm/mach-imx/Kconfig | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
>> index 3a3d3e9..9358135 100644
>> --- a/arch/arm/mach-imx/Kconfig
>> +++ b/arch/arm/mach-imx/Kconfig
>>>> -589,6 +589,7 @@ config SOC_VF610
>> 	select PINCTRL_VF610
>> 	select PL310_ERRATA_769419 if CACHE_L2X0
>> 	select SMP_ON_UP if SMP
>> +	select HAVE_NAND_VF610_NFC

> I'm not sure about the benefit of having this option, except we have
> to have this additional architecture patch.

For other SOC, like the PowerPC or ColdFire CPUs with this controller,
it was a way to mark the controller as populated.  Otherwise, the
Kconfig entry to select the controller will pop up for everybody.

Is there a better way to do this?


>>
>> 	help
>> 	  This enables support for Freescale Vybrid VF610 processor.
