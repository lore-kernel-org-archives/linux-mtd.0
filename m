Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6E8C77B7E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jun 2023 07:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DoXCP8+Kc5+gGgqLQcF4e8CBpgOIGVCLZxqET27+HFU=; b=vQ82EaEe+V0Dbg
	ayWQZuBc1QPjWO4vvArWRnz0Btdb+TZbJ5GMEexNL/LKm4LLZ9OvS8ic3+ut2/W9v8tt3qeTfDthG
	61RR9+oceNZp4nRfPk76HsYWMmnUcNxV7sEDGhqnQBfMsmTn8g8UKH22Wnunf1p4nxRW7FaTu0XFQ
	vnjAzreh6a6rag5K79FDEh7VXbRuWpm08SieU3vfeMhoGZA8+grrDH1GWDcV37dFd2qpWik9zjfRq
	7xHACpp5QLLvHzBZUuMsfoE/NXgcFyq4V2bxhgSgU0JPS1gVSuNv90ihppLWCSlW3qwwO9GqqjRjL
	g3PnnY1EhY3UetTOw3og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4czi-002Paz-1z;
	Thu, 01 Jun 2023 07:45:14 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4czf-002PZd-1R
	for linux-mtd@lists.infradead.org;
	Thu, 01 Jun 2023 07:45:13 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685605505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E8q0kpo5yQyJlgrFOIwJycXOb57GbR9p3w4XAi+QTgQ=;
	b=aEhqsT/ShYWjw7oXndLY6YBS1LOxerrLwzyfKw02VgNZR19EmPgnsk526d4kQ3cGH35Zoo
	gqfNFry0Ycir3UnvMUHlGm9mBbCoJej//O1xqNxto9tK89alGjQkuHNYVwPcMcxaSl6SJ7
	T2FG8KNFO+l4noKA0IVF+9Yh+ywbXxyR2nth7xz4xWXnnTn+GV6nXK6IyRvcr62Kuk8VaN
	FU0aouzttm9Ssc5eca1rPXDjCVGTDBCIXXmrU4jRTqzgf7NTEHQIQa4EOK5OSlxvpOTham
	uNXmW6H8gUb2Kc/NSECSwQdazn1k3YWMJ9nG91aQxxsTpxbKv2af5zXx1F010A==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id BECA9FF804;
	Thu,  1 Jun 2023 07:45:02 +0000 (UTC)
Date: Thu, 1 Jun 2023 09:45:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Michael Peters
 <mpeters@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 23/43] dt-bindings: mtd: Add ts7250 nand-controller
Message-ID: <20230601094501.0d67d78a@xps-13>
In-Reply-To: <20230601054549.10843-5-nikita.shubin@maquefel.me>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
	<20230601054549.10843-5-nikita.shubin@maquefel.me>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_004511_753102_5E9112AB 
X-CRM114-Status: GOOD (  15.14  )
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

SGkgTmlraXRhLAoKbmlraXRhLnNodWJpbkBtYXF1ZWZlbC5tZSB3cm90ZSBvbiBUaHUsICAxIEp1
biAyMDIzIDA4OjQ1OjI4ICswMzAwOgoKPiBBZGQgWUFNTCBiaW5kaW5ncyBmb3IgdHM3MjUwIE5B
TkQgQ29udHJvbGxlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOaWtpdGEgU2h1YmluIDxuaWtpdGEu
c2h1YmluQG1hcXVlZmVsLm1lPgo+IC0tLQo+IAo+IE5vdGVzOgo+ICAgICB2MCAtPiB2MToKPiAg
ICAgCj4gICAgIG1ha2UgaXQgYSBuYW5kIGNvbnRvbGxlcgo+IAo+ICAuLi4vYmluZGluZ3MvbXRk
L3RlY2hub2xvZ2ljLG5hbmQueWFtbCAgICAgICAgfCA0NyArKysrKysrKysrKysrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3RlY2hub2xvZ2ljLG5hbmQueWFt
bAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L3RlY2hub2xvZ2ljLG5hbmQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvdGVjaG5vbG9naWMsbmFuZC55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjI2ZDFkOWMzMzMxZAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3RlY2hub2xvZ2ljLG5hbmQueWFtbAo+
IEBAIC0wLDAgKzEsNDcgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5IE9SIEJTRC0yLUNsYXVzZQo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvbXRkL3RlY2hub2xvZ2ljLG5hbmQueWFtbCMKPiArJHNjaGVt
YTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0
aXRsZTogVGVjaG5vbG9naWMgU3lzdGVtcyBOQU5EIGNvbnRyb2xsZXIKPiArCj4gK21haW50YWlu
ZXJzOgo+ICsgIC0gTmlraXRhIFNodWJpbiA8bmlraXRhLnNodWJpbkBtYXF1ZWZlbC5tZT4KPiAr
Cj4gK2FsbE9mOgo+ICsgIC0gJHJlZjogbmFuZC1jb250cm9sbGVyLnlhbWwKPiArCj4gK3Byb3Bl
cnRpZXM6Cj4gKyAgY29tcGF0aWJsZToKPiArICAgIG9uZU9mOgo+ICsgICAgICAtIGNvbnN0OiB0
ZWNobm9sb2dpYyx0czcyMDAtbmFuZAo+ICsgICAgICAtIGl0ZW1zOgo+ICsgICAgICAgICAgLSBl
bnVtOgo+ICsgICAgICAgICAgICAgIC0gdGVjaG5vbG9naWMsdHM3MzAwLW5hbmQKPiArICAgICAg
ICAgICAgICAtIHRlY2hub2xvZ2ljLHRzNzI2MC1uYW5kCj4gKyAgICAgICAgICAgICAgLSB0ZWNo
bm9sb2dpYyx0czcyNTAtbmFuZAo+ICsgICAgICAgICAgLSBjb25zdDogdGVjaG5vbG9naWMsdHM3
MjAwLW5hbmQKPiArCj4gKyAgcmVnOgo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4gKyAgJyNhZGRy
ZXNzLWNlbGxzJzogdHJ1ZQo+ICsgICcjc2l6ZS1jZWxscyc6IHRydWUKPiArCj4gK3JlcXVpcmVk
Ogo+ICsgIC0gY29tcGF0aWJsZQo+ICsgIC0gcmVnCj4gKwo+ICt1bmV2YWx1YXRlZFByb3BlcnRp
ZXM6IHRydWUKClNob3VsZCBiZSBmYWxzZSBJIGd1ZXNzLgoKPiArCj4gK2V4YW1wbGVzOgo+ICsg
IC0gfAo+ICsgICAgbmFuZC1jb250cm9sbGVyQDYwMDAwMDAwIHsKPiArICAgICAgY29tcGF0aWJs
ZSA9ICJ0ZWNobm9sb2dpYyx0czcyMDAtbmFuZCI7Cj4gKyAgICAgIHJlZyA9IDwweDYwMDAwMDAw
IDB4ODAwMDAwMD47Cj4gKyAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsgICAgICAjc2l6
ZS1jZWxscyA9IDwwPjsKPiArICAgIH07Cj4gKwo+ICsuLi4KCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
