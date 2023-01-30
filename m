Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C91C636CD
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jan 2023 20:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7u9FFtfhC7QXE62lh0LwVZqTzL0ANgaOjoK1OmPP7YU=; b=cg94M/9leeBRZs
	Uj/LgjLv1Y6q6aiDlqXpsU5DFguB1Z9e9AheN9OVMrYTl8OrK4T7H6M5qYAxLlRFymgElOWU4k+JA
	EeL9ka3fqhcry8AKH2NubJvji5SE1lF1JouMnFBW7uCha9oZe095x3aiuW5gUR7djd1FMfacY0vl0
	WYtcX5rBeENBUaVzic1jeVnvZiwVCVsgXEtv4dFROSfK/I9r60+EMr/rg9vi9mqknODtQBvNA8+ke
	O8upmhLIeEENY+0Gn1jvqSy5F/kxY6+SpAWNifBBNZ4lQy0UlKqj5Z7R0iHwpms1oxtu938FqvdBl
	/wxnAEfVPwurxyNJF4Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMapl-005MmC-6h; Mon, 30 Jan 2023 20:32:57 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMapi-005Ml9-6v; Mon, 30 Jan 2023 20:32:55 +0000
Received: by mail-oi1-f176.google.com with SMTP id s17so184547ois.10;
        Mon, 30 Jan 2023 12:32:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/xWU7JtGiv4WHE9A77mE3J9vVWaUjGZ8XBIVuKFbI5w=;
        b=162mMmPE9OVQkTHXgZjuPZm7wlUGFC6rlX1x92fFrysYIlUiG0avLx1LjCTfXIqvRT
         f9OcZIfbhUVGSE7aQAdUxKhtiJ9MQkcr+49jaWV4ml1949yygbUssYL0IDuoPxaYVDrI
         7fPnXR/W6cRfDpjw4GDXx7dJJjI/QfFMeEWAn5jFaIveFQjMroT9wPcYe733JrtIVIlp
         15kV8HHiP/qFeF2p3JxXmjLn5RSB89kX3JccbPrYuxRfpycmOoND/4I0nJxhnOplDcEF
         rMZIpbjYLnsFzVpJO6kf5du3HL8MMHlRlac6yzGWuHbfFg78bBYQKibSWp9TNs8m8cm0
         3mtA==
X-Gm-Message-State: AO0yUKV9yOr4ZE9CH/j+dL5MGZSdqqTdRLX5bjeFWFZEDBXHBACiFPiZ
	diFmEKzbH3Apm9fd4m9lDiPKSESm9Q==
X-Google-Smtp-Source: AK7set9wcFon0K9frrLTB1cxJZ7QUNhn+Tl1E92rzVwuxACeAqsgaTS9NMglX4o7jholnRev0ahHIQ==
X-Received: by 2002:a05:6808:f05:b0:378:193f:5d84 with SMTP id m5-20020a0568080f0500b00378193f5d84mr4888765oiw.10.1675110772301;
        Mon, 30 Jan 2023 12:32:52 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ck14-20020a056830648e00b0068664355604sm5911327otb.22.2023.01.30.12.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 12:32:51 -0800 (PST)
Received: (nullmailer pid 3308138 invoked by uid 1000);
	Mon, 30 Jan 2023 20:32:51 -0000
Date: Mon, 30 Jan 2023 14:32:51 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: io: new binding for IO
 accessible NVMEM devices
Message-ID: <20230130203251.GA3290808-robh@kernel.org>
References: <20230127175831.26753-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230127175831.26753-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_123254_268747_51A38BAA 
X-CRM114-Status: GOOD (  19.35  )
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

T24gRnJpLCBKYW4gMjcsIDIwMjMgYXQgMDY6NTg6MzBQTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBX
aXRoIHRoZSBOVk1FTSBsYXlvdXRzIGJpbmRpbmcgaW4gcGxhY2Ugd2Ugc2hvdWxkIG5vdyB1c2U6
Cj4gMS4gTlZNRU0gZGV2aWNlIGFjY2VzcyBiaW5kaW5ncwo+IDIuIE5WTUVNIGNvbnRlbnQgZGVz
Y3JpcHRpb24gYmluZGluZ3MKPiAKPiBUaGlzIGJpbmRpbmcgYWxsb3dzIGRlc2NyaWJpbmcgTlZN
RU0gZGV2aWNlcyB0aGF0IGNhbiBiZSBhY2Nlc3NlZCB1c2luZwo+IElPIG1hcHBpbmdzLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAtLS0K
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vaW8ueWFtbCAgICAgICAgIHwgMzcgKysr
KysrKysrKysrKysrKysrKwoKV2hhdCBkbyB3ZSBjYWxsIG52bWVtIHVzaW5nIElTQS9QQ0kgSU8g
c3BhY2U/IFRoYXQgd2FzIG15IGZpcnN0IHRob3VnaHQgCnNlZWluZyAiSU8iLiBQcm9iYWJseSB1
bmxpa2VseSwgYnV0IHN0aWxsLiAiTU1JTyIgaW5zdGVhZD8KCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
NyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbnZtZW0vaW8ueWFtbAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vaW8ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9udm1lbS9pby55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwMDAuLjY3ZTBhYWU5Y2Q5NAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vaW8ueWFtbAo+IEBAIC0wLDAg
KzEsMzcgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBC
U0QtMi1DbGF1c2UpCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9udm1lbS9pby55YW1sIwo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiArCj4gK3RpdGxlOiBJTyBhY2Nlc3MgYmFz
ZWQgTlZNRU0KPiArCj4gK2Rlc2NyaXB0aW9uOiB8Cj4gKyAgVGhpcyBiaW5kaW5nIGRlc2NyaWJl
cyBzaW1wbGUgTlZNRU0gZGV2aWNlcyB0aGF0IGNhbiBiZSBhY2Nlc3NlZCBieSBzaW1wbHkKPiAr
ICBtYXBwaW5nIGEgcHJlZGVmaW5lZCBJTyBhZGRyZXNzLgo+ICsKPiArICBJdCdzIGEgZ2VuZXJp
YyBzb2x1dGlvbiBmb3IgcHJvdmlkaW5nIE5WTUVNIGNvbnRlbnQgYWNjZXNzLiBUaGUgd2F5IG9m
Cj4gKyAgaGFuZGxpbmcgYWN0dWFsIGNvbnRlbnQgbWF5IGJlIGRldmljZSBzcGVjaWZpYyBhbmQg
Y2FuIGJlIGRlc2NyaWJlZCB1c2luZyBhCj4gKyAgcHJvcGVyIGxheW91dC4KCkFzIHRoZSBhY2Nl
c3NlcyBhcmUgbWVtb3J5LW1hcHBlZCwgdGhlIGNoaWxkIG5vZGVzIHNob3VsZCBhbHNvIGhhdmUg
Cm1lbW9yeS1tYXBwZWQgYWRkcmVzc2VzLiBJT1csIHlvdSBuZWVkICdyYW5nZXMnLCAnI2FkZHJl
c3MtY2VsbHMnLCAKJyNzaXplLWNlbGxzJy4KCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIFJh
ZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiArCj4gK2FsbE9mOgo+ICsgIC0gJHJl
ZjogbnZtZW0ueWFtbCMKPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29tcGF0aWJsZToKPiArICAg
IGNvbnN0OiBpby1udm1lbQo+ICsKPiArICByZWc6Cj4gKyAgICBtYXhJdGVtczogMQoKVGhlIGZp
cnN0IGFkZGl0aW9uIGhlcmUgd2lsbCBiZSBhY2Nlc3Mgc2l6ZSByZXN0cmljdGlvbnMuIFBlcmhh
cHMgYWRkIAp0aGF0IG5vdyAocmVnLWlvLXdpZHRoKS4KCj4gKwo+ICt1bmV2YWx1YXRlZFByb3Bl
cnRpZXM6IGZhbHNlCj4gKwo+ICtleGFtcGxlczoKPiArICAtIHwKPiArICAgIG52bWVtQDEwMDAw
IHsKPiArICAgICAgICBjb21wYXRpYmxlID0gImlvLW52bWVtIjsKPiArICAgICAgICByZWcgPSA8
MHgxMDAwMDAwMCAweDEwMDAwPjsKPiArICAgIH07Cj4gLS0gCj4gMi4zNC4xCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
