Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B099C54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 10:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmSfkxn8gsokvE7q7yFchFwWTAtvhvhBRFpxO6og/XM=; b=RBWrqJ5KqoJj/X
	wHhWxFLIxYKnAmoFVZDHbM7c8asxLf4uwB6hwz4749er7WWjBo1ukCJ55yZB81aSU26sfveSjKPJR
	Q+oF9a7ajMdG6W8whZ66pvej3ICra4+Bn8PsjRyDe/oOMpiAzI+0T5BgH/87niNy5ISiiVd6TLGUE
	88u4C67lP6aHjSkZ5Jj6uZbOY6GbUWhCwXa0eWTiz/RV7J3sQ6U/0sFXT34sdVPWH+yXRTJ4OL31M
	3hZwTfEWRbJK0/lUkLbgRWdQOtBtDTV8/+Cb3aCAjFh4GcbMG8uV81/8LQ/85dh4BtU5p/lC9lYhb
	3wKwsC2NPrJaXs9gTQuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reY7A-0000000011C-0y23;
	Mon, 26 Feb 2024 10:21:40 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reY76-000000000ze-26dT;
	Mon, 26 Feb 2024 10:21:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 307D520017;
	Mon, 26 Feb 2024 10:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708942893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9atkydl0QJMpqVx+Mp3qMYN15UNdxqngzP9FbgdYuuw=;
	b=flq+W0cBjqqwu9qC+BNB8to/cq+RAlZHyxmQ1+h1Przde1RcY+49LPEUVueQt0aTLNaZUJ
	xAmRjhb0A7U33bY4D6gaTkp8l0grxp3eaNbx3z1ugRgW0JLivVZ1A8WDwmc4WoD98pyW6w
	zWTRwu+xF7c2AWaL1vAtD8J+GOFaMHvUSpgC7cp0YZkD+AqaLfD/pm9SWbJknsj3GHcAt/
	fR8QAfNG+eR5n4Kn3D/UrRZpJeuR0Jehi6DL99UxxKGF/tQfQzqkWdjRYhEYOCV9QhA1kV
	SozyTh3q7ofJrXbycMdCeIIxLhSGeq9Qso3pnj7iumZqjz6unY3X/tN7aRtjug==
Date: Mon, 26 Feb 2024 11:21:32 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: claudiu.beznea@tuxon.dev, nicolas.ferre@microchip.com,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Remove T Ambarus from few mchp entries
Message-ID: <20240226112132.22025454@xps-13>
In-Reply-To: <20240226094718.29104-1-tudor.ambarus@linaro.org>
References: <20240226094718.29104-1-tudor.ambarus@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_022136_711608_268FAD04 
X-CRM114-Status: GOOD (  12.17  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gTW9uLCAyNiBGZWIg
MjAyNCAxMTo0NzoxOCArMDIwMDoKCj4gSSBoYXZlIGJlZW4gbm8gbG9uZ2VyIGF0IE1pY3JvY2hp
cCBmb3IgbW9yZSB0aGFuIGEgeWVhciBhbmQgSSdtIG5vCj4gbG9uZ2VyIGludGVyZXN0ZWQgaW4g
bWFpbnRhaW5pbmcgdGhlc2UgZHJpdmVycy4gTGV0IG90aGVyIG1jaHAgcGVvcGxlCj4gc3RlcCB1
cCwgdGh1cyByZW1vdmUgbXlzZWxmLiBUaGFua3MgZm9yIHRoZSBuaWNlIGNvbGxhYm9yYXRpb24g
ZXZlcnlvbmUhCj4gCj4gU2lnbmVkLW9mZi1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1
c0BsaW5hcm8ub3JnPgo+IC0tLQo+IFNoYWxsIGJlIHF1ZXVlZCB0aHJvdWdoIHRoZSBhdDkxIHRy
ZWUuCj4gCj4gIE1BSU5UQUlORVJTIHwgMTQgLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDE0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5U
QUlORVJTCj4gaW5kZXggZTE0NzVjYTM4ZmYyLi5mZDRkNGU1OGZlYWQgMTAwNjQ0Cj4gLS0tIGEv
TUFJTlRBSU5FUlMKPiArKysgYi9NQUlOVEFJTkVSUwo+IEBAIC0xNDM1MCw3ICsxNDM1MCw2IEBA
IEY6CWRyaXZlcnMvbWlzYy94aWxpbnhfdG1yX21hbmFnZXIuYwo+ICAKPiAgTUlDUk9DSElQIEFU
OTEgRE1BIERSSVZFUlMKPiAgTToJTHVkb3ZpYyBEZXNyb2NoZXMgPGx1ZG92aWMuZGVzcm9jaGVz
QG1pY3JvY2hpcC5jb20+Cj4gLU06CVR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJv
Lm9yZz4KPiAgTDoJbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnIChtb2RlcmF0
ZWQgZm9yIG5vbi1zdWJzY3JpYmVycykKPiAgTDoJZG1hZW5naW5lQHZnZXIua2VybmVsLm9yZwo+
ICBTOglTdXBwb3J0ZWQKPiBAQCAtMTQzOTgsMTIgKzE0Mzk3LDYgQEAgUzoJU3VwcG9ydGVkCj4g
IEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9taWNyb2NoaXAsY3Np
MmRjLnlhbWwKPiAgRjoJZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9taWNyb2NoaXAvbWljcm9jaGlw
LWNzaTJkYy5jCj4gIAo+IC1NSUNST0NISVAgRUNDIERSSVZFUgo+IC1NOglUdWRvciBBbWJhcnVz
IDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+Cj4gLUw6CWxpbnV4LWNyeXB0b0B2Z2VyLmtlcm5l
bC5vcmcKPiAtUzoJTWFpbnRhaW5lZAo+IC1GOglkcml2ZXJzL2NyeXB0by9hdG1lbC1lY2MuKgo+
IC0KPiAgTUlDUk9DSElQIEVJQyBEUklWRVIKPiAgTToJQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUu
YmV6bmVhQHR1eG9uLmRldj4KPiAgTDoJbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnIChtb2RlcmF0ZWQgZm9yIG5vbi1zdWJzY3JpYmVycykKPiBAQCAtMTQ1MDUsMTMgKzE0NDk4
LDYgQEAgTToJQXViaW4gQ29uc3RhbnMgPGF1YmluLmNvbnN0YW5zQG1pY3JvY2hpcC5jb20+Cj4g
IFM6CU1haW50YWluZWQKPiAgRjoJZHJpdmVycy9tbWMvaG9zdC9hdG1lbC1tY2kuYwo+ICAKPiAt
TUlDUk9DSElQIE5BTkQgRFJJVkVSCj4gLU06CVR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNA
bGluYXJvLm9yZz4KPiAtTDoJbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiAtUzoJU3Vw
cG9ydGVkCj4gLUY6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYXRtZWwt
bmFuZC50eHQKPiAtRjoJZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRtZWwvKgoKQ291bGQgd2UgbWFy
ayB0aGVzZSBlbnRyaWVzIG9ycGhhbmVkIGluc3RlYWQgb2YgcmVtb3ZpbmcgdGhlbT8KCj4gLQo+
ICBNSUNST0NISVAgT1RQQyBEUklWRVIKPiAgTToJQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6
bmVhQHR1eG9uLmRldj4KPiAgTDoJbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
IChtb2RlcmF0ZWQgZm9yIG5vbi1zdWJzY3JpYmVycykKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
