Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DB8FC9804
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Mar 2026 22:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6VFcfMiCnguoVbwCBO/m52NAUDF7+uQaPSFHEkobp74=; b=USG/fpQH//CN2F
	s4OMoQkPo3f15TEd10TrJsQ8mFIyH0TtoxHY0tapWwNErrcE4Q8oZmzDF2MggKGdH8pK4TclFWTU0
	8mycgEkh1FBKyTfV6l03aTZxHuKpRAt49wkDl/kmlqIsYzXRkSnoOVn97PwlILWd6tzvUBsvMmVU8
	HCc+/czyflHi2/EdCpScf+s9LfJyBsEWhU6zmMAbkx7HzoZOcu76iwWToaaApW9cooDTs6MW5yl30
	Z3nll4O7BkekPGC0ZL+TZ/0UrnANTKBWLqsVG50TfCtiEStzVZ4tHL3FsL2yXGRH58k5GQrsdFgqu
	ypaU8odZECcmvj2pfSYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ymf-0000000AOMi-1o0u;
	Sun, 29 Mar 2026 22:39:06 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ymZ-0000000AOMN-0dvN
	for linux-mtd@lists.infradead.org;
	Sun, 29 Mar 2026 22:39:00 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-12732e6a123so1787016c88.1
        for <linux-mtd@lists.infradead.org>; Sun, 29 Mar 2026 15:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774823938; x=1775428738; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mIaCRwsPiPLGbHW57vve74Uei7PyZwajOXtEVAjCMmE=;
        b=e8nqOr71JFvniHAvXGi3EjKsd5jjVKshFDukDFj/8vPnwPwofZTUNA/KG8ekuUn7Bz
         6bQzktd9Wp8M7tInLBDWP4IKfO8k/RlUTC0bzqxWwAVuurWU5W6t2KaaMwBv/IrRdEX7
         MgDTP0p8vtmzQaqy6mT7iKNGdxZCXw/UzJlskUthuVPTm+kmHH1xjEcZ4Z/wQD7CHuOE
         heftBXIJvsg5MpW0g1MLpwFWOrrMrBsv9E6U7kowoGFVLEUG5zePFbShIFHnfuDTlZ/0
         fVfENBlUHAz96boI5LYGrvY7fHrmZtG4zq9OsArN2ER32UvRqbZXqc9KhwgmbwCdWbaL
         HtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774823938; x=1775428738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIaCRwsPiPLGbHW57vve74Uei7PyZwajOXtEVAjCMmE=;
        b=IwImo/V5PMKxVsSpmX4OUrIuzvQi1p8JPcPNQAXbzW8dhFC4djws3Nw5g7h91J/zwm
         fFAwCdHwZa2aJeMyRrXRVGFl6ecDJPeVEsScHfm02e4uDNdLdEuBetBbNW/IX4xqrhlJ
         en+PyNxhJrsgJHQUoryeDqHFeezwpB5zpup6g62lF12rauTyEoH33m7sOWRdAdbEdm25
         yrHRhOgVzXU3dmaVDo+yHDtj7JumbHXeATKUWehGmvx4k4OngJURdVn67MMAyUVTHDAU
         pMaW06MqkfW1TIvGMJYZmE8ZS7m8r0GzqjOV79cHVKbRJujDymgSIC1En+xL9r7Hx5V6
         ShKA==
X-Forwarded-Encrypted: i=1; AJvYcCVIs8nhD3PyX+A7VhvUNu+uxv7Dx8QzpYIrAsQD7L13JhXd6Su/6sZKmEk8HvsTs5MQ/NXATqiC914=@lists.infradead.org
X-Gm-Message-State: AOJu0YwV1bhQMpiHkrukCsO+0WfHQMjiD/obUbJh+pLuAG2ca+3zhkj7
	3SBpHHLQqDimC0dShnxkCBFEM/Ch0uax2WIvgsdWLsfQ4jg6zotP/WyG
X-Gm-Gg: ATEYQzzJy3ba+9ZBFxEWMXQ331MoVq2Y9BJSFV+OlaUMcVdqlSLCVSMNTIxx4M6ykEa
	MwCveW6s+zZiX59sFlAqPvKEpJCqCdnW7EBmzxisj2re3qRFAksWPEf8w0foa/Y0X0H6sV9r2+1
	8YhBG8+NyVsHH8tq+bdmicqnCnmPxRNditoCySW6FlZALdQbTR4FCZcnZd6G3j8FVuxR6mMBUfy
	G02OL/+EwgH1oTqtNnIEHiA/o/hvGaTsoqDd8aYZaZJ8LRCur00FAaGA+XNAgBCa0X9Uzyb60/8
	xYiHnnlOX+hua6O73To/6kWzEt1CUTFnAExP/hyFENGeDetEufcAuNlLQBYyyDMwO8Q0SYXSb6e
	pUYm22W2Tto/TO6loOYKVkJh8I6hC7s+oypFJrYAk0leqDqFoyW4h2Cso65nly1sQhlI7mnEDZf
	MmkTPlVPZ/wyj3SbJ1RiJp9wCczwuIpnrSx5t//ct5ZzPLBIUGP98XxpIzdoodHmF7
X-Received: by 2002:a05:7022:6190:b0:11a:641f:ba11 with SMTP id a92af1059eb24-12ab2928cb4mr5161322c88.29.1774823937606;
        Sun, 29 Mar 2026 15:38:57 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7265:773a:8e51:c62f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm8212926c88.10.2026.03.29.15.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:38:57 -0700 (PDT)
Date: Sun, 29 Mar 2026 15:38:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mips@vger.kernel.org, linux-input@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] MIPS/input: Move RB532 button to GPIO descriptors
Message-ID: <acmo7_clKRWzhyOi@google.com>
References: <20260328-mips-input-rb532-button-v1-0-98e201621501@kernel.org>
 <20260328-mips-input-rb532-button-v1-1-98e201621501@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260328-mips-input-rb532-button-v1-1-98e201621501@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_153859_202512_E02D1AEB 
X-CRM114-Status: GOOD (  22.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Linus,

On Sat, Mar 28, 2026 at 04:55:47PM +0100, Linus Walleij wrote:
> Convert the Mikrotik RouterBoard RB532 to use GPIO descriptors
> by defining a software node for the GPIO chip, then register
> the button platform device with full info passing the GPIO
> as a device property.
> 
> This can be used as a base to move more of the RB532 devices
> over to passing GPIOs using device properties.
> 
> Use the GPIO_ACTIVE_LOW flag and drop the inversion in the
> rb532_button_pressed() function.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/mips/rb532/devices.c         | 47 +++++++++++++++++++++++++++++++++------
>  drivers/input/misc/rb532_button.c | 35 ++++++++++++++++++++++++-----
>  2 files changed, 69 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
> index 4f027efbf27b..3f56d9feb73a 100644
> --- a/arch/mips/rb532/devices.c
> +++ b/arch/mips/rb532/devices.c
> @@ -16,8 +16,10 @@
>  #include <linux/mtd/mtd.h>
>  #include <linux/gpio.h>
>  #include <linux/gpio/machine.h>
> +#include <linux/gpio/property.h>
>  #include <linux/gpio_keys.h>
>  #include <linux/input.h>
> +#include <linux/property.h>
>  #include <linux/serial_8250.h>
>  
>  #include <asm/bootinfo.h>
> @@ -38,6 +40,10 @@ extern unsigned int idt_cpu_freq;
>  
>  static struct mpmc_device dev3;
>  
> +static const struct software_node rb532_gpio0_node = {
> +	.name = "gpio0",
> +};

You need to move this and registration into arch/mips/rb532/gpio.c,
export it and use it here: Bartosz is against using gpiohip label to
match with software node name and prefers identity matching.

...

> -static bool rb532_button_pressed(void)
> +static bool rb532_button_pressed(struct rb532_button *button)
>  {
>  	int val;
>  
>  	set_latch_u5(0, LO_FOFF);
> -	gpio_direction_input(GPIO_BTN_S1);
> +	gpiod_direction_input(button->gpio);
>  
> -	val = gpio_get_value(GPIO_BTN_S1);
> +	val = gpiod_get_value(button->gpio);
>  
>  	rb532_gpio_set_func(GPIO_BTN_S1);
>  	set_latch_u5(LO_FOFF, 0);
>  
> -	return !val;
> +	return val;
>  }

I suppose there is no reasonable way of making this work with
gpio-keys...

For input piece:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
