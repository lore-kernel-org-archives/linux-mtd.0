Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FC1EB64D8
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZlFf9t7jRd1IgHyQooS61lVzI/fPW5UL/90AAbOc8U=; b=g0RcJRm6B3ABGQ
	uqshIlyraPvF0GrmfENxUM/MZmiAV3jqUrpb/1RQ9lTUvVWXpA2Zek6W9tELQZ5wzPWcEb0t0duU4
	+kfpVzVLk7ADLD8wWx8pGeZXfwrBg6aN+u4ghBSgg4obsIfju6UJ+4DgQM9koPDI/49aSOPtgJNGR
	6M+goQN+Oi3vK8ewncenDRkNGgrMoAcWSmguXCwyoYnNfQc0bxPjPpE4GXRv0Up1LY5K+FQ+/FaNM
	09MN7itzW2XR4Wkq+5S0FjeZqYTtCYDfCOTMbVUaZxntmm6zu0Okzk1646XLP06lXsQf7xXeccvK2
	wbQew/JUv8lvuOAUwQ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCLkk-0013hx-1P;
	Thu, 22 Jun 2023 14:57:42 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCLki-0013gX-0D
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 14:57:41 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-668709767b1so3586021b3a.2
        for <linux-mtd@lists.infradead.org>; Thu, 22 Jun 2023 07:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687445857; x=1690037857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jwOACF4Cm96Y53XmCdPinKvkgKtl8JixiB5Ndw9ya3w=;
        b=ZLZv2qKKiBUJM4zOad+ld+YEywuAgqTfAe8D9uG2834frWERYt7dOAf1vfSpVmN5YZ
         yOxEcEncjDN7kOhTlOFDLwVXHHNx1R3s7A4A7WvW9KH55wLrpgFfYbKyLuxNpba3VEDy
         /GSflkQH4SMop1Pu8qE/gxyKtXCxcgJaR7oq5heJaeZsg3oPIoXwikzS+WpKl3KqWPwt
         01ynR7Rhpzgw9X6SBU6pTsD9kQIZ1LwKAa0A0yL6oB63PRLXJaYv9ZlqWe3CdGpN/BYl
         lfzDoc7rUiaSfRMkrmuzviGuWf1YmCafY+a8lj5LEKWwgL8eh8xDsMZcS1yEx/O0JGMy
         BCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687445857; x=1690037857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwOACF4Cm96Y53XmCdPinKvkgKtl8JixiB5Ndw9ya3w=;
        b=Qw+Mch1tUz/zQrU4W8zzYFv+5ePM5HSNUq+DqIBeRHXAbDlXJlMJWQvja9HIr47rer
         6eQiXjT1MVJv6asJwuv95YpMUV8QFEUClONmwOiqIkHcumUBNBvYMJzHaiZGgIyGgxWH
         NgKhQ5SJ46/2BONp9SapdEJcZCvZxhbvVJbFTg9IEIdKUYd3ye3me6VLQJa7tESrN9TX
         Cr5GbMxACwlcAstO3aOb3E4O4TKWVk76xOmUQgA//I1HLynypnvE5IhhQnE81RPW+26j
         roJtBsxAkhFaIo8Mh2bniGn6U3CPTPUQntB6k1QATd/bteMNv6lq5pYxkL2rZlXrajjN
         mOTg==
X-Gm-Message-State: AC+VfDye2C8zlJ/oLnFZz5Nbefu/Q/BRoZk2o02MXRUuw/MOHHJFRV78
	tTSpiqoCwfd3p68MzFXQYeU=
X-Google-Smtp-Source: ACHHUZ7SykTFwUl4Pg0cnKe++eFMAAWwdMSv8sx+ts0vphadPA7YhT4gBMX8VVlYqUagi9Fq98njJQ==
X-Received: by 2002:a05:6a21:339b:b0:122:1fc:38b8 with SMTP id yy27-20020a056a21339b00b0012201fc38b8mr10410540pzb.48.1687445857125;
        Thu, 22 Jun 2023 07:57:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a9-20020a170902b58900b0019719f752c5sm5510512pls.59.2023.06.22.07.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 07:57:36 -0700 (PDT)
Message-ID: <dd9dc41b-0830-0403-6abd-41d7aa664be3@roeck-us.net>
Date: Thu, 22 Jun 2023 07:57:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 14/24] init: clear root_wait on all invalid root= strings
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Mike Snitzer <snitzer@kernel.org>,
 Joern Engel <joern@lazybastard.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pavel Machek <pavel@ucw.cz>, dm-devel@redhat.com,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230523074535.249802-1-hch@lst.de>
 <20230523074535.249802-15-hch@lst.de>
 <8c1992bc-110a-4dad-8643-766c14bf6fd4@roeck-us.net>
 <20230622035149.GA4667@lst.de>
 <2205ef1e-9bb6-fb1e-9ca3-367c1afe12ac@roeck-us.net>
 <20230622060001.GA8351@lst.de>
 <8e6c8365-5c2b-2bad-bf3c-df2d65cc8afa@roeck-us.net>
 <20230622144042.GA21415@lst.de>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230622144042.GA21415@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_075740_104534_F390A03C 
X-CRM114-Status: GOOD (  24.75  )
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

On 6/22/23 07:40, Christoph Hellwig wrote:
> On Thu, Jun 22, 2023 at 06:54:41AM -0700, Guenter Roeck wrote:
>> On 6/21/23 23:00, Christoph Hellwig wrote:
>>> Hi Guenter,
>>>
>>> can you try this patch?
>>>
>>> diff --git a/block/early-lookup.c b/block/early-lookup.c
>>> index a5be3c68ed079c..66e4514d671179 100644
>>> --- a/block/early-lookup.c
>>> +++ b/block/early-lookup.c
>>> @@ -174,7 +174,7 @@ static int __init devt_from_devname(const char *name, dev_t *devt)
>>>    	while (p > s && isdigit(p[-1]))
>>>    		p--;
>>>    	if (p == s || !*p || *p == '0')
>>> -		return -EINVAL;
>>> +		return -ENODEV;
>>>      	/* try disk name without <part number> */
>>>    	part = simple_strtoul(p, NULL, 10);
>>
>> Not completely. Tests with root=/dev/sda still fail.
>>
>> "name" passed to devt_from_devname() is "sda".
>>
>>         for (p = s; *p; p++) {
>>                  if (*p == '/')
>>                          *p = '!';
>>          }
>>
>> advances 'p' to the end of the string.
>>
>>          while (p > s && isdigit(p[-1]))
>> 		p--;
>>
>> moves it back to point to the first digit (if there is one).
>>
>>          if (p == s || !*p || *p == '0')
>> 		return -EINVAL;
>>
>> then fails because *p is 0. In other words, the function only accepts
>> drive names with digits at the end (and the first digit must not be '0').
>>
>> I don't recall how I hit the other condition earlier. I have various
>> "/dev/mmcblkX" in my tests, where X can be any number including 0.
>> Maybe those fail randomly as well.
>>
>> Overall I am not sure though what an "invalid" devicename is supposed
>> to be in this context. I have "sda", "sr0", "vda", "mtdblkX",
>> "nvme0n1", "mmcblkX", and "hda". Why would any of those not be eligible
>> for "rootwait" ?
>>
>> In practice, everything not ending with a digit, or ending with
>> '0', fails the first test. Everything ending with a digit > 0
>> fails the second test. But "humptydump3p4" passes all those tests.
> 
> 
> Yeah.  I guess I should give up on the idea of error out in this
> particular parser.  The idea sounded good, but I guess it doesn't
> work.  So we'll probably want his fix:
> 

Yes, that fixes the problem for me.

Guenter

> 
> diff --git a/block/early-lookup.c b/block/early-lookup.c
> index a5be3c68ed079c..9e2d5a19de1b3b 100644
> --- a/block/early-lookup.c
> +++ b/block/early-lookup.c
> @@ -174,7 +174,7 @@ static int __init devt_from_devname(const char *name, dev_t *devt)
>   	while (p > s && isdigit(p[-1]))
>   		p--;
>   	if (p == s || !*p || *p == '0')
> -		return -EINVAL;
> +		return -ENODEV;
>   
>   	/* try disk name without <part number> */
>   	part = simple_strtoul(p, NULL, 10);
> @@ -185,7 +185,7 @@ static int __init devt_from_devname(const char *name, dev_t *devt)
>   
>   	/* try disk name without p<part number> */
>   	if (p < s + 2 || !isdigit(p[-2]) || p[-1] != 'p')
> -		return -EINVAL;
> +		return -ENODEV;
>   	p[-1] = '\0';
>   	*devt = blk_lookup_devt(s, part);
>   	if (*devt)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
