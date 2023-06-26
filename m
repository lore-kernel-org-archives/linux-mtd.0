Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844F4EB64D7
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jun 2023 14:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uMzFfK4/sXSPy34fYOpCXkvGeWSyodEADd39fKJe57g=; b=FSo4lfmOPM8tT6
	oCHvJSzwgfOwgGz3TV9sZg+LXCRmlzF2vKiSoPDyM+4k8+RykiGHk2ykXEUPIF90LPI2srI+2AqYs
	rkRwYxXq90pAT4V4YbBfn7v6SWX9B0w0OTNgDzFmBY8NqxtKm1c5HBZgIudoS6AdbgMbd/lpxtKAS
	EKrj0ysBBFYw22zBAGPA3brxGOA2jaoYEWmA6aMRUDVY1p00wpt5l3nXqtqOzBzuiXxyJgzeC61qe
	exejKprnvdkUUNZXaPnVW8qQ95SkkPtKUBn6aFUVWDj20DJp/Ds0v99KxUe4K9Qybna7RS9blHvOX
	xV+NcQ104Ybqlos9KHDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDnYT-00AQZE-1m;
	Mon, 26 Jun 2023 14:51:01 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDnYR-00AQYN-0A
	for linux-mtd@lists.infradead.org;
	Mon, 26 Jun 2023 14:51:00 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-666683eb028so1479451b3a.0
        for <linux-mtd@lists.infradead.org>; Mon, 26 Jun 2023 07:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687791057; x=1690383057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3/i5nGpo6bAYzHRYmjepgeMVK+fjAMmYYEQI4A8dzWk=;
        b=WcV4DcEBS5YMzS9iaPDRah1GA8GP4m8yCyx/thCr1kzXp/1T2D2H1Ap+Zx8/NxVenk
         fUWee4Ndk2misDoh1G5NO6U6bOPbnUgSllMa4nTGKMd8ym6YzNTzuiXnYM/4WJUHhGyL
         2yaFVJNBKnAPHE/DoYIlleYsrb/JWYyczHVojNOA51eOznE5hRz/GJfHkALKInY0RlTc
         QV4bBN7spqzeaPNe741uGfXZsZszC1dkbG8KaY/daK6OaKqbjUda693A+36oGeMBO/PH
         OGkE+Ld+QkjbCGet6WRjXY7YZ7gGq0qP4AeIhhM69FG9991bEoEDtmOKZysxC5K7pN/c
         nyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687791057; x=1690383057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/i5nGpo6bAYzHRYmjepgeMVK+fjAMmYYEQI4A8dzWk=;
        b=Yn+Y7PzF61hn+wF/BXQc9I+m9tBM5p9gOTe0iZspWrAkiqBVjBAVPUKreF2QutYtIc
         UpsqJrZOEiEuoVjugyCh34VSA9p6XYFTSVOnrTBTsIaQrXP4kIB4+PbGrp+AZzlUmkPl
         xnJ/dr7+lTQkD89s63DFj1NJQN3OnKkN7us7vBEJGqcDHqP7YMtreTJhy968eDXGkiwY
         m2gw7VoDuopcLqFh7uHgZ1kW2Yfas4QgNr83tDjl5EyVEDQAFeOVbZgugGv8/WIRr9Qq
         S56ZImMwaifUKrKRbixBBXgJVGDfJ5p8jzZgg7W+eC1womuDFYOqx8J4IFj/pN3Wp8yK
         m9tQ==
X-Gm-Message-State: AC+VfDxIohwLmnZOvR4/0EAbJbgwfCI8Urm5MMERjcv/+1dk/Fioi0pQ
	5ugchU/Cpr9yZLiasF1DnnA=
X-Google-Smtp-Source: ACHHUZ7gyf8JRcVX0msxlw87KM1NXLxkxhxSkyxpkjUkB5RP08dHtYuS1O5W3TiyOlTbkG5rO5m/Jw==
X-Received: by 2002:a05:6a00:244f:b0:63b:5c82:e209 with SMTP id d15-20020a056a00244f00b0063b5c82e209mr18091552pfj.10.1687791057379;
        Mon, 26 Jun 2023 07:50:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u15-20020aa7838f000000b0066a6059d399sm3889133pfm.116.2023.06.26.07.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 07:50:56 -0700 (PDT)
Message-ID: <7e708dfa-4019-fe28-afbd-91ad847fada0@roeck-us.net>
Date: Mon, 26 Jun 2023 07:50:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 08/24] init: pass root_device_name explicitly
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Mike Snitzer <snitzer@kernel.org>,
 Joern Engel <joern@lazybastard.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pavel Machek <pavel@ucw.cz>, Loic Poulain <loic.poulain@linaro.org>,
 dm-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org
References: <20230531125535.676098-1-hch@lst.de>
 <20230531125535.676098-9-hch@lst.de>
 <c1391658-d785-4b2f-ba7e-01e4668685d7@roeck-us.net>
 <20230626075325.GA26851@lst.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230626075325.GA26851@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_075059_087602_99FC278A 
X-CRM114-Status: GOOD (  17.44  )
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

On 6/26/23 00:53, Christoph Hellwig wrote:
> On Fri, Jun 23, 2023 at 05:08:59PM -0700, Guenter Roeck wrote:
>> Hi,
>>
>> On Wed, May 31, 2023 at 02:55:19PM +0200, Christoph Hellwig wrote:
>>> Instead of declaring root_device_name as a global variable pass it as an
>>> argument to the functions using it.
>>>
>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>
>> This patch results in the following build error when trying to build
>> xtensa:tinyconfig.
>>
>> WARNING: modpost: vmlinux: section mismatch in reference: strcpy.isra.0+0x14 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> ERROR: modpost: Section mismatches detected.
> 
> I can reproduce these with gcc 13.1 on xtensa, but the report makes
> no sense to me.  If I disable CONFIG_CC_OPTIMIZE_FOR_SIZE it now reports
> a similar warning for put_page intead of strcpy which seems just as
> arcance.
> 

I don't see that (I tried 11.3, 11.4, 12.3, and 13.1), but then I am not sure
if this is worth tracking down. I just force CONFIG_SECTION_MISMATCH_WARN_ONLY=y
for xtensa builds instead.

Guenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
