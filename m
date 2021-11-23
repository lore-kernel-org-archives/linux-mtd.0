Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F49CC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Nov 2021 14:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCP0kc83ymrPBbYECqBCBKSJf8YHRmmkGMLEl6bT/i8=; b=TuvJogdEWqigofYSA4iNpQlvSG
	dTZX4o9WQ2W1l+IOCvsPkdJ3SiTT54dVc/jbww2cI4Np2TlrHGoO5hQuriWQjvPfRgrlLAPiquWcx
	sxnlLk3TNiAQsRC3Riv/6SF0xp13UnCooSt+Kj4UW1wjiOoSAyBmk8GU4TJ7pKHJWu+Bsvw65Km0O
	W+R2CA0RuVJ9XxDPIi7vqZtf2dXWkNgbXbVdj0pySU3Cq0DnZj9GhP831LGWKtgXbuwEp4eq65Wmk
	24HJ5LFdy0azkauOnH/bbQlKAaYw9rpHuyBm+Sm+VejkzHZ4mKQf6EAUhgaRh4cXHdQqjT0rZ1MYa
	twCY3XQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpWMH-002SGM-MT; Tue, 23 Nov 2021 14:01:17 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpWME-002SEy-1c
 for linux-mtd@lists.infradead.org; Tue, 23 Nov 2021 14:01:16 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 45A4E22175;
 Tue, 23 Nov 2021 15:01:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1637676070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xsVVJ9IgbGCSjuveXkfALvgXLimlp1wqns8vX3ov7SE=;
 b=iJjECdFeGoMNs4OTlEDhnquq+u55uGZuorKXxXe01rg8RKmu9eceZmnKxQkGuvQT6uPerZ
 dzTNJ4l9gu5W/OHBLkpDVZnjSROH2vVyRzBS+WJPlQVaeMg8DVz8OgPcaORZycb99AtkbI
 danKd/aeuxgyRub0PiCo3yAHGHFe5xk=
MIME-Version: 1.0
Date: Tue, 23 Nov 2021 15:01:10 +0100
From: Michael Walle <michael@walle.cc>
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: mt25qu: Ignore 6th ID byte
In-Reply-To: <46f438c2-6f5f-645e-23b4-95216ec23ca3@nokia.com>
References: <20211119080402.20262-1-alexander.sverdlin@nokia.com>
 <9a158e2ef6635212c1e353590e3b773b@walle.cc>
 <1e133bc6-5edb-c4ce-ad44-3de77048acf2@nokia.com>
 <e9589af968d7b9dafbce17325dbf8472@walle.cc>
 <2bf37a35-1ccf-f4fa-c999-42b9154a2914@nokia.com>
 <88db136a146edf53801d86509b52d40f@walle.cc>
 <46f438c2-6f5f-645e-23b4-95216ec23ca3@nokia.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <06ce3d8eabd689f8755021d7ce08c3e0@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_060114_258870_E6050B60 
X-CRM114-Status: GOOD (  10.91  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpBbSAyMDIxLTExLTIzIDEzOjQwLCBzY2hyaWViIEFsZXhhbmRlciBTdmVyZGxpbjoKPiBP
biAyMy8xMS8yMDIxIDA5OjE0LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+Pj4gCj4+PiBTb21lIHBl
b3BsZSBhc2sgdGhlbXNlbHZlcyB3aHkgdGhpcyB0YWJsZSBrZWVwcyBncm93aW5nIGlmIHRoZXJl
IGlzIAo+Pj4gU0ZEUC4uLgo+Pj4gSSBzZWUgdGhlIHBvaW50IGluIGZpeHVwcywgYnV0IG1heWJl
IGF0IHNvbWUgcG9pbnQgd2Ugd2lsbCBiZSBhYmxlIHRvIAo+Pj4gc3VwcG9ydAo+Pj4gc29tZcKg
ZGV2aWNlc8KganVzdMKgb3V0wqBvZsKgdGhlwqBib3g/Cj4+IAo+PiBBcmUgdGhlc2UgZmVhdHVy
ZXMgZGV0ZWN0YWJsZSBieSBTRkRQPyBXaXRob3V0IGtub3dpbmcgYW55dGhpbmcsIGFzIAo+PiB5
b3UgaWdub3JlZAo+PiBteSBmb3JtZXIgcXVlc3Rpb24sIEknZCBzYXkgbm8uCj4gCj4gV2VsbCwg
SSBqdXN0IGhhZCBub3RoaW5nIHRvIHNheSBvbiB5b3VyIHF1ZXN0aW9uLgo+IEl0IHdhc24ndCBt
eSBpbnRlbnRpb24gdG8gc3R1ZHkgc2VjdXJpdHkgZmVhdHVyZXMgb2YgYSBjaGlwLCB3aGljaCBJ
IAo+IGRvbid0IHVzZS4KCkxpa2UgSSBzYWlkLCB3aXRob3V0IHRoYXQgaW5mb3JtYXRpb24gaXRz
IGhhcmQgZm9yIG1lIGRvIGRlY2lkZSBpZiB3ZSAKY2FuIGp1c3QKaWdub3JlIHRoYXQgbGFzdCBi
eXRlLiAoQW5kIHllcyBJJ3ZlIGFscmVhZHkgdHJpZWQgdG8gZ2V0IHRoYXQgTkRBIFBERiAKdmlh
ICRXT1JLLApidXQgSSBkb24ndCBoYXZlIGhpZ2ggaG9wZXMgd2l0aCB0aGF0KS4KCi1taWNoYWVs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
