Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C77C27C52
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jun 2024 07:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vx1SKLIOavj8Jcx2nDs1jM8softm8zrpNZcwoH7KF4Q=; b=MVtRV+Pu1F7SZa
	q4k3Pty6zyfIangPctrF5DBJzJS/ibzZpqS23R1Jb0oKNIH3O2UAwNnd771ntVq4z+0nrv/PzCQu2
	8d1U/NYnqQaNLQrb6AUGDFLtidXSe/frMjPfQd7eHQvIHXPtifBAN8CA005YEX5jeU++/GEoD24L2
	rY47uJ2RPdVlGtW89OT4/r6siqJAOHRZZpNW20byzaYfME/srNgEgOoVJZ3EMIsi+t1+RRvdY4d/M
	sBn8h14mhPOFW1YOLrRVda7xO/7mXKHO/JY/YpNoKgRAW9PYDOHJj2B6qdnHUOMqaBd/j94QpRrHl
	019AgakrpV8yo/bkCvbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sElJc-000000052h8-3rHK;
	Wed, 05 Jun 2024 07:44:12 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sElJX-000000052dN-3aTq
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jun 2024 07:44:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B21C01BF20A;
	Wed,  5 Jun 2024 07:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717573442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gMazlr+f0ay0OQRRaQaLtVjPs1acjHVrV/9BzKL3MHk=;
	b=QGKdGKKgTQwaxwc7fzB9V3qEm+4vNF63AtrXImg09JWC6pPjni7y6vu9B4TIVsawzG1ri+
	utuOAP2q5gaPux+W+FabcM5e8JGR74mA6aitOyTySvwAynZ4qPIyAjf5ElVLFusrKaAeIO
	QNJl7eBavwHYr0tiIfNM+bt+3aENtas+Yd0pmM5FRcYAv5E3Pv+ZIMJUbbz7TPs3hjlM6n
	giURPVPgGjS2A/1+/WPXZDGStYZpaBe6t8o850O10cBLFosy6TF67428plfi6cVPrKr3b0
	4lmf6Ojyyw74JLYMGSFqAZ8UsuVrk2ARRxAzjHSucGncWW1hT1WYpyUxLZjlpQ==
Date: Wed, 5 Jun 2024 09:43:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 0/2] mtd: use 'time_left' instead of 'timeout' with
 wait_*() functions
Message-ID: <20240605094359.53a6d8ca@xps-13>
In-Reply-To: <20240604212919.5038-4-wsa+renesas@sang-engineering.com>
References: <20240604212919.5038-4-wsa+renesas@sang-engineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_004408_181755_CD87D24A 
X-CRM114-Status: UNSURE (   9.33  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgV29sZnJhbSwKCndzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tIHdyb3RlIG9uIFR1
ZSwgIDQgSnVuIDIwMjQgMjM6Mjk6MTkKKzAyMDA6Cgo+IFRoZXJlIGlzIGEgY29uZnVzaW5nIHBh
dHRlcm4gaW4gdGhlIGtlcm5lbCB0byB1c2UgYSB2YXJpYWJsZSBuYW1lZCAndGltZW91dCcgdG8K
PiBzdG9yZSB0aGUgcmVzdWx0IG9mIHdhaXRfKigpIGZ1bmN0aW9ucyBjYXVzaW5nIHBhdHRlcm5z
IGxpa2U6Cj4gCj4gICAgICAgICB0aW1lb3V0ID0gd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0
KC4uLikKPiAgICAgICAgIGlmICghdGltZW91dCkgcmV0dXJuIC1FVElNRURPVVQ7Cj4gCj4gd2l0
aCBhbGwga2luZHMgb2YgcGVybXV0YXRpb25zLiBVc2UgJ3RpbWVfbGVmdCcgYXMgYSB2YXJpYWJs
ZSB0byBtYWtlIHRoZSBjb2RlCj4gb2J2aW91cyBhbmQgc2VsZiBleHBsYWluaW5nLgoKR29vZCBp
ZGVhLiBUaGUgd2FpdGluZyBmdW5jdGlvbnMgYXJlIGdlbmVyYWxseSBjb25mdXNpbmcgYmVjYXVz
ZSB0aGUKc2VtYW50aWNzIG9mIHRoZSByZXR1cm4gdmFsdWVzIGFyZSBkaWZmZXJlbnQsIHNvIHRo
aXMgaXMgYSBnb29kIGZpcnN0CnN0ZXAsIEknbGwgdGFrZSB0aGVtIHRocm91Z2ggbXRkLW5leHQg
c29vbi4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
