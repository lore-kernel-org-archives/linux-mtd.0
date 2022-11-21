Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C31C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 11:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhFvvrKQgT6hI0g4iRebFKF+s7eq694xlRBQddEr3u0=; b=jMNvS2luCQRi39GKeTISKhgt6Y
	xTBJ/bJyJzPq8Y9tncxyeCRN4fa7rzYq32J2kLgm6j1IatcD6lbjmhvhb9vDmv7tSQQ/Jhe5pc4Tw
	DQE7dY+EuNg14OkXmzMJork6do37EZYlK7imCiUiSwU9KWwkfnUwOnCwW1Hv2wfbp9yrekaptPFB8
	7DZVEw4csBOo8lknv9ibIPGq0DaXJ+OpbU1UUa+m6guojPcUnWvpVPw1wwBsCKaVtCm/qgJ/jejXE
	hB8qVxfPHQiS9OtFfh4qxm+MDvtlGXr+E0GDSqDIrrTlNnJT+tCRSCQYWtcQQG8khWoK7vKCwCy9E
	+CvQGTzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4Zx-00Clj0-12; Mon, 21 Nov 2022 11:03:09 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4Zm-00ClgK-A9; Mon, 21 Nov 2022 11:03:00 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 793BB230D;
	Mon, 21 Nov 2022 12:02:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1669028572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hYQCfElNVQ+lJjNKVWhRYCzN7ZoFtPC5hBsy0r/wg3k=;
	b=KsB2e5VCFsJFnCOxgaRSw//7fihm9d64czDVlYPuBtEsPEyl/PDqwx2h6NThLC3/8PsWLW
	GcxMoG303NMwqiNHnRL7tUcp1odc2wuAr7RVQRXF7JuJMAtGD7XSS4iOSLyJMaQxKYC9+C
	UYmr8r7Y3l/t9uK7HAeWDixO8tTAHaBGe70qweuLVIE7+WaTaoGoJn3Ei9uqX3TDOecZzd
	i8xb4XYEdJlCoNREbB/SMi0J4wXfmwO2v2B7ysF5qSezdnvIE1WKdlyYpIYW8mJ6/rixEL
	Bnk2kVx5dCNfFMtfFpJVraAVG1y6dVpfCZtdQChQqinnYYhWIF2v2WOzm6Y2Bg==
MIME-Version: 1.0
Date: Mon, 21 Nov 2022 12:02:52 +0100
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH dt-schema.git] schemas: add NVMEM cell with
 #nvmem-cell-cells
In-Reply-To: <20221121105830.7411-1-zajec5@gmail.com>
References: <20221121105830.7411-1-zajec5@gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <0a207dda53cd04b40c80fc5950a7d067@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_030258_674267_080CD959 
X-CRM114-Status: GOOD (  14.84  )
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

QW0gMjAyMi0xMS0yMSAxMTo1OCwgc2NocmllYiBSYWZhxYIgTWnFgmVja2k6Cj4gRnJvbTogUmFm
YcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IAo+IFNvbWUgTlZNRU0gY2VsbHMgbWF5
IHByb3ZpZGUgbW9yZSB0aGFuIDEgdmFsdWUuIEFuIGV4YW1wbGUgY2FuIGJlIGJhc2UKPiBNQUMg
YWRkcmVzcyB0aGF0IGlzIHVzZWQgZm9yIGNhbGN1bGF0aW5nIG11bHRpcGxlIE1BQ3MgKGZvciBm
ZXcKPiBkaWZmZXJlbnQgZGV2aWNlcykuIEZvciBzcGVjaWZ5aW5nIHZhbHVlIHRvIHJlYWQgcGhh
bmRsZSBuZWVkcyB0byBiZQo+IHVzZWQgd2l0aCBhbiBhcmd1bWVudC4KPiAKPiBDYzogU3Jpbml2
YXMgS2FuZGFnYXRsYSIgPHNyaW5pdmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz4KPiBDYzogTWlj
aGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz4KPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnF
gmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gLS0tCj4gVGhpcyBiaXQgaXMgcmVxdWlyZWQgZm9y
IG1vdmluZyBmb3J3YXJkIHdpdGggdGhlCj4gW1BBVENIIHYyIDAwLzIwXSBudm1lbTogY29yZTog
aW50cm9kdWNlIE5WTUVNIGxheW91dHMKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1h
cm0ta2VybmVsLzIwMjIwOTAxMjIxODU3LjI2MDAzNDAtMS1taWNoYWVsQHdhbGxlLmNjLwo+IAo+
IEFzIHBvaW50ZWQgb3V0IGJ5IFJvYiAjbnZtZW0tY2VsbC1jZWxscyBzaG91bGQgYmUgYWRkZWQg
dG8gdGhlIAo+IGR0LXNjaGVtYQo+IGFuZCBub3QgYSBMaW51eCBiaW5kaW5nOgo+IFJlOiBbUEFU
Q0ggdjIgMTUvMjBdIGR0LWJpbmRpbmdzOiBudm1lbTogYWRkIFlBTUwgc2NoZW1hIGZvciB0aGUg
c2wyOCAKPiB2cGQgbGF5b3V0Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtl
cm5lbC8yMDIyMDkxMjE5MjAzOC5HQTE2NjE1NTAtcm9iaEBrZXJuZWwub3JnLwo+IAo+IHNsMjgg
aXMgb25lIGV4YW1wbGUgdGhhdCBuZWVkcyAjbnZtZW0tY2VsbC1jZWxscwo+IHUtYm9vdCxlbnYg
aXMgYW5vdGhlciBvbmUKPiAKPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSBnb3QgdGhpcyBiaW5k
aW5nIHJpZ2h0IGF0IGFsbC4KClRoZXJlIGlzIGFsc28gYSBwdWxsIHJlcXVlc3Q6Cmh0dHBzOi8v
Z2l0aHViLmNvbS9kZXZpY2V0cmVlLW9yZy9kdC1zY2hlbWEvcHVsbC84OQoKSSdtIG5vdCBzdXJl
IGFib3V0IHRoZSBjb3JyZWN0IHdheSB0byBzdWJtaXQgcGF0Y2hlcyB0byBkdHNjaGVtYS4KCi1t
aWNoYWVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
