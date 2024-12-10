Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE253E77180
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2024 07:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nw1wseDjqfNfE4pL2H7amGXNBI5ZmE1W/AhYHJUhVk=; b=Qe/fvPpPcIHtUJ
	vq10HxdsIyy2WMs2ILupdHf7VMwsPfC8Od4CfbD+pW9wzKLhXHTeJDNXxq+tOlPqw24toXnSZBcIR
	2o1vzkyuyrfiKL3z559RguCenMfGUjiVyHeeWHljgyVQKUzFvbN5f5OSrM7nW091bOXf9+noNuk/2
	m/+8XS76NfNR++uxCWjG4nIUW0brY0AeIvP/L8arOH5zSfYobvq0wKgpIidhPe2BaFaz8qLppneD/
	p0GZs/DxXTQib7SjrO29fC6RIyepKILomX1tCSMSgfgPOXtzDFCwWirI30etx7nVXXChcusrn5o+N
	omA7KzdCOFHC6GEIPVbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKuaZ-0000000AXnM-1poB;
	Tue, 10 Dec 2024 07:23:23 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKuaV-0000000AXju-1tQN
	for linux-mtd@lists.infradead.org;
	Tue, 10 Dec 2024 07:23:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACCFFC0008;
	Tue, 10 Dec 2024 07:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733815394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FJup6Kt/wB1cEq9cKIKkxDbK2vt8HvtMBETNBzBxQvI=;
	b=TxR6h4p7DBcdg93eZFIJAeI29MrAgY3+xCMsExXD4gP39rlYMHGXsuEUXv4sNFlHvzDgR6
	jldEAxbGzMYfQeu4hYfP68mQrviPswWMsAgsu6aAjv9zz5y3bF3BAZojfqQnsAqVmGvFkU
	TJqmKA8EeDwDBGsNMmdVxRT4ezbB0Cpu6vxZ5D5ey6q6zWvv1eZU8qjBPpdlBXfZLXsLIC
	4YUVjsgtjmyFglLvfaMn5LQ4fTkkfaHd97qPkaNFeVpa1dupvdeNE+XVOAgoFxjlBTfi/M
	CNfaYDkgQFhlD/yZKW8HX1ozr41tCygUNu1dej/f7QTzvevBC5D6xjI6yErM6Q==
Message-ID: <3405febf-63ce-4ce8-80b9-1d0da7436333@bootlin.com>
Date: Tue, 10 Dec 2024 08:23:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/9] memory: ti-aemif: Create aemif_set_cs_timings()
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20241204094319.1050826-1-bastien.curutchet@bootlin.com>
 <20241204094319.1050826-6-bastien.curutchet@bootlin.com>
 <82276301-970e-427b-9fb2-8866881fb487@kernel.org>
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <82276301-970e-427b-9fb2-8866881fb487@kernel.org>
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_232319_630501_3554E7B7 
X-CRM114-Status: GOOD (  11.77  )
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

Hi Krzysztof,

On 12/9/24 8:41 PM, Krzysztof Kozlowski wrote:
> On 04/12/2024 10:43, Bastien Curutchet wrote:
>> Create an aemif_set_cs_timings() function to isolate the setting of a
>> chip select timing configuration and ease its exportation.
>>
>> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
>> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>>   drivers/memory/ti-aemif.c | 65 +++++++++++++++++++++++++++++----------
>>   1 file changed, 49 insertions(+), 16 deletions(-)
> 
> ...
> 
>>   
>>   /**
>>    * struct aemif_cs_timings: structure to hold CS timings
>> @@ -165,6 +165,44 @@ static int aemif_check_cs_timings(struct aemif_cs_timings *timings)
>>   	return 0;
>>   }
>>   
>> +/**
>> + * aemif_set_cs_timings() - Set the timing configuration of a given chip select.
>> + * @aemif: aemif device to configure
>> + * @cs: index of the chip select to configure
>> + * @timings: timings configuration to set
>> + *
>> + * @return: 0 on success, else negative errno.
>> + */
>> +static int aemif_set_cs_timings(struct aemif_device *aemif, u8 cs, struct aemif_cs_timings *timings)
> 
> In the future, please stick to 80-char wrapping unless exceeding makes
> code more readable (see Coding style). I fixed it up while applying.
> 

Ok, thank you.


Best regards,
Bastien

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
