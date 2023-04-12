Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A935C77B6E
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 07:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hggQM3gA6rsR4Xkag9hRc7t+4znLJj679VMv4Tg7JQ4=; b=YfF/VLMwlJ928T
	pMiL7wi/J4lRzy7g3s2mfV8EGB8dJk5oozg7lJ8Y2nzqB3Own/4JQumS/8SulTQOESY6P8DnuKOOd
	vHXazaN8x/9lgEVO/QF7msWd4kzsHPZZNVTAxe5JY5txrVFzte4LrluiKzJucUFBw7VvAEOrOW/jS
	/yFFWnqs1qorKEN2uDEHj1nBKlxuSHPkGR/hybAzTdhNDU6aWbHjNwT7mYvxQ5G5MOcaIhZZBCHrJ
	a5IsdrMblhYIjttbd+64yyR6RZccNzEu/UJ5vCk578zozvk4GiZ5ZdD5xSOiFhT1KV3ytWY8Cm0Td
	JuJ00xbf4E+kPwRBjHdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmVAo-0028cD-2x;
	Wed, 12 Apr 2023 07:45:46 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmVAk-0028aU-1i;
	Wed, 12 Apr 2023 07:45:43 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1ED3A100014;
	Wed, 12 Apr 2023 07:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681285540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FFYr9F865jNKlij7bhqU6NcO52rv9OFiF5JjtJfQn8M=;
	b=P7q6H8wpRwdAM4/cqiQP+t3EFYZp9l3cPj7yJQLf+pkXNirWvSdgFTLSKgyIMIHgbQeL3I
	0CAXJh6o1Pf7fqUPVhrMIytVo5cPRzdA1BsUF+e++P85Nok14z0NBBbHxuH/fhsUAHPnFE
	WpOCqjXyW9NhVb1u4PDx12Ksg6xB+p0FjebBJSmmtYcMgqixX8pdRWNWP38w9To795NTZr
	xIiAojQzpYQotrV5b2uSSZzPlUlrTHD1pvUJN9gkTItUpayJ0yx4W/aMX3SSGX6fLRGkSS
	TiyDJDr3EMq9keOL2tmMJXR9jInTZ5yJMhERnz56cbF1HXtwGd1Qa6F365BV/A==
Date: Wed, 12 Apr 2023 09:45:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
 <linux-amlogic@lists.infradead.org>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/5] refactoring and fix for Meson NAND
Message-ID: <20230412094533.10d4a2a9@xps-13>
In-Reply-To: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_004542_703069_EEADF45F 
X-CRM114-Status: GOOD (  12.52  )
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

SGkgQXJzZW5peSwKCkFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDEyIEFw
ciAyMDIzIDA5OjE2OjU0ICswMzAwOgoKPiBIZWxsbywKPiAKPiB0aGlzIHBhdGNoc2V0IGFkZHMg
b25lIGZpeCBhbmQgc2V2ZXJhbCByZWZhY3RvcmluZyBwYXRjaGVzLiBGaXJzdCBwYXRjaAo+IGlz
IHRoZSBtb3N0IGltcG9ydGFudCAtIGl0IGZpeGVzIHVuc3RhYmxlIGJlaGF2aW91ciBvZiBNZXNv
biBkcml2ZXIsIGZvcgo+IGV4YW1wbGUgcmFuZG9tIEVDQyBlcnJvcnMgZHVyaW5nIHJlYWRzLiBJ
J3ZlIHRlc3RlZCB0aGlzIHdpdGggbW91bnQvCj4gdW5tb3VudC9yZWFkL3dyaXRlIGNhc2VzIGZv
ciBKRkZTMiBhbmQgbmFuZGR1bXAvbmFuZHdyaXRlIHV0bGl0aWVzIG9uCj4gQVhHIGZhbWlseSAo
QTExM1ggU29DKS4gU291cmNlIG9mIHRoaXMgdXBkYXRlIGlzIG9sZCB2ZW5kb3IncyBkcml2ZXIu
Cj4gCj4gT3RoZXIgcGF0Y2hlcyBhcmUgcmVmYWN0b3JpbmcgYW5kIGV4dHJhIGNoZWNrcywgbm90
IGNyaXRpY2FsIGZvciB0aGlzCj4gZHJpdmVyJ3MgcmVsaWFiaWxpdHkuCgpUaGFua3MgZm9yIHRo
ZSBzZXJpZXMsIG1pbm9yIGNvbW1lbnRzIGluc2lkZSwgaWYgeW91IHJlc3BpbiBiZWZvcmUgdGhl
CmVuZCBvZiB0aGUgd2VlayBJJ2xsIHRha2UgdGhpcyBmb3IgdGhlIG5leHQgbWVyZ2Ugd2luZG93
LgoKPiAKPiBBcnNlbml5IEtyYXNub3YgKDUpOgo+ICAgbXRkOiByYXduYW5kOiBtZXNvbjogZml4
IE5BTkQgYWNjZXNzIGZvciByZWFkL3dyaXRlCj4gICBtdGQ6IHJhd25hbmQ6IG1lc29uOiByZXBs
YWNlIEdFTk1BU0soKSBtYWNybyB3aXRoIGRlZmluZQo+ICAgbXRkOiByYXduYW5kOiBtZXNvbjog
Y2hlY2sgYnVmZmVyIGxlbmd0aAo+ICAgbXRkOiByYXduYW5kOiBtZXNvbjogY2xlYXIgT09CIGJ1
ZmZlciBiZWZvcmUgcmVhZAo+ICAgbXRkOiByYXduYW5kOiBtZXNvbjogcmVtb3ZlIHVubmVlZGVk
IGJpdHdpc2UgT1Igd2l0aCB6ZXJvZXMKPiAKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25f
bmFuZC5jIHwgMTQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMTI3IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+IAoKClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
