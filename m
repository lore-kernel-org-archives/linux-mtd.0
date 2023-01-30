Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBF8C54EAA
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jan 2023 16:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQDVyxH3IB2Dd3CRgyjnHRfkdBOWP5ftXkxH528a4MA=; b=pShFodEv6sDE9s
	iRkQnBJIPyKnK2RTpQ9p9zZ8lzQ4F2naJlYUz/jPiquXXoK70a+AuG0c5fRaqi73DLTVuqipd1nua
	pVdRUxOUkYrUrYIQ5nc+BENbXeBqpPDzrjcDo0ksfwHJMLLT5Q/LGny+9E4HkJpEAUuilx/IL5WQ0
	9lycCjczlQdd4Aa0V2M5FnnwvF/VXKAYvGOvfGvNvgh9OA7rWmthXF41DgSD7XptxWL0wok19IqMF
	u3HOlC+ypf3t0vPGLM7nQOhrY+orQ9WLyUusd6oDfFEvIe4mK25+ZMao4fWF0sjgE1jFmr44dmU1O
	pIoidSe2GEwzE4kUYj+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMX8a-004FlI-12; Mon, 30 Jan 2023 16:36:08 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMX6d-004FSJ-4v; Mon, 30 Jan 2023 16:34:09 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D06E924000D;
	Mon, 30 Jan 2023 16:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675096441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EgN2oDAm7jnjRYWg9B2QaY9780SaXO7w1csXZxFZCmE=;
	b=EGoqFJy7VLLxtPtG+Wya2mCyjbxp+643c8y5pLlX380I8DJtrdlrDZRrZhOKRM+761zceH
	pqCkFzSy24eJMD7GH4wCInBYfUWPUVL1yRcvkL4HbQ1Hd44JKzxwf5R/siXdsFF3jcKwJr
	4tYTGnjV+gg9/tTvuc7OMeUp+zMjQezXKm6ENaO09tsoRx/s/2jmSN+mR4wR5eUz3Dy/o7
	RDB6qNlo23Uv1bclo2LPgMz6c+Obp2J9ZdC0iysLvvKA7PT2Zysvk0Pb1jQGdICjeEHRIg
	9clXkXZ1tNOnlmSNmaxUBjA9tqDMRaaxT5DmPPiQD8XdJMmAnVsutyYKp4fehQ==
Date: Mon, 30 Jan 2023 17:33:55 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Xiangsheng Hou <xiangsheng.hou@mediatek.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
Subject: Re: [RESEND PATCH v5 00/10] Add MediaTek MT7986 SPI NAND and ECC
 support
Message-ID: <20230130173355.5e65a1c5@xps-13>
In-Reply-To: <Y9ft8BIzESLQ0TTh@sirena.org.uk>
References: <20230130030656.12127-1-xiangsheng.hou@mediatek.com>
	<20230130171145.2c844d34@xps-13>
	<Y9ft8BIzESLQ0TTh@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_083407_342954_95D368C2 
X-CRM114-Status: GOOD (  16.61  )
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

SGkgWGlhbmdzaGVuZywKCmJyb29uaWVAa2VybmVsLm9yZyB3cm90ZSBvbiBNb24sIDMwIEphbiAy
MDIzIDE2OjE4OjU2ICswMDAwOgoKPiBPbiBNb24sIEphbiAzMCwgMjAyMyBhdCAwNToxMTo0NVBN
ICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4geGlhbmdzaGVuZy5ob3VAbWVkaWF0ZWsu
Y29tIHdyb3RlIG9uIE1vbiwgMzAgSmFuIDIwMjMgMTE6MDY6NDYgKzA4MDA6ICAKPiAKPiA+ID4g
VGhpcyBwYXRjaCBzZXJpZXMgYWRkIE1lZGlhVGVrIE1UNzk4NiBTUEkgTkFORCBhbmQgRUNDIGNv
bnRyb2xsZXIKPiA+ID4gc3VwcG9ydCwgc3BsaXQgRUNDIGVuZ2luZSB3aXRoIHJhd25hbmQgY29u
dHJvbGxlciBpbiBiaW5kaW5ncyBhbmQKPiA+ID4gY2hhbmdlIHRvIFlBTUwgc2NoZW1hLiAgCj4g
Cj4gPiBJIHdvdWxkIGxpa2UgdG8gcGljay11cCBwYXRjaGVzIDMsIDcgYW5kIDEwIGFuZCBhcHBs
eSB0aGVtIGluIHRoZSBtdGQKPiA+IHRyZWUgYXMgdGhleSBsb29rIGNvbXBsZXRlbHkgb3J0aG9n
b25hbCB3aXRoIGFsbCB0aGUgb3RoZXIgKHNwaS9EVCkKPiA+IGNoYW5nZXMsIGFtIEkgcmlnaHQ/
ICAKPiAKPiA+IE1hcmssIGlzIGl0IG9rYXkgZm9yIHlvdT8gIAo+IAo+IFRoYXQncyBmaW5lLCBh
c3N1bWluZyB0aGVyZSdzIG5vIGRlcGVuZGVuY3kgaXNzdWVzLiAgWGlhbmdzaGVuZywgaXQncwo+
IGdlbmVyYWxseSBiZXN0IHRvIGF2b2lkIG1peGluZyBwYXRjaGVzIGZvciBtdWx0aXBsZSBzdWJz
eXN0ZW1zIGludG8gYQo+IHNpbmdsZSBzZXJpZXMgd2hlbiBpdCdzIG5vdCBuZWVkZWQgc2luY2Ug
aXQgbWFrZXMgbWVyZ2luZyB0aGluZ3MgbW9yZQo+IGNvbXBsZXguCgpXZWxsLCBrZXJuZWwgdGVz
dCByb2JvdCBqdXN0IHJlcG9ydGVkIGFuIGlzc3VlIHdpdGggYSB3cm9uZyBmaWxlIG5hbWUsCnNv
IGxldCdzIHNwbGl0IHRoZSBzZXJpZXMuIEkgbm93IGV4cGVjdCBhIHNlcmllcyB3aXRoIHRoZSBz
cGkgYW5kCnJlbGV2YW50IGNoYW5nZXMgKGZvciBNYXJrKSBhbmQgYW5vdGhlciBzZXJpZXMgd2l0
aCB0aGUgdGhyZWUgbXRkCnBhdGNoZXMgLWZpeGVkLCBvZiBjb3Vyc2UtIHdoaWNoIEknbGwgYXBw
bHkgb24gbXkgc2lkZS4KClRoYW5rcywgTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
