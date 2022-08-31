Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06F5ECAAD3
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Aug 2022 07:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWlgvyBanJx+ivxujMvzBb6aCIlbFCoNymg0w122Bec=; b=ShPGCWBzTrUYWp
	+2q2g/okZr6H621fmYkr+yZyJ1GimlLJNWa9jId16QSWbfg2rqu9TBMiPhwokYZd+4RbZXWDfq737
	EVNsuwpf+cHe0ANUUAC06VfBLKdVq1ZfcrVYV9EllUzDK0j3hty95bmRRkYhwrBdMcUl8gPrHt4FO
	6uReTdCS0QtZq9opIQMTVWQI+BGN/GMnmJ3lmY7b5cHW47FUd3C9qBJX2X/qkJZeQJ4lLguYJqTuz
	eCNohxnWpqJ/UVfZYgNUBbr7e+9pWnQXdaNtmqi8FTHJoN1BMaw1P9dQBYgGKvh99SV1DI2lmbdZh
	+ecW6l1csiVOlgQJ5xwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTIU5-004hHO-2d; Wed, 31 Aug 2022 07:50:01 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTISG-004gc0-QX
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2022 07:48:10 +0000
Received: by mail-lf1-x12a.google.com with SMTP id p7so7646856lfu.3
        for <linux-mtd@lists.infradead.org>; Wed, 31 Aug 2022 00:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=dKwUKqyzx080nN57Qu5BhT7GLES0nR5U2OgHxHW4Ezc=;
        b=hl+Q4cmXAGv7OYDv7Qj4tlRkQxNyddYi7q/ngGx6bFSaSmRkwN8dzwSW4eHO1bmuMz
         rWZy0ESlGPkMAq5eBjIM0vStrCffAA+R8fglShdYfdQOHeLNKGYTGWc7Tn0lx8Io6P7X
         xh9WAQENzFmSOsHgXxLrbbuCdch4X+kgvlOsnuBrCgIxI7F+mZVDF8tNXshH72d9Bb8y
         ya7lHgqxS2tp6N/5Xs1JL3m43Kx+yN+7KzEt3F0/3vVshghTe8Zd3UioB47XVNHbDRwL
         9zIcTkhtBNqxbnhw9FnKggmt3vkfG1DjhWyOpwRHJ5I1Z4hs8kNgVH5i+lTVX+0pPP9y
         rzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=dKwUKqyzx080nN57Qu5BhT7GLES0nR5U2OgHxHW4Ezc=;
        b=IuqLh7JE7Wxq9cYH94Vy6vx82aUSGojpikWKMPbamLXIoWuwyFkq1OVP0wA9p4LgZN
         hNlMURFosN2q3if11ydi5TBYGF18QL5AL7uuIARGvmibpXEatamVMbft6qlle4gKS9os
         k8+ZWADRayc9m3nB6RB2waG8i2HPpcZ234S9AXltS7l20FGlh1X91wU8FuozTg/UO8xz
         qnFda/u5n7f3kZWCupyycJbBHB4C4MjmN/GpUcPB9XYwnJTDOG5WKzGkFoW06B/5ZGLT
         vrZenMH4qA9MgELtPK8LrJdHTJmpMiLApOd+om2wARK9pJgunR4UmIWPy9JJdeuGSIM3
         lkZQ==
X-Gm-Message-State: ACgBeo0AEMCZJ0f0l5gFdv9fnF2EqufWc3CeBAEUDAqtdr000RZAw+C9
	+OY7kUz/1/bHlPBKgBp7q52S7MEVn5eTHBAF
X-Google-Smtp-Source: AA6agR4W/w1pRyESLXYMtdHVCoA4b3PCovSoib0WzKVz2vuHkr+YlwYeMrToBxLCSTYKQ/8NWcUGKA==
X-Received: by 2002:a05:6512:33d3:b0:494:6e1c:f870 with SMTP id d19-20020a05651233d300b004946e1cf870mr3854026lfg.196.1661932087047;
        Wed, 31 Aug 2022 00:48:07 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id l19-20020a2e9093000000b0025d5eb5dde7sm1937279ljg.104.2022.08.31.00.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 00:48:06 -0700 (PDT)
Message-ID: <8995b1ce-e236-1272-39d6-2dd498aafb38@linaro.org>
Date: Wed, 31 Aug 2022 10:48:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 00/14] nvmem: core: introduce NVMEM layouts
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20220825214423.903672-1-michael@walle.cc>
 <768ff63a-54f5-9cde-e888-206cdf018df3@milecki.pl>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <768ff63a-54f5-9cde-e888-206cdf018df3@milecki.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_004808_933686_A4EABDDC 
X-CRM114-Status: GOOD (  16.91  )
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

T24gMjgvMDgvMjAyMiAxODowNSwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IE9uIDI1LjA4LjIw
MjIgMjM6NDQsIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+IFRoaXMgaXMgbm93IHRoZSB0aGlyZCBh
dHRlbXB0IHRvIGZldGNoIHRoZSBNQUMgYWRkcmVzc2VzIGZyb20gdGhlIFZQRAo+PiBmb3IgdGhl
IEtvbnRyb24gc2wyOCBib2FyZHMuIFByZXZpb3VzIGRpc2N1c3Npb25zIGNhbiBiZSBmb3VuZCBo
ZXJlOgo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjExMjI4MTQyNTQ5LjEyNzU0
MTItMS1taWNoYWVsQHdhbGxlLmNjLwo+Pgo+Pgo+PiBOVk1FTSBjZWxscyBhcmUgdHlwaWNhbGx5
IGFkZGVkIGJ5IGJvYXJkIGNvZGUgb3IgYnkgdGhlIGRldmljZXRyZWUuIEJ1dAo+PiBhcyB0aGUg
Y2VsbHMgZ2V0IG1vcmUgY29tcGxleCwgdGhlcmUgaXMgKHZhbGlkKSBwdXNoIGJhY2sgZnJvbSB0
aGUKPj4gZGV2aWNldHJlZSBtYWludGFpbmVycyB0byBub3QgcHV0IHRoYXQgaGFuZGxpbmcgaW4g
dGhlIGRldmljZXRyZWUuCj4gCj4gSSBkcm9wcGVkIHRoZSBiYWxsIHdhaXRpbmcgZm9yIFJvYidz
IHJlcG9uc2UgaW4gdGhlCj4gW1BBVENIIDAvMl0gZHQtYmluZGluZ3M6IG52bWVtOiBzdXBwb3J0
IGRlc2NyaWJpbmcgY2VsbHMKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2Vy
bmVsLzBiN2I4ZjdlYTY1NjlmNzk1MjRhZWExYTNkNzgzNjY1QHdhbGxlLmNjL1QvCj4gCj4gQmVm
b3JlIHdlIGdvIGFueSBmdXJ0aGVyIGNhbiB3ZSBoYXZlIGEgY2xlYXIgYW5zd2VyIGZyb20gUm9i
IChvcgo+IEtyenlzenRvZiBub3cgdG9vPyk6Cj4gCj4gCj4gSXMgdGhlcmUgYW55IHBvaW50IGlu
IGhhdmluZyBiaW5kaW5ncyBsaWtlOgo+IAo+IGNvbXBhdGlibGUgPSAibWFjLWFkZHJlc3MiOwo+
IAo+IGZvciBOVk1FTSBjZWxscyBub2Rlcz8gU28gc3lzdGVtcyAoTGludXgsIFUtQm9vdCkgY2Fu
IGhhbmRsZSB0aGVtIGluIGEKPiBtb3JlIGdlbmVyaWMgd2F5PwoKSSB0aGluayBSb2IgaXMgYWxy
ZWFkeSBpbiB0aGUgc3ViamVjdCwgYnV0IEkgd29uZGVyIGhvdyB3b3VsZCB0aGF0IHdvcmsKZm9y
IFUtQm9vdD8gWW91IG1pZ2h0IGhhdmUgbXVsdGlwbGUgY2FyZHMsIHNvIGhvdyBkb2VzIHRoaXMg
bWF0Y2hpbmcKd291bGQgd29yaz8gSU9XLCB3aGF0IHByb2JsZW0gd291bGQgaXQgc29sdmUgY29t
cGFyaW5nIHRvIGV4aXN0aW5nCnNvbHV0aW9uIChhbGlhcyB0byBldGhlcm5ldCBkZXZpY2Ugd2l0
aCBtYWMtYWRkcmVzcyBmaWVsZCk/CgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
