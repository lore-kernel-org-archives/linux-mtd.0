Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C24EC43381
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 08:20:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AEE6206B6
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 08:20:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ea4+2oPF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vrFJYxNj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AEE6206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9nS4Yy8clkNMZI/5exPVJG4MaW2ysmYcFRtYjgS8YA=; b=Ea4+2oPFXH5OWq
	0rbynkdsen9wRrgiiytzM8VsggBH1N/f0DncBPQAhCNOZlxoRAjBnxzySrS2SC8/K8m3dEi/4nJld
	lCAykhuzYwR1oXjakVVhnK4vdWc7Sy8F3PL2nM/M9DHf/1+YLHRZRYmI6HVPyY6mgNLnxICoUak/4
	cqwyP0LkqWdBiKEvn/u59MIurWVWgWiU72VKKbXjRgGaWgKFPBhq3K0RqQ3awP4vKEzxN0LuNsGUB
	DFmvvUOaf0LqemEYWLpCkhX516p4+ZcHzXLknPUUQ1F5qqaJqhFCiFQicl6vexFSu2d0l7DNh5Nkw
	9tHRrwibaAAm1mOXLbjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9mk1-0000Sm-3F; Fri, 29 Mar 2019 08:19:57 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9mjx-0000SR-PB
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 08:19:55 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2T8JXpa110125;
 Fri, 29 Mar 2019 03:19:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1553847573;
 bh=/MH7yt7+ZJzTGC8zCG3comkdbxPSsTYA+/hH0Zib2/8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=vrFJYxNjd4Lq1SKaV30f7NGLwPB1vP0xTVFn1AuIaojPZAomRuZsKusu7YjrgS6H1
 Z6PeaXbg1Qqg6jU5f7QFqnJD6J9t6p1cPJViGGi8pqF/CqX7aBVFtOmj3TdehrNf9Y
 /i1d4ILUPuJ7z5tMkB3D3nURsRPGGMGAcz3cWscU=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2T8JXFI074522
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 29 Mar 2019 03:19:33 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 29
 Mar 2019 03:19:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 29 Mar 2019 03:19:33 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2T8JRVr117628;
 Fri, 29 Mar 2019 03:19:28 -0500
Subject: Re: [LINUX PATCH 2/3] spi: spi-mem: call
 spi_mem_default_supports_op() first
To: Boris Brezillon <boris.brezillon@collabora.com>, Naga Sureshkumar Relli
 <naga.sureshkumar.relli@xilinx.com>
References: <1553771784-3364-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20190328205522.272e1da6@collabora.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <d21f7363-eeea-830e-b9b8-ef5bb9e1261b@ti.com>
Date: Fri, 29 Mar 2019 13:50:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190328205522.272e1da6@collabora.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_011953_900827_C4EFC340 
X-CRM114-Status: GOOD (  18.37  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On 29/03/19 1:25 AM, Boris Brezillon wrote:
> On Thu, 28 Mar 2019 16:46:24 +0530
> Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:
> 
>> Call spi_mem_default_supports_op() first, before calling controller
>> specific ctlr->supports_op().
>> With this, controller drivers can drop checking the buswidths again.
> 
> No, this was done on purpose, in case the controller does not want the
> default check to be applied (say it does not need bus-width props to
> be defined and has another way to check if a device can be accessed in
> dual, quad or octal mode).

Sorry, I don't understand here.
Based on capabilities declared in spi_device->mode, m25p80 driver will
claim appropriate  SNOR_HWCAPS_*.  SPI NOR layer chooses opcodes based
on that for which m25p80 layer populates buswidths.

So, I don't really expect any mismatch in spi_mem_default_supports_op()
in the case you mentioned. Or did I miss something? Maybe something SPI
NAND specific?

Regards
Vignesh

> Just call spi_mem_default_supports_op() from your driver
> ->supports_op() hook if needed.
> 
>>
>> Suggested-by: Vignesh Raghavendra <vigneshr@ti.com>
>> Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
>> ---
>> Details can be found at https://lkml.org/lkml/2019/3/1/183
>> ---
>>  drivers/spi/spi-mem.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
>> index 5217a56..56aa158 100644
>> --- a/drivers/spi/spi-mem.c
>> +++ b/drivers/spi/spi-mem.c
>> @@ -189,11 +189,14 @@ static bool spi_mem_internal_supports_op(struct spi_mem *mem,
>>  					 const struct spi_mem_op *op)
>>  {
>>  	struct spi_controller *ctlr = mem->spi->controller;
>> +	bool ret;
>> +
>> +	ret = spi_mem_default_supports_op(mem, op);
>>  
>>  	if (ctlr->mem_ops && ctlr->mem_ops->supports_op)
>> -		return ctlr->mem_ops->supports_op(mem, op);
>> +		ret =  ctlr->mem_ops->supports_op(mem, op);
>>  
>> -	return spi_mem_default_supports_op(mem, op);
>> +	return ret;
>>  }
>>  
>>  /**
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
