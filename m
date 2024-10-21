Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C86D3C92F
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 02:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZfMDfnVL+5ZYenGBluFRoYQ5cGG4hIutFfZx2bY/vk=; b=DzfUx8+5AFaHnQ
	patYoCvFUxXRMea+GdeMisq9xy4OllSxrRkrGmI13ivFXRTqkIevd0xgKri3jlvaD/1+kbHjyQvT7
	k/4i21sug7AUvR2hWnpiYsMNPlXHlZ4UsWVvQriAACni5ofR/hQWJTMwAY2E91GR+aMsWIdf8vEPw
	KHLEPdo5xPTzObTgDvKlqqTjJSlYYoCBF9kw7b1ymPoS2uXC55azmfxgwaH1VyyxK5mr/ghyzwNRu
	QXhvSXkFWSL6w1tDFKMg0wLgVjFfJ6yx7xpoDKh/JNezz0uTiZEikn1Z5WdJY4WiNG/XmnZblpoBv
	nBlRkBjHtIJJk/bWhETQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2ht5-00000005qh9-3Yn6;
	Mon, 21 Oct 2024 02:11:15 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2hrb-00000005qa8-15f6;
	Mon, 21 Oct 2024 02:09:44 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-71e681bc315so2457733b3a.0;
        Sun, 20 Oct 2024 19:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729476581; x=1730081381; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bf7ZQ2vXj6JorqEGjz7XEV1A94uZWCECK/fe9E3SPTo=;
        b=SwC0Bimlm51SoKqbfwLYhkPN0QLQDHySc/z9bkM5BYta7yf/yG38mpZ/lepPy+jCdH
         5qPWDT3MSij1cADvblQRyQH0OqpeParg7kC0Ae7dMSTAMbZqQJO1AZW1QTjirgbgOziU
         G43rr2gI6TFqzmM0l2v1V4dv3oF5MT851+iQF4BzcWaVBwHH8o6P7wDEJIBrb8AS+YYt
         WzYdPhzRJSZSDdWQNzJz3ujFZPBSsPIL8cXAGXCkvPTqecoRvcx4JVp9QOpMSvV8yg/w
         eswhHpqCXvRzaPWcZyUD43o+YTIE7LrTjGV5Sly7PkdLCSqXGUqenwy7tA8wl+oeqKjJ
         nLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729476581; x=1730081381;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bf7ZQ2vXj6JorqEGjz7XEV1A94uZWCECK/fe9E3SPTo=;
        b=mhSu/cfjYC461yyHXLC9AxdC5YIVYr/QTyE0FkQe0inJpOZcNugJu9Xls+3RqKa6S0
         C1TLTMcFbtYe65lCbwuGs2TYs1Ut3bFVOoF/cqUr/Eh/4/q07XInIL1jfVPQMu5tW0Ye
         fKJvMGO0ZC2fPO56rjXzY317nrUGZaOIjzBFM1uIZGtu+iDkuKiVa5WyLSAMIf0a1HOp
         nktmJpl22lk/iVFxoyWD5lSA8b+DqLGbJW/o6DVGlPfy2Lvx9k/ySquKF6fiVQbl8ZTX
         OPl50AUsM6HUeT+qWFAS+QmXU0pPlOfwSLc6zWwy8qd2P5AkwzIgT/xg2NfQB1n4Eagu
         GOyg==
X-Forwarded-Encrypted: i=1; AJvYcCVXopHBt4NxH8JZz18XcJnwbxPbtEPdvcV5/N3Dp2lPRKGBisRvOOlsJRgum0cz8kHXO6iGivnJXFKaB+NLyb/f@lists.infradead.org, AJvYcCX0F2LUzHGf2tJfMqsKxYa/l+6rFrKv0HMqOFc7KCapVLrXKAonEWOnoyY4B1TQFHZJMiO4hBi8XdCf@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu3uS/owp/2tX4w7LyKZDrFyiPPkxJanhxa5nid8Ie/UkaYbDe
	RYFj48FGo4YLlqGb/YoKT1eWG3PIjdtYCWvfKFepFBJCXAiDYEbBOX3pVg==
X-Google-Smtp-Source: AGHT+IFq7IOvWK3WEZq7H92NJ9rZFuPaZ3gta4tblIVUEdLtLS9whI4zUy8XlVEj522zW40a785d0A==
X-Received: by 2002:a05:6a00:1d15:b0:71e:591d:cb4c with SMTP id d2e1a72fcca58-71e8fd43bc5mr26167952b3a.1.1729476581198;
        Sun, 20 Oct 2024 19:09:41 -0700 (PDT)
Received: from [172.19.1.53] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1332f6asm1775801b3a.69.2024.10.20.19.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 19:09:40 -0700 (PDT)
Message-ID: <c89f11c0-e0f3-4a28-9de4-341d0238f8cb@gmail.com>
Date: Mon, 21 Oct 2024 10:09:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nikita.shubin@maquefel.me, arnd@arndb.de, vkoul@kernel.org,
 esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241018022519.721914-1-hpchen0nvt@gmail.com>
 <20241018022519.721914-3-hpchen0nvt@gmail.com>
 <ZxItGw0m_w0jgtAq@pengutronix.de>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <ZxItGw0m_w0jgtAq@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_190943_325127_6A410D74 
X-CRM114-Status: GOOD (  18.69  )
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

RGVhciBTYXNjaGEsCgoKVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5LgoKCk9uIDIwMjQvMTAvMTgg
5LiL5Y2IIDA1OjQwLCBTYXNjaGEgSGF1ZXIgd3JvdGU6Cj4gT24gRnJpLCBPY3QgMTgsIDIwMjQg
YXQgMDI6MjU6MTlBTSArMDAwMCwgSHVpLVBpbmcgQ2hlbiB3cm90ZToKPj4gK3N0YXRpYyBpbnQg
bWEzNV9uZmlfZWNjX2NoZWNrKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHU4ICphZGRyKQo+PiAr
ewo+PiArCXN0cnVjdCBtYTM1X25hbmRfaW5mbyAqbmFuZCA9IG5hbmRfZ2V0X2NvbnRyb2xsZXJf
ZGF0YShjaGlwKTsKPj4gKwlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKGNoaXAp
Owo+PiArCWludCBpLCBqLCBuY2h1bmtzID0gMDsKPj4gKwlpbnQgcmVwb3J0X2VyciA9IDA7Cj4+
ICsJaW50IGVycl9jbnQgPSAwOwo+PiArCXUzMiBzdGF0dXM7Cj4+ICsKPj4gKwluY2h1bmtzID0g
bXRkLT53cml0ZXNpemUgLyBjaGlwLT5lY2Muc3RlcHM7Cj4+ICsJaWYgKG5jaHVua3MgPCA0KQo+
PiArCQluY2h1bmtzID0gMTsKPj4gKwllbHNlCj4+ICsJCW5jaHVua3MgLz0gNDsKPj4gKwo+PiAr
CWZvciAoaiA9IDA7IGogPCBuY2h1bmtzOyBqKyspIHsKPj4gKwkJc3RhdHVzID0gcmVhZGwobmFu
ZC0+cmVncyArIE1BMzVfTkZJX1JFR19OQU5ERUNDRVMwICsgaiAqIDQpOwo+PiArCQlpZiAoIXN0
YXR1cykKPj4gKwkJCWNvbnRpbnVlOwo+PiArCj4+ICsJCWZvciAoaSA9IDA7IGkgPCA0OyBpKysp
IHsKPj4gKwkJCWlmICgoc3RhdHVzICYgRUNDX1NUQVRVU19NQVNLKSA9PSAweDAxKSB7Cj4+ICsJ
CQkJLyogQ29ycmVjdGFibGUgZXJyb3IgKi8KPj4gKwkJCQllcnJfY250ID0gKHN0YXR1cyA+PiAy
KSAmIEVDQ19FUlJfQ05UX01BU0s7Cj4+ICsJCQkJbWEzNV9uZmlfY29ycmVjdChjaGlwLCBqICog
NCArIGksIGVycl9jbnQsIGFkZHIpOwo+PiArCQkJCXJlcG9ydF9lcnIgKz0gZXJyX2NudDsKPiBU
aGlzIGlzIHN0aWxsIHdyb25nLiBUaGlzIHNob3VsZCBiZQo+Cj4gCQkJCXJlcG9ydF9lcnIgPSBt
YXgocmVwb3J0X2VyciwgZXJyX2NudCk7Cj4KPiBZb3UgaGF2ZSB0byBzZWFyY2ggZm9yIHRoZSBz
dWJwYWdlIHRoYXQgaGFzIHRoZSBtb3N0IGJpdGZsaXBzIGFuZCByZXR1cm4KPiB0aGUgbnVtYmVy
IG9mIGJpdGZsaXBzIG9uIHRoYXQgc3VicGFnZSwgKm5vdCogdGhlIHRvdGFsIGFtb3VudCBvZiBl
cnJvcnMKPiBvbiB0aGUgd2hvbGUgcGFnZS4KPgo+IFRoYXQgc2FpZCwgdGhlIHN0YXRpc3RpYyBj
b3VudGVyIHNob3VsZCBzdGlsbCBjb3VudCB0aGUgdG90YWwgbnVtYmVyIG9mCj4gYml0ZmxpcHMg
b2NjdXJyZWQuCgpJIHJlLWV4YW1pbmVkIHRoZSByZXR1cm4gdmFsdWUgb2YgcmVhZF9wYWdlLCBh
bmQgaXQgaW5kZWVkIG5lZWRzIHRvIApyZXR1cm4gdGhlCgptYXhpbXVtIGJpdGZsaXBzIGZvciB0
aGUgc3VicGFnZS4gSSB3aWxsIGNvcnJlY3QgdGhpcyByZXR1cm4gdmFsdWUuCgpUaGFuayB5b3Uu
CgoKPiBTYXNjaGEKPgo+PiArCQkJfSBlbHNlIHsKPj4gKwkJCQkvKiBVbmNvcnJlY3RhYmxlIGVy
cm9yICovCj4+ICsJCQkJZGV2X3dhcm4obmFuZC0+ZGV2LCAidW5jb3JyZWN0YWJsZSBlcnJvciEg
MHglNHhcbiIsIHN0YXR1cyk7Cj4+ICsJCQkJcmV0dXJuIC1FQkFETVNHOwo+PiArCQkJfQo+PiAr
CQkJc3RhdHVzID4+PSA4Owo+PiArCQl9Cj4+ICsJfQo+PiArCXJldHVybiByZXBvcnRfZXJyOwo+
PiArfQo+PiArCgpCZXN0IHJlZ2FyZHMsCgpIdWktUGluZyBDaGVuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
