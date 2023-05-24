Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23F9C7EE23
	for <linux-mtd@archiver.kernel.org>; Wed, 24 May 2023 05:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vplb/UJ76HBaBoO9OgWW/ZxbfMoAt00hbyN1IF9YRcc=; b=4p/2dN6Y3uZ5tq
	GEFru+tRhX+Azx/nd87fkR6ABoMg9wovWLoLVygvLWlWy+pFDjJRdhcyrIEv0QCnyTeU7LoFUmwB7
	GT0mV1YwiRIXGnQqFM99t/2xqq/ZJpOVEoxVFLSqVNz7/h0CTY+ZUdFN9QMXfCjn2t8/7sn01XUSd
	1U1cr2hkTi7M0SfgfDd87pJ+JPS5mARXFDa3bva224OLf6aOHb9528o6ZbfgzIO0BhmsEXaoxAT8F
	u983OEiqwYAhQYgfhZ1y9xRMyjTPSohsIBR+OoYN0J+7X6sqN3sGDyNrpz1LeOmcKteuI30tA7iM2
	oEXijAr+lcpTv3mGch6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1gbJ-00CMau-0Q;
	Wed, 24 May 2023 04:59:53 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q1gbH-00CMaO-18;
	Wed, 24 May 2023 04:59:51 +0000
Message-ID: <e96e4e85-7371-2859-b9a5-0f2c1f3b97d9@infradead.org>
Date: Tue, 23 May 2023 21:59:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 15/24] block: move the code to do early boot lookup of
 block devices to block/
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Mike Snitzer <snitzer@kernel.org>,
 Joern Engel <joern@lazybastard.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pavel Machek <pavel@ucw.cz>, dm-devel@redhat.com,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230523074535.249802-1-hch@lst.de>
 <20230523074535.249802-16-hch@lst.de>
 <b384f464-92c6-6a14-4072-1faa9fa6a6a8@infradead.org>
In-Reply-To: <b384f464-92c6-6a14-4072-1faa9fa6a6a8@infradead.org>
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



On 5/23/23 21:58, Randy Dunlap wrote:
> 
> 
> On 5/23/23 00:45, Christoph Hellwig wrote:
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index f08b83e62c6222..3f8cf6dc7de887 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -5452,7 +5452,7 @@
>>  			port and the regular usb controller gets disabled.
>>  
>>  	root=		[KNL] Root filesystem
>> -			See early_lookup_bdev comment in init/do_mounts.c.
>> +			See early_lookup_bdev comment in block/early-lookup.c
> 
> Patch 13 does this:
> 
>  	root=		[KNL] Root filesystem
> -			See name_to_dev_t comment in init/do_mounts.c.
> +			See early_lookup_bdev comment in init/do_mounts.c.
> 
> Should this latter chunk be dropped?
> 

Oh, oops, reverse order of patches?

-- 
~Randy

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
