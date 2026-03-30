Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1868CFB3CE4
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2026 09:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:MIME-Version:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KT1cVxC+JRkSwZp6S56hT4zyswFzgidV7GKl/nQcibg=; b=AhTenGfNt8L9E7Ir4dR1cCKger
	pXMZipaQJwSaJZSIHa14MkcxgMNBeVHfUo/sXaWgH8TWayNMpQWKbWU9md6GuX0Vxl32zBIeQgh1F
	Xj5bd7aAwVfG4iluqhJLgPLiU2zjo75XEoJP17iZK3NxOkJ5fDsiY6PpWyXiQdqV/9tzuXoPYmkPF
	LjcZ/SXbCvLWhtPVOy36BOV1IvztF/RA+MpCMG/6/RrT14psSEznlybPChWx0UCOG8dgMTHnxNjAb
	gn0+bIalAToEz3JmfEE491a+hWZw9xGEpC2mg4s8xcWofpmL7sTI/h9qzc7NTQ5eY3MS8PVQ+3DXI
	+JyveY8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78fF-0000000AwFt-3bXn;
	Mon, 30 Mar 2026 09:12:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78fE-0000000AwFh-1fwV
	for linux-mtd@lists.infradead.org;
	Mon, 30 Mar 2026 09:12:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79581600AE
	for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2026 09:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E211C2BCB3
	for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2026 09:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774861923;
	bh=ceON4+OyPO9Dpt3uRo/YI9ctvvIsu5NXrp2cWjyJbGM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=RhbUYW1mny2+1VgOOKTjJlNgARppS1K9nt7p4vpy0jKBvrMYdfM0wQKv0I14eSCdJ
	 HvPbgZFcjWyv0PJXoZOBX4tTlamzeGfteGy5KmcxV3rgC6Yw6imrhxXlCAehnSOzvV
	 FlwEpqnYzWJyF53poKcxDSCGxfyfixlgcDsQYEtDWU6Td9sJ0sH7Vh4g4Wj5BRKy+0
	 N8BzdWPmbNRNGV637fkqEcY0dNobxhOf6ohvVtVY7b8UrSkJrADR8rT5XVJy3aJBYI
	 Kb4pOCR1o2NNisdwpg6viQCe14RIB5F/XGupZz4pEjdSfRsE8VE+gvrVutISqiDaKT
	 U9iRekWyD0KCQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38bd60d7a2cso40244421fa.1
        for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2026 02:12:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU34RFSI7kB5j5twofV9xjl1zWN2u81QfnmmbZpDXIqScn2/9D44IZbreXEOKUL6qUgWoMDg4BB7+Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YxwlgVtUU13oozluKmiDXPKX8qEmd3GsD9iHMFBfk8p4gv3Sblz
	bGFHsG33ssXBECKczjQEXE3petZzf9Tmum4P1LltoKf8qh9cD3HdRMQFas8NWAN6jthI+o8HBAG
	cuYOR/BCvmUYYMXM9vO7oTeNb8rTIRZ/BKnZnWewdcQ==
X-Received: by 2002:a05:651c:1594:b0:38a:8c44:75a1 with SMTP id
 38308e7fff4ca-38c730901a6mr29310131fa.8.1774861921807; Mon, 30 Mar 2026
 02:12:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 02:12:00 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 02:12:00 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260328-mips-input-rb532-button-v1-1-98e201621501@kernel.org>
MIME-Version: 1.0
References: <20260328-mips-input-rb532-button-v1-0-98e201621501@kernel.org> <20260328-mips-input-rb532-button-v1-1-98e201621501@kernel.org>
Date: Mon, 30 Mar 2026 02:12:00 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mct_F-LPAsvsHWxS1SeT+SBXQ7opikmf33eR7tz_5tJwA@mail.gmail.com>
X-Gm-Features: AQROBzDH9cuPCu9EfBdDYtLtddxHJtuJYI_E5t-aB4_H_wCaSEBQDt7of5qpvKI
Message-ID: <CAMRc=Mct_F-LPAsvsHWxS1SeT+SBXQ7opikmf33eR7tz_5tJwA@mail.gmail.com>
Subject: Re: [PATCH 1/2] MIPS/input: Move RB532 button to GPIO descriptors
To: Linus Walleij <linusw@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
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

On Sat, 28 Mar 2026 16:55:47 +0100, Linus Walleij <linusw@kernel.org> said:
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
> +

Hi Linus!

I'm seeing patches from you lately using the pattern of "dangling software"
nodes that's documented under Documentation/driver-api/gpio/board.rst as the
recommended approach but which I have been trying to come up with a better
alternetive for and eventually phase out. I will post a series providing a way
to automatically assign software nodes as secondary firmware nodes for devices
and this series will also remove the offending bits from the docs.

As you're dealing with a board file here: could you assign the firmware node
you get after registering this software node to the target GPIO controller
under arch/mips/rb532/gpio.c so that the firmware node lookup can work by
matching the address rather than falling back to the label string matching?

Thanks,
Bartosz

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
