Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE37C77B7E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jun 2023 07:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9wprcZDkz+MEEqpKGRmt3/9N6muWTpMSD1bP9E4Uxzw=; b=3x4upVtB0niUYt
	sUUwD/03Oa70y2l21guBdsXqDd3jaoIQr5mNyjHVrZSWhoWdVlWs5vQ/C4Zkxw4kg91tEafIQK66G
	uBy8hKYkXtN4ulU5sQ0e+79vQML2TqDxmOELWAeT8KXQNWKr6LJlJcMv+Xeap1O6KsTFlsrOK4fPR
	Vru5gcoR/yVC4ApfoxzNLQqB3JCrnwtnf6Si190QN8yEl6ZO1TDKAcYX7d2WaRSsOeA9X0EAzc5CU
	N7T+KJN2XB3rT1xN/35xWda4wnMM5+GxmL01WUMxSKVPDwFvld6VUVIT3oJbphu85U4IhoiZsZvRQ
	1BV2eaW4mqWTsIsZv4AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4d68-002QqP-0e;
	Thu, 01 Jun 2023 07:51:52 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4d64-002QoP-1d;
	Thu, 01 Jun 2023 07:51:49 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685605905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+e3wI1fiGsWTXmwy45Q9EAm7dA/PfrhNn8PVmuub8MY=;
	b=TgHA9VRFQkRXiNheNuKMUqBNVBf4NnoNZONHtuauHx+qh42PQfCljDf+8E1hPkA8QC2oc8
	fa8Nnerjm7B1SBFxtQVgQyrSeJa+fN1ljPwppadYcpWzF8xgK3Hz/1gmtkizHWroa5BDZj
	A/u0Qt1FrkOCkcHPaIXAXkvshawn9JTLP6LKc5rUbCTWoQPEvy/5ZeMgjNeDiqU+uOtLVB
	DUaADvukxsrrfeE5QKp/Asymr3fuJW2eGCF5Wwj75vrlWYxgfEHiEFqO4xNnWbUoKhmFmc
	UAryJpQBYJjvGF6WUrUkFZweWcI39buTkk0JpF8WVKwWpN+bql/oDquB6GrsYw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D4D7E000D;
	Thu,  1 Jun 2023 07:51:43 +0000 (UTC)
Date: Thu, 1 Jun 2023 09:51:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v5 1/6] mtd: rawnand: meson: fix ready/busy command
Message-ID: <20230601095142.3a611b5a@xps-13>
In-Reply-To: <20230601061850.3907800-2-AVKrasnov@sberdevices.ru>
References: <20230601061850.3907800-1-AVKrasnov@sberdevices.ru>
	<20230601061850.3907800-2-AVKrasnov@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_005148_677331_FB9A3663 
X-CRM114-Status: GOOD (  11.72  )
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

SGkgQXJzZW5peSwKCkFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUaHUsIDEgSnVu
IDIwMjMgMDk6MTg6NDQgKzAzMDA6Cgo+IFRoaXMgZml4ZXMgcmVhZHkvYnVzeSBjb21tYW5kIHZh
bHVlLgoKbml0OiAiRml4IHRoZSByZWFkeS9idXN5IGNvbW1hbmQgdmFsdWUuIgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEFyc2VuaXkgS3Jhc25vdiA8QVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1Pgo+IC0t
LQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCAyICstCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9t
ZXNvbl9uYW5kLmMKPiBpbmRleCAwNzRlMTQyMjVjMDYuLjlkZDRhNjc2NDk3YiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiArKysgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiBAQCAtMzcsNyArMzcsNyBAQAo+ICAjZGVmaW5lIE5G
Q19DTURfU0NSQU1CTEVSX0VOQUJMRQlCSVQoMTkpCj4gICNkZWZpbmUgTkZDX0NNRF9TQ1JBTUJM
RVJfRElTQUJMRQkwCj4gICNkZWZpbmUgTkZDX0NNRF9TSE9SVE1PREVfRElTQUJMRQkwCj4gLSNk
ZWZpbmUgTkZDX0NNRF9SQl9JTlQJCUJJVCgxNCkKPiArI2RlZmluZSBORkNfQ01EX1JCX0lOVAkJ
KCgweGIgPDwgMTApIHwgQklUKDE4KSB8IEJJVCgxNikpCj4gIAo+ICAjZGVmaW5lIE5GQ19DTURf
R0VUX1NJWkUoeCkJKCgoeCkgPj4gMjIpICYgR0VOTUFTSyg0LCAwKSkKPiAgCgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
