Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601FAC7EE24
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 08:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FBAWfuhKqlQs9U9ffjfXMiV362mYK0jfi2ofxrK/dM=; b=Ip8sgJwT8PBpBq
	T+HSSgF3itXQNGGQ6TVUv2wbqLJLZYSxcMLFipjyRee+Hk/f/ZOnhGXUIdrc5rRL069yeRnEEFwm3
	0VaqMyxIduN4+6UnKSt0NK9WpNOvlgPSCgE/texQGeGrOhw0ZYOblc55YMc8Yir7s4W9in16YFd4i
	vheYx6lTv+NbUA8ZspchkHseXd5HDnmCXdh1pzSK+1ZheItZN0vGiU7cKb50poF0HJ4fnawoPS8u5
	9Ax7zftk0QxWB/Se7gMmtHvT2oeYX9gun+cwn6pL9zTuUeu5Rv/VkKsW/pXp5/hvnkeQad5b9p3FB
	TclxAZ/nbN0hBndWq/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q65PT-00EgZr-0r;
	Mon, 05 Jun 2023 08:17:51 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q65PO-00EgY9-1h;
	Mon, 05 Jun 2023 08:17:48 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685953062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gdAlxoLc+mdMpOk5isWATrbVT+kMTap6Q3uXBMQmEUc=;
	b=lbmd7wKAXRz20bqQebmTUQ3lA8oFmKhG78pmycCoMN+7cJ3zihD6ZWJApUzgpDmZr44UFh
	BZymwwSHqmpod20ANFdYpqmCdYz7czRvJYTUk/aWywLf/d7o7p2vrZQkXZGfulaATEInx8
	oGth25NHshSCMzwgI+aU+hIwUcF4D8uvVTyVBAtp+U9dlIy0oYqxkuN53zPO28b6srNL/0
	FJeFv69+2zWvzRoOq1tbQ/I/+nml5DKOTkBIEugYeXx2jU9FHpO3akER025fuLBPfZmBSX
	XlhLlq0Tmu3Z++ZNoUiWEyYwy7VUqu6vpp3m+0fWbfFmqfNCA2bCCcu1g3iLfw==
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
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAAAFC000D;
	Mon,  5 Jun 2023 08:17:40 +0000 (UTC)
Date: Mon, 5 Jun 2023 10:17:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, <stable@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Liang
 Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix ready/busy command
Message-ID: <20230605101739.069b98af@xps-13>
In-Reply-To: <19f809ab-218e-8da5-6d5e-ac47902fa706@sberdevices.ru>
References: <20230605061048.485622-1-AVKrasnov@sberdevices.ru>
	<19f809ab-218e-8da5-6d5e-ac47902fa706@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_011746_984270_10AA6195 
X-CRM114-Status: GOOD (  17.36  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBNb24sIDUgSnVu
IDIwMjMgMDk6Mzk6NDAgKzAzMDA6Cgo+IEhlbGxvIE1pcXVlbCEKPiAKPiBJIGV4Y2x1ZGUgdGhp
cyBwYXRjaCBmcm9tIHRoZSByZWNlbnQgTWVzb24gcGF0Y2hzZXQsIGFzIGl0IGlzIGZpeCBhbmQg
bm90IHJlbGF0ZWQgdG8gYW5vdGhlciBwYXRjaGVzLgo+IEFsc28gSSB0aGluayB0aGF0IEkgY2Fu
IHNwbGl0IE1lc29uIHBhdGNoc2V0IChmcm9tIGxpbmtzIGJlbG93KSBpbiB0aGUgZm9sbG93aW5n
IHdheToKPiAxKSBQYXRjaC9wYXRjaHNldCBmb3IgT09CIGxheW91dAo+IDIpIFBhdGNoc2V0IGZv
ciAibmFuZC1yYiIgbG9naWMgKG1lc29uX25hbmQuYyArIERUIGJpbmRpbmdzKQo+IFRoZXNlIHR3
byBjYW4gYWxzbyBnbyBpbmRlcGVuZGVudGx5Ogo+IDMpIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LW10ZC8yMDIzMDYwMTA2MTg1MC4zOTA3ODAwLTYtQVZLcmFzbm92QHNiZXJkZXZpY2Vz
LnJ1Lwo+IDQpIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIzMDYwMTA2MTg1
MC4zOTA3ODAwLTctQVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1LwoKTEdUTS4KCj4gCj4gV2hhdCBk
byBZb3UgdGhpbms/Cj4gCj4gVGhhbmtzLCBBcnNlbml5Cj4gCj4gT24gMDUuMDYuMjAyMyAwOTox
MCwgQXJzZW5peSBLcmFzbm92IHdyb3RlOgo+ID4gRml4IHRoZSByZWFkeS9idXN5IGNvbW1hbmQg
dmFsdWUuCj4gPiAKPiA+IEZpeGVzOiA4ZmFlODU2YzUzNTAgKCJtdGQ6IHJhd25hbmQ6IG1lc29u
OiBhZGQgc3VwcG9ydCBmb3IgQW1sb2dpYyBOQU5EIGZsYXNoIGNvbnRyb2xsZXIiKQo+ID4gQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+IFN1Z2dlc3RlZC1ieTogTGlhbmcgWWFuZyA8bGlh
bmcueWFuZ0BhbWxvZ2ljLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEFyc2VuaXkgS3Jhc25vdiA8
QVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9y
YXcvbWVzb25fbmFuZC5jIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbWVzb25fbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4gPiBp
bmRleCAwNzRlMTQyMjVjMDYuLjlkZDRhNjc2NDk3YiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bWVzb25fbmFuZC5jCj4gPiBAQCAtMzcsNyArMzcsNyBAQAo+ID4gICNkZWZpbmUgTkZDX0NNRF9T
Q1JBTUJMRVJfRU5BQkxFCUJJVCgxOSkKPiA+ICAjZGVmaW5lIE5GQ19DTURfU0NSQU1CTEVSX0RJ
U0FCTEUJMAo+ID4gICNkZWZpbmUgTkZDX0NNRF9TSE9SVE1PREVfRElTQUJMRQkwCj4gPiAtI2Rl
ZmluZSBORkNfQ01EX1JCX0lOVAkJQklUKDE0KQo+ID4gKyNkZWZpbmUgTkZDX0NNRF9SQl9JTlQJ
CSgoMHhiIDw8IDEwKSB8IEJJVCgxOCkgfCBCSVQoMTYpKQo+ID4gIAo+ID4gICNkZWZpbmUgTkZD
X0NNRF9HRVRfU0laRSh4KQkoKCh4KSA+PiAyMikgJiBHRU5NQVNLKDQsIDApKQo+ID4gICAgCgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
