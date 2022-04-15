Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D6CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Apr 2022 09:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x8LaDY/LsWwGnCaIkE4SgY8FwyF3PyD7pk8NYVBU9Ec=; b=2tUYDB0NJaFTNf
	llJSjC7AXfuk5eex+Nkr/hbTszpSZfz/V6B9plQfNmQhaYnWPP5OqqyRenvuVdD/m5aMg6uZGGnSR
	EXswCgJt9oYJrlmAnPPMxGtqgfTtVb/TMOTNLNBRPbulvihtQ0dEOd5JiJ4oUKOf/6st5egM0cWx4
	AWHjExZwZDbyh9lndaRYA6mDBV9hsrmmu3O5y90+B8SWDpUL/03VylqnxGn/ELlj070tIlcC7uL41
	9eKOQK304c8UXT0RRZngPU9eAlhkkBendUuMJRndhzlfMZMOIJFVBX0mbxq7QkP37tbULiT7dxqoJ
	t5AKQQJRbg4h3TDCZPVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfHo1-009QyT-91; Fri, 15 Apr 2022 08:59:53 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfHnx-009Qwr-Rt
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2022 08:59:51 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so7396144wmb.4
 for <linux-mtd@lists.infradead.org>; Fri, 15 Apr 2022 01:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8/TXbsT8teCEmzE4dKBRkHwWmwMIpGUt/j6OmZyhVs8=;
 b=zcuSPMiyE4DadhWmqIxhMhkVRG1EODIESBPqrLgc1bDtVPYwKf3N4qAJwfMyMUJkJy
 qGP0rM6LvQPrcfInwuww1spzKroUuFjnsWyF7/AHnbfK7V9o59Z0q2CtscbBJMOUSdYl
 m+7uV7vHSa+xdCxbz5gw5rHfEkSzA6fH6X5LoasT6dp7/LV+N/CVM48pLD1vs/4AmkjO
 2XQXg1UHhsII2STcFhWN9d6vtkd+vOovWDJiG6gNBw7QiY+L6TObOEOdrzFxPlg+kVDp
 XAvrDDje+hSI8FuLzJ1sZsE/tokjKJ8zw9TPEHZBrlizPPazgjNukZdomX+7fvj3xsQE
 jBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8/TXbsT8teCEmzE4dKBRkHwWmwMIpGUt/j6OmZyhVs8=;
 b=7ycukBwtNyktgF3u+11xfvrGlcTSDrGKTjKvaPkcAI/YjQqNbeZc/xHTyG/CB9ute9
 MKYbZGjU9QfJKUkMD/9+0fVkj4U4xSfW5aqaMkpyghu/E2FRvEn9A1aoNndiOTXfcykg
 5FCGrCmcYOrnMzZfXOe6+HqJby+AQktSO/EqwXWGgkr/5y8C/ndEj7QPqJgD9PRcll5V
 uaS/9carbRU82ctsf2y76+AaH3zUuLMoSO9rgyOJI3h/MRk4a0Q1HhcxOw5r+m9Y7qab
 RrVVZP1uuLSrz1GgEAJWWdMt6l/qY5f2ILbsqgMjeyjej6oe8tno8KJ079Fzbm4PWafH
 VcMA==
X-Gm-Message-State: AOAM531GcmySJl4f5HXCc6l09n+xzYbHLVLLPWCj9pOhpYfk2rs48zH0
 IM+cQmsRuxssEd/4Ui/ZYoPvzA==
X-Google-Smtp-Source: ABdhPJxzM1b28MxcPYpVlkWFMBt4zpNJk7HpRWqFcxIiFvIoZonhstKNM9sMl32pcHIQU9hrh9BKtw==
X-Received: by 2002:a05:600c:29c7:b0:38e:c58d:7b00 with SMTP id
 s7-20020a05600c29c700b0038ec58d7b00mr2450360wmd.47.1650013186426; 
 Fri, 15 Apr 2022 01:59:46 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a7bc852000000b0038ebf5f191esm9404929wml.45.2022.04.15.01.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 01:59:45 -0700 (PDT)
Message-ID: <371c1efe-8cff-8bab-8466-02efe4c3d155@smile.fr>
Date: Fri, 15 Apr 2022 10:59:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 0/4] memory: omap-gpmc: Add AM64 SoC support
Content-Language: en-US
To: Roger Quadros <rogerq@kernel.org>, krzysztof.kozlowski@canonical.com,
 miquel.raynal@bootlin.com, tony@atomide.com
Cc: robh@kernel.org, kishon@ti.com, nm@ti.com, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
References: <20211221131757.2030-1-rogerq@kernel.org>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20211221131757.2030-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_015950_160710_DFDB48D1 
X-CRM114-Status: GOOD (  18.02  )
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

SGVsbG8sCgpMZSAyMS8xMi8yMDIxIMOgIDE0OjE3LCBSb2dlciBRdWFkcm9zIGEgw6ljcml0wqA6
Cj4gSGksCj4gCj4gVEkncyBBTTY0IFNvQyBjb250YWlucyBvbmUgR1BNQyBtb2R1bGUuIEFkZCBk
cml2ZXIgc3VwcG9ydCBmb3IgaXQuCgpXaGF0J3MgdGhlIHN0YXR1cyBvZiB0aGUgR1BNQyBpbnRl
cmZhY2Ugb24gSzMgYXJjaGl0ZWN0dXJlLCBlc3BlY2lhbGx5IGZvciBBTTY1LApBTTYyIGFuZCBv
dGhlciBKYWNpbnRvIDcgQ1BVIGRldmljZXMgPwoKVEkgY3VycmVudGx5IGRvbid0IHJlY29tbWVu
ZCB0byB1c2UgaXQgZm9yIG5vdyBldmVuIGlmIHRoZXJlIGFyZSBzdGlsbCBzb21lIEdQTUMKdXNl
IGNhc2Ugd2l0aCBGUEdBIGRldmljZXM6CgpodHRwczovL2UyZS50aS5jb20vc3VwcG9ydC9wcm9j
ZXNzb3JzLWdyb3VwL3Byb2Nlc3NvcnMvZi9wcm9jZXNzb3JzLWZvcnVtLzk5NDE5MS9hbTY0NDIt
YW02NHgtZ3BtYy1zdXBwb3J0CgpUaGlzIHBhdGNoIHNlcmllcyBhZGQgb21hcC1ncG1jIHN1cHBv
cnQgZm9yIEFNNjQgU29jIGJ1dCBhcyBvZiBrZXJuZWwgNS4xOC1yYzIsCnRoZXJlIGlzIG5vIGRl
dmljZXRyZWUgdXNpbmcgdGksYW02NC1ncG1jLgoKVGhpcyBwYXRjaCBzZWVtcyBtaXNzaW5nIChh
dCBsZWFzdCk6Cmh0dHBzOi8vZ2l0LnRpLmNvbS9jZ2l0L3RpLWxpbnV4LWtlcm5lbC90aS1saW51
eC1rZXJuZWwvY29tbWl0Lz9oPXRpLWxpbnV4LTUuMTAueSZpZD01NWMxMDJhNzVkMzk5ODk2Yzcz
OTYyMjljZDY4N2JmOTdhZmI1Y2Y2CgpUaGFua3MhCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAK
PiBjaGVlcnMsCj4gLXJvZ2VyCj4gCj4gQ2hhbmdlbG9nOgo+IHY0Cj4gLSBtb3ZlIGNvbXBhdGli
bGUgbWF0Y2ggdGFibGUgdG8gaGVhZGVyIGZpbGUgc28gaXQgY2FuIGJlIHVzZWQgYnkKPiBHUE1D
IGRyaXZlciBldmVuIHdoZW4gTkFORCBkcml2ZXIgaXMgbm90IGVuYWJsZWQgb3IgYXMgYSBtb2R1
bGUuCj4gR1BNQyBkcml2ZXIgaXMgYWx3YXlzIGVuYWJsZWQgYXMgYnVpbHQtaW4uCj4gLSBTZWxl
Y3QgT01BUF9HUE1DIGRyaXZlciBmcm9tIE1URF9OQU5EX09NQVAyIGRyaXZlciBjb25maWcgYXMK
PiBPTUFQX0dQTUMgaXMgbm90IGVzc2VudGlhbCBmb3IgQVJDSF9LMyBib290Lgo+IAo+IHYzCj4g
LSB1c2UgY29tcGF0aWJsZSBtYXRjaCB0YWJsZSBmb3IgY2hlY2tpbmcgZm9yIE5BTkQgY29udHJv
bGxlciBub2RlIGluCj4gR1BNQyBkcml2ZXIuCj4gCj4gdjIKPiAtIHVwZGF0ZSBEVCBiaW5kaW5n
IGRvYyB0byBtYWtlIHJlZy1uYW1lcyBhbmQgcG93ZXItZG9tYWlucyBwcm9wZXJ0eQo+IHJlcXVp
cmVkIG9ubHkgZm9yIHNwZWNpZmljIFNvQy4KPiAKPiBSb2dlciBRdWFkcm9zICg0KToKPiAgIGR0
LWJpbmRpbmdzOiBtZW1vcnktY29udHJvbGxlcnM6IHRpLGdwbWM6IEFkZCBjb21wYXRpYmxlIGZv
ciBBTTY0Cj4gICBtZW1vcnk6IG9tYXAtZ3BtYzogQWRkIHN1cHBvcnQgZm9yIEdQTUMgb24gQU02
NCBTb0MKPiAgIG1lbW9yeTogb21hcC1ncG1jOiBVc2UgYSBjb21wYXRpYmxlIG1hdGNoIHRhYmxl
IHdoZW4gY2hlY2tpbmcgZm9yIE5BTkQKPiAgICAgY29udHJvbGxlcgo+ICAgbXRkOiByYXduYW5k
OiBvbWFwMjogU2VsZWN0IEdQTUMgZGV2aWNlIGRyaXZlciBmb3IgQVJDSF9LMwo+IAo+ICAuLi4v
YmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL3RpLGdwbWMueWFtbCAgfCAyMyArKysrKysrKyst
Cj4gIGRyaXZlcnMvbWVtb3J5L29tYXAtZ3BtYy5jICAgICAgICAgICAgICAgICAgICB8IDQ2ICsr
KysrKysrKysrKysrLS0tLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgIHwgIDEgKwo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9vbWFwMi5jICAgICAgICAg
ICAgICAgICAgfCAgNSArLQo+ICBpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvbXRkLW5hbmQt
b21hcDIuaCAgfCAgOSArKystCj4gIDUgZmlsZXMgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKSwg
MTcgZGVsZXRpb25zKC0pCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
