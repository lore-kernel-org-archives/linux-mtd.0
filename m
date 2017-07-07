Received: from mail-yw0-f196.google.com ([209.85.161.196])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dTTwH-0000sS-9x
 for linux-mtd@lists.infradead.org; Fri, 07 Jul 2017 14:08:59 +0000
Received: by mail-yw0-f196.google.com with SMTP id a12so1809313ywh.1
 for <linux-mtd@lists.infradead.org>; Fri, 07 Jul 2017 07:08:36 -0700 (PDT)
Date: Fri, 7 Jul 2017 09:08:34 -0500
From: Rob Herring <robh@kernel.org>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: ralf@linux-mips.org, linux-mips@linux-mips.org,
 linux-mtd@lists.infradead.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, martin.blumenstingl@googlemail.com,
 john@phrozen.org, linux-spi@vger.kernel.org,
 hauke.mehrtens@intel.com, andy.shevchenko@gmail.com, p.zabel@pengutronix.de
Subject: Re: [PATCH v7 05/16] watchdog: lantiq: add device tree binding
 documentation
Message-ID: <20170707140834.nugjw5jxkyzwrmzq@rob-hp-laptop>
References: <20170702224051.15109-1-hauke@hauke-m.de>
 <20170702224051.15109-6-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170702224051.15109-6-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 03, 2017 at 12:40:40AM +0200, Hauke Mehrtens wrote:
> The binding was not documented before, add the documentation now.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  .../devicetree/bindings/watchdog/lantiq-wdt.txt    | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt b/Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt
> new file mode 100644
> index 000000000000..c3967feebb6c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt
> @@ -0,0 +1,24 @@
> +Lantiq WTD watchdog binding
> +============================
> +
> +This describes the binding of the Lantiq watchdog driver.
> +
> +-------------------------------------------------------------------------------
> +Required properties:
> +- compatible		: Should be one of
> +				"lantiq,wdt"
> +				"lantiq,xrx100-wdt"
> +				"lantiq,xrx200-wdt"
> +				"lantiq,falcon-wdt"
> +- lantiq,rcu		: A phandle to the RCU syscon (required for
> +			  "lantiq,falcon-wdt", "lantiq,xrx200-wdt" and
> +			  "lantiq,xrx100-wdt")
> +
> +-------------------------------------------------------------------------------
> +Example for the watchdog on the xRX200 SoCs:
> +		watchdog@803f0 {
> +			compatible = "lantiq,xrx200-wdt", "lantiq,xrx100-wdt";

This is still mismatched. If the example is correct, then the compatible 
list should be:

"lantiq,wdt"
"lantiq,xrx100-wdt"
"lantiq,xrx200-wdt", "lantiq,xrx100-wdt"
"lantiq,falcon-wdt"

You can also remove "lantiq,xrx200-wdt" from the driver if you want as 
"lantiq,xrx100-wdt" is good enough to match on.

Rob
