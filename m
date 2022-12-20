Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67FDC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Dec 2022 15:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IpfWDWiP64oiN3CbLl7JGgH+tZhXJT+OcyMn+E3g570=; b=jtGLU2qXNWmB5a
	H2CaVxODo0RrP9Ey6G2ViD2tQxbd8uwkEDB2S+YVLu7EjvOKt8C3NmHRFNNtUihkBjxBZGIZhGg3b
	ZB5vf+NbrCqB9jM5x6MhNP6eF45Y8CVt5xOKaHkkBtaqxV3cucAKg4btNkkJnIy5Hz+1/MH86/FNE
	un7Dl0B3+GFLFbxO4PxCgtNpIKPkZwGhIp5v6/ijqc1239ivQQhWUoLd5PKsU7R5V281B9JLPbURj
	63CQ6CdE9rUBT1lD7Oa9yK+A6gDbZ6lUyID+inW6c2ZJy1ZiNEMh4fQL9Mp0YxDxHaMJdTHvmAKW9
	XfS68qdFAvTnOGi8B7dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7f05-000Cyl-Ii; Tue, 20 Dec 2022 15:57:53 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ezT-000C4E-Ou
	for linux-mtd@lists.infradead.org; Tue, 20 Dec 2022 15:57:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E37F11BF211;
	Tue, 20 Dec 2022 15:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671551825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mCQUAf7Zkzk+AreJl3bcOvu94fhcF4svN/mdiLj7C9w=;
	b=OztXlCctGdAbEdWDLpXDhXcXHIgBH0P8WrhuLRsL7HG9u9o1s2YTc8beVMWVGR1qUFsW5O
	oMyJY0SfsZ/t838/P34fHh2F0od/HtNk75nmQ/dSj0O/GGYzD3/SsdxNkGT6FVi8ZnfuYV
	HiwvQGxdNdrZ2zJQ9AJDwOE4fGF4u0b8HkbNdDayvWDn/YucqpWlaYDZ+TnfMQZAkevEqW
	lF36ERmd1aHWlZEY6WUdwB8078PG5q7/J1qGFyRBHQKjViemIq8l4tdKmDqgv5RXyY6jRM
	2E0jz5QC56ljpSmdOG6ghSMf7gzLntjFJvyBNqm2OYQoqV+ICFBLvm+nxMImzg==
Date: Tue, 20 Dec 2022 16:57:01 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Michael Walle <michael@walle.cc>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, Sai Krishna Potthuri
 <sai.krishna.potthuri@amd.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Mauro Lima <mauro.lima@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] mtd: cfi: allow building spi-intel standalone
Message-ID: <20221220165701.5696df1a@xps-13>
In-Reply-To: <cae6328b-5204-a1ab-810d-8fb64e466453@linaro.org>
References: <20221220141352.1486360-1-arnd@kernel.org>
	<cae6328b-5204-a1ab-810d-8fb64e466453@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_075716_012672_AD7DC0E6 
X-CRM114-Status: GOOD (  14.56  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gVHVlLCAyMCBEZWMg
MjAyMiAxNzo0NDo0OSArMDIwMDoKCj4gSGksIEFybmQsCj4gCj4gT24gMjAuMTIuMjAyMiAxNjox
MywgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+Cj4gPiAKPiA+IFdoZW4gTVREIG9yIE1URF9DRklfR0VPTUVUUlkgaXMgZGlzYWJsZWQs
IHRoZSBzcGktaW50ZWwgZHJpdmVyCj4gPiBmYWlscyB0byBidWlsZCwgYXMgaXQgaW5jbHVkZXMg
dGhlIHNoYXJlZCBDRkkgaGVhZGVyOgo+ID4gCj4gPiBpbmNsdWRlL2xpbnV4L210ZC9jZmkuaDo2
MjoyOiBlcnJvcjogI3dhcm5pbmcgTm8gQ09ORklHX01URF9DRklfSXggc2VsZWN0ZWQuIE5vIE5P
UiBjaGlwIHN1cHBvcnQgY2FuIHdvcmsuIFstV2Vycm9yPWNwcF0KPiA+ICAgICA2MiB8ICN3YXJu
aW5nIE5vIENPTkZJR19NVERfQ0ZJX0l4IHNlbGVjdGVkLiBObyBOT1IgY2hpcCBzdXBwb3J0IGNh
biB3b3JrLgo+ID4gCj4gPiBsaW51eC9tdGQvc3BpLW5vci5oIGRvZXMgbm90IGFjdHVhbGx5IG5l
ZWQgdG8gaW5jbHVkZSBjZmkuaCwgc28KPiA+IHJlbW92ZSB0aGUgaW5jbHVzaW9uIGhlcmUgdG8g
Zml4IHRoZSB3YXJuaW5nLiBUaGlzIHVuY292ZXJzIGEKPiA+IG1pc3NpbmcgI2luY2x1ZGUgaW4g
c3BpLW5vci9jb3JlLmMgc28gYWRkIHRoYXQgdGhlcmUgdG8KPiA+IHByZXZlbnQgYSBkaWZmZXJl
bnQgYnVpbGQgaXNzdWUuCj4gPiAKPiA+IEZpeGVzOiBlMjNlNWEwNWQxZmQgKCJtdGQ6IHNwaS1u
b3I6IGludGVsLXNwaTogQ29udmVydCB0byBTUEkgTUVNIikKPiA+IFNpZ25lZC1vZmYtYnk6IEFy
bmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+ICAKPiAKPiBMb29rcyBnb29kIHRvIG1lLiBJJ2xs
IGxldCB0aGUgbGludXgtMGRheSBib3QgcnVuIG92ZXIgaXQgYW5kIGFwcGx5IGl0Cj4gb25jZSAt
cmMxIGlzIG91dC4KClRoZSBpc3N1ZSBzb21ldGltZXMgcHJvZHVjZXMgYnVpbGQgZXJyb3JzLCBz
aGFsbCBJIHNlbmQgaXQgdGhyb3VnaCBhCmZpeGVzIFBSIGluc3RlYWQ/CgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
