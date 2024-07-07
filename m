Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA84EC38150
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Jul 2024 14:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BWdPFGNERsUy5pptNuq6nR6uy7sBWOcgf3lwmy/YlMo=; b=Qdi/nTJpnf1576
	ko7+OjdZzCBjDSKkS8KceMsB68V3b4p7G4BHEmJdQ+8k2dseELGI8uEbvwDSXQfhzBAUHTJMjPkGp
	ER+ys5NPjFQEe7WYt842vMxxajSAB9DZz7Rbuv7Pu0wIL3FSBVh3f8Q9dU87xTo7UXy7mpErtrUOm
	Fe3adoEVp5ApSBTLNlUFGlG2aTNAh3R4/YjWoHDbcCa3TPNFyGZDFXK/gMcWaZ8Vv3eVydv3VJo/B
	dccDtQDw+vyM6nupR6MT7Bk5mPADIVSJgL+GgdNUIf9YpKHJkKZRojxJ2vWdSHWzt3UI+6EQtNaZK
	nWsG1xQsfFXGpXP5TgTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQSaK-00000001r1F-0BHL;
	Sun, 07 Jul 2024 14:09:48 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQSaH-00000001r0g-02tS
	for linux-mtd@lists.infradead.org;
	Sun, 07 Jul 2024 14:09:46 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a77cc44f8aaso111908766b.3
        for <linux-mtd@lists.infradead.org>; Sun, 07 Jul 2024 07:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720361383; x=1720966183; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W9ZekFg0P3GM8MHpqFlzQHu8Ld3um8orszUxX9Yi27k=;
        b=kYonIRRb4AtpCIrQgnj6Tlga3KJ/z1kon36WV+RLsio5N7svX88ICRoBAGXu0JtDrV
         uU+fiHN2vZSALgbRhfY0OtzsFyucFlS1tfM51pxeq53JQuw3hwbACtqJngJFKUwgndVC
         4zHihPmZc279uNQ9XCOdrzOxU3/CQhQCsxBDu6+ucbMZZbgYKY4BSiz6m71eAMvQQY5m
         YvGOf96Z9+0LRm6Xnn/A9qsTQUO/QuIcdKJ5/KGRmq/lh1Wzh2PORfpVJSxNWRUo1shS
         g+wr0KaxP2+kvtOqLtuoNjjqGIOSqjYvD4oqUYS5rMDYZGeppW5TA5Vw2nJ8d43g5qxE
         3Wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720361383; x=1720966183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W9ZekFg0P3GM8MHpqFlzQHu8Ld3um8orszUxX9Yi27k=;
        b=JcET4S1yDhO6bWEpMyO7YE0zPmvM52klDP5OWyZbhaGiNCC2anS5I/yBsysYqhIIsv
         ztVsC300mpMRu/XvhF4q0Cc0G4yGfuIsQCdGFBXTqSewKjaeQzA7rwYjKf/da8e5L/ct
         sOJpRxLmGcJbwGojYFngg46jTF062P01ZMqhb4xbXQUyO1AZ7QIKrmz2NTPDiN+xiIa+
         d/v+W8Mw2snU1J/NKgtR7p4Fv/8yrj6VOSUiEW0eUsaFtVifRuqtsRVjEeQA4R2QTpLj
         q4Qpj1NwZem2bmop6OHaWBj9tEUc0DNjON+c6Gllrnkv7FxD3bNWjAaS8tpbmWKDPZMJ
         9D9w==
X-Gm-Message-State: AOJu0YycKVF6rVwEdyQUL8KURtTB/cwxpTtDiUoz5vF7M2PYxBiKJB8Q
	qsmMe2t5loVD6nOXUMjb5ZlbsOSdM+/VaekhW3J26nSWYa7OdhVX
X-Google-Smtp-Source: AGHT+IHnKVoMwg2WNbrh/UEoUMzdUm208qNxBURO6gjT09IeRByg0iHpbDppLtHHTfUDSlNargGf5w==
X-Received: by 2002:a05:6402:3590:b0:57c:5874:4f5c with SMTP id 4fb4d7f45d1cf-58e5b898d67mr8749965a12.32.1720361382518;
        Sun, 07 Jul 2024 07:09:42 -0700 (PDT)
Received: from [192.168.178.20] (dh207-40-28.xnet.hr. [88.207.40.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861381868csm11712149a12.55.2024.07.07.07.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jul 2024 07:09:42 -0700 (PDT)
Message-ID: <f9818a25-0604-49a8-af06-3dc7de006377@gmail.com>
Date: Sun, 7 Jul 2024 16:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PROBLEM linux-next]
To: Jonas Gorski <jonas.gorski@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <47e0483d-6e3d-43a8-9273-25278a4a74b9@gmail.com>
 <0c095098-4b3e-481b-b866-29cacb9f165d@milecki.pl>
 <CAOiHx=nmcf1mRy_i9vUDNtqOZTQ=PFWY8MGEV1FZfgt=GHqj5A@mail.gmail.com>
Content-Language: en-US
From: Mirsad Todorovac <mtodorovac69@gmail.com>
In-Reply-To: <CAOiHx=nmcf1mRy_i9vUDNtqOZTQ=PFWY8MGEV1FZfgt=GHqj5A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_070945_079556_F85409C6 
X-CRM114-Status: GOOD (  16.92  )
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

CgpPbiA3LzcvMjQgMTA6MTIsIEpvbmFzIEdvcnNraSB3cm90ZToKPiBPbiBTdW4sIDcgSnVsIDIw
MjQgYXQgMDk6MzgsIFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4gd3JvdGU6Cj4+
Cj4+IFNvbWUgbW9yZSBkZXNjcmlwdGl2ZSBzdWJqZWN0IHdvdWxkIGJlIG5pY2UgOikKPj4KPj4K
Pj4gT24gNy4wNy4yMDI0IDAyOjEwLCBNaXJzYWQgVG9kb3JvdmFjIHdyb3RlOgo+Pj4gSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIC4vaW5jbHVkZS9hc20tZ2VuZXJpYy9idWcuaDoyMiwKPj4+ICAgICAg
ICAgICAgICAgICAgIGZyb20gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9idWcuaDo4NywKPj4+ICAg
ICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L2J1Zy5oOjUsCj4+PiAgICAgICAg
ICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9mb3J0aWZ5LXN0cmluZy5oOjYsCj4+PiAg
ICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9zdHJpbmcuaDozNzQsCj4+PiAg
ICAgICAgICAgICAgICAgICBmcm9tIC4vYXJjaC94ODYvaW5jbHVkZS9hc20vcGFnZV8zMi5oOjE4
LAo+Pj4gICAgICAgICAgICAgICAgICAgZnJvbSAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BhZ2Uu
aDoxNCwKPj4+ICAgICAgICAgICAgICAgICAgIGZyb20gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9w
cm9jZXNzb3IuaDoyMCwKPj4+ICAgICAgICAgICAgICAgICAgIGZyb20gLi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS90aW1leC5oOjUsCj4+PiAgICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9s
aW51eC90aW1leC5oOjY3LAo+Pj4gICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGlu
dXgvdGltZTMyLmg6MTMsCj4+PiAgICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51
eC90aW1lLmg6NjAsCj4+PiAgICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9z
dGF0Lmg6MTksCj4+PiAgICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9tb2R1
bGUuaDoxMywKPj4+ICAgICAgICAgICAgICAgICAgIGZyb20gZHJpdmVycy9tdGQvbXRkcGFydC5j
OjEwOgo+Pj4gZHJpdmVycy9tdGQvbXRkcGFydC5jOiBJbiBmdW5jdGlvbiDigJhwYXJzZV9tdGRf
cGFydGl0aW9uc+KAmToKPj4+IGRyaXZlcnMvbXRkL210ZHBhcnQuYzo2OTM6MzQ6IGVycm9yOiDi
gJglc+KAmSBkaXJlY3RpdmUgYXJndW1lbnQgaXMgbnVsbCBbLVdlcnJvcj1mb3JtYXQtb3ZlcmZs
b3c9XQo+Pj4gICAgNjkzIHwgICAgICAgICAgICAgICAgICAgICAgICAgcHJfZGVidWcoIiVzOiBn
b3QgcGFyc2VyICVzXG4iLCBtYXN0ZXItPm5hbWUsCj4+PiAgICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn4KPj4+IC4vaW5jbHVkZS9s
aW51eC9wcmludGsuaDozNzY6MjE6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYcHJf
Zm104oCZCj4+PiAgICAzNzYgfCAjZGVmaW5lIHByX2ZtdChmbXQpIGZtdAo+Pj4gICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICBefn4KPj4+IC4vaW5jbHVkZS9saW51eC9keW5hbWljX2RlYnVn
Lmg6MjQ4Ojk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfX2R5bmFtaWNfZnVuY19j
YWxsX2Nsc+KAmQo+Pj4gICAgMjQ4IHwgICAgICAgICBfX2R5bmFtaWNfZnVuY19jYWxsX2Nscyhf
X1VOSVFVRV9JRChkZGVidWcpLCBjbHMsIGZtdCwgZnVuYywgIyNfX1ZBX0FSR1NfXykKPj4+ICAg
ICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPj4+IC4vaW5jbHVkZS9saW51
eC9keW5hbWljX2RlYnVnLmg6MjUwOjk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhf
ZHluYW1pY19mdW5jX2NhbGxfY2xz4oCZCj4+PiAgICAyNTAgfCAgICAgICAgIF9keW5hbWljX2Z1
bmNfY2FsbF9jbHMoX0RQUklOVEtfQ0xBU1NfREZMVCwgZm10LCBmdW5jLCAjI19fVkFfQVJHU19f
KQo+Pj4gICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4+PiAuL2luY2x1
ZGUvbGludXgvZHluYW1pY19kZWJ1Zy5oOjI2OTo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFj
cm8g4oCYX2R5bmFtaWNfZnVuY19jYWxs4oCZCj4+PiAgICAyNjkgfCAgICAgICAgIF9keW5hbWlj
X2Z1bmNfY2FsbChmbXQsIF9fZHluYW1pY19wcl9kZWJ1ZywgICAgICAgICAgICAgXAo+Pj4gICAg
ICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn4KPj4+IC4vaW5jbHVkZS9saW51eC9wcmlu
dGsuaDo2MTA6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmGR5bmFtaWNfcHJfZGVi
dWfigJkKPj4+ICAgIDYxMCB8ICAgICAgICAgZHluYW1pY19wcl9kZWJ1ZyhmbXQsICMjX19WQV9B
UkdTX18pCj4+PiAgICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KPj4+IGRyaXZlcnMv
bXRkL210ZHBhcnQuYzo2OTM6MjU6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhwcl9k
ZWJ1Z+KAmQo+Pj4gICAgNjkzIHwgICAgICAgICAgICAgICAgICAgICAgICAgcHJfZGVidWcoIiVz
OiBnb3QgcGFyc2VyICVzXG4iLCBtYXN0ZXItPm5hbWUsCj4+PiAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+fn5+fgo+Pj4gZHJpdmVycy9tdGQvbXRkcGFydC5jOjY5Mzo1MDog
bm90ZTogZm9ybWF0IHN0cmluZyBpcyBkZWZpbmVkIGhlcmUKPj4+ICAgIDY5MyB8ICAgICAgICAg
ICAgICAgICAgICAgICAgIHByX2RlYnVnKCIlczogZ290IHBhcnNlciAlc1xuIiwgbWFzdGVyLT5u
YW1lLAo+Pj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5+Cj4+Pgo+Pj4gT2ZmZW5kaW5nIGNvbW1pdCBpcyA1YjY0NGFhMDEyZjY3Lgo+
Pgo+PiBBY3R1YWxseSBpdCBnb2VzIGJhY2sgdG8gMjAxNSB0byB0aGUgY29tbWl0IDhlMmM5OTJi
NTlmYyAoIm10ZDogbXRkcGFydDogYWRkIGRlYnVnIHByaW50cyB0byBwYXJ0aXRpb24gcGFyc2Vy
LiIpLgo+Pgo+Pgo+Pj4gUHJvcG9zZWQgbm9uLWludHJ1c2l2ZSBmaXggcmVzb2x2ZXMgdGhlIHdh
cm5pbmcvZXJyb3IsIGJ1dCBJIGNvdWxkIG5vdCB0ZXN0IHRoZSBjb2RlLgo+Pj4gKEkgZG9uJ3Qg
aGF2ZSB0aGUgcGh5c2ljYWwgZGV2aWNlLikKPj4+Cj4+PiAtLS0tLS0tLS0tLS0tLS0tLT48LS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbXRkcGFydC5jIGIvZHJpdmVycy9tdGQvbXRkcGFydC5jCj4+PiBpbmRleCA2
ODExYTcxNDM0OWQuLjgxNjY1ZDY3ZWQyZCAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvbXRkL210
ZHBhcnQuYwo+Pj4gKysrIGIvZHJpdmVycy9tdGQvbXRkcGFydC5jCj4+PiBAQCAtNjkxLDcgKzY5
MSw3IEBAIGludCBwYXJzZV9tdGRfcGFydGl0aW9ucyhzdHJ1Y3QgbXRkX2luZm8gKm1hc3Rlciwg
Y29uc3QgY2hhciAqY29uc3QgKnR5cGVzLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIGlm
ICghcGFyc2VyICYmICFyZXF1ZXN0X21vZHVsZSgiJXMiLCAqdHlwZXMpKQo+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFyc2VyID0gbXRkX3BhcnRfcGFyc2VyX2dldCgqdHlw
ZXMpOwo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIHByX2RlYnVnKCIlczogZ290IHBhcnNl
ciAlc1xuIiwgbWFzdGVyLT5uYW1lLAo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwYXJzZXIgPyBwYXJzZXItPm5hbWUgOiBOVUxMKTsKPj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFyc2VyID8gcGFyc2VyLT5uYW1lIDogIihudWxsIikpOwo+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICAgIGlmICghcGFyc2VyKQo+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29udGludWU7Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0g
bXRkX3BhcnRfZG9fcGFyc2UocGFyc2VyLCBtYXN0ZXIsICZwcGFydHMsIGRhdGEpOwo+Pj4KPj4+
Cj4+PiBIb3BlIHRoaXMgaGVscHMuCj4+Cj4+IEknZCBzYXkgaXQncyBzaW1wbGUgZW5vdWdoIHRv
IHNlbmQgcGF0Y2ggd2l0aG91dCBhY3R1YWwgaHcgdGVzdGluZy4KPiAKPiBUaG91Z2ggdGhlIGtl
cm5lbCdzIHZzcHJpbnRmIHdpbGwgYWxyZWFkeSBoYW5kbGUgTlVMTCBwb2ludGVycyBhbmQKPiBw
cmludCAiKG51bGwpIiBbMV0sIHNvIEknbSBub3Qgc3VyZSBpZiB0aGlzIGlzIGFuIGFjdHVhbCBp
bXByb3ZlbWVudC4KPiAKPiBUaGUgb25seSB3YXkgdGhpcyBjYW4gYmUgTlVMTCB0aG91Z2ggaXMg
aWYgdGhlIHJlcXVlc3RfbW9kdWxlKCkKPiBmYWlsZWQsIHNvIG1heWJlIGEgcHJvcGVyIGVycm9y
IG1lc3NhZ2Ugd291bGQgYmUgYmV0dGVyIGhlcmUgaW5zdGVhZAo+IG9mIGFuIG9ic2N1cmUgImdv
dCBwYXJzZXIgKG51bGwpIi4gWW91IGRvbid0IGV2ZW4ga25vdyB3aGljaCB0eXBlCj4gd2Fzbid0
IGF2YWlsYWJsZS4gRS5nLiBwcl9kZWJ1ZygiJTogbm8gcGFyc2VyIGZvciB0eXBlICVzCj4gYXZh
aWxhYmxlXG4iLCBtYXN0ZXItPm5hbWUsICp0eXBlcykuCgpBZ3JlZWQuIFlvdXIgcHJvcG9zYWwg
aXMgbXVjaCBtb3JlIGRlc2NyaXB0aXZlLgoKV2lsbCB5b3UgZG8gdGhpcyBwYXRjaCBvciBzaG91
bGQgSSBhbmQgcHV0IGEgU3VnZ2VzdGVkLWJ5OiA/CgpIb3dldmVyLCBJIHdvdWxkIHNsZWVwIG11
Y2ggYmV0dGVyIGlmIHRoaXMgaXMgdGVzdGVkIG9uIGFjdHVhbCBody4gOi0vCgpCZXN0IHJlZ2Fy
ZHMsCk1pcnNhZCBUb2Rvcm92YWMKCj4gWzFdIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L2xhdGVzdC9zb3VyY2UvbGliL3ZzcHJpbnRmLmMjTDY5Ngo+IAo+IEJlc3QgUmVnYXJkcywK
PiBKb25hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
