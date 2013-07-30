Received: from mail-pd0-f182.google.com ([209.85.192.182])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4Csy-00048Z-Vm
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 16:34:58 +0000
Received: by mail-pd0-f182.google.com with SMTP id r10so939367pdi.41
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2013 09:34:35 -0700 (PDT)
Date: Tue, 30 Jul 2013 09:34:41 -0700
From: Olof Johansson <olof@lixom.net>
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH v2 1/4] mtd: nand: gpio: Determine bus width automatically
Message-ID: <20130730163441.GB13634@quad.lixom.net>
References: <1375182325-30003-1-git-send-email-shc_work@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375182325-30003-1-git-send-email-shc_work@mail.ru>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Rob Herring <rob.herring@calxeda.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 30, 2013 at 03:05:24PM +0400, Alexander Shiyan wrote:
> This patch provide automatically determine of NAND bus width if
> "bank-width" parameter is ommited.
> Patch depends on "mtd: nand: fix NAND_BUSWIDTH_AUTO for x16 devices".
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  .../devicetree/bindings/mtd/gpio-control-nand.txt         |  4 ++--
>  drivers/mtd/nand/gpio.c                                   | 15 ++++++++++-----
>  2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> index 36ef07d..2ac14d8 100644
> --- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> @@ -15,8 +15,8 @@ Required properties:
>    optional gpio and may be set to 0 if not present.
>  
>  Optional properties:
> -- bank-width : Width (in bytes) of the device.  If not present, the width
> -  defaults to 1 byte.
> +- bank-width : Width (in bytes) of the device. If not present, the bus width
> +  of the device is determined automatically.
>  - chip-delay : chip dependent delay for transferring data from array to
>    read registers (tR).  If not present then a default of 20us is used.
>  - gpio-control-nand,io-sync-reg : A 64-bit physical address for a read

This would break backwards compatibility, something we're now starting to push
back at.

Instead what you can do is add a bank-width-auto property that, if present and
bank-width being absent, will result in the automatic determination of bank
width.


-Olof
