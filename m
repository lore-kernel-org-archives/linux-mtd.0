Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0891EC3DA6E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 08:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KbXCtoGMoZWaImACDmXeKbg5xFVuyyWYGVMiGtb5JdE=; b=c2QDL/fc1i0Qaa
	a6IkXYWwU93xDp5cQrgg1ajIsZLR81FY1rC46K4eg8vezqmYamjtucxmKcvUnvscJbzgQSuILVDZG
	2mfH3QeA4NxSlz4sBuI1OP+NJPt/g3IvzwS9aNsIRwWOVAinCjdJc0bItHFBO7DV6hGZoEfdVD4gR
	7IJpOfkGDhN0H79csRXS40w37YPrcBbOux4V9rRzcvVpYxQZk0QZKYd02LQ0Q+yYIQNcvmgMtaV0g
	F0ciiW8JtAdLgYzC3QZIciPrkHHtXjAxheke6XAaKV5if0r45GrAlbCyL2OVXmpLZpjbJkUDFiiLo
	eon7OeMGqJuHf1bzsIyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsPQ-00GfBe-2l;
	Wed, 20 Dec 2023 08:58:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsPN-00GfAf-3B
	for linux-mtd@lists.infradead.org;
	Wed, 20 Dec 2023 08:58:31 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c29f7b068so59473315e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 20 Dec 2023 00:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703062708; x=1703667508; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kwHvx5TkRsQHNLYiVHPKHcJHach0uIyj+IC7wFY9Zrw=;
        b=VYdkwT6xESg+evdmqEw2ptFSpzPjjgQx2fRCKl7++COyjvqjPX9q80OBlmtEKBDR9V
         eFHBosA/p+eUC5kZUdcUNg+juEVzS+Ahy9iuE6kEF8NkmYGI+Uo48gVqVauJ7FOtpp7S
         Vm+xHAYPu1f9cLtRi6olIvuQmw4SrzG6ihIr2+pjCDuFsvwaZoIX/mZIOPfMiTo4IBcf
         s/JkvswKey96FrQkQSt/AbIGHCekmqoxDZ0H1LqC3mwN8Zz+7IacciIXWdRaohZkX6V/
         3b8lqTB+eRoS9hutVnUMEV5nTSHU8rdku14RcJCjKw9FGnRck9+dC4v6ek0/TV3cqgZo
         ROyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703062708; x=1703667508;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kwHvx5TkRsQHNLYiVHPKHcJHach0uIyj+IC7wFY9Zrw=;
        b=afrK8QvHncZMm87JDUzVYkmKL6KL42C1NEtRQ1k93vn+wbBlURxrU5MVUB9nr+8VHV
         xNQ+UisWikM7+i+XgpEbqyHgDtRk+X33HeWgh2CxnNc9zLlQXV72QB1dGpTDA6US127O
         I9IlqZQjk3Yo1o+2InMoYg39T19xn/xuStLmYspo9XaoQJHqvjXBvNsiHK71ieHiYJ3M
         +Uajmgs6V9TFh5yfO9+ZrBRj6Xgl9PEQhSw4OqlYDb9GlK6r1hWr1p//+vtZnUNm9NyY
         t/lywzAgsASXc+k1pc/EdZgQ1/Z9PHa4qs1ELKuCpWmRDoYN65MFDkYVMTLRc0ZyfVBI
         kE0w==
X-Gm-Message-State: AOJu0YwWG5fvJCV161/qUK6x8s4/5jqOnpr0TVv+NFI6dCXngGfP2BB5
	DPa9rNmRy1Sh9vW5MxwTSHNsHQ==
X-Google-Smtp-Source: AGHT+IECmXpIKRGiqWUYMe5YpK74jXWxPctXT3Sixgclpd0cRovsyDcW3YgALiqdkPrrAANK6siCQA==
X-Received: by 2002:a05:600c:3d09:b0:40d:3327:2bfa with SMTP id bh9-20020a05600c3d0900b0040d33272bfamr470305wmb.161.1703062707822;
        Wed, 20 Dec 2023 00:58:27 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id bh20-20020a05600c3d1400b0040d15dcb77asm6480064wmb.23.2023.12.20.00.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 00:58:27 -0800 (PST)
Message-ID: <ae720ccc-3e37-43f4-94ba-a5441d70f186@linaro.org>
Date: Wed, 20 Dec 2023 10:58:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: core: Discard HW capabilities if no
 enable function
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
References: <20231219102103.92738-1-jaimeliao.tw@gmail.com>
 <43eac7ba-1648-4e99-80b8-3132523189c7@linaro.org>
 <0b3aa661e5151aba8e32633e709fdbdc@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <0b3aa661e5151aba8e32633e709fdbdc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_005830_023461_EF6EEAA1 
X-CRM114-Status: GOOD (  18.04  )
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

CgpPbiAyMC4xMi4yMDIzIDEwOjUwLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjMtMTIt
MjAgMDk6MjAsIHNjaHJpZWIgVHVkb3IgQW1iYXJ1czoKPj4gT24gMTkuMTIuMjAyMyAxMjoyMSwg
SmFpbWUgTGlhbyB3cm90ZToKPj4+IEZyb206IEphaW1lTGlhbyA8amFpbWVsaWFvQG14aWMuY29t
LnR3Pgo+Pj4KPj4+IERpc2NhcmQgY29ycmVzcG9uZGluZyBIVyBjYXBhYmlsaXRpZXMgdG8gcHJl
dmVudCBjYXJyeWluZyB0aGUKPj4+IHdyb25nIHByb3RvY29sIGlmIG5vIFFVQUQvT2N0YWwgRFRS
IGVuYWJsZSBmdW5jdGlvbiBob29rZWQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFpbWVMaWFv
IDxqYWltZWxpYW9AbXhpYy5jb20udHc+Cj4+PiAtLS0KPj4+IGNoYW5nZXMgaW4gdjIKPj4+IMKg
LSBBZGQgU05PUl9IV0NBUFNfOF84XzhfRFRSCj4+PiDCoC0gUmVzdG9yZSB0aGUgZW5hYmxlIGZ1
bmN0aW9uIGp1ZGdlbWVudCBpbiBzcGlfbm9yX3NldF9vY3RhbF9kdHIoKQo+Pj4gwqAtIFJlc3Rv
cmUgdGhlIGVuYWJsZSBmdW5jdGlvbiBqdWRnZW1lbnQgaW4gc3BpX25vcl9xdWFkX2VuYWJsZSgp
Cj4+PiAtLS0KPj4+IMKgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmPCoCB8IDcgKysrKysrKwo+
Pj4gwqBpbmNsdWRlL2xpbnV4L210ZC9zcGktbm9yLmggfCA2ICsrKysrKwo+Pj4gwqAyIGZpbGVz
IGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+Pj4gaW5kZXgg
MWM0NDNmZTU2OGNmLi4xNDM1OTEwMWM2Y2YgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL210ZC9z
cGktbm9yL2NvcmUuYwo+Pj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPj4+IEBA
IC0yNjIxLDYgKzI2MjEsMTMgQEAgc3RhdGljIGludCBzcGlfbm9yX2RlZmF1bHRfc2V0dXAoc3Ry
dWN0Cj4+PiBzcGlfbm9yICpub3IsCj4+PiDCoMKgwqDCoMKgICovCj4+PiDCoMKgwqDCoCBzaGFy
ZWRfbWFzayA9IGh3Y2Fwcy0+bWFzayAmIHBhcmFtcy0+aHdjYXBzLm1hc2s7Cj4+Pgo+Pj4gK8Kg
wqDCoCAvKiBNYXNrIG91dCBPY3RhbCBEVFIgaWYgbm8gZW5hYmxlIGZ1bmN0aW9uICovCj4+PiAr
wqDCoMKgIGlmICghcGFyYW1zLT5zZXRfb2N0YWxfZHRyKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHNo
YXJlZF9tYXNrICY9IH5TTk9SX0hXQ0FQU184XzhfOF9EVFI7Cj4+PiArCj4+PiArwqDCoMKgIGlm
ICghcGFyYW1zLT5xdWFkX2VuYWJsZSkKPj4+ICvCoMKgwqDCoMKgwqDCoCBzaGFyZWRfbWFzayAm
PSB+U05PUl9IV0NBUFNfNF80XzQ7Cj4+Cj4+IGFuZCB0aGVzZSBzaG91bGQgaGF2ZSBiZWVuIGlu
IHRoZSBsYXRlIGluaXQgaG9vaywgYW5kIGluc3RlYWQgZGlzY2FyZAo+PiB0aGVtIGZyb20gdGhl
IHBhcmFtcy0+aHdjYXBzLm1hc2suCj4gCj4gTWF5YmUgdGhlcmUgaXMgYSBiZXR0ZXIgcGxhY2Ug
dG8gbWFzayB0aGVzZSBiaXRzLiBCdXQgSU1ITyB0aGUgY29yZQo+IHNob3VsZCBkbyBpdCBvbiBp
dHNlbGYgYW5kIHdlIHNob3VsZG4ndCBuZWVkIHRvIHByb3ZpZGUgYW4gZXh0cmEKPiBob29rIGZ1
bmN0aW9uIGZvciBldmVyeSBkcml2ZXIgb3Vyc2VsdmVzLiBUaGUgY29yZSBrbm93cyB0aGF0IHRo
ZXJlCj4gaXMgbm8gLm9jdGFsX2VuYWJsZSBvcCBhbmQgdGh1cyBpdCBzaG91bGRuJ3QgZXZlbiB0
cnkgdG8gZW5hYmxlCj4gdGhpcyBtb2RlLgoKSSBtZWFudCBpbiB0aGUgY29yZSwgYXQgdGhlIGVu
ZCBvZiB0aGUgbGF0ZV9pbml0X3BhcmFtcygpLiBIZXJlOgpodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0L3RyZWUvZHJpdmVycy9tdGQv
c3BpLW5vci9jb3JlLmM/aD1zcGktbm9yL25leHQjbjI5NjIKPiAKPj4gQW5kIHdoeSBpcyB0aGlz
IGV4dHJhIGNoZWNrIG5lZWRlZCBpbiB0aGUgZmlyc3QgcGxhY2U/IEZvciBvY3RhbCBJCj4+IGFz
c3VtZSBpdCdzIG5lZWRlZCBieSBtYWNyb25peCwgd2hlcmUgdGhlIGZsYXNoIGlzIG9jdGFsIGNh
cGFibGUsIGJ1dAo+PiB0aGVyZSdzIG5vIG9jdGFsIGVuYWJsZSBtZXRob2QgZGVmaW5lZCB5ZXQu
Cj4gCj4gQmVjYXVzZSBpdCBpcyB0aGUgZ2VuZXJpYyBzcGkgbm9yIGZsYXNoIGRyaXZlciwgd2hp
Y2ggZG9lc24ndCBwcm92aWRlCj4gYW55IG9mIHRoZXNlIGVuYWJsZSB4LW1vZGUgaGVscGVycy4K
CnJpZ2h0LCB0aGF0IHdhcyBteSBndWVzcyB0b28uIFRoZSBjb21taXQgbWVzc2FnZSBoYXMgdG8g
YmUgdXBkYXRlZC4KPiAKPj4gV2hhdCBhYm91dCB0aGUgcXVhZCBtb2RlPyBJcwo+PiB0aGVyZSBh
bnkgZmxhc2ggdGhhdCBoYXMgbm8gcXVhZCBlbmFibGUgbWV0aG9kIGRlZmluZWQgYnV0IHN0aWxs
IGNhcmllcwo+PiBxdWFkIG1vZGUgaW4gaXRzIGh3Y2Fwcz8KPiAKPiBObyBpdCBpcyBmb3IgY29t
cGxldGVuZXNzIGFuZCBjb3JyZWN0bmVzcy4gQXQgdGhlIG1vbWVudCB3ZSBhcmUgYWx3YXlzCj4g
c2V0dGluZyBhIChyYW5kb20pIGRlZmF1bHQgcXVhZCBlbmFibGUgb3AsIGR1ZSB0byBsZWdhY3kg
cmVhc29ucy4KPiAKClN0aWxsLCB0aGUgY29tbWl0IG1lc3NhZ2Ugc2hhbGwgaW5kaWNhdGUgdGhp
cy4gQ2FuJ3QgYWRkIGV4dHJhIGNoZWNrcwpvdXQgb2YgdGhlIGJsdWUuIEVzcGVjaWFsbHkgc2lu
Y2Ugbm9ib2R5IGlzIGFmZmVjdGVkLgoKQ2hlZXJzLAp0YQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
