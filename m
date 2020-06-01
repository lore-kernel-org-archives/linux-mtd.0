Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92385C433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 23:45:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62F5B2073B
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 23:45:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W6Vjb7Sf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="KFDU8BIW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62F5B2073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2SRn/x3L7VQkpvUwYqy31KtqIwEdbcn2pn6Rz3vk4tc=; b=W6Vjb7Sfxfvoos
	VIutRXCqwbOtKEsvsk3oMztDkjtpAhvvZ4zw5mnUERxaTtn/clvthaZ+nFqcxLEA3GBS8khr0NKII
	GTmHF288PqWVzBinMup9WeoFW18TPO2zyIu+6o2fMdvuynRbc3Sqwn8WvLhGEzZpu02jLFqp53H+i
	/ujFGRSs9DHb4RYcDkWlScx17Dvha+CtWBJx42Vm2ldVc/Uc7sp6mPAyqo9J41udUkAeeKUIsrHtK
	ASzcqdd49qNfyQ1W+p/B10ndiPa3YpcCxa0aUbbiJRGn39J8N3mWwFYQoAIpkxCbFrfQA93sAt/Db
	PhnXcr0qoKG10TpF0z7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfu7F-0008Qg-0Y; Mon, 01 Jun 2020 23:45:13 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfu7A-0007Sd-EP
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 23:45:10 +0000
Received: by mail-pf1-x441.google.com with SMTP id a127so2150550pfa.12
 for <linux-mtd@lists.infradead.org>; Mon, 01 Jun 2020 16:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vyPoEsv/I2eVK5hwqA65rBsDKDslWsx71fcvG+8KNzI=;
 b=KFDU8BIWZM2FNNx2CqO8lpaacvWwk2jR6xt4klFY9SPrk078rsBQO6vevOgBTREXeQ
 MPydLEn7j+War6lLMILSnmPqObBhbU5VNG1d6IMh3XqqhakAzexd1Yo+WgbZ/um792rF
 uD1UfurdQX7B0etPmjqaFGIlXrGVcbPPai3b1rhdjlx6JYFMB/d73sdaZ9BuekPJQxle
 AcHqUQakuLeNdBBfCuAHTcdHk1Fo9bz/zAxyT75bE9VHMWENBK6H58sSYH3/c3Bc4IPH
 uBk6M4kLgvkTnInP9uhgx62aqQY5G4DpW4ejrEOpJ5naN75F1lTLTi09arXpVM1815t1
 f01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vyPoEsv/I2eVK5hwqA65rBsDKDslWsx71fcvG+8KNzI=;
 b=C+ACl+05VjolmdOkocx+nCAXfTBHTz7ypI3D+BKcbWpkw5Au2qyNLB265gp3cK4eqS
 vNDkhRvor5/v5EqNwQ2k1YkDohVAXMKko1mQzdgOIPEefuXBbAj5z8cA3ofyKxo+3jAv
 TqVHtL9OIPZNd++hprnyfcOB2g8HFP5PrFbsuz4tMQP9QwqgkWTx19Uy6DlkSvljOmnA
 /2gYN6IbcmSvM332GIOV90C2amS+bwncoFrptDK5y9KWF1vRbCgUk7UrUdE9WIxTX34S
 fA5XO2oNyw10nInLKY1LNf+mqkhel3yo17DhT5+2xqfMwqlOhczQKr4+j+1J4VyJeHlT
 +BQg==
X-Gm-Message-State: AOAM533csslVmKs7qMZ8b4hlj7KtrLxVMq8q18x6OtD74BPcZUnz5uYI
 F0nHxfW+KI2Hmw7gkGLv1KsX+dvDfEM0Pw==
X-Google-Smtp-Source: ABdhPJzrJvPQVF0Gp8Rx9FtbrvnFWhyn3akXwf1d7cQZcylnZ/5ViHG1/YqXoOvQw8fykt0bg/4N7w==
X-Received: by 2002:a63:5d62:: with SMTP id o34mr21024673pgm.420.1591055106759; 
 Mon, 01 Jun 2020 16:45:06 -0700 (PDT)
Received: from [192.168.1.188] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id z29sm439937pff.120.2020.06.01.16.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:45:06 -0700 (PDT)
Subject: Re: [PATCH] block: Flag elevators suitable for single queue
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "ming.lei@redhat.com" <ming.lei@redhat.com>
References: <20200528081003.238804-1-linus.walleij@linaro.org>
 <20200601074957.GE1181806@T590>
 <CACRpkdYL4-Z=kaS+RfniVr=Sn-yOf+=CKMJDsn=eTK3atmGohg@mail.gmail.com>
 <20200601115818.GB1190838@T590>
 <CAPDyKFq2paDu9ogEFh6VXWq8___FLeEaNyBWhkMSdpZYpEytQQ@mail.gmail.com>
 <7f9aaf69b24b794ca4c9c126eb2394862e276c73.camel@wdc.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <6bda7563-fc47-e049-ed55-265f58ae522c@kernel.dk>
Date: Mon, 1 Jun 2020 17:45:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7f9aaf69b24b794ca4c9c126eb2394862e276c73.camel@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_164508_524780_E32DE3A8 
X-CRM114-Status: GOOD (  25.46  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "paolo.valente@linaro.org" <paolo.valente@linaro.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "jthumshirn@suse.de" <jthumshirn@suse.de>, "hch@lst.de" <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 6/1/20 5:37 PM, Damien Le Moal wrote:
> On Mon, 2020-06-01 at 14:53 +0200, Ulf Hansson wrote:
>> On Mon, 1 Jun 2020 at 13:58, Ming Lei <ming.lei@redhat.com> wrote:
>>> On Mon, Jun 01, 2020 at 01:36:54PM +0200, Linus Walleij wrote:
>>>> On Mon, Jun 1, 2020 at 9:50 AM Ming Lei <ming.lei@redhat.com> wrote:
>>>>> On Thu, May 28, 2020 at 10:10:03AM +0200, Linus Walleij wrote:
>>>>>> The Kyber block scheduler is not suitable for single hardware
>>>>>> queue devices, so add a new flag for single hardware queue
>>>>>> devices and add that to the deadline and BFQ schedulers
>>>>>> so the Kyber scheduler will not be selected for single queue
>>>>>> devices.
>>>>>
>>>>> The above may not be true for some single hw queue high performance HBA(
>>>>> such as megasas), which can get better performance from none, so it is
>>>>> reasonable to get better performance from kyber, see 6ce3dd6eec11 ("blk-mq:
>>>>> issue directly if hw queue isn't busy in case of 'none'"), and the
>>>>> following link:
>>>>>
>>>>> https://lore.kernel.org/linux-block/20180710010331.27479-1-ming.lei@redhat.com/
>>>>
>>>> I see, but isn't the case rather that none is preferred and kyber gives
>>>> the same characteristics because it's not standing in the way
>>>> as much?
>>>
>>> Kyber has its own characteristic, such as fair read & write, better
>>> IO merge. And the decision on scheduler isn't only related with device,
>>> but also with workloads.
>>>
>>>> It looks like if we should add a special flag for these devices with
>>>> very fast single queues so they can say "I prefer none", do you
>>>> agree?
>>>
>>> I am not sure if it is easy to add such flag, because it isn't only
>>> related with HBA, but also with the attached disks.
>>>
>>
>> In general I don't mind the idea of giving hints from lower layer
>> block devices, about what kind of scheduling algorithm that could make
>> sense (as long it's on a reasonable granularity).
>>
>> If I understand your point correctly, what you are saying is that it
>> isn't easy or even possible for some block devices HWs. However, that
>> should be fine, as it wouldn't be mandatory to set this kind of flags,
>> but
>> instead could help where we see it fit, right?
> 
> The elevator features flag was implemented not as a hint, but as hard
> requirements for elevators that are needed (mandatory) for a particular
> device type for correct operation. By correct operation, I mean "no IO
> errors or weird behavior resulting in errors such as timeouts". Until
> now, the only hard requirement we have is for zoned block devices which
> need mq-deadline to guarantee in-order dispatch of write commands (for
> sequential zones writing).
> 
> We definitely could add hint flags to better help the block layer
> decide on the default optimal elevator for a particular device type,
> but as is, the elevator features will completely prevent the use of any
> other elevator that does not have the feature set. Those elevators will
> not be seen in /sys/block/<dev>/queue/scheduler. This may be a little
> too much for hint level rather than hard requirement.
> 
> Furthermore, as Ming said, this depends on the HBA too rather than just
> the device itself. E.g. the smartpqi driver (Microsemi SAS HBAs)
> exposes single hard-disks as well as fast RAID arrays as multi-queue
> devices. While kyber may make sense for the latter, it probably does
> not make much sense for the former.
> 
> In kernel vs udev rules for setting the optimal elevator for a
> particular device type should also be considered.

Agree, the elevator flags are hard requirements, which doesn't match
what this patch is trying to do. There's absolutely nothing wrong with
using none or kyber on single queue devices, hence it should be possible
to configure it as such.

-- 
Jens Axboe


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
