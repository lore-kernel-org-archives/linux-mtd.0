Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD920C74A5B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 14:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GcR3jzmaDnKHbBWn2QDmaET8se4Uyy7/uELPoSvuD50=; b=VRsl7ruqkn166o
	PRsIwEqoMDn3xHrQpaZJax0HCyqyuxLoUxDW41F0mRfRc8JgYxje9dQQwDie6q3TzY/Wf0tOqbHoa
	X55Gs5v+LVVv5OXxd+f8zSPb+0N6Seh2blXnPry0g3twGod5CyVbnrq2PbAvvABZZDcqaKhXHdMFY
	kQIk6pvY2j1fV4N2MUpsEdliDVRjxOAECI67K36NyT+My1MerNwbbxE0nwMqgM67z1L+VF3rCPfSR
	vYQTbBs5cYxIzZ9zRZOGcvuGM6KKU2ncmKZqExqrzuQSZOCw8bC0Cl7uEm7t4D2VZ36Hk+Y9SOryS
	EwIgbganIvXo2KcSHT7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdAvS-002QrA-35;
	Fri, 17 Mar 2023 14:19:22 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdAvQ-002QqQ-0h
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 14:19:21 +0000
Received: by mail-ed1-x52f.google.com with SMTP id y4so21061707edo.2
        for <linux-mtd@lists.infradead.org>; Fri, 17 Mar 2023 07:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679062757;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a6UGZ1j5YRGIf++SOvuEvf0e/rChiAlxEglEcWXrI2w=;
        b=REjKmlFEGmcll6US1J3Fjy2eVZPzYE79Zxt6zU0wgJvPLI7pghhh0qSBZi/9pQIQbW
         LYBgYDutldhhhvbTgkt4p3ajRS62P2evYQ0/wtRtaLRIwJZLBKQABWAdYP1Nkw+za3Ms
         p2UQKQj8CXbThEFh2kWQTmLh1EaN2CPHSNVhtRHMnK8u0VulujPDzwDSIzG7dUfQz8bd
         jSPLipQ8iXKN+o4mrDdrg+lQP/Owb96c9Vfy2CoTCnQJq8JGHv1u8QElkfGgTBEaKnL7
         k15Cqe8TEUEGrtOVyAQ0GMb3kxsJ9oURsbN6KoeCQW6O9k/wIaXVFTNkyGvaXQzWMieW
         0VYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679062757;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a6UGZ1j5YRGIf++SOvuEvf0e/rChiAlxEglEcWXrI2w=;
        b=pZ2ffj81C8Qk689KLNjfBA4KtF/NkoFkCggFdowjwKz1EocHE9ZrMZFuyPnSXla/Ie
         Fa7eF6MkPSezHvf/wI0JhH3NvWevRq2B7CFM2fO0Jgd+MO3azUsx2M69U+AxNkPaWcbo
         2F72EzNMEU4Cd4XxvvTwUVGKixGB1njnHAtcU2EzSDYypTqdZaVzfiziN7t4PtOVEIGD
         A51ylDZ23BT8N01O1NBVf5vgGrnKgCa2r7ygJUjdbk8mRzSB5xTZ+5NN5JSwzm07cHNi
         joEmRd1zFNsgq6GGNweatOxoocOPBmFFDmx6KX/m9A9L59QDuh29fUfhP+2NKvtNCnfU
         b7cA==
X-Gm-Message-State: AO0yUKUFjILgPhKuoloNjuhAhxtUz+g/yFwwI3upzYmzJ0PAnhar17mg
	/tX8lBK8sVXOPaq8UQE2THN1Pg==
X-Google-Smtp-Source: AK7set9CQKALE1nJSPxCGWqo6FPkmjxZdLykShuvvS32DIAJUqhvKbNqm5KYD0e8JHNU/6SCZ193Ig==
X-Received: by 2002:a17:906:702:b0:913:ff28:59bd with SMTP id y2-20020a170906070200b00913ff2859bdmr14499758ejb.52.1679062756938;
        Fri, 17 Mar 2023 07:19:16 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id z9-20020a1709067e4900b0092be390b51asm1024602ejr.113.2023.03.17.07.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 07:19:16 -0700 (PDT)
Message-ID: <33ad964e-edfd-a894-5399-1e870cb36112@linaro.org>
Date: Fri, 17 Mar 2023 14:19:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Probing devices by their less-specific "compatible" bindings
 (here: brcmnand)
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Brian Norris <briannorris@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
References: <399d2f43-5cad-6c51-fe3a-623950e2151a@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <399d2f43-5cad-6c51-fe3a-623950e2151a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_071920_328464_016D1EF3 
X-CRM114-Status: GOOD (  22.59  )
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

CgpPbiAzLzE3LzIzIDEwOjAyLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4gSGksIEkganVzdCBz
cGVudCBmZXcgaG91cnMgZGVidWdnaW5nIGhpZGRlbiBodyBsb2NrdXAgYW5kIEkgbmVlZCB0bwo+
IGNvbnN1bHQgZHJpdmVyIGNvcmUgY29kZSBiZWhhdmlvdXIuCj4gCj4gSSBoYXZlIGEgQkNNNDkw
OCBTb0MgYmFzZWQgYm9hcmQgd2l0aCBhIE5BTkQgY29udHJvbGxlciBvbiBpdC4KPiAKPiAKPiAj
IyMgSGFyZHdhcmUgYmluZGluZwo+IAo+IEhhcmR3YXJlIGRldGFpbHM6Cj4gYXJjaC9hcm02NC9i
b290L2R0cy9icm9hZGNvbS9iY21iY2EvYmNtNDkwOC5kdHNpCj4gCj4gUmVsZXZhbnQgcGFydDoK
PiBuYW5kLWNvbnRyb2xsZXJAMTgwMCB7Cj4gwqDCoMKgwqBjb21wYXRpYmxlID0gImJyY20sbmFu
ZC1iY202MzEzOCIsICJicmNtLGJyY21uYW5kLXY3LjEiLAo+ICJicmNtLGJyY21uYW5kIjsKPiDC
oMKgwqDCoHJlZyA9IDwweDE4MDAgMHg2MDA+LCA8MHgyMDAwIDB4MTA+Owo+IMKgwqDCoMKgcmVn
LW5hbWVzID0gIm5hbmQiLCAibmFuZC1pbnQtYmFzZSI7Cj4gfToKPiAKPiBBYm92ZSBiaW5kaW5n
IGlzIGJhc2VkIG9uIHRoZSBkb2N1bWVudGF0aW9uOgo+IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC55YW1sCj4gCj4gCj4gIyMjIExpbnV4IGRyaXZl
cnMKPiAKPiBMaW51eCBoYXMgc2VwYXJhdGVkIGRyaXZlcnMgZm9yIGZldyBCcm9hZGNvbSdzIE5B
TkQgY29udHJvbGxlciBiaW5kaW5nczoKPiAKPiAxLiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNt
bmFuZC9iY202MzEzOF9uYW5kLmMgZm9yOgo+IGJyY20sbmFuZC1iY202MzEzOAo+IAo+IDIuIGRy
aXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgZm9yOgo+IGJyY20sYnJjbW5h
bmQtdjIuMQo+IGJyY20sYnJjbW5hbmQtdjIuMgo+IGJyY20sYnJjbW5hbmQtdjQuMAo+IGJyY20s
YnJjbW5hbmQtdjUuMAo+IGJyY20sYnJjbW5hbmQtdjYuMAo+IGJyY20sYnJjbW5hbmQtdjYuMQo+
IGJyY20sYnJjbW5hbmQtdjYuMgo+IGJyY20sYnJjbW5hbmQtdjcuMAo+IGJyY20sYnJjbW5hbmQt
djcuMQo+IGJyY20sYnJjbW5hbmQtdjcuMgo+IGJyY20sYnJjbW5hbmQtdjcuMwo+IAo+IDMuIGRy
aXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21zdGJfbmFuZC5jIGZvcjoKPiBicmNtLGJy
Y21uYW5kCj4gCj4gCj4gIyMjIFByb2JsZW0KPiAKPiBBcyBmaXJzdCBMaW51eCBwcm9iZXMgbXkg
aGFyZHdhcmUgdXNpbmcgdGhlICJicmNtLG5hbmQtYmNtNjMxMzgiCj4gY29tcGF0aWJpbGl0eSBz
dHJpbmcgZHJpdmVyIGJjbTYzMTM4X25hbmQuYy4gVGhhdCdzIGdvb2QuCj4gCj4gSXQgdGhhdCBm
YWlscyBob3dldmVyICgucHJvYmUoKSByZXR1cm5zIGFuIGVycm9yKSB0aGVuIExpbnV4IGNvcmUg
c3RhcnRzCj4gcHJvYmluZyB1c2luZyBkcml2ZXJzIGZvciBsZXNzIHNwZWNpZmljIGJpbmRpbmdz
Lgo+IAo+IEluIG15IGNhc2UgcHJvYmluZyB3aXRoIHRoZSAiYnJjbSxicmNtbmFuZCIgc3RyaW5n
IGRyaXZlciBicmNtc3RiX25hbmQuYwo+IHJlc3VsdHMgaW4gaWdub3JpbmcgU29DIHNwZWNpZmlj
IGJpdHMgYW5kIGNhdXNlcyBhIGhhcmR3YXJlIGxvY2t1cC4gSHcKPiBpc24ndCBpbml0aWFsaXpl
ZCBwcm9wZXJseSBhbmQgd3JpdGVsX3JlbGF4ZWQoMHgwMDAwMDAwOSwgYmFzZSArIDB4MDQpCj4g
anVzdCBtYWtlIGl0IGhhbmcuCj4gCj4gVGhhdCBvYnZpb3VzbHkgaXNuJ3QgYW4gYWNjZXB0YWJs
ZSBiZWhhdmlvciBmb3IgbWUuIFNvIEknbSB3b25kZXJpbmcKPiB3aGF0J3MgZ29pbmcgb24gd3Jv
bmcgaGVyZS4KPiAKPiBTaG91bGQgTGludXggYXZvaWQgcHJvYmluZyB3aXRoIGxlc3Mtc3BlY2lm
aWMgY29tcGF0aWJsZSBzdHJpbmdzPwoKTm8uIEl0J3MgcXVpdGUgY29tbW9uIHRvIGhhdmUgYSBs
aXN0IG9mIGNvbXBhdGlibGVzLiBBbiB1c2UgY2FzZSBpcyB0aGF0CnlvdSBoYXZlIGEgbmV3IElQ
IHRoYXQgd29ya3Mgd2l0aCBhbiBleGlzdGluZyBjb21wYXRpYmxlLCBidXQgdGhpcyBJUAphbHNv
IGhhcyBuZXcgZmVhdHVyZXMgdGhhdCBhcmUgbm90IHN1cHBvcnRlZCBieSB0aGUgZXhpc3Rpbmcg
Y29tcGF0aWJsZQphbmQgYnkgdGhlIGhhcmR3YXJlIGZvciB3aGljaCB0aGUgZXhpc3RpbmcgY29t
cGF0aWJsZSB3YXMgY3JlYXRlZC4gU28KcGVvcGxlIGludHJvZHVjZSBhIG5ldyBjb21wYXRpYmxl
IGZvciB0aGUgZXhpc3RpbmcgSVAgaW4gb3JkZXIgdG8KZGlmZmVyZW50aWF0ZSBmcm9tIHRoZSBv
bGRlciB2ZXJzaW9ucy4gSWYgdGhlIG5ldyBjb21wYXRpYmxlIGlzIG5vdCB5ZXQKZGVmaW5lZCBp
biB0aGUgZHJpdmVyLCB0aGUgc2Vjb25kIGNvbXBhdGlibGUgZnJvbSB0aGUgbGlzdCBpcyB1c2Vk
IGFuZAp5b3UgZ2V0IHRoZSBJUCB3b3JraW5nIGJ1dCB3aXRoIGEgcmVkdWNlZCBmdW5jdGlvbiBz
ZXQuCgo+IE9yIHNob3VsZCBJIG5vdCBjbGFpbSBodyB0byBiZSAiYnJjbSxicmNtbmFuZCIgY29t
cGF0aWJsZSBpZiBpdCBSRVFVSVJFUwo+IFNvQy1zcGVjaWZpYyBoYW5kbGluZz8KCkNvcnJlY3Qu
CgpDaGVlcnMsCnRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
