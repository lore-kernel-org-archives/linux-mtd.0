Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4846FC43381
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 11:01:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14F9C217F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 11:01:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="onhBoZk3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QeRKX8L2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14F9C217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j3XUVFxu4SRhVW/5gVI0caL7WXE4dAxUFWapTQnH4ms=; b=onhBoZk3g3+yot
	SecKCrGJMDpil/YAYZGEKbKrqnDEgc/24KVAYjGrRQSRVu3yVC+pQy4dM7Z9m/mBrysvQcIlpWvC5
	kNux+YpJtKWwHmngPRv76rUd5y7nOViOt/BVosxCh7W85ES/gwlDYc9V1fLUr7p5vrVgZcQ5i//TD
	ANFWvA8dG5nI7REIcHu/o0A72uw3pnvPE8zqWi3x3M3rTDUmzLaE25tkkn3wjozP0LjxPu1QkC+aC
	hN9RIfQP7UJQmO1sn4MQ/KGL2gVTnWbObwImTrPMbGhrqO4gf7BjkbGTjcraCJCkCD9vPENVUZJXO
	L6l0t5CRVN2Qp5KrSWwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9pFz-0003Ws-PF; Fri, 29 Mar 2019 11:01:07 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9pFw-0003Ug-8b
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 11:01:05 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2TB0qeU027878;
 Fri, 29 Mar 2019 06:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1553857252;
 bh=2AkFXzQTC8Jq8dwmKEW+lcJdOPiO6BSO3NKklfNCNts=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=QeRKX8L2NtbBHNSFQfp8UDPvxNiHTLkFR4/15reOhsfSju/EoAHKBuU4tvQAeTtjK
 D4KK7UQdy0LG1UeFcQ2ww/gmbQwy0TJLrIqLJBhgs0z5z4SZt2zvEB4LUJXm0Pvek+
 J9n2T9wQ9LMulRMbZm/OugUpR1oAGXHT93xzpLGQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2TB0qfs087710
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 29 Mar 2019 06:00:52 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 29
 Mar 2019 06:00:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 29 Mar 2019 06:00:51 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2TB0l7Q076024;
 Fri, 29 Mar 2019 06:00:48 -0500
Subject: Re: [LINUX PATCH 2/3] spi: spi-mem: call
 spi_mem_default_supports_op() first
To: Boris Brezillon <boris.brezillon@collabora.com>, Naga Sureshkumar Relli
 <naga.sureshkumar.relli@xilinx.com>
References: <1553771784-3364-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20190328205522.272e1da6@collabora.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <cf7c971c-4b58-e965-3ca7-b72239772737@ti.com>
Date: Fri, 29 Mar 2019 16:31:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190328205522.272e1da6@collabora.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_040104_415438_F1B27D5C 
X-CRM114-Status: GOOD (  17.54  )
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

Hi Naga Sureshkumar

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
> Just call spi_mem_default_supports_op() from your driver
> ->supports_op() hook if needed.
> 

Could you rework to follow Boris's suggestion here?

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

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
