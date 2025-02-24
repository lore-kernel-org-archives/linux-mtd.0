Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BA1C021A4
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 15:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pcTIjVk36DnIKRf3j+0mfK2a+AE4RVb+8Vm9vGjr8+c=; b=abtxcPe5vk2PSi
	QT2NBVBUKM3Oi4gJREuzyQ4WK8xifTwdDamA9Gc8g54jOoW/a35+FhdL6Ord0Dkx6h3VH/lQCHLOO
	f3IpC0BK3e9o2gfFz4piY6dd3ugiPSRiz9dPlJDTxJb2VJUyWLakv/HSPvwrHcxxFnqZgEO0Fcqky
	4MVOYAjTJD/T5GL3k+OJAbonZhrm8cRyJL0VBz1HVrafrUHLOO9caRNzMKxq8AEtwkt6tMqE4lGrd
	DsrbWL7BVRCUAgdkApdsXAQZbRhoYkY1cHTO8y4HGFmKen/z9i+r5BpphIYF3YNTleybim6urKtNA
	VTVfSSwfAsYPn1u9RlLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaWG-0000000EIqX-1CWG;
	Mon, 24 Feb 2025 15:37:20 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaMX-0000000EHZe-0yeG
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 15:27:18 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-220d39a5627so68974965ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2025 07:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740410836; x=1741015636; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NVMni6CCCY2us6Xo8mKZ2xt3KdSK/Spp1dIxAZpVn4s=;
        b=gApi818MHc3sxWxNjBcgknnasP9eoQXxgfosnhnmGq0ECoEjXw2BnZ8tdnFU5hq6vv
         cGt65YT9LylWxIxt1CPea4ao0uGcniAkeewcd4BW1mBC+P0mUlpUahSeNwTytatOGkX3
         TUcYzgtCyaGbtNRvjVRSSLkDbmpYZbvhP3vs6oDDKLau2veRwk9ed/cVZORqUoD7dAAc
         E0h7BJrSGNpsOFlE3dvrWk8lE3weAW1M7fGkRfvwE3a7XGlVxqe0uXWSLyvGlXLzCaHq
         AfyaKs2o9cYXMBfEmPEXZQEOOG/0ttD82/Da/U3IoLMcMub7tcLMw4Vc1mL8LWHn6xxF
         UqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740410836; x=1741015636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVMni6CCCY2us6Xo8mKZ2xt3KdSK/Spp1dIxAZpVn4s=;
        b=ZfDR6Rp2SzMCLfai78gz/9XITgbVtGmZREWs4r5LK/ih9FamoewXc6nhj0uEG2qH8c
         SZ/0mHCwZVLWWeOIIbsJ/2qAuH1Pn8mEC9wD3eHkZGuzfDQK2s5f/A595iqovcO2MKDh
         hAr7EH7jYXhCQlxOrBpF2yalm9hsIEpXiD8PVEeQrgNNlQ7hT3ycF4VxqAFtW9DEqsLL
         Z6gGK+ENR+gnEtsKmWmgah0t2AYmuVYIjAzKjDh1oVN0qb82Pp4jx6vRxZnHvzGFzkA4
         tKGsgom8kYNIxCqlf/3JJ/qQYk4RPJkr4ukh8bvjuj3SBb34YPxeQ5KE73FdQ2KOr2te
         /XtA==
X-Forwarded-Encrypted: i=1; AJvYcCWA01J9enhyu+r2uK2DVV8WNtJncx1VzuOl/HIrgmUAui+5Cr4s8b3L/v3iS16X1fEJcCS/izG8m1M=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFpu77AA7laab1nBC6aIAVTtg7/sHy1Tvah9xGlsu8ZvmasSxX
	eoPiICKLj8M/yJqBxMKCoh3pg7C97OvJY6WIGdO1sgmPqApk5KfT
X-Gm-Gg: ASbGncvBlARUnhnc93dQ79qAXDqW6vzRRscSdUeihKeEL4sLjXQJI/nyDx8zfi8LVUi
	S8Cto8xOUqmMrE3fQi9ipSHzpOoUZoFBCAEejPMDc/XkzOHsXB7Ag2DlMVD03jMQ3fEVp3Ucnao
	zSFBTw/rMjypVXwXA/iymbsKYhTuVTxhxBF8/O9Em5LHf6PirZf+w/i26e/pjMpNWiRhYImjZBY
	b9N6kdxE3aNctorpf5yv39GktjMyQNmXLB2YN8HVumrOUIVZRGE9fOXaU9EE0AJrI/Pud6sk0XA
	RVv9y4K4YJxfmxHi9AMVIHr/nAiH
X-Google-Smtp-Source: AGHT+IFl+fmLe2Snker6fx4GB6SiAhwknYLzw9iuDcRtyo7AdhlkRr95Yy6wYLAjG0rHC6oLfbqCGA==
X-Received: by 2002:a05:6a00:cce:b0:732:6214:35f5 with SMTP id d2e1a72fcca58-73426c8d21fmr17154986b3a.1.1740410835401;
        Mon, 24 Feb 2025 07:27:15 -0800 (PST)
Received: from eleanor-wkdl ([140.116.96.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7346d9b1af1sm1359758b3a.71.2025.02.24.07.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 07:27:14 -0800 (PST)
Date: Mon, 24 Feb 2025 23:27:01 +0800
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: Uros Bizjak <ubizjak@gmail.com>
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
	jirislaby@kernel.org, yury.norov@gmail.com,
	akpm@linux-foundation.org, hpa@zytor.com, alistair@popple.id.au,
	linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH 00/17] Introduce and use generic parity32/64 helper
Message-ID: <Z7yPxdiLLXlsWSQN@eleanor-wkdl>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <602e03fd-ce4b-feef-5053-e95834ab35d7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <602e03fd-ce4b-feef-5053-e95834ab35d7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_072717_273570_DC46C67B 
X-CRM114-Status: GOOD (  14.27  )
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

On Sun, Feb 23, 2025 at 09:25:42PM +0100, Uros Bizjak wrote:
> 
> Please note that GCC (and clang) provide __builtin_parity{,l,ll}() family of
> builtin functions. Recently, I have tried to use this builtin in a couple of
> places [1], [2], but I had to retract the patches, because __builtin
> functions aren't strictly required to be inlined and can generate a library
> call [3].
> 
> As explained in [2], the compilers are able to emit optimized
> target-dependent code (also automatically using popcnt insn when avaialble),
> so ideally the generic parity64() and parity32() would be implemented using
> __builtin_parity(), where the generic library would provide a fallback
> __paritydi2() and __paritysi2() functions, otherwise provided by the
> compiler support library.
> 
> For x86, we would like to exercise the hardware parity calculation or
> optimized code sequences involving HW parity calculation, as shown in [1]
> and [2].
> 
> [1] https://lore.kernel.org/lkml/20250129205746.10963-1-ubizjak@gmail.com/
> 
> [2] https://lore.kernel.org/lkml/20250129154920.6773-2-ubizjak@gmail.com/
> 
> [3] https://lore.kernel.org/linux-mm/CAKbZUD0N7bkuw_Le3Pr9o1V2BjjcY_YiLm8a8DPceubTdZ00GQ@mail.gmail.com/

Hi Uros,
Thanks for your information.

We originally planned to implement hardware optimizations after this
patch series. However, for V2, We will incorporate __builtin_parity(),
while keeping our current implementation as the fallback function.

Best regards,
Yu-Chun Lin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
