Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B2DC47E49
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7HvgZyFHn8PeNdtJwksQvyaQDhYjWKp0hxevrAIw+zE=; b=GldUCNq7NaXsWd
	kEQvZtn6sRWpBk1uOwUKxnuufoFtxPE/DBT9KVJjwRI4f9azKx/Jbi20BTQctbFy8lUQ8ZsEaO5wB
	JUlpbLeh64ajtS0WyLO7IsPFIyLgSgIzhPP2rsaw9pYh2LQ0xtXWYLiVYXLf7Og05you7BzR8dQoF
	piqpA1WuT8hauft/F8nWMMR5nMbvI7NyMFZXRccbJFO+ICSUxucUrE+ffBFgpVCDKDkrumxYs9sz6
	TSVt2PWyRhRWX4+cBrDDDLLSL+/YB60XkGl2aeOzfMNXpuVwaTvGLDeeCMR5J0kAqz+ONLOT6ITEC
	i7LkIfWzbzAAAL/0piEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSgio-004Ma0-2P;
	Wed, 24 Jan 2024 17:07:30 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSgik-004MX3-0Y
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jan 2024 17:07:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CD5E24000C;
	Wed, 24 Jan 2024 17:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706116040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AoFXFROSEjoeJBXMvBhPDBpSpUEGYMygyna9ZwpvF/E=;
	b=g/WMVDj6ZmMVdbxvQtEt8CDxP6Fv6jTODOOGgrg0FcjjAPqzsHpHYsJTq5cuhyiuyx+dLR
	lBjpCyAYjYgT1mZSNpiqkDpxomSNFmov1sfWLPkLAJKk6bKYdJkSUBsOsBt/bPNIkNw9F7
	CAyaZbpYGkKJ81bvjj71QVr2maZDVP0tleAsDNqUuK1ceitEa+qIEFSQsEIpKIkIbJ1jIw
	JbzNGDeddDI5Ndx1keyRbllRaeqYKhH8m4KqE2LcjjXiYqdJmxItHS7FAL9DVo+JMdwvkG
	G09OCL6w+6orIM0Xux6JCuMEKk/eA6yBsqq8O2ooQzmaA0rZYukShnK6uFwywQ==
Date: Wed, 24 Jan 2024 18:07:16 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mohamed Sardi <moh.sardi@skyhighmemory.com>
Cc: "Kyeongrho.Kim" <kr.kim@skyhighmemory.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "p.yadav@ti.com" <p.yadav@ti.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "richard@nod.at" <richard@nod.at>,
 Mohammad Nada <Mohammad.nada@skyhighmemory.com>, "Changsub.Shim"
 <changsub.shim@skyhighmemory.com>
Subject: Re: [SkyHigh Memory SPI NAND Driver]
Message-ID: <20240124180716.71e26b8c@xps-13>
In-Reply-To: <880CF70D-DC61-4E18-9A31-48A82A45CA3E@skyhighmemory.com>
References: <7C13C29F-DBE0-494F-8BA6-99BB68FD08AF@skyhighmemory.com>
	<20240108144719.3198373e@xps-13>
	<SE2P216MB2102316F0F2D8134C755C37283682@SE2P216MB2102.KORP216.PROD.OUTLOOK.COM>
	<20240111083838.7f215daf@xps-13>
	<880CF70D-DC61-4E18-9A31-48A82A45CA3E@skyhighmemory.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_090726_501802_C7B38BE9 
X-CRM114-Status: UNSURE (   8.17  )
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

SGkgTW9oYW1lZCwKCm1vaC5zYXJkaUBza3loaWdobWVtb3J5LmNvbSB3cm90ZSBvbiBUdWUsIDIz
IEphbiAyMDI0IDAxOjAxOjUzICswMDAwOgoKPiBIZWxsbyBNaXF1ZWwsCj4gCj4gSSBoYXZlIGEg
cXVlc3Rpb24gZm9yIGJhZCBibG9jayBtYXJraW5nIGFuZCBjaGVja2luZyBvbiBMaW51eC4uLiBh
bmQgRUNDLgo+IAo+IERvIHlvdSBrbm93IGhvdyBiYWQgYmxvY2sgbWFya2luZyBpcyBkb25lPwo+
IAo+IDEpIEJhZCBCbG9jayBNYXJraW5nOiBBcmUgeW91ciB3cml0aW5nIG5vbiBGRiBvbiB0aGUg
Zmlyc3QgMiBieXRlcyBvZiB0aGUgT09CPyBEbyB5b3Uga2VlcCBEZXZpY2UgRUNDIE9OIG9yIE9G
Rj8KPiAyKSBCYWQgYmxvY2sgQ2hlY2tpbmc6IERvIHlvdSByZWFkIHRoZSBmaXJzdCAyIGJ5dGVz
IG9mIHRoZSBPT0Igd2l0aCBFQ0MgT0ZGIG9yIGRvIHlvdSBrZWVwIEVDQyBPTj8KCkluIHRoZSBy
YXcgTkFORCB3b3JsZCwgZm9yIGxlZ2FjeSByZWFzb25zIHRoZXNlIGNoZWNrcyBhbmQgd3JpdGVz
IGFyZQpkb25lIHdpdGggdGhlIGNvcnJlY3Rpb24gZW5naW5lIGVuYWJsZWQuIEJ1dCBJIGJlbGll
dmUgeW91IGFyZQppbnRlcmVzdGVkIGludG8gdGhlIFNQSS1OQU5EIHNpZGUgb25seSwgYW5kIGlu
IHRoaXMgY2FzZSB0aGUgRUNDIGlzCmFsd2F5cyBkaXNhYmxlZDoKCk1hcmtpbmc6Cmh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjgtcmMxL3NvdXJjZS9kcml2ZXJzL210ZC9uYW5k
L3NwaS9jb3JlLmMjTDc2OApDaGVja2luZzoKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvdjYuOC1yYzEvc291cmNlL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyNMNzMzCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
