Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7684EEB64DD
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 13:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H6c+T/5EsZGRioPc08PxrakJmRmV68paqXqP/qUmzMc=; b=M+OJoqal07Kbn5
	hzKcw1Sm2Yd87kDsxEsx9Y32qVAXNlNooQ+hbyL23OCtixy0wd0VtEIBAfDkgB3TQVQYvNbj8099u
	Q62o3knRW+k2Q02gqgs654fuY3eDIFvEAl9lKcJeI8Mub0QqQ56cebVCMsWN6GD47Q/8lVhJPJmfb
	hGSH9r2dw58Ooy0VVrzy5IGyeWSc9dUfLwdB9r8MdOem1w8GNJzfDwanGIj8bbgK0dl3N41C00hIi
	BvAm+v2JInRCQqQJuo2555plhQwkLC4U8IJWvLv/B9zMiiia0EuO2DRYIuZrXJBfhzzHLuGKNgd5h
	TGBg55CTLqeH7M8f5kUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgHR-00DQCw-0R;
	Tue, 04 Jul 2023 13:41:21 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgHM-00DQAQ-1v;
	Tue, 04 Jul 2023 13:41:18 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688478072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QJLhG5xef0Dm9kVxipRfJ1zAKqJpL9r++IajKk5AkNU=;
	b=pZo+4NrPp2dycBIRoGMvUMInSYsTFLDpojazcKafyNd55aRmC80dmZ1TZdYaeVs3mfgjBE
	z6ngQq4XpQ7bf5wQ2kp6Wzt7xDHanylnonV7EkM+d+LnLuDobkEPsoLkh+3gpPDbbgwy29
	vbjXtpOZPjanZTztmEfCWazX4Lgpl+QXBjT/gdKdhQcq1+x+DdcRUuscmFGFmhgGn/2V6H
	vCyMqXZ2ZVDsIKLbSwQGOD2dMUUzCWV/hB7/CdX44FztFNvbk5M+8U0Zr2R6dumBq+AmIY
	9VbRtRlJnIx8NOokmg9NJjeqGgYG+rmqreo7wsMxVxuXqXZIPGyqvZVsvtM/fQ==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F5DEC000B;
	Tue,  4 Jul 2023 13:41:08 +0000 (UTC)
Date: Tue, 4 Jul 2023 15:41:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v1 2/2] mtd: rawnand: meson: support for 512B ECC
 step size
Message-ID: <20230704154106.5c5aafd8@xps-13>
In-Reply-To: <ee2eb73a-fb25-58ae-cf7e-83d971b7b8b2@sberdevices.ru>
References: <20230628092937.538683-1-AVKrasnov@sberdevices.ru>
	<20230628092937.538683-3-AVKrasnov@sberdevices.ru>
	<20230704103617.4affae8a@xps-13>
	<9e6eaa87-887c-f955-113a-43860c8ea00c@sberdevices.ru>
	<20230704114110.25ca9de4@xps-13>
	<aede4639-0e99-565a-c997-c414342c66af@sberdevices.ru>
	<20230704115628.55320428@xps-13>
	<ee2eb73a-fb25-58ae-cf7e-83d971b7b8b2@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_064117_065770_506A6C42 
X-CRM114-Status: GOOD (  21.04  )
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

SGkgQXJzZW5peSwKCj4gPj4+PiBZZXMsIHRoaXMgY29kZSBsb29rcyBzdHJhbmdlLiAnbnNlY3Rv
cnMnIGlzIHVzZWQgdG8gY2FsY3VsYXRlIHNwYWNlIGluIE9PQgo+ID4+Pj4gdGhhdCBjb3VsZCBi
ZSB1c2VkIGJ5IEVDQyBlbmdpbmUgKHRoaXMgdmFsdWUgd2lsbCBiZSBwYXNzZWQgYXMgJ29vYmF2
YWlsJwo+ID4+Pj4gdG8gJ25hbmRfZWNjX2Nob29zZV9jb25mKCknKS4gSWRlYSBvZiA1MTIgaXMg
dG8gY29uc2lkZXIgIndvcnN0IiBjYXNlCj4gPj4+PiBmb3IgRUNDLCBlLmcuIG1pbmltYWwgbnVt
YmVyIG9mIGJ5dGVzIGZvciBFQ0MgZW5naW5lIChhbmQgYXQgdGhlIHNhbWUgdGltZQo+ID4+Pj4g
bWF4aW11bSBudW1iZXIgb2YgZnJlZSBieXRlcykuIEZvciBNZXNvbiwgaWYgRUNDIHN0ZXAgc2l6
ZSBpcyA1MTIsIHRoZW4gd2UKPiA+Pj4+IGhhdmUgNCB4IDIgZnJlZSBieXRlcyBpbiBPT0IgKGlm
IHN0ZXAgc2l6ZSBpZiAxMDI0IHRoZW4gd2UgaGF2ZSAyIHggMiBmcmVlCj4gPj4+PiBieXRlcyBp
biBPT0IpLgo+ID4+Pj4KPiA+Pj4+IEkgdGhpbmsgdGhpcyBjb2RlIGNvdWxkIGJlIHJld29ya2Vk
IGluIHRoZSBmb2xsb3dpbmcgd2F5Ogo+ID4+Pj4KPiA+Pj4+IGlmIEVDQyBzdGVwIHNpemUgaXMg
YWxyZWFkeSBrbm93biBoZXJlIChmcm9tIERUUyksIGNhbGN1bGF0ZSAnbnNlY3RvcnMnIHVzaW5n
Cj4gPj4+PiBnaXZlbiB2YWx1ZSAoZGl2IGJ5IDUxMiBmb3IgZXhhbXBsZSkuIE90aGVyd2lzZSBj
YWxjdWxhdGUgJ25zZWN0b3JzJyBpbiB0aGUKPiA+Pj4+IGN1cnJlbnQgbWFubmVyOiAgICAKPiA+
Pj4KPiA+Pj4gSXQgd2lsbCBhbHdheXMgYmUga25vd24gd2hlbiB0aGVzZSBmdW5jdGlvbiBhcmUg
cnVuLiBUaGVyZSBpcyBubwo+ID4+PiBndWVzc2luZyBoZXJlLiAgICAKPiA+Pgo+ID4+IEhtIEkg
Y2hlY2tlZCwgdGhhdCBidXQgaWYgc3RlcCBzaXplIGlzIG5vdCBzZXQgaW4gRFRTLCBoZXJlIGl0
IHdpbGwgYmUgMCwgCj4gPj4gdGhlbiBpdCB3aWxsIGJlIHNlbGVjdGVkIGluICduYW5kX2VjY19j
aG9vc2VfY29uZigpJyBhY2NvcmRpbmcgcHJvdmlkZWQgJ2VjY19jYXBzJwo+ID4+IGFuZCAnb29i
YXZhaWwnLi4uCj4gPj4KPiA+PiBBbnl3YXksIEknbGwgZG8gdGhlIGZvbGxvd2luZyB0aGluZzoK
PiA+Pgo+ID4+IGludCBuc2VjdG9yczsKPiA+Pgo+ID4+IGlmIChuYW5kLT5lY2Muc2l6ZSkKPiA+
PiAgICAgbnNlY3RvcnMgPSBtdGQtPndyaXRlc2l6ZSAvIG5hbmQtPmVjYy5zaXplOyA8LS0tIHRo
aXMgaXMgZm9yIDUxMiBFQ0MgIAo+ID4gCj4gPiBZb3Ugc2hvdWxkIHNldCBuYW5kLT5lY2Muc2l6
ZSBpbiAtPmF0dGFjaF9jaGlwKCkgaW5zdGVhZC4gIAo+IAo+IFNvcnJ5LCBkaWRuJ3QgZ2V0IGl0
Li4uIGlmIEVDQyBzdGVwIHNpemUgaXMgc2V0IGluIERUUywgdGhlbiBoZXJlLCBpbiBjaGlwIGF0
dGFjaAo+IGNhbGxiYWNrIGl0IHdpbGwgYmUgYWxyZWFkeSBrbm93biAoRFQgcGFydCB3YXMgcHJv
Y2Vzc2VkIGluICdyYXduYW5kX2R0X2luaXQoKScpLgo+IElmIEVDQyBzdGVwIHNpemUgaXMgdW5r
bm93biAoZS5nLiAwIGhlcmUpLCAnbmFuZF9lY2NfY2hvb3NlX2NvbmYoKScgd2lsbCBzZXQgaXQK
PiBhY2NvcmRpbmcgcHJvdmlkZWQgZWNjIGNhcHMuIFdoYXQgZG8gWW91IG1lYW4gZm9yICJZb3Ug
c2hvdWxkIHNldCAuLi4iID8KClRoZSBjdXJyZW50IGFwcHJvYWNoIGlzIHdyb25nLCBpdCBkZWNp
ZGVzIHRoZSBudW1iZXIgb2YgRUNDIGNodW5rcwooY2FsbGVkIG5zZWN0b3JzIGluIHRoZSBkcml2
ZXIpIGFuZCB0aGVuIGFza3MgdGhlIGNvcmUgdG8gZGVjaWRlIHRoZQpudW1iZXIgb2YgRUNDIGNo
dW5rcyB0byB1c2UuCgpKdXN0IHByb3ZpZGUgbXRkLT5vb2JzaXplIC0gMiBhcyBsYXN0IHBhcmFt
ZXRlciBhbmQgdGhlbiByZWx5IG9uIHRoZQpjb3JlJ3MgbG9naWMgdG8gZmluZCB0aGUgcmlnaHQg
RUNDIHN0ZXAtc2l6ZS9zdHJlbmd0aD8KClRoZXJlIGlzIG5vIHBvaW50IGluIHJlcXVlc3Rpbmcg
YSBwYXJ0aWN1bGFyIHN0ZXAgc2l6ZSB3aXRob3V0IGEKc3BlY2lmaWMgc3RyZW5ndGgsIG9yPyBT
byBJIGJlbGlldmUgeW91IHNob3VsZCBwcm92aWRlIGJvdGggaW4gdGhlIERUUwppZiB5b3Ugd2Fu
dCBwYXJ0aWN1bGFyIHBhcmFtZXRlcnMgdG8gYmUgYXBwbGllZCwgb3RoZXJ3aXNlIHlvdSBjYW4g
bGV0CnRoZSBjb3JlIGRlY2lkZSB3aGF0IGlzIGJlc3QuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
