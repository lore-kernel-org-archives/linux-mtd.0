Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91845C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 10:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vh11lyba1M47jkVP/89NlTHlwoXRXLJPZRyXdqPEYI=; b=c3BMM7n05sLoBmPBZvMD6Gf7Yy
	kTVe6lYbUNQ0SohnX+QFbpwEspXxHvQyOQCBnYe1teHc/7fCKxR4o5RI1XAn5Rv9Pamh2yinGtVff
	iVB/5rz56OXUfBdKXWqcgCA00ba85dIE/MgHCK6ukB0oePcyjqnNaD+Eoe9RH27hqLSveCe7idf4J
	+WB/nKhawJiZPNYj5ASLZnnLDf+JwCKaD6M4jFW/zj81KHsU8JI4Ahhzrem10m09KHUmy16j+V9IG
	01c4ZROxHIGlKg1eoLw3ltYQspN6CVi/aNEuBT0EPR1ntPmzQFe7a5/dXNzPtwCWnfsiODC8vJ8+i
	pNUI8Wkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1newPw-00549W-C9; Thu, 14 Apr 2022 10:09:36 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1newPs-00542f-S3
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 10:09:35 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 03F842222E;
 Thu, 14 Apr 2022 12:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1649930959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RK59Z34qpZOchcwXuSsdRUcPTe2qzh+QrqzPE04VL94=;
 b=eez+xibiVp6z1DbgnH7st5RcWJxJ4xaUDQXjLIxljjCWf/+Uqhteb4hA7yKYDw2WMJQRgR
 QQya3nqxLGvGVHVOb3LlhfADhfGBxCvKucCwv+lov8z16cIz/Duea6HW1OHjJzhvzpM3Qk
 X3MLsaPBrPhi54KxtwUA6w6J5DrRuIs=
MIME-Version: 1.0
Date: Thu, 14 Apr 2022 12:09:18 +0200
From: Michael Walle <michael@walle.cc>
To: niravkumar.l.rabara@intel.com
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: issi: Add IS25WP512 device
In-Reply-To: <20220414130004.945924-1-niravkumar.l.rabara@intel.com>
References: <20220414130004.945924-1-niravkumar.l.rabara@intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d805708b94dc4a00b854f3769c5013b1@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_030933_088610_0C6D00F3 
X-CRM114-Status: GOOD (  12.48  )
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

> Add is25wp512 info to spi_nor_ids[] table entry.
> 
> Rename is25lp256_post_bfpt_fixups to is25xx_post_bfpt_fixups
> as a common function for all is25xx post_bfpt fixups.
> 
> Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>

We require SFDP dumps of new flashes. Therefore, you can only add
flashes which you actually have (and have tested). See [1] how to
provide such a dump.

> ---
>  drivers/mtd/spi-nor/issi.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> index c012bc2486e1..14fe07e55f85 100644
> --- a/drivers/mtd/spi-nor/issi.c
> +++ b/drivers/mtd/spi-nor/issi.c
> @@ -9,24 +9,27 @@
>  #include "core.h"
> 
>  static int
> -is25lp256_post_bfpt_fixups(struct spi_nor *nor,
> +is25xx_post_bfpt_fixups(struct spi_nor *nor,

Please use is25_post_bfpt_fixups. But how sure are you that
this affects their whole nor flash line? is25 is the prefix
for all their SPI NOR flashes, no?

I'm not arguing against using this name and it can certainly
be changed in the future if we know more.

-michael

[1] 
https://lore.kernel.org/linux-mtd/4304e19f3399a0a6e856119d01ccabe0@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
