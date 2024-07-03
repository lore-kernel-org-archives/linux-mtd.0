Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FFEC30653
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2024 16:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=buS8CeoA90EpSWDmbUYzaBGDtTb8Hkhhozw3NSuX3+o=; b=j85Q+cYaYpTFdW
	dNVkiWfWz8tKmCDVvLLxJi8xVJfGkYJiqqCBAgMKJLckYbPS+xbOlviMhYqhLSJ1RUfUJIvE/pZQ8
	Z+mGpbxC3UWkG3iL9nnpeF2AaArOJ4Ly+869HB8EHiwZ6lXaUKc4tqTbWHIr/dcN4rFwo3+1iQa5M
	TTfjY0FgxSJwH9F5OXg+yk7cVTEvsvcoPANgh64kkM05qfxUkIiCXcDw+lunVzM2a2TR33LPJDVQi
	14Zgm8PbhZBPGQVBrn2inj7Aai9nNby7yVxiIvOKrWX7MaqOId/QKmHvq/I4LiwhMkmHr9cRDLD6t
	EvndSL3c9iplnfHk9sEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP31q-0000000Asb9-2SoN;
	Wed, 03 Jul 2024 16:40:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP31o-0000000Asal-0BSr
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jul 2024 16:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720024817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f/NKPoncPw4sIDqFM3t6GuhdQa0oQUQo4XXTqMGF3ME=;
	b=Hr1hiLguSGzp+Ntsm0ONhMyTT/yPsioiNQjnA+1D3qy+IV6yvHXOJzQ4SiXax7Tvx0TTEm
	lwwwHBWezU7N0TUF8ENVncZCvOhFx3eDkRrms7TXbb2yKds5k8GzAB1opWxu9jtYC50fkA
	Sl/uGgiySc0510ha6304DOOEdwMp4zs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-ZfAL5y2BPK6aQZ8F6nA_vA-1; Wed, 03 Jul 2024 12:40:16 -0400
X-MC-Unique: ZfAL5y2BPK6aQZ8F6nA_vA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42490ae735dso51264125e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 03 Jul 2024 09:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720024815; x=1720629615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/NKPoncPw4sIDqFM3t6GuhdQa0oQUQo4XXTqMGF3ME=;
        b=gdXsK31666vGN+qIWvGmZ6QSEGafZEXU5XvOu8PxNcO5PNxyY28urqEARuhEiCEPJJ
         g0THSqWAXn5WvbFpTMg6aZ6QRP9lR8Xv+q3whoi8XADqNEyqvO0/zm8xQNvDw4Lvhcrw
         aYKackcn+TMdNul2XLCnSI2XcvIEEK+pNTSytWB+TaVjloizhqYB4kxEez1tdMVW1cBU
         zdpErc4kBPPy7ilBbT85Rr/uT1RLZzZZnCPM0BGASNlgxMqc06BOPXUFSbDLeI6JqQXq
         UoVdK4bS3QrdnqxOywsky8OBr1R6X7LxkOtpYIHuK8gh4fjW2VVe5w9B/MKLHR9EIigu
         vefQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw/tbeBMQ5K7muXqZyGNzdpDCoo7rI/PZsnjzbxAMiX4jwLc1/H0hKKKVW3M3+C9ne4D5UewDQueMvF2TthWOLfm82haaHu/otiinwIw==
X-Gm-Message-State: AOJu0YyEZlh5zlal+hBzl7icEGNRGsCAd5JW7Frz4IAal4JDr3BJFQCH
	Nj5KJvvPtON4ZZMehCkSy6iIAmMe4NOzE/sfITOSGAwy4EzcfUJ38kPvweiDT2omyb6ZgD7dRGW
	6wevJt2oUpKzxVTUpK65cEnRrAV7Zp9iyinqF0/QGhd2NKub9TuKB8B8Fg5K/W4c=
X-Received: by 2002:adf:fa83:0:b0:367:890e:838e with SMTP id ffacd0b85a97d-367890e86c6mr3596786f8f.40.1720024815352;
        Wed, 03 Jul 2024 09:40:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFECIbpt3OJn614ksUNxWcM5kxqBGXD+RFA85ATl3K5a4iBL/0MjztMRm9i7OEdpByRhuroqQ==
X-Received: by 2002:adf:fa83:0:b0:367:890e:838e with SMTP id ffacd0b85a97d-367890e86c6mr3596739f8f.40.1720024814927;
        Wed, 03 Jul 2024 09:40:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b? ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36791d7a93bsm2401812f8f.81.2024.07.03.09.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 09:40:14 -0700 (PDT)
Message-ID: <9e7023f4-775c-4371-ade5-1ed860545aaa@redhat.com>
Date: Wed, 3 Jul 2024 18:40:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
To: Kees Cook <kees@kernel.org>, Petr Mladek <pmladek@suse.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Uros Bizjak <ubizjak@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20240702122639.248110-1-jfalempe@redhat.com>
 <202407021326.E75B8EA@keescook>
 <10ea2ea1-e692-443e-8b48-ce9884e8b942@redhat.com>
 <ZoUKM9-RiOrv0_Vf@pathway.suse.cz> <202407030926.D5DA9B901D@keescook>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <202407030926.D5DA9B901D@keescook>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_094020_198569_D3A27333 
X-CRM114-Status: GOOD (  26.57  )
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



On 03/07/2024 18:27, Kees Cook wrote:
> On Wed, Jul 03, 2024 at 10:22:11AM +0200, Petr Mladek wrote:
>> On Wed 2024-07-03 09:57:26, Jocelyn Falempe wrote:
>>>
>>>
>>> On 02/07/2024 22:29, Kees Cook wrote:
>>>> On Tue, Jul 02, 2024 at 02:26:04PM +0200, Jocelyn Falempe wrote:
>>>>> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
>>>>> callback.
>>>>> This patch adds a new struct kmsg_dump_detail, that will hold the
>>>>> reason and description, and pass it to the dump() callback.
>>>>
>>>> Thanks! I like this much better. :)
>>>>
>>>>>
>>>>> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
>>>>> function and a macro for backward compatibility.
>>>>>
>>>>> I've written this for drm_panic, but it can be useful for other
>>>>> kmsg_dumper.
>>>>> It allows to see the panic reason, like "sysrq triggered crash"
>>>>> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
>>>>>
>>>>> v2:
>>>>>    * Use a struct kmsg_dump_detail to hold the reason and description
>>>>>      pointer, for more flexibility if we want to add other parameters.
>>>>>      (Kees Cook)
>>>>>    * Fix powerpc/nvram_64 build, as I didn't update the forward
>>>>>      declaration of oops_to_nvram()
>>>>
>>>> The versioning history commonly goes after the "---".
>>>
>>> ok, I was not aware of this.
>>>>
>>>>> [...]
>>>>> diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
>>>>> index 906521c2329c..65f5a47727bc 100644
>>>>> --- a/include/linux/kmsg_dump.h
>>>>> +++ b/include/linux/kmsg_dump.h
>>>>> @@ -39,6 +39,17 @@ struct kmsg_dump_iter {
>>>>>    	u64	next_seq;
>>>>>    };
>>>>> +/**
>>>>> + *struct kmsg_dump_detail - kernel crash detail
>>>>
>>>> Is kern-doc happy with this? I think there is supposed to be a space
>>>> between the "*" and the first word:
>>>>
>>>>    /**
>>>>     * struct kmsg...
>>>>
>>>>
>>> Good catch, yes there is a space missing.
>>>
>>> I just checked with "make htmldocs", and in fact include/linux/kmsg_dump.h
>>> is not indexed for kernel documentation.
>>> And you can't find the definition of struct kmsg_dumper in the online doc.
>>> https://www.kernel.org/doc/html/latest/search.html?q=kmsg_dumper
>>>
>>>> Otherwise looks good to me!
>>>>
>>>
>>> Thanks.
>>>
>>> As this patch touches different subsystems, do you know on which tree it
>>> should land ?
>>
>> Andrew usually takes patches against kernel/panic.c.
>>
>> Or you could take it via the DRM tree, especially if you already have the code
>> using the string.

If it's not taken in Andrew's tree next week, I will see if I can push 
it to the drm-misc tree. I think there is a very low chance of conflicts.

>>
>> Also I could take it via the printk tree. The only complication is
>> that I am going to be away the following two weeks and would come
>> back in the middle of the merge window. I do not expect much problems
>> with this change but...
> 
> If DRM doesn't want to carry it, I can put it in through the pstore
> tree. Let me know! :)
> 

Thanks for the proposition, I will see how it goes, it would be nice to 
have it in time for the v6.11 merge window.

Best regards,

-- 

Jocelyn


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
