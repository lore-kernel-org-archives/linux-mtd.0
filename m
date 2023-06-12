Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D1AC7EE2E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 09:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYkNf6N6xcr6P1se4eaCPn2I/lJTpzFwEYD9XrfWeF0=; b=1eMt+V0lO2wyiI
	QALT0nrCz+apWaUacIwh9BorLz/4n7gPKERKPEdPK0nOyGnEctHM166wJKSLxM30lSmPbq5oAuP/H
	engnbntS0pQa7zSDCx8b9ndCqADeMi2+WebASA5wLHoCDdq6tq97AiF/GPNKbicUEGFwJKWZBY5FJ
	EPoNbpnAfJnzh7dtmF7ltfvEcWQ8Ib8jXPdYB2cMORA2ZbrmceTtu2/oDXlCVGpUEaBSBCrjYpRA5
	oFE/YKNW1erar7DQ8afnp4ZqajMeVUHnf1mS7tbwnOEeMyK7o/2W09RETkXJMKokPj4fa5kvbvAzd
	nLLFFgIzYO/E84IXeyfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eIO-003OOl-1P;
	Mon, 12 Jun 2023 09:57:08 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eIL-003OO4-1t
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jun 2023 09:57:07 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f655293a38so4405165e87.0
        for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2023 02:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686563824; x=1689155824;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AhoB3ALj7H7qpQhLC6O+NX79N+bwK/GWfxrVkpc2ZkU=;
        b=HXZW+3ixlUzQEiOrY1kWyDQBYMHCE0DjLosTb04wKryhn1dnwEEB5SPl2ip94eJBKF
         5RfrUTbgBs4XbvMLiqXi/ASZ2xl8gRwh4GNUXmCx+Kb64RRRYjeZkqQg63FzvDjKSQdA
         ZNqzMP7VqreaInw2ip6mJoLwO5E8KwUux6+4+1+OlitCLkm/F2vvlmaIpkqOsFkfwbr/
         Z3PVwf9akRZtr3J+IQvVTs78DlQ/eckv/qEt/w33YVEQCXQw10oNB57ScVY9wI0q+9q/
         Z/1Mjqh4gJn32BFuGoLbpdxQiFhrj9nsArClxQ43/0jwcM1I1iWO7YdQk20kHP8o3yv/
         6I2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686563824; x=1689155824;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AhoB3ALj7H7qpQhLC6O+NX79N+bwK/GWfxrVkpc2ZkU=;
        b=Ht0YOcg5SDrPcSFOgkbdNTo5qf1SiQn2zH/wjBcsyRQ7TJ447R0wN7tgYvqc9sT4wF
         ev9MPnpEQryqrwzD2awIYN4/vuLACp0POV+T1d1D0b918LP3LknTOLV02CRL6Q77P9q2
         e0F+ypDvSVZUOrGGs6CsdeIWBzXZnXc3CRg9zMH3R9teCXY84iCEeRQtcQgmLG/5Pq4k
         Ld2fENNBCbjFmOq2tzmQ1fdIyWQD+4n1SUvGO6lLVPDCb3/YnYyIBsvoYC4m1Zl3b9+A
         fOdfsgnlXFnTRxHwZcJRH6mNBSyvTvHD5ijMt2EGS7NhVRdJhNDyLTb3Q14ZiT6O4XMy
         1R5Q==
X-Gm-Message-State: AC+VfDwrBe1xSpPNQJSukNJrmleNCG04jaM7ww8umkCo23bH55p+T2a2
	X8kFrFOiXbeuGWZ0C2n6ivG4ag==
X-Google-Smtp-Source: ACHHUZ6uQcLz+SEsWMNOQ4M60EgceCTYf8hbLid3I3CJyudtieN29zhvLVpysI82W9J+Bgmn9YxLaw==
X-Received: by 2002:a19:7117:0:b0:4f6:25cb:5910 with SMTP id m23-20020a197117000000b004f625cb5910mr3275622lfc.42.1686563823780;
        Mon, 12 Jun 2023 02:57:03 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.153])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c28d100b003f080b2f9f4sm10954816wmd.27.2023.06.12.02.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 02:57:03 -0700 (PDT)
Message-ID: <6e12d585-701d-f635-6943-6aecdb45c659@linaro.org>
Date: Mon, 12 Jun 2023 10:57:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add support for sst26vf032b flash
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230609144324.850617-1-miquel.raynal@bootlin.com>
 <20230609144324.850617-3-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230609144324.850617-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_025705_629437_CF712E95 
X-CRM114-Status: GOOD (  22.65  )
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



On 6/9/23 15:43, Miquel Raynal wrote:
> Describe this new part. I simply copy/pasted the entry for its cousins
> with twice more/less storage capacity. The datasheet is public:

All the cousins should be updated to use PARSE_SFDP instead.

> https://ww1.microchip.com/downloads/aemDocuments/documents/MPD/ProductDocuments/DataSheets/SST26VF032B-SST26VF032BA-2.5V-3.0V-32-Mbit-Serial-Quad-IO-%28SQI%29-Flash-Memory-20005218K.pdf
> Without the NO_SFDP_FLAGs only partial erasures happen so I believe the

What do you mean by "partial erasures happen"?

> 4K sector flag is needed. I cannot test dual/quad reads, so I kept these
> to mimic the other entries, just in case.

The flash seems to have the SFDP tables (you dumped them below), so I
would expect the 4k erase size to be discovered at SFDP parsing time.
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
> index 99c8a19493f5..43f37d66f73a 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -113,6 +113,10 @@ static const struct flash_info sst_nor_parts[] = {
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ)
>  		.fixups = &sst26vf_nor_fixups },
> +	{ "sst26vf032b", INFO(0xbf2642, 0, 64 * 1024, 64)
> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)

If you replace the NO_SFDP_FLAGS line with PARSE_SFDP, is the flash
working correctly?

> +		.fixups = &sst26vf_nor_fixups },
>  	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128)
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
