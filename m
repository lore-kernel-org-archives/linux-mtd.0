Return-Path: <SRS0=nVbp=KU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A23FC2B9F8
	for <linux-mtd@archiver.kernel.org>; Tue, 25 May 2021 19:33:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 063D5613F9
	for <linux-mtd@archiver.kernel.org>; Tue, 25 May 2021 19:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 063D5613F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uT7sKFjoVJpe0s6fac/1G25ZZrtWFiOnJXtpBAVnslA=; b=1HSyg7/qjnw7Ex
	NZP24K1zu8L1IZUq9F7uvpDpiv0vvvCOLahnWdRXL6sqTIui+FMPW1SOeaYLtiaNhYQ0sF/bJ0Iw/
	Dfld3c1RKYuJUdn+bINrW0GUNlp17gjPmPlibB6wS6vVAMYVIwOrB361Q6/ksWrE9kE4p+W7MNh2a
	mEBuD6RGMI2L/qCeIUZhLx9DKzO5XxTnfp/wYClpfsQd+pdWQCVR3c/txKwddzQCud+ujMfGVshe6
	92UrqR/YPW4jdgvQzZapgdS8UOeDwXDziwF2H1TwqkI9zOC3YY/7cKEUi+2EcIBCeqB5tdeiWoZ5D
	8P7jXU7v9kfbXS95zhzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llcmk-007kjA-NM; Tue, 25 May 2021 19:32:15 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llcVV-007cKp-BG
 for linux-mtd@lists.infradead.org; Tue, 25 May 2021 19:14:26 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14PJEIgo037633;
 Tue, 25 May 2021 14:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1621970058;
 bh=FN+9kixZ3TIIglDSVKYBwUcWmzankzYuWzlIb9bs6sc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=FKS4sdamOoc8oSnPC5v3Cm5a2rIYLYZjYsSuluVw+OGhhpQI6Kg85+5d3Sxa5UbCu
 DDd8LftDbKbq57pxb6bm/pw+HQMnKVpREcS91xqgFd6xvcvQCSfdpNC3n5FpqmjclY
 Nbb9R7+8W/xr/SPly8yDBDnQMcFgRCwH7FJQhp8M=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14PJEIm6027674
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 25 May 2021 14:14:18 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 25
 May 2021 14:14:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 25 May 2021 14:14:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14PJEHiX120440;
 Tue, 25 May 2021 14:14:17 -0500
Date: Wed, 26 May 2021 00:44:16 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Add support for second flash chip
Message-ID: <20210525191414.dc45h27rzqen4dce@ti.com>
References: <20210525160318.35802-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210525160318.35802-1-mika.westerberg@linux.intel.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_121425_534988_E823E327 
X-CRM114-Status: GOOD (  18.33  )
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

Hi,

On 25/05/21 07:03PM, Mika Westerberg wrote:
> Intel SPI flash controller has been supporting two chip selects long
> time already even if the most common configuration is to have single
> flash chip for the BIOS and related data. This adds support for the
> second chip select if we find out that there are two flash components
> (this information is available in the mandatory flash descriptor on the
> first chip). The second chip is exposed as is without any partition
> information with name "chip1". The first chip continues work as is.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/controllers/intel-spi.c | 208 ++++++++++++++------

Aren't the drivers in controllers/ supposed to move to use SPI MEM? I 
don't know if this has been discussed before, but I would like all 
drivers in controllers/ to move to SPI MEM API at some point in the 
future. This would let us drop support for this "legacy" controller API 
from SPI NOR, cleaning up the core quite a bit. No more if (nor->spimem) 
needed anywhere.

I wonder what other folks think about this. I vote for freezing all new 
features in controllers/. If you want something new, move to SPI MEM.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
