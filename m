Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4365EB64D0
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jun 2023 13:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8q+NTbPudXi55M22Yl2Qs9oipcGD4cVSFFa5GXXEj2A=; b=Zf9s9jn298rmPeAWgCeakf9H7z
	kDov6Hznz1UxlECXON6ZNvKrvfFyivs1Dvdsu3mF6iTRDofcSYztOHTP+y80hs8ctVXh93ajraPvD
	XelReeSbJhxqZc7hn5MMFjITrpipkj86FeNe4pDhO2rHDck55vuwlsOHtxDjc0/9WZXbOkBJO03hK
	Ft4qCw2Pe0WI0XZLjTb7kXoQOdCWg7NseY+/j79haBJaqUraqbgqcHnf3wc7et5M3t/+7nLxd+vT0
	Z0shCIceH5nEQizg7/dr+e3U8enCnEpX/u5UUW+WDQrWguG+h/9ancAaQreMpCPb4Kon3aIr5LfTv
	af8OONUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q94A5-008CEG-0c;
	Tue, 13 Jun 2023 13:34:17 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q949y-008CCI-2O
	for linux-mtd@lists.infradead.org;
	Tue, 13 Jun 2023 13:34:15 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 81638AA;
	Tue, 13 Jun 2023 15:34:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1686663244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zHKhzcOQ8tFIGhrtNvSHC9GWqp3iM7TKR3E2bRkoKNA=;
	b=aEwXmJUxdVFrVMXQnClCeiGe7DcDNJW7AzoE6xE9WXnfYsHVxYyq/Rku69Iq1T1n1i/GCV
	ivE6RESWDcUt9zSrstcxlFrWZu4f06rS9fl0H7Nv1Mj8zClsL4+gbHWddjCCjjj5t6V4f3
	nzT4XPlzZSHD4kveOJjSRgKwUOMDg28oM0C18+EegxQex7eDLnsWTNs3/5db3dT6GYBqTe
	fhckS4DeDar7TVdcqzGl9YJl054hi4IlytAafuMsG0Zq9jTI7oqqMDfpwgCu4+Ywplmmk7
	mekHhPOa4Ot7Bx+s7H9F+e0kdqKX9L9d+Fg4lEjPACjVMy/k83QsS9AYVsRVMQ==
MIME-Version: 1.0
Date: Tue, 13 Jun 2023 15:34:04 +0200
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add support for sst26vf032b flash
In-Reply-To: <20230609144324.850617-3-miquel.raynal@bootlin.com>
References: <20230609144324.850617-1-miquel.raynal@bootlin.com>
 <20230609144324.850617-3-miquel.raynal@bootlin.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <b3267c392523277bf15fe8d24679add3@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_063410_930870_E803BAF0 
X-CRM114-Status: GOOD (  19.47  )
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

Hi,

Am 2023-06-09 16:43, schrieb Miquel Raynal:
> Describe this new part. I simply copy/pasted the entry for its cousins
> with twice more/less storage capacity. The datasheet is public:
> https://ww1.microchip.com/downloads/aemDocuments/documents/MPD/ProductDocuments/DataSheets/SST26VF032B-SST26VF032BA-2.5V-3.0V-32-Mbit-Serial-Quad-IO-%28SQI%29-Flash-Memory-20005218K.pdf

As Link: tag please

> Without the NO_SFDP_FLAGs only partial erasures happen so I believe the
> 4K sector flag is needed. I cannot test dual/quad reads, so I kept 
> these
> to mimic the other entries, just in case.

I'd prefer to have proper SFDP parsing, even if you cannot confirm that
dual/quad reads are working. That could always be a fixup later.

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
> e7efddddb3d5ee89ca37bf6b6e789645  
> /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

Thanks!

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

Please try with INFO(0xbf2642, 0, 0, 0). You can also have a look
at the debugfs and compare it to your current flags to check that
nothing has changed.

-michael

> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +		.fixups = &sst26vf_nor_fixups },
>  	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128)
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
