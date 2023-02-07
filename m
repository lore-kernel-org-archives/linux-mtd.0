Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2600C636CD
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 06:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6K98dW06juvSyw6MJXXs/xhfIvLHxksyXxx3929ATk=; b=rOh3NtLTwWOQ/8
	8TXfOFWoFyuNfaLJGhuEHGyE7c5DWSgRpxZtNSgoaO5POtu97sIK+PVu5ciu9AytQPBurkH9nyusJ
	9v4KXUuHY2ILOJzcm9LFDbimqyFl9WqvwTmqFeJ1/7YFPfaxKjKg2a7j+40lxSQmbZ6gGBnhKfD0g
	KM0jKH9SGWKJKQFDhkMawV/BZfsfetKdqu4AyJRoToqW8kJR4n8p3uLzEXkvjR2X1dlzz0uNdN3aU
	ijjTaUX+O+gr5NYYulFJja0Ucxohika/uJFBpqIaiwBpbC8trx/BuZw92xi27XqG4SCwut6moKWnT
	Ihl64seLvFt6IB9rHzFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHm0-00B1sm-Eq; Tue, 07 Feb 2023 06:48:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHlw-00B1ri-Vy
	for linux-mtd@lists.infradead.org; Tue, 07 Feb 2023 06:48:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso12418647wms.0
        for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2023 22:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+/U+QeK9hEvR6ABz+IUCKA1l4N6KPAD5pigWZc0fCI=;
        b=PuElOJ85V+kFpfl3zu7zCKumBa64kSyH1+BScbb0uNTmSHsLoKEBVtlCQcoxSAASOr
         kzdOwtho7xSPQJ638hf/8BkmHQM3ghsoJOfZSnagx0kVzGk0PtjKB4++QsGlfES+s1oF
         L/xpGmzlhjFMLQZq5J46Fiirv2V63YA8P3gVSU56CeuIvaHQ3b4jPZ/IpwLXzaWuidNY
         YfcqmJPSo7AtuiMn5dGrneo1gPHQZ+OELT2dzmloA7f5x+pwvdWCxlFcj2/YV+7/h8+4
         of3pa1wV436yuX59pcLro+vfLxW3Cy4OxlhoCnzQFDeIeBrd+irSUt1XDUzqFPWPZNKV
         5kFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0+/U+QeK9hEvR6ABz+IUCKA1l4N6KPAD5pigWZc0fCI=;
        b=2Stda7arDMTRhUlO+jvRV2A8Fa2uO8zAGOl13VM09hC+YG9+tOLO1SMertZyBBr+0T
         /xSBb2BZqN3+Qw9FufBPw+GGpvkw7KQVxpCFMn5sXGML6IZcj2WjeVCThD9he9qDonao
         yrVeCxcbldggWOkSHKOL/uxg5mgvsCxVx0TtjxZTQ/VK6Nrh9u85FJOhksUKoUr9cAfO
         BRFjJLof/6+vnzEjf93/ttigBTBlShgWZ17RAObJCLPazbMIZqzyyjOHEVrsAnej46sk
         xdRD2hx26qwWN0mHuv5LRNfKk4wXo8MIZAo4bLmzeooGC00cRQi56My1fkBpiNbShAg+
         wsWg==
X-Gm-Message-State: AO0yUKW1ub2MuMWXUQkvfJ2vwPNyT1wsQAgRDjjR/FwmDLbAARsTH1iV
	S0y78FJcTD2zqeCqYx787kI4/w==
X-Google-Smtp-Source: AK7set8/0UZWOQVVrAPWQTpokDH093Y0jNluxoRsQ7HVW1Y5DviGGWIwbHisbRqsQTbbkAN+r4DDkQ==
X-Received: by 2002:a05:600c:44c9:b0:3df:f9e9:7600 with SMTP id f9-20020a05600c44c900b003dff9e97600mr2042146wmo.25.1675752486463;
        Mon, 06 Feb 2023 22:48:06 -0800 (PST)
Received: from [192.168.0.104] ([82.77.80.113])
        by smtp.gmail.com with ESMTPSA id s22-20020a1cf216000000b003dffe312925sm6097811wmc.15.2023.02.06.22.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 22:48:06 -0800 (PST)
Message-ID: <67e1d3af-d106-bd5c-f8d8-3f43a58975a0@linaro.org>
Date: Tue, 7 Feb 2023 06:48:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/3] spi: spi-cadence-quadspi: Add Rx tuning support for
 DTR mode
Content-Language: en-US
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Mark Brown <broonie@kernel.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, saikrishna12468@gmail.com, git@amd.com
References: <20230207060924.265789-1-sai.krishna.potthuri@amd.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230207060924.265789-1-sai.krishna.potthuri@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_224809_082732_9C8AB8AF 
X-CRM114-Status: GOOD (  21.32  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 2/7/23 06:09, Sai Krishna Potthuri wrote:
> Enable PHY and DQS required for Xilinx Versal Octal SPI to operate in DTR
> protocol.
> Add and update device_id field in spi_mem structure with flash id
> information. Xilinx Versal Octal SPI driver requires the device id
> information to perform the Rx tuning operation. Since there is no common
> Tuning Data Pattern defined across all vendors, controllers like Xilinx
> Versal Octal SPI which requires Rx tuning to find out the optimal sampling
> point for data lines, this device id information will be used as a golden
> data.

Using only 6 bytes as golden pattern seems fragile, but you are aware of
that, as I see that you chose to read the ID 10 times to make the
decision whether the tap is valid or not. Other option (which is not
perfect) is to use SFDP data as golden pattern. If I remember
correctly, JESD216 suggests to use the Read SFDP cmd at 50 MHz, so it
won't help you much. In practice SPI NOR uses the Read SFDP command at
the flash's maximum speed and we haven't seen problems. But better would
be to use some flash OTP data maybe? I remember Pratyush has submitted a
phy calibration series in the past, I haven't had the chance to read his
proposal. Did you? How's your proposal different than his?

Cheers,
ta

> The reason behind choosing this approach instead of reading the ID again
> in the controller driver is to make it generic solution.
> - Other controller drivers which want to use similar tuning process, they
> will make use of this ID instead of reading the ID again in the driver.
> - Also, we can avoid hardcoding the command information and initiating the
> transfer in the controller driver as this should happen from spi-nor.
> 
> Sai Krishna Potthuri (3):
>    spi: cadence-quadspi: Add support for PHY module and DQS
>    mtd: spi-nor: Add and update device_id field in spi_mem structure
>    spi: cadence-quadspi: Add Rx tuning support for Xilinx Versal OSPI
> 
>   drivers/mtd/spi-nor/core.c        |   1 +
>   drivers/spi/spi-cadence-quadspi.c | 226 +++++++++++++++++++++++++++++-
>   include/linux/spi/spi-mem.h       |   4 +
>   3 files changed, 230 insertions(+), 1 deletion(-)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
