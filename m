Received: from mail-yh0-x230.google.com ([2607:f8b0:4002:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOuZU-0003ep-UI
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 19:16:25 +0000
Received: by mail-yh0-f48.google.com with SMTP id f10so57885yha.35
 for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2013 12:16:03 -0700 (PDT)
Date: Wed, 25 Sep 2013 12:15:59 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v6 4/4] ARM: dts: AM33xx: updated default ECC scheme in
 nand-ecc-opt
Message-ID: <20130925191559.GF23337@ld-irv-0074.broadcom.com>
References: <1378986619-26765-1-git-send-email-pekon@ti.com>
 <1378986619-26765-5-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1378986619-26765-5-git-send-email-pekon@ti.com>
Cc: devicetree@vger.kernel.org, arnd@arndb.de, dedekind1@gmail.com,
 tony@atomide.com, avinashphilipk@gmail.com, balbi@ti.com,
 linux-mtd@lists.infradead.org, olof@lixom.net, benoit.cousson@linaro.org,
 linux-omap@vger.kernel.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 12, 2013 at 05:20:19PM +0530, Pekon Gupta wrote:
> DT property values for OMAP based gpmc-nand have been updated
> to match changes in commit:
> 	6faf096 ARM: OMAP2+: cleaned-up DT support of various ECC schemes

Whose commit ID is this? Your patch is not merged yet, so don't use a
commit ID.

> Refer: Documentation/devicetree/bindings/mtd/gpmc-nand.txt
> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  arch/arm/boot/dts/am335x-evm.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
> index e8ec875..e28a2ac 100644
> --- a/arch/arm/boot/dts/am335x-evm.dts
> +++ b/arch/arm/boot/dts/am335x-evm.dts
> @@ -268,7 +268,7 @@
>  			nand@0,0 {
>  				reg = <0 0 0>; /* CS0, offset 0 */
>  				nand-bus-width = <8>;
> -				ti,nand-ecc-opt = "bch8";
> +				ti,nand-ecc-scheme = "bch8";
>  				gpmc,device-nand = "true";
>  				gpmc,device-width = <1>;
>  				gpmc,sync-clk-ps = <0>;

This change should probably go in patch 1 anyway, when you break the
ABI.

Brian
