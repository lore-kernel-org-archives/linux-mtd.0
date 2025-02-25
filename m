Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2736DC021B2
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2025 16:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YAUSgO/3maci8sPa6QlC9wAdGZL24gg5r8eJP6GGdwA=; b=HPzJ0FUh1Ynu8A
	NNIqMZjq75QMOrgi6xWHMCcuNdjz4UOUmkrt2LdR5MY+pP3/BJU6XbFmhDuCkDzFekq3b4FkFQ7Cc
	pDlMCz67Rz/Db21pyarDyzrc/ul1XEdhBwV1dY6FsMUb6G5Cep44k/ptN5aj45W8xoZ7uVe5WoLfK
	YMimVaKwUFUYS24TTm53oPgA278/Shy9xOEmok1ztDYVXL+MxvDrf/qemdK/zRnK5KWMP59oLCcMx
	WxV2ekosxJVRRqbLUSNUl8q7GvYzLdzGhxNB7vxldjQ7DGIQjhMBgifB7PI2uhoSnIs6R4DLy11j1
	v5vOrMqM2/bmq9rFnQEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy1T-00000000MGx-0Xqw;
	Tue, 25 Feb 2025 16:43:07 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwny-0000000041b-3mhz
	for linux-mtd@lists.infradead.org;
	Tue, 25 Feb 2025 15:25:08 +0000
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 51PFOHRf1324298
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 25 Feb 2025 07:24:17 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 51PFOHRf1324298
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1740497060;
	bh=WwBGNG5GOM5EDBRYNhpg1dowM06WZaFYwprnE0ohGQo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=gFS3Qbg9090zqrxMgWpV3QU2nlXkwzE0x821QukbyGIMgBkSQpuzxodk+NhODEkKN
	 5h6k3fzgqnVQszi++Fm0zAWkcXoyd9Xkym/XQkMSrQQkzB32FJgavtpnoFmVqMt5+b
	 Ut+jJOF2NsSesEP0cpHx79zg+1Hhp0iTas+P77VsgeosF4jA4YmppCVoZ6lUr/TsQ7
	 y4TM2oB0LvUl/CGxwpwp0kGuvR8IUIGcaH+wHv+nRaIl2wg+GbRlNP1tQskp4yCPjq
	 ++07dWpeKgWMhBWMggv61l0UzN3t+dVy4CTbKFqF+E15aNijxWhLEtzbDpNrb3YhKe
	 U8ZjPhiVMLIiw==
Date: Tue, 25 Feb 2025 07:24:16 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: David Laight <david.laight.linux@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>
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
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
User-Agent: K-9 Mail for Android
In-Reply-To: <20250224133431.2c38213f@pumpkin>
References: <20250223164217.2139331-1-visitorckw@gmail.com> <20250223164217.2139331-3-visitorckw@gmail.com> <bde62fee-4617-4db7-b92c-59fb958c4ca6@kernel.org> <20250224133431.2c38213f@pumpkin>
Message-ID: <3BC57C78-1DFF-4B83-85AA-A908DBF2B958@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_072506_935325_8A2EC1D2 
X-CRM114-Status: GOOD (  20.46  )
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

On February 24, 2025 5:34:31 AM PST, David Laight <david.laight.linux@gmail.com> wrote:
>On Mon, 24 Feb 2025 08:09:43 +0100
>Jiri Slaby <jirislaby@kernel.org> wrote:
>
>> On 23. 02. 25, 17:42, Kuan-Wei Chiu wrote:
>> > Several parts of the kernel open-code parity calculations using
>> > different methods. Add a generic parity64() helper implemented with the
>> > same efficient approach as parity8().
>> > 
>> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
>> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
>> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
>> > ---
>> >   include/linux/bitops.h | 22 ++++++++++++++++++++++
>> >   1 file changed, 22 insertions(+)
>> > 
>> > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
>> > index fb13dedad7aa..67677057f5e2 100644
>> > --- a/include/linux/bitops.h
>> > +++ b/include/linux/bitops.h
>> > @@ -281,6 +281,28 @@ static inline int parity32(u32 val)
>> >   	return (0x6996 >> (val & 0xf)) & 1;
>> >   }
>> >   
>> > +/**
>> > + * parity64 - get the parity of an u64 value
>> > + * @value: the value to be examined
>> > + *
>> > + * Determine the parity of the u64 argument.
>> > + *
>> > + * Returns:
>> > + * 0 for even parity, 1 for odd parity
>> > + */
>> > +static inline int parity64(u64 val)
>> > +{
>> > +	/*
>> > +	 * One explanation of this algorithm:
>> > +	 * https://funloop.org/codex/problem/parity/README.html
>> > +	 */
>> > +	val ^= val >> 32;  
>> 
>> Do we need all these implementations? Can't we simply use parity64() for 
>> any 8, 16 and 32-bit values too? I.e. have one parity().
>
>I'm not sure you can guarantee that the compiler will optimise away
>the unnecessary operations.
>
>But:
>static inline int parity64(u64 val)
>{
>	return parity32(val ^ (val >> 32))
>}
>
>should be ok.
>It will also work on x86-32 where parity32() can just check the parity flag.
>Although you are unlikely to manage to use the the PF the xor sets.
>
>	David
>
>> 
>> > +	val ^= val >> 16;
>> > +	val ^= val >> 8;
>> > +	val ^= val >> 4;
>> > +	return (0x6996 >> (val & 0xf)) & 1;
>> > +}
>> > +
>> >   /**
>> >    * __ffs64 - find first set bit in a 64 bit word
>> >    * @word: The 64 bit word  
>> 
>> 
>

Incidentally, in all of this, didn't anyone notice __builtin_parity()?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
