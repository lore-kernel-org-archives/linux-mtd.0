Received: from mail-wg0-f48.google.com ([74.125.82.48])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNJum-0007fp-Pz
 for linux-mtd@lists.infradead.org; Tue, 11 Mar 2014 10:28:05 +0000
Received: by mail-wg0-f48.google.com with SMTP id l18so5611193wgh.19
 for <linux-mtd@lists.infradead.org>; Tue, 11 Mar 2014 03:27:42 -0700 (PDT)
Date: Tue, 11 Mar 2014 10:27:38 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [PATCH] mtd: Kconfig: give the CFI command set version in prompt
 and help
Message-ID: <20140311102738.GB18811@lee--X1>
References: <1394204641-23453-1-git-send-email-phdm@macqel.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1394204641-23453-1-git-send-email-phdm@macqel.be>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Enhances the help for the CFI command set choices.
> 
> Signed-off-by: Philippe De Muyter <phdm@macqel.be>
> ---
>  drivers/mtd/chips/Kconfig |   16 ++++++++--------
>  1 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
> index e4696b3..9f02c28 100644
> --- a/drivers/mtd/chips/Kconfig
> +++ b/drivers/mtd/chips/Kconfig
> @@ -169,33 +169,33 @@ config MTD_OTP
>  	  in the programming of OTP bits will waste them.
>  
>  config MTD_CFI_INTELEXT
> -	tristate "Support for Intel/Sharp flash chips"
> +	tristate "Support for CFI command set 0001 (Intel/Sharp chips)"

tristate "Support for Intel/Sharp flash chips (CFI Command Set 0001)"

>  	depends on MTD_GEN_PROBE
>  	select MTD_CFI_UTIL
>  	help
>  	  The Common Flash Interface defines a number of different command
>  	  sets which a CFI-compliant chip may claim to implement. This code
> -	  provides support for one of those command sets, used on Intel
> -	  StrataFlash and other parts.
> +	  provides support for command set 0001, used on Intel StrataFlash
> +	  and other parts.
>  
>  config MTD_CFI_AMDSTD
> -	tristate "Support for AMD/Fujitsu/Spansion flash chips"
> +	tristate "Support for CFI command set 0002 (AMD/Fujitsu/Spansion chips)"

tristate "Support for AMD/Fujitsu/Spansion flash chips (CFI Command Set 0002)"

Etc ... read better for me.

[...]

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
