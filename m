Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7EDC4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Dec 2023 11:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=62u41slI3N3E2xNsmzvYR6kEz+6jMitG1qqoXJ9zc9g=; b=C1UgebnGaOZGeK
	fBmdXPHWpvHshcho4Jr8LARQeajKBVR+iF9q+vO3CMMMRK+ITm9T8uHRONFsMxZNrd6VV1mjIkeLI
	O1zFnVTsE77b6vFr863ttLktKksl4YuV7gm8xH3HHetoHz5lvB4E1SV6Woc/2AvxOMsDpK0itJ40U
	nfe0S9hEj3Ho0Mp/xi9zDXDcdh562geCWRN1YWjDBuaY5d3n+RTO51vswdohRZaq7rjsNLbXDplSd
	hbvgV4KPzHhZ7MeNerHqNlsC4o1vOLlv19acWkkgFzDbwUSlcv48bR8KsCFyTqJXzNSECLN9UOxD8
	wwqWo36CuQFrEzHMAyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYzh-00FUVD-1a;
	Fri, 08 Dec 2023 11:26:09 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYze-00FUU2-0N
	for linux-mtd@lists.infradead.org;
	Fri, 08 Dec 2023 11:26:07 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c9bd3ec4f6so23298281fa.2
        for <linux-mtd@lists.infradead.org>; Fri, 08 Dec 2023 03:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702034762; x=1702639562; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=USaCJIxBwuygiC0IXQHw2FN2+OGuFtnYUDLOCzgwZLY=;
        b=wcZK75pRt/3fhdXRAW9eKCN0tdXUDNEvg/tN8epUK0WUrbu6kKK6LAc/auwjF0JhYb
         6oPZ5PyxOJ+Cgx1ih4KSRm0UXF9N90VCpiwzhH6WMyruifzq9Ecx/QFSM0iamuXpwTU/
         MhMfM+pHlM0ZjylFHdImaIPnhP2GeAukTKNq2IviMbiaxKwHSugiO9cWWEMeMlkNCNoh
         dEIVa1HKTyult7lwNAU02YGzhN+tD8dNeHtVC+HSn10FtcL++zL0s2qEEeHFWc+I69xp
         OxPPXfJZbgrGuWNh27fJTquJ9trEu6AOt/rs2PwKO3vUOxWD/QRLLdc1jXjr20UQwjsR
         7w5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702034762; x=1702639562;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=USaCJIxBwuygiC0IXQHw2FN2+OGuFtnYUDLOCzgwZLY=;
        b=ZwJZ0Yzf0oVbK+CCgWj2Tj4ebcYmKcqy+WIuWm2Gp/B1yTnxft0OFvBaEIS6qz6Bbl
         +X4YIubuydccsskvMgyI7OXLuNh+GIHgfFOwzDGWelYV9Dla0aPUbyelavUc2t0GfNif
         igIR5+oMA08WhKP2e0/FWyzdrN9z5jGQe3TXPzfwtuBKmHAfE39ADqlbs/GAyczKZYcB
         zaGob3EpKw+8ul4DGoMWcE3RKZLpkzfmwj2vy8wqwdcS1k0eX+huBe9jkLCLaQHf2uRy
         4FOWYGPGZVNHqsKdhkcxcjbbMKy5tc/Rp8DoLdesdQMAC5pl24EeoyzYuEc/iOPoErLJ
         fIkA==
X-Gm-Message-State: AOJu0YzxD4P8V423ZCNa5Mzdl0ZycQ8hMX8IGyZAYyjltINTkP8hllQY
	G7StRw8b0qLEcNMXOTeHLKh0Mg==
X-Google-Smtp-Source: AGHT+IHXlUwwd4MUrg758rkG5iwg7wkS7ssfpX8wSmup5N+tEKROLHfGc6a4ZTBNpo1XoIB4vE9qPA==
X-Received: by 2002:a2e:a442:0:b0:2ca:667a:4c98 with SMTP id v2-20020a2ea442000000b002ca667a4c98mr541831ljn.70.1702034762606;
        Fri, 08 Dec 2023 03:26:02 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id q185-20020a2e2ac2000000b002ca2699f14bsm192713ljq.85.2023.12.08.03.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 03:26:02 -0800 (PST)
Message-ID: <28ece7fb-53a9-48d3-9e40-0ef06d5821ce@linaro.org>
Date: Fri, 8 Dec 2023 11:26:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] nvmem: brcm_nvram: store a copy of NVRAM content
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <scott.branden@broadcom.com>
References: <20231102062848.23965-1-zajec5@gmail.com>
 <29d2f463-90c2-4c96-8828-96806679db8e@linaro.org>
 <7cb70a8ead5f6b74f0a287ac8832873c@milecki.pl>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <7cb70a8ead5f6b74f0a287ac8832873c@milecki.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_032606_197089_A2B91221 
X-CRM114-Status: GOOD (  11.70  )
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

CgpPbiAwOC8xMi8yMDIzIDExOjI1LCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4gT24gMjAyMy0x
Mi0wOCAxMjoxNSwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3cm90ZToKPj4gVGhhbmsgeW91IGZvciB0
aGUgcGF0Y2gsCj4+Cj4+IE9uIDAyLzExLzIwMjMgMDY6MjgsIFJhZmHFgiBNacWCZWNraSB3cm90
ZToKPj4+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4+Cj4+PiBU
aGlzIGRyaXZlciB1c2VzIE1NSU8gYWNjZXNzIGZvciByZWFkaW5nIE5WUkFNIGZyb20gYSBmbGFz
aCBkZXZpY2UuCj4+PiBVbmRlcm5lYXRoIHRoZXJlIGlzIGEgZmxhc2ggY29udHJvbGxlciB0aGF0
IHJlYWRzIGRhdGEgYW5kIHByb3ZpZGVzCj4+PiBtYXBwaW5nIHdpbmRvdy4KPj4+Cj4+PiBVc2lu
ZyBNTUlPIGludGVyZmFjZSBhZmZlY3RzIGNvbnRyb2xsZXIgY29uZmlndXJhdGlvbiBhbmQgbWF5
IGJyZWFrIHJlYWwKPj4+IGNvbnRyb2xsZXIgZHJpdmVyLiBJdCB3YXMgcmVwb3J0ZWQgYnkgbXVs
dGlwbGUgdXNlcnMgb2YgZGV2aWNlcyB3aXRoCj4+PiBOVlJBTSBzdG9yZWQgb24gTkFORC4KPj4+
Cj4+PiBNb2RpZnkgZHJpdmVyIHRvIHJlYWQgJiBjYWNoZSBOVlJBTSBjb250ZW50IGR1cmluZyBp
bml0IGFuZCB1c2UgdGhhdAo+Pj4gY29weSB0byBwcm92aWRlIE5WTUVNIGRhdGEgd2hlbiByZXF1
ZXN0ZWQuIE9uIE5BTkQgZmxhc2hlcyBkdWUgdG8gdGhlaXIKPj4+IGFsaWdubWVudCBOVlJBTSBw
YXJ0aXRpb25zIGNhbiBiZSBxdWl0ZSBiaWcgKDEgTWlCIGFuZCBtb3JlKSB3aGlsZQo+Pj4gYWN0
dWFsIE5WUkFNIGNvbnRlbnQgc3RheXMgcXVpdGUgc21hbGwgKHVzdWFsbHkgMTYgdG8gMzIgS2lC
KS4gVG8gYXZvaWQKPj4+IGFsbG9jYXRpbmcgc28gbXVjaCBtZW1vcnkgY2hlY2sgZm9yIGFjdHVh
bCBkYXRhIGxlbmd0aC4KPj4+Cj4+PiBMaW5rOiAKPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LW10ZC9DQUNuYTZyd2YzXzlRVmpZY00rODQ3YmlUWD1LMEVvV1h1WGNTTWtKTzFWeV81
dm1WcUFAbWFpbC5nbWFpbC5jb20vCj4+PiBGaXhlczogM2ZlZjllZDA2MjdhICgibnZtZW06IGJy
Y21fbnZyYW06IG5ldyBkcml2ZXIgZXhwb3NpbmcgCj4+PiBCcm9hZGNvbSdzIE5WUkFNIikKPj4K
Pj4gQW55IHJlYXNvbiBub3QgdG8gYWRkCj4+IENjOiA8U3RhYmxlQHZnZXIua2VybmVsLm9yZz4K
Pj4gPwo+IAo+IE5vdCByZWFsbHkuIEkgYmVsaWV2ZSBzdGFibGUgdGVhbSB3b3VsZCBwaWNrIHRo
aXMgZml4IGFueXdheSAodGhhbmtzIHRvCj4gdGhlIEZpeGVzOikgYnV0IGRvaW5nCj4gQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBpcyBkZXNjcmliZWQgYXMgc3Ryb25nbHkgcHJlZmVycmVk
Lgo+IAo+IERvIHlvdSB0aGluayB5b3UgY2FuIGp1c3QgYW1tZW5kIG15IHBhdGNoIHdoaWxlIGFw
cGx5aW5nIGl0IGFuZCBhZGQKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IHRvIGl0PwpX
aWxsIGRvLgoKLS1zcmluaQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
