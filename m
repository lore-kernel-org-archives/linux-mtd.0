Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8E5C4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 12:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=THZMuqvyu4pSvybKPRJAhauUZBoJK+l6MqHZOXITvQs=; b=kdenv0vzpUxQbt
	hBpNfBAOp5vIuGbzrnXTpekug/MxgL8/Vptfws9eAref3p1X0zCX9IgKfwXn8XcBOrBJP7/XkEQON
	iVlVSewm/EUuQWaH0i2Q75Zh+uTjVTkHLPF15DImAs4Nb6IDOLRUWf2zBHovC/HxUBo5/+bvw5Hmr
	g2p504crzmfD5qaL7k7QYA/JDG757ThkAQOW5nbjVPqZwG3INotbm8o2J3r0GghfZPrCab5jwgxza
	f6YUuUfP6jdCuz1jYUGRaZHZlovheJiIJMPHjn+ecPAAvUQFbZMWrXEP9yZVTswmoP1FPgOvXNxjE
	pgkbnaOdmsHSrmDv6dlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7aKx-002PZ5-3B;
	Mon, 27 Nov 2023 12:03:40 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7aKu-002PYZ-2v
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 12:03:38 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40b397793aaso16822335e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2023 04:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701086612; x=1701691412; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XXRIixfuNpH0/GCnA+i/4TGz6LL+mPbMydBZQVnZv1I=;
        b=tHVYv9aj0OTN4WmypuuRSWyQECGAMaQs/y+6W3FJTu48KubjagEp/BF4OCjO93JTQa
         vH0OTOM2NlMLboaiJg0x7kl7IsvE2i+9l9KKT1vCHXREWN0z+jMV7hMc4S2PA/dlxwyI
         p9hgGTPaXWroLeRBtA9YfvemsZChYMwUJQkWZWZMgA5yj52ybdGMH4BExut05AB95P/+
         C8vW7rkYI6c5r0DKEwMGp9ZoaYU2z0TTW0YrRPEuHK7/o44k7z0gtSGUMjupnRua/xtD
         tZCHjd583YixHkPjEFrmwV+5OMSIVr/lU5obePQSrE6Wezoolpu47JTrz/MRRWQKan5y
         XDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701086612; x=1701691412;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XXRIixfuNpH0/GCnA+i/4TGz6LL+mPbMydBZQVnZv1I=;
        b=AGKwBCuThbXKsUREbZuyiOkZl6h08vyd0Mc9k55MPqaBVSKJqTAL/ihMNH/9TpKIgt
         acUKhejcnuO833agFge1A8BNmyJqFPfG6s6GezsA/6oKGPoXCtbpavVKKKigPNSBnSas
         53kS8cIhZsiHhc1PL3oeAMp54p0JnvYCCKCO4O0qwWUDCW217UQc6Po62SScnNvQJ/zY
         boJS0ZxMikfn34R4FqCruwB3O0S5u7UW/i9jL9jA2W5ZcQ97K8oYak9aQmV4gDqL6q4M
         DvWUXONxU0fvjxhbrXbbBEBZdiz+VK/ZSEnMn9zIZSYJfVdd3EbkHGKYM8TUXjZY8Kjp
         Gc6w==
X-Gm-Message-State: AOJu0YxzlMPB69e4nTGLY/byIEgVluctRq7fPgyPn3uP9ToIMTQaxXCv
	bdry4e7e9QNzikmmgWaaBFDV1Q==
X-Google-Smtp-Source: AGHT+IHDm2KNzGRz560PEF9q76YnwlJ4/7cBXm9EJBLae9BzaDOyYv9b/NWOQzqoBXcbtlhN3hT1Hw==
X-Received: by 2002:a05:600c:474b:b0:40b:3bf4:36c6 with SMTP id w11-20020a05600c474b00b0040b3bf436c6mr8768339wmo.12.1701086612626;
        Mon, 27 Nov 2023 04:03:32 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c4f0f00b00405959bbf4fsm13579529wmq.19.2023.11.27.04.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 04:03:32 -0800 (PST)
Message-ID: <07d2d1e3-f3e8-4e30-aabc-8e0010381d36@linaro.org>
Date: Mon, 27 Nov 2023 12:03:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] Hide flash name if it is not set
Content-Language: en-US
To: Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231127100756.41605-1-jaimeliao.tw@gmail.com>
 <20231127124948.163224cc@xps-13> <70b6b105435d891e937a36657fa5debc@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <70b6b105435d891e937a36657fa5debc@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_040337_013711_74AF3763 
X-CRM114-Status: GOOD (  12.74  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxMS8yNy8yMyAxMTo1OCwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBIaSwKPiAKPj4+IGhp
ZGUgZmxhc2ggbmFtZSBpZiBpdCBpcyBub3Qgc2V0Cj4+Cj4+IElzIHRoaXMgcmVhbGx5IG5lZWRl
ZD8gSSdtIGZpbmUgZXhwb3NpbmcgZW4gZW1wdHkgKG9yICIobnVsbCkiKSBuYW1lLiBJCj4+IGd1
ZXNzIGl0IHNob3dzIHRvIHBlb3BsZSB0aGF0IHRoZSBuYW1lIG1pZ2h0IGJlIG1pc3Npbmcgc29t
ZXdoZXJlIGFuZAo+PiBtaWdodCBwdXNoIHBlb3BsZSB0byBmaXggdGhlIG5hbWUgaW5zdGVhZC4K
Pj4KPj4gV2hhdCdzIHlvdXIgdXNlIGNhc2U/Cj4gCj4gQW4gZW1wdHkgc3RyaW5nIGlzIG5vdCBh
IGJ1Zy4gSSdtIHRyeWluZyB0byBwdXNoIHRoZSBwYXJ0IG5hbWVzIG91dCBvZgo+IHRoZSBrZXJu
ZWwgYW5kIGp1c3QgZXhwb3NlIHRoZSBqZWRlYyBpZC4KPiAKPiBUaGF0IGJlaW5nIHNhaWQsIHRo
ZSBkZXNjcmlwdGlvbiBpcyByZWFsbHkgbWlzc2luZyB0aGUgcG9pbnQuIFNlZSBteQo+IHByZXZp
b3VzIHN1Z2dlc3Rpb246Cj4gCj4gwqBUaGUgYXR0cmlidXRlIGlzIG9wdGlvbmFsLiBVc2VyIHNw
YWNlIHNob3VsZG4ndCByZWx5IG9uIGl0IHRvCj4gwqBiZSBwcmVzZW50IG9yIGV2ZW4gY29ycmVj
dC4gSW5zdGVhZCwgdXNlciBzcGFjZSBzaG91bGQgcmVhZCB0aGUKPiDCoGplZGVjX2lkIGF0dHJp
YnV0ZS4KPiAKCisxCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
