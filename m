Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7B8C4828D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 13:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ups39L2wmeVCE6Jz690GixIKeCPXWLi7tGj1WvYsa8=; b=nMCnJL1qu2nD1n
	dbXzjtnFTvOGUdvB2l6IsQsjbTr2qhrg+849neaVpCVgYggnJ11LY9tBcYTdJqqhouFgldLOsS6Km
	bxfkGm+3lhV9hYPnCkShDNegHlovWBR2Prs/MWJMB618xmPJKZT4+31NA5ZkiABTWDOoWha845Li2
	72/Bqsn0TRMlpV7bpraGr9hP1fhvjAeJYjgtrIda03HzWUkTURWKRUFufqUGtfjAQ5jzsLfGfrryo
	5pxXU5j7EhahYUKPozgtmFMT6ufLeGjjodxERw6oHHpW5EypydyF8PiGt2ej3UKkMc1PXli/dfvXw
	pb9CXokB5TnlQ0c8GT0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWz5m-00000003Qcf-2Tgw;
	Mon, 05 Feb 2024 13:32:58 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWz5i-00000003Qc1-41dz;
	Mon, 05 Feb 2024 13:32:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D384FF809;
	Mon,  5 Feb 2024 13:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707139968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=koe9bjcAN33voyRHmbaxK/dVbeKGFFFrjtmLDWOmCww=;
	b=ZI6aDvzem4bJwwgbG1O4FDdd8g4QYZqNsTqWtLPfd0LebqWxmQSUeW8/mJhuLLZNaf+Fix
	snlRDLbbL531U8mYjvQfHaqAXpNavizDZc7xVtsebKqelDzOqHb+cQQv/9nLneGJBtMDNR
	IquYlZzG3mIULBGlcU5LqwKz0UYZk9Lv1zouCXJdAqYp/G5Pm2r2nTERY8JZngMI0bCF1j
	WRRcqpMOiRhleJ3KR9/P3NUPNqGDj2liA4aKj3O11Im7RFfYusR6XsWp+Zz1fqhd5R1dGr
	gnzOWZmYAhU3c5qS5Wbo+SpZWuPUb+YWozNE0hzcgKvQo04BoauF4oLYBjHDbQ==
Date: Mon, 5 Feb 2024 14:32:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Linux MTD List <linux-mtd@lists.infradead.org>, Linux ARM List
 <linux-arm-kernel@lists.infradead.org>, Broadcom Kernel List
 <bcm-kernel-feedback-list@broadcom.com>, f.fainelli@gmail.com,
 kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 02/12] dt-bindings: mtd: brcmnand: Add WP pin
 connection property
Message-ID: <20240205143246.52ee97ec@xps-13>
In-Reply-To: <20240203002834.171462-3-william.zhang@broadcom.com>
References: <20240203002834.171462-1-william.zhang@broadcom.com>
	<20240203002834.171462-3-william.zhang@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_053255_168540_F761C54A 
X-CRM114-Status: GOOD (  16.27  )
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

SGkgV2lsbGlhbSwKCndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tIHdyb3RlIG9uIEZyaSwgIDIg
RmViIDIwMjQgMTY6Mjg6MjMgLTA4MDA6Cgo+IEFkZCBicmNtLHdwLW5vdC1jb25uZWN0ZWQgcHJv
cGVydHkgdG8gaGF2ZSBhbiBvcHRpb24gZm9yIGRpc2FibGluZyB0aGlzCj4gZmVhdHVyZSBvbiBi
cm9hZGJhbmQgYm9hcmQgZGVzaWduIHRoYXQgZG9lcyBub3QgY29ubmVjdCBXUCBwaW4uCj4gCj4g
U2lnbmVkLW9mZi1ieTogV2lsbGlhbSBaaGFuZyA8d2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20+
Cj4gCj4gLS0tCj4gCj4gQ2hhbmdlcyBpbiB2NDoKPiAtIE1vdmUgdGhlIFdQIHBpbiBwcm9wZXJ0
eSB0byB0aGlzIHNlcGFyYXRlIHBhdGNoIGFuZCBjaGFuZ2UgaXQgdG8KPiBib29sZWFuIHR5cGUu
Cj4gCj4gQ2hhbmdlcyBpbiB2MzogTm9uZQo+IENoYW5nZXMgaW4gdjI6IE5vbmUKPiAKPiAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9icmNtLGJyY21uYW5kLnlhbWwgfCA4
ICsrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9icmNtLGJyY21uYW5k
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5h
bmQueWFtbAo+IGluZGV4IGU1NGNhMDhhNzk4YS4uZDAxNjhkNTVjNzNlIDEwMDY0NAo+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC55YW1s
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9icmNtLGJyY21u
YW5kLnlhbWwKPiBAQCAtMTEzLDYgKzExMywxNCBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICBlYXJs
aWVyIHZlcnNpb25zIG9mIHRoaXMgY29yZSB0aGF0IGluY2x1ZGUgV1AKPiAgICAgIHR5cGU6IGJv
b2xlYW4KPiAgCj4gKyAgYnJjbSx3cC1ub3QtY29ubmVjdGVkOgo+ICsgICAgZGVzY3JpcHRpb246
Cj4gKyAgICAgIFVzZSB0aGlzIHByb3BlcnR5IHdoZW4gYm9hcmQgZGVzaWduIGRvZXMgbm90IGNv
bm5lY3QgY29udHJvbGxlcidzCj4gKyAgICAgIE5BTkRfV1BiIHBpbiB0byBOQU5EIGNoaXAncyBX
UF9MIHBpbiBhbmQgZGlzYWJsZSB0aGUgd3JpdGUKPiArICAgICAgcHJvdGVjdGlvbiBmZWF0dXJl
LiBCeSBkZWZhdWx0LCBjb250cm9sbGVyIGFzc3VtZXMgdGhlIHBpbiBpcwo+ICsgICAgICBjb25u
ZWN0ZWQgYW5kIGZlYXR1cmUgaXMgdXNlZC4KCkkgd291bGQgcmVwaHJhc2Ugc2xpZ2h0bHkuIFdo
YXQgYWJvdXQ6CgoJIFdQIHBpbiBpcyBub3QgcGh5c2ljYWxseSB3aXJlZCB0byB0aGUgTkFORCBj
aGlwLiBXcml0ZQoJIHByb3RlY3Rpb24gZmVhdHVyZSBjYW5ub3QgYmUgdXNlZC4KIAo+ICsgICAg
JHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvZmxhZwo+ICsKPiAgcGF0dGVy
blByb3BlcnRpZXM6Cj4gICAgIl5uYW5kQFthLWYwLTldJCI6Cj4gICAgICB0eXBlOiBvYmplY3QK
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
