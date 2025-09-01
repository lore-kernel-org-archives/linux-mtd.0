Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8722FCA0FFF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 14:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CL7ht5ZhlE5LciTCnRLUYrFUDuGO+zhKADyvd5X3+l8=; b=qtcPawLIVY2fBX
	MEYTRBsIIPOh0P9ogBdeRGfBCCGaN42WBLQ4+LWwZOXZzSZheyO6HcfMndMJlBK2N/JQ3mU+mmDno
	AH/D7End3jLajSDP3H4tI2O/ZfnnCU2I2+lvEVW5SQOksNfdkh72zjDpEsSW+xFkJWA95jhl1IkAu
	AuaytmN9efW5gqTqKCHYu4JoiPELXie3GSOkA06125q/KoTFTcDZPHmreoSxPZiU+i/KuMNwox2m2
	YXH03FY7HtEL4A95abrEr4PJC4HF8h3GutBvgJxtGP9lsEqzpyBx1O2gu9XHxPFXOklT42UxM9Mg8
	n1Vo8+Uz+TAt/OWABg9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5u8-0000000Cvj2-2k3A;
	Mon, 01 Sep 2025 14:53:08 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3cA-0000000CQVO-38TK
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 12:26:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9B4011A0A08;
	Mon,  1 Sep 2025 12:26:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 72A3C60699;
	Mon,  1 Sep 2025 12:26:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF8801C22C8BB;
	Mon,  1 Sep 2025 14:26:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729584; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UbSWQH4bFjDPLvG/kct3uB1vklz5zdXrHO0a0fdTay4=;
	b=QNTbYNtZGe/Rez2qkXQ8x/CtwL54EdeCkYpZimpV6z9LZpAAQhzSoQSGHRowQPL65c6YOn
	h5DHmNwb9cdUNlhZ6IsGEWP3Fn+t3tVXZ2b2JGqxwCBuK0n0jFx4Di4OE6OdPZ6iLuFlfh
	5xvvn77xkblzZgAd8R6ssFvDwqvgwRmaYKdd7CuMaKslNGRp6Ynwb3SbPU9gWugcf9U76D
	BQ6R3EIv92iIaUohi40gFILMLcUyX9TvySgtQKv78bfhivWMpHQu1VgXJ/M4CHfqpECzWk
	m5g57zuMiTqNX4CMIhGNvN4y4REkGgcBQ33UsKmcKmniKvUH2ykhoKd20VL+4A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Balamanikandan.Gunasundar@microchip.com, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20250821120106.346869-1-alexander.sverdlin@siemens.com>
References: <20250821120106.346869-1-alexander.sverdlin@siemens.com>
Subject: Re: [PATCH v2] mtd: nand: raw: atmel: Respect tAR, tCLR in read
 setup timing
Message-Id: <175672957665.48300.9426658311064681547.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:26:16 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052626_921878_0CB5883C 
X-CRM114-Status: UNSURE (   6.46  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCAyMSBBdWcgMjAyNSAxNDowMDo1NyArMDIwMCwgQS4gU3ZlcmRsaW4gd3JvdGU6Cj4g
SGF2aW5nIHNldHVwIHRpbWUgMCB2aW9sYXRlcyB0QVIsIHRDTFIgb2Ygc29tZSBjaGlwcywgZm9y
IGluc3RhbmNlCj4gVE9TSElCQSBUQzU4TlZHMlMzRVRBSTAgY2Fubm90IGJlIGRldGVjdGVkIHN1
Y2Nlc3NmdWxseSAoZmlyc3QgSUQgYnl0ZQo+IGJlaW5nIHJlYWQgZHVwbGljYXRlZCwgaS5lLiA5
OCA5OCBkYyA5MCAxNSA3NiAxNCAwMyBpbnN0ZWFkIG9mCj4gOTggZGMgOTAgMTUgNzYgLi4uKS4K
PiAKPiBBdG1lbCBBcHBsaWNhdGlvbiBOb3RlcyBwb3N0dWxhdGVkIDEgY3ljbGUgTlJEX1NFVFVQ
IHdpdGhvdXQgZXhwbGFuYXRpb24KPiBbMV0sIGJ1dCBpdCBsb29rcyBtb3JlIGFwcHJvcHJpYXRl
IHRvIGp1c3QgY2FsY3VsYXRlIHNldHVwIHRpbWUgcHJvcGVybHkuCj4gCj4gWy4uLl0KCkFwcGxp
ZWQgdG8gbXRkL2ZpeGVzLCB0aGFua3MhCgpbMS8xXSBtdGQ6IG5hbmQ6IHJhdzogYXRtZWw6IFJl
c3BlY3QgdEFSLCB0Q0xSIGluIHJlYWQgc2V0dXAgdGltaW5nCiAgICAgIGNvbW1pdDogZmQ3Nzll
YWMyZDY1OTY2OGJlNGQzZGJkYWMwNzEwYWZkNWQ2ZGIxMgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBh
dmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBS
IChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJk
cywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
