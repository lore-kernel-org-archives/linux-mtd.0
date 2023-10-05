Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879B3E92702
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Oct 2023 14:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/36DFmLG1GyX5VADnyUlzKZ6w23l++AmURhd+DfRJcc=; b=3whTVgPBGG5dCt
	K3B5pwQ7f+77tKCqZZ/HDqRvD3nLIy14mtwlApSn1pgJ/V6LY0COAhE1VLprukmr1+MzEdja/Doh9
	cSDEHhTrjhiRkxJmoYCcKu86NTL/x79wa5iRgs9r5vP16Rbi6NgR4Lx8TYodW+jSjzxtJkVT6vfQk
	zmdBYuKndQZSyIYksDxi7yGxzfxzT2GTNwD5O3E9DOShdrsbyh2EcqB1Y/+h3w+irq4IoEUm5vblA
	ubqWBf+HXRbPddvquLTstUl9uW4btXbxOpvI1g+eeNQ/0TJ4BbjPbuBohCAq7RS5rmOyifJycNxU5
	l/6pFa1PYW+D5VnIrk8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoP4j-003g5S-1t;
	Thu, 05 Oct 2023 14:11:37 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoP4g-003g3s-2c
	for linux-mtd@lists.infradead.org;
	Thu, 05 Oct 2023 14:11:36 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9b6559cbd74so196610266b.1
        for <linux-mtd@lists.infradead.org>; Thu, 05 Oct 2023 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696515092; x=1697119892; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dfyCZicpPduaIx/4ZNTvtfLRdO9R8uKzkarzy6IJm4c=;
        b=fyoSJbirD2yRpZ59os2pLKcFfM/13kFvH5LsYOSllvHk80+XwHptB4OnapmHwqJVuE
         jdoYY4Vfg7uvriZnTGSqsSgXDi+OaMxnsONDShevkdlY7RgoB++ZcSxv6kyaKRskizta
         l97J7hW2L98f4NMf7dBnx2af8903LZGLNhGp7BV4dF0oo01goeffemvTViN9jegjnLmp
         vyO3OU2HXiFx40p0HNYOqMdxmsHAcPWZkJnA8tR9TWQn3V9+CWIuX5JeOZrbaOxrigM0
         b1H5KZ9mYNBcAnrlF8aA4elG7Nof58XQcvYA4Px3myviJ83Lm809MAYEqffzWaLCQPZS
         YsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696515092; x=1697119892;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dfyCZicpPduaIx/4ZNTvtfLRdO9R8uKzkarzy6IJm4c=;
        b=gu4wE+VbM3DyNmadbMUkHl5NZ6spIfUIRwYEL0mPh8MXJvNbhWGUq6cP+b9OonWrhL
         VJCSYHppfeZWrQSO3b0gp8D5jYow7wI9EEFVHWWBbOPBiAzeHanyR+w2w99tFjSXZSh4
         uCtzLPxgucagaRr4Pfw7PobogifobE1/FQr2BFd5BCdNdtbnG7lJr2X3XisZQwd2D054
         G1Vsk2iEBNvu4vtoYCLbf5gw3Pi510GgnKub2jU3lxowmG+RDP6iZnXywvk2H8luZYet
         Lz+FbtWiu/Omt5UqLmCd6H+D3GP+uUWcXmoekDoS8Q1JMIDiJHkDbDa7qfgWjal5xpGZ
         AYRw==
X-Gm-Message-State: AOJu0Ywb3MN9P637p789GpZvaNENoKpxJ29YF+WK4ZTNwZZUGDSavxys
	ZEp/pMuxpV/dpqGihVXzVMI6rw==
X-Google-Smtp-Source: AGHT+IED3P0nhBEdVfCNGxW2rOuewtYM1y/1GYFce7OMG9W1wQ0DevjNF0SEsnhghT77fD5h29wY6w==
X-Received: by 2002:a17:907:7818:b0:9a1:ddb9:6546 with SMTP id la24-20020a170907781800b009a1ddb96546mr4735298ejc.61.1696515092304;
        Thu, 05 Oct 2023 07:11:32 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.123])
        by smtp.gmail.com with ESMTPSA id s10-20020a170906354a00b0099bd1ce18fesm1296034eja.10.2023.10.05.07.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 07:11:31 -0700 (PDT)
Message-ID: <b705c36c-1d76-45a4-ab8e-dacdcb844509@linaro.org>
Date: Thu, 5 Oct 2023 15:11:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] mtd: spi-nor: Add manufacturer read id function
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Pratyush Yadav <pratyush@kernel.org>, Jaime Liao
 <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
 <20230908064304.27757-2-jaimeliao.tw@gmail.com>
 <b998ea18-8ce9-83b0-f42f-18e5ea08175b@linaro.org>
 <mafs034yppc28.fsf@kernel.org> <f60995d3d02d7639204c2c16abf9bfd7@walle.cc>
 <54e5662f-baf4-4660-9fc4-7959d2405120@linaro.org>
 <29bb3d952b9f49961da5e01cf86f9c4f@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <29bb3d952b9f49961da5e01cf86f9c4f@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_071134_859604_58AD3375 
X-CRM114-Status: GOOD (  22.92  )
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

CgpPbiAxMC81LzIzIDE0OjI3LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjMtMTAtMDUg
MTU6MTksIHNjaHJpZWIgVHVkb3IgQW1iYXJ1czoKPj4gT24gMTAvNS8yMyAxMjo0MywgTWljaGFl
bCBXYWxsZSB3cm90ZToKPj4+IEhpLAo+Pj4KPj4gaGV5Cj4+Cj4+Pj4+IEkgc2VlIHRoaXMgZmxh
c2ggc3VwcG9ydHMgMS0xLTEsIDgtOC04LCBhbmQgOGQtOGQtOGQsIHRoZXJlIGFyZSBubwo+Pj4+
PiBtaXhlZAo+Pj4+PiBtb2RlcyBzdXBwb3J0ZWQsIHRodXMgYSA4ZC04ZC04cyBtb2RlIHNlZW1z
IGp1c3QgbGlrZSBhIGhhcmR3YXJlCj4+Pj4+IGJ1ZyB0bwo+Pj4+PiBtZS4gU28gbXkgcHJvcG9z
YWwgaXMgdG8gbGVhdmUgdGhlIGNvcmUgYXdheSBhbmQgdG8gaGFuZGxlIHRoZSByZWFkIGlkCj4+
Pj4+IGhhY2sganVzdCBpbiB0aGUgbWFjcm9uaXggZHJpdmVyLgo+Pj4+Cj4+Pj4gKzEKPj4+Cj4+
PiBJJ3ZlIGxvb2tlZCBhdCB0aGUgeHNwaSBzcGVjLiBUaGVyZSBpcyBubyBSRElEIHNwZWNpZmll
ZC4gU28gSSdkIGFyZ3VlLAo+Pj4gdGhlIG9ubHkgcHNldWRvIHN0YW5kYXJkIGlzIHRoYXQgUkRJ
RCB3YXMgb25seSBldmVyIHVzZWQgd2l0aCAxczFzMXMuCj4+PiBCdXQKPj4+IHdlIGFkZGVkIHNw
aV9ub3JfcmVhZF9pZCgpIHdpdGggcGFyYW1ldGVycyBzdWl0ZWQgZm9yIHRoZSAidW51c3VhbCIK
Pj4+IDhkOGQ4ZAo+Pj4gY2FzZSB3aXRoIGFkZGl0aW9uYWwgYWRkcmVzcyBhbmQgZHVtbXkgY3lj
bGVzLiBKdXN0IGZvciBjaGVja2luZyB3aGV0aGVyCj4+PiB0aGUKPj4+IG9jdGFsLWR0ciBzd2l0
Y2ggd2FzIHN1Y2Nlc3NmdWwuIFRoZXJlZm9yZSwgd2UndmUgYWxyZWFkeSBhZGRlZAo+Pj4gcGFy
YW1ldGVycyB0bwo+Pj4gc3BpX25vcl9yZWFkX2lkKCkgd2hpY2ggYXJlIG5vdCBzdGFuZGFyZC4g
VGhlbiB3ZSBjYW4ganVzdCBhZGQgb25lIG1vcmUuCj4+PiBJdCdzCj4+PiBqdXN0IGhvdyBtYWNy
b25peCBpcyBkb2luZyBpdC4gQWdhaW4gdGhlcmUgaXMgbm8gc3RhbmRhcmQuCj4+PiBJZiB3ZSdk
IG9ubHkgcHV0IHN0YW5kYXJkIChvciBmb3IgdGhlIDlGIHBzZXVkbyBzdGFuZGFyZCkgdGhpbmdz
IGluIHRoZQo+Pj4gY29yZSwKPj4+IHRoZW4gc3BpX25vcl9yZWFkX2lkKCkgd291bGQgbmVlZCB0
byBjaGVjayB3aGV0aGVyIHRoZSBmbGFzaCBpcyBpbgo+Pj4gMXMxczFzCj4+PiBtb2RlLiBBbmQg
bm8gSSB3b3VsZG4ndCBwcmVmZXIgdGhhdCA7KQo+Pj4KPj4KPj4gSWYgd2UgcmVhbGx5IHdhbnQg
dG8gYmUgY2F0aG9saWMsIHdlIHNob3VsZCBzd2l0Y2ggdG8gOGQtOGQtOHMgbW9kZSBhbmQKPj4g
dGhlbiBpc3N1ZSB0aGUgcmVhZCBpZCBhbmQgdGhlIGNvcmUgd2lsbCBoYW5kbGUgdGhlIHJlYWRp
ZCBjb3JyZWN0bHkuCj4+IEJ1dCB0aGVyZSBpcyBubyBzdWNoIGEgdGhpbmcsIGJlY2F1c2UgbWFj
cm9uaXggY29uc2lkZXJzIHRoYXQgaXQgaXMgaW4KPj4gOGQtOGQtOGQgbW9kZSBhdCB0aGUgdGlt
ZSBvZiBpc3N1aW5nIDhkLThkLThzIHJlYWQgaWQuIFRoYXQncyB3aHkgSSBzYXkKPj4gaXQncyBh
IGJ1ZyBvbiB0aGVpciBzaWRlLiBUaGUgY29yZSBpcyBtZWFudCB0byBiZSBnZW5lcmljLCBJIGRv
bid0IHdhbnQKPj4gdG8gcG9sbHV0ZSB0aGUgY29yZSB3aXRoIG1hbnVmYWN0dXJlciBzcGVjaWZp
YyBmaXhlcy4KPiAKPiBUaGVuIHdoeSBkb2VzIHNwaV9ub3JfcmVhZF9pZCgpIGhhdmUgdGhlIGZv
bGxvd2luZyBwYXJhbWV0ZXJzOgo+IAo+IMKgKiBAbmFkZHI6wqDCoMKgwqDCoCBudW1iZXIgb2Yg
YWRkcmVzcyBieXRlcyB0byBzZW5kLiBDYW4gYmUgemVybyBpZiB0aGUKPiBvcGVyYXRpb24KPiDC
oCrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkb2VzIG5vdCBuZWVkIHRvIHNlbmQgYW4gYWRk
cmVzcy4KPiDCoCogQG5kdW1teTrCoMKgwqDCoCBudW1iZXIgb2YgZHVtbXkgYnl0ZXMgdG8gc2Vu
ZCBhZnRlciBhbiBvcGNvZGUgb3IKPiBhZGRyZXNzLiBDYW4KPiDCoCrCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBiZSB6ZXJvIGlmIHRoZSBvcGVyYXRpb24gZG9lcyBub3QgcmVxdWlyZSBkdW1t
eSBieXRlcy4KPiDCoCogQHByb3RvOsKgwqDCoMKgwqAgdGhlIFNQSSBwcm90b2NvbCBmb3IgcmVn
aXN0ZXIgb3BlcmF0aW9uLgo+IAo+IFRoZXkgYXJlbid0IHN0YW5kYXJkIGVpdGhlci4gSXQncyBq
dXN0IHRoZSB3YXkgc3BhbnNpb24gYW5kIG1pY3Jvbgo+IHRyYW5zZmVycwo+IHRoZSBJRCB2aWEg
UkRJRCBpbiBvY3RhbCBEVFIgbW9kZS4gQW5kIG5vdyB0aGVyZSdzIG1hY3Jvbml4IHdobyBkb2Vz
IGl0Cj4gc2xpZ2h0bHkKPiBkaWZmZXJlbnQuIEJ1dCAqbmVpdGhlciogb2YgdGhlbSBhcmUgc3Rh
bmRhcmQuIFdoeSBzaG91bGQgb25lIGJlIGluIHRoZQo+IGNvcmUgYW5kCj4gb25lIHNob3VsZG4n
dC4KPiAKPiBzcGlfbm9yX3JlYWRfaWQoKSBzaG91bGQganVzdCBoYW5kbGUgcHJvdG8gPT0gU05P
Ul9QUk9UT184RF84RF84Uy4KClllcywgaXQgc2hvdWxkLCBidXQgbXggaXMgaW4gOGQtOGQtOGQg
YXQgdGhlIHRpbWUgaXQgaXNzdWVzIHRoZSByZWFkIGlkLAp0aHVzIGl0IHBhc3NlcyB0aGUgY29y
ZSBwcm90byA9PSBTTk9SX1BST1RPXzhEXzhEXzhELCBpc24ndCBpdD8gSWYgeW91CmNhcmUgYWJv
dXQgdGhpcywgcGxlYXNlIHNlbmQgYSBwYXRjaCBhZGRyZXNzaW5nIGl0LCBpdCdzIGJldHRlciB0
byB0YWxrCm9uIGNvZGUuIEkgZG9uJ3Qgc2VlIHlldCBob3cgeW91IHdpbGwgaGFuZGxlIGl0LCBi
dXQgSSdtIG9wZW4gdG8gcmV2aWV3CnNvbWUgY29kZS4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
