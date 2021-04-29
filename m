Return-Path: <SRS0=3Xy9=J2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEE3C433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 16:24:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA841613F1
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 16:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA841613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nczbt0/PCC+mjweAYWG/flk6merN0MHozhtZlUC79IM=; b=bfsdnL3y31RjbEgrnnyP1rPKD
	hdRJ5xBAGdpSekKGikBdpHmbU2osds6IwqsKKGffVpsY1W4QsWYpTgsCcOftOdE+3YjhGKIx9jcCf
	p/t1tTZIWpkdAC2bbQG8ph16f1hHL1YzWbJCzIEGCLztaaM+gXjXhSC1D7TdBceJpSyb0vfC1hsft
	ZMnnHP0v+7wxO0b7GD5zL4tBMR81gkNAvBwJrhZHGFV+gswJxRCA9PjWBtsMwfR6UVtbjFXTXbv5X
	zXAkNP42XonuWLDxzfqwZtHiqc8eZtdJxzQNTQ3SvbXeRzVZZi98gH0f1NtmyX/ODRTbrh1f7907y
	Q0DpS3EEw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc9S5-0062dO-GF; Thu, 29 Apr 2021 16:23:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc9S3-0062dH-20
 for linux-mtd@desiato.infradead.org; Thu, 29 Apr 2021 16:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=A8kA1nA6ez8GVSpcYT5oYjc8axAEtsKpaYmy0o7ewtQ=; b=QPK2LfWMBIn5Ni4OiDlTZLNQ47
 dSTYK+nuTw0QwBxaf6EKLHYmA41FblId6B2gvmn6B1QfJyjXP3YeaP75Qp16G7BmKphHmgrwSnofj
 W9C2iPw67IOFL241iQHD+jO00589DT+v6g30Jaq/qckGMR55R77WtwgUYVmcwvJdA7i9F4YD/oh5o
 W2/OoZUneMm0oGXF+9vBn1H08GZinNnf1nk5TilJyFVO9eYhIqSKk9St/zrW87drmWMPVrfzcuS63
 9FykxL/znvEFzDRmtIpk9aKVY6jNLtXTv1L8zMBSMxBc+GiHuHakwA9R644I3IBQ3CQP2L3jRao72
 51ep59gg==;
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc9S0-000lCp-DZ
 for linux-mtd@lists.infradead.org; Thu, 29 Apr 2021 16:23:41 +0000
Received: by mail-ot1-x334.google.com with SMTP id
 92-20020a9d02e50000b029028fcc3d2c9eso39374787otl.0
 for <linux-mtd@lists.infradead.org>; Thu, 29 Apr 2021 09:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A8kA1nA6ez8GVSpcYT5oYjc8axAEtsKpaYmy0o7ewtQ=;
 b=UemxAc3nBUhoStCY+5eaTBJdKaNUQuiJnDiJLkTnfwXM00EwLQoXe1kiBv9U81LRI3
 TV9h8nxmy+TEACZY7eDK3efcOgpl6ZRO/p5yQrq29yu55NjWtOpBcU2vkx+eK3qktRLC
 t7xtu0tp0aFGXnyAQqlw43DryH7aSlI9S6wjrXiiBd2yoBHS+SG3c4LQTmrcnJat6gVy
 QrcsOXHi+U4DT0w4sfmL/NVJqpOF5X6gehC+ZcoxeLbje4Q7n2ShtF9tBnjyrQc335al
 h14a2E5vGmzbMplyYl1O7fAFpaLMfXSsVVWiwrH7MA+wlqDmcynG2YYlzuMZhZHKuZfp
 pCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A8kA1nA6ez8GVSpcYT5oYjc8axAEtsKpaYmy0o7ewtQ=;
 b=pli5/nNprT3XbSPKYLrCxlqM8hcA/7t5XZOcsJnZmj3UWUHOUi7yV8R0mAFZoyZloB
 t3onpSc3GbLeyfdWxyhVlRN16tfBxZy3i7rlsk6v/vKixaQIvW+tVPFhWuA1JL5czdyg
 hEmBwkExaAZBUnyoZ1BS+VzvtOVPan6ZwzpANcu9/G9y0xlKxdEz/iSrQQnxjVkIfxzz
 GrIvrglWdlZVWGFIPOzwc0Jnn4aFOJ4sM2op5ycNcb+gUKVLXMifK9fXg9cuO4tvAdga
 CsXP9rsQMnYvKXvnOMj7BKSUUTS9vXCfLsPI38KgDVzdyZ+NNmZ3DKuQAPY7wUVYpQ3O
 msVA==
X-Gm-Message-State: AOAM533QWlCPAZ+2lNieALEgI8niGZsOOYmy9ZvsoTd/oIddNU4miio5
 Kcs90OkcRtTC1TYXUAiVbxqqLv7oVwAIIZAa70EYAg==
X-Google-Smtp-Source: ABdhPJxVwwWkxsw6FKByqMz8rfOcZyIFcq+eCWSSVPh4iq7muettmAZQdnhXaqnsF4dT0Etk89a1R2E7+whZMQeJ/OI=
X-Received: by 2002:a9d:6b0e:: with SMTP id g14mr181079otp.214.1619713418279; 
 Thu, 29 Apr 2021 09:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210429155713.28808-1-michael@walle.cc>
 <20210429155713.28808-3-michael@walle.cc>
In-Reply-To: <20210429155713.28808-3-michael@walle.cc>
From: Alexander Williams <awill@google.com>
Date: Thu, 29 Apr 2021 09:23:26 -0700
Message-ID: <CACqsJN8mrHUB9Ls3PG5R_B84+xUjf-2VakA=09mP_bodWnUgmw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: add initial sysfs support
To: Michael Walle <michael@walle.cc>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Yicong Yang <yangyicong@hisilicon.com>, 
 Heiko Thiery <heiko.thiery@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_092340_498614_F7C6E926 
X-CRM114-Status: GOOD (  26.90  )
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

Hi Michael,

On Thu, Apr 29, 2021 at 8:57 AM Michael Walle <michael@walle.cc> wrote:
>
> Add support to show the manufacturer, the partname and JEDEC identifier
> as well as to dump the SFDP table. Not all flashes list their SFDP table
> contents in their datasheet. So having that is useful. It might also be
> helpful in bug reports from users.
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Pratyush, Heiko, I've dropped your Acked and Tested-by because there
> were some changes.
>
>  .../ABI/testing/sysfs-bus-spi-devices-spi-nor | 31 +++++++
>  drivers/mtd/spi-nor/Makefile                  |  2 +-
>  drivers/mtd/spi-nor/core.c                    |  1 +
>  drivers/mtd/spi-nor/core.h                    |  2 +
>  drivers/mtd/spi-nor/sysfs.c                   | 92 +++++++++++++++++++
>  5 files changed, 127 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
>  create mode 100644 drivers/mtd/spi-nor/sysfs.c
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
> new file mode 100644
> index 000000000000..4c88307759e2
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
> @@ -0,0 +1,31 @@
> +What:          /sys/bus/spi/devices/.../jedec_id
> +Date:          April 2021
> +KernelVersion: 5.14
> +Contact:       linux-mtd@lists.infradead.org
> +Description:   (RO) The JEDEC ID of the SPI NOR flash as reported by the
> +               flash device.
> +
> +
> +What:          /sys/bus/spi/devices/.../manufacturer
> +Date:          April 2021
> +KernelVersion: 5.14
> +Contact:       linux-mtd@lists.infradead.org
> +Description:   (RO) Manufacturer of the SPI NOR flash.
> +
> +
> +What:          /sys/bus/spi/devices/.../partname
> +Date:          April 2021
> +KernelVersion: 5.14
> +Contact:       linux-mtd@lists.infradead.org
> +Description:   (RO) Part name of the SPI NOR flash.
> +
> +
> +What:          /sys/bus/spi/devices/.../sfdp
> +Date:          April 2021
> +KernelVersion: 5.14
> +Contact:       linux-mtd@lists.infradead.org
> +Description:   (RO) This attribute is only present if the SPI NOR flash
> +               device supports the "Read SFDP" command (5Ah).
> +
> +               If present, it contains the complete SFDP (serial flash
> +               discoverable parameters) binary data of the flash.
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 136f245c91dc..6b904e439372 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> -spi-nor-objs                   := core.o sfdp.o swp.o otp.o
> +spi-nor-objs                   := core.o sfdp.o swp.o otp.o sysfs.o
>  spi-nor-objs                   += atmel.o
>  spi-nor-objs                   += catalyst.o
>  spi-nor-objs                   += eon.o
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 20c7ee604731..57d8a4dae5fd 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3349,6 +3349,7 @@ static struct spi_mem_driver spi_nor_driver = {
>                 .driver = {
>                         .name = "spi-nor",
>                         .of_match_table = spi_nor_of_table,
> +                       .dev_groups = spi_nor_sysfs_groups,

Putting these in the driver's dev_groups does create a divergence between
different spi-nor controllers. For all the controllers supported in
drivers/mtd/spi-nor/controllers/, would their drivers need to add the same sysfs
groups to get the same support?

- Alex

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
