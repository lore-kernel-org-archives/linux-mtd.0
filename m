Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1A1EE49A0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Aug 2023 11:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=teppzDphSu+3NWeeQZ0Zxk4MdSvPbC3bY+VWWvngxss=; b=fZilevPeB+tXKQ
	0nBo/YYYdrfp27T7gsk3FhyCW7xl/W7I1Fowlvz9esLMBi31w6ciBF+UiFRoupD82+aAzWKQ4vfwo
	AvKai940r1ibBBkCNw3HFI/HKlWWQmsppn+ey/RHxtBFpctZW88a/+yvZ9BYKwMyDCPa3owhIgt9n
	1OJqBmvcClcVSy+fdLS2s5L+1j8HSQiFFh1iAN+ugPvKdJA/WC9c3WqdCsUBH3uFCW3GNNSTxE/9o
	5EM5zyTO+aLjdB8oA7wcbINFfqskX8y/DCbQQCU8HYtNxJkEUIz3AfuhC3LWmm0OFv4b11QSrVmDK
	aQPdgNdx1mZ8AoBoYYpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYmDZ-000SNq-0h;
	Wed, 23 Aug 2023 11:40:09 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYmDW-000SLq-1z
	for linux-mtd@lists.infradead.org;
	Wed, 23 Aug 2023 11:40:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1401420007;
	Wed, 23 Aug 2023 11:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692790799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ho7TkRgdIeEdFaf/yC/PngT3UYUxETx2tgKarf9Ap/A=;
	b=mZ7cQ//oS2s2+GitJPAtXWFQ1Z+kaNmLfRFqA9qXI8L6QBDM/HhbXwUTTZBEjSRKjsGUab
	tEL6y6QkQ1b048xUjLI6LfXO5j0FFEj3cifwPTSYYoZTeSb/4o/afesTLqMNiD0826XCXM
	zGu32uZb/cokApji4hVe5bYIAqc0B8jUAfbjn34n5jMLHk/fyvSpXV/zObfNgKNiLQDEYW
	PVLLjlnWAjrfTZrykaXJnqBkBLd2EndL96jEgbTIHD0tlvR8nBmz/vB1aHW2RNvIL1ypvJ
	0q7qBncH7HI/cXvm2M8/I5/ImfwrDjcO5PHB4qOmAzg5LJaktjwDHbhz84CwwQ==
Date: Wed, 23 Aug 2023 13:39:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <kernel@sberdevices.ru>
Subject: Re: [PATCH v2 2/2] mtd: spinand: micron: fixing the offset for OOB
Message-ID: <20230823133956.0a505a20@xps-13>
In-Reply-To: <f873d775-cda9-302d-a651-0113c7c7dc84@sberdevices.ru>
References: <20230822122534.872646-1-mmkurbanov@sberdevices.ru>
	<20230822122534.872646-3-mmkurbanov@sberdevices.ru>
	<20230822153556.630e65b9@xps-13>
	<01925ff8-1d19-a729-429a-89866fad319f@sberdevices.ru>
	<20230823104143.760cc5bc@xps-13>
	<f873d775-cda9-302d-a651-0113c7c7dc84@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_044006_785039_548685BD 
X-CRM114-Status: GOOD (  18.51  )
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

SGkgTWFydGluLAoKbW1rdXJiYW5vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDIzIEF1
ZyAyMDIzIDE0OjMzOjU3ICswMzAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gMjMuMDguMjAyMyAx
MTo0MSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIE1hcnRpbiwKPiA+Cj4gPiBJIGRvbid0
IHRoaW5rIHRoZSBmb3VyIGJ5dGVzIGhhdmUgYW55ICJiYWQgYmxvY2sgc3BlY2lmaWMiIG1lYW5p
bmcuIEluCj4gPiBwcmFjdGljZSwgdGhlIGRhdGFzaGVldCBzdGF0ZXM6Cj4gPiAKPiA+IAlWYWx1
ZSBwcm9ncmFtbWVkIGZvciBiYWQgYmxvY2sgYXQgdGhlIGZpcnN0IGJ5dGUgb2Ygc3BhcmUKPiA+
IAlhcmVhOiAwMGgKPiA+IAo+ID4gU28gb25seSB0aGUgZmlyc3QgYnl0ZSBpcyB1c2VkIHRvIG1h
cmsgdGhlIGJsb2NrIGJhZCwgdGhlIHJlc3QgaXMKPiA+IHByb2JhYmx5IG1hcmtlZCAicmVzZXJ2
ZWQiIGZvciBzaW1wbGljaXR5LiBJIGJlbGlldmUgd2Ugc2hvdWxkIGtlZXAgdGhlCj4gPiBjdXJy
ZW50IGxheW91dCBiZWNhdXNlIGl0IHdvdWxkIG90aGVyd2lzZSBicmVhayB1c2VycyBmb3Igbm8g
cmVhbAo+ID4gcmVhc29uLiAgCj4gCj4gSSBhZ3JlZSB3aXRoIHlvdSB0aGF0IHRoaXMgY2FuIGJy
ZWFrIHRoZSB3b3JrIG9mIHVzZXJzIHdobyB1c2UgT09CLgo+IEhvd2V2ZXIsIEkgYmVsaWV2ZSBp
dCB3b3VsZCBiZSBtb3JlIGFwcHJvcHJpYXRlIHRvIHVzZSBhbiBvZmZzZXQgb2YgNCwKPiBhcyB0
aGUgbWljcm9uIGNoaXAgY2FuIHVzZSBhbGwgNCBieXRlcyBmb3IgYWRkaXRpb25hbCBkYXRhIGFi
b3V0IHRoZQo+IGJhZCBibG9jay4gU28sIHRoZXJlIGlzIGEgbm9uLXplcm8gcHJvYmFiaWxpdHkg
b2YgbG9zaW5nIE9PQiBkYXRhIGluCj4gdGhlIHJlc2VydmVkIGFyZWEgKDIgYnl0ZXMpIHdoZW4g
dGhlIGhhcmR3YXJlIGNoaXAgYXR0ZW1wdHMgdG8gbWFyawo+IHRoZSBibG9jayBhcyBiYWQuCgpJ
cyB0aGlzIHJlYWxseSBhIHByb2Nlc3MgdGhlIGNoaXAgY2FuIGRvPyBBcmVuJ3QgYmFkIGJsb2Nr
cyBmYWN0b3J5Cm1hcmtlZCBvbmx5PwoKVGhlbiBpdCdzIG10ZCdzIGR1dHkgdG8gbWFuYWdlIHRo
ZW0uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
