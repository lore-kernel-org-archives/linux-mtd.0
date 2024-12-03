Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D83E6C5E3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 00:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idSvEgq7DiirlPwvze8Fqt37wSWmMkgIg6JosgfikTs=; b=ITn3Sp5U3p1q9W
	nSWP5uA44CnwqsEL18x5jy4MgY5yaiPUVzQKt6FnyyX9O6AkWj4flbbTIZuxqfiDHy0278ezDS9ZS
	4sHm8gBl3GvM9h+Fmtnu0Nf87YzuYOiYlXxAKob71xOv5fDe22IiTjy1zKZIceWFWvLXvMzQ61jhV
	nXG/Hrjoqk+u2h25bcWReENnFeJ28CfI04cOdES3/1Ein7JJ84APqIGUZ/TAqQK+ZgqEJB270ap/0
	txhOvfmVGzwzSFqLOIPrwHde4T4zmIhCE0wpONbPi40VqVTFkcM6C65V26naxRVjdn6XvurXS0x5E
	PHv2kuK8klC6ZAqX/CMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIGlw-00000007oh8-1uzM;
	Tue, 03 Dec 2024 00:28:12 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIGkv-00000007oVj-2seU;
	Tue, 03 Dec 2024 00:27:10 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-215a0390925so14361405ad.0;
        Mon, 02 Dec 2024 16:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733185628; x=1733790428; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DLYTwGWkMWLIc6S8rXeQ5AdWzJOnAigIrBbJB1JhA1I=;
        b=mUbJbUMTxpRI1ZMpTxDi8T6NnliYwrhpVotmbcUkC3dLJPU2KAamYRRdl3BV8yrZI7
         gPRLEQAX3BrV+Jz8hHwDjhcmR9J1DyfkLl2O9Tf3HrjpPYM8MesYEEgatqS8/4Pax5DJ
         kBz21QmMIelvb1k/R2lzhFrl3D15hK+qugnD3rwD5nWWMHTbRu6i3Fgx/TyhfEmLVdEL
         /wQXgZ/lCVRHw5wTZdqxh8OOg8/qDrIxilbFqZVcwKiIBwX7fCVrICGIP+8/q9owFRBP
         g+4L63z+Yh8D+RP3J+ClJoqhUH3FdyJIzTC8NBZnAprvQVJt74Blx8K0jiSg9y6HjvXz
         0J4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733185628; x=1733790428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DLYTwGWkMWLIc6S8rXeQ5AdWzJOnAigIrBbJB1JhA1I=;
        b=pIuqan0dbMr15IbSvyP5WzTXf+8AcLFij+hJjh/KhRDOybkoycv9ItA67/Gm+/5WQ0
         FjnO1802FgriTc6Ll2k712tW16Y/0aMiLTLYTVWOn14JFCR1BUjEUEVIPyXIlfCKdmZD
         JAGNeIPtDoH8j5Rk01Je++I+6VwXW1d329hjyPjxvW9xTQQFwSDOtRFlvF2fRB+xb8m7
         /BETD1fJN4UGV67ouzZd8XceaCl//DSpFesD7nkzyG/FS4EANqVgg0Rd7M4+H8xco9rL
         jBDksLGZsBxY1Jt36cVJ4cguSfwMDijGylrbFm6Ipf+jUgsR7bM2wb18dZ0gGSp/apV7
         T9bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPN161xbEwz2HVoYjhFuy07IiTub+BeBko5Tr2YxMKrgnOHw5Jr3FwAMa/rMDddwi3CDCDg/8KwfXt@lists.infradead.org, AJvYcCVsj+przU5jyX3a+F4rOpZQ22uO5QP1fqjM+Flnem/13t7IywNXzD6cTHzozW0aKKuRflcwPvkjcPI4ZFEcmkdR@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmw+fe8VvZKzPB76Oua1wfKEUff2KUbIBQsYB8iY/moYUNVMCr
	f8TJgh5dTrmBQn8DlDF6mIK7sEJ/rQdbOidLjPSh6dQHKZV71KI6
X-Gm-Gg: ASbGncsQnhfa8QerbXgt44iUJAeOK0bt3qccqWA1jzP7B6mLFwEiBFxOMoY+3N80lm1
	J6lUfyVISYx1GySdZ+iyjesR7yiLFhLq91EdTlxiQTGnuS77ap+k1lV7jHZ+7xCt8j2XsZESk0h
	RHY13G6btsTZ3lc2acQh/aTOf5i194XUwfeg4DemrQBL2WpAw8tCre9xMnmqYH6fPVRgtZGP0K5
	+ON0laisgkh2aIaSMBQyXAXAZUUxlARAcroSD/xBRge28UczTGex5+Uu/UmzBjINFobnWyjYUIM
	uz+tFx9biWy19Gs3Ph1PBWJ3
X-Google-Smtp-Source: AGHT+IGHwdUtcOPNOesLU2uYuzU+uzBNriJXCHFU8gQ6QyGwX1BK3vvXSZUFFBjaUgWZE1pjKQq8OQ==
X-Received: by 2002:a17:903:22cf:b0:211:3275:3fe with SMTP id d9443c01a7336-215bd1cd723mr8388845ad.17.1733185628104;
        Mon, 02 Dec 2024 16:27:08 -0800 (PST)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2159d48d97esm20570085ad.239.2024.12.02.16.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 16:27:07 -0800 (PST)
Message-ID: <6395117f-4ed8-45b5-ba80-417d61beb55b@gmail.com>
Date: Tue, 3 Dec 2024 08:27:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nikita.shubin@maquefel.me, arnd@arndb.de,
 vkoul@kernel.org, esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241125052524.135362-1-hpchen0nvt@gmail.com>
 <20241125052524.135362-3-hpchen0nvt@gmail.com> <875xo257rd.fsf@bootlin.com>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <875xo257rd.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_162709_721061_4C128EC1 
X-CRM114-Status: GOOD (  11.44  )
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

RGVhciBNaXF1ZSwKClRoYW5rIHlvdSBmb3IgeW91ciByZXBseS4KCgpPbiAyMDI0LzEyLzMg5LiK
5Y2IIDAxOjEyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhlbGxvLAo+Cj4+ICtzdGF0aWMgaW50
IG1hMzVfbmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+PiArewo+PiAr
CXN0cnVjdCBtYTM1X25hbmRfaW5mbyAqbmFuZCA9IG5hbmRfZ2V0X2NvbnRyb2xsZXJfZGF0YShj
aGlwKTsKPj4gKwlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKGNoaXApOwo+PiAr
CXN0cnVjdCBkZXZpY2UgKmRldiA9IG10ZC0+ZGV2LnBhcmVudDsKPj4gKwl1MzIgcmVnOwo+PiAr
Cj4+ICsJaWYgKGNoaXAtPm9wdGlvbnMgJiBOQU5EX0JVU1dJRFRIXzE2KSB7Cj4+ICsJCWRldl9l
cnIoZGV2LCAiMTYgYml0cyBidXMgd2lkdGggbm90IHN1cHBvcnRlZCIpOwo+PiArCQlyZXR1cm4g
LUVJTlZBTDsKPj4gKwl9Cj4+ICsKPj4gKwlyZWcgPSByZWFkbChuYW5kLT5yZWdzICsgTUEzNV9O
RklfUkVHX05BTkRDVEwpICYgKH5QU0laRV9NQVNLKTsKPj4gKwlpZiAobXRkLT53cml0ZXNpemUg
PT0gMjA0OCkKPj4gKwkJd3JpdGVsKHJlZyB8IFBTSVpFXzJLLCBuYW5kLT5yZWdzICsgTUEzNV9O
RklfUkVHX05BTkRDVEwpOwo+PiArCWVsc2UgaWYgKG10ZC0+d3JpdGVzaXplID09IDQwOTYpCj4+
ICsJCXdyaXRlbChyZWcgfCBQU0laRV80SywgbmFuZC0+cmVncyArIE1BMzVfTkZJX1JFR19OQU5E
Q1RMKTsKPj4gKwllbHNlIGlmIChtdGQtPndyaXRlc2l6ZSA9PSA4MTkyKQo+PiArCQl3cml0ZWwo
cmVnIHwgUFNJWkVfOEssIG5hbmQtPnJlZ3MgKyBNQTM1X05GSV9SRUdfTkFORENUTCk7Cj4gWW91
IHNob3VsZCBlcnJvciBvdXQgaWYgdGhlIHdyaXRlc2l6ZSBpcyBub3Qgc3VwcG9ydGVkLgoKT2th
eS4gSSB3aWxsIHJldHVybiAtRUlOVkFMIGlmIHRoZSB3cml0ZXNpemUgaXMgbm90IHN1cHBvcnRl
ZC4KCgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCkJlc3QgcmVnYXJkcywKCkh1aS1QaW5nIENoZW4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
