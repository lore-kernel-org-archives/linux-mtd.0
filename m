Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF84CEB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 08:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=StdLWL07tgzuX830HHEu5DJCrqaKAmbGbj1O3LVBnpo=; b=bCENYfUrocdFJD
	usdpyqnit8t2HAIfgHqOVajPUauyNUUGSeL0DmSgGNudGCDEvibe4RK3O5CaIYVn1ow6aC/i4SCGf
	BBJYZNWls5DTh8cszIb6NKC7P1iXaUrxQIdJI1QbNOCJGe4YK/36Yi0lmAfV4l6aT2qPeKOuAgW08
	4V+nsbbKaskBbDERWP/jXIBItcfoDs+j7rjblWbe23O1bEQVQv/GkvHbzGSwBJnFIikg6bVPXK6nm
	1nwORIhAiGO+3Vlr/7/yRekpjgmlba9ch8P4TIkqphgYkEp77K8Q6u9ZGgKteesluVBsrxFQF5cCS
	ndE8Om8iuW4iYZN7jHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBA5Y-007nkI-23;
	Mon, 19 Jun 2023 08:18:16 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBA5V-007njl-0g
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 08:18:14 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-986d871a9beso405015666b.1
        for <linux-mtd@lists.infradead.org>; Mon, 19 Jun 2023 01:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687162691; x=1689754691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5cPU5hqdoBEBLIImdtKTB16KOoH3yVW9P728pqTIE2E=;
        b=ekEDWvmA1zSJ4vbvR5yIutGdDRjs7vPDCpmGJW6EZtjwLV7DYrtbBNMXBBDwZ+Vo4B
         qN4svUpqJbtq6yeIe210JTQrq1ThUfk04cDVsO6SX7UreHU5sssvE1vb0TO2iQvm0tgW
         ayrKtODxw4XGty9ryPwkuP9L+b3EC/pciA6uaeNCodhyx8NAlJFDsx1HZTpr+7vRb85p
         YkJuJ8k9eTykf4+PgfWLxSez4Cv5BZOh7dI4aR8scUrkYLoascam/HQk6id3fLibjDNt
         yrrG76eOIagGoQo+ofWp9UPV5UwVd4b+fKYi3tWol+CmmZtqN9918FyKaGY3THNmeF12
         MQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687162691; x=1689754691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5cPU5hqdoBEBLIImdtKTB16KOoH3yVW9P728pqTIE2E=;
        b=aLq3k9jiM/IIEnI3v2wGb48tCIkicqOgD6MiPzMMo5Vki0iu7QVBV+uElHl+jy/RU5
         4pWIv1+YZngAsY3gz+WCanp/OmnUqfwKCzyogkK/7/ys2sAzxyV7ZHj2XGAdQ9epTMHi
         ALs+yY5hPCB3fia8OWAmZtN7QL+VnT5fLpHP8jYm9QqT/v2OPT4asSQ2cx3F4RbI2cDZ
         D4JXj9uC909K0WIvqTS9YGtXDReakwmbw2rTkrYFRzdBTGFydI3U+y5k2oeeu4DXifot
         RfmhLeCFWJ3pW4vtXWRGkkXt1W0Vkrije8GR0j8WPuGpTEBHg61V2AST8ClBhGvf8lGG
         1GyA==
X-Gm-Message-State: AC+VfDyE3PAJVUsmtuuBHJxzQZM6fTRVperfXQ2LdXQ6MNInGZ5NTd/x
	IqtKwaBUqrOIzyfLh807SkdBzA==
X-Google-Smtp-Source: ACHHUZ6Gi3LV8Eln7qRClrqdm2tgnCHWcBZv8zrdYpk9AFdtcOvDYUSmXlXovo+9cwvHfe1QnQ4BLw==
X-Received: by 2002:a17:907:3d8e:b0:982:9f31:ee61 with SMTP id he14-20020a1709073d8e00b009829f31ee61mr8786757ejc.66.1687162690974;
        Mon, 19 Jun 2023 01:18:10 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.157])
        by smtp.gmail.com with ESMTPSA id w26-20020a17090652da00b00982d0563b11sm4989351ejn.197.2023.06.19.01.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 01:18:10 -0700 (PDT)
Message-ID: <1be26eee-2dbe-ecd4-2a08-16ec7c5c78f9@linaro.org>
Date: Mon, 19 Jun 2023 09:18:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: Add support for sst26vf032b flash
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230616140822.2789638-1-miquel.raynal@bootlin.com>
 <20230616140822.2789638-2-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230616140822.2789638-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_011813_258756_416C359F 
X-CRM114-Status: GOOD (  19.50  )
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

On 6/16/23 15:08, Miquel Raynal wrote:
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
>  drivers/mtd/spi-nor/sst.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index 99c8a19493f5..48970d2f78fa 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -113,6 +113,10 @@ static const struct flash_info sst_nor_parts[] = {
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ)
>  		.fixups = &sst26vf_nor_fixups },
> +	{ "sst26vf032b", INFO(0xbf2642, 0, 0, 0)
> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> +		PARSE_SFDP
> +		.fixups = &sst26vf_nor_fixups },
>  	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128)
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)


Looks good to me, I'll queue it for 6.6.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
