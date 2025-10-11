Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0505ACCA476
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Oct 2025 10:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xuXWxgNuuiHIs8gBNVK2PTFq24HK7nUYDwCRVb/Lx4Y=; b=W/QhGqOYbpYd+f
	GINJC6osCuWtz7KpiK/KHNGmVM9HlkgJvAszpgN80XBOJQh5M3Eq0G+ENfrDaw3qhVb/ZlA+n9fwL
	BJYA+lYpupiRk3qHMrXdiMB8p7BnJkj7zAjpbva02u1Yx+1SBHcvGkLB+WOWioKfZUQkYNliCOFyB
	y28VnAXZgGsubHNositaVeotCBrFZWs5jPjtxypwUpzWrUfPmk386Qm0gGw2h4RKS462jQA5kAvz2
	w8Iw91OZaKq9yDPXzZFzITComLbf0ZW/KZEkjGTkJeClG74VlhmLRNIY6Mj8DocxQQ0pDFlGwwgWu
	MsbeCxbvaOjv5Uij5Zew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7X35-0000000A31a-2blJ;
	Sat, 11 Oct 2025 10:42:03 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7X33-0000000A30s-0frK
	for linux-mtd@lists.infradead.org;
	Sat, 11 Oct 2025 10:42:02 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-62fa062a1abso4990055a12.2
        for <linux-mtd@lists.infradead.org>; Sat, 11 Oct 2025 03:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760179319; x=1760784119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqyDNC67ubeb2tHQvs3zOoppHPgwgyf6ppd+sV61gUM=;
        b=lVo53pO00co/CuMIjaulH/CrkaF2jGCE9a8YN6PjOjmOzkWLSiThzXfy/Azke+Gfeb
         rlRUJEWGdoe9QLDk7exn8ODiFSS8eSFWZomkKX4/L0yplUIbEXXCEQoN96Tb13uHeyuo
         xyixldb6Gy8YBsPr7DM7nvA+TuT80Qc9EOqfS1SrKafsORkzhpTRUKdRK+aPCGKEnvLl
         9iFumU4VcCvAsXE6do6p20B5Ws8zDkjK96cxJST98sZ6G+mtYkJLCWA3ukSeuaxDDjMW
         ixFjOXqyVgqsm5TjMeU0uXTrOBejw4CM6zwAAmo5Jq6oyBBdDwmehDFevk3Qa2O08AYc
         neUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760179319; x=1760784119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqyDNC67ubeb2tHQvs3zOoppHPgwgyf6ppd+sV61gUM=;
        b=tbmaL184K6bpw2JqfsVDo4vay8cAVpPo7LjY9903d9pvoB6Y2WIpfjOFE+Mzc2mhJi
         EE7nYsx2UJqnr7vL7Ns+QsemNKnHqhpZvV2A2qNohaoKiKtlI6yeUJjDrzjyGga7Elez
         QDtwVmyy4bJdO+Ji+K5V4mh9UzQ/NaLrlzkX6U0bXT8MIbkYHcj6WH9c9JjXBt/K/r3s
         eBztwi8yUyi+QN/6GeYYodcFrH499FQT4h5Ld7XS7nn6c3iPTtOViP0Gh2tYzectfKfe
         y6XPfceW0dX/dGuqq7ouMfyBFhQh8WFG/HPY5nvz63GDNzw6BvvlWTaxCrGJxu4MnKsJ
         3y/w==
X-Forwarded-Encrypted: i=1; AJvYcCW1UG0YrLqGeUp1uFILJ8th78BaI1troVH7QefjxJjVCV/ohhwZa7MF5x5cJnahOEMsf+7LkMWhVgY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNDaqqYo8sk5FUw1aJ58iJ7iwEgt05z+aS3NQSWM7qUpZ7Hzhd
	LKINhQyD1MsxEmnhV5a8i7rVo3IdDV/7uETdOf73HaV7quLwXyhHNfeZ
X-Gm-Gg: ASbGncuqik1q3SViv4QacL6fwt/TGRDQs0WOPl0kvri1o6MMgi9DDaMYiRTE22gtwNU
	gc9fPbRmqaj5PMEoG19p788lnNnnuS8XEjIV+JqvdO9PxsZZ72LpwHVL39sEDtWal1zIZH6X5cH
	qab/cCmpoKKSHNZJ9Bk5FE4A1ytyubnp90D8u87PS/x3iM+b64ebqPjSpKi0X4DZSO/HrnYpA8O
	0TY+KzeUq8eGE44Oy2OtubyC3aLGeXT/dwqQ2+OyTBzhb04j5dxcqFaq6gSC5MsM5/z+IQh5C4S
	wskCp4iI2jo30PGxL2rM0U2+rDLLKfbBTycOProMLCVxsbnaE+maA7BHMhodRV5AdyO6gm+tv0R
	4QioFy8b9qu6pH2xZYAhKJPTHhW1ad6ORcLoXNJODC/lf0AM+xbmH4fpqow6/JV0=
X-Google-Smtp-Source: AGHT+IFniI0WsDXjo4z3UaAWm2jZN00980pqXioaMnWWaQ/4U3UhS7uWYQBxdSYInHj9x0mV1hCBAA==
X-Received: by 2002:a05:6402:5106:b0:634:544b:a756 with SMTP id 4fb4d7f45d1cf-639d5c59407mr12973844a12.32.1760179319203;
        Sat, 11 Oct 2025 03:41:59 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b10072sm4482832a12.16.2025.10.11.03.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 03:41:58 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 04/15] mtd: nand: sunxi: move ecc strenghts in sunxi_nfc_caps
Date: Sat, 11 Oct 2025 12:41:56 +0200
Message-ID: <13861163.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20251010084042.341224-5-richard.genoud@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-5-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_034201_248598_3183612C 
X-CRM114-Status: GOOD (  19.23  )
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

SGkhCgpEbmUgcGV0ZWssIDEwLiBva3RvYmVyIDIwMjUgb2IgMTA6NDA6MzEgU3JlZG5qZWV2cm9w
c2tpIHBvbGV0bmkgxI1hcyBqZSBSaWNoYXJkIEdlbm91ZCBuYXBpc2FsKGEpOgo+IEg2L0g2MTYg
aGFzIG1vcmUgZWNjIHN0cmVuZ2h0cy4KPiBUaGlzIGNvbW1pdCBwcmVwYXJlcyB0aGUgY2hhbmdl
Lgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKRm9ybWF0IGxvb2tzIHdlaXJkLiBSZXdvcmQgbWVz
c2FnZSB0byBzb21ldGhpbmcgbGlrZSBtb3ZpbmcgZWNjIHRvIGNhcHMgd2hpY2gKd2lsbCBhbGxv
dyBleHBhbmQgc3VwcG9ydCBmb3IgbmV3ZXIgY29yZXMuCgpBbHNvLCB0aGVyZSBzaG91bGQgYmUg
ZW1wdHkgbGluZSBiZWZvcmUgIk5vIGZ1bmN0aW9uYWwgY2hhbmdlLiIKCkJlc3QgcmVnYXJkcywK
SmVybmVqCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgR2Vub3VkIDxyaWNoYXJkLmdlbm91
ZEBib290bGluLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5j
IHwgMjAgKysrKysrKysrKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L3N1bnhpX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYwo+IGlu
ZGV4IDEwYTQ4ZTBkMzYxZi4uMTk4ZGQ0MGY5MjIwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L3N1bnhpX25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhp
X25hbmQuYwo+IEBAIC0yMTMsMTEgKzIxMywxNSBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBzdW54
aV9uYW5kX2NoaXAgKnRvX3N1bnhpX25hbmQoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCkKPiAgICoJ
CQl0aHJvdWdoIE1CVVMgb24gQTIzL0EzMyBuZWVkcyBleHRyYSBjb25maWd1cmF0aW9uLgo+ICAg
KiBAcmVnX2lvX2RhdGE6CUkvTyBkYXRhIHJlZ2lzdGVyCj4gICAqIEBkbWFfbWF4YnVyc3Q6CURN
QSBtYXhidXJzdAo+ICsgKiBAZWNjX3N0cmVuZ3RoczoJQXZhaWxhYmxlIEVDQyBzdHJlbmd0aHMg
YXJyYXkKPiArICogQG5zdHJlbmd0aHM6CQlTaXplIG9mIEBlY2Nfc3RyZW5ndGhzCj4gICAqLwo+
ICBzdHJ1Y3Qgc3VueGlfbmZjX2NhcHMgewo+ICAJYm9vbCBoYXNfbWRtYTsKPiAgCXVuc2lnbmVk
IGludCByZWdfaW9fZGF0YTsKPiAgCXVuc2lnbmVkIGludCBkbWFfbWF4YnVyc3Q7Cj4gKwljb25z
dCB1OCAqZWNjX3N0cmVuZ3RoczsKPiArCXVuc2lnbmVkIGludCBuc3RyZW5ndGhzOwo+ICB9Owo+
ICAKPiAgLyoqCj4gQEAgLTE2MTksOSArMTYyMyw5IEBAIHN0YXRpYyBpbnQgc3VueGlfbmFuZF9o
d19lY2NfY3RybF9pbml0KHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsCj4gIAkJCQkgICAgICAgc3Ry
dWN0IG5hbmRfZWNjX2N0cmwgKmVjYywKPiAgCQkJCSAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5wKQo+ICB7Cj4gLQlzdGF0aWMgY29uc3QgdTggc3RyZW5ndGhzW10gPSB7IDE2LCAyNCwgMjgs
IDMyLCA0MCwgNDgsIDU2LCA2MCwgNjQgfTsKPiAgCXN0cnVjdCBzdW54aV9uYW5kX2NoaXAgKnN1
bnhpX25hbmQgPSB0b19zdW54aV9uYW5kKG5hbmQpOwo+ICAJc3RydWN0IHN1bnhpX25mYyAqbmZj
ID0gdG9fc3VueGlfbmZjKG5hbmQtPmNvbnRyb2xsZXIpOwo+ICsJY29uc3QgdTggKnN0cmVuZ3Ro
cyA9IG5mYy0+Y2Fwcy0+ZWNjX3N0cmVuZ3RoczsKPiAgCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0g
bmFuZF90b19tdGQobmFuZCk7Cj4gIAlzdHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmRkZXYgPSBtdGRf
dG9fbmFuZGRldihtdGQpOwo+ICAJaW50IG5zZWN0b3JzOwo+IEBAIC0xNjQ1LDcgKzE2NDksNyBA
QCBzdGF0aWMgaW50IHN1bnhpX25hbmRfaHdfZWNjX2N0cmxfaW5pdChzdHJ1Y3QgbmFuZF9jaGlw
ICpuYW5kLAo+ICAKPiAgCQllY2MtPnN0cmVuZ3RoID0gYnl0ZXMgKiA4IC8gZmxzKDggKiBlY2Mt
PnNpemUpOwo+ICAKPiAtCQlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShzdHJlbmd0aHMpOyBp
KyspIHsKPiArCQlmb3IgKGkgPSAwOyBpIDwgbmZjLT5jYXBzLT5uc3RyZW5ndGhzOyBpKyspIHsK
PiAgCQkJaWYgKHN0cmVuZ3Roc1tpXSA+IGVjYy0+c3RyZW5ndGgpCj4gIAkJCQlicmVhazsKPiAg
CQl9Cj4gQEAgLTE2NjYsNyArMTY3MCw3IEBAIHN0YXRpYyBpbnQgc3VueGlfbmFuZF9od19lY2Nf
Y3RybF9pbml0KHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsCj4gIAl9Cj4gIAo+ICAJLyogQWRkIEVD
QyBpbmZvIHJldHJpZXZhbCBmcm9tIERUICovCj4gLQlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0la
RShzdHJlbmd0aHMpOyBpKyspIHsKPiArCWZvciAoaSA9IDA7IGkgPCBuZmMtPmNhcHMtPm5zdHJl
bmd0aHM7IGkrKykgewo+ICAJCWlmIChlY2MtPnN0cmVuZ3RoIDw9IHN0cmVuZ3Roc1tpXSkgewo+
ICAJCQkvKgo+ICAJCQkgKiBVcGRhdGUgZWNjLT5zdHJlbmd0aCB2YWx1ZSB3aXRoIHRoZSBhY3R1
YWwgc3RyZW5ndGgKPiBAQCAtMTY3Nyw3ICsxNjgxLDcgQEAgc3RhdGljIGludCBzdW54aV9uYW5k
X2h3X2VjY19jdHJsX2luaXQoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPiAgCQl9Cj4gIAl9Cj4g
IAo+IC0JaWYgKGkgPj0gQVJSQVlfU0laRShzdHJlbmd0aHMpKSB7Cj4gKwlpZiAoaSA+PSBuZmMt
PmNhcHMtPm5zdHJlbmd0aHMpIHsKPiAgCQlkZXZfZXJyKG5mYy0+ZGV2LCAidW5zdXBwb3J0ZWQg
c3RyZW5ndGhcbiIpOwo+ICAJCXJldHVybiAtRU5PVFNVUFA7Cj4gIAl9Cj4gQEAgLTIxNjcsMTUg
KzIxNzEsMjMgQEAgc3RhdGljIHZvaWQgc3VueGlfbmZjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+ICAJCWRtYV9yZWxlYXNlX2NoYW5uZWwobmZjLT5kbWFjKTsKPiAgfQo+
ICAKPiArc3RhdGljIGNvbnN0IHU4IHN1bnhpX2VjY19zdHJlbmd0aHNfYTEwW10gPSB7Cj4gKwkx
NiwgMjQsIDI4LCAzMiwgNDAsIDQ4LCA1NiwgNjAsIDY0Cj4gK307Cj4gKwo+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IHN1bnhpX25mY19jYXBzIHN1bnhpX25mY19hMTBfY2FwcyA9IHsKPiAgCS5yZWdf
aW9fZGF0YSA9IE5GQ19SRUdfQTEwX0lPX0RBVEEsCj4gIAkuZG1hX21heGJ1cnN0ID0gNCwKPiAr
CS5lY2Nfc3RyZW5ndGhzID0gc3VueGlfZWNjX3N0cmVuZ3Roc19hMTAsCj4gKwkubnN0cmVuZ3Ro
cyA9IEFSUkFZX1NJWkUoc3VueGlfZWNjX3N0cmVuZ3Roc19hMTApLAo+ICB9Owo+ICAKPiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBzdW54aV9uZmNfY2FwcyBzdW54aV9uZmNfYTIzX2NhcHMgPSB7Cj4g
IAkuaGFzX21kbWEgPSB0cnVlLAo+ICAJLnJlZ19pb19kYXRhID0gTkZDX1JFR19BMjNfSU9fREFU
QSwKPiAgCS5kbWFfbWF4YnVyc3QgPSA4LAo+ICsJLmVjY19zdHJlbmd0aHMgPSBzdW54aV9lY2Nf
c3RyZW5ndGhzX2ExMCwKPiArCS5uc3RyZW5ndGhzID0gQVJSQVlfU0laRShzdW54aV9lY2Nfc3Ry
ZW5ndGhzX2ExMCksCj4gIH07Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCBzdW54aV9uZmNfaWRzW10gPSB7Cj4gCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
