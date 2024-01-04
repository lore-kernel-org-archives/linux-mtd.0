Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0CBC47074
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jan 2024 09:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/boJdet06Othz6BjhydO8KA+liEao25aGS5jmPqaBg=; b=Cfmet9alx1Q76s
	vBAkKNpXv0N8+qnqBVp3aMRHB61jkUNsvL4/7y2vY8Pr+b4/8fJu8Z8pJHejI+nAe8RmPH+cP05Ji
	JlxDY8Yibrc/NantCB2KQSSaihaAbzk7eQ8EHu8iIjpKIbS1rBw1ZN8580njKtRscxYQXGcfTjYN9
	J+42ZngCaOY9XnCLcT/2jDkFeI7V9Fx4C+lPg7NYW2yZNwT59rDjEUbrbS7gr9DhFoazhDLbTvA6T
	k+4caCbAmzLCu/y6vu1mLadKAQVzhL84xKJbVVMI/frNmiNDqn5tFY5tVWYGjKhaGTgBM0DVctACJ
	BJMbJNqEM+0sL2fQdkwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLJk6-00DK1n-0v;
	Thu, 04 Jan 2024 09:10:22 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLJk2-00DK0A-2J;
	Thu, 04 Jan 2024 09:10:20 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a279ce3aab9so30820866b.0;
        Thu, 04 Jan 2024 01:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704359416; x=1704964216; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dPBMZpIwLe97eSOARV8n7U9n/s5Z04R3IqnKQQS8rw8=;
        b=B0wmNMFGsDHs4Y8Mkm+dxvHxnLwtWJKzRwB967bx3klKRuYghgSo0m067eIugJBIUI
         +Qhbq6tG5dAfcLj1rowjlE77lKUBvevb07Nz5jqBXYgy3iKEGKJOB+mABOsgFPrjO4Qw
         juEEvEwA2Y/cEtV/x8A30QPXHKS9VY7kOYBWigfqIer/oe1Y8M6b8GBkE7/+l/NzBPnw
         dbMZ8emxE5sIbVX1wekx/rmxPSPZFBCCCYJ9wKeEUv5Y0Bb8prZ1iuzGUsAeZFd+KmXi
         3nJ3VndxHxBLmNTt4J34vBcxWLEbLxMotVsO6Leu3TYZ5dTBpMD6TA+q3vfQSCw0NKIo
         ZtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704359416; x=1704964216;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dPBMZpIwLe97eSOARV8n7U9n/s5Z04R3IqnKQQS8rw8=;
        b=ZNuCyWOc5hqlOGX/L9o/J/8i2Tq2A1yvYQSuWYC1P7+GMDM5miCt8NEum3wrgvgu3I
         CK1t7IONnmnjUFANoz+zFjwgXQTSXuD7MFW0NNGxtNV/F0qGzvtcWBiFLOaUahzssGMb
         Wzch6gwU2DNsIKtWZkQG8BMGc1alSQ5bVLwunGH3grxH5ubSBVOpFj8xpHA3AT+/XMoY
         EYootaJFnoDW+ta+rJ7WFo5u/jTbmoykFbdCDwQ5FMKK4aPzFm1EUwP1G12lvtk/9p7x
         wBnNO7nAf1vvwuMS2Ppl6CnxnqgExrDLgOatLOb5B17lG5LkwGcVuKuaWggrevpOczru
         CABg==
X-Gm-Message-State: AOJu0YxffW7DXSL9iSk9AWKVctUduHGdu6/7xt9nT9gfnkWbkSJaKLkl
	vdN8ySMckI9BK1gDapbNLlA=
X-Google-Smtp-Source: AGHT+IH9GFQFLxaGbfTd716l9XCq8gwK4NcEI5lScAk+/vXXAtSZomgstLN/aGp2NblEnpsbdZRUPg==
X-Received: by 2002:a17:907:e8e:b0:a27:efb8:6d51 with SMTP id ho14-20020a1709070e8e00b00a27efb86d51mr114313ejc.228.1704359416289;
        Thu, 04 Jan 2024 01:10:16 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id ld11-20020a170906f94b00b00a28d1d73654sm502052ejb.207.2024.01.04.01.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 01:10:15 -0800 (PST)
Message-ID: <8c8d2d38-faf2-47f2-bfbf-2e4842dded47@gmail.com>
Date: Thu, 4 Jan 2024 10:10:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/6] dt-bindings: nvmem: layouts: add U-Boot
 environment variables layout
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, u-boot@lists.denx.de,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20231221173421.13737-1-zajec5@gmail.com>
 <20240104001129.GA2045237-robh@kernel.org> <20240104085839.5624c354@xps-13>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20240104085839.5624c354@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_011018_753430_C437573A 
X-CRM114-Status: GOOD (  28.12  )
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

T24gNC4wMS4yMDI0IDA4OjU4LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IHJvYmhAa2VybmVsLm9y
ZyB3cm90ZSBvbiBXZWQsIDMgSmFuIDIwMjQgMTc6MTE6MjkgLTA3MDA6Cj4+IE9uIFRodSwgRGVj
IDIxLCAyMDIzIGF0IDA2OjM0OjE2UE0gKzAxMDAsIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPj4+
IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4+Cj4+PiBVLUJvb3Qg
ZW52IGRhdGEgaXMgYSB3YXkgb2Ygc3RvcmluZyBmaXJtd2FyZSB2YXJpYWJsZXMuIEl0J3MgYSBm
b3JtYXQKPj4+IHRoYXQgY2FuIGJlIHVzZWQgb2YgdG9wIG9mIHZhcmlvdXMgc3RvcmFnZSBkZXZp
Y2VzLiBJdHMgYmluZGluZyBzaG91bGQKPj4+IGJlIGFuIE5WTUVNIGxheW91dCBpbnN0ZWFkIG9m
IGEgc3RhbmRhbG9uZSBkZXZpY2UuCj4+Pgo+Pj4gVGhpcyBwYXRjaCBhZGRzIGxheW91dCBiaW5k
aW5nIHdoaWNoIGFsbG93cyB1c2luZyBpdCBvbiB0b3Agb2YgTVREIE5WTUVNCj4+PiBkZXZpY2Ug
YXMgd2VsbCBhcyBhbnkgb3RoZXIuIEF0IHRoZSBzYW1lIHRpbWUgaXQgZGVwcmVjYXRlcyB0aGUg
b2xkCj4+PiBjb21iaW5lZCBiaW5kaW5nLgo+Pgo+PiBJIGRvbid0IHVuZGVyc3RhbmQgdGhlIGlz
c3VlLiBGcm9tIGEgRFQgcGVyc3BlY3RpdmUsIHRoZXJlIGlzbid0LiBBCj4+IHBhcnRpdGlvbiBp
cyBub3QgYSBkZXZpY2UsIGJ1dCBpcyBkZXNjcmliaW5nIHRoZSBsYXlvdXQgb2Ygc3RvcmFnZQo+
PiBhbHJlYWR5Lgo+IAo+IEFjdHVhbGx5IEkgdGhpbmsgd2hhdCBSYWZhxYIgd2FudHMgdG8gZG8g
Z29lcyBpbiB0aGUgcmlnaHQgZGlyZWN0aW9uIGJ1dAo+IEkgYWxzbyB1bmRlcnN0YW5kIGZyb20g
YSBiaW5kaW5nIHBlcnNwZWN0aXZlIGl0IG1heSBiZSBhIGxpdHRsZQo+IGNvbmZ1c2luZywgZXZl
biBtb3JlIGlmIHdlIGNvbnNpZGVyICJOVk1FTSIgYSBMaW51eCBzcGVjaWZpYyBjb25jZXB0Lgo+
IAo+IFRoZXJlIGlzIHRvZGF5IGEgInUtYm9vdCBlbnYiIE5WTUVNICpkZXZpY2UqIGRlc2NyaXB0
aW9uIHdoaWNoCj4gYWxtb3N0IHNpdHMgYXQgdGhlIHNhbWUgbGV2ZWwgYXMgZWcuIGFuIGVlcHJv
bSBkZXZpY2UuIFdlIGNhbm5vdAo+IGNvbXBhcmUgImFuIGVlcHJvbSBkZXZpY2UiIGFuZCAiYSB1
LWJvb3QgZW52aXJvbm1lbnQiIG9mIGNvdXJzZS4gQnV0Cj4gdGhhdCdzIHRydWx5IHdoYXQgaXMg
Y3VycmVudGx5IGRlc2NyaWJlZC4KPiAKPiAqIEN1cnJlbnQgc2l0dWF0aW9uCj4gCj4gCUZsYXNo
IGRldmljZSAtPiBVLUJvb3QgZW52IGxheW91dCAtPiBOVk1FTSBjZWxscwo+IAo+ICogSW1wcm92
ZWQgc2l0dWF0aW9uCj4gCj4gCUFueSBzdG9yYWdlIGRldmljZSAtPiBOVk1FTSAtPiBVLUJvb3Qg
ZW52IGxheW91dCAtPiBOVk1FTSBjZWxscwo+IAo+IFRoZSBsYXR0ZXIgaXMgb2YgY291cnNlIHRo
ZSBtb3N0IHJlbGV2YW50IGRlc2NyaXB0aW9uIGFzIHdlIGV4cGVjdAo+IHN0b3JhZ2UgZGV2aWNl
cyB0byBleHBvc2UgYSBzdG9yYWdlLWFnbm9zdGljIGludGVyZmFjZSAoTlZNRU0gaW4KPiB0aGlz
IGNhc2UpIHdoaWNoIGNhbiB0aGVuIGJlIHBhcnNlZCAoYnkgTlZNRU0gbGF5b3V0cykgaW4gYSBz
dG9yYWdlCj4gYWdub3N0aWMgd2F5Lgo+IAo+IEluIHRoZSBjdXJyZW50IGNhc2UsIHRoZSBjdXJy
ZW50IFUtQm9vdCBlbnYgYmluZGluZyB0ZWxscyBwZW9wbGUgdG8KPiBkZWNsYXJlIHRoZSBlbnYg
bGF5b3V0IG9uIHRvcCBvZiBhIGZsYXNoIGRldmljZSAob25seSkuIFRoZSBjdXJyZW50Cj4gZGVz
Y3JpcHRpb24gYWxzbyBleHBlY3RzIGEgcGFydGl0aW9uIG5vZGUgd2hpY2ggaXMgdHlwaWNhbCB0
byBmbGFzaAo+IGRldmljZXMuIFdoZXJlYXMgd2hhdCB3ZSBzaG91bGQgaGF2ZSBkZXNjcmliZWQg
aW4gdGhlIGZpcnN0IHBsYWNlIGlzIGEKPiBsYXlvdXQgdGhhdCBhcHBsaWVzIG9uIGFueSBraW5k
IG9mIE5WTUVNIGRldmljZS4KPiAKPiBCb251cyBwb2ludDogV2UndmUgYmVlbiB3b3JraW5nIHRo
ZSBsYXN0IGNvdXBsZSB5ZWFycyBvbiBjbGFyaWZ5aW5nCj4gYmluZGluZ3MsIGVzcGVjaWFsbHkg
d2l0aCBtdGQgcGFydGl0aW9ucyAod2l0aCB0aGUgcGFydGl0aW9uc3t9Cj4gY29udGFpbmVyKSBh
bmQgTlZNRU0gbGF5b3V0cyAod2l0aCB0aGUgbnZtZW0tbGF5b3V0e30gY29udGFpbmVyKS4KPiBU
aGUgc3dpdGNoIHByb3Bvc2VkIGluIHRoaXMgcGF0Y2ggbWFrZXMgdXNlIG9mIHRoZSBsYXR0ZXIs
IG9mIGNvdXJzZS4KClRoYW5rcyBNaXF1w6hsIGZvciBmaWxsaW5nIGJpdHMgSSBtaXNzZWQgaW4g
Y29tbWl0IGRlc2NyaXB0aW9uLiBEZXNwaXRlCnllYXJzIGluIExpbnV4L0RUIEkgc3RpbGwgc3Ry
dWdnbGUgd2l0aCBtb3JlIGNvbXBsZXggZGVzaWducwpkb2N1bWVudGF0aW9uLgoKCkFzIHBlciBS
b2IncyBjb21tZW50IEkgdGhpbmsgSSBzZWUgaGlzIHBvaW50IGFuZCBhIHBvc3NpYmxlIGRlc2ln
bgpjb25mdXNpb24uIElmIHlvdSBsb29rIGZyb20gYSBwdXJlIERUIHBlcnNwZWN0aXZlIHRoZW4g
InBhcnRpdGlvbnMiIGFuZAoibnZtZW0tbGF5b3V0IiBzZXJ2ZSBhIHZlcnkgc2ltaWxhciBwdXJw
b3NlLiBUaGV5IGRlc2NyaWJlIGRldmljZSdzIGRhdGEKY29udGVudCBzdHJ1Y3R1cmUuIEZvciBm
aXhlZCBzdHJ1Y3R1cmVzIHdlIGhhdmUgdmVyeSBzaW1pbGFyCiJmaXhlZC1wYXJ0aXRpb25zIiBh
bmQgImZpeGVkLWNlbGxzIi4KCklmIHdlIHdlcmUgdG8gZGVzaWduIHRob3NlIGJpbmRpbmdzIHRv
ZGF5IEknbSB3b25kZXJpbmcgaWYgd2UgY291bGRuJ3QKaGF2ZSBzL3BhcnRpdGlvbnMvbGF5b3V0
LyBhbmQgcy9udm1lbS1sYXlvdXQvbGF5b3V0Ly4KClJvYjogb3RoZXIgdGhhbiBoYXZpbmcgZGlm
ZmVyZW50IGJpbmRpbmdzIGZvciBNVEQgdnMuIE5WTUVNIGxheW91dHMgSQp0aGluayB0aGV5IG92
ZXJhbGwgZGVzaWduIG1ha2VzIHNlbnNlLiBBIHNpbmdsZSBkZXZpY2UgbWF5IGhhdmUgY29udGVu
dApzdHJ1Y3R1cml6ZWQgb24gbW9yZSB0aGFuIDEgbGV2ZWw6CjEuIFlvdSBtYXkgaGF2ZSBmaXhl
ZCBsYXlvdXQgYXQgdG9wIGxldmVsIChtdWx0aXBsZSBwYXJ0aXRpb25zKQoyLiBTaW5nbGUgcGFy
dGl0aW9ucyBtYXkgaGF2ZSB0aGVpciBvd24gbGF5b3V0cyAobGlrZSBVLUJvb3QgZW52IGRhdGEp
CgpNYXliZSBpZGVhbGx5IGFib3ZlIHNob3VsZCBsb29rIG1vcmUgbGlrZToKCmZsYXNoQDAgewoJ
Y29tcGF0aWJsZSA9ICI8Zmxhc2gtY29tcGF0aWJsZT4iOwoKCWxheW91dCB7CgkJY29tcGF0aWJs
ZSA9ICJmaXhlZC1sYXlvdXQiOwoJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCSNzaXplLWNlbGxz
ID0gPDE+OwoKCQlwYXJ0aXRpb25AMCB7CgkJCXJlZyA9IDwweDAgMHg0MDAwMD47CgkJCWxhYmVs
ID0gInUtYm9vdCI7CgkJfTsKCgkJcGFydGl0aW9uQDQwMDAwIHsKCQkJcmVnID0gPDB4NDAwMDAg
MHgxMDAwMD47CgkJCWxhYmVsID0gInUtYm9vdC1lbnYiOwoKCQkJbGF5b3V0IHsKCQkJCWNvbXBh
dGlibGUgPSAidS1ib290LGVudi1sYXlvdXQiOwoJCQl9OwoJCX07CgoJCXBhcnRpdGlvbkA1MDAw
MCB7CgkJCXJlZyA9IDwweDUwMDAwIDB4MTAwMDAwPjsKCQkJbGFiZWwgPSAidS1ib290IjsKCQl9
OwoJfTsKfTsKCmJ1dCBJIGNhbiBjbGVhcmx5IHNlZSBhIHVzZSBmb3IgbmVzdGVkICJsYXlvdXQi
cy4gQXMgSSBzYWlkIG1heWJlIHdlCmp1c3Qgc2hvdWxkbid0IGJlIHNvIG9wZW4gaW4gY2FsbGlu
ZyB0aG9zZSBNVEQgb3IgTlZNRU0gZGV2aWNlcyBhcyB0aGF0CmlzIGtpbmQgb2YgTGludXggc3Bl
Y2lmaWMuCgpJJ20gbm90IHN1cmUgaWYgd2Ugc2hvdWxkIHRyeSByZW5hbWluZyAibnZtZW0tbGF5
b3V0IiB0byAibGF5b3V0IiBvcgoicGFydGl0aW9ucyIgaW4gc2ltaWxhciB3YXkgYXQgdGhpcyBw
b2ludC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
