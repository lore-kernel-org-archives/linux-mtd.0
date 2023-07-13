Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD60BEB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 02:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29RJf3DKmHHLU//Nsbqa9g5x4XyeExC5WaRIQ0Wqn0U=; b=rQPbGGPhqHZjFR
	V23GDnoNpiQItH80I3o/pDElDTwXxw/mCExVPzZHx9UDurv0OH22MHGSHW1xBI+FY5hvX6k2RLVRE
	0IRqbRprCr7ljTY2sGFmihrRkgSlmBraczkQd3eRMp/gPxgfrSkb6hKRdhxUunrb88ftV9NVK9p3j
	D+W66JGSvTsj1+8fS5g4BQ1PeBuVy9wHHudHunFip4h/wASLkzibjGIYCQpBYEVPmY3W5vbmWMsRp
	0QPSbvJ5kM3DtR4ht20IK9IKve3RXOnxY9kd7M3lROETv2zAAAgmfZXt8BPHIQvjwrKPUQWbnejS7
	AMO/yriVjBW86XmkQklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJlw9-001iZR-2X;
	Thu, 13 Jul 2023 02:20:09 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJlw6-001iX6-2H
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 02:20:08 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-991f956fb5aso35422466b.0
        for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2023 19:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689214804; x=1691806804;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4n3p2X71+xdc4XAHpj3SJiUOwiTWi+d77tIPhmmUO2k=;
        b=sH6izrWMpyX66iU3zZYV4UypiWXCZR0ZDt3aDuR18tcIYTltpdWE53RgUEom52YXt2
         s2VhZbvpcPQQ1r7Ul0O2gE7+NFqGIOoWunjwiUdEVGWRnkx5tDRoCqeRjUTiO+4wrFs/
         pgaNjXwuQe9hC2GaVd8uVFtrU9VdKgxYMpmvSnx4RPEKCKJdwiA0JGKVZ8qNf6KYdE/W
         5AiAgRP0pBQ/z4hd0Kcy78kdkt1r8K+nHZqURw44dNPkYuH9PeI6ufv7DWJFOSnyQsZq
         fJ0Z0X4jgidOOsT0tkRkp83cuyLLjLl10ja8CVl3V4GP4XMpHSuI5L82hMHkjjUD3Df8
         3QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689214804; x=1691806804;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4n3p2X71+xdc4XAHpj3SJiUOwiTWi+d77tIPhmmUO2k=;
        b=WAyPvFQNr7hT7RK/32ipW8t98dGWa8aQhb003n6z/L3L9rUjVO/gNZ4o2Qu/UIn3un
         Q1wj6Gxix4Aay7zpzYBon1khuOvBDo9S2Ginr6i5ST/i9+hsYPgOQsMjAEm0Z1+ncjxs
         IT/u23h+SxIn2Itnatf8n/FwfQRHkKmGtdjpCrMV/GwDEdtWgJH3KDweMr4eDlhDtVnw
         OxJG4PrDE8J4DwTA2EmOc0ETA9WwKeEHaaa8O+wvw8bJfdIHC1RFtplSENyA2BcFLxHG
         b6weLg8ePCRYIoZOrJxWvmsfjH+maXgBxIJX8CYLobIYataE+9sVtF946tvrLi5ahFDF
         TDBQ==
X-Gm-Message-State: ABy/qLYEdznPxeTDuHSkOVseII5LyNs0AgcX3cQeV2me4K50scy4Neon
	Pdhq+vxPCbU7igcNeGCeY6mbkQ==
X-Google-Smtp-Source: APBJJlHedINiWwZfqKJgnsVB6Q//8myXXJ8uyAZwZ3JdryAEyhOOx5vJa75STHzSEt46z56vMV7opw==
X-Received: by 2002:a17:907:7656:b0:993:c267:3612 with SMTP id kj22-20020a170907765600b00993c2673612mr111581ejc.12.1689214804125;
        Wed, 12 Jul 2023 19:20:04 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id mf12-20020a170906cb8c00b009893f268b92sm3328763ejb.28.2023.07.12.19.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 19:20:03 -0700 (PDT)
Message-ID: <8b7d2420-26b6-405b-8ef7-75e0a0201402@linaro.org>
Date: Thu, 13 Jul 2023 05:20:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] mtd: spi-nor: Add support for sst26vf032b flash
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230712161503.448024-1-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20230712161503.448024-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_192006_770949_04D3643D 
X-CRM114-Status: GOOD (  22.26  )
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

Hi, Miquel,

On 12.07.2023 19:15, Miquel Raynal wrote:
> Describe this new part. The datasheet is public.
> 
> Link: https://ww1.microchip.com/downloads/aemDocuments/documents/MPD/ProductDocuments/DataSheets/SST26VF032B-SST26VF032BA-2.5V-3.0V-32-Mbit-Serial-Quad-IO-%28SQI%29-Flash-Memory-20005218K.pdf
> 
> Here are the sfdp tables plus base testing to show it works.
> 
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> sst26vf032b
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> bf2642
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> sst
> $ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450060102ff00060110300000ff81000106000100ffbf0001180002
> 0001fffffffffffffffffffffffffffffffffd20f1ffffffff0144eb086b
> 083b80bbfeffffffffff00ffffff440b0c200dd80fd810d820914824806f
> 1d81ed0f773830b030b0f7ffffff29c25cfff030c080ffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffff0004fff37f0000f57f0000f9ff
> 3d00f57f0000f37f0000ffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffbf2642ffb95ffdff30f260f332ff0a122346ff0f19320f1919ffffff
> ffffffff00669938ff05013506040232b03072428de89888a585c09faf5a
> ffff06ec060c0003080bffffffffff07ffff0202ff060300fdfd040600fc
> 0300fefe0202070e
> $ md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> e7efddddb3d5ee89ca37bf6b6e789645  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 
> $ dd if=/dev/urandom of=./qspi_test bs=1M count=1
> 1+0 records in
> 1+0 records out
> $ mtd_debug write /dev/mtd0 0 1048576 qspi_test
> Copied 1048576 bytes from qspi_test to address 0x00000000 in flash
> $ mtd_debug erase /dev/mtd0 0 1048576
> Erased 1048576 bytes from address 0x00000000 in flash
> $ mtd_debug read /dev/mtd0 0 1048576 qspi_read
> Copied 1048576 bytes from address 0x00000000 in flash to qspi_read
> $ hexdump qspi_read
> 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
> *
> 0100000
> $ mtd_debug write /dev/mtd0 0 1048576 qspi_test
> Copied 1048576 bytes from qspi_test to address 0x00000000 in flash
> $ mtd_debug read /dev/mtd0 0 1048576 qspi_read
> Copied 1048576 bytes from address 0x00000000 in flash to qspi_read
> $ sha1sum qspi_test qspi_read
> 2f2f191c7a937eca5db21a1c39e79e7327587cc1  qspi_test
> 2f2f191c7a937eca5db21a1c39e79e7327587cc1  qspi_read
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> Changes in v3:
> * Dropped the second patch (untested changes as advised by Tudor).

thanks
> * Avoided playing with locking as I cannot test it either: simplified
>   the diff by just using the PARSE_SFDP flag.> * Rebased on top of -rc1 and adapted the patch to the current state.
> 
>  drivers/mtd/spi-nor/sst.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index 688eb20c763e..754e49f7ac33 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -111,6 +111,8 @@ static const struct flash_info sst_nor_parts[] = {
>  			      SPI_NOR_QUAD_READ) },
>  	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
> +	{ "sst26vf032b", INFO(0xbf2642, 0, 0, 0)
> +		PARSE_SFDP

if it's just a matter of PARSE_SFDP flag then this flash is a candidate
for the SPI NOR generic driver, we don't need an explicit flash
declaration for it.

But I assume you need
.fixups = &sst26vf_nor_fixups
otherwise the flash comes write protected by default at boot, thus
erases/writes will be ignored. Are you positive you run the tests again
for v3?

Cheers,
ta
>  	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128)
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
