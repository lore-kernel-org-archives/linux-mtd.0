Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F31C021BF
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2025 00:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEvAVJfXIlyD/tUmScU5a8fK/CIMzWxivQvBnbLgy2o=; b=4IXAofA7wjPm6l
	O+ov+oWzmHp+BGhDFKdcWszFpDbBG7vpLskDCmou5wdNt5HjNs5DnVt8gUJwkq/YjHjrYfo4rXgaU
	gcPD5S1vrovt58bgHz9ZTrogAmHoEexV+kX4GndnMWHILy+x368Zq3yKtY7uX8FLQ6VDAMg1MoKoC
	nnDJGbCo0WaHbBzX+SqrDdmIlvKkmK8xXfcvc/HnerRIZRGCc8KrqYqLVLbNoCOtoFgDRjJ+THvzV
	Vi2zD4gjrphJPRgr9MhKyUMc0tdJTm3Fpu3Syv8fWvfFf4nRoK9o3KEH6XG7Bc+njR5UKIsDEiKFG
	fqpEpERrPnGHDg/CkqfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5JD-00000001sNd-2MzQ;
	Wed, 26 Feb 2025 00:29:55 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5HQ-00000001sD9-0okh
	for linux-mtd@lists.infradead.org;
	Wed, 26 Feb 2025 00:28:05 +0000
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 51Q0Qj6t1485832
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 25 Feb 2025 16:26:45 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 51Q0Qj6t1485832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1740529613;
	bh=/hX8/LeT9m/0VDN5crD4IR806wwsnn6QY9gkxuzs4a0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Vx7b+pHI31WYClRevJ90WGCmYkzsC0O4yjSFPubrFkDlFo2vpZqzZ9G40N2ZAk70A
	 1cQPgYLnd5I5ey7wLfCgJ8Wa0Jqy8sY2mmwkmCFEYEUtcYkP8RXNAjd1Y+xeDCqwyy
	 AVyJIpfagXD4ZTFbnWuOR5XQI14sBmquPHuWbhW+8b2Y38BEQzTU/x+sgB61KqUTHa
	 KrIofANBe7vt+iRKzcTlXNAf7DT6yzoW1HRWvAy9pthuwqTbtWlxOjUH2euKtYzuHK
	 KQskzKcNpxdcsPJFrGasTa7yfZ2Zs9ZcwOmb/PzgE+W9UnEKLynUNcREeGm0XPaNtx
	 a3lIkp85qLD3w==
Date: Tue, 25 Feb 2025 16:26:43 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: David Laight <david.laight.linux@gmail.com>
CC: Uros Bizjak <ubizjak@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
        tglx@linutronix.de, Ingo Molnar <mingo@redhat.com>, bp@alien8.de,
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
        jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org,
        mingo@kernel.org, alistair@popple.id.au, linux@rasmusvillemoes.dk,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, kuba@kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
        oss-drivers@corigine.com, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
        brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
        bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
        Yu-Chun Lin <eleanor15x@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_03/17=5D_x86=3A_Replace_open-c?=
 =?US-ASCII?Q?oded_parity_calculation_with_parity8=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250225224623.6edaaaa9@pumpkin>
References: <20250223164217.2139331-1-visitorckw@gmail.com> <20250223164217.2139331-4-visitorckw@gmail.com> <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com> <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com> <20250225224623.6edaaaa9@pumpkin>
Message-ID: <E07B61E5-324E-4CDC-AE68-A63CDF4325F4@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_162804_335291_5876F5CA 
X-CRM114-Status: GOOD (  14.48  )
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

On February 25, 2025 2:46:23 PM PST, David Laight <david.laight.linux@gmail.com> wrote:
>On Mon, 24 Feb 2025 13:55:28 -0800
>"H. Peter Anvin" <hpa@zytor.com> wrote:
>
>> On 2/24/25 07:24, Uros Bizjak wrote:
>> > 
>> > 
>> > On 23. 02. 25 17:42, Kuan-Wei Chiu wrote:  
>> >> Refactor parity calculations to use the standard parity8() helper. This
>> >> change eliminates redundant implementations and improves code
>> >> efficiency.  
>...
>> Of course, on x86, parity8() and parity16() can be implemented very simply:
>> 
>> (Also, the parity functions really ought to return bool, and be flagged 
>> __attribute_const__.)
>> 
>> static inline __attribute_const__ bool _arch_parity8(u8 val)
>> {
>> 	bool parity;
>> 	asm("and %0,%0" : "=@ccnp" (parity) : "q" (val));
>> 	return parity;
>> }
>> 
>> static inline __attribute_const__ bool _arch_parity16(u16 val)
>> {
>> 	bool parity;
>> 	asm("xor %h0,%b0" : "=@ccnp" (parity), "+Q" (val));
>> 	return parity;
>> }
>
>The same (with fixes) can be done for parity64() on 32bit.
>
>> 
>> In the generic algorithm, you probably should implement parity16() in 
>> terms of parity8(), parity32() in terms of parity16() and so on:
>> 
>> static inline __attribute_const__ bool parity16(u16 val)
>> {
>> #ifdef ARCH_HAS_PARITY16
>> 	if (!__builtin_const_p(val))
>> 		return _arch_parity16(val);
>> #endif
>> 	return parity8(val ^ (val >> 8));
>> }
>> 
>> This picks up the architectural versions when available.
>
>Not the best way to do that.
>Make the name in the #ifdef the same as the function and define
>a default one if the architecture doesn't define one.
>So:
>
>static inline parity16(u16 val)
>{
>	return __builtin_const_p(val) ? _parity_const(val) : _parity16(val);
>}
>
>#ifndef _parity16
>static inline _parity16(u15 val)
>{
>	return _parity8(val ^ (val >> 8));
>}
>#endif
>
>You only need one _parity_const().
>
>> 
>> Furthermore, if a popcnt instruction is known to exist, then the parity 
>> is simply popcnt(x) & 1.
>
>Beware that some popcnt instructions are slow.
>
>	David
>
>> 
>> 	-hpa
>> 
>> 
>

Seems more verbose than just #ifdef _arch_parity8 et al since the const and generic code cases are the same (which they aren't always.)

But that part is a good idea, especially since on at least *some* architectures like x86 doing: 

#define _arch_parity8(x) __builtin_parity(x)

... etc is entirely reasonable and lets gcc use an already available parity flag should one be available.

The inline wrapper, of course, takes care of the type mangling.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
