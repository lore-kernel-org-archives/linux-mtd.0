Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C46C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 06:04:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D19120702
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 06:04:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ckCfjaPX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="G0G3QKuW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D19120702
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y9QtYcVRDFsfFKn4/41E8128z+/2gdRp9KRV8T9BcW8=; b=ckCfjaPX2qVPiWzNA5DEZsJgS
	0gU3iBuwUj3b+xCHtVVXK8trHKhDZxtYgMxEQGM30APrDmSA+b2Txpj0Gh9b+HA3IIZP4EnWKekbW
	SO+hsAiD7LuQUTCRXNMYlmJ/OO4YlpfT2JjATUxLlxg/Neh7k6tt/MWDeR5X9YspedZzmLViC/fKY
	knT9iIgg0uUpGgbPMW2xm7z7ziribx4bggntqHI6OT/W5jzOvCrE/2x7t/Afvbh/QU5FK+XPTFo5q
	0EJFHWGlRnIhoYJ5n/oJ4zYvxOxXYF/1gx20Q7h6fP+HnwqG0YO2TfcRm4/TEfgrHj3CJjz3dHkn9
	kBmMc1ePA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsgiA-000088-ME; Tue, 07 Jul 2020 06:04:10 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsgi5-00006i-Iw
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2020 06:04:07 +0000
Received: by mail-lf1-x142.google.com with SMTP id d21so24046573lfb.6
 for <linux-mtd@lists.infradead.org>; Mon, 06 Jul 2020 23:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UZZfuoHBs6UPr1tWf4DyOh5v+PqYB3B2WwbMcZ/xTQ4=;
 b=G0G3QKuWd6xOkxDOw6USZb4n6oCxxPmZWNq/guSOxlAl6VlpVmBqxHZ61L96aLMc8U
 Yg6RLBFj1duBvMZdUtqXpCBwzS1P3iD+fsa/FHv/Of+fNYYOkWjPn46fY60/nx2vM58x
 BP89ovi4Qwb+opQ7neeZ7nCEOaAZuw+twJGgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UZZfuoHBs6UPr1tWf4DyOh5v+PqYB3B2WwbMcZ/xTQ4=;
 b=dlQdXcFmNqXp3jbMaZNQoWIov54Dijge1HeW2rWV8qhlFcHa+FUC/bjN4DLDPrdoWT
 Vmk+/k/6Bv8CsH2YzEOVPz5epZYsoty/+6vbiZc7xRU0k917I0GvbtmKNWTugXnpXi06
 al6MUJw+BCSBqRsw91c9m4WJHWhunDm3AsbqNaftRtGKxVIoU69VAfMWnYmMo47U8K7P
 DUYekKHLSdRZLSIvRHSBEXzvKsGxjiLPRskSPRuyhr87opnbU0c9z7hhsVOMsmxLFkt+
 moDETG29+HtHHoy2gejnRbzjlAJsyYAxbRDC8fFZ0okyPHw+Xe43zQrOgLGLwkvOPguS
 PeBg==
X-Gm-Message-State: AOAM531O8U9rHVlgrI7X1y49N5XxOr4HU/cWBh2X06BdpvKtCqO0TRkf
 WTc01UdJaWyd0E4Z5fc9Y1rsShn3AQYVU2StTHY9tg==
X-Google-Smtp-Source: ABdhPJzxmwvqREl7NOVxuGKyaJKb1ZGT35t2pGwTUaSaxw5RyPOzOIeMQ3BFzgVfB8J0dfix80VsZRRnWDvW8/xjGlQ=
X-Received: by 2002:ac2:5f0b:: with SMTP id 11mr31805351lfq.201.1594101842863; 
 Mon, 06 Jul 2020 23:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200529071655.739-1-rayagonda.kokatanur@broadcom.com>
 <2c308101-ba40-2dd4-7304-7e2e29e9aa64@microchip.com>
In-Reply-To: <2c308101-ba40-2dd4-7304-7e2e29e9aa64@microchip.com>
From: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Date: Tue, 7 Jul 2020 11:33:50 +0530
Message-ID: <CAHO=5PFyjHJvvy-=exL86OnESH7ypUffyt3bcmQJspzJJ5gO-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] drivers: mtd: spi-nor: update read capabilities
 for w25q64 and s25fl064k
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_020405_930015_9CCDD4B1 
X-CRM114-Status: GOOD (  21.02  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jul 1, 2020 at 12:21 PM <Tudor.Ambarus@microchip.com> wrote:
>
> On 5/29/20 10:16 AM, Rayagonda Kokatanur wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Both w25q64 and s25fl064k nor flash support QUAD and DUAL read
> > command, hence update the same in flash_info table.
> >
> > This is tested on Broadcom Stingray SoC (bcm958742t).
> >
> > Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> > ---
> > Changes from v1:
> >  -Address review comments from Vignesh Raghavendra
> >   Update commit message with testing details.
> >
> >  drivers/mtd/spi-nor/spansion.c | 3 ++-
> >  drivers/mtd/spi-nor/winbond.c  | 3 ++-
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> > index 6756202ace4b..c91bbb8d9cd6 100644
> > --- a/drivers/mtd/spi-nor/spansion.c
> > +++ b/drivers/mtd/spi-nor/spansion.c
> > @@ -52,7 +52,8 @@ static const struct flash_info spansion_parts[] = {
> >                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> >         { "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32,
> >                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> > -       { "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
> > +       { "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128,
> > +                            SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> >         { "s25fl116k",  INFO(0x014015,      0,  64 * 1024,  32,
> >                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> >         { "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, SECT_4K) },
> > diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> > index 17deabad57e1..2028cab3eff9 100644
> > --- a/drivers/mtd/spi-nor/winbond.c
> > +++ b/drivers/mtd/spi-nor/winbond.c
> > @@ -39,7 +39,8 @@ static const struct flash_info winbond_parts[] = {
> >                             SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> >                             SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> >         { "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
> > -       { "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
> > +       { "w25q64", INFO(0xef4017, 0, 64 * 1024, 128,
> > +                        SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>
> I checked the winbond website and from all the w25q64 flashes, W25Q64JV-IQ/JQ
> and W25Q64FV share the 0xef4017 flash ID. Both support 0x3b and 0x6b commands,
> which is fine.
>
> I see that s25fl064k and w25q64 share the same flash ID. The search alg will
> return the first hit, so s25fl064k even for the winbond parts. What is the
> difference between s25fl064k and W25Q64JVQ/W25Q64FV?

I think both are from different vendor.
Please refer link for more info -
https://lore.kernel.org/patchwork/patch/628090/

Best regards,
Rayagonda

>
> Cheers,
> ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
