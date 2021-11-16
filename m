Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F17BC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 18:36:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 040B361B5F
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 18:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 040B361B5F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ru6jLGNh3mKiINFjiRmZOJ3Yh+p3eeIRBfAf9JmhZ3U=; b=LeisI2TrcLD1QG
	C6zM0DR8F1wYnG6wbbgdqVqatnh9PXPjzVzKTcl2VrUPmoyu2FszA5kIpmUbNMJ01guS+/hRoLjGL
	IuHXNj2HTwwxv20aJ14DkDTlHCmb8A6OgnAsyAwXfcFmwCZ8pNMYnBsvvPk15ul8mzTnhUi/tBkqc
	CDYCxh9yPdziGKabIIU2L43VCNxQmiyZAZGiekyzr6uNMA8qlBUfIoxbxt3TlpUPavBuvNhmGZYNr
	UsohST3Q9ZSLhoAiyKrSD7JhMyAUGJlaAzEY4c82KgZmrnTES5lqgAEuFd5/GcVba17VlFd8AAWrx
	2zp+XMPLeqaVlpAY+JRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn3JT-002a8I-RE; Tue, 16 Nov 2021 18:36:11 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn3JR-002a7x-0M
 for linux-mtd@lists.infradead.org; Tue, 16 Nov 2021 18:36:10 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AGIa84N093057;
 Tue, 16 Nov 2021 12:36:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1637087768;
 bh=kLxpBAPPzpG7Ic/v/YIsNbcHV9SUcEJevmIVMESsK/g=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=CvD0OVkElgfloMpK9SIFH3azs9wfLLovSXB0PS/PqxjtxGRNafMxft5Yhwys1v7y4
 TH0ZjL6Mg/Sogb9UmWclPQbZoRsqoWQfUNYp7RWCfEWtM4z1GotSFfFHUhsJBXaRGk
 zN9O/vJqIYs063np+dfx99AQD8aVO3vvGWBVLVQQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AGIa8ai074142
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Nov 2021 12:36:08 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 16
 Nov 2021 12:36:07 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 16 Nov 2021 12:36:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AGIa7Gn073808;
 Tue, 16 Nov 2021 12:36:07 -0600
Date: Wed, 17 Nov 2021 00:06:06 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <Alexander.Stein@tq-group.com>, <michael@walle.cc>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Fix shift-out-of-bounds
Message-ID: <20211116183604.otbvfiqlkowmidxr@ti.com>
References: <20211106075616.95401-1-tudor.ambarus@microchip.com>
 <20211106075616.95401-2-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211106075616.95401-2-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_103609_187545_0A6DBE7E 
X-CRM114-Status: GOOD (  19.17  )
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

On 06/11/21 09:56AM, Tudor Ambarus wrote:
> When paring SFDP we may choose to mask out an erase type, passing
> an erase size of zero to spi_nor_set_erase_type().
> Fix shift-out-of-bounds and just clear the erase params when
> passing zero for erase size.
> While here avoid a superfluous dereference and use 'size' directly.
> 
> UBSAN: shift-out-of-bounds in drivers/mtd/spi-nor/core.c:2237:24
> shift exponent 4294967295 is too large for 32-bit type 'int'
> 
> Fixes: 5390a8df769e ("mtd: spi-nor: add support to non-uniform SFDP SPI NOR flash memories")
> Reported-by: Alexander Stein <Alexander.Stein@tq-group.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 3d97c189c332..a1b5d5432f41 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2230,8 +2230,13 @@ void spi_nor_set_erase_type(struct spi_nor_erase_type *erase, u32 size,
>  	erase->size = size;
>  	erase->opcode = opcode;
>  	/* JEDEC JESD216B Standard imposes erase sizes to be power of 2. */

The change itself looks fine to me. So,

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

But I wonder if this code is doing the right thing. If a flash is 
setting an incorrect erase size, shouldn't we fail loudly to make sure 
the error is corrected, instead of working around it silently?

If you don't want to return an error here, how about:

	WARN_ON(ffs(size) != fls(size))

or even a dev_warn() print so the programmer is aware of this.

> -	erase->size_shift = ffs(erase->size) - 1;
> -	erase->size_mask = (1 << erase->size_shift) - 1;
> +	if (size) {
> +		erase->size_shift = ffs(size) - 1;
> +		erase->size_mask = (1 << erase->size_shift) - 1;
> +	} else {
> +		erase->size_shift = 0;
> +		erase->size_mask = 0;
> +	}
>  }
>  
>  /**
> -- 
> 2.25.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
