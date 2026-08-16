Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DA3C5DF6D
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Aug 2026 17:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wy7DlYetSdUHa3JW2aKzShliBRwRJE7fw9sw90xmcuw=; b=J7ZWQjPBg43HV4
	EebkcTXLHgjGkyg646Hah4xYGWmUm9rkcyIjd+XxNRUq11djho/oJ1Gswd7gtY0EgFDzLttqiSlZJ
	4FAWquVUk8TCZxtX6qIXBOLgVjz3NEg0BM65kOvXTZ7GpYuExHqE1lvCX52wzcK8x9b9gSnKEaSHv
	BTfwHkqpHZFDI4ADQvYxyKM7zeriA5iMrO6P/1VbqdCljUGutOm1a1QZfXQOvE824bx9up8JCi1H1
	aVse1p3ZjQLk3Liv4smNReifslEKO/rMkiRpAAudXHeBxbJOqLH0HrtDtOHZlBNP+MioIaQdBJYLu
	uoKxeL+5mg2bTmGpIMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wveEa-00000004uas-0f0f;
	Sun, 16 Aug 2026 17:01:20 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wveEX-00000004uaV-1zxZ
	for linux-mtd@lists.infradead.org;
	Sun, 16 Aug 2026 17:01:18 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2d560775ca2so6041025ad.1
        for <linux-mtd@lists.infradead.org>; Sun, 16 Aug 2026 10:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786899677; x=1787504477; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YWxpd5Q6UjfdNyoiy9yJ7GYjxxl6+mNhx7E9nYtgtxo=;
        b=jXQuUTX3TXqh54t3dwxw8+9HPZuICeyDl7OlfH6BDlVqZ1Wi4KDtnXY6TcnnCONVQo
         UoFH0qEODOD3SBA2YPJwU0/z+Zm2yOaDoOWV4oNkmwGTulrdA7deZg2ibQ/+py9K2ttS
         o4M1M3jW7ejZMdVRYtTwzz5teA+5Cr3RCsMbtkYJCniiKqq6ieMDR4U+tcAFTln/Caq6
         Lm+sA9iMfjwlPgAYrvkiuTPlAXqfKtS8vcwtS+80obDSHS0GLR7vSqyRLNUnNG50v+Xs
         BFG7L1r/pvIuMFhz0m7v2DRTP8jiwxHp2sM9a2rOMPwUZNQPVMwT4QqBZ1Lo9tNWrcG5
         mZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786899677; x=1787504477;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YWxpd5Q6UjfdNyoiy9yJ7GYjxxl6+mNhx7E9nYtgtxo=;
        b=lzWicAKQI/+YeSyAepgLLT+J75XE6MShX1NPk4VIMDwefwpDWDktcJfboRE8ATZoZg
         9k0VLypCnBHR7gFjxsNcIxuMPlit32XRmbuzqU9CaPoVJ6CDhXUcJnHHW+xcT38PCw+6
         vKaARFAAHnxL/Aks0jFHHjQGoDYHHZkeDr0bU3dttlYCz8KG0idBVfuPgQ2jv5c+ETKU
         ZnkDirvwmJXqOj4XwAQCQcwmfo/bX/HQfG5qHhyXKbBTydb0o8XY1kuqr/kgrLF4l6r9
         uK9gnGisCWh73vZj1sWrne5eiBqEmkx/hB0w5XwCn92wV3fucCnZNYLt5Uw4UJq2Gxup
         8u4Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro7fWIvvjVUboPz7cKtJQbf0t9pHxpFmpfYYpW1qK2/ozz4XrYt+qz2a6GacsZ6dODDy7ZV0OB7qzU=@lists.infradead.org
X-Gm-Message-State: AOJu0YycmXmyVsOu7pO/M+ggfbuy+uTfyw17Dx7F6+gLliXfLRPFeyLU
	/+pSO11B/52v7BZndMkmkzTVU2Nm0gGMQChnNiS+fY7LG8Sjt5R9KE1s
X-Gm-Gg: AR+sD108TODLSnp6q5i5wKRbcMDpGPa0I98dnFpNN2sp//ZOVV4np7on+ATFXDm0pum
	9KxWpAAG4WeEUhadwQF+Fa6YyupUZ5+G9IY71kzvEEB3likaMisVVOl1I1MMoHSb0RF1MtkVfjh
	2s21LtvwLkgxlXxF5lYJET2WwSwJ5LfkMOR75Oy//RVv2AqdPynyOgbGwHV/5yYLJy+hnX+IR05
	vN2DYvCq19qhKlXiyVuwfz5fuu9BzPZcMKOnCt8/hAQUvQwTSKNDhNa+K03cwMtuK8jnBXPhNU3
	Gbgs6gXcms5OedcqNsqsXXN0LkuoVr4rAxm4bMI9EFAI7YtZ293vUdZOg7dBkS2lPWJYghZAWoM
	CMAamuIIaFfYO/LNww/D7ISuBk1HfyajbUOLlfdJOL30+SQnTETtPHHA/BdSXV0kV5P0CCX0GHJ
	CuwUzsswe5i4JWPNF3Ju+Y8BRDAovbuZ+tr89BiWqjkM5/XjdymB2bDhbX7iEH+w12eu+Es60gU
	o/RldXgiGtqnjmPTU6a
X-Received: by 2002:a17:903:3d05:b0:2c9:aae1:a611 with SMTP id d9443c01a7336-2d3b0fc1d57mr241491965ad.23.1786899676468;
        Sun, 16 Aug 2026 10:01:16 -0700 (PDT)
Received: from localhost ([123.110.162.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aeb2b07csm26037385ad.51.2026.08.16.10.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 10:01:15 -0700 (PDT)
From: Huasin Liao <huasinliao@gmail.com>
To: asmadeus@codewreck.org
Cc: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	richard@nod.at,
	tudor.ambarus@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	huasin.liao@airoha.com
Subject: Re: [PATCH] mtd: spinand: winbond: add support for W25N04LV
Date: Mon, 17 Aug 2026 00:56:14 +0800
Message-Id: <20260816165614.16262-1-huasinliao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <aoGcpsZFxXdtkspZ@codewreck.org>
References: <aoGcpsZFxXdtkspZ@codewreck.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_100117_523205_62DF12AD 
X-CRM114-Status: GOOD (  13.44  )
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

RG9taW5pcXVlIE1hcnRpbmV0IHdyb3RlIG9uIFN1biwgQXVnIDE2LCAyMDI2IGF0IDIwOjE5OjAy
ICswOTAwOgo+IEh1YXNpbiBMaWFvIHdyb3RlIG9uIFN1biwgQXVnIDE2LCAyMDI2IGF0IDA1OjMx
OjI0UE0gKzA4MDA6Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25k
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMKPj4gaW5kZXggOWI3OGMxZTZjYmM5
Li44OTIyMjBhMTJiMjIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJv
bmQuYwo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMKPj4gQEAgLTM0NSw2
ICszNDUsMzUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGRfb29ibGF5b3V0X29wcyB3MjVuMDJr
dl9vb2JsYXlvdXQgPSB7Cj4+ICAJLmZyZWUgPSB3MjVuMDJrdl9vb2JsYXlvdXRfZnJlZSwKPj4g
IH07Cj4+ICAKPj4gK3N0YXRpYyBpbnQgdzI1bjA0bHZfb29ibGF5b3V0X2VjYyhzdHJ1Y3QgbXRk
X2luZm8gKm10ZCwgaW50IHNlY3Rpb24sCj4+ICsJCQkJICBzdHJ1Y3QgbXRkX29vYl9yZWdpb24g
KnJlZ2lvbikKPj4gK3sKPj4gKwlpZiAoc2VjdGlvbiA+IDcpCj4+ICsJCXJldHVybiAtRVJBTkdF
Owo+PiArCj4+ICsJcmVnaW9uLT5vZmZzZXQgPSAxMjggKyAoMTYgKiBzZWN0aW9uKTsKPj4gKwly
ZWdpb24tPmxlbmd0aCA9IDEzOwo+PiArCj4+ICsJcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gK3N0
YXRpYyBpbnQgdzI1bjA0bHZfb29ibGF5b3V0X2ZyZWUoc3RydWN0IG10ZF9pbmZvICptdGQsIGlu
dCBzZWN0aW9uLAo+PiArCQkJCSAgIHN0cnVjdCBtdGRfb29iX3JlZ2lvbiAqcmVnaW9uKQo+PiAr
ewo+PiArCWlmIChzZWN0aW9uID4gNykKPj4gKwkJcmV0dXJuIC1FUkFOR0U7Cj4+ICsKPj4gKwly
ZWdpb24tPm9mZnNldCA9ICgxNiAqIHNlY3Rpb24pICsgMjsKPj4gKwlyZWdpb24tPmxlbmd0aCA9
IDE0Owo+PiArCj4+ICsJcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgbXRkX29vYmxheW91dF9vcHMgdzI1bjA0bHZfb29ibGF5b3V0ID0gewo+PiArCS5lY2MgPSB3
MjVuMDRsdl9vb2JsYXlvdXRfZWNjLAo+PiArCS5mcmVlID0gdzI1bjA0bHZfb29ibGF5b3V0X2Zy
ZWUsCj4gCj4gRldJVywgdGhlc2UgdHdvIGFyZSB0aGUgc2FtZSBhcyB3aGF0IEkgY29uc29saWRh
dGVkIGluCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDgxNC13MjVuMDRsdy12My0x
LWM2YTc0MjNhYzdkMEBhdG1hcmstdGVjaG5vLmNvbQo+IHVzaW5nIG9vYnNpemUsIHNvIHdlIHBy
b2JhYmx5IHdhbnQgdG8gcmV1c2UgdGhhdCBoZXJlIHRvbwoKVGhhbmtzIGZvciB0aGUgcG9pbnRl
ciwgYW5kIGdvb2QgdG8gc2VlIE1pcXVlbCBpcyBmaW5lIHdpdGggcmV1c2luZwp3MjVuMDJrdl9v
b2JsYXlvdXQuIE9uY2UgeW91ciBwYXRjaCBsYW5kcywgSSdsbCByZWJhc2Ugb24gdG9wIG9mIGl0
CmFuZCBzd2l0Y2ggZnJvbSB3MjVuMDRsdl9vb2JsYXlvdXQgdG8gdzI1bjAya3Zfb29ibGF5b3V0
IOKAlCBpcyB0aGF0IGluCmxpbmUgd2l0aCB3aGF0IHlvdSdkIGV4cGVjdD8KCkh1YXNpbiBMaWFv
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
