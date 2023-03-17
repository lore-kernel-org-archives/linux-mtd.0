Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E5FC76196
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 21:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4JytDqHmYd9dDOPzJBiLJ98jskjCVrqDZuoL2hr5IE=; b=y812S5qGdXNh6MQjU4jFv/AY9E
	kOLtl0D+1mLBxxB32sIqzcOv822xDABwXo8aRRqFs4kjN79aHyW6HtVwU8+cQpXIvHI0fUqiQ5zgo
	+6Gj+mUoUPDcIddDBtzsZdfE6heGJTbY7VjIQ+83vgDK9mrRwX7VzMY6GxQWP38ZDIDxtckhQvVr/
	3Mt2q1Lz1RnPljZh0rpS1EukmJfhSITKIdkNWbBjgbJtWLEQW1qHactNE5AIbPB40UhlEClo+xApx
	GVSJ9GYY1ciT9l1r1Xn/9eNP1dm/NTzoDJX2kwQHZ2fL2EvEb4VaBOYSBaLPhXr9EzS3BU0O/vOQd
	dXMsF+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdI1r-003WXM-1O;
	Fri, 17 Mar 2023 21:54:27 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdI1o-003WVw-1L
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 21:54:25 +0000
Received: by mail-pg1-x52b.google.com with SMTP id q189so3704890pga.9
        for <linux-mtd@lists.infradead.org>; Fri, 17 Mar 2023 14:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679090057;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QgWoxlECZXdVrynxfG/iUFVQwxWjeSo565mClnIZWnc=;
        b=YaTxmeYgjyyGDmiFAS7L+PljTKNdLcc5nol9+/wEE4H/wa86Znz2DX0ZJfrJwf3NQn
         mi3C91RvdtoBgNdOgNPzvLFxbkHQkvXTlyahrA98EeV9jXJbi9Sf/XEa9/M9qyswTCDW
         D99bJK6fLSCVJlxECISp5CFXVVNG2U3nnd/arcWTtrF02mJTSLao1RZSGb5ddQAsDtD0
         V/Kg+cT9lPI18ueEdAm4jK/b8QlthdZ8NjbUa5tvX9L4AXpUzN7XDHJnLEp7WPDEa0Vo
         rMhgXgfShXbVMEgHkEdJHLTq9hSBwCIDpZz3rogKfyxXw7dAmr6u14NdJ5LyUmR3w+3T
         PuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679090057;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QgWoxlECZXdVrynxfG/iUFVQwxWjeSo565mClnIZWnc=;
        b=wOTlQC87+jqQ3rJfO+NpGDNacyW9SHOAxz+v++zJoO/jFJKdnb7OS63dB7dMqxPnzr
         vUphirtgjwl1j88S7DZwLsrWw3r0PDZnv8jEWhOhNEqrS91pWZtz/UeDCZO9vKiCh8G2
         EvDagLr+IvMnLirmE+OlWW7V1Qe3eu3jaFjVhC90norUMzCg9hO0TGNJe1jpVh5CUb3V
         ZxWFBWMtcXhJ6jK6kf97uSbTe8fjdXNcupn5Dk3eLqc2yKU2g5/M3I4ZHxTJhgZUygWs
         oHEM/3VBBSeOTJcAcvXD9IWlq8XYXPrEd1xQ0H+kh7OZZVsVIQ/9KQ/Rkrva6fAZbd7Y
         5EyA==
X-Gm-Message-State: AO0yUKVC28ncP3DgC6IFK1qIgvWDTe9uxcDebz97PoUsMN09VLPP5O5c
	3G3RQ7E09B9T23MPMuO5Dlc=
X-Google-Smtp-Source: AK7set++51QrZc9ogfyZzZlsl7EgVQqsEkLr7zb0xLfkGDusnfnLbtVRqFamGeYkvD60E3j8n/6MAg==
X-Received: by 2002:a62:520f:0:b0:5cd:d766:8a2b with SMTP id g15-20020a62520f000000b005cdd7668a2bmr6584338pfb.6.1679090057160;
        Fri, 17 Mar 2023 14:54:17 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id 22-20020aa79256000000b00582f222f088sm1998885pfp.47.2023.03.17.14.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 14:54:16 -0700 (PDT)
Message-ID: <0bbaa346-edbf-a1b9-3c95-5a1aacaf0c44@gmail.com>
Date: Fri, 17 Mar 2023 14:54:10 -0700
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
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "William (Zhenghao) Zhang" <william.zhang@broadcom.com>
References: <399d2f43-5cad-6c51-fe3a-623950e2151a@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <399d2f43-5cad-6c51-fe3a-623950e2151a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_145424_474705_6941E991 
X-CRM114-Status: GOOD (  22.52  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

K1dpbGxpYW0sCgpPbiAzLzE3LzIzIDAzOjAyLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4gSGks
IEkganVzdCBzcGVudCBmZXcgaG91cnMgZGVidWdnaW5nIGhpZGRlbiBodyBsb2NrdXAgYW5kIEkg
bmVlZCB0bwo+IGNvbnN1bHQgZHJpdmVyIGNvcmUgY29kZSBiZWhhdmlvdXIuCj4gCj4gSSBoYXZl
IGEgQkNNNDkwOCBTb0MgYmFzZWQgYm9hcmQgd2l0aCBhIE5BTkQgY29udHJvbGxlciBvbiBpdC4K
PiAKPiAKPiAjIyMgSGFyZHdhcmUgYmluZGluZwo+IAo+IEhhcmR3YXJlIGRldGFpbHM6Cj4gYXJj
aC9hcm02NC9ib290L2R0cy9icm9hZGNvbS9iY21iY2EvYmNtNDkwOC5kdHNpCj4gCj4gUmVsZXZh
bnQgcGFydDoKPiBuYW5kLWNvbnRyb2xsZXJAMTgwMCB7Cj4gIMKgwqDCoMKgY29tcGF0aWJsZSA9
ICJicmNtLG5hbmQtYmNtNjMxMzgiLCAiYnJjbSxicmNtbmFuZC12Ny4xIiwgCj4gImJyY20sYnJj
bW5hbmQiOwo+ICDCoMKgwqDCoHJlZyA9IDwweDE4MDAgMHg2MDA+LCA8MHgyMDAwIDB4MTA+Owo+
ICDCoMKgwqDCoHJlZy1uYW1lcyA9ICJuYW5kIiwgIm5hbmQtaW50LWJhc2UiOwo+IH06Cj4gCj4g
QWJvdmUgYmluZGluZyBpcyBiYXNlZCBvbiB0aGUgZG9jdW1lbnRhdGlvbjoKPiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQueWFtbAo+IAo+IAo+ICMj
IyBMaW51eCBkcml2ZXJzCj4gCj4gTGludXggaGFzIHNlcGFyYXRlZCBkcml2ZXJzIGZvciBmZXcg
QnJvYWRjb20ncyBOQU5EIGNvbnRyb2xsZXIgYmluZGluZ3M6Cj4gCj4gMS4gZHJpdmVycy9tdGQv
bmFuZC9yYXcvYnJjbW5hbmQvYmNtNjMxMzhfbmFuZC5jIGZvcjoKPiBicmNtLG5hbmQtYmNtNjMx
MzgKPiAKPiAyLiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGZvcjoK
PiBicmNtLGJyY21uYW5kLXYyLjEKPiBicmNtLGJyY21uYW5kLXYyLjIKPiBicmNtLGJyY21uYW5k
LXY0LjAKPiBicmNtLGJyY21uYW5kLXY1LjAKPiBicmNtLGJyY21uYW5kLXY2LjAKPiBicmNtLGJy
Y21uYW5kLXY2LjEKPiBicmNtLGJyY21uYW5kLXY2LjIKPiBicmNtLGJyY21uYW5kLXY3LjAKPiBi
cmNtLGJyY21uYW5kLXY3LjEKPiBicmNtLGJyY21uYW5kLXY3LjIKPiBicmNtLGJyY21uYW5kLXY3
LjMKPiAKPiAzLiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtc3RiX25hbmQuYyBm
b3I6Cj4gYnJjbSxicmNtbmFuZAo+IAo+IAo+ICMjIyBQcm9ibGVtCj4gCj4gQXMgZmlyc3QgTGlu
dXggcHJvYmVzIG15IGhhcmR3YXJlIHVzaW5nIHRoZSAiYnJjbSxuYW5kLWJjbTYzMTM4Igo+IGNv
bXBhdGliaWxpdHkgc3RyaW5nIGRyaXZlciBiY202MzEzOF9uYW5kLmMuIFRoYXQncyBnb29kLgo+
IAo+IEl0IHRoYXQgZmFpbHMgaG93ZXZlciAoLnByb2JlKCkgcmV0dXJucyBhbiBlcnJvcikgdGhl
biBMaW51eCBjb3JlIHN0YXJ0cwo+IHByb2JpbmcgdXNpbmcgZHJpdmVycyBmb3IgbGVzcyBzcGVj
aWZpYyBiaW5kaW5ncy4KCldoeSBkb2VzIGl0IGZhaWw/Cgo+IAo+IEluIG15IGNhc2UgcHJvYmlu
ZyB3aXRoIHRoZSAiYnJjbSxicmNtbmFuZCIgc3RyaW5nIGRyaXZlciBicmNtc3RiX25hbmQuYwo+
IHJlc3VsdHMgaW4gaWdub3JpbmcgU29DIHNwZWNpZmljIGJpdHMgYW5kIGNhdXNlcyBhIGhhcmR3
YXJlIGxvY2t1cC4gSHcKPiBpc24ndCBpbml0aWFsaXplZCBwcm9wZXJseSBhbmQgd3JpdGVsX3Jl
bGF4ZWQoMHgwMDAwMDAwOSwgYmFzZSArIDB4MDQpCj4ganVzdCBtYWtlIGl0IGhhbmcuCgpXZWxs
LCB0aGUgbWlzc2luZyBwaWVjZSBoZXJlIGlzIHRoYXQgYnJjbW5hbmQuYyBpcyBhIGxpYnJhcnkg
ZHJpdmVyLCAKdGhlcmVmb3JlIGl0IG5lZWRzIGFuIGVudHJ5IHBvaW50LCB0aGUgbmV4dCBvbmUg
dGhhdCBtYXRjaGVzIGlzIApicmNtc3RiX25hbmQuYy4KCj4gCj4gVGhhdCBvYnZpb3VzbHkgaXNu
J3QgYW4gYWNjZXB0YWJsZSBiZWhhdmlvciBmb3IgbWUuIFNvIEknbSB3b25kZXJpbmcKPiB3aGF0
J3MgZ29pbmcgb24gd3JvbmcgaGVyZS4KPiAKPiBTaG91bGQgTGludXggYXZvaWQgcHJvYmluZyB3
aXRoIGxlc3Mtc3BlY2lmaWMgY29tcGF0aWJsZSBzdHJpbmdzPwo+IE9yIHNob3VsZCBJIG5vdCBj
bGFpbSBodyB0byBiZSAiYnJjbSxicmNtbmFuZCIgY29tcGF0aWJsZSBpZiBpdCBSRVFVSVJFUwo+
IFNvQy1zcGVjaWZpYyBoYW5kbGluZz8KPiAKPiBBbiBleHRyYSBub3RlOiB0aGF0IGZhbGxiYWNr
IHByb2JpbmcgaGFwcGVucyBldmVuIHdpdGggLnByb2JlKCkKPiByZXR1cm5pbmcgLUVQUk9CRV9E
RUZFUi4gVGhpcyBhY3R1YWxseSBzbWVsbHMgZmlzaHkgZm9yIG1lIG9uIHRoZSBMaW51eAo+IGNv
cmUgcGFydC4KPiBJJ20gbm90IGFuIGV4cGVjdCBidXQgSSB0aGluayBjb3JlIHNob3VsZCB3YWl0
IGZvciBhY3R1YWwgZXJyb3Igd2l0aG91dAo+IHRyeWluZyBsZXNzLXNwZWNpZmljIGNvbXBhdGli
bGUgc3RyaW5ncyAmIGRyaXZlcnMuCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCgotLSAKRmxvcmlhbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
