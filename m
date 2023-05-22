Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99200C7EE2E
	for <linux-mtd@archiver.kernel.org>; Mon, 22 May 2023 15:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q1Qobrlu6jJ/9pm4TlakSWlRmf5CX8VoLou5XYdlCKM=; b=3VAnfNSe/jyJu0
	YJXk3wl/5h0YeZ56WXsamaQXUOhHfsNrvKgICq71Y3b2JO7GkeVz3t/2AqOM9UQBh+nIrDh+LK2CR
	rVwB9B3PpYHQGQeg7zSNDVidjFgNKUDOex7e389TalQFnfblyPbOLAXvCq0Bws5N1wScG71u4/o/j
	TlUMDsueQFeqctgWCrHMLdmovGnWpCRWb3yQee4wMioUAJKnj8FI0+rxaZTSZ9CkzKxU8UmsmfWN1
	rLfUGOB75IS9hJqx5jG3eEXfdqFHa1eocfGLDVVpqr/KsoObB20UkPn7DcGlMd6XKWx2ij18z13KS
	wmESa5PEYT+reRch8sng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q17c8-0072sb-3D;
	Mon, 22 May 2023 15:38:25 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q17c4-0072pr-2j;
	Mon, 22 May 2023 15:38:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B94BC40005;
	Mon, 22 May 2023 15:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684769896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fobMpz8BL8MtzooPlML6W2zGP3RefL4jTmJUBQtPwS0=;
	b=ZaUeAfs7Wf2Cky73Ot2eCqOz0xclyiC70to6Qtse05PvYKAClitVRBnW8NgxQ3t30snZw7
	uH3MG4pd1LiMTddhHXvZLRHyN0I+xinwFPvkUKtLycsvKNZu5Z8qqQnsg9oFBOpa4APeIl
	SQYpoqwFdSSI6327uqqnTj88C/cyUNxpRFzGp2a1dSsbxhh6X3XjdudUxMLfzLUl5IrDWJ
	zMJelwFXFRHIqiEECa9auOyEwoG+Z+tVUYTMFIg277g/w4zvr0fSNZ37ZN0wk4FxtGa+4O
	7+melQk7RSLDW1pR4D3L7/jm7PxtaQ4DojMUodTBtD/B2vYX/KoGv6bFIfws0g==
Date: Mon, 22 May 2023 17:38:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/5] mtd: rawnand: meson: always read whole OOB bytes
Message-ID: <20230522173813.08afe6b8@xps-13>
In-Reply-To: <20230515094440.3552094-4-AVKrasnov@sberdevices.ru>
References: <20230515094440.3552094-1-AVKrasnov@sberdevices.ru>
	<20230515094440.3552094-4-AVKrasnov@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_083821_015276_5C1B02B0 
X-CRM114-Status: GOOD (  16.57  )
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

SGkgQXJzZW5peSwKCkFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBNb24sIDE1IE1h
eSAyMDIzIDEyOjQ0OjM3ICswMzAwOgoKPiBUaGlzIGNoYW5nZXMgc2l6ZSBvZiByZWFkIGFjY2Vz
cyB0byBPT0IgYXJlYSBieSByZWFkaW5nIGFsbCBieXRlcyBvZgo+IE9PQiAoZnJlZSBieXRlcyAr
IEVDQyBlbmdpbmUgYnl0ZXMpLgoKVGhpcyBpcyBub3JtYWxseSB1cCB0byB0aGUgdXNlciAodXNl
ciBpbiB5b3VyIGNhc2UgPT0gamZmczIpLiBUaGUKY29udHJvbGxlciBkcml2ZXIgc2hvdWxkIGV4
cG9zZSBhIG51bWJlciBvZiB1c2VyIGFjY2Vzc2libGUgYnl0ZXMgYW5kCnRoZW4gd2hlbiB1c2Vy
cyB3YW50IHRoZSBPT0IgYXJlYSwgdGhleSBzaG91bGQgYWNjZXNzIGl0IGVudGlyZWx5LiBPbgp0
b3Agb2YgdGhhdCByZWFkLCB0aGV5IGNhbiBleHRyYWN0IChvciAid3JpdGUgb25seSIpIHRoZSB1
c2VyIGJ5dGVzLgoKPiBTaWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNub3YgPEFWS3Jhc25vdkBz
YmVyZGV2aWNlcy5ydT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5j
IHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25h
bmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+IGluZGV4IDg1MjZhNmI4
NzcyMC4uYTMxMTA2Yzk0M2Q3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21l
c29uX25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+IEBA
IC03NTUsNiArNzU1LDMwIEBAIHN0YXRpYyBpbnQgX19tZXNvbl9uZmNfcmVhZF9vb2Ioc3RydWN0
IG5hbmRfY2hpcCAqbmFuZCwgaW50IHBhZ2UsCj4gIAl1MzIgb29iX2J5dGVzOwo+ICAJdTMyIHBh
Z2Vfc2l6ZTsKPiAgCWludCByZXQ7Cj4gKwlpbnQgaTsKPiArCj4gKwkvKiBSZWFkIEVDQyBjb2Rl
cyBhbmQgdXNlciBieXRlcy4gKi8KPiArCWZvciAoaSA9IDA7IGkgPCBuYW5kLT5lY2Muc3RlcHM7
IGkrKykgewo+ICsJCXUzMiBlY2Nfb2ZmcyA9IG5hbmQtPmVjYy5zaXplICogKGkgKyAxKSArCj4g
KwkJCSAgICAgICBORkNfT09CX1BFUl9FQ0MobmFuZCkgKiBpOwo+ICsKPiArCQlyZXQgPSBuYW5k
X3JlYWRfcGFnZV9vcChuYW5kLCBwYWdlLCAwLCBOVUxMLCAwKTsKPiArCQlpZiAocmV0KQo+ICsJ
CQlyZXR1cm4gcmV0Owo+ICsKPiArCQkvKiBVc2UgdGVtcG9yYXJ5IGJ1ZmZlciwgYmVjYXVzZSAn
bmFuZF9jaGFuZ2VfcmVhZF9jb2x1bW5fb3AoKScKPiArCQkgKiBzZWVtcyB3b3JrIHdpdGggc29t
ZSBhbGlnbm1lbnQsIHNvIHdlIGNhbid0IHJlYWQgZGF0YSB0bwo+ICsJCSAqICdvb2JfYnVmJyBk
aXJlY3RseS4KCkRNQT8KCj4gKwkJICovCj4gKwkJcmV0ID0gbmFuZF9jaGFuZ2VfcmVhZF9jb2x1
bW5fb3AobmFuZCwgZWNjX29mZnMsIG1lc29uX2NoaXAtPm9vYl9idWYsCj4gKwkJCQkJCSBORkNf
T09CX1BFUl9FQ0MobmFuZCksIGZhbHNlKTsKPiArCQlpZiAocmV0KQo+ICsJCQlyZXR1cm4gcmV0
Owo+ICsKPiArCQltZW1jcHkob29iX2J1ZiArIGkgKiBORkNfT09CX1BFUl9FQ0MobmFuZCksCj4g
KwkJICAgICAgIG1lc29uX2NoaXAtPm9vYl9idWYsCj4gKwkJICAgICAgIE5GQ19PT0JfUEVSX0VD
QyhuYW5kKSk7Cj4gKwl9Cj4gIAo+ICAJb29iX2J5dGVzID0gbWVzb25fbmZjX2dldF9vb2JfYnl0
ZXMobmFuZCk7Cj4gIAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
