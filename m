Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B0BC433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 16:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+2iSrMBOB+oTM+hEFEkEVuK6514114yVNdSPUb5eck=; b=sRss8k+OoV+H5i
	Kfkw58Ug0IkR+nwKdgxxotGXHjUjA5nX0n9uYpBVwfln7u76wnxIjuBU/X9wPnTwk2PQGM+rWK1a9
	sk0cUR2E9rwzW8Vv1HqNC26Wcrhs5AJ1TfxuAXACQXdNnJl5wxzYGcoBhqJe44TT04UG+m/7BHWxN
	44kIYxpbUJeKdHEjGmXS6RtYl5Up1xcyeyNRFKfIy/0YmWeoIcxIA7jzmUHQ/hXi5m/ZBe5dTCk2R
	ggc6eY18bMbS6JWDVTH3S8+Cux0abvFYMXyh3cEX2KVGzjbRlLue9vJ77f14BuueB37dRYCDvzlg1
	R3hrHVt5aqXunHkux3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBfJM-001FXX-3k; Sun, 23 Jan 2022 16:01:48 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBfIi-001FDN-T5
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 16:01:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C9063C0009;
 Sun, 23 Jan 2022 16:01:02 +0000 (UTC)
Date: Sun, 23 Jan 2022 17:01:01 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Xiangsheng Hou
 <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v9 00/13] External ECC engines & Macronix support
Message-ID: <20220123170101.5bc21291@xps13>
In-Reply-To: <20220104083631.40776-1-miquel.raynal@bootlin.com>
References: <20220104083631.40776-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_080109_120223_D07E3242 
X-CRM114-Status: GOOD (  11.90  )
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

SGVsbG8sCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIFR1ZSwgIDQgSmFuIDIw
MjIgMDk6MzY6MTggKzAxMDA6Cgo+IEhlbGxvIGFsbCwKPiAKPiBJJ3ZlIGFwcGxpZWQgdGhlIGJl
Z2lubmluZyBvZiB0aGUgc2VyaWVzIChiaW5kaW5ncyArIEVDQyBwYXJ0KSBpbiBhCj4gYnJhbmNo
IG5hbWVkIHNwaS1tZW0tZWNjIG9uIHRoZSBNVEQga29yZyByZXBvc2l0b3J5LiBBZnRlciBkaXNj
dXNzaW5nIGEKPiBiaXQgbW9yZSBzb21lIGRldGFpbHMsIEkgZGVjaWRlZCBub3QgdG8gcnVzaCBh
bmQgZGlkIG5vdCBhcHBseSB0aGUKPiBzZWNvbmQgaGFsdmUgb2YgdGhlIHNlcmllcyBmb3IgdjUu
MTcuIEhlcmUgaXMgbm93IHRoZSBzZWNvbmQgaGFsdmUgYWdhaW4KPiBpbiBhIGhvcGVmdWxseSBi
ZXR0ZXIgc2hhcGUuIEkgYW0gZXhwZWN0aW5nIGEgZmV3IGFja3Mgb24gdGhpcyBvbmUgYW5kCj4g
SSdsbCB0aGVuIHJlYmFzZSBzcGktbWVtLWVjYyBvbiB0b3Agb2YgdjUuMTgtcmMxLCBhcHBseSB0
aGVzZSBwYXRjaGVzCj4gYW5kIHNoYXJlIHRoZW0gd2l0aCB0aGUgc3BpIHRyZWUuCgpTZXJpZXMg
YXBwbGllZCBpbiBpdHMgb3duIGJyYW5jaCwgSSB3aWxsIHNoYXJlIGl0IG5leHQgd2VlayB3aXRo
IHRoZQpzcGkgdHJlZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
