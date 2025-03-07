Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E2EC19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 15:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8GQpCL9toBQSRJdkNw4JhzxBbq4dvnyWGMCFr4fkF4=; b=L9sSbJt5DkMpiQ
	BpK9W/Flvpmd0qXBCETOVERYCkwLk0DxHa8XjSXjPuaXfBDX7ehPAA0WjglI9V5AqHGWWpEMJTTMB
	uZhKEbIfh3/OQksNFjDsSylU0FYCxg+tc7RxGw/KY0ADe9PppIBCkVAiOrRId+v5hVbcB4pl37Kx/
	eK+KVTqeTLlr06o4XvrS/pfAvvsNuHyxRfwM10vLNJqag0e4b0g2ko9VrBLn5qNDwu0itnYTbtvw5
	d/q/GN+eml45MV/RAUM3ooti8tRIOkmQOdi8hIZg5vXiI1qHNL4j+X+Hqa7HPfJas7WJ7c7f5Wvk3
	6Lebzo8RwbfSp5vyIrIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqa2l-0000000EmLp-0tLk;
	Fri, 07 Mar 2025 15:55:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqa2j-0000000EmKa-0kwE
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Mar 2025 15:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IySwQu8sBAq2SiiOusmnVT2gVfPlf25OMd3Kg55m+0M=; b=Adlxt9hmY+T/AH8gWNM9Y2StqE
	/eohDIJgtwTrvzVX0YYTzKwp8z16YlUkUJ0J5CYib/DRxdPjDbZcwC3FSIfnKjgHBtNLd6PylQ2Si
	rrzrFPaat5jfGPokgvR72ggBTXGKK1XpKcM7jSErS7jyyGgL4Nf/fyJaqq8FIrpu8DjcAOZiEJPPZ
	AE9PSOWwmmjEk7B9JR0FVj6Tcx6qZrQ0uwMXcsYaQThA0OLzx3H35S5FDEccXHDFDzFiS9mxB0+PE
	t7Kzog96Cr7l9XbmvEjm4qC6GJRYZwgdnWhS8uoIBTfyU6RH7aEKfF2+W4wpU/fPA2mwOhYoPQQop
	KCeXLQBw==;
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqa2f-00000001Nrf-3mWo
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 15:55:19 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e53ef7462b6so1744076276.3
        for <linux-mtd@lists.infradead.org>; Fri, 07 Mar 2025 07:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741362914; x=1741967714; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IySwQu8sBAq2SiiOusmnVT2gVfPlf25OMd3Kg55m+0M=;
        b=JtwPs8rTFwhsEOVTggzxcf3X8D31PICE9LVpKTbsP/gK2CZzNuHpM2QElHFw/plTD1
         f6REnIBhDHT5PLriRcIBjUhDls5RR91Pm2gpkY2ZqDdV49kOAa5jlOIyl5OLTYX9Iavq
         YqmTvIRo4IhOanDyATLYLnFZlv/wWYR+/eqc5suPZ3qRuA/oPPVrGvQH0z/eBJ+egS1k
         PRaR+wNfIdUmM/hepu77n+xn02nnvwyMBapNCGTeaAKYcadtcIIhhJPvxq9kHHVEiLn2
         SOWUDIGbmDy5cxP7vMbG16XG0sQ4FSqEacRbNYwza9Rm/kbf9+AJAehUu5Xk++eTNY4Y
         38pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741362914; x=1741967714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IySwQu8sBAq2SiiOusmnVT2gVfPlf25OMd3Kg55m+0M=;
        b=BNJlEeHF/WmfOR3tq9Z2WHAx8dBAQ3WgNbisFN1ujOyyldk5rvBV9zovVZK1r0cca0
         U4fPjEvg22ERCriKQpTCEIYenk1Z1vrwDbGY+LUy3O1ABijXpIb2lbST5gSoXEVpdphd
         IMTFWh+UBBVn+88lY40Go19BRyqFLdf43FsXp2IDRt+8HvmpNdLMYyi3IBs+tEAqoH+A
         yMgPxjd/kCAxBk2tKlaJLb2D/Y6oqhvpVafxRhzbMwnzEKVfLglid53dHVw3rr3n85mN
         FmcincVOJTjX9wLTdSnqRd4evHCZ/7zf8wQ5mJDDwR90d/k2afT4nhFTFvXxl5LuWz4x
         2n9g==
X-Forwarded-Encrypted: i=1; AJvYcCXkVih2vKIzQNg+Mk6vFRcjNigzmdbznS9i7GhwuYZEm5yHxuXgwunuNJFtIHfhqf8gksl6PVzI4nU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWPP3PC9sa8/Q9zxVuJ70F8eA9uwmTo7t+W5lwVVbM/ZIf3Dfb
	jcbDX3YtQHQhzGo73xJw5XFDJnrTu4nhZf5JbcAFXaSjUCjyiam+
X-Gm-Gg: ASbGncsV3sHDcDfIKjPUkJitx4rwsSz2GPN9XsczP89uR17LBApjZk2rRC39D1+wHfg
	+a84U+Ut4uBdB9MO3JIOIrz5aLzEvXGTeK8qLqsrbuN3zgqTEnK117k7R/m7ikfE5xw3Dqc4sjS
	88T2k+ZuS9Fj6metxqGZG/Mu5o1j9KlfKXJHScCViMM/vQQT5Rs6LIEw+fLcntxh0Y8zBmqnKEA
	MaWv+X2UuLRjit4gOuoRDKZMVZBcnC1X5kI0DCerpqMlyU6df73wAWJRWE8ZoJJPPA+xl0eME04
	3IFk437ss7WqwQW/QOS9Jnd85uqH/E2u5Lb4oAjUx3Ry5lwTax0JfGkdhy9Uey933io1VRxct5s
	VeByS
X-Google-Smtp-Source: AGHT+IGXsVm03RpeRs7naE92Mk1v2+BdYsqkQh0ckjckzDu/bnevFLrinU7kQnO5Z9/M1SdGBh4guA==
X-Received: by 2002:a05:6902:2292:b0:e60:c79f:6f6c with SMTP id 3f1490d57ef6-e635c0f80admr4791285276.8.1741362914172;
        Fri, 07 Mar 2025 07:55:14 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e635e4c8f69sm386658276.42.2025.03.07.07.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 07:55:13 -0800 (PST)
Date: Fri, 7 Mar 2025 10:55:13 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
	eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	akpm@linux-foundation.org, hpa@zytor.com, alistair@popple.id.au,
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
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z8sW4c5LxV-ITdCi@thinkpad>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <3dfc81eb-caa1-42fe-8fd6-61101de0ef13@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3dfc81eb-caa1-42fe-8fd6-61101de0ef13@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_155518_012114_B9989490 
X-CRM114-Status: GOOD (  16.97  )
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

On Fri, Mar 07, 2025 at 07:57:48AM +0100, Jiri Slaby wrote:
> On 06. 03. 25, 17:25, Kuan-Wei Chiu wrote:
> > Several parts of the kernel contain redundant implementations of parity
> > calculations for 16/32/64-bit values. Introduces generic
> > parity16/32/64() helpers in bitops.h, providing a standardized
> > and optimized implementation.
> > 
> > Subsequent patches refactor various kernel components to replace
> > open-coded parity calculations with the new helpers, reducing code
> > duplication and improving maintainability.
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> > In v3, I use parityXX() instead of the parity() macro since the
> > parity() macro may generate suboptimal code and requires special hacks
> > to make GCC happy. If anyone still prefers a single parity() macro,
> > please let me know.
> 
> What is suboptimal and where exactly it matters? Have you actually measured
> it?

I asked exactly this question at least 3 times, and have never
received perf tests or asm listings - nothing. I've never received
any comments from driver maintainers about how performance of the
parity() is important for them, as well.

With the absence of _any_ feedback, I'm not going to take this series,
of course, for the reason: overengineering.

With that said, the simplest way would be replacing parity8(u8) with
parity(u64) 'one size fits all' thing. I even made a one extra step,
suggesting a macro that would generate a better code for smaller types
with almost no extra maintenance burden. This is another acceptable
option to me.

Thanks,
Yury

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
