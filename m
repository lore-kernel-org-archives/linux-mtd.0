Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F97C04A94
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Aug 2023 08:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q978or1cm4I2co4nSR3SzQblPm88FlDxe1Vx2bLBGiQ=; b=je3MWh7FTHDOEmAiRN5xeTxB0N
	KmZa1nhr8369+bLCIjCynl1VQonTUxBSj0s8fj96a54z6eS4+TgGtOItuXKdoHNSCE+RhPS0j/LBF
	L3JQEBW3KXwifLRq6hL5e9rDVSOZ2sAJIuYKe66tcpj/iAbce+We8KsCX8YKbPsEPCujv/wupZ+y6
	mhjmNuUvncPzPbMnwxfV56LEnkVpo4ot4VF7yKOEjkSvnVBLhR2Hu5WALXuG3+34d4rV8aYDrwhmz
	U/iSC9fkWGsnrh1IcnSWxPQzWrEsBuMqLczjRaDly8TV9MTZ4lKr0KgcxmCEY0Yb2JvRvVLC+KDtg
	k6fu3r1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTHoz-001yLE-05;
	Tue, 08 Aug 2023 08:12:05 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTHou-001yIB-1l
	for linux-mtd@lists.infradead.org;
	Tue, 08 Aug 2023 08:12:04 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 3EB401200;
	Tue,  8 Aug 2023 10:11:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1691482311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJzbbv1YlPyVCr0YSGm9a8pmXNQtoQxWN3bLRhqZMS8=;
	b=c1Ty7jFjMXPkz+U/cN23xVMhixD+beBMOw1RUet3tiP5b79zLeWu2Xb6q3oLTpI0h9TCf+
	7F1GovoYZLOC/w6AQNjCvDXRFIgUHwOgFgNvw6NxPw33i15xZl/dQ597xM2/TgZzxwFAGH
	IF3BZlMHlE6TKZsKTSrnFxtT6EK+NQR93dwbUu33g2SzAmH7g6lRfg/7waIsWw4+T4c5sM
	wLSEDoWHT3okD+LBCUFGwKv2aLrzoLK8D1X6tCG/uGrNGTV70Upr7yN03MDTpqLbsLUgcb
	iuATaQAaVBCd2KLxA21xDu/BDaEqi9vHexfFENdpta1Y8CC08EUHckn9123elg==
MIME-Version: 1.0
Date: Tue, 08 Aug 2023 10:11:51 +0200
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, linux-mtd@lists.infradead.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4] mtd: spi-nor: Add support for sst26vf032b flash
In-Reply-To: <20230808075001.223150-1-miquel.raynal@bootlin.com>
References: <20230808075001.223150-1-miquel.raynal@bootlin.com>
Message-ID: <e618ba6c48d67469b9a2c19ee8bb5a1c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_011200_735800_0B984403 
X-CRM114-Status: GOOD (  24.79  )
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

Am 2023-08-08 09:50, schrieb Miquel Raynal:
> Describe this new part. The datasheet is public.
> 
> Link: 
> https://ww1.microchip.com/downloads/aemDocuments/documents/MPD/ProductDocuments/DataSheets/SST26VF032B-SST26VF032BA-2.5V-3.0V-32-Mbit-Serial-Quad-IO-%28SQI%29-Flash-Memory-20005218K.pdf
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
> e7efddddb3d5ee89ca37bf6b6e789645  
> /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
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
> Changes in v4:
> * Just providing the PARSE_SFDP flag seem to work but actually does
>   not. As opposed to the NAND world which loudly fails when WP is
>   enabled, here the destructive operations are silently ignored by the
>   chip, so actually the reads work but without the additional
>   LOCK/SWP_IS_VOLATILE flags, the chip does not process writes and
>   erasures. Reinstate these two lines as in my backported patch (a
>   linux4microchip kernel on which I actually run this hardware), so I 
> am
>   sure it also works in mainline.

Mhh, this flash has vendor tables. The sst26vf global unlock should
be discoverable. There is a table with all supported opcodes, which
could be used to see whether this flash needs the global unlock.

I'd like to push as much as possible into auto-discovering
features.. after working on that flash db cleanup.

> Changes in v3:
> * Dropped the second patch (untested changes as advised by Tudor).
> * Avoided playing with locking as I cannot test it either: simplified
>   the diff by just using the PARSE_SFDP flag.
> * Rebased on top of -rc1 and adapted the patch to the current state.
> 
>  drivers/mtd/spi-nor/sst.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index 688eb20c763e..414ee4692fd1 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -111,6 +111,10 @@ static const struct flash_info sst_nor_parts[] = {
>  			      SPI_NOR_QUAD_READ) },
>  	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
> +	{ "sst26vf032b", INFO(0xbf2642, 0, 0, 0)
> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> +		PARSE_SFDP
> +		.fixups = &sst26vf_nor_fixups },
>  	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128)
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)

Honestly, this is such a mess. There are three identical chips:
sst26v016b, 032b and 064b and all have different flags :(

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
