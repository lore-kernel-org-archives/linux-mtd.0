Return-Path: <SRS0=P3/5=NW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC48C432BE
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Aug 2021 08:40:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D13066023E
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Aug 2021 08:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D13066023E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmoL/tqTxqTmtbDmJOHkQach14HbSqmlNjyp6nMFsA8=; b=fvI5zflzHxWzw0z8EWXH4hnD+c
	MtBOaaaKWOqcRsDEsOMU+fsss98otPUOVyOVSdkCKKPgcN5J8EFO5DZN19xiPfjuHDPrwtNNmAQbE
	B9LijvVn8KSET34c5DOsrnGuPs8aBhUrqAQjJZWFP3i4W+O9PBRNe+uiqhFsoN8Q6pZdciPElGMVg
	CQP+RUQDPm8ivTOcXNCW5TqzWVqU8IRmEa4NVPMPFBeEUEWgD3FvmnQEp9SaE2LPge0bfKsue6b8O
	YrukIxWGdZvGp0EA92+g3SqM0ajaKEGFWkF9IFgpbOHNrHfF5Ur4+64TW/nP/94aov6AlVRIGKJ+w
	oGyn4GVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKzIx-001onW-To; Tue, 31 Aug 2021 08:39:39 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKzIs-001omc-Il
 for linux-mtd@lists.infradead.org; Tue, 31 Aug 2021 08:39:38 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 62C0722178;
 Tue, 31 Aug 2021 10:39:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1630399167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Al9hxpy89OFqGr1jtl5s3SCyXzCKTUzg1d1GPfZ1mFA=;
 b=EVPMi+6swXoY0LQIiBrX70aI80A1jgGU7o4YAJZEZVW00UfVnMoSPIpDNVAnPNkUhO0Y/A
 IdSViWYiF9u4z6A4AsTkgGSHzmBN1WGjPcqwzX4m6pb2v/Ae6T6qBybJYofRRPvvZvxaq2
 H83VD51+I/uTvyyalS9Q/erh/O8qQuk=
MIME-Version: 1.0
Date: Tue, 31 Aug 2021 10:39:27 +0200
From: Michael Walle <michael@walle.cc>
To: Andrea Zanotti <andreazanottifo@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: micron-st: added support for np8p128ax60
In-Reply-To: <20210831081329.27420-1-andrea.zanotti@tyvak.eu>
References: <20210831081329.27420-1-andrea.zanotti@tyvak.eu>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <3462300528bbe71207ef2164411e34d2@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_013934_840354_87161A77 
X-CRM114-Status: GOOD (  20.01  )
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

Hi Andrea,

Am 2021-08-31 10:13, schrieb Andrea Zanotti:
> From: Andrea Zanotti <andreazanottifo@gmail.com>
> 
> Added support for P8P Parallel Phase Change Memory.

Please use present tense, eg "add support..."

Is there a public datasheet? If so, please include it above
your SoB like so:
Datasheet: https://...

> Added memory information (page size and sector size) as per data-
> sheet information, after typos corrections.

After typos corrections?

> At page 37, paragraph 'SPI Memory Organization', it is written
> down that the memory is organized as:
>  * 16.772.216 bytes (typo here, there 16.777.216 bytes)
>  * 128 sectors of 128 Kbytes each (correct)
>  * 131.072 pages of 64 bytes each (typo here, as the total would be
>    64Mbit, but the total memory is actually 128Mbit, correct value
>    is 262.144 pages)
> 
> Patch tested against the aforementioned PCM memory.

What SPI host controller was used?

> No known regressions inserted, as the patch only adds the possibility
> to recognize said PCM memory inside the common spi-nor driver.

Please drop this. If there were any regressions, the patch wouldn't
be picked up anyway.

> 
> Signed-off-by: Andrea Zanotti <andreazanottifo@gmail.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c 
> b/drivers/mtd/spi-nor/micron-st.c
> index c224e59820a1..c78331451082 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -128,6 +128,7 @@ static const struct flash_info micron_parts[] = {
>  	{ "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048,
>  			    SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
>  			    SPI_NOR_4B_OPCODES) },
> +	{ "np8p128ax60", {0x89, 0xda, 0x18}, 3, 128 * 1024, 128, 64, 0, 0 },

Eh? Please use INFO(). And why isn't this 0x20 for micron.

I found this datasheet:
https://media.digikey.com/pdf/Data%20Sheets/Micron%20Technology%20Inc%20PDFs/NP8P128Ax60E_Rev_K.pdf

According to that datasheet, the manuf id is 0x20. And the device id
should be either 0x88e1 or 0x8821.

>  };
> 
>  static const struct flash_info st_parts[] = {

-- 
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
