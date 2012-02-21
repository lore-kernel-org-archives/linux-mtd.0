Message-ID: <4F436AF5.5030104@atmel.com>
Date: Tue, 21 Feb 2012 10:59:17 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
MIME-Version: 1.0
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 5/6 V3] atmel/nand: add DT support
References: <1328524512-18159-2-git-send-email-plagnioj@jcrosoft.com>
 <1329817573-6473-1-git-send-email-plagnioj@jcrosoft.com>
In-Reply-To: <1329817573-6473-1-git-send-email-plagnioj@jcrosoft.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: devicetree-discuss@lists.ozlabs.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/21/2012 10:46 AM, Jean-Christophe PLAGNIOL-VILLARD :
> Use a local copy of board informatin and fill with DT data.
> 
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> Acked-by: Grant Likely <grant.likely@secretlab.ca>
> Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
> Cc: devicetree-discuss@lists.ozlabs.org
> Cc: linux-mtd@lists.infradead.org
> ---
> v3:
> 
> 	protect against !CONFIG_OF
> 
> Best Regards,
> J.
>  .../devicetree/bindings/mtd/atmel-nand.txt         |   41 +++++++
>  arch/arm/boot/dts/at91sam9g20.dtsi                 |   17 +++
>  arch/arm/boot/dts/at91sam9g45.dtsi                 |   17 +++
>  arch/arm/boot/dts/at91sam9m10g45ek.dts             |   26 +++++-
>  arch/arm/boot/dts/usb_a9g20.dts                    |   46 ++++++++-
>  arch/arm/mach-at91/at91sam9x5.c                    |    5 -

As we will put this series on top of 9x5, we may also add the entries in
at91sam9x5.dtsi / at91sam9x5cm.dtsi ...

>  arch/arm/mach-at91/board-dt.c                      |   52 ---------
>  drivers/mtd/nand/atmel_nand.c                      |  113 ++++++++++++++++----
>  8 files changed, 238 insertions(+), 79 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/atmel-nand.txt

Otherwise,

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Bye,
-- 
Nicolas Ferre
