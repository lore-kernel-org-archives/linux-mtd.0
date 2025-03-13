Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6501C28B2F
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 00:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5f5aMQiJ8bTQiRxRIrygpdXs57m2tM15KO6sbqCkFQ=; b=gcYIMlClauJam+
	IYzYMCr+qv+RObmFRPUT4x18HUXQXDsFj1ngTyUwbYeVZuyJo9Rmd/zQeou92bHOThRM8hpqjp2S5
	R2UT6LKJBXsw+7085zNtTh3OdNIzmvA7n7iJJKVFGfvq4JY/52lgOjTbi2ORdjiuwDagRofcFVRqG
	j1VeoE0elRCPLYEq8QiaEOlpu3g0gTo1JesBPM5/lXRHmHENpmyJDHkhoJOjnV260q3UgNH7SlxLk
	R30PRVnkC0RHX9fwBOFjDUhqmaKFlXXfJu3+Y7dpZN86RkX9wsG3fbG7pKBAjM8LheP4i+2UBYjlc
	nhygGhwLjp56hGmftu8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsW9u-00000009nEO-1yvn;
	Thu, 13 Mar 2025 00:10:46 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsW9s-00000009nDl-474K
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 00:10:46 +0000
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52D09Gjf2730497
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 12 Mar 2025 17:09:16 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52D09Gjf2730497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741824561;
	bh=pOuTjU0DLlw9muSdV/bvRsUk/zEVswSeTDmcSBtrmzk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=JP9c4+NI9BKncKU+1PsEB9cZeQpNxCxpJ0LmRuYoHNmwWD/IZKSycv5sN9IICpIEz
	 fR/hn+rQhnfZM1uUiHFsG6gUoBL9neiS+JGil7wI30UkDhHcG1QRaLCxVEOb8Avej8
	 KQCseXzhw1xoqlckAoMQLS0jGXtjlqSg5eaOuTyA+VT8jx0ImUcERkYzUzACSp2jWz
	 iveP8ZtK+pI4qfkTCfKTJm+BI905HMMN61AY3/MbPJkw2r62IkxWg6XH1CtdvGTrlr
	 6CALlw7rm8dk1ZxjmoEuThEn4j6+yLh7OqapigzBfq/66ixFRWdc3P5KvqHGfpwwnf
	 wFX8jsnXRMF2A==
Date: Wed, 12 Mar 2025 17:09:16 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Jacob Keller <jacob.e.keller@intel.com>,
        David Laight <david.laight.linux@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>, Kuan-Wei Chiu <visitorckw@gmail.com>,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
        joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
        hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
        johannes@sipsolutions.net, gregkh@linuxfoundation.org,
        yury.norov@gmail.com, akpm@linux-foundation.org, alistair@popple.id.au,
        linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
        oss-drivers@corigine.com, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
        brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
        bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
        Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
User-Agent: K-9 Mail for Android
In-Reply-To: <cbb26a91-807b-4227-be81-8114e9ea72cb@intel.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com> <20250306162541.2633025-2-visitorckw@gmail.com> <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org> <Z8ra0s9uRoS35brb@gmail.com> <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org> <20250307193643.28065d2d@pumpkin> <cbb26a91-807b-4227-be81-8114e9ea72cb@intel.com>
Message-ID: <0F794C6F-32A9-4F34-9516-CEE24EA4BC49@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_171045_015656_FF5E919D 
X-CRM114-Status: GOOD (  20.23  )
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

On March 12, 2025 4:56:31 PM PDT, Jacob Keller <jacob.e.keller@intel.com> wrote:
>
>
>On 3/7/2025 11:36 AM, David Laight wrote:
>> On Fri, 7 Mar 2025 12:42:41 +0100
>> Jiri Slaby <jirislaby@kernel.org> wrote:
>> 
>>> On 07. 03. 25, 12:38, Ingo Molnar wrote:
>>>>
>>>> * Jiri Slaby <jirislaby@kernel.org> wrote:
>>>>   
>>>>> On 06. 03. 25, 17:25, Kuan-Wei Chiu wrote:  
>>>>>> Change return type to bool for better clarity. Update the kernel doc
>>>>>> comment accordingly, including fixing "@value" to "@val" and adjusting
>>>>>> examples. Also mark the function with __attribute_const__ to allow
>>>>>> potential compiler optimizations.
>>>>>>
>>>>>> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
>>>>>> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
>>>>>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
>>>>>> ---
>>>>>>    include/linux/bitops.h | 10 +++++-----
>>>>>>    1 file changed, 5 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
>>>>>> index c1cb53cf2f0f..44e5765b8bec 100644
>>>>>> --- a/include/linux/bitops.h
>>>>>> +++ b/include/linux/bitops.h
>>>>>> @@ -231,26 +231,26 @@ static inline int get_count_order_long(unsigned long l)
>>>>>>    /**
>>>>>>     * parity8 - get the parity of an u8 value
>>>>>> - * @value: the value to be examined
>>>>>> + * @val: the value to be examined
>>>>>>     *
>>>>>>     * Determine the parity of the u8 argument.
>>>>>>     *
>>>>>>     * Returns:
>>>>>> - * 0 for even parity, 1 for odd parity
>>>>>> + * false for even parity, true for odd parity  
>>>>>
>>>>> This occurs somehow inverted to me. When something is in parity means that
>>>>> it has equal number of 1s and 0s. I.e. return true for even distribution.
>>>>> Dunno what others think? Or perhaps this should be dubbed odd_parity() when
>>>>> bool is returned? Then you'd return true for odd.  
>>>>
>>>> OTOH:
>>>>
>>>>   - '0' is an even number and is returned for even parity,
>>>>   - '1' is an odd  number and is returned for odd  parity.  
>>>
>>> Yes, that used to make sense for me. For bool/true/false, it no longer 
>>> does. But as I wrote, it might be only me...
>> 
>> No me as well, I've made the same comment before.
>> When reading code I don't want to have to look up a function definition.
>> There is even scope for having parity_odd() and parity_even().
>> And, with the version that shifts a constant right you want to invert
>> the constant!
>> 
>> 	David
>
>This is really a question of whether you expect odd or even parity as
>the "true" value. I think that would depend on context, and we may not
>reach a good consensus.
>
>I do agree that my brain would jump to "true is even, false is odd".
>However, I also agree returning the value as 0 for even and 1 for odd
>kind of made sense before, and updating this to be a bool and then
>requiring to switch all the callers is a bit obnoxious...

Odd = 1 = true is the only same definition. It is a bitwise XOR, or sum mod 1.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
