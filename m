Return-Path: <SRS0=jHjM=OF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1B3C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Sep 2021 09:06:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 268FC61214
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Sep 2021 09:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 268FC61214
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UYcSIp9hmEtMOWO3DsC7zWRg210RuJkTXjgWWftgU8g=; b=rNZJ9siiSloiLw4RUnnR3+rgzh
	PIGM1FHhwFdxkS9d+TrTgKzaTM1HG58+GRAJ82NPbO0ejQPiWgKg3bnoovYrannY3OGpB8gNMdHC8
	1xZzlX25BoeIPieBKYlxHlzLBr3gAWRvoN+N1dwZQPRV2NkrP7ru+ZANLuoNlO8mNsY5hV8hwAfiV
	DUwlejYD9PGUoe1f9GbXa+YZveB8nmsXsOYA514EUYDVVD1PqAAnd/2qgMqvGUQHrubb6Bil+04qu
	Zpc++UoMJVApXJXp57ztWoKvXHfx7FjHPOqVYXrZmgsBWBpO9cJfs+HrU0fZ4omzgZb19YEEUsYqj
	0p6Cz86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQQrS-008aqc-Dl; Wed, 15 Sep 2021 09:05:46 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQQrO-008ap9-Ja
 for linux-mtd@lists.infradead.org; Wed, 15 Sep 2021 09:05:44 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 18E1D40260
 for <linux-mtd@lists.infradead.org>; Wed, 15 Sep 2021 09:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631696740;
 bh=X7Cc3jU81HRUvI9Nu63KcpmXz37KgSemXGthehwJJeg=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=CUerVHaNwS+LaBH1z4i2I9dF9ZawSFEpGJc97A0Qk+8lUhsSy5vKQmK6GoJhIu1yB
 /OgHOf1Iftu0u+5oraWJliNJwyJ2jDR8sIALsDoogV2jr17BAmVXIwq2a2tkaibXcH
 cT85G2Pl+GcQ9HolyKV9SlLI80kcESDEp1nL2tFc8LekRltvDpSp02Q9fuonsoCsiF
 ctoyuutwR2Tu9+UTFQOUe44HXbL6OPnV0SmYUh8PbBNTvFr6CWlQrKhjvXauB3f9TT
 hHOVYpvxsZHweFVMZSSYqskWvPfCDwE0q8Wog0507HK+QKEVeAxYwGCsK3e+/Q/r0b
 jAI57NTeAWDow==
Received: by mail-ed1-f71.google.com with SMTP id
 y10-20020a056402270a00b003c8adc4d40cso1215091edd.15
 for <linux-mtd@lists.infradead.org>; Wed, 15 Sep 2021 02:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X7Cc3jU81HRUvI9Nu63KcpmXz37KgSemXGthehwJJeg=;
 b=QFhQqsfbo/iICdZVkpqu963oQI1MQJry7/9n8pmBAebyWw1Yp9WJm+w1GBFF0JIo5N
 3OhhdsJac7c3OvKBxrr6DU3ahx8epXK2SR1dMBZ31MA2dDMA4kiXS2QuL8GUZaYbOMjt
 xyIpTnqhfPikNQvIxvV16RLE1hXDGO4I2W1cRd6kxDjeGz2ocTSjRNqleABi1toJ70XA
 GI6SyvPC8HFTujVRh9gFCZxP1/JJp6mLKmHHulOnthmA64TO3lyPGwEQJGSJ0G2JjbYn
 V9qamj0tpyEDWPbRmhIJX8y2+pklCY4hwNCMbNUc9QbRZcxXtGsQQo7YLfiZop1U/FiJ
 MoAQ==
X-Gm-Message-State: AOAM533EIa+eJVwUn7BDdJ0vX8VGt7uUHVuhjJSdWi7yF/Vk8sKBp5Vn
 cAGvVRjqoCn7V/2YjNMUSHReRNdHeIx1CtezazLob3kyVstRr0ly+y9nszfNK3XxUppy3+4WR93
 Ww/ias2mwuSL4qxeqsIk4t25yyREy26llkAp5NZX7kec=
X-Received: by 2002:a17:907:7613:: with SMTP id
 jx19mr24334740ejc.453.1631696739813; 
 Wed, 15 Sep 2021 02:05:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD9fO3zbzPRg3ejtmsih8V9NIThIYB0jKBalTlLEm2XpSRUk4IVkXNzIOR7td1TQ+/UiTNCQ==
X-Received: by 2002:a17:907:7613:: with SMTP id
 jx19mr24334728ejc.453.1631696739675; 
 Wed, 15 Sep 2021 02:05:39 -0700 (PDT)
Received: from [192.168.3.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id c5sm6843180edx.81.2021.09.15.02.05.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 02:05:39 -0700 (PDT)
Subject: Re: [PATCH v4 8/8] memory: gpmc-omap: "gpmc, device-width" DT property
 is optional
To: Roger Quadros <rogerq@kernel.org>, tony@atomide.com
Cc: robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-9-rogerq@kernel.org>
 <e0c4759b-7c2d-e32c-f912-8409c1f65b49@canonical.com>
 <6a06f4bd-f20a-8b5a-c152-0877707670ff@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <1b915c39-fd6d-3c3c-e4bf-4df9a694dfb6@canonical.com>
Date: Wed, 15 Sep 2021 11:05:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6a06f4bd-f20a-8b5a-c152-0877707670ff@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_020542_844778_555412D1 
X-CRM114-Status: GOOD (  16.52  )
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

On 15/09/2021 10:47, Roger Quadros wrote:
> Hi Krzysztof,
> 
> On 15/09/2021 10:12, Krzysztof Kozlowski wrote:
>> On 14/09/2021 14:27, Roger Quadros wrote:
>>> Check for valid gpmc,device-width, nand-bus-width and bank-width
>>> at one place. Default to 8-bit width if none present.
>>>
>>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>>> ---
>>>  drivers/memory/omap-gpmc.c | 41 ++++++++++++++++++++++++--------------
>>>  1 file changed, 26 insertions(+), 15 deletions(-)
>>>
>>
>> All the comments from v3 are still applicable because it seems you
>> ignored them. Please respond to them.
>>
>> It's the second patch where the reviewer's comments got lost, so it
>> creates rather poor impression.
> 
> I was wondering what comments and then realized that gmail server has put
> all your messages into spam folder.
> 
> I'm very sorry about that. I will address your comments ASAP.

Oops. There were just two emails from me for v3. Can you send me
(privately) the headers from my emails so I can investigate why they
ended up on Spam?

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
