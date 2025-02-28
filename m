Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C560DC282C1
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2025 01:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7ETXR6K5R5R9noQzFwXl0ZWY6pkaR41WxZLiQMqLqk=; b=DZLp/qnhk7ABPL
	vDzejbnQu20a2NkTeri2+3s3RH3KyGv04IKTFdBaXQ7xaRBLjXGXdtaQiLnDKgd3DGU6/T2H4luMR
	ZsYjVVNSeH1yD/U4zPFd+M8mHsIscYI6M+jJwtKiB69V9dq//P72rZlNF0QsF+3zcoMJ+PSJ62TQg
	tCqr806fxlegBj/B2IZ57QM4//X1KGlAdZbTTXIQGjbStgiXJPqRXv5qYYqcc1cnR81qTjYqjfgYL
	oOjtHWaRJFGdKZXzhdcggS+dUa/y5FK7hwg5zPoOw82FFZhD2sMxHEVmMTiS5V7qqpH9QV7r6+OKE
	5ubV9p/0XCHpPCoXpgUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnpXm-00000009QoA-332B;
	Fri, 28 Feb 2025 01:52:02 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnpXk-00000009Qnm-0VFP
	for linux-mtd@lists.infradead.org;
	Fri, 28 Feb 2025 01:52:01 +0000
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 51S1ouig2394050
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 27 Feb 2025 17:50:57 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 51S1ouig2394050
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1740707463;
	bh=zdxlCZN7qRmiM8/WMWaSChORmP5U1+mg9Dd2GNfsbGA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=hc1WnleyPiNvmeMgkj0Fbb3sTWrGCmnnaxiRXiZvVvO6Is3ZJKu6mp+YJv2Dbs05X
	 aVxT1zsm98Egcx7g7dDapGUM1ppk6QkyAa2wZSKXLVi8I4OeDG/xzxwpW4dEA2MBFx
	 T1ntM64Z768sGTrScS8Wa6oiWHo2Bu8akRlkAIPTgcwVRV0sgRtvWguE9SobXFYNdw
	 ClhsdUIvwPyfzfAd+XeT/JQ5MtCRtjegffTL4YeiMAwTwSfCb9k77v5gFOVLmhUpKy
	 VYHzzZXLAdv9xzXZj/lrKYrLB5diO6XmkXYCixEjE5jI7GVtxQxUpXMNKybtxiJAEr
	 DXDmmmDy5eD+w==
Date: Thu, 27 Feb 2025 17:50:55 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: David Laight <david.laight.linux@gmail.com>,
        Yury Norov <yury.norov@gmail.com>
CC: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
        hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
        johannes@sipsolutions.net, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, akpm@linux-foundation.org, alistair@popple.id.au,
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
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
User-Agent: K-9 Mail for Android
In-Reply-To: <20250227215741.1c2e382f@pumpkin>
References: <20250223164217.2139331-1-visitorckw@gmail.com> <20250223164217.2139331-3-visitorckw@gmail.com> <Z7zIBwH4aUA7G9MY@thinkpad> <20250226222911.22cb0c18@pumpkin> <Z8CpaaHv0ahHFVuK@thinkpad> <20250227215741.1c2e382f@pumpkin>
Message-ID: <EF874FA4-2719-44EA-B0DB-93A0980142BE@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_175200_157465_BEDBA25F 
X-CRM114-Status: GOOD (  22.60  )
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

On February 27, 2025 1:57:41 PM PST, David Laight <david.laight.linux@gmail.com> wrote:
>On Thu, 27 Feb 2025 13:05:29 -0500
>Yury Norov <yury.norov@gmail.com> wrote:
>
>> On Wed, Feb 26, 2025 at 10:29:11PM +0000, David Laight wrote:
>> > On Mon, 24 Feb 2025 14:27:03 -0500
>> > Yury Norov <yury.norov@gmail.com> wrote:
>> > ....  
>> > > +#define parity(val)					\
>> > > +({							\
>> > > +	u64 __v = (val);				\
>> > > +	int __ret;					\
>> > > +	switch (BITS_PER_TYPE(val)) {			\
>> > > +	case 64:					\
>> > > +		__v ^= __v >> 32;			\
>> > > +		fallthrough;				\
>> > > +	case 32:					\
>> > > +		__v ^= __v >> 16;			\
>> > > +		fallthrough;				\
>> > > +	case 16:					\
>> > > +		__v ^= __v >> 8;			\
>> > > +		fallthrough;				\
>> > > +	case 8:						\
>> > > +		__v ^= __v >> 4;			\
>> > > +		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
>> > > +		break;					\
>> > > +	default:					\
>> > > +		BUILD_BUG();				\
>> > > +	}						\
>> > > +	__ret;						\
>> > > +})
>> > > +  
>> > 
>> > You really don't want to do that!
>> > gcc makes a right hash of it for x86 (32bit).
>> > See https://www.godbolt.org/z/jG8dv3cvs  
>> 
>> GCC fails to even understand this. Of course, the __v should be an
>> __auto_type. But that way GCC fails to understand that case 64 is
>> a dead code for all smaller type and throws a false-positive 
>> Wshift-count-overflow. This is a known issue, unfixed for 25 years!
>
>Just do __v ^= __v >> 16 >> 16
>
>> 
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=4210
>>  
>> > You do better using a __v32 after the 64bit xor.  
>> 
>> It should be an __auto_type. I already mentioned. So because of that,
>> we can either do something like this:
>> 
>>   #define parity(val)					\
>>   ({							\
>>   #ifdef CLANG                                          \
>>   	__auto_type __v = (val);			\
>>   #else /* GCC; because of this and that */             \
>>   	u64 __v = (val);			        \
>>   #endif                                                \
>>   	int __ret;					\
>> 
>> Or simply disable Wshift-count-overflow for GCC.
>
>For 64bit values on 32bit it is probably better to do:
>int p32(unsigned long long x)
>{
>    unsigned int lo = x;
>    lo ^= x >> 32;
>    lo ^= lo >> 16;
>    lo ^= lo >> 8;
>    lo ^= lo >> 4;
>    return (0x6996 >> (lo & 0xf)) & 1;
>}
>That stops the compiler doing 64bit shifts (ok on x86, but probably not elsewhere).
>It is likely to be reasonably optimal for most 64bit cpu as well.
>(For x86-64 it probably removes a load of REX prefix.)
>(It adds an extra instruction to arm because if its barrel shifter.)
>
>
>> 
>> > Even the 64bit version is probably sub-optimal (both gcc and clang).
>> > The whole lot ends up being a bit single register dependency chain.
>> > You want to do:  
>> 
>> No, I don't. I want to have a sane compiler that does it for me.
>> 
>> > 	mov %eax, %edx
>> > 	shrl $n, %eax
>> > 	xor %edx, %eax
>> > so that the 'mov' and 'shrl' can happen in the same clock
>> > (without relying on the register-register move being optimised out).
>> > 
>> > I dropped in the arm64 for an example of where the magic shift of 6996
>> > just adds an extra instruction.  
>> 
>> It's still unclear to me that this parity thing is used in hot paths.
>> If that holds, it's unclear that your hand-made version is better than
>> what's generated by GCC.
>
>I wasn't seriously considering doing that optimisation.
>Perhaps just hoping is might make a compiler person think :-)
>
>	David
>
>> 
>> Do you have any perf test?
>> 
>> Thanks,
>> Yury
>

What the compiler people need to do is to not make __builtin_parity*() generate crap.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
