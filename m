Return-Path: <SRS0=VCdk=4S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F56C3F2CE
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Mar 2020 10:04:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5342821775
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Mar 2020 10:04:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z/rJAv2K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="WFURwnTZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5342821775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nDV8tzmUQLL0VKR+jPXFeytWUx1wo8yUxJUcIqz3mz8=; b=Z/rJAv2KY0+xyqt+KjdUDn9UG
	LfosiDhl08FP9tph9R0rQQMPYNciLjgcO2sHgIolfLGG7LJg0QJiHgDxHnwYq/okQQBQSDjTO5TwC
	PNQoKBDEGMA8kawcg+rV0ZlWvhrfJ3angQsc43BdXC2SXrlfEc3J/pESYD9dGbY8VgKVFBuPX+Iti
	MJo5P7z/DUqvAQwW8lxePSKu8Fzqej4/kK6+iLch0ws2G+e4Jwe4WZmME2PE3QJKq/bjbpcS3ic79
	R8E0C8MsXBMUMle1H532aUAzgRgQauTQ5gRoZ7CGsykAUcQzV1jKVb+VE/uaGvaGC88pDQMQeE1rz
	DtDvrxbSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8LSK-0007iH-BR; Sun, 01 Mar 2020 10:04:16 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8LSH-0007hh-Jx
 for linux-mtd@lists.infradead.org; Sun, 01 Mar 2020 10:04:15 +0000
Received: by mail-lj1-x242.google.com with SMTP id o15so8409374ljg.6
 for <linux-mtd@lists.infradead.org>; Sun, 01 Mar 2020 02:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gQOIXTEcnm6Zvy+v64CfP+Ch3mLFqBCQbXn3Tlz+cv4=;
 b=WFURwnTZQb7t133i6Ra+Rtg1WBZedlcLlLHCZn4uC75JNmyONO8Bj0u4Tbnk83la/Z
 qwMSzQBjsRNhGPCXMXUAlfenimSZGTMwJbTHXDTHnEHcUAb9hhWXtz8ELtd/1ktdMWHz
 q9PsTs1FbNVOH++uTHZStEGLEkHWtJG6yvJcHUzPqY/HyLX3uYPY2X09CaaI9Kj9CfOy
 Abw/ZiBYHclQfm2cpwWyKvV1NQNW35y+KW807sdzw0ylxlMrEH+nFUP++FVD/5RlJCfx
 X3MUBzk4HezPioiqEd+JdKaHp+aXd8MCs36eJxwm01Fl/u6hPoy4TTpONB0X3aB6KwbC
 oqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gQOIXTEcnm6Zvy+v64CfP+Ch3mLFqBCQbXn3Tlz+cv4=;
 b=BNEBEZPLlADhPp2OpSrYxdkp15dQ5vey70B2/24YQWsdnk+6a7AAD9gZywNwZ7Tuep
 vxO/fD4vskyzBCixjcnYAaZGqE30+j4u9YDksgXOLfpo/SrkhbFj/oibirRLVv5KEtMu
 /P/zvtH73KEMDvCorYprh0bVtp/DjYEm4vaLCAAD07+kIEaKImTD19BVh8dqICy+sriG
 qQzLPDcODq1GNm5EmfFOzcDideVc9H28qai6pvJthzKyLfYzBfYMlsTXMYzn5FpHwG3d
 CUfMoHuXixIDx+qfYHIYMNxOfv//+S7ynrrYtOYapo10SNAEYDO64OuicN6XMK+HYTeF
 lQDg==
X-Gm-Message-State: ANhLgQ0sY5mIt8ZAdbwTOQiOHVsHV+PMQlMm7IM0hXTZodhreYC3sL5p
 YTIzIypdrCXMNCo6ENOwEMIMfA==
X-Google-Smtp-Source: ADFU+vvqjg4oqW6Uft9xNiaGvdKNChYfA3uFUApT5e92F7fDueZjTaYxnnQS6pWe+xILajfzC2Bmmg==
X-Received: by 2002:a2e:884c:: with SMTP id z12mr8320982ljj.55.1583057050588; 
 Sun, 01 Mar 2020 02:04:10 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:631:be36:41f9:a0d4:22df:3c65?
 ([2a00:1fa0:631:be36:41f9:a0d4:22df:3c65])
 by smtp.gmail.com with ESMTPSA id i1sm9597287lji.71.2020.03.01.02.04.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Mar 2020 02:04:09 -0800 (PST)
Subject: Re: [PATCH RFC 1/3] spi: Allow SPI controller override device buswidth
To: John Garry <john.garry@huawei.com>, broonie@kernel.org
References: <1582903131-160033-1-git-send-email-john.garry@huawei.com>
 <1582903131-160033-2-git-send-email-john.garry@huawei.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <52ecb988-d842-c04b-a0e8-93e8850009c4@cogentembedded.com>
Date: Sun, 1 Mar 2020 13:04:07 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582903131-160033-2-git-send-email-john.garry@huawei.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200301_020413_735032_877885B9 
X-CRM114-Status: GOOD (  18.32  )
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
Cc: linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
 linux-mtd@lists.infradead.org, linuxarm@huawei.com, linux-spi@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 28.02.2020 18:18, John Garry wrote:

> Currently ACPI firmware description for a SPI device does not have any
> method to describe the data buswidth on the board.
> 
> So even through the controller and device may support higher modes than
           ^^^^^^^
    Though?

> standard SPI, it cannot be assumed that the board does - as such, that
> device is limited to standard SPI in such a circumstance.
> 
> As a workaround, allow the controller driver supply buswidth override bits,
> which are used inform the core code that the controller driver knows the
> buswidth supported on that board for that device.
> 
> A host controller driver might know this info from DMI tables, for example.
> 
> Signed-off-by: John Garry <john.garry@huawei.com>
> ---
>   drivers/spi/spi.c       | 4 +++-
>   include/linux/spi/spi.h | 3 +++
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 38b4c78df506..292f26807b41 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -510,6 +510,7 @@ struct spi_device *spi_alloc_device(struct spi_controller *ctlr)
>   	spi->dev.bus = &spi_bus_type;
>   	spi->dev.release = spidev_release;
>   	spi->cs_gpio = -ENOENT;
> +	spi->mode = ctlr->buswidth_override_bits;
>   
>   	spin_lock_init(&spi->statistics.lock);
>   
> @@ -2181,9 +2182,10 @@ static acpi_status acpi_register_spi_device(struct spi_controller *ctlr,
>   		return AE_NO_MEMORY;
>   	}
>   
> +

    What for?

>   	ACPI_COMPANION_SET(&spi->dev, adev);
>   	spi->max_speed_hz	= lookup.max_speed_hz;
> -	spi->mode		= lookup.mode;
> +	spi->mode		|= lookup.mode;
>   	spi->irq		= lookup.irq;
>   	spi->bits_per_word	= lookup.bits_per_word;
>   	spi->chip_select	= lookup.chip_select;
[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
