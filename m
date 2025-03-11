Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D168BC282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Mar 2025 22:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xb3jtpsgi7aH5m9aPwHQdUjPYQCnVK7ijDK3UCoTOwc=; b=aFWzwX9lsKGL4y
	JWdsX6T9D3h9vwnU8QKjgEdJDAfjOCINBExdKoNkL5AQqw+mhs10Itjw7pNuFCTe6dif/utTIMzHW
	DPoqI//sSJJKeUG54dMtXu83j0XRNTMKuvt3sWCDx4NVb1o1VKHeb3L1WSpVsY1G3S57f4FiMsKlq
	UODXw8plY5PnSI/q3e8aKSgqNixQ0ohHZf7IwJVxyOMTd8/P2weYTZK9MZwzasEli0ghVRh/4gV7p
	p5VISNXwq+4YukhI4C1h+F4hdpqThHAolAAue++WQs9i0CsZqOD9+Io2KLI4WgJmMpVyfWCMTpLvL
	GDr4rCKgOxHUvgX8Th+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts82w-000000076BE-0oXB;
	Tue, 11 Mar 2025 22:25:58 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts82s-000000076Aa-3YEX
	for linux-mtd@lists.infradead.org;
	Tue, 11 Mar 2025 22:25:56 +0000
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52BMOF3B2275039
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 11 Mar 2025 15:24:15 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52BMOF3B2275039
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741731862;
	bh=GFDhiFKvtRD+W2XGLJDNjRiea0qe1W3j0iK0xY8JZL8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=QWEZWp44Cu/zN1UIDmdWXY6QcwrSH2LoTB7gxC/oODFA2E5hnyx87scqetv/EJqaq
	 W3NGSD2lutyv9Jcq8m20s075mr19ouosvjSfuoByKOZE3mQ3jwMuLYAfFD7NHXFjMu
	 PSNQMtgdMv8Ylzz6iTK9sKEdCddWc+fBTUdrnEKWu4ZtGPAVnloe7NrgEcViX9/54l
	 wN7/sR5ozYXyi5j6Ocpn7dIVIj/aVN6iIt0U8c7AYlRPFAXzs4Zww/v+elJgd/PqhB
	 MqAlIlffCnFmITyc2l4ZgqDCwWd5yt6Lw5IBPI6hlmBqX3gG06MBm8zXyyFfILZebk
	 u/gMoXml+mBPw==
Date: Tue, 11 Mar 2025 15:24:14 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Yury Norov <yury.norov@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>
CC: David Laight <david.laight.linux@gmail.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
        akpm@linux-foundation.org, alistair@popple.id.au,
        andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
        arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
        bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
        brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
        davem@davemloft.net, dmitry.torokhov@gmail.com,
        dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
        edumazet@google.com, eleanor15x@gmail.com, gregkh@linuxfoundation.org,
        hverkuil@xs4all.nl, jernej.skrabec@gmail.com, jirislaby@kernel.org,
        jk@ozlabs.org, joel@jms.id.au, johannes@sipsolutions.net,
        jonas@kwiboo.se, jserv@ccns.ncku.edu.tw, kuba@kernel.org,
        linux-fsi@lists.ozlabs.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-wireless@vger.kernel.org, linux@rasmusvillemoes.dk,
        louis.peens@corigine.com, maarten.lankhorst@linux.intel.com,
        mchehab@kernel.org, mingo@redhat.com, miquel.raynal@bootlin.com,
        mripard@kernel.org, neil.armstrong@linaro.org, netdev@vger.kernel.org,
        oss-drivers@corigine.com, pabeni@redhat.com,
        parthiban.veerasooran@microchip.com, rfoss@kernel.org, richard@nod.at,
        simona@ffwll.ch, tglx@linutronix.de, tzimmermann@suse.de,
        vigneshr@ti.com, x86@kernel.org
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
User-Agent: K-9 Mail for Android
In-Reply-To: <Z9CyuowYsZyez36c@thinkpad>
References: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com> <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com> <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com> <20250307195310.58abff8c@pumpkin> <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com> <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name> <Z9CyuowYsZyez36c@thinkpad>
Message-ID: <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_152554_885449_C4107F82 
X-CRM114-Status: GOOD (  30.13  )
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

On March 11, 2025 3:01:30 PM PDT, Yury Norov <yury.norov@gmail.com> wrote:
>On Sun, Mar 09, 2025 at 11:48:26PM +0800, Kuan-Wei Chiu wrote:
>> On Fri, Mar 07, 2025 at 12:07:02PM -0800, H. Peter Anvin wrote:
>> > On March 7, 2025 11:53:10 AM PST, David Laight <david.laight.linux@gmail.com> wrote:
>> > >On Fri, 07 Mar 2025 11:30:35 -0800
>> > >"H. Peter Anvin" <hpa@zytor.com> wrote:
>> > >
>> > >> On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> > >> >> (int)true most definitely is guaranteed to be 1.  
>> > >> >
>> > >> >That's not technically correct any more.
>> > >> >
>> > >> >GCC has introduced hardened bools that intentionally have bit patterns
>> > >> >other than 0 and 1.
>> > >> >
>> > >> >https://gcc.gnu.org/gcc-14/changes.html
>> > >> >
>> > >> >~Andrew  
>> > >> 
>> > >> Bit patterns in memory maybe (not that I can see the Linux kernel using them) but
>> > >> for compiler-generated conversations that's still a given, or the manager isn't C
>> > >> or anything even remotely like it.
>> > >> 
>> > >
>> > >The whole idea of 'bool' is pretty much broken by design.
>> > >The underlying problem is that values other than 'true' and 'false' can
>> > >always get into 'bool' variables.
>> > >
>> > >Once that has happened it is all fubar.
>> > >
>> > >Trying to sanitise a value with (say):
>> > >int f(bool v)
>> > >{
>> > >	return (int)v & 1;
>> > >}    
>> > >just doesn't work (see https://www.godbolt.org/z/MEndP3q9j)
>> > >
>> > >I really don't see how using (say) 0xaa and 0x55 helps.
>> > >What happens if the value is wrong? a trap or exception?, good luck recovering
>> > >from that.
>> > >
>> > >	David
>> > 
>> > Did you just discover GIGO?
>> 
>> Thanks for all the suggestions.
>> 
>> I don't have a strong opinion on the naming or return type. I'm still a
>> bit confused about whether I can assume that casting bool to int always
>> results in 0 or 1.
>> 
>> If that's the case, since most people prefer bool over int as the
>> return type and some are against introducing u1, my current plan is to
>> use the following in the next version:
>> 
>> bool parity_odd(u64 val);
>> 
>> This keeps the bool return type, renames the function for better
>> clarity, and avoids extra maintenance burden by having just one
>> function.
>> 
>> If I can't assume that casting bool to int always results in 0 or 1,
>> would it be acceptable to keep the return type as int?
>> 
>> Would this work for everyone?
>
>Alright, it's clearly a split opinion. So what I would do myself in
>such case is to look at existing code and see what people who really
>need parity invent in their drivers:
>
>                                     bool      parity_odd
>static inline int parity8(u8 val)       -               -
>static u8 calc_parity(u8 val)           -               -
>static int odd_parity(u8 c)             -               +
>static int saa711x_odd_parity           -               +
>static int max3100_do_parity            -               -
>static inline int parity(unsigned x)    -               -
>static int bit_parity(u32 pkt)          -               -
>static int oa_tc6_get_parity(u32 p)     -               -
>static u32 parity32(__le32 data)        -               -
>static u32 parity(u32 sample)           -               -
>static int get_parity(int number,       -               -
>                      int size)
>static bool i2cr_check_parity32(u32 v,  +               -
>                        bool parity)
>static bool i2cr_check_parity64(u64 v)  +               -
>static int sw_parity(__u64 t)           -               -
>static bool parity(u64 value)           +               -
>
>Now you can refer to that table say that int parity(uXX) is what
>people want to see in their drivers.
>
>Whichever interface you choose, please discuss it's pros and cons.
>What bloat-o-meter says for each option? What's maintenance burden?
>Perf test? Look at generated code?
>
>I personally for a macro returning boolean, something like I
>proposed at the very beginning.
>
>Thanks,
>Yury

Also, please at least provide a way for an arch to opt in to using the builtins, which seem to produce as good results or better at least on some architectures like x86 and probably with CPU options that imply fast popcnt is available.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
