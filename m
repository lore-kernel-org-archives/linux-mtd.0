Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78690C3F2CD
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 16:13:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BAF32146E
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 16:13:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U1fizQMP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BAF32146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYGOpFPLtH/2rYyJVSOH2r1XTk+klGjsDaonQa/b+lk=; b=U1fizQMP8KBbSb
	twI3PCU3vWOlayfrOE2u+bvDE9mdg6+xtLesbSAbdM+6vBc5EzlIU2u84ChX0u9zCPRv2oGErNRJm
	i2yFo2jV3JisbqlG9iciSaZPMUTnLe5d+48lp3zqi3RptBrxbVAEtFA2OUZNr0r0o2QCc2zhuw+dn
	xqP1aB8R95tdz2NvxvlRd5trik/0+UoiFNzQLjvco6AiZ0s+OBDcz2G9UbWzRYVIsVTwmef/e36u0
	HKkAoDKrSRwxf5jQW4I8kXJa26cc7TPri0JBRQ+1uGD0UeZyCphsnBc8RR+zwWBJDTS+wwrT0DqTl
	Dp4zGergbaoKSHkysCxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8ngS-0005NM-CA; Mon, 02 Mar 2020 16:12:44 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8ngP-0005MU-9k
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2020 16:12:42 +0000
Received: by mail-ot1-f67.google.com with SMTP id 66so10226749otd.9
 for <linux-mtd@lists.infradead.org>; Mon, 02 Mar 2020 08:12:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IBU1ngp7AZThDbUbO+cKAdOQ9eyjciNaYONj1CU5V7s=;
 b=PJWIsgfRjoZ2MX8PodPtHkQIOBMrcMJH0OdNhwvr6Volvw/nmYx1cx+da0Dv1/Bil6
 UdOmv+Rnds3qZk9/HWpmJw0JvehbE1X/MwiA05x6sZNR+Urz5IvGlu2bSdCuYqrZvfNb
 sY2HhI3XxZ7xmL5WqP3a8BMmmfAN2qmAFeMLNaPdE/uSnD7dyMnuB2ps2Uh+eUwtyVKn
 LdRG5QBAOxgYkySXXXFqo0U5GmFEP9RFJtqf0hzz6e/rDfPoUWWofSDl8Niy3suQeMWv
 1tR89WEPU6IGKxW//yPrQ6AG3YhAfYevLrGKJVPzuAbQgTPZ8+Aw6IY+WrNlPvoo3+YK
 7iRw==
X-Gm-Message-State: ANhLgQ2qh79ffX88KUMrp7nPF0H0N2yjEqS8L2E8ljNnQCfAxQLPTrAU
 gBn9JZXQyPyVL5Y2wK7Xx8nHcDAZ4SVOHcPQ5pQ=
X-Google-Smtp-Source: ADFU+vvg6cWqaPv6sfkzgh4uXnbYNGWltt0N4bOdGNKjXE/BLlkVjwI45QAekHnzDWDL4MznTQXJzZftVEs/EUTFqwg=
X-Received: by 2002:a05:6830:1e9c:: with SMTP id
 n28mr623596otr.107.1583165559752; 
 Mon, 02 Mar 2020 08:12:39 -0800 (PST)
MIME-Version: 1.0
References: <1582903131-160033-1-git-send-email-john.garry@huawei.com>
 <1582903131-160033-2-git-send-email-john.garry@huawei.com>
In-Reply-To: <1582903131-160033-2-git-send-email-john.garry@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2020 17:12:05 +0100
Message-ID: <CAMuHMdV9v-7eRqi3JjcNaOBpRrC2-gLDCizYOJwhQCjZiLr5dA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] spi: Allow SPI controller override device buswidth
To: John Garry <john.garry@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_081241_337565_D70C03F8 
X-CRM114-Status: GOOD (  20.50  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-spi <linux-spi@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linuxarm <linuxarm@huawei.com>, Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi John,

Thanks for your patch!

On Fri, Feb 28, 2020 at 4:23 PM John Garry <john.garry@huawei.com> wrote:
> Currently ACPI firmware description for a SPI device does not have any
> method to describe the data buswidth on the board.
>
> So even through the controller and device may support higher modes than
> standard SPI, it cannot be assumed that the board does - as such, that
> device is limited to standard SPI in such a circumstance.

Indeed.

> As a workaround, allow the controller driver supply buswidth override bits,
> which are used inform the core code that the controller driver knows the
> buswidth supported on that board for that device.

I feel this is a bit dangerous, and might bite us one day.

> A host controller driver might know this info from DMI tables, for example.

Can't acpi_register_spi_device() obtain that info from DMI tables,
to avoid contaminating the generic code?

> Signed-off-by: John Garry <john.garry@huawei.com>

> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -510,6 +510,7 @@ struct spi_device *spi_alloc_device(struct spi_controller *ctlr)
>         spi->dev.bus = &spi_bus_type;
>         spi->dev.release = spidev_release;
>         spi->cs_gpio = -ENOENT;
> +       spi->mode = ctlr->buswidth_override_bits;

This could just be moved to acpi_register_spi_device(), right?

>
>         spin_lock_init(&spi->statistics.lock);
>
> @@ -2181,9 +2182,10 @@ static acpi_status acpi_register_spi_device(struct spi_controller *ctlr,
>                 return AE_NO_MEMORY;
>         }
>
> +
>         ACPI_COMPANION_SET(&spi->dev, adev);
>         spi->max_speed_hz       = lookup.max_speed_hz;
> -       spi->mode               = lookup.mode;
> +       spi->mode               |= lookup.mode;
>         spi->irq                = lookup.irq;
>         spi->bits_per_word      = lookup.bits_per_word;
>         spi->chip_select        = lookup.chip_select;
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index 6d16ba01ff5a..600e3793303e 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -481,6 +481,9 @@ struct spi_controller {
>         /* spi_device.mode flags understood by this controller driver */
>         u32                     mode_bits;
>
> +       /* spi_device.mode flags override flags for this controller */
> +       u32                     buswidth_override_bits;

And I'd be happy if we could avoid adding this here ;-)

> +
>         /* bitmask of supported bits_per_word for transfers */
>         u32                     bits_per_word_mask;
>  #define SPI_BPW_MASK(bits) BIT((bits) - 1)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
