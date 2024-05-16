Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEA3C25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 08:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PSsgtrKGom+uPancfZqTCsO7Ux9t095WettGUX+YBR0=; b=rNUdpIUntZXSqN
	Mie4g850OmYr+vGLdeyozlb4tztEcYuDMzD+j0WsTQWGhKJl4MRRvl8x4T3cVtrikjeW0u2c52czz
	OLqDaznKHf8c9D/B4cZaxo9Nq8L/7WMakQdxZVdxmtmAq4ra/53dtnoTGSIK7qwbmjYHSK/1iJSan
	7JxzDBDe12s1Za0ECvm4/1YGnzcEeAVFyaXYMrpisWR3+6+87e+G57B20lCfghf86aOULxJmqEJO+
	NHQeKPETBAqvFl1ZYUPx/o/fbq6go73Apwow5R4CTC7U2GaZu+b0Dji+n7uwCq7ts9/OevGzpZPE3
	ReBwFIulkJ5ZtxCy4XTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WFT-000000046wR-2Pnn;
	Thu, 16 May 2024 08:13:59 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WFQ-000000046vg-49F9
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 08:13:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E7944000E;
	Thu, 16 May 2024 08:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715847232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b2/hxtco63GpIUnQcjEi0uFkar4EC6MCevZBbmlEDM0=;
	b=UyB1VdKzA0phoZwd5f/TyztFgpciJgn+VkO5SmFhGe/GlhAAUhhrLF0Dxk++huzIc26wpH
	FA1XobuAYg4v9grOecv+It4WAvAeOo+E3uluRP5RyiE1tMlT8WoPIQjO1azQfDt2qQI2y1
	Afjeg2XkSxv9WwRbWB3aGJA4dJI4kdcRM40RMTjXWjm3RV+udFf+fLLtzyT5RSraZc2Y8F
	+7bL+FYE6HzDkU+RvoTiJ73zIM4//cWhk0cTURMcOV6YS2j5msP4AGMsywOckCY/LRDNM1
	DbFjOTwHfGJq9wu9ewBqpnc0KezSnkrcC87hVbaOgokllQr/Bn/XqIzrn0xieQ==
Date: Thu, 16 May 2024 10:13:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Richard
 Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: rawnand: onfi: read parameter pages in one go
Message-ID: <20240516101350.78e5ee29@xps-13>
In-Reply-To: <20240514134140.1050141-1-s.hauer@pengutronix.de>
References: <20240514134140.1050141-1-s.hauer@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_011357_333063_39143238 
X-CRM114-Status: GOOD (  14.17  )
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

SGkgU2FzY2hhLAoKcy5oYXVlckBwZW5ndXRyb25peC5kZSB3cm90ZSBvbiBUdWUsIDE0IE1heSAy
MDI0IDE1OjQxOjQwICswMjAwOgoKPiBuYW5kX3JlYWRfZGF0YV9vcCgpIGlzIG5vdCBzdXBwb3J0
ZWQgYnkgYWxsIE5BTkQgY29udHJvbGxlcnMuCj4gbmFuZF9jaGFuZ2VfcmVhZF9jb2x1bW5fb3Ao
KSBpcyBub3Qgc3VwcG9ydGVkIG9yIGF0IGxlYXN0IGlzIGhhcmQgdG8KPiBzdXBwb3J0IGJ5IE5B
TkQgY29udHJvbGxlcnMgdGhhdCB1c2UgYSBkaWZmZXJlbnQgcGFnZSBsYXlvdXQgdGhhbgo+IGV4
cGVjdGVkIGJ5IHRoZSBOQU5EIGNvcmUuCgpJJ20gc29ycnkgYnV0IFJORE9VVCBpcyBub3Qgc28g
aGFyZCB0byBzdXBwb3J0LCBhbmQgSSBrbm93IG5vIE5BTkQKY29udHJvbGxlciB3aXRob3V0IHRo
aXMgZmVhdHVyZSAoSSB0aGluayBldmVuIHRoZSBmaXJzdCBteGMgY29udHJvbGxlcgpzdXBwb3J0
cyBpdD8pLiBIb3dldmVyLCB0aGUgY29tbWFuZCBkb2VzIG5vdCBleGlzdCBvbiBzbWFsbCBwYWdl
IE5BTkRzCig1MTIgYnl0ZXMpLiBUQkggSSBoYXZlIG5ldmVyIHNlZW4gc3VjaCBhIGRldmljZSBt
eXNlbGYsIHNvIEkgd29uZGVyCmhvdyBzcHJlYWQgdGhleSBzdGlsbCBhcmUuCgpXaGF0IG1heSBu
b3QgYmUgc3VwcG9ydGVkIGhvd2V2ZXIgYXJlIHRoZSBEQVRBX0lOIGN5Y2xlcy4KCj4gSW5zdGVh
ZCBvZiByZWx5aW5nIG9uIHRoZXNlIGZ1bmN0aW9ucwo+IGp1c3QgcmVhZCB0aGUgdGhyZWUgcGFy
YW1ldGVyIHBhZ2VzIGluIG9uZSBnby4KCkJpdGZsaXBzIGluIHBhcmFtZXRlciBwYWdlcyBhcmUg
dmVyeSByYXJlLCB0aGV5IGFyZSBub3JtYWxseSBxdWl0ZQpyb2J1c3QuIFRoZSBwcm9wb3NlZCBz
b2x1dGlvbiBpbXBhY3RzICphbGwqIE5BTkRzLCBiZWNhdXNlIHRoZSBJL08KY2hpcCBzcGVlZCBp
cyBhdCBpdHMgbG93ZXN0LiBUaGVyZSBpcyBubyByZWFzb24gaW4gbW9zdCBjYXNlcyB0byBkbwp0
aGF0LgoKSSBhZ3JlZSB0aGVyZSBpcyBhIHByb2JsZW0gd2l0aCB0aGUgcGF0Y2ggSSBwcm9wb3Nl
ZCBhbmQgd2UgbmVlZCB0bwpzZXR0bGUuIEFuZCB3ZSBzaW1wbHkgY2Fubm90IG1ha2UgUk5ET1VU
IGNhbGxzIHJhbmRvbWx5IGhlcmUgYXMgbG9uZyBhcwp3ZSB3YW50IHRvIHN1cHBvcnQgc21hbGwg
cGFnZSBOQU5Ecy4KCkkgYmVsaWV2ZSB3ZSBzaG91bGQgZG8gc29tZXRoaW5nIGxpa2U6CgpuYW5k
X3JlYWRfcGFyYW1fcGFnZV9vcCgwKQppZiAoY29ycnVwdGVkKSB7CglpZiAoc3VwcG9ydGVkLmRh
dGFpbikKCQlkYXRhX2luKCk7IC8qIHRoaXMgaXMgZmFzdGVyICovCgllbHNlCQkKCQluYW5kX3Jl
YWRfcGFyYW1fcGFnZV9vcCgxKQp9CgpJJ2xsIHRyeSB0byBkcmFmdCBzb21ldGhpbmcgKGFsc28g
YXBwbGllcyB0byB0aGUgamVkZWMgZGlzY292ZXJ5KS4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
