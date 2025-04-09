Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B00CC369A1
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 18:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPZiWoxd9x/phn3T9Y9nbJJ+l97iZ2XIYKObcWxMUv8=; b=kYbCNdO3I8tHe3
	yzYz41TuqaBdkYflkjAA5XAOURyz+QfLK3NFFdynQOTbASMim8KZVTF9A/JOPfavqe4kZps1dJoeg
	flGrUjJosdep6MRF115YyWDq02KLhqb4ebF5lsC5ckHL4sb5boxH1enKXY/Ah940+4fxVLzl4KosX
	DcYS6tzeiT9/RCPWxazOHe7GjG0QV8np5wj3rqT1obgwKPV4417JR757dv8bZgBlGyS8PVX+fFG+M
	WE0/Qf3qkBpUETknRCysMSsB8RMUD556OtsZamkO1Df7MbNzkv9VkYp+MEQi/0XNaEG2oMBXV+bGE
	AS3d0UDkzAqTFZRjisqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2aKk-00000008CWw-3fPp;
	Wed, 09 Apr 2025 18:39:34 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2aKe-00000008CTj-1XtX;
	Wed, 09 Apr 2025 18:39:29 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-224171d6826so102097685ad.3;
        Wed, 09 Apr 2025 11:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744223967; x=1744828767; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=heFgvknjtFAVnh5LT07oSDFMGA94yfUYilk4Quncd6Y=;
        b=ZZ0Yuw6uls15mvjfo8SXpH03CA1BHuRd9BFVQMHZ8ryJVwQ8Um4/ixKuK6ncO7gu8x
         5AIHr1BMKndIvdkledPCxbvcJF5mD2TPVW2BZflxBze5HEds5JM1YUAtV7j8ZoEdlv8l
         IMNeJsVMQDPwE4/Sfh68zh7DPtH/zWpwNgCxgxByjSgVmUl337BBqc60FjhvY2MVJ6VI
         m45JieMIZEE9nRLRvyzCJNnjfynUcdVnpRNQRwXMccjmi0oAtuw0P4ioR3KrLB+5y2/N
         Y2zUzdMk0oiNRUdFzZmuLfLgmjIy1fyYDhQc2LAb9dJBaqj9RelQPmJ/cFkF9KzHnUfL
         OCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744223967; x=1744828767;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heFgvknjtFAVnh5LT07oSDFMGA94yfUYilk4Quncd6Y=;
        b=qPvlIEfPqM6I8dKHKmDhFJX7xX44FRMPo/KcXqofRumJI0iIdXn+IgyRgR7DtzjAns
         s4WmNaAexDze0+garuz5gC3snhB/2pVWXPj+94loqrzi22Ks8qWER8zaycnP0MEED52c
         TzfS1bp+JQQVNaRftFcpKvbGRk8Qj64Y8THpxC32XvJTBicZHbl92exPq9ZOPuA2/84S
         DOMc9iTTGNOZgbNKuZbGo+Cyb/6BKQA1n5Fw7KMhKUhP3HUflVR3/LdlyxY7rWOd0IY9
         c8BWQrjkN9SRftob/U+svCIFC9HQJm90J0i7u9d+4YLvDtP7X/oH3kZzn4geQgtGitvg
         5zTg==
X-Forwarded-Encrypted: i=1; AJvYcCUble0AM7OdL1tDYD4IY6PDYCx+0IfT9sr01+EmqTrbOCRSE+LEADXRWgZC418hhHlgqqK4NQbnWGW+@lists.infradead.org, AJvYcCWaTrCnTMmUi+Klm503Ri7Lrom5e+BeCzMjWCou0dOaSsZwEmwKmeRrrVrIdYzoIhfeedSRGeLMlOw=@lists.infradead.org
X-Gm-Message-State: AOJu0YymwSlHx8s0O8yaq1JgOooHxxkx63W5DTw2NB7zUlbK1soo2E9A
	g+FI2sW+8sbhuulYKD3lUJzk4O9dvf4WtApVATGbivppXxfFArAH
X-Gm-Gg: ASbGncs+tkO7TkCPelDI0Ihxm0/gfalZzYY+2tPAzC1qSkc1rShxmkdkC05aKJxsVDV
	JTmXCmrZe103HHf5KkY50WwXjqos5YHPRmn+sqfcIijW5tLDwNXP/2nVs+ICW4p9zX7cj4HEPGV
	mm8La4azhxcGmEakpW8ACehyxiP2aLziatKD4vUfVpBj4k3IuDQTRNVJimdt8fxS5E8UQHwALuP
	T8LWQEKVVyx0zN6/2NAM3TjG3JVs3F7w/4pckjW6INAq0SsPiVM3uqalJRl/2L7JHSM57rOfxV/
	UC+sX75fwgg5sF5ekRHH4SUlwHeVZdKnjjK1IDHfpKslGJXPJNQ/aM6teY6LS/v2S+2MjgnDGas
	3mD4oirIvXx3uAA==
X-Google-Smtp-Source: AGHT+IGbAcYQ28Tr8ToejeUQ3g8eFYPCcQiv8sSHIhkpS6MKA0JGv+p0sl3c5TBTYw+D7H2xHKtHYw==
X-Received: by 2002:a17:903:2ec8:b0:220:efc8:60b1 with SMTP id d9443c01a7336-22ac3fe6081mr53698205ad.39.1744223967213;
        Wed, 09 Apr 2025 11:39:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62959sm15480135ad.6.2025.04.09.11.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:39:26 -0700 (PDT)
Message-ID: <315b4c75-a596-4509-99f7-921ebda2fed9@roeck-us.net>
Date: Wed, 9 Apr 2025 11:39:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/13] bitops: Change parity8() to parity_odd() with
 u64 input and bool return type
To: Kuan-Wei Chiu <visitorckw@gmail.com>, Yury Norov <yury.norov@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 akpm@linux-foundation.org, jdelvare@suse.com, alexandre.belloni@bootlin.com,
 pgaj@cadence.com, hpa@zytor.com, alistair@popple.id.au,
 linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
 linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
 david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
 Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-2-visitorckw@gmail.com> <Z_anYpZw_E8ehN21@yury>
 <Z/a7t1yATUXn11vD@visitorckw-System-Product-Name>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z/a7t1yATUXn11vD@visitorckw-System-Product-Name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_113928_409732_81CBA870 
X-CRM114-Status: GOOD (  13.27  )
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

On 4/9/25 11:25, Kuan-Wei Chiu wrote:
> On Wed, Apr 09, 2025 at 12:59:14PM -0400, Yury Norov wrote:
>> On Wed, Apr 09, 2025 at 11:43:44PM +0800, Kuan-Wei Chiu wrote:
>>> Redesign the parity8() helper as parity_odd(), changing its input type
>>> from u8 to u64 to support broader use cases and its return type from
>>> int to bool to clearly reflect the function's binary output. The
>>> function now returns true for odd parity and false for even parity,
>>> making its behavior more intuitive based on the name.
>>>
>>> Also mark the function with __attribute_const__ to enable better
>>> compiler optimization, as the result depends solely on its input and
>>> has no side effects.
>>>
>>> While more efficient implementations may exist, further optimization is
>>> postponed until a use case in performance-critical paths arises.
>>>
>>> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
>>> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
>>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
>>> ---
>>>   arch/x86/kernel/bootflag.c               |  4 ++--
>>>   drivers/hwmon/spd5118.c                  |  2 +-
>>>   drivers/i3c/master/dw-i3c-master.c       |  2 +-
>>>   drivers/i3c/master/i3c-master-cdns.c     |  2 +-
>>>   drivers/i3c/master/mipi-i3c-hci/dat_v1.c |  2 +-
>>>   include/linux/bitops.h                   | 19 ++++++++++++-------
>>>   6 files changed, 18 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
>>> index 73274d76ce16..86aae4b2bfd5 100644
>>> --- a/arch/x86/kernel/bootflag.c
>>> +++ b/arch/x86/kernel/bootflag.c
>>> @@ -26,7 +26,7 @@ static void __init sbf_write(u8 v)
>>>   	unsigned long flags;
>>>   
>>>   	if (sbf_port != -1) {
>>> -		if (!parity8(v))
>>> +		if (!parity_odd(v))

What is the benefit of this change all over the place instead of
adding parity_odd() as new API and keeping the old one (just letting
it call the new API) ?

A simple

static inline int parity8(u8 val)
{
	return parity_odd(val);
}

would have done the trick and be much less invasive.

Guenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
