Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F67CA0ED3
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Sep 2024 14:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFde1BaTGIGq3Eg2FY4ZbvE2yAVd4Tcy7kJyW7f2Ik4=; b=G8/GjP9QaXGiu+
	sExNbuaZNVOWdDEC1eNQSg8mStSR6yUg1FBf31kNxa24Irz2Zq7wSUsmI1G6nG8+nIO4h9XAtrbmt
	KehXYvAWAqP+Y/VWD0fO65GiQnYH2xiun9EPGYc2+9C9TnACq+ZAEpyffnXVO+Srx0psfS9owXO5r
	xgImxn2dT1+l12aRrx+8orLFrdYneEew0atALxRMEAxZfCmIo2Lon9k9FfGv0CpoCIQ0hTowUfxf9
	sVXnn5nOjsBC0hdWkUKt/psfNcdw02oqEgWuUNKzPNaAi2g8vBkdTIeosJGQJwoQW+iUpsMK7jH6Z
	vX9l26yXYv5oMQ7fPTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqzm-00000004myZ-0TSE;
	Wed, 04 Sep 2024 14:28:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqwp-00000004mHP-3yZ6;
	Wed, 04 Sep 2024 14:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+YuivvZRJxt6dop6oazyFT5Xzsn29at/kqlsgNrQWkU=; b=grWgoe2JqiJKodMkB85jz+P4tH
	0IYkfYdVvN9rXy+xSlOThG3H1LwnWj2R/MQ7GZST6KO8PFz7tTbKAtDLJb2T45s90K+u6puN1O5m+
	DNjfc95U5CJbdVpY9JQDtOqvH0rQ/ItP6oxVyiz1cupmRG658fpxV8rz0zrdMHurBZndgdtawPDCw
	qAo1DCerL+XtOghCArRAECo9lEYETeDd65aORQ98ThrTa16MqarfKs7SGRUe3i5u/I+ASVTQcPW5i
	Qvtt6GbLOZ5S5erewu9OXuH2nfGTLVawVjuL4afnzwXVMx0ktgYYTaKfeFFi1D5ArtuDpjpN9d5mK
	crceS3eg==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1slqwm-00000000FJh-1ww3;
	Wed, 04 Sep 2024 14:25:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C0C01C000D;
	Wed,  4 Sep 2024 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725459919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YuivvZRJxt6dop6oazyFT5Xzsn29at/kqlsgNrQWkU=;
	b=lJL0a5Sgt9JCOHSCAi9C0XrfihHgt3G7g9Tp2gGDgpMlyrAjdUF/i+AM7EVSD/xuijusSt
	qUJt/7oqJ+eTj3j6SnyQzD1XvN5oyz/QoFHd0OAqDp4N/45/ucNcajfm6ygPV3XDrK+9ZR
	fpqdbF4H5QfDyrWRHWf9r5Cp5B4UMiMeaOeFMla5WxhdRlZwERmF/Wje+4pqh5O0VpfMby
	5lKw6G0KhGHjAiDYImJ89RWokD2QNfY73ZpsdH+lrQ+E4MkK6sCQW+cnX3wZaJVfDMLurC
	ZDwv1Gr4UkMe8ossDk4iEdEytNm4KDbNdWaAdCC+rnL5mlmLRO0k1mMwwI2LBg==
Date: Wed, 4 Sep 2024 16:25:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Walle
 <michael@walle.cc>, <linux-mtd@lists.infradead.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH next 2/2] mtd: rawnand: mtk: Fix init error path
Message-ID: <20240904162515.2af2415d@xps-13>
In-Reply-To: <mafs05xrbika8.fsf@kernel.org>
References: <20240826153019.67106-1-miquel.raynal@bootlin.com>
	<20240826153019.67106-2-miquel.raynal@bootlin.com>
	<mafs05xrbika8.fsf@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_152524_656958_1525BCC2 
X-CRM114-Status: GOOD (  13.31  )
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

SGkgUHJhdHl1c2gsCgpwcmF0eXVzaEBrZXJuZWwub3JnIHdyb3RlIG9uIFdlZCwgMDQgU2VwIDIw
MjQgMTY6MDg6MTUgKzAyMDA6Cgo+IE9uIE1vbiwgQXVnIDI2IDIwMjQsIE1pcXVlbCBSYXluYWwg
d3JvdGU6Cj4gCj4gPiBSZXZpZXdpbmcgYSBzZXJpZXMgY29udmVydGluZyB0aGUgZm9yX2VhY2hf
Y2hpbF9vZl9ub2RlKCkgbG9vcHMgaW50bwo+ID4gdGhlaXIgX3Njb3BlZCB2YXJpYW50cyBtYWRl
IG1lIHJlYWxpemUgdGhlcmUgd2FzIG5vIGNsZWFudXAgb2YgdGhlCj4gPiBhbHJlYWR5IHJlZ2lz
dGVyZWQgTkFORCBkZXZpY2VzIHVwb24gZXJyb3Igd2hpY2ggbWF5IGxlYWsgbWVtb3J5IG9uCj4g
PiBzeXN0ZW1zIHdpdGggbW9yZSB0aGFuIGEgY2hpcCB3aGVuIHRoaXMgZXJyb3Igb2NjdXJzLiBX
ZSBzaG91bGQgY2FsbCB0aGUKPiA+IF9uYW5kX2NoaXBzX2NsZWFudXAoKSBmdW5jdGlvbiB3aGVu
IHRoaXMgaGFwcGVucy4KPiA+Cj4gPiBGaXhlczogRml4ZXM6IDFkNmIxZTQ2NDk1MCAoIm10ZDog
bWVkaWF0ZWs6IGRyaXZlciBmb3IgTVRLIFNtYXJ0IERldmljZSIpCj4gPiBTaWduZWQtb2ZmLWJ5
OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiAgCj4gCj4gRGlkIGEg
cXVpY2sgc2Nhbi4gQ2FuJ3Qgc2VlIGFueXRoaW5nIChvYnZpb3VzKSBlbHNlIGJlaW5nIGxlYWtl
ZCBvbgo+IGVycm9yIHBhdGhzLgoKR3JlYXQhIFRoYW5rcyBhIGxvdCBmb3IgdGhlIHJldmlld3Mh
Cgo+IFJldmlld2VkLWJ5OiBQcmF0eXVzaCBZYWRhdiA8cHJhdHl1c2hAa2VybmVsLm9yZz4KCkNo
ZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
