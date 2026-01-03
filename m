Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9B4C2A061
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Jan 2026 23:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhqIIcOX/oz/ZzW2q0mKXNb4Y3MyykHvpDVm9/fldzg=; b=ymfowmhN+FYlyl
	HX/644XyMZDAH9cTjxkfqy5TMLjFCS5XixLLTF6+2/kdF5/ZSk9hA4RyimJANDBk0M6SXexZMGjUz
	PWLRvBk62qMEgRr0ndBA+8J0MUExpelSV3roXfvgSgbcuWYoBeSPve+XOlHv6I8rkQH8RfqEpD8Vv
	eEv4UcBhC7CdSy0lS28MFnOof3UCDa2rGEcUC9jaelC2FX3GOXfZJwxC76SAz1k5y+gvso+8mMeXw
	VIpnEhSZuGS/nPvdDs2wUFmNus4mhX3T9wUje4FHVPZP/X7mDK2Q4TRgi35AERMhRYDwLNElCERwK
	fJGXkuBn8YdmuArHQQiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcBVg-00000009uHz-2Zxv;
	Sat, 03 Jan 2026 23:58:16 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcBVQ-00000009uHb-1a0T
	for linux-mtd@lists.infradead.org;
	Sat, 03 Jan 2026 23:58:15 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-598e9f63169so1204074e87.2
        for <linux-mtd@lists.infradead.org>; Sat, 03 Jan 2026 15:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767484677; x=1768089477; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dB1LagwegptwwLHmXyd1osJA27FSZTcIsYt0ExTrUgg=;
        b=CcmWJF1bs7Hs8kpNsHD8tZdrHfuB9X4jl5Evcs75v1twgSy3R0IKHnqApgU8eJ1Qyi
         LzNKE/ICGyYCaGp4tCQcMUWuyTscGhYi5DUrnDVdVLMg7GTYpgHUCHZYX14gI/UcTFsi
         YPXoVIFs5oQBAbI77JLolIkzNh41BBgL6cuc8kcDzndgynR4Q3KB8kqVZM0+jSu/uwak
         njCnCE6rUAneO3aTFmzO8nasyJ5IsHNb9Th8anmfrrt2jRCltFfMWjqOA4bd0A8OYkMP
         EYjSTAY4U4SLNFGNqJJmfHGVhmkNJrphLANhwZgltpL21Cju02Uouh+J/Y3bLjezoEbg
         u/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767484677; x=1768089477;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dB1LagwegptwwLHmXyd1osJA27FSZTcIsYt0ExTrUgg=;
        b=VEoFmGS0EW0SwqdhrYO0adBPL0UnpgGZifSa0tSXJOzXqVSjwKvVGZ0PBhyhlSldc8
         zr77XXuXPOXdWrZviLjioAcSBf0XVs8KkyhyupEF9vJlXh7+UWsUWa9hRcJmyJg37UVc
         fRqE4IyHDP01l7ZsA3mjkgWZW0PsZUagkm+LJ+BSYR0nEXFmXF/f5tCr80SLqL3/gJNH
         wPKM39iGRXwZajSTj3sGFDRg07N0KDc77v9BL1BPDoxqvaj+WGz+zM7MaG5XbCQc8eRK
         Z5/z44yoh9OPvYTO0/FJvIPgpiAVkUjzSxjxwLVbjjkiQkkpzgX0/63NPMYM0R9J/zt2
         /JQg==
X-Forwarded-Encrypted: i=1; AJvYcCWEjcSPPrEIKcoLDeaCv9zh0mdoTTcHgR/q8eFZP4ww3u+SLqjrJ3ILJoAvS71EScBM6JnRCQAQ1wI=@lists.infradead.org
X-Gm-Message-State: AOJu0YywM7va9mW5+OMXLeCn2y4wQ9Bhc5CRtVkAorpKvPAaMiWf+of6
	nwakwVjFsQydLOww7RXpzQ2sCD4LH+k1PfayJyvwB75y/+lDX4qF2X3rifcdsnv9bgU=
X-Gm-Gg: AY/fxX4dwXDjKWPDHDangIEa2WnvnTwoH+/FHFAqhuGg5lKgbHB2CG9DfSUez/cZ+Wb
	3C4ODH2fOgk+MWHRaEmp744Scyo2L3ZzrYYCcsdHTJP4UdbkW3jTxbLvuRRq2l7HVRvDubcXopx
	FLW/1l1HSBjX9m0Ofp/qJAwTlelPUMgkPMIAYVrrT3ausq78yDxV41Gqtgm1QcUTJdUPnyVPSuD
	tCaoUVcAu+2bVsEYF+vAXjxmSHnoFJ6qoghsg6rPRwzMe8JMoErcURKe2rLklnqdmw2I7lwM9pK
	+Htp9QuLoywWNpTfnT1GArU2cRp1L6M27sQeKfJ9iWm8iFAsws4ckQIggY86axJkuz9Y1cIem80
	z6CxPiiNPWPZnOQXZI8Wg41dWL5R6fPOqZolH+mM0NsKyLooTw1lspn+hQ1fSfg0AiKXMXg91qo
	2cX0c2kfgUesxSGkbuUasUTu5HqaWqx+VTXXVVbhgNOFdqRJ8tBOBNo7x/XCj40TYNKg==
X-Google-Smtp-Source: AGHT+IHsnTa0hbn+0Wh1C3VR25cgPSQ44uvQseVE0kXGNojATuxFAd6n7Pd80xTUUipMQpgZdEmtvQ==
X-Received: by 2002:a05:6512:3ba3:b0:597:d7d6:eae1 with SMTP id 2adb3069b0e04-59a17d74eb7mr10048358e87.2.1767484677292;
        Sat, 03 Jan 2026 15:57:57 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd90esm13558109e87.31.2026.01.03.15.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jan 2026 15:57:55 -0800 (PST)
Message-ID: <ad801501-cd9f-41f5-97b3-bf8b628d6e1d@linaro.org>
Date: Sun, 4 Jan 2026 01:57:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] mtd: spi-nor: hisi-sfc: Simplify with scoped for each
 OF child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Pratyush Yadav <pratyush@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, Paul Cercueil
 <paul@crapouillou.net>, Manivannan Sadhasivam <mani@kernel.org>,
 Stefan Agner <stefan@agner.ch>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Michael Walle <mwalle@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
 <20260102124927.64703-14-krzysztof.kozlowski@oss.qualcomm.com>
 <86a4yw87g8.fsf@kernel.org>
 <e2e72720-5541-44cc-a000-c469d7873c06@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <e2e72720-5541-44cc-a000-c469d7873c06@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_155800_470071_FC90532E 
X-CRM114-Status: GOOD (  17.28  )
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

On 1/3/26 14:38, Krzysztof Kozlowski wrote:
> On 02/01/2026 14:33, Pratyush Yadav wrote:
>> Hi Kyzystof,
>>
>> Thanks for the cleanup.
>>
>> On Fri, Jan 02 2026, Krzysztof Kozlowski wrote:
>>
>>> Use scoped for-each loop when iterating over device nodes to make code a
>>> bit simpler.
>>
>> Nit: the commit message is a bit too dry. I had to go and look what the
>> difference between the two variants was. I could make an educated guess
>> by looking at the patch, but still.
> 
> Really? That's old and widely used syntax, replaced so many times and
> sorry, but really obvious.

The made conversion changes are not exactly the ones, which were asked to
be done.

Commit 34af4554fb0c ("of: Introduce for_each_*_child_of_node_scoped()
to automate of_node_put() handling") says it clearly:

     Note that, in the vast majority of cases, the _available_ form should be
     used and as code is converted to these scoped handers, we should confirm
     that any cases that do not check for available have a good reason not
     to.

So, likely this and many other similar changes miss information in their
commit messages, why for_each_available_child_of_node_scoped() form is
inapplicable, thus it still could be improved.

> We should not explain core kernel API in commit msgs, except maybe first
> months of usage.
> 
>>
>> If you end up doing a v2, a one-liner explanation of the difference
>> between the two loop variants would be nice to have.
> 

-- 
Best wishes,
Vladimir

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
