Received: from mail-pg0-f66.google.com ([74.125.83.66])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diMRV-0003FI-LB
 for linux-mtd@lists.infradead.org; Thu, 17 Aug 2017 15:10:43 +0000
Received: by mail-pg0-f66.google.com with SMTP id y129so10335272pgy.3
 for <linux-mtd@lists.infradead.org>; Thu, 17 Aug 2017 08:10:21 -0700 (PDT)
Date: Thu, 17 Aug 2017 10:10:16 -0500
From: Rob Herring <robh@kernel.org>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: ralf@linux-mips.org, linux-mips@linux-mips.org,
 linux-mtd@lists.infradead.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, martin.blumenstingl@googlemail.com,
 john@phrozen.org, linux-spi@vger.kernel.org,
 hauke.mehrtens@intel.com, andy.shevchenko@gmail.com,
 p.zabel@pengutronix.de, kishon@ti.com, mark.rutland@arm.com
Subject: Re: [PATCH v9 14/16] phy: Add an USB PHY driver for the Lantiq SoCs
 using the RCU module
Message-ID: <20170817151016.2ujg6v4n7dstydo2@rob-hp-laptop>
References: <20170808225247.32266-1-hauke@hauke-m.de>
 <20170808225247.32266-15-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170808225247.32266-15-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 09, 2017 at 12:52:45AM +0200, Hauke Mehrtens wrote:
> This driver starts the DWC2 core(s) built into the XWAY SoCs and provides
> the PHY interfaces for each core. The phy instances can be passed to the
> dwc2 driver, which already supports the generic phy interface.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  .../bindings/phy/phy-lantiq-rcu-usb2.txt           |  40 ++++
>  arch/mips/lantiq/xway/sysctrl.c                    |  36 +--
>  drivers/phy/Kconfig                                |   1 +
>  drivers/phy/Makefile                               |   2 +-
>  drivers/phy/lantiq/Kconfig                         |   9 +
>  drivers/phy/lantiq/Makefile                        |   1 +
>  drivers/phy/lantiq/phy-lantiq-rcu-usb2.c           | 254 +++++++++++++++++++++
>  7 files changed, 324 insertions(+), 19 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-lantiq-rcu-usb2.txt
>  create mode 100644 drivers/phy/lantiq/Kconfig
>  create mode 100644 drivers/phy/lantiq/Makefile
>  create mode 100644 drivers/phy/lantiq/phy-lantiq-rcu-usb2.c
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-lantiq-rcu-usb2.txt b/Documentation/devicetree/bindings/phy/phy-lantiq-rcu-usb2.txt
> new file mode 100644
> index 000000000000..d8d25063dd5d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-lantiq-rcu-usb2.txt
> @@ -0,0 +1,40 @@
> +Lantiq XWAY SoC RCU USB 1.1/2.0 PHY binding
> +===========================================
> +
> +This binding describes the USB PHY hardware provided by the RCU module on the
> +Lantiq XWAY SoCs.
> +
> +This driver has to be a sub node of the Lantiq RCU block.

s/driver/node/

With that,

Acked-by: Rob Herring <robh@kernel.org>
