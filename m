Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC049C021B2
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 20:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHMnjpMF2hVpz7Vzz7vp/lJAyY0O4M71fZ28zhX5A5Y=; b=SAZtrdCWWZhOEF
	l88J0tOGjOamJluTBD3VSp7nxRTmPV9RF3RX5VuOm1GXCAn/EW2jGLHv8p5rbow3NpKBWklTXUeu8
	Uqg/C0F0vt+tHkx3UwhjGVqAfbp1ek7pq7RNqTd4PtoCHv4fPo8ydAfXrGay05AOBZCE/HK4muHuP
	u0WVG7C0I41pNPkpeBSC+zWQewxbbozP6s85BkIjSd82/YMOOratBEZpxTvWjrbu+wAgGLg42NjdC
	o3cGk8PpyQ2+1as3ynCWh7dl67jlg3C0XBq0TyvXXE2rL/gFTP120p60hHGwef5Ou/stTPVY2utdr
	JpPI/VChf0006/M9ZAqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmIXu-0000000Bjku-2fgG;
	Sun, 23 Feb 2025 20:25:50 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmIXs-0000000Bjk5-0nt3
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 20:25:49 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so612885966b.3
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 12:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740342346; x=1740947146; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KO/NRoKuG8XetnuWE85hFK1fCgTrWENxYrVqAq/LSbo=;
        b=VAccDVHgEsCSTeACIgnVpnhLw0Fj5vP1SHCQKAKaVn2F/zZCa69+0H0CgZwvJAI4G4
         OsODKGaL9px1ywXnnIeXMfS+6SJj1gd35/xYBdnpITRCb2wBCXz9LZIJAUzaAgxxNTyG
         Br6lm9QDNBOmgHOUHaQz02PkwKhEhAyL3DBCiOaLqS93ghhjmBiXde8NXjAGmozxtVs2
         RPmzw3qjcxlafRN39SDprgaY7XLzWowSTdUgAGXKkkQMCThKYEQXYi3h6vyLv0akOF6U
         Wd1u9CxhGwnJYauSF42XuhKP4cFI2oNl5EYo61XxT98Ed4FBNYxKU+C9Qio7VfkYkA7i
         nrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740342346; x=1740947146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KO/NRoKuG8XetnuWE85hFK1fCgTrWENxYrVqAq/LSbo=;
        b=IWjljdlijDEO5AiUlSJZPwvyQ+THKkdwzvgqEm+z8rDYBml4XTLeFNtzjItwwjw3mw
         M1lCkJ+xriw2agNP3Q8q+lzwcZc8y9xGoPGkHxVK5F8IKBtenYPJn89ARndwdC83nqTX
         O0T9mcFL7uBKPYS/x6foyd2vShS/mPcXNjzbHrYrYaAZTuMh99mhzpWh0IVV67tydO9i
         I3WrYfDv/Jq+yK86JEJl78WfSrRjjqaBLCOwHd8G5Dp3yMal5mTqU7PzKvmts206uJZh
         HzQiN7xwlK7b11LpHtz1QskvYdI5WRHwgSdoNznDrE/nSd6p3yhMp+x9GQnsajDBjMVg
         d8Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXSP1vLv/IS+Emj1ppn1zZ8DmyjtVgaF3Fki65/qrfVzqJYFD2GdF3PXBLag5DDaDSFI3q+BTdm00Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YwStut7pcWM+FsLPLDbSCJSgopbaTjY4djJz3fC472NBIoeFNig
	yrtEutb3JBkGdxGH3nwfCjVm2Zadgh3Dznv368Y3mDJuG/bjdu1y
X-Gm-Gg: ASbGncu+4f1LW/VuKZ8KwPy7tBMjqa8n8DUDSpv+i1Dvu8txdymQ83zR58xwRos6+0t
	yS9qBjelYGBVj8l4x5VW4bVKVlK/lJqerQkL0SapzYwaRIN99NkTq8+W9n7eMEoQH871PFs9o5z
	KQFSPTUcHzcGIaECb01X2u/YkgvEazquVjUeXfcoo3RiZ1qAOjCbbEP/gWQAbUyYxQn3o6Q1dnM
	2+5o1Cxf01jmBqxIrI727I34FUjnT+FXEeU54a8eVPWPmnC77WBD53IMrsdH/X7Jyvm/xByNCq6
	NZ4M45sLvX3/B5anUxjc5PPHL6s=
X-Google-Smtp-Source: AGHT+IEASkBZDUs2HV66FfbppKxrXfiPEOQdWl35/1TkX9MbOUwdnZRhQOYUiSPPWnjZ/EnkcBUtNQ==
X-Received: by 2002:a17:907:1b26:b0:ab7:be81:8944 with SMTP id a640c23a62f3a-abc099b88ccmr1174431166b.6.1740342346244;
        Sun, 23 Feb 2025 12:25:46 -0800 (PST)
Received: from [192.168.1.100] ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbbe74100asm1142813766b.95.2025.02.23.12.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 12:25:45 -0800 (PST)
Message-ID: <602e03fd-ce4b-feef-5053-e95834ab35d7@gmail.com>
Date: Sun, 23 Feb 2025 21:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 00/17] Introduce and use generic parity32/64 helper
To: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dmitry.torokhov@gmail.com,
 mchehab@kernel.org, awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, parthiban.veerasooran@microchip.com,
 arend.vanspriel@broadcom.com, johannes@sipsolutions.net,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, yury.norov@gmail.com,
 akpm@linux-foundation.org
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
Content-Language: en-US
From: Uros Bizjak <ubizjak@gmail.com>
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_122548_250525_761A013F 
X-CRM114-Status: GOOD (  10.99  )
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



On 23. 02. 25 17:42, Kuan-Wei Chiu wrote:
> Several parts of the kernel contain redundant implementations of parity
> calculations for 32-bit and 64-bit values. Introduces generic
> parity32() and parity64() helpers in bitops.h, providing a standardized
> and optimized implementation.
> 
> Subsequent patches refactor various kernel components to replace
> open-coded parity calculations with the new helpers, reducing code
> duplication and improving maintainability.

Please note that GCC (and clang) provide __builtin_parity{,l,ll}() 
family of builtin functions. Recently, I have tried to use this builtin 
in a couple of places [1], [2], but I had to retract the patches, 
because __builtin functions aren't strictly required to be inlined and 
can generate a library call [3].

As explained in [2], the compilers are able to emit optimized 
target-dependent code (also automatically using popcnt insn when 
avaialble), so ideally the generic parity64() and parity32() would be 
implemented using __builtin_parity(), where the generic library would 
provide a fallback __paritydi2() and __paritysi2() functions, otherwise 
provided by the compiler support library.

For x86, we would like to exercise the hardware parity calculation or 
optimized code sequences involving HW parity calculation, as shown in 
[1] and [2].

[1] https://lore.kernel.org/lkml/20250129205746.10963-1-ubizjak@gmail.com/

[2] https://lore.kernel.org/lkml/20250129154920.6773-2-ubizjak@gmail.com/

[3] 
https://lore.kernel.org/linux-mm/CAKbZUD0N7bkuw_Le3Pr9o1V2BjjcY_YiLm8a8DPceubTdZ00GQ@mail.gmail.com/

Thanks,
Uros.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
