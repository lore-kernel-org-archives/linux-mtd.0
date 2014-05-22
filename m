Received: from mail-ie0-f182.google.com ([209.85.223.182])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnRdx-0002iY-G3
 for linux-mtd@lists.infradead.org; Thu, 22 May 2014 11:58:42 +0000
Received: by mail-ie0-f182.google.com with SMTP id as1so3412491iec.41
 for <linux-mtd@lists.infradead.org>; Thu, 22 May 2014 04:58:20 -0700 (PDT)
Date: Thu, 22 May 2014 12:58:16 +0100
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/10] mtd: st_spi_fsm: Provide mask to obtain correct
 boot device pins
Message-ID: <20140522115816.GX6679@lee--X1>
References: <1400757848-18075-1-git-send-email-lee.jones@linaro.org>
 <1400757848-18075-10-git-send-email-lee.jones@linaro.org>
 <20140522115643.GW6679@lee--X1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140522115643.GW6679@lee--X1>
Cc: Christophe Kerello <christophe.kerello@st.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Whoops, wrong patch, please ignore this v2.

> mtd: st_spi_fsm: Provide documentation for boot device mask property
> 
> The system configuration registers which display which device the system
> booted on are in the same place on all boards which support the FSM.
> However, the bits do shift every so slightly.  To combat these we're
> adding a new property which supplies the necessary mask used to abstract
> the required information.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> 
> diff --git a/Documentation/devicetree/bindings/mtd/st-fsm.txt b/Documentation/devicetree/bindings/mtd/st-fsm.txt
> index c248939..2ef9710 100644
> --- a/Documentation/devicetree/bindings/mtd/st-fsm.txt
> +++ b/Documentation/devicetree/bindings/mtd/st-fsm.txt
> @@ -11,6 +11,10 @@ Optional properties:
>    - st,syscfg          : Phandle to boot-device system configuration registers
>    - st,boot-device-reg : Address of the aforementioned boot-device register(s)
>    - st,boot-device-spi : Expected boot-device value if booted via this device
> +  - st,boot-device-msk : Mask to use when extracting boot device from the
> +                        above system config registers
> +  NB: If any of the st,boot-device-* properties are missing, the driver falls
> +  back to the default assumption of 'booted from SPI'.
>  
>  Example:
>         spifsm: spifsm@fe902000{

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
