Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E65C4725D
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 06:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bnvLcT+S6csJRD6u5aWvHXifjZNvKdmCQtVLquvsODI=; b=c8mVkBNK0ecoKi
	AjX/e7gHMaXQsdmKpcyWoNnTG6TvruuqcGGuMjI79PTPg2zXSa4pq8SCT6HDAKxnWs+6J6bU+GyLk
	E5GfFp/D4XYK8/k1+wvAcw/SXfdG+6uvJrZNqtJ/+0GRNfS0eJ4DaMOJl1hsIeVG685j9TDyYq0Ze
	xT8Lf7GEP6pBd51w3h96PHN46pIhY1oOCeApuY6GGLAjhcAhhC4mqkjAvJN/2/PKL1xcXDsaSYiHZ
	yTxHySDjeUFDz5BAV2jEsdNvDr5HNj60bV0a5Ob5F7rElV15Py/NSappmf7n6UwHNKsEJVh0dcOf4
	J4CDcWGnLR29xVEly6Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRnXB-00AhGP-0Z;
	Mon, 22 Jan 2024 06:11:49 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRnX5-00AhG1-1X
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 06:11:47 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a30359b97a8so69410166b.0
        for <linux-mtd@lists.infradead.org>; Sun, 21 Jan 2024 22:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705903901; x=1706508701; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RIcaNbIbYjZhJZaFVFa9N/62Fsv5I4TrG8yXnt0PL2o=;
        b=kQgj9jtWsSyA4ZpHHfwOQomg420VPf9dNeShSsmVveLxXFSkm3hfjFzgDamlYdm+J5
         osSG/MLOsmsEdwLk7LOkXL7+UEPoZIvmlvWcrOqujV+0ET4ilWcLt+ddvX30Q3Zre7Je
         DpVMsdQFqObzuHasUSjWDIBkzKPBQdl/GsiLu6l/4rSeP7o/eFdGrlQUEiT7uNA21Thl
         3shugJ7ooC6LylOCxr58MkHehuTPI4FSBQBwvtkQ5k7Gxp4LjWHHD0WjL5GujNvlf1KQ
         4YT85PQDIv6vdju1OA/Zu3U/GOATikoVlLjbpbpuZpN8OQ6UfuiFwi1VCV3AXdDNDJtq
         XNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705903901; x=1706508701;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RIcaNbIbYjZhJZaFVFa9N/62Fsv5I4TrG8yXnt0PL2o=;
        b=t+Dgqkr2hmBoH0nq8RPNHEo4hk+tPyZbRXi7AmTWSP2DwfoyC84Ht5FUcLDpKepvo+
         4WvqDdOUpJApQEW69i8CrRVvBmxlgckSgkVmkIgB/+2EYYo9KXlLfgUrPNpKlW/d4+zh
         48O/aarvTgJj0IhWmVYkQSOIFQcc7oIdRAqDMKVvfIaAuxss9frVnGlBqz4qenJ+IGUX
         vJnSFcurDZO9g6nFiTeImOBuTASkBQ+g+3P+GztlHzNN/Kq+T86zjS9f4FSg8SWoNRUw
         HmtDDNDv8ny6W5URjbHpfNmEO47WE9ZEYLQIQ3PtCOlwaUIkJZ/EJm4RZlO6+/wxuVNX
         CVgw==
X-Gm-Message-State: AOJu0Yw8pK1rct+IGtiVMwMiMb5QFdUDhg2yRh41B6xvm3cemG0r0q63
	tAuFa3Aewxa3aD8Q95WqIbqhFQn+JVddVymeb3Z00M08OWAj+2OX80xatD1HI0E=
X-Google-Smtp-Source: AGHT+IFSFZsZFRemCFZuOlTP3Z1DcCiYWF6dB5Cw4RmXxg5Rs8bDDiKyLhYhZPNfo+Z7CiK9NIWnrA==
X-Received: by 2002:a17:906:a008:b0:a2d:edc:de0 with SMTP id p8-20020a170906a00800b00a2d0edc0de0mr1830242ejy.76.1705903901476;
        Sun, 21 Jan 2024 22:11:41 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id wr8-20020a170907700800b00a2e08b24ea3sm8373350ejb.174.2024.01.21.22.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jan 2024 22:11:40 -0800 (PST)
Message-ID: <158830c6-d492-4967-a543-c0f5f8428d8b@linaro.org>
Date: Mon, 22 Jan 2024 08:11:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mtd: hyperbus: Add support for Infineon S26Hx-T
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, sergei.shtylyov@cogentembedded.com,
 geert+renesas@glider.be, Mark Brown <broonie@kernel.org>
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
References: <cover.1680663252.git.Takahiro.Kuwano@infineon.com>
 <d94273b2-9516-2b80-308f-9fd1fdd2b4d5@linaro.org>
In-Reply-To: <d94273b2-9516-2b80-308f-9fd1fdd2b4d5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_221143_538711_6373445B 
X-CRM114-Status: GOOD (  12.05  )
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

+ Sergei, Geert, Mark & linux-spi

Hi, Sergei,

On 23.05.2023 07:22, Tudor Ambarus wrote:
> Hi, Takahiro, Vignesh,
> 
> 
> On 07.04.2023 09:11, tkuw584924@gmail.com wrote:
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> This sereis adds support for Infineon S26HL-T/S26HS-T flash family.
>> https://www.infineon.com/dgdl/Infineon-S26HS01GTGABHM020-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c7f2a768a017f52f2f5182c91
>>
>> This family supports two interface modes, SPI mode and Hyperbus mode. The mode
>> can be switched at rutime. The default mode is selected by ordering option
>> and non-volatile user configuration. In hyperbus mode, the device is compatible
>> with S26KL-S/S26KS-S hyperflash family that supports hyperbus only so one of
>> use cases of S26Hx-T is replacement of (or migration from) S26Kx-S. This patch
>> set focuses on particular usage that the device is pre-configured as hyperbus
>> mode for compatibility with S26Kx-S.
> 
> I'm questioning the overall hyperbus software architecture, not your
> patches per se. IMO hyperbus framework should have been written on top
> of SPIMEM and the controllers be placed in drivers/spi/. So I'd first
> address the SPIMEM adoption before adding/accepting new support. Would
> love to hear more from Vignesh.
> 

RPC is the only multi IO SPI controller that's upstreamed and capable of
dealing with hyperflashes, but there are others which are not upstreamed
yet (microchip).

Struct ``struct rpcif_op`` [1] duplicates the contents of ``struct
spi_mem_op`` [2] which could have been avoided if hyperflash driver was
extended with SPI MEM support. This way the RPC hyperbus driver, which
is an SPI controller, could have been moved to drivers/spi.

Sergei, do you remember why we haven't used SPI MEM for hyberbus since
the beginning? Was it something that we aimed for in a future patch set?

Thanks,
ta

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/include/memory/renesas-rpc-if.h?h=mtd/for-6.8#n22

[2]
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/include/linux/spi/spi-mem.h?h=mtd/for-6.8#n99


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
