Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34F4C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Mar 2022 15:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2GerJ42UNhOHgwnAnQ2xV1W5n6XqQyozoI3FHLPFnMM=; b=JRMAtZM5m3rtFI
	S2AoSttetwPtHorZIU28gzTn/ms9i7jvTxpSgbvfoWLVyW2v07y1w3Se8j00A5GyuoEKNlj58eQjN
	Xb0q6toSWHv2846U5Zjh3hkgBtp7LZHddM2N5AWGDbk+cB5pyAJBUj1YYltXd6gQmgop4ko1WgF52
	krhNCrZSkb1hUv8pN98+yh4LqcOP8DhCwS9Wvm6bosdGJ4peAvvYOPTh+E+r+/uZgm4FqrA+93inO
	mlwkKRV83MIWGNicFrZgBXDlYZAL7EgkPxftYFUj54WjAIdy0mesYMIJxEeAdUYjmTbO92FHZM3u5
	huAHBNcRIUgcKIBvAjsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUW1H-00DfXA-GU; Wed, 16 Mar 2022 15:57:03 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUW0z-00DfPM-CS
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2022 15:56:46 +0000
Received: by mail-pf1-x42d.google.com with SMTP id u17so4293924pfk.11
 for <linux-mtd@lists.infradead.org>; Wed, 16 Mar 2022 08:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UEzxOViZQI75VVubEQEJ0vAhzIXYDxDnem7jpF0IdD4=;
 b=TfADhIX6PMLLADAPhw3yiyY95pxaTIlW8jxTbJjEjggdpQj66Dj8jZdZNR0m65+9Ac
 qn6mkB6PEJ+rnFc8tINBpzTBysw7m5yXR57Nu/OJaIwS49/NMWxD7wsaqxzKniN+Qs9o
 8K8Uv7lWhDVRnD4126SrjiCUV5SAfAvAGdNV2BDVTvBv8QUPf0PHumYsosmsuKdlrmuy
 KmBzp/Am+eEEiYH3y6jlKy2TPRQS1Yyv05qQeEy4Py3KMn2xQhpd7OKv1qB6o/Nno0nO
 tfFqzXLdmoaa4/5/cI8TolDaQblC3A2YFELsEWA/iWBg8hVRGDHiKvlW/1LFcIS2fFKD
 KOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UEzxOViZQI75VVubEQEJ0vAhzIXYDxDnem7jpF0IdD4=;
 b=c1v2pBKR8EYJaEmeErdtEs8Lih0fh/6Vmv1uqWmnvNYdKsvVURQ7Y57fUTS25wpVUz
 1jLE7zPnk86rpSibrGYJjWwTesQTrNjFivwTN5kI1552Vpxk+hSTmV5TzxpXNlB5kGdO
 EF57H6UAWWJJ10SWm+wUJZJvEsaGaf0YrsGg1knUy9ewuvCFaDcdbULACDPtktJNH9th
 UZggh9ITXohfmAUk5Vt7fnCMwNkXnGQyLpnhzGuOUQaCLHS+KXEzZAvjCaG9B4vACr7Y
 tERbmxUwJayLTR9o1OfE8kiTlv+648XnfrwpQdkTBH0IWqFePl3HEBBLFgauYZtOHIs1
 Fbug==
X-Gm-Message-State: AOAM531+LBlaa9BVGk1nyq+8sd4XciYv7Hjl/YGrmEwVJ/NJDjVcKcNu
 mALXhH2FqyTxgBFtuocRwlc=
X-Google-Smtp-Source: ABdhPJylaUqjObL+v6ILDSxtTEK1B1SyHP6hMaCj80OX/OTVf6KnNwqgZQBtzDv4+hyfYpNazZgBNQ==
X-Received: by 2002:a05:6a00:789:b0:4f6:ebd9:7 with SMTP id
 g9-20020a056a00078900b004f6ebd90007mr222633pfu.32.1647446204303; 
 Wed, 16 Mar 2022 08:56:44 -0700 (PDT)
Received: from ?IPV6:240b:10:2720:5500:9500:ad27:b03f:5499?
 ([240b:10:2720:5500:9500:ad27:b03f:5499])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a17090a02d700b001bf6ef9daafsm3027667pjd.38.2022.03.16.08.56.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 08:56:44 -0700 (PDT)
Message-ID: <7d0718b0-d6a8-4e2d-4e1a-b149ea929e60@gmail.com>
Date: Thu, 17 Mar 2022 00:56:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/3] mtd: cfi_cmdset_0002: Add S29GL064N ID definition
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20220315165607.390070-1-ikegami.t@gmail.com>
 <20220315165607.390070-2-ikegami.t@gmail.com> <20220315193740.23284a20@xps13>
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <20220315193740.23284a20@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_085645_494523_A00C2F57 
X-CRM114-Status: GOOD (  17.84  )
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

SGksCgpPbiAyMDIyLzAzLzE2IDM6MzcsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgVG9rdW5v
cmksCj4KPiBpa2VnYW1pLnRAZ21haWwuY29tIHdyb3RlIG9uIFdlZCwgMTYgTWFyIDIwMjIgMDE6
NTY6MDUgKzA5MDA6Cj4KPj4gSXQgaXMgZm9yIHRoZSBtb2RlbCBudW1iZXIgMDEsIDAyLCBWMSBh
bmQgVjIuCj4gUGxlYXNlIG1vdmUgdGhpcyBjaGFuZ2UgdG8gdGhlIGVuZCBvZiB0aGUgc2VyaWVz
LiBXZSBkbyBub3QgbmVlZCB0bwo+IGJhY2twb3J0IHRoaXMgaW1wcm92ZW1lbnQuCj4KPiBBbHNv
IHVzZSB0aGUgaGV4YWRlY2ltYWwgdmFsdWUgaW4geW91ciBmaXggKHBhdGNoIDMvMykgc28gdGhh
dCB3ZSBjYW4KPiBhcHBseSBpdCBlYXNpbHkgdG8gb2xkZXIga2VybmVscy4KCkZpeGVkIGJ5IHRo
ZSB2ZXJzaW9uIDQgcGF0Y2hlcy4KClJlZ2FyZHMsCklrZWdhbWkKCj4KPj4gU2lnbmVkLW9mZi1i
eTogVG9rdW5vcmkgSWtlZ2FtaSA8aWtlZ2FtaS50QGdtYWlsLmNvbT4KPj4gQ2M6IE1pcXVlbCBS
YXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4+IENjOiBSaWNoYXJkIFdlaW5iZXJn
ZXIgPHJpY2hhcmRAbm9kLmF0Pgo+PiBDYzogVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJA
dGkuY29tPgo+PiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gLS0tCj4+ICAg
ZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMgfCAzICsrLQo+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jIGIvZHJpdmVycy9tdGQvY2hpcHMv
Y2ZpX2NtZHNldF8wMDAyLmMKPj4gaW5kZXggYTc2MTEzNGZkM2JlLi4wMTI1NjU4YTFkMzAgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4+ICsrKyBi
L2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4+IEBAIC00OCw2ICs0OCw3IEBA
Cj4+ICAgI2RlZmluZSBTU1Q0OUxGMDQwQgkJMHgwMDUwCj4+ICAgI2RlZmluZSBTU1Q0OUxGMDA4
QQkJMHgwMDVhCj4+ICAgI2RlZmluZSBBVDQ5QlY2NDE2CQkweDAwZDYKPj4gKyNkZWZpbmUgUzI5
R0wwNjROX01OMTIJCTB4MGMwMQo+PiAgIAo+PiAgIC8qCj4+ICAgICogU3RhdHVzIFJlZ2lzdGVy
IGJpdCBkZXNjcmlwdGlvbi4gVXNlZCBieSBmbGFzaCBkZXZpY2VzIHRoYXQgZG9uJ3QKPj4gQEAg
LTQ2Miw3ICs0NjMsNyBAQCBzdGF0aWMgc3RydWN0IGNmaV9maXh1cCBjZmlfZml4dXBfdGFibGVb
XSA9IHsKPj4gICAJeyBDRklfTUZSX0FNRCwgMHgwMDU2LCBmaXh1cF91c2Vfc2Vjc2kgfSwKPj4g
ICAJeyBDRklfTUZSX0FNRCwgMHgwMDVDLCBmaXh1cF91c2Vfc2Vjc2kgfSwKPj4gICAJeyBDRklf
TUZSX0FNRCwgMHgwMDVGLCBmaXh1cF91c2Vfc2Vjc2kgfSwKPj4gLQl7IENGSV9NRlJfQU1ELCAw
eDBjMDEsIGZpeHVwX3MyOWdsMDY0bl9zZWN0b3JzIH0sCj4+ICsJeyBDRklfTUZSX0FNRCwgUzI5
R0wwNjROX01OMTIsIGZpeHVwX3MyOWdsMDY0bl9zZWN0b3JzIH0sCj4+ICAgCXsgQ0ZJX01GUl9B
TUQsIDB4MTMwMSwgZml4dXBfczI5Z2wwNjRuX3NlY3RvcnMgfSwKPj4gICAJeyBDRklfTUZSX0FN
RCwgMHgxYTAwLCBmaXh1cF9zMjlnbDAzMm5fc2VjdG9ycyB9LAo+PiAgIAl7IENGSV9NRlJfQU1E
LCAweDFhMDEsIGZpeHVwX3MyOWdsMDMybl9zZWN0b3JzIH0sCj4KPiBUaGFua3MsCj4gTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
