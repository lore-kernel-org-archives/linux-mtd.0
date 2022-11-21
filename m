Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE3FC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 08:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DMmyg3W55sP3DlEvNPbDYjaDcWeVm7WJ7TdUgFI6U24=; b=lGnGbxJN6p54od
	jIVQET/AylLQCjLxq0iVnsRIkE+xCamzm9fWAa8e1gXLocpz+miLSHab1pDhlTSby3OTyACdtEGHd
	sq5umBKHxjLf+JmxDU3Lj8SqI/daSrkFa2zHKPe3WCYPvy4i/zq/v83Zc9seVXYWSNbB6RlR/U2+p
	pKbHeDiTUeozYknC0w64vOVPTzCja6q4PDUs3w8MNIMs9zpUkwpbJPnUC+3p3DlpMnYclOt22Dyvz
	QcYc5PQcye7cBBlqMuJefTI/TMZwXTH/zdr0/P28OLVUR2WR5S/jbxj2Kw8vHFu0LzX4QA/k02MTJ
	BoqrQVK+nwcrp2j9BQIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2AL-00BGin-2j; Mon, 21 Nov 2022 08:28:33 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox28x-00BFp1-Li
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2022 08:27:09 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1FDF9240003;
	Mon, 21 Nov 2022 08:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669019219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fk8qDrTH09MWY8QBGx3T6KRb5yH/xi45NQ52m4evwoQ=;
	b=AYA2XDnGkqMmAZva0lA2ozscoIyN8B08aO7A4BfPWiXJ/kGXkV67BCImDh3EPvap7MBZTK
	29CmOrhNfpIEem1j2A77MHdwiOqb3LVTw+AMA6yodvQqsCXVAjCiSlmtO0kAzRQLzu/UO9
	eJ40RMYWEENsBsKr0csOkXjae21SG2lZbDSDv/sqBG8KjkZXJ8HrwpYlsa9SkVh8T3F4qW
	Q1YkqSp3siNIEulEZ8BGGFnbX4dNzssTSDLs6NSNKPIkHgJR7H5m6nNXKAHFN3PmPMzkvP
	FT6yUgPhb8uTet91rfuSwl6jfWkNWUBkoCfGQZYoG+QAkWOujSdNyYLQMoVq0A==
Date: Mon, 21 Nov 2022 09:26:54 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 2/9] mtd: spi-nor: Introduce the concept of bank
Message-ID: <20221121092654.45cfd177@xps-13>
In-Reply-To: <20221120161135.e33livsa5rdolmx2@yadavpratyush.com>
References: <20221110155513.819798-1-miquel.raynal@bootlin.com>
	<20221110155513.819798-3-miquel.raynal@bootlin.com>
	<20221120161135.e33livsa5rdolmx2@yadavpratyush.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_002707_886787_834F9858 
X-CRM114-Status: GOOD (  14.71  )
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

SGkgUHJhdHl1c2gsCgpwcmF0eXVzaEBrZXJuZWwub3JnIHdyb3RlIG9uIFN1biwgMjAgTm92IDIw
MjIgMTc6MTE6MzUgKzAxMDA6Cgo+IE9uIDEwLzExLzIyIDA0OjU1UE0sIE1pcXVlbCBSYXluYWwg
d3JvdGU6Cj4gPiBTUEktTk9SIGNoaXBzIGFyZSBtYWRlIG9mIHBhZ2VzLCB3aGljaCBnYXRoZXJl
ZCBpbiBzbWFsbCBncm91cHMgbWFrZQo+ID4gKGVyYXNlKSBzZWN0b3JzLiBTZWN0b3JzLCBnYXRo
ZXJlZCB0b2dldGhlciwgbWFrZSBiYW5rcyBpbnNpZGUgdGhlCj4gPiBjaGlwLiBTbyBmYXIgdGhl
cmUgd2FzIG9ubHkgb25lIGJhbmsgcGVyIGRldmljZSBzdXBwb3J0ZWQsIGJ1dCB3ZSBhcmUKPiA+
IGFib3V0IHRvIGludHJvZHVjZSBzdXBwb3J0IGZvciBuZXcgY2hpcHMgZmVhdHVyaW5nIHNldmVy
YWwgYmFua3MgKHVwIHRvCj4gPiA0IHNvIGZhcikgd2hlcmUgZGlmZmVyZW50IG9wZXJhdGlvbnMg
bWF5IGhhcHBlbiBpbiBwYXJhbGxlbC4KPiA+IAo+ID4gTGV0J3MgYWxsb3cgZGVzY3JpYmluZyB0
aGVzZSBhZGRpdGlvbmFsIGJhbmsgcGFyYW1ldGVycy4gIAo+IAo+IEp1c3QgdG8gYmUgc3VyZSwg
YXJlIHRoZSBtdWx0aXBsZSBiYW5rcyBzdGlsbCB1c2VkIHZpYSBhIHNpbmdsZSBDaGlwIAo+IFNl
bGVjdCwgb3IgZG8gd2UgbmVlZCBtdWx0aS1DUyBzdXBwb3J0IGZvciB0aGlzIGFzIHdlbGw/IEkg
ZG8gcmVtZW1iZXIgCj4gc2VlaW5nIGFuIFJGQyBhYm91dCBtdWx0aS1DUyBzdXBwb3J0IGZyb20g
eW91IHNvbWUgdGltZSBiYWNrIGFuZCBJIGFtIAo+IG5vdCBzdXJlIGlmIHRoYXQgaXMgcmVsYXRl
ZC4KCkkgY29uZmlybSB0aGlzIGlzIG5vdCByZWxhdGVkIHRvIHRoZSBtdWx0aS1DUyBiaW5kaW5n
IEkgd29ya2VkIG9uCmVhcmxpZXIuIEFsbCB0aGUgYmFua3MgSSBhbSB0YWxraW5nIGFib3V0IGFy
ZSBleHBlY3RlZCB0byBiZSB1c2VkIHZpYSBhCnNpbmdsZSBDUy4KCj4gUmV2aWV3ZWQtYnk6IFBy
YXR5dXNoIFlhZGF2IDxwcmF0eXVzaEBrZXJuZWwub3JnPgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3
cyEKCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
