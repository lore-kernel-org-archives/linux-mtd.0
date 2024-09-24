Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78926CF9C77
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Sep 2024 07:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlpVlCnp/a2Dke80flBthhR7yTRC55OABlm+Bvnk9fI=; b=Kh9qRhhon4iuz5
	+gGFxOZubgVaM9+CX52NDkTB/5G+xxGaurZ3+f6UrLMwmJyAP8WqVays7YjwGGXkmkbhV/q5q5N2+
	0nnRReG77yNu5oAacTqG+naUtII3pTdMDGPT+zxQprFfKOoPkDIaF16aLgUZz6YGAR61t7D+xcBbX
	LENHdaxTeVAKxK2AvOjLl0yjKpMzPXK5dWn59phXcWbvldA6aeQCZyNKsV8TTrQhnSoLKWH3aW+RL
	gXN1zchdjlIFSmfr+EIQ+ItT+CodEOC2RjZ5XRuNP//PaBsI5JoPO+BtQnxb4P7BA/WFnNJvTorx2
	i207WKKNfOW09kBdspoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sszp1-00000001Niu-1q0e;
	Tue, 24 Sep 2024 07:18:55 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sszne-00000001NAZ-3fMK
	for linux-mtd@lists.infradead.org;
	Tue, 24 Sep 2024 07:17:32 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42e5e1e6d37so51701495e9.3
        for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2024 00:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727162249; x=1727767049; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=je3cqWSYer77yEubCNKAdoGpIIKvbkuX5RJOi++fMR0=;
        b=vHGeJg6wIIslh/iYOyl0S9eVIVY1SptEt1nSoL6iZcsWn7ch2IU+Bd+JrGOPRCMNyo
         7o6vZL4SUyVf6q3/RMXe6Dp6HCo1T8L14nafpdYb321dXCU1CHDSzQmvIwSqJU2XRLGF
         N2JLwCeXWwSDKbMx0MRkRHIQQxgiDmTRvUImIfI+dKekKU+fds0VCfZlKPALKcCWPZAL
         jbLRUrfb9A0ySzYJSCJD3v4BHoV43OsUT8v0wf2dYszq0zuetM+DS3siB8u3zQL2UkdA
         QTG6qm2nNdcp7kixGkv9ZLNVsebiiMkehd0aZAH0ac595LbaSV2lQVsG0BZpWqaDo82U
         GvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727162249; x=1727767049;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=je3cqWSYer77yEubCNKAdoGpIIKvbkuX5RJOi++fMR0=;
        b=QLX1F35IyaaaQjbsjdXUcv6jwz8Lgz4776KCQiCwT2mhpH5hjJJ93s+JXsILoheq+P
         FGT5VYiPQUg0IqQ6JtyYiHVW1gCwn/MJcQOeiEsv1WXLxLkwF7KnVQFopeVEwlQbtnJa
         fWXCRAjD+t7CJKev7E+5ugP5Ape54NDEIE5iKAcUveDaaNHEz4V2mResIWT0BYO6pnmI
         YIpJaED3NvDfwBSr3tQ8V6pcjqokubrUWMr1o5rSp73f+QRNMwZFtmINVA8FYXbqhBdV
         AtNyaNEV4ODC1g5NBFE55aqmz6101Wv6ZaaOlUN8qEROI1RiGKDpq69RvkfIaoj7qFI7
         C2gA==
X-Gm-Message-State: AOJu0YyJpWWcm5tkhTGH0gRmZyvpzCN4LRQ+Mh4r1OHsk5eO490N/XgV
	dzTYjhJxFDiVZgs5oLhxOPA6yymU3HCeYxUSAXaIUZDcYaNc8oCzxMsNPUohaw0=
X-Google-Smtp-Source: AGHT+IFn3k7mkPSmRC3eeu9UzsnDrRRDgq+BPkVZJpkFWFDCdEc479FolGZTOf6O5SCCYMyFII7RsA==
X-Received: by 2002:a05:600c:1913:b0:42b:8a35:1acf with SMTP id 5b1f17b1804b1-42e7c19bba1mr106144965e9.25.1727162249062;
        Tue, 24 Sep 2024 00:17:29 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e90298f14sm12365895e9.19.2024.09.24.00.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 00:17:28 -0700 (PDT)
Message-ID: <79406f2b-8411-4059-b959-9e543944fb9c@linaro.org>
Date: Tue, 24 Sep 2024 08:17:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] mtd: spi-nor: add support for Macronix Octal flash
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Alvin Zhou <alvinzhou.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratyush@kernel.org, mwalle@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 broonie@kernel.org, chengminglin@mxic.com.tw, leoyu@mxic.com.tw,
 AlvinZhou <alvinzhou@mxic.com.tw>, JaimeLiao <jaimeliao@mxic.com.tw>,
 Bough Chen <haibo.chen@nxp.com>
References: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
 <20240718034614.484018-7-alvinzhou.tw@gmail.com>
 <97134efb-398d-4c21-a915-87a5b4f1b29a@linaro.org>
 <CAPhrvRR3U9=0DuG_FQ81ZJq+RLe6Bn9YO831Mx2n3NkeV3MCdA@mail.gmail.com>
 <368cd6fb-cab1-44ad-af46-651d9323bc19@linaro.org>
 <618e4514-791b-4a73-a1ba-45170a21e453@linaro.org>
Content-Language: en-US
In-Reply-To: <618e4514-791b-4a73-a1ba-45170a21e453@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_001730_971559_549DB397 
X-CRM114-Status: GOOD (  17.57  )
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

CgpPbiA5LzI0LzI0IDc6MzYgQU0sIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4gCj4gCj4gT24gOS8y
NC8yNCA3OjI2IEFNLCBUdWRvciBBbWJhcnVzIHdyb3RlOgo+Pgo+Pgo+PiBPbiA5LzI0LzI0IDQ6
MjUgQU0sIEFsdmluIFpob3Ugd3JvdGU6Cj4+PiBIaSBUdWRvciwKPj4+Cj4+PiBUdWRvciBBbWJh
cnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IOaWvCAyMDI05bm0OeaciDIz5pelIOmAseS4
gCDkuIvljYgyOjU05a+r6YGT77yaCj4+Pj4KPj4+PiBIaSwgQWx2aW4sCj4+Pj4KPj4+PiBJIHF1
aWNrbHkgc2tpbW1lZCBvdmVyIHRoZSBwcmV2aW91cyA1IHBhdGNoZXMgYW5kIHRoZXkgYXJlIGxv
b2tpbmcgZmluZS4KPj4+Pgo+Pj4+IEkgZG9uJ3QgZ2V0IHRoaXMgcGF0Y2ggaG93ZXZlci4KPj4+
Pgo+Pj4+IE9uIDcvMTgvMjQgNDo0NiBBTSwgQWx2aW5aaG91IHdyb3RlOgo+Pj4+PiBGcm9tOiBB
bHZpblpob3UgPGFsdmluemhvdUBteGljLmNvbS50dz4KPj4+Pj4KPj4+Pj4gQWRkaW5nIE1hbnVm
YWN0dXJlIElEIDB4QzIgaW4gbGFzdCBvZiBJRCB0YWJsZSBiZWNhdXNlIG9mCj4+Pj4+IE9jdGFs
IEZsYXNoIG5lZWQgbWFudWZhY3R1cmVyIGZpeHVwIGZvciBlbmFibGluZy9kaXNhYmxpbmcKPj4+
Pj4gT2N0YWwgRFRSIG1vZGUuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEphaW1lTGlhbyA8
amFpbWVsaWFvQG14aWMuY29tLnR3Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbHZpblpob3UgPGFs
dmluemhvdUBteGljLmNvbS50dz4KPj4+Pj4gLS0tCj4+Pj4+ICBkcml2ZXJzL210ZC9zcGktbm9y
L21hY3Jvbml4LmMgfCA0ICsrKy0KPj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvbWFjcm9uaXguYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+Pj4+PiBp
bmRleCBmMDM5ODE5YTUyNTIuLjFhOGNjZWJkZmUwZSAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVy
cy9tdGQvc3BpLW5vci9tYWNyb25peC5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
bWFjcm9uaXguYwo+Pj4+PiBAQCAtMjAwLDcgKzIwMCw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
Zmxhc2hfaW5mbyBtYWNyb25peF9ub3JfcGFydHNbXSA9IHsKPj4+Pj4gICAgICAgICAgICAgICAu
bmFtZSA9ICJteDI1bDMyNTVlIiwKPj4+Pj4gICAgICAgICAgICAgICAuc2l6ZSA9IFNaXzRNLAo+
Pj4+PiAgICAgICAgICAgICAgIC5ub19zZmRwX2ZsYWdzID0gU0VDVF80SywKPj4+Pj4gLSAgICAg
fQo+Pj4+PiArICAgICB9LAo+Pj4+PiArICAgICAvKiBOZWVkIHRoZSBtYW51ZmFjdHVyZXIgZml4
dXBzLCBLZWVwIHRoaXMgbGFzdCAqLwo+Pj4+PiArICAgICB7IC5pZCA9IFNOT1JfSUQoMHhjMikg
fQo+Pj4+PiAgfTsKPj4+Pj4KPj4+Pgo+Pj4+IENvdWxkIHlvdSBwbGVhc2UgZWxhYm9yYXRlIHdo
eSB5b3UgbmVlZCBqdXN0IHRoZSBtYW51ZmFjdHVyZXIgaWQgaGVyZT8gSQo+Pj4+IHdvdWxkIGhh
dmUgZXhwZWN0ZWQgdG8gc2VlIGEgc3BlY2lmaWMgZmxhc2ggZW50cnkgaW5zdGVhZC4KPj4+Cj4+
PiBHcmF0ZWZ1bCB0byBNaWNoYWVsIGZvciB0aGUgdmFsdWFibGUgc3VnZ2VzdGlvbi4gVGhpcyBh
ZGRpdGlvbiBvZiB0aGUKPj4+IE1hY3Jvbml4IG1hbnVmYWN0dXJlciBJRCBlbmFibGVzIHRoZSBm
aXh1cCBmdW5jdGlvbnMgc3VjaCBhcwo+Pj4gbWFjcm9uaXhfbm9yX3NldF9vY3RhbF9kdHIgdG8g
YmUgZXhlY3V0ZWQgd2l0aG91dCB0aGUgbmVlZCB0bwo+Pj4gY3JlYXRlIHNlcGFyYXRlIElEIGVu
dHJpZXMgZm9yIGVhY2ggT2N0YWwgRFRSIE5PUiBGbGFzaCBpbiB0aGUKPj4+IGZsYXNoX2luZm8u
Cj4+Pgo+Pgo+PiBBaCwgbmljZS4gT2theSB0aGVuLiBJJ20gZ29pbmcgdG8gcmV2aWV3IHRoZSBy
ZXN0IG9mIHRoZSBwYXRjaGVzLiBUaGV5Cj4+IGxvb2sgcHJvbWlzaW5nIDspLgo+IAo+IGFoLCBi
dXQgdGhlbiB5b3UnbGwgYWx3YXlzIGhhdmUgYSBtYXRjaGVkIElELCBzbyB5b3UgYnJlYWsgdGhl
IGdlbmVyaWMKPiBmbGFzaCBwcm9iaW5nIGZvciBtYWNyb25peC4gSXMgdGhhdCBjb3JyZWN0PwoK
QW5zd2VyaW5nIG15c2VsZjogaXQncyBmaW5lLiBHZW5lcmljIGZsYXNoIHByb2JlIGp1c3QgZmls
bHMgYSBuYW1lLAp3aGljaCB3ZSBkb24ndCByZWFsbHkgY2FyZSBhYm91dC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
