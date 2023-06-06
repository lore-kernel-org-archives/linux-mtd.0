Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3921FC77B73
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 11:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+deQkQRvU/s7cWzzA91qxjjd1c3xWcEf8ykl+JzGPY=; b=Rh2xdhM464FlxR
	mzhNaJV83x9Pero7Zfte9qf1LOvrL7U0q0EBes+2r1/X3yoj0cIyQH0RBvvfeRMUv33o6SVzyqjS7
	FyQe1gBq+xc78Zf6hD+ZqC9aWxlH8Qa+QwxzXiIFboKg5tFmRJCy0wCNWxX76yHKa/blNDa2gKhwk
	1j8JKXZhmBvroqlVwVql9A2p2pcj9WkdRZeHZTUaUZ8xMhYm7eInN2yIFl+EYBzCwyXy/uuB5ruz+
	KaXKkx89WNKiKE1SY6ZP9dRZ5Ge5lc5CUDTpxwAmVDX5Iscm6XACb7mFdSXZw3qcLzWyaIwabfBtH
	uD8yJt+uY/Fb+2Fne+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Uaw-001P6Q-2L;
	Tue, 06 Jun 2023 11:11:22 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Uat-001P5O-2G
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 11:11:21 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5147e40bbbbso8417749a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2023 04:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686049878; x=1688641878;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yBaQ+qyAEE6Nu7Wl9Fi5tgo0nl2AZwD0vEKIf0f40Co=;
        b=BTrAyNVBqudRxlCRnUGFL10v6+hDZeXyOFVfypBnKh/U7wxqZz2KW18q8NX3kuowZg
         2FhrtkKLSGYUVUe7FarDsOVYJdTMUMxA8GTVzdj/bDnWOh2cXSRCXpySAs/DXZe/docv
         4QruKvICAvStPeDcoYZq4ndlLpRcKa7+zcx9LwweazGQbNoPB00TQpXcTN+ixRT7pYUQ
         qXy2blyO0PBnTVTdnQYeKLaBSgYXNElyV5hmV/vzGyMFsePMygGJxQCEjZzUaFQ188A5
         aZCo6SnBvp6mCffjtLFQbIZJrncYTNNhlJi+/g+W/oPRY10WEOkWEQh85xsbujuUsghW
         tfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686049878; x=1688641878;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yBaQ+qyAEE6Nu7Wl9Fi5tgo0nl2AZwD0vEKIf0f40Co=;
        b=BPvPzOKx3EFYrxFsHiddi3YGp56NOV9ywAmL1jRmlyAmZAWK+k/cUJ+mWUT46tYtNL
         Bg27MNU/R4YgkdPCR11ZQBULY6R7mN7K1SvZSJXaL1bkq264JKuxSnNgCAv2FDwCKC9X
         7Ttq8zsPs5UO8OtHaWW85LKCeCL4UoIylT9Vk4cNqJ+Vs48bXfcVKeC2Zt56jnWIfXcH
         iJtr0EBFtjVSeT/OeAMQoFUOaFdw8uS5cwCCak1zskBaXWc1ZI8Ep9rY0lZequH1cbxH
         Ji6Q0yciySVQHFVMmF0jVriLEJYTSyaA7k1zb6GEaVUbERe+QAEt7gOCruRSX/0+Oq0M
         5W/g==
X-Gm-Message-State: AC+VfDz1wu1gA0s67P89qReKSHziQShrvpkLkfPnRveC4147ZZh25H4r
	kI3uuVJfQtcmqhxTPyVRtp5Xjg==
X-Google-Smtp-Source: ACHHUZ6T7Csa68AUJ5pIXXsEx0PENLKuIfHBfgR7nvZRToDiTbYG9zcF6pepDd9sJKfQ2iB3CHd6kA==
X-Received: by 2002:a05:6402:7d4:b0:50d:9b59:4327 with SMTP id u20-20020a05640207d400b0050d9b594327mr1502370edy.29.1686049878372;
        Tue, 06 Jun 2023 04:11:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id g16-20020a056402181000b005149cb5ee2dsm4892574edy.82.2023.06.06.04.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 04:11:17 -0700 (PDT)
Message-ID: <037f5455-35c1-e13d-814c-16317a2a15f3@linaro.org>
Date: Tue, 6 Jun 2023 13:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v8 3/3] dt-bindings: mtd: marvell-nand: Convert to YAML DT
 scheme
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@lunn.ch"
 <andrew@lunn.ch>, "gregory.clement@bootlin.com"
 <gregory.clement@bootlin.com>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
 "conor@kernel.org" <conor@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "enachman@marvell.com" <enachman@marvell.com>,
 Vadym Kochan <vadym.kochan@plvision.eu>
References: <20230531234923.2307013-1-chris.packham@alliedtelesis.co.nz>
 <20230531234923.2307013-4-chris.packham@alliedtelesis.co.nz>
 <a23dd485-a3d9-e31f-be3e-0ab293fcfc4a@linaro.org>
 <785368df-1881-e62e-6172-d902cee814a8@alliedtelesis.co.nz>
 <eaf9d7cf-c9f5-a5d5-67af-c43761c3c6cf@linaro.org>
 <4ea0b16e-0cec-00db-c598-e0364a7edef8@alliedtelesis.co.nz>
 <9fc57052-5049-ed50-ca95-cfd1d0420dd9@alliedtelesis.co.nz>
 <20230606094855.1ab005eb@xps-13>
 <845924ba-d9bf-d0ec-e1f2-f721366f43c0@linaro.org>
 <20230606122812.411b223a@xps-13>
 <e0d14527-8147-5e8b-6a43-ee043e0d0f8b@linaro.org>
 <d0b2cdc5-12fd-9a19-b38c-0653b4147c2b@linaro.org>
 <20230606125724.126a4685@xps-13> <20230606130719.5350174c@xps-13>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230606130719.5350174c@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_041119_744467_5BB7E524 
X-CRM114-Status: GOOD (  37.44  )
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

T24gMDYvMDYvMjAyMyAxMzowNywgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBLcnp5c3p0b2Ys
Cj4gCj4gbWlxdWVsLnJheW5hbEBib290bGluLmNvbSB3cm90ZSBvbiBUdWUsIDYgSnVuIDIwMjMg
MTI6NTc6MjQgKzAyMDA6Cj4gCj4+IEhpIEtyenlzenRvZiwKPj4KPj4ga3J6eXN6dG9mLmtvemxv
d3NraUBsaW5hcm8ub3JnIHdyb3RlIG9uIFR1ZSwgNiBKdW4gMjAyMyAxMjo0MDo0NSArMDIwMDoK
Pj4KPj4+IE9uIDA2LzA2LzIwMjMgMTI6MzcsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+
Pj4gT24gMDYvMDYvMjAyMyAxMjoyOCwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+Pj4+PiBIaSBL
cnp5c3p0b2YsCj4+Pj4+Cj4+Pj4+IGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZyB3cm90
ZSBvbiBUdWUsIDYgSnVuIDIwMjMgMTA6NDQ6MzQgKzAyMDA6Cj4+Pj4+ICAKPj4+Pj4+IE9uIDA2
LzA2LzIwMjMgMDk6NDgsIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAKPj4+Pj4+Pj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgIGl0IChvdGhlcndpc2UgaXQgaXMgaGFybWxlc3MpLgo+Pj4+Pj4+Pj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9u
cy9mbGFnCj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRlcHJlY2F0ZWQ6IHRydWUKPj4+
Pj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCBhZGRpdGlvbmFsUHJvcGVydGllczog
ZmFsc2UgICAgICAKPj4+Pj4+Pj4+Pj4+IHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UgICAg
ICAKPj4+Pj4+Pj4+Pj4gSXQgd2FzIGhpZGluZyBieSAnIl5uYW5kQFswLTNdJCI6Jy4gU2hvdWxk
IEkgbW92ZSBpdCBoZXJlPyAgICAgIAo+Pj4+Pj4+Pj4+IFlvdSBjYW5ub3QgaGF2ZSBib3RoIGFk
ZGl0aW9uYWxQcm9wcyBhbmQgdW5ldmFsdWF0ZWRQcm9wcyBhdCB0aGUgc2FtZQo+Pj4+Pj4+Pj4+
IHRpbWUsIHNvIHdlIGRvIG5vdCB0YWxrIGFib3V0IHNhbWUgdGhpbmcgb3IgdGhpcyB3YXMgbmV2
ZXIgd29ya2luZz8gICAgICAKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBIbW0sIEknbSBhIGxpdHRsZSBj
b25mdXNlZCB0aGVuLiBBdCB2YXJpb3VzIHRpbWVzIEkndmUgYmVlbiB0b2xkIHRvIAo+Pj4+Pj4+
Pj4gcHV0ICdhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UnIG9yICd1bmV2YWx1YXRlZFByb3Bl
cnRpZXM6IGZhbHNlJyAKPj4+Pj4+Pj4+IChhbHRob3VnaCBuZXZlciBhdCB0aGUgc2FtZSB0aW1l
KS4gSSdtIG5vdCBzdXJlIHdoZW4gdG8gdXNlIG9uZSBvciB0aGUgCj4+Pj4+Pj4+PiBvdGhlci4K
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBGcm9tIHdoYXQgSSd2ZSBiZWVuIGFibGUgdG8gZ2xlYW4gJ2Fk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlJyAKPj4+Pj4+Pj4+IGluZGljYXRlcyB0aGF0IHRoZSBu
b2RlIGlzIGV4cGVjdGVkIHRvIGhhdmUgY2hpbGQgbm9kZXMgZGVmaW5lZCBpbiBhIAo+Pj4+Pj4+
Pj4gZGlmZmVyZW50IHNjaGVtYSBzbyBJIHdvdWxkIGhhdmUgdGhvdWdodCAnYWRkaXRpb25hbFBy
b3BlcnRpZXM6IGZhbHNlJyAKPj4+Pj4+Pj4+IHdvdWxkIGJlIGFwcHJvcHJpYXRlIGZvciBhIHNj
aGVtYSBjb3ZlcmluZyBhIGxlYWYgbm9kZS4gCj4+Pj4+Pj4+PiAndW5ldmFsdWF0ZWRQcm9wZXJ0
aWVzOiBmYWxzZScgc2VlbXMgdG8gZW5hYmxlIHN0cmljdGVyIGNoZWNraW5nIHdoaWNoIAo+Pj4+
Pj4+Pj4gbWFrZXMgc2Vuc2Ugd2hlbiBhbGwgdGhlIHByb3BlcnRpZXMgYXJlIGRlc2NyaWJlZCBp
biB0aGUgc2NoZW1hLiAgICAgIAo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBTbyBJIHRoaW5rIHRoaXMgbWln
aHQgYmUgdGhlIHByb2JsZW0uIElmIEkgbG9vayBhdCBxY29tLG5hbmRjLnlhbWwgb3IgCj4+Pj4+
Pj4+IGluZ2VuaWMsbmFuZC55YW1sIHdoaWNoIGJvdGggaGF2ZSBhIHBhcnRpdGlvbnMgcHJvcGVy
dHkgaW4gdGhlaXIgCj4+Pj4+Pj4+IGV4YW1wbGUuIE5laXRoZXIgaGF2ZSAndW5ldmFsdWF0ZWRQ
cm9wZXJ0aWVzOiBmYWxzZScgb24gdGhlIG5hbmRALi4uIAo+Pj4+Pj4+PiBzdWJub2RlLiBJZiBJ
IGFkZCBpdCBzdXJlIGVub3VnaCBJIHN0YXJ0IGdldHRpbmcgY29tcGxhaW50cyBhYm91dCB0aGUg
Cj4+Pj4+Pj4+ICdwYXJ0aXRpb25zJyBub2RlIGJlaW5nIHVuZXhwZWN0ZWQuICAgIAo+Pj4+Pj4+
Cj4+Pj4+Pj4gU29ycnkgaWYgdGhhdCB3YXMgdW5jbGVhciwgSSB0aGluayB0aGUgd2hvbGUgbG9n
aWMgYXJvdW5kIHRoZSB5YW1sCj4+Pj4+Pj4gZmlsZXMgaXMgdG8gcHJvZ3Jlc3NpdmVseSBjb25z
dHJhaW4gdGhlIGRlc2NyaXB0aW9ucywgc2NoZW1hIGFmdGVyCj4+Pj4+Pj4gc2NoZW1hLiBJT1cs
IGluIHRoZSBtYXJ2ZWxsIGJpbmRpbmcgeW91IHNob3VsZCBzZXQKPj4+Pj4+PiB1bmV2YWx1YXRl
ZFByb3BlcnRpZXM6IGZhbHNlIGZvciB0aGUgTkFORCBjb250cm9sbGVyLiBXaGF0IGlzIGluc2lk
ZQo+Pj4+Pj4+IChOQU5EIGNoaXBzLCBwYXJ0aXRpb24gY29udGFpbmVyLCBwYXJ0aXRpb24gcGFy
c2VycywgIm10ZCIgcHJvcGVydGllcywKPj4+Pj4+PiBldGMpIHdpbGwgYmUgaGFuZGxlZCBieSBv
dGhlciBmaWxlcy4gT2YgY291cnNlIHlvdSBjYW4gY29uc3RyYWluIGEgYml0Cj4+Pj4+Pj4gd2hh
dCBjYW4vY2Fubm90IGJlIHVzZWQgaW5zaWRlIHRoZXNlIHN1Ym5vZGVzLCBidXQgSSB0aGluayB5
b3UgZG9uJ3QKPj4+Pj4+PiBuZWVkIHRvIHNldCB1bmV2YWx1YXRlZFByb3BlcnRpZXMgaW4gdGhl
c2Ugc3Vibm9kZXMgKHRoZSBOQU5EIGNoaXAgaW4KPj4+Pj4+PiB0aGlzIGNhc2UsIG9yIGV2ZW4g
dGhlIHBhcnRpdGlvbnMpIGJlY2F1c2UgeW91IGFscmVhZHkgcmVmZXJlbmNlCj4+Pj4+Pj4gbmFu
ZC1jb250cm9sbGVyLnlhbWwgd2hpY2ggcmVmZXJlbmNlcyBuYW5kLWNoaXAueWFtbCwgbXRkLnlh
bWwsCj4+Pj4+Pj4gcGFydGl0aW9ucy55YW1sLCBldGMuICp0aGV5KiB3aWxsIG1ha2UgdGhlIGdl
bmVyaWMgY2hlY2tzIGFuZCBob3BlZnVsbHkKPj4+Pj4+PiBhcHBseSBzdHJpY3RlciBjaGVja3Ms
IHdoZW4gZGVlbWVkIHJlbGV2YW50LiAgICAKPj4+Pj4+Cj4+Pj4+PiBObywgbmVpdGhlciBuYW5k
LWNvbnRyb2xsZXIueWFtbCBub3IgbmFuZC1jaGlwLnlhbWwgbGltaXQgdGhlIHByb3BlcnRpZXMK
Pj4+Pj4+IGluIHRoaXMgY29udGV4dCwgc28gZWFjaCBkZXZpY2Ugc2NoZW1hIG11c3QgaGF2ZSB1
bmV2YWx1YXRlZFByb3BlcnRpZXM6Cj4+Pj4+PiBmYWxzZSwgZm9yIHdoaWNoIEkgYXNrZWQgZmV3
IGVtYWlscyBhZ28uICAKPj4+Pj4KPj4+Pj4gVGhlIGNvbnRyb2xsZXIgZGVzY3JpcHRpb24gc2hh
bGwgYmUgZ3VhcmRlZCBieSB1bmV2YWx1YXRlZFByb3BlcnRpZXM6Cj4+Pj4+IGZhbHNlLCB3ZSBh
Z3JlZS4gRG8geW91IG1lYW4gdGhlIG5hbmQgY2hpcCBkZXNjcmlwdGlvbiBpbiBlYWNoIG5hbmQK
Pj4+Pj4gY29udHJvbGxlciBiaW5kaW5nIHNob3VsZCBhbHNvIGluY2x1ZGUgaXQgYXQgaXRzIG93
biBsZXZlbD8gQmVjYXVzZQo+Pj4+PiB0aGF0IGlzIG5vdCB3aGF0IHdlIGVuZm9yY2VkIHNvIGZh
ciBJSVJDLiBJIGFtIHRvdGFsbHkgZmluZSBkb2luZyBzbwo+Pj4+PiBzdGFydGluZyBmcm9tIG5v
dyBvbiBpZiB0aGlzIGlzIGEgbmV3IHJlcXVpcmVtZW50ICh3aGljaCBtYWtlcyBzZW5zZSkuCj4+
Pj4+Cj4+Pj4+IElmIHllcywgdGhlbiBpdCBtZWFucyB3ZSB3b3VsZCBuZWVkIHRvIGxpc3QgKmFs
bCogdGhlIG5hbmQKPj4+Pj4gY2hpcCBwcm9wZXJ0aWVzIGluIGVhY2ggc2NoZW1hLCB3aGljaCBj
bGVhcmx5IGludm9sdmVzIGEgbG90IG9mCj4+Pj4+IGR1cGxpY2F0aW9uIGFzIHlvdSB3b3VsZCBu
ZWVkIHRvIGRlZmluZSBhbGwgdHlwZXMgb2YgcGFydGl0aW9ucywKPj4+Pj4gcGFydGl0aW9uIHBh
cnNlcnMsIGdlbmVyaWMgcHJvcGVydGllcywgZXRjIGluIG9yZGVyIGZvciB0aGUgZXhhbXBsZXMg
dG8KPj4+Pj4gcGFzcyBhbGwgdGhlIGNoZWNrcy4gT25seSB0aGUgcHJvcGVydGllcyBsaWtlIHBp
bmN0cmwtKiB3b3VsZCBub3QgbmVlZAo+Pj4+PiB0byBiZSBsaXN0ZWQgSSBndWVzcy4gIAo+Pj4+
Cj4+Pj4gWWVzLCB0aGlzIGlzIHdoYXQgc2hvdWxkIGJlIGRvbmUuIEVhY2ggbm9kZSBzaG91bGQg
aGF2ZSBlaXRoZXIgIAo+Pj4KPj4+IEVoLCBubywgSSByZXNwb25kZWQgaW4gd3JvbmcgcGFydCBv
ZiBtZXNzYWdlLiBNeSB5ZXMgd2FzIGZvcjoKPj4+Cj4+PiAiIERvIHlvdSBtZWFuIHRoZSBuYW5k
IGNoaXAgZGVzY3JpcHRpb24gaW4gZWFjaCBuYW5kCj4+PiBjb250cm9sbGVyIGJpbmRpbmcgc2hv
dWxkIGFsc28gaW5jbHVkZSBpdCBhdCBpdHMgb3duIGxldmVsPyIKPj4KPj4gQ2xlYXIuCj4+Cj4+
Pgo+Pj4gTm93IGZvciBhY3R1YWwgcGFyYWdyYXBoOgo+Pj4KPj4+ICJJZiB5ZXMsIHRoZW4gaXQg
bWVhbnMgd2Ugd291bGQgbmVlZCB0byBsaXN0ICphbGwqIHRoZSBuYW5kIGNoaXAKPj4+IHByb3Bl
cnRpZXMgaW4gZWFjaCBzY2hlbWEsIgo+Pj4KPj4+IE5vLCB3aHk/IEkgZG9uJ3QgdW5kZXJzdGFu
ZC4gVXNlIHRoZSBzYW1lIHBhdHRlcm4gYXMgYWxsIG90aGVyIGJpbmRpbmdzLAo+Pj4gdGhpcyBp
cyBub3Qgc3BlY2lhbC4gQWJzb2x1dGVseSBhbGwgaGF2ZSB0aGUgc2FtZSBiZWhhdmlvciwgZS5n
Lgo+Pj4gbWVudGlvbmVkIGxlZHMuIFlvdSBmaW5pc2ggd2l0aCB1bmV2YWx1YXRlZFByb3BzIGFu
ZCB5b3UncmUgZG9uZSwgd2hpY2gKPj4+IGlzIHdoYXQgSSB3cm90ZSBoZXJlIGxvbmcsIGxvbmcg
dGltZSBhZ28uCj4+Cj4+IE1heWJlIGJlY2F1c2Ugc28gZmFyIHdlIGRpZCBub3QgYm90aGVyIHJl
ZmVyZW5jaW5nIGFub3RoZXIgc2NoZW1hIGluCj4+IHRoZSBOQU5EIGNoaXAgbm9kZXM/IEZvciB5
b3VyIGhpbnQgdG8gd29yayBJIGd1ZXNzIHdlIHNob3VsZCBoYXZlLCBpbgo+PiBlYWNoIGNvbnRy
b2xsZXIgYmluZGluZywgc29tZXRoaW5nIGFsb25nOgo+Pgo+PiAgcGF0dGVyblByb3BlcnRpZXM6
Cj4+ICAgICJebmFuZEBbYS1mMC05XSQiOgo+PiAgICAgIHR5cGU6IG9iamVjdAo+PiArICAgICRy
ZWY6IG5hbmQtY2hpcC55YW1sIwo+PiAgICAgIHByb3BlcnRpZXM6Cj4+Cj4+IElmIHllcywgcGxl
YXNlIGlnbm9yZSB0aGUgc2VyaWVzIHNlbnQgYXNpZGUsIEkgd2lsbCB3b3JrIG9uIGl0IGFnYWlu
Cj4+IGFuZCBzZW5kIGEgdjIuCj4gCj4gQWN0dWFsbHkgSSBhbHJlYWR5IHNlZSBhIHByb2JsZW0s
IGxldCdzIHRoZSBpbmdlbmljLG5hbmQueWFtbCBleGFtcGxlLgo+IFRoZSBnb2FsLCBJSVVDLCBp
cyB0byBkbzoKPiAKPiAgcGF0dGVyblByb3BlcnRpZXM6Cj4gICAgIl5uYW5kQFthLWYwLTldJCI6
Cj4gICAgICB0eXBlOiBvYmplY3QKPiArICAgICRyZWY6IG5hbmQtY2hpcC55YW1sCj4gICAgICBw
cm9wZXJ0aWVzOgo+IAo+ICAgICAgICAuLi4KPiAKPiArICAgIHVuZXZhbHVhdGVkUHJvcGVydGll
czogZmFsc2UKPiAKPiBUaGUgZXhhbXBsZSBpbiB0aGlzIGZpbGUgdXNlcyBhIHByb3BlcnR5LCBu
YW5kLW9uLWZsYXNoLWJidCwgd2hpY2ggaXMKPiBkZXNjcmliZWQgaW5zaWRlIG5hbmQtY29udHJv
bGxlci55YW1sIGluc3RlYWQgb2YgbmFuZC1jaGlwLnlhbWwuCj4gSW5kZWVkLCB0aGUgZm9ybWVy
IGFjdHVhbGx5IGRlc2NyaWJlcyBtYW55IHByb3BlcnRpZXMgd2hpY2ggYXJlIGEgYml0Cj4gbW9y
ZSBjb250cm9sbGVyIHJlbGF0ZWQgdGhhbiBjaGlwIHJlbGF0ZWQuIFdpdGggdGhlIGFib3ZlIGRl
c2NyaXB0aW9uLAo+IHRoZSBleGFtcGxlIGZhaWxzIGJlY2F1c2UgbmFuZC1vbi1mbGFzaC1iYnQg
aXMgbm90IGFsbG93ZWQgKGl0IGlzIG5vdAo+IGxpc3RlZCBpbiBuYW5kLWNoaXAueWFtbCkuCj4g
Cj4gSG93IHdvdWxkIHlvdSBwcm9jZWVkIGluIHRoaXMgY2FzZT8KPiAKPiBNYXliZSBJIGNvdWxk
IG1vdmUgYWxsIHRoZSBOQU5EIGNoaXAgcHJvcGVydGllcyB3aGljaCBhcmUgc29tZWhvdwo+IHJl
bGF0ZWQgdG8gTkFORCBjb250cm9sbGVycyAoYW5kIGRlZmluZWQgaW4gbmFuZC1jb250cm9sbGVy
LnlhbWwpIGluIGEKPiBkZWRpY2F0ZWQgZmlsZSBhbmQgcmVmZXJlbmNlIGl0IGZyb20gbmFuZC1j
aGlwLnlhbWw/IEFueSBvdGhlciBpZGVhIGlzCj4gd2VsY29tZS4KClllcywgdGhpcyB3b3VsZCB3
b3JrIGFuZCBzZWVtcyByZWFzb25hYmxlLiBPdGhlciB3YXkgY291bGQgYmUgdG8gYWRkCnVuZXZh
bHVhdGVkUHJvcGVydGllczpmYWxzZSBvbiB0aGlzIGxldmVsIChzbyBhZnRlciByZWY6bmFuZC1j
aGlwLnlhbWwpCmluIG5hbmQtY29udHJvbGxlci55YW1sLiBUaGlzIGhvd2V2ZXIgd291bGQgbm90
IGFsbG93IGFueSBuZXcgcHJvcGVydGllcwp0byBiZSBkZWZpbmVkIGluIGRldmljZSBiaW5kaW5n
cy4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
