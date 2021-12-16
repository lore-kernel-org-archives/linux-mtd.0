Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECD1C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 08:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RXJh0icnFZ5uw1aTsPeprOXWPyCdEL0s5L2no4TMkiw=; b=vvjNhmZXARIURl
	XdY5UafuaBky62rpmTyoiG42DeanikViNhiZb04DWXLEzDFAFZQ88igbIsFK8kxptG4X5pkZidKQx
	ZYs3jimFQs3Q1TYZvTUxll3eT5gJEee6NdLQpMyN6xoGTh/E113WqLMhd06i9dJOKA0AQLQE4Dd1z
	o7NLFVSEJCMuLr9WvFxsDgzDtW3wRASkfPCt0p/33Z9OKt0QEOL17IOLBt7uAqK4np8y28+Oj5Omj
	fz1KOfwnR2w2G9yoSl3lJdfn8x19NMttzg5Pl9eyHMUSNkNOi+FdHW5zR1/99okrmy+61LeTYxv0T
	7I+K21V4czcQR3tYWRQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxluU-0045F8-Lg; Thu, 16 Dec 2021 08:14:42 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxluR-0045Dw-Or
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 08:14:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 189C660002;
 Thu, 16 Dec 2021 08:14:35 +0000 (UTC)
Date: Thu, 16 Dec 2021 09:14:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v5 12/13] spi: mxic: Use spi_mem_generic_supports_op()
Message-ID: <20211216091434.52a5c1af@xps13>
In-Reply-To: <20211215195219.0d34cb77@collabora.com>
References: <20211214114140.54629-1-miquel.raynal@bootlin.com>
 <20211214114140.54629-13-miquel.raynal@bootlin.com>
 <20211214172410.2b26c17e@collabora.com>
 <20211215184426.67fd3912@xps13>
 <20211215195219.0d34cb77@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_001439_964935_959D02A4 
X-CRM114-Status: GOOD (  16.42  )
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

SGkgQm9yaXMsCgpib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbSB3cm90ZSBvbiBXZWQsIDE1
IERlYyAyMDIxIDE5OjUyOjE5ICswMTAwOgoKPiBPbiBXZWQsIDE1IERlYyAyMDIxIDE4OjQ0OjI2
ICswMTAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6
Cj4gCj4gPiBJbiBvcmRlciB0byBrZWVwIHRoZSBzZXJpZXMgZWFzeSB0byByZXZpZXcgSSBkZWNp
ZGVkIHRvIGdvIGZvciB0aGUKPiA+IGZvbGxvd2luZyBhcHByb2FjaDoKPiA+ICogSW50cm9kdWNl
IHRoZSBzcGlfbWVtX2dlbmVyaWNfc3VwcG9ydHNfb3BfaGVscGVyKCkgd2hpY2ggdGFrZXMgYQo+
ID4gICBjYXBhYmlsaXRpZXMgc3RydWN0dXJlLiBUaGlzIGhlbHBlciBnYXRoZXJzIGFsbCB0aGUg
Y2hlY2tzIGZyb20KPiA+ICAgc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKCkgYW5kIHNwaV9t
ZW1fZHRyX3N1cHBvcnRzX29wKCkuIFRoZXNlCj4gPiAgIHR3byBoZWxwZXJzIG5vdyBjYWxsIHRo
ZSBuZXcgb25lIHdpdGggZWl0aGVyIGEgTlVMTCBwb2ludGVyIGluIHRoZQo+ID4gICBmb3JtZXIg
Y2FzZSwgb3IgYSBzdHJ1Y3R1cmUgd2l0aCB0aGUgLmR0ciBwYXJhbWV0ZXIgc2V0IHRvIHRydWUg
aW4KPiA+ICAgdGhlIGxhdHRlci4gIAo+IAo+IElzIHRoZXJlIGEgYmVuZWZpdCBhZGRpbmcgYW4g
ZXh0cmEgTlVMTCBjaGVjayB3aGVuIHlvdSBjb3VsZCBtYWtlIHN1cmUKPiBhbGwgY2FsbGVycyBw
YXNzIGEgemVyby1pbml0aWFsaXplZCBjYXBzIG9iamVjdCB3aGVuIHRoZXkgZG9uJ3Qgc3VwcG9y
dAo+IGZhbmN5IGZlYXR1cmVzIGxpa2UgRFRSIG9yIEVDQy4KClRoYXQncyBleGFjdGx5IG15IHBv
aW50LCBJIHJlYWxseSBkb24ndCBsaWtlIHRoZSBjcmVhdGlvbiBvZiAxNSBlbXB0eQphbmQgdXNl
bGVzcyBzdHJ1Y3R1cmVzIHdoaWxlIHdlIGNvdWxkIGp1c3QgaGF2ZSBhIGNoZWNrLiBJZiB0aGUK
Y29udHJvbGxlciBwcm92aWRlcyBubyBjYXBhYmlsaXRpZXMsIHdlIGFzc3VyZSBoZSBoYXMgbm9u
ZS4gSSBkb24ndAp0aGluayBjaGVja2luZyAiaWYgKGNhcHMgJiYgY2Fwcy0+UEFSQU0pIiBodXJ0
cy4gQW55d2F5LCBpZiB3ZSBnbyBmb3IKdGhlIHNwaV9tZW0gY29udHJvbGxlciBpbnRlcm5hbCBz
dHJ1Y3R1cmUgYXBwcm9hY2gsIHdlIG1pZ2h0IGp1c3Qgbm90Cm5lZWQgdGhvc2UuCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
