Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A45EC52D7B
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2024 16:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kFpJ+hknadKc2CZZFljOp/y9tzmGaTVqSWOQ1ew803k=; b=KQrdj6CKvOzYYA
	EFZiTuxBr+psIZjMOB2adIg1VTKzFToTx62wdH4tCPT9gUAzmvNQ1IkvWiBiBfI/bdNwulAYFkDug
	8SKfw9a6Vge7ve5q5gkejCUdLdvlQCJruJRa2CkNfXA0a1aGB+CtGU/MlEPGO8KKtwp8sUQ06B7HQ
	2rDkLso6USBGUJ+JFYxYEzObp9TV3S9rt88DmvXmv5+toMLATOHqGzWzRvmXkyWNd/v/p9HAFrsN2
	LRJCXvV3Oolq1JD2vdRxyhbkAlbZjlIlGJn88nMQtLA7L3EH+9ty7rxybjrd/8V0+rbuTvSgGBsuy
	C8qKMJ9dYfWZHdsARvCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seGQZ-00000007Zdy-1gV3;
	Wed, 14 Aug 2024 16:00:47 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFIe-00000007MKa-2POf
	for linux-mtd@lists.infradead.org;
	Wed, 14 Aug 2024 14:48:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D42FC0003;
	Wed, 14 Aug 2024 14:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723646908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vsvtyLqIUdSFch0aam54nIRgOyDlKRcYRX1ld/c3r+U=;
	b=bOwXC4O98tmMfIQq1u2pQCdj1qbCJxUlfYRCwaxA7rLeigiFBvaPYJcacO7Vqy9sjst+Z+
	m2OYoiIBXIe07wKjZIG4mJ3hd3VPwyiimsu8iJdVX9WFUdvV7hUTNnAUyuLE2fa9+f1Blb
	3bW+t66yPW4+znXAcPaB3l2axEr/MjtgmqG1K85/EQU+4msA6sxVlehpFZEK28PC0eVqcB
	LWCg49rd+G3Oa8enGhHnpyt2WtQYMezcqEDHRng/mi0uG+cbo53k4h1NjDJ1Cw+ezFqByM
	/ACgtMBMstUUEbpJRsiQQ1xC5RBetdOZzF/KkMrLZFWkCssqmHGP40HIfa2ZzA==
Date: Wed, 14 Aug 2024 16:48:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <20240814164824.5c4f18af@xps-13>
In-Reply-To: <20240814-delicate-oil-d1eef61f0eda@spud>
References: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
	<20240808-loongson1-nand-v8-1-c96dea418b41@gmail.com>
	<20240808-backyard-unglue-3cf429ad8da5@spud>
	<CAJhJPsVOTAj9ePzeHkwDX049FKd=9Rs_NjQE2qwQL76GKSC66Q@mail.gmail.com>
	<20240809-smuggler-patrol-067003f0ba9b@spud>
	<20240814091231.1d9525be@xps-13>
	<20240814-delicate-oil-d1eef61f0eda@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_074832_786243_9BC2B491 
X-CRM114-Status: GOOD (  16.60  )
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

SGkgQ29ub3IsCgpjb25vckBrZXJuZWwub3JnIHdyb3RlIG9uIFdlZCwgMTQgQXVnIDIwMjQgMTU6
MjM6MjMgKzAxMDA6Cgo+IE9uIFdlZCwgQXVnIDE0LCAyMDI0IGF0IDA5OjEyOjMxQU0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSwKPiA+ICAgCj4gPiA+ID4gPiBXaGVuIEkgZmly
c3QgcmVhZCAibmZjIiBoZXJlIEkgdGhvdWdodCBpdCB3YXMgYSBjb3B5LXBhc3RlIG1pc3Rha2Us
IGFzCj4gPiA+ID4gPiAibmZjIiBpcyBhIHRlY2hub2xvZ3kgb2YgaXQncyBvd24uIEkgdGhpbmsg
aXQgd291bGQgbWFrZSBzZW5zZSB0byByZW5hbWUKPiA+ID4gPiA+IHRvICJsb29uZ3NvbixsczFi
LW5hbmQtY29udHJvbGxlciIgZXRjIHRvIHJlbW92ZSB0aGF0IHNvcnQgb2YgY29uZnVzaW9uLgo+
ID4gPiA+ID4gVGhlc2UgZGV2aWNlcyBtaWdodCBub3QgaW1wbGVtZW50IE5GQywgYnV0IHdoYXQn
cyB0byBzYXkgdGhhdCBhIGZ1dHVyZQo+ID4gPiA+ID4gZGV2aWNlIHdpbGwgbm90PyAgCj4gPiAK
PiA+IEkgYmVsaWV2ZSB0aGUgbmZjIChhbHNvLCBuYykgYWJicmV2aWF0aW9uIHByZS1kYXRlcyB0
aGUgTkZDIHNwZWMuIEJ1dCBJCj4gPiBhZ3JlZSwgaXQgbWF5IGJlIG1pc2xlYWRpbmcuIEV2ZW4g
dGhvdWdoIEkgZG9uJ3QgZm9yZXNlZSBhbnkgTkFORAo+ID4gY29udHJvbGxlciB3aXRoIE5GQyBj
b21pbmcsICAKPiAKPiBIbSwgSSB0aGluayB5b3UgbWlzdW5kZXJzdG9vZCAtIEkgbWVhbnQgbG9v
bmdzb29uIFNvQ3MgdGhhdCBoYWQgbmZjCj4gY29udHJvbGxlcnMgYW5kIG5hbmQgY29udHJvbGxl
cnMgLSBub3QgbmFuZCBjb250cm9sbGVycyB3aXRoIG5mYyEKCkFoISBXZWxsLCB5ZXMsIGl0IG1h
eSBiZSBldmVuIG1vcmUgbWlzbGVhZGluZyB0aGVuIDotKQoKQ2hlZXJzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
