Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B00C761A6
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 08:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vkXnu0uLvhyqHezhVqbKC2CT5eY6K2XD6UNSt7UAjts=; b=bSXpF4hdchkc7M
	eWLxkloTRitxEgRhcvl2IgdPFqfnkR8BjHd9/e/1cyXFEkkGWd5J3R1gfVFwSQshR6aelT5bVyoO0
	2Q/eH4uEurSIln/1SJXdnKKgybEkiv04o+kATazWHWDJnfvgOIBPKoFUUZgLRvxwEt6XiGMQYxMos
	Dh8vg/uM9EyDFRAE6Ze4gfE0lSDhHB3ULTr+MlMd4GhowPY3dLHou3/lZf/FJnj6ATIDkHXZ2O33i
	e54jxzo/5hwudgXGl2uw6/Pgg6Ydb+I7XRX241rG0aBC9YarNAs42Z9+lcx1nAQBKssatXkhjIAJr
	Ojuof4GyApKJCzZEpdCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phR2g-00H5DT-05;
	Wed, 29 Mar 2023 08:20:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phR2d-00H58y-0j
	for linux-mtd@lists.infradead.org;
	Wed, 29 Mar 2023 08:20:24 +0000
Received: by mail-wm1-x334.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so10898496wmq.4
        for <linux-mtd@lists.infradead.org>; Wed, 29 Mar 2023 01:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680078016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WvevLPkyczLsyt+0gtz8D9GannpbiOBakYnWLTwfesc=;
        b=Bni9ZHRAc38ZPg+EmrwbsRDu9WtLWVZ2xqHWMDG7wtee4IwFeIpbFUlSx/cCkg6HUH
         Xf1CNVf74sNr4fDhQ7k++YeMOTIztlACIfisxb8UvX1U35KOaNtUl0xVoamcG7Gg91dR
         cbC5tGfcwtdXDj3WIR1otn5Azy6NGyKrMARRPzPyRrTdCWhIWx7HkqbZ1dvWfBqKZRt2
         GU7NenbRpRDmlKBiq/uCJIjfK88RaayGYkJA1oa5QRHjs2cYxeiWbUxfoWolanSqdDBw
         Xg7A5VxZ1OWfvC7cWc7bJEWEJahnBIB5mSBZ+M/mixM7ueGYmQa12geIPt0EYnfNuB48
         l1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680078016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WvevLPkyczLsyt+0gtz8D9GannpbiOBakYnWLTwfesc=;
        b=KEpZ4rDwE30bMKanW5yh8Sg2781MzuSD5FeWJ55iKv1zOohltj+RDxfJ0L96b+CFZm
         bPAMWNrzqugEQLZAnQRI0d+u3fhFmUTaEzkIKbwX+D77dKXA96qMbx9PoHy4D9N12DX+
         oIZjV+JspT0kRtQmBeCaYkX/GGSbaqnnpiAuSobKzs/WfH0cGo1YDgk6XRPyjvbVe3k6
         eEmMzMbSZSMAFVFeNY0bWUF6iBubTDMkopHhFteOWVEWdctPok/Tf0Fas73ZYj3kibs5
         35JZOhDXRyJRSlWTl8wK/C258wLBkWqC4mmP+00XZi4cp3LsTeJl6gd2eI4XmLH3XQ6T
         sM4A==
X-Gm-Message-State: AAQBX9e6O2D8bFn4IG1SnEb7JEt7PZoahVoLfObk8zWBMh4vhz+J0MYa
	ZHXRoIomyIItR3rZB60nq1sD/w==
X-Google-Smtp-Source: AKy350ZWoR/Y88UzmnTa/XtNhAyjFirNPw6uwmMQjtSuHbx5S4jniKWcHdT7mZv8stfMg9KPoqbQAQ==
X-Received: by 2002:a7b:cd8f:0:b0:3ef:6396:d9c8 with SMTP id y15-20020a7bcd8f000000b003ef6396d9c8mr10457044wmj.5.1680078016199;
        Wed, 29 Mar 2023 01:20:16 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id fc11-20020a05600c524b00b003ebff290a52sm1415902wmb.28.2023.03.29.01.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 01:20:15 -0700 (PDT)
Message-ID: <9c7ef736-527b-1659-88d8-cedf56458c30@linaro.org>
Date: Wed, 29 Mar 2023 09:20:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix bitmask for length in command
 word
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
 Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@sberdevices.ru, oxffffaa@gmail.com
References: <d4338bd5-125c-a9e7-cb46-6f5e1da05cfa@sberdevices.ru>
 <CAFBinCB3yuyNJD=7UJ7jzf45Masms_PD4sm42YNjO8M4cr+4wg@mail.gmail.com>
 <fe2ed378-cdac-dbb3-acd2-ff542bd7e887@sberdevices.ru>
 <81632eee-533e-5e44-1520-5321a06c6797@sberdevices.ru>
 <20230328185001.5661132b@xps-13>
 <e8edcbc8-5c72-b29e-21d7-6f4438391924@sberdevices.ru>
 <CAFBinCCCNYJV4RBbM78r3yGPnY4oNKySEFRkzBgUD3xYJGkJmw@mail.gmail.com>
 <2fed42ad-11cb-6199-6adb-d9272209f5e2@sberdevices.ru>
 <20230329093145.52790647@xps-13>
 <20230329081734.v2kl4okq3ewimvzh@CAB-WSD-L081021>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230329081734.v2kl4okq3ewimvzh@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_012023_264849_B919159F 
X-CRM114-Status: GOOD (  19.47  )
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

CgpPbiAzLzI5LzIzIDA5OjE3LCBEbWl0cnkgUm9rb3NvdiB3cm90ZToKPiBPbiBXZWQsIE1hciAy
OSwgMjAyMyBhdCAwOTozMTo0NUFNICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBIZWxs
bywKPj4KPj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwgMjkgTWFyIDIw
MjMgMTA6MTI6MTAgKzAzMDA6Cj4+Cj4+PiBPbiAyOC4wMy4yMDIzIDIzOjI1LCBNYXJ0aW4gQmx1
bWVuc3RpbmdsIHdyb3RlOgo+Pj4+IEhpIEFyc2VuaXksCj4+Pj4KPj4+PiBPbiBUdWUsIE1hciAy
OCwgMjAyMyBhdCA4OjM54oCvUE0gQXJzZW5peSBLcmFzbm92Cj4+Pj4gPGF2a3Jhc25vdkBzYmVy
ZGV2aWNlcy5ydT4gd3JvdGU6Cj4+Pj4gWy4uLl0gIAo+Pj4+Pj4KPj4+Pj4+IEJ5IHRoZSB3YXkg
YW55IHJlYXNvbiBub3QgdG8gaGF2ZSBDYydlZCBzdGFibGU/ICAKPj4+Pj4KPj4+Pj4gU29ycnks
IHdoYXQgZG8gWW91IG1lYW4/IEkndmUgaW5jbHVkZWQgbGludXgtbXRkIG1haWxpbmcgbGlzdHMs
IHRoZXJlIGlzCj4+Pj4+IG9uZSBtb3JlIGxpc3QgZm9yIG10ZCByZXZpZXdzPyBJIHdpbGwgYXBw
cmVjaWF0ZSBpZiBZb3UgY2FuIHBvaW50IG1lICAKPj4+PiAic3RhYmxlIiB0eXBpY2FsbHkgcmVm
ZXJzIHRvIHRoZSBzdGFibGUgdHJlZSB3aGVyZSBmaXhlcyBmb3IgYWxyZWFkeQo+Pj4+IHJlbGVh
c2VkIGtlcm5lbCB2ZXJzaW9ucyBhcmUgbWFpbnRhaW5lZC4KPj4+PiBXaGVuIE1pcXVlbCBhcHBs
aWVzIHRoZSBwYXRjaCBpdCB3aWxsIGVpdGhlciBsYW5kIGluIHRoZSBuZXh0IC1yYyBvZgo+Pj4+
IHRoZSBjdXJyZW50IGRldmVsb3BtZW50IGN5Y2xlICh0eXBpY2FsbHkgYXBwbGllcyB0byBmaXhl
cyAtIGN1cnJlbnRseQo+Pj4+IDYuMy1yYzUpIG9yIC1yYzEgb2YgdGhlIG5leHQga2VybmVsIHZl
cnNpb24gKHR5cGljYWxseSBhcHBsaWVzIHRvIG5ldwo+Pj4+IGZlYXR1cmVzLCBjbGVhbnVwcywg
ZXRjLiAtIGN1cnJlbnRseSA2LjQtcmMxKS4KPj4+Pgo+Pj4+IExldCdzIHNheSB5b3UgYXJlIGZp
eGluZyBhIGJ1ZyBub3cgYnV0IHdhbnQgdGhlIGZpeCB0byBiZSBpbmNsdWRlZCBpbgo+Pj4+IDYu
MSBMVFMgKGxvbmcgdGVybSBzdGFibGUpIG9yIG90aGVyIHN0YWJsZSByZWxlYXNlLgo+Pj4+IElu
IHRoaXMgY2FzZSBpdCdzIHJlY29tbWVuZGVkIHRvIENjIHRoZSBtYWludGFpbmVycyBvZiB0aGUg
c3RhYmxlCj4+Pj4gdHJlZXMgYXMgcGFydCBvZiB5b3VyIHBhdGNoLCBzZWUgWzBdLgo+Pj4+IFRo
YXQgd2F5IG9uY2UgdGhlIGNvbW1pdCB3aXRoIHlvdXIgZml4IGhpdHMgTGludXMgVG9ydmFsZHMg
bGludXggdHJlZQo+Pj4+IGl0IHdpbGwgYmUgYmFja3BvcnRlZCBieSB0aGUgc3RhYmxlIHRlYW0g
d2l0aGluIGEgZmV3IGRheXMgKGFzc3VtaW5nCj4+Pj4gb2YgY291cnNlIHRoYXQgdGhlIHBhdGNo
IGFwcGxpZXMgY2xlYW5seSB0byBvbGRlciB2ZXJzaW9ucywgaWYgbm90Cj4+Pj4gdGhleSdyZSBu
b3RpZnlpbmcgeW91KS4KPj4+PiBOb3RlOiBldmVuIHdpdGhvdXQgQ2MnaW5nIHRoZSBzdGFibGUg
bWFpbnRhaW5lcnMgeW91ciBjb21taXQgbWF5IGJlCj4+Pj4gYmFja3BvcnRlZCAoc2VtaS1hdXRv
bWF0aWNhbGx5KSBpZiBpdCBoYXMgYSBGaXhlcyB0YWcgYW5kIHRoZSBzdGFibGUKPj4+PiBtYWlu
dGFpbmVycyBmaW5kIHlvdXIgY29tbWl0LiBCdXQgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGl0
J3MKPj4+PiBlYXNpZXN0IGZvciB0aGVtIGlmIHRoZXkncmUgZXhwbGljaXRseSBDYydlZCBvbiB0
aGUgcGF0Y2guCj4+Pj4KPj4+PiBJIGhvcGUgdGhpcyBtYWtlcyBzZW5zZS4gSWYgbm90OiBkb24n
dCBoZXNpdGF0ZSB0byBhc2suICAKPj4KPj4gVGhhdCBpcyBhbiBleGNlbGxlbnQgc3VtbWFyeSwg
SSBzaG91bGQgY29weS9wYXN0ZSBpdCBzb21ldGltZXMgOikKPj4KPiAKPiBGaW5hbGx5IEkgZnVs
bHkgdW5kZXJzdGFuZCB3aHkgJ0ZpeGVzJyB0YWcgaXMgc28gaGVscGZ1bCEKPiBUaGFuayB5b3Ug
TWFydGluIQo+IAoKSGVyZSdzIHRoZSBvZmZpY2lhbCBkb2N1bWVudGF0aW9uOgpodHRwczovL3d3
dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL3N0YWJsZS1rZXJuZWwtcnVsZXMu
aHRtbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
