Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E1DC19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 20:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXEZs/GkIynErf+RcVZQloZB1/SvE/aESnf4+9DvZ3o=; b=yTTm3+G0vUhPFu
	Wd3iVuKmal5pgsUnyi1lZdy7q0KMrKkU2WJbbt0woR1akF2mdd/AFEipZLt1totFO6Cxjb3ojrkv7
	4WMZpaiZx35mlwpWHaO2CppO6aeX/c68X+6q/SXtlD+Bds4WFLYiuP8pu8WxDsbFHjwyZzsW90N0/
	gSY7Tzb9PgMOr+P6ofPEKKsF88COj7duS1phM8l1jk9jlmvajEKBJjBAzK0RRgngKLUWUSbZtsm0s
	2cv6LgEkApOfJaN5qCkR3sE0AdFBjt1af74l+Dv/jnYnGR0fqj5viQfywz5z/o7hK0rRTn+6+6hKh
	4Xn1LfrBDRRx4aYtBSEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqe3w-0000000FSSd-48gt;
	Fri, 07 Mar 2025 20:12:52 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdzG-0000000FRdX-3960
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 20:08:04 +0000
Received: from [IPv6:::1] ([172.56.209.45])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 527K79aI409264
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 7 Mar 2025 12:07:10 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 527K79aI409264
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741378034;
	bh=labYh6dS183ez/ccMGDewAeypbKIJUEZ63NUVodYP9Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=F3IB7iSHYEvDT6RxcaTUE+HY1uOaC4VnUwxKdSJcbsJ/VGwP8hnKFJom4bWfM8OtP
	 AchryuBqXBGLSXDbZ+MsV5uKdxioAoL64EB2Hr82VgdPIiuWZvSICUQIsfj5WGpBgd
	 KriIaJc3fhV0nS1OF/J9ovKepTrInAm9zRKeY8fu9KnjjC1cA61PvXNcMr8KPpE2Si
	 6ZtEA98YPUR4DMGJMmEfr7slViCtz+0KmVEla3+d3bqWKNRc+yfSLHHLIoMfgw95oG
	 SN+4dF7fYBU8DZVgqTjvri3AONNiYtVQqGQhFLjE5E+swQ4mWdQWMCk66SRGgQ/FHU
	 OiSkGpohg9mHw==
Date: Fri, 07 Mar 2025 12:07:02 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: David Laight <david.laight.linux@gmail.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
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
        vigneshr@ti.com, visitorckw@gmail.com, x86@kernel.org,
        yury.norov@gmail.com
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
User-Agent: K-9 Mail for Android
In-Reply-To: <20250307195310.58abff8c@pumpkin>
References: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com> <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com> <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com> <20250307195310.58abff8c@pumpkin>
Message-ID: <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_120802_785434_19DD7BB7 
X-CRM114-Status: GOOD (  13.90  )
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

On March 7, 2025 11:53:10 AM PST, David Laight <david.laight.linux@gmail.com> wrote:
>On Fri, 07 Mar 2025 11:30:35 -0800
>"H. Peter Anvin" <hpa@zytor.com> wrote:
>
>> On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> >> (int)true most definitely is guaranteed to be 1.  
>> >
>> >That's not technically correct any more.
>> >
>> >GCC has introduced hardened bools that intentionally have bit patterns
>> >other than 0 and 1.
>> >
>> >https://gcc.gnu.org/gcc-14/changes.html
>> >
>> >~Andrew  
>> 
>> Bit patterns in memory maybe (not that I can see the Linux kernel using them) but
>> for compiler-generated conversations that's still a given, or the manager isn't C
>> or anything even remotely like it.
>> 
>
>The whole idea of 'bool' is pretty much broken by design.
>The underlying problem is that values other than 'true' and 'false' can
>always get into 'bool' variables.
>
>Once that has happened it is all fubar.
>
>Trying to sanitise a value with (say):
>int f(bool v)
>{
>	return (int)v & 1;
>}    
>just doesn't work (see https://www.godbolt.org/z/MEndP3q9j)
>
>I really don't see how using (say) 0xaa and 0x55 helps.
>What happens if the value is wrong? a trap or exception?, good luck recovering
>from that.
>
>	David

Did you just discover GIGO?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
