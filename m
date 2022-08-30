Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19901ECAAA1
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Aug 2022 15:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=02MC1lY5do5bmLE1DOL7dr8kPEyyquc5uHFUmPbjpOo=; b=UvGueb92hglnJq
	+zKHpzIsvX0xi3zgLqI9z6Q+lnkFQHcEkH+ibAe4fxRO7Ex7R0vdhQ0Oqhu5bDEjVdduSLukhRgqH
	t+otKposFKMQCzcVsoi9KNFYqDa1qvnEPDu3nbXScIq1UdlWLBv6/7TgAsXmdeo+cKxoQlgO46WK4
	YYNt4yJTVqFe9H/d+SCxbi0i5LWJV/Mct35ERLW3C8Pmai4BDz2JkyzxePEeqYwDzqn/MXlkElmkY
	uEghMLKXaK+zYVE1Zh3qjnflnWygqQqVSeqZt2YOpkuOX5DPs3scFDxhXloJuAJFobWfSyxfsn/3F
	PHGuyuR9cQlLHnoAgtUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT35l-000GR5-Nh; Tue, 30 Aug 2022 15:23:53 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT35N-000GCA-SP
	for linux-mtd@lists.infradead.org; Tue, 30 Aug 2022 15:23:31 +0000
Received: by mail-wr1-x429.google.com with SMTP id b16so7069313wru.7
        for <linux-mtd@lists.infradead.org>; Tue, 30 Aug 2022 08:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=yLvDBHWvpDIDxAvVlBZQf8gRsiHpZNmu2F53o7FHjx8=;
        b=WcBAjT/Fmk/p8NMZFiek7pi28xrSdKWEIsJnw8E6BU/6zrdbZ899MCguFl5DFvowEZ
         bxDj7PH7fs0eZeVFDLQtvY0Mi/DTErk1C92bjg3XhuXUD1L4Djcl8f5I+IpbiKXKJsv9
         7Iy4eOX2cxC6yAG8nDmtCvjEDvlkUptjQ+kHKwtizODeXjFGn3rD2Vk2dvOBX/BBmUwK
         YebTbOvFE7qqAeIF6fi1TnoHAq8JZv3UczRDFOowWKxXOjyFZgZvFcj8xXuBF9we+Gt3
         gNwCJ4fNVYtOn55f8fhJqUO/yFyWHUdbDYOtCXtI8TgLmgIfTUk4bdv/ZPumztnH6obf
         Fctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=yLvDBHWvpDIDxAvVlBZQf8gRsiHpZNmu2F53o7FHjx8=;
        b=maJ1Axv9uGSVyZKUqpJtOjhynqGArZTJsXQb0XaZQnX0mYan0q+UXGn9aBmbuw8JOp
         KqUscNClNh99MFbeyMZqB5fym/ZBTNnDmuMtBuFU+g9lZvSkCDrQR1a7UEpplGL4vYwJ
         CSnwMRlQq+wClVqXO6H0cwvdWbWM/x4t7DftwvyssqVO1Blzy1GQdu7nWCfyCq71g1Zp
         /DmeYDSCpG5Puwb4MM4SA4qNM8AMYTuEgQ+QbEbM5ERQ9KEWXpjddmlrE/c1AYUgzU6e
         +M7CnFldsXKnekZJaKD7iUgEBugjn5CNOUOqW+qJghYWJvu4Zv1kU3qJHFYJMbDsM8AB
         r5BQ==
X-Gm-Message-State: ACgBeo1yyo8R9c9AzzaiY8dAmg3sOOgqgdJqbvx0ZdXo0VyLIEzSgoGt
	OgxG0QhtEf7MqZmiLUKsvxXygQ==
X-Google-Smtp-Source: AA6agR7eYGv+NukFzkM7WWtG7U1wN/FA5XCAoBqskFXNotnVjkirf60+8Ht+FIoJOGmBrOQfJoF9QQ==
X-Received: by 2002:a05:6000:144:b0:226:da62:6d90 with SMTP id r4-20020a056000014400b00226da626d90mr6202972wrx.609.1661873003800;
        Tue, 30 Aug 2022 08:23:23 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id l7-20020a05600c088700b003a5260b8392sm12698585wmp.23.2022.08.30.08.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 08:23:23 -0700 (PDT)
Message-ID: <f79b7992-2170-bc31-74ca-4767ba870791@linaro.org>
Date: Tue, 30 Aug 2022 16:23:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 06/14] nvmem: core: introduce NVMEM layouts
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20220825214423.903672-1-michael@walle.cc>
 <20220825214423.903672-7-michael@walle.cc>
 <e2d91011-583e-a88d-94f9-beb194416326@linaro.org>
 <ae27e9d300a9c9eca4e9ec0c702b5e0a@walle.cc>
 <815f8e22-3a23-ebdb-7476-14682d0b3287@linaro.org>
 <c2e3a05339d54123de539fd124e874bb@walle.cc>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <c2e3a05339d54123de539fd124e874bb@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_082329_945723_A0F4B689 
X-CRM114-Status: GOOD (  27.54  )
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

CgpPbiAzMC8wOC8yMDIyIDE2OjAyLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjItMDgt
MzAgMTY6NDMsIHNjaHJpZWIgU3Jpbml2YXMgS2FuZGFnYXRsYToKPiAKPj4+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbnZtZW0vbGF5b3V0cy9NYWtlZmlsZSAKPj4+Pj4gYi9kcml2ZXJzL252bWVt
L2xheW91dHMvTWFrZWZpbGUKPj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+Pj4gaW5kZXgg
MDAwMDAwMDAwMDAwLi42ZmRiM2M2MGE0ZmEKPj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+PiArKysg
Yi9kcml2ZXJzL252bWVtL2xheW91dHMvTWFrZWZpbGUKPj4+Pj4gQEAgLTAsMCArMSw0IEBACj4+
Pj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4+Pj4+ICsjCj4+Pj4+ICsj
IE1ha2VmaWxlIGZvciBudm1lbSBsYXlvdXRzLgo+Pj4+PiArIwo+Pj4+PiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oIAo+Pj4+PiBiL2luY2x1ZGUvbGludXgvbnZt
ZW0tcHJvdmlkZXIuaAo+Pj4+PiBpbmRleCBlNzEwNDA0OTU5ZTcuLjMyMzY4NTg0MWU5ZiAxMDA2
NDQKPj4+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oCj4+Pj4+ICsrKyBi
L2luY2x1ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIuaAo+Pj4+PiBAQCAtMTI3LDYgKzEyNywyOCBA
QCBzdHJ1Y3QgbnZtZW1fY2VsbF90YWJsZSB7Cj4+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IGxpc3Rf
aGVhZMKgwqDCoCBub2RlOwo+Pj4+PiDCoCB9Owo+Pj4+PiDCoCArLyoqCj4+Pj4+ICsgKiBzdHJ1
Y3QgbnZtZW1fbGF5b3V0IC0gTlZNRU0gbGF5b3V0IGRlZmluaXRpb25zCj4+Pj4+ICsgKgo+Pj4+
PiArICogQG5hbWU6wqDCoMKgwqDCoMKgwqAgTGF5b3V0IG5hbWUuCj4+Pj4+ICsgKiBAb2ZfbWF0
Y2hfdGFibGU6wqDCoMKgIE9wZW4gZmlybXdhcmUgbWF0Y2ggdGFibGUuCj4+Pj4+ICsgKiBAYWRk
X2NlbGxzOsKgwqDCoMKgwqDCoMKgIFdpbGwgYmUgY2FsbGVkIGlmIGEgbnZtZW0gZGV2aWNlIGlz
IGZvdW5kIHdoaWNoCj4+Pj4+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaGFzIHRoaXMgbGF5
b3V0LiBUaGUgZnVuY3Rpb24gd2lsbCBhZGQgbGF5b3V0Cj4+Pj4+ICsgKsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc3BlY2lmaWMgY2VsbHMgd2l0aCBudm1lbV9hZGRfb25lX2NlbGwoKS4KPj4+Pj4g
KyAqIEBub2RlOsKgwqDCoMKgwqDCoMKgIExpc3Qgbm9kZS4KPj4+Pj4gKyAqCj4+Pj4+ICsgKiBB
IG52bWVtIGRldmljZSBjYW4gaG9sZCBhIHdlbGwgZGVmaW5lZCBzdHJ1Y3R1cmUgd2hpY2ggY2Fu
IGp1c3QgYmUKPj4+Pj4gKyAqIGV2YWx1YXRlZCBkdXJpbmcgcnVudGltZS4gRm9yIGV4YW1wbGUg
YSBUTFYgbGlzdCwgb3IgYSBsaXN0IG9mIAo+Pj4+PiAibmFtZT12YWwiCj4+Pj4+ICsgKiBwYWly
cy4gQSBudm1lbSBsYXlvdXQgY2FuIHBhcnNlIHRoZSBudm1lbSBkZXZpY2UgYW5kIGFkZCAKPj4+
Pj4gYXBwcm9wcmlhdGUKPj4+Pj4gKyAqIGNlbGxzLgo+Pj4+PiArICovCj4+Pj4+ICtzdHJ1Y3Qg
bnZtZW1fbGF5b3V0IHsKPj4+Pj4gK8KgwqDCoCBjb25zdCBjaGFyICpuYW1lOwo+Pj4+PiArwqDC
oMKgIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm9mX21hdGNoX3RhYmxlOwo+Pj4+Cj4+Pj4g
bG9va2luZyBhdCB0aGlzLCBJIHRoaW5rIGl0cyBkb2FibGUgdG8gY29udmVydCB0aGUgZXhpc3Rp
bmcKPj4+PiBjZWxsX3Bvc3RfcHJvY2VzcyBjYWxsYmFjayB0byBsYXlvdXRzIGJ5IGFkZGluZyBh
IGxheW91dCBzcGVjaWZpYwo+Pj4+IGNhbGxiYWNrIGhlcmUuCj4+Pgo+Pj4gY2FuIHlvdSBlbGFi
b3JhdGUgb24gdGhhdD8KPj4KPj4gSWYgd2UgcmVsYXggYWRkX2NlbGxzICsgYWRkIG52bWVtX3Vu
cmVnaXN0ZXJfbGF5b3V0KCkgYW5kIHVwZGF0ZQo+PiBzdHJ1Y3QgbnZtZW1fbGF5b3V0IHRvIGlu
Y2x1ZGUgcG9zdF9wcm9jZXNzIGNhbGxiYWNrIGxpa2UKPj4KPj4gc3RydWN0IG52bWVtX2xheW91
dCB7Cj4+IMKgwqDCoMKgY29uc3QgY2hhciAqbmFtZTsKPj4gwqDCoMKgwqBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkICpvZl9tYXRjaF90YWJsZTsKPj4gwqDCoMKgwqBpbnQgKCphZGRfY2VsbHMp
KHN0cnVjdCBudm1lbV9kZXZpY2UgKm52bWVtLCBzdHJ1Y3QgbnZtZW1fbGF5b3V0IAo+PiAqbGF5
b3V0KTsKPj4gwqDCoMKgwqBzdHJ1Y3QgbGlzdF9oZWFkIG5vZGU7Cj4+IMKgwqDCoMKgLyogZGVm
YXVsdCBjYWxsYmFjayBmb3IgZXZlcnkgY2VsbCAqLwo+PiDCoMKgwqDCoG52bWVtX2NlbGxfcG9z
dF9wcm9jZXNzX3QgcG9zdF9wcm9jZXNzOwo+PiB9Owo+Pgo+PiB0aGVuIHdlIGNhbiBtb3ZlIGlt
eC1vY290cCB0byB0aGlzIGxheW91dCBzdHlsZSB3aXRob3V0IGFkZF9jZWxsCj4+IGNhbGxiYWNr
LCBhbmQgZmluYWxseSBnZXQgcmlkIG9mIGNlbGxfcHJvY2Vzc19jYWxsYmFjayBmcm9tIGJvdGgK
Pj4gbnZtZW1fY29uZmlnIGFuZCBudm1lbV9kZXZpY2UuCj4+Cj4+IElmIGxheW91dCBzcGVjaWZp
YyBwb3N0X3Byb2Nlc3MgY2FsbGJhY2sgaXMgYXZhaWxhYmxlIGFuZCBjZWxsIGRvZXMKPj4gbm90
IGhhdmUgYSBjYWxsYmFjayBzZXQgdGhlbiB3ZSBjYW4gY2FuIGJlIGVpdGhlciB1cGRhdGVkIGNl
bGwKPj4gcG9zdF9wcm9jZXNzIGNhbGxiYWNrIHdpdGggdGhpcyBvbmUgb3IgaW52b2tlIGxheW91
dCBzcGVjaWZpYyBjYWxsYmFjawo+PiBkaXJlY3RseS4KPj4KPj4gZG9lcyB0aGF0IG1ha2Ugc2Vu
c2U/Cj4gCj4gWWVzIEkgZ2V0IHdoYXQgeW91IG1lYW4uIEJVVCBJJ20gbm90IHNvIHN1cmU7IGl0
IG1peGVzIGRpZmZlcmVudAo+IHRoaW5ncyB0b2dldGhlci4gTGF5b3V0cyB3aWxsIGFkZCBjZWxs
cywgYW5hbG9ndWUgdG8KPiBudm1lbV9hZGRfY2VsbHNfZnJvbV9vZigpIG9yIG52bWVtX2FkZF9j
ZWxsc19mcm9tX3RhYmxlKCkuIFdpdGgKPiB0aGUgaG9vayBhYm92ZSwgdGhlIGxheW91dCBtZWNo
YW5pc20gaXMgYWJ1c2VkIHRvIGFkZCBwb3N0Cj4gcHJvY2Vzc2luZyB0byBjZWxscyBhZGRlZCBi
eSBvdGhlciBtZWFucy4KCldlIGFyZSBzdGlsbCBkZWZpbmluZyB3aGF0IGxheW91dCBleGFjdGx5
IG1lYW4gdy5yLnQgdG8gbnZtZW0gOi0pCgo+IAoKVGhlcmUgYXJlIHR3byBhc3BlY3RzIHRvIHRo
aXMgYXMgbnZtZW0gY29yZSBpcyBjb25jZXJuZWQKCjE+IHBhcnNlIGFuZCBhZGQgY2VsbHMgYmFz
ZWQgb24gc29tZSBwcm92aWRlciBzcGVjaWZpYyBhbGdvL3N0dWN0dXJlLgoyPiBwb3N0IHByb2Nl
c3MgY2VsbCBkYXRhIGJlZm9yZSB1c2VyIGNhbiBzZWUgaXQuCgpJbiBzb21lIGNhc2VzIHdlIG5l
ZWQgMSBhbmQgMiB3aGlsZSBpbiBvdGhlciBjYXNlcyB3ZSBqdXN0IG5lZWQgMSBvciAyLgoKSGF2
aW5nIGFuIHVuaWZpZWQgaW50ZXJmYWNlIHdvdWxkIGhlbHAgd2l0aCBtYWludGVuYW5jZSBhbmQg
cmVtb3ZpbmcgCmR1cGxpY2F0aW9uLgoKPiBXaGF0IGlzIHRoZW4gdGhlIGRpZmZlcmVuY2UgdG8g
dGhlIGRyaXZlciBoYXZpbmcgdGhhdCAiZ2xvYmFsIgo+IHBvc3QgcHJvY2VzcyBob29rPwoKdy5y
LnQgcG9zdCBwcm9jZXNzaW5nIHRoZXJlIHNob3VsZCBiZSBubyBkaWZmZXJlbmNlLgoKY2VsbCBj
YW4gaGF2ZSBubyBwb3N0LXByb2Nlc3Npbmcgb3IgYSBkZWZhdWx0IHBvc3QgcHJvY2Vzc2luZyBv
ciBhIApzcGVjaWZpYyBvbmUgZGVwZW5kaW5nIG9uIGl0cyBjb25maWd1cmF0aW9uLgoKPiAKPiBU
aGUgY29ycmVjdCBwbGFjZSB0byBhZGQgdGhlIHBlci1jZWxsIGhvb2sgaW4gdGhpcyBjYXNlIHdv
dWxkIGJlCj4gbnZtZW1fYWRkX2NlbGxzX2Zyb21fb2YoKS4KCnllcywgdGhhdCBpcyB0aGUgcGxh
Y2Ugd2hlcmUgaXQgc2hvdWxkIGdvLiB3ZSBoYXZlIHRvIHdvcmsgb24gdGhlIApkZXRhaWxzIGJ1
dCBpZiBwcm92aWRlciBpcyBhc3NvY2lhdGVkIHdpdGggYSBsYXlvdXQgdGhlbiB0aGlzIHNob3Vs
ZCBiZSAKZG9hYmxlLgoKCi0tc3JpbmkKPiAKPiAtbWljaGFlbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
