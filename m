Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1642CC282EC
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 00:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3gDGimN/9fOBMpRHMdGv3OocdhCzcMMQuCrgr/el3g=; b=fXsgSD6Q/BqHLE
	xPmUKX5fAkd1gMJsqYnfFT2KCxm2tO5sNTN9V7c2awcaCPEMLQLt3y96Z3KjH4Du8QaqPILAuGdN7
	d8cWs8/uYRoOKdZAROzn20QLsrpwcGtCsUYqf4ra+GgmxB/9dekvBXiTXOKfvBIpdeZCyZPXHpWEg
	8YTW72GggegR/yQh3AvfnC3Hp9GNmpoiQTwRejt1ELe7mvmO9IuKhuqlhSJV9J7yB6rAz7lz86Zs8
	gg1yv6d9eZ+2S/239OL7AVOPlx6V3XJtwaiDHdIX2nN3PityQR2JwfQcUcn5gwvXmaSqOcxp6mwzS
	KHpZRd+V2qdAMWyi8Ozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFCS-0000000FZ4w-3aO9;
	Sat, 15 Mar 2025 00:16:24 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFCP-0000000FZ4G-37V5
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 00:16:22 +0000
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52F0EnBX3633411
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 14 Mar 2025 17:14:49 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52F0EnBX3633411
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741997698;
	bh=p1RiZcB4vxNShw8WemiNGPP7YkRsysNV0zKEEix3DOc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Tx4ZYo9fiuY+wDg4a68kI5cIuARdVD68JoQLpMesIGNwSOczhbBzbTQfcwfNxfdUD
	 47XsN8wLRZvhKBjF2r+4045rg3oCcRJXoucMdOJNL1OMZbLn4bX9oZ+i6W8e9sW4/v
	 gt8eVi3UxwK4JnA3/PA4TiFwuLM+Otv/LqOfFQaMUHaNp3e6BrpYdyQ0VwZeoSpqWr
	 T/LWMwFrcdksOlkEzMrMEH8Z+9ya9BolDRz2oHPpWkApezrBJmDX+I34duXBeeFwZs
	 kW+562xssDMBNp3juXplJf3P9JcHcQ4Wpbms/nUI43DenD4X+97Pqxmi4dScjrfmYn
	 BdMqAkWnIyUzQ==
Date: Fri, 14 Mar 2025 17:14:46 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: David Laight <david.laight.linux@gmail.com>,
        Jacob Keller <jacob.e.keller@intel.com>
CC: Yury Norov <yury.norov@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, Kuan-Wei Chiu <visitorckw@gmail.com>,
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
        akpm@linux-foundation.org, alistair@popple.id.au,
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
In-Reply-To: <20250314190604.53470966@pumpkin>
References: <20250306162541.2633025-1-visitorckw@gmail.com> <20250306162541.2633025-2-visitorckw@gmail.com> <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org> <Z8ra0s9uRoS35brb@gmail.com> <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org> <20250307193643.28065d2d@pumpkin> <cbb26a91-807b-4227-be81-8114e9ea72cb@intel.com> <0F794C6F-32A9-4F34-9516-CEE24EA4BC49@zytor.com> <Z9MGxknjluvbX19w@thinkpad> <795281B1-9B8A-477F-8012-DECD14CB53E5@zytor.com> <b2b632cc-ca69-497f-9cf9-782bd02cac79@intel.com> <20250314190604.53470966@pumpkin>
Message-ID: <F3723528-8978-43A9-804F-06FDFE55BDC0@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_171621_786698_E8ABFE55 
X-CRM114-Status: GOOD (  19.18  )
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

On March 14, 2025 12:06:04 PM PDT, David Laight <david.laight.linux@gmail.com> wrote:
>On Thu, 13 Mar 2025 14:09:24 -0700
>Jacob Keller <jacob.e.keller@intel.com> wrote:
>
>> On 3/13/2025 9:36 AM, H. Peter Anvin wrote:
>> > On March 13, 2025 9:24:38 AM PDT, Yury Norov <yury.norov@gmail.com> wrote:  
>> >> On Wed, Mar 12, 2025 at 05:09:16PM -0700, H. Peter Anvin wrote:  
>> >>> On March 12, 2025 4:56:31 PM PDT, Jacob Keller <jacob.e.keller@intel.com> wrote:  
>> >>
>> >> [...]
>> >>  
>> >>>> This is really a question of whether you expect odd or even parity as
>> >>>> the "true" value. I think that would depend on context, and we may not
>> >>>> reach a good consensus.
>> >>>>
>> >>>> I do agree that my brain would jump to "true is even, false is odd".
>> >>>> However, I also agree returning the value as 0 for even and 1 for odd
>> >>>> kind of made sense before, and updating this to be a bool and then
>> >>>> requiring to switch all the callers is a bit obnoxious...  
>> >>>
>> >>> Odd = 1 = true is the only same definition. It is a bitwise XOR, or sum mod 1.  
>> >>
>> >> The x86 implementation will be "popcnt(val) & 1", right? So if we
>> >> choose to go with odd == false, we'll have to add an extra negation.
>> >> So because it's a purely conventional thing, let's just pick a simpler
>> >> one?
>> >>
>> >> Compiler's builtin parity() returns 1 for odd.
>> >>
>> >> Thanks,
>> >> Yury  
>> > 
>> > The x86 implementation, no, but there will be plenty of others having that exact definition.  
>> 
>> Makes sense to stick with that existing convention then. Enough to
>> convince me.
>
>There is the possibility that the compiler will treat the builtin as having
>an 'int' result without the constraint of it being zero or one.
>In which case the conversion to bool will be a compare.
>This doesn't happen on x86-64 (gcc or clang) - but who knows elsewhere.
>
>For x86 popcnt(val) & 1 is best (except for parity8) but requires a non-archaic cpu.
>(Probably Nehelem or K10 or later - includes Sandy bridge and all the 'earth movers'.)
>Since performance isn't critical the generic C code is actually ok.
>(The 'parity' flag bit is only set on the low 8 bits.)
>
>	David
>
>

You seem confused. We have already established that the built-in didn't currently produce good code on some cpus, but it does on others, with very little in between, so it would make sense to use the builtins on an opt-in basis.

On x86 8- or 16-bit parity is best don't with test or xor respectively; 32- or 64-bit parity may use popcnt; test or by reducing down to a parity16 xor.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
