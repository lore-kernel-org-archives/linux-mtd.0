Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71726C531DA
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Aug 2023 17:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUilHdCeycWxS2Wl1tlGyf37yhERywnQ2z3mIma7ZNc=; b=b34VqBqPN74hbvcezzfh/0zRci
	KvK5jeOdDQCFya0IG+0ZltBXg1MfdA40OLv4ZRbfabNZcUK0cQCHsPahsUMK5aAuXf7nvel6xFPms
	SVGu7rKB/GbNikLMjyEwo6yZqovawVbCDFNB/syFyy8HqdFX2AZbAv04pjW9mU0IbNSL2HAj/9T37
	LOwglBf+1xKwZai0DgtB18yLQVmCROaSmEfMVf62e0Y7fN6OzlEOZIOi+1+PEIiHKsKYFD3aRsR5J
	sNAAhp7qlDJir2b/99gPC+N0G+UnFJx9roo6qv900GIHMEi3rs+lVoJZfcPpVr7KX3Fi14PPJUhYh
	HgVzZ5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWgVu-006qrp-2A;
	Thu, 17 Aug 2023 17:10:26 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWgVs-006qoY-0G
	for linux-mtd@lists.infradead.org;
	Thu, 17 Aug 2023 17:10:25 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 4D083F0;
	Thu, 17 Aug 2023 19:10:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1692292221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KISS4diuBJN4zlTQxR2ELa6FNfvHMKCOwBLTJya1pFo=;
	b=UwodL+VoMTcvPG1OjUbP0vnbM61jpmT80T5K9/U/5wn25KAkfg/ZSRI5tO6Mz1tXCNoy7O
	4dg6eGvLPzp3YS1kiTtybUyBmLaRjX3KO1f30YekE6NR4Jt9MvUDIgBeAIG+aqLlDDmXkw
	Wr//lTUUSxg9ITRRrA3w7CPBPS8igOizRXqTAT92ryAe4vqlY2YZHKmsz9yX7HV6+3+zde
	sSPTGCbhiSpnojkOV3Bx1bcWX7g54CvvEZckyy6pdXhFU9snch2N25yyHuh8ebXPMKmdh+
	BURcB2+FHh8OZ3GE8Ymg/zeqRfXuOeH/+jHHpenLmK8dQBpKjJaKdpDveTknmQ==
MIME-Version: 1.0
Date: Thu, 17 Aug 2023 19:10:21 +0200
From: Michael Walle <michael@walle.cc>
To: SSunk <ssunkkan@gmail.com>
Cc: miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, pratyush@kernel.org, richard@nod.at,
 ssunkkan@gmail.com, tudor.ambarus@linaro.org, vigneshr@ti.com
Subject: Re: [PATCH] Add support for more XMC series
In-Reply-To: <20230817170335.3711-1-ssunkkan@gmail.com>
References: <20230817152050.6679eae3@xps-13>
 <20230817170335.3711-1-ssunkkan@gmail.com>
Message-ID: <abd705350b650717dbbc187815d384e7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_101024_273946_B45FF159 
X-CRM114-Status: UNSURE (   8.06  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgo+PiBYTUMgcGFydHMgc2VlbSB0byBoYXZlIFNGRFAgdGFibGVzIGFuZCB0aGV5IHNob3Vs
ZCB3b3JrIG91dCBvZiB0aGUgYm94Cj4+IHdpdGhvdXQgYW55IHBhdGNoZXMgd2l0aCB0aGUgZ2Vu
ZXJpYyBzcGkgbm9yIGRyaXZlciBbMV0uIFRoZXJlZm9yZSwKPj4geW91IGRvbid0IG5lZWQgYW55
IGVudHJ5IGF0IGFsbC4KPiAKPiBJIHRoaW5rIGl0IGlzIHJlbGF0ZWQgdG8gdGhlIFBBUlNFX1NG
RFAgZmxhZy4KPiBUaGUgWE1DIGZsYXNoIHBhcnQgc3VwcG9ydHMgU0ZEUCwgc28gaSBkb27igJl0
IG5lZWR0byBhZGQKPiBOT19TRkRQX0ZMQUdTKCkgbWFjcm8uCgpDb3JyZWN0LiBJZiB0aGUgZmxh
c2ggaXMgd29ya2luZyB3aXRoIFBBUlNFX1NGRFAsIGl0IGhhcyBTRkRQIGFuZAphbGwgdGhlIGlu
Zm9ybWF0aW9uIG9mIHRoZSBmbGFzaF9pbmZvIHRhYmxlIGlzIHB1bGxlZCBmcm9tIHRoZSBTRkRQ
CnRhYmxlcywgZXhjZXB0IGZvciB0aGUgcGFydCBuYW1lLiBUaGVyZWZvcmUsIHlvdSBkb24ndCBu
ZWVkIGFueSBlbnRyeQphdCBhbGwuIFRoZSBmbGFzaCBzaG91bGQganVzdCB3b3JrIG91dCBvZiB0
aGUgYm94LiBBcmUgeW91IHVzaW5nIHRoZQpsYXRlc3Qga2VybmVsPwoKLW1pY2hhZWwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
