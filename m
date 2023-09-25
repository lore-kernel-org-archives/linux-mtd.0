Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD935CE7A81
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Sep 2023 14:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xi7abcv2Y7ew+uinYYPn4Ph64tE6WSUieXhYBb2L31k=; b=b0KwXORrvDmnvy
	4lxBzX/AtXlC61L5ZBmU4eWt+H4T41yiXcQtpdkSEn8nu5J9DgQyvjN/KgXWu+1BTdw+mU6XV4WNI
	BkhL7jOqqVd89pJSYRqEEhPiiXJSNaH/E/xrmUEo7E6T58rronh//Z6P7Hk/GXLZ2iHg/lWdee/Nm
	na4PZ/5CJEPYeW94QIJsZu7oAQJNo70rXzCzohgxffvycbZt7JO7ItGTxCoLXPI0//X9e5StmksQB
	S1sg0F9G4oRBdMf/BblToaS2/WzFcaBFk8bmmnmxgVRIkLpG29E/SYUkiesIWYyxp5XD7ZEvXWJDZ
	m/U/FTcfEUFLwqnFM2Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmiU-00ERvV-1g;
	Mon, 25 Sep 2023 14:37:42 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmiR-00ERtz-2S
	for linux-mtd@lists.infradead.org;
	Mon, 25 Sep 2023 14:37:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D02DA20009;
	Mon, 25 Sep 2023 14:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695652648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i3+LixSqqx+eUisQwtB8vxyT/PxtNa6xGTET70xDIx0=;
	b=a4wvC5BI70bJmoDokE6yOU9x6oXiJgJ/IMy+RGwgm47EIwefgyRs1qykE8bKicsrZoB+zN
	L2k0QIMltWN2j5t4l42ch7ymG74q7WdjpkKlpayVWqRRAjHlwht9ftoJEyPKEkcIN6qv/w
	RL7vmZK7GBHIH1LLZ8RTOymCt52da28/58kuEz1RkGUKkIpeYURQ+689LLffL4SpV/0VLS
	sbBAVqHADlNgZKjvVyJdbpjcg2UAoQWlddy9yaSL8yzfJbCVax+J3nofjkiCi95OH+sFfC
	x11TSDn+d4FYToZQNlBQiVRLfRaVrvhfwqDWTzyT3uYnzwz97Dq5qkodB4rDlQ==
Date: Mon, 25 Sep 2023 16:37:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, chengzhihao1 <chengzhihao1@huawei.com>, yi
 zhang <yi.zhang@huawei.com>, yangerkun <yangerkun@huawei.com>
Subject: Re: [RFC] mtd: Fix error code loss in mtdchar_read() function.
Message-ID: <20230925163727.7ecebe9a@xps-13>
In-Reply-To: <1131184426.81026.1695650583370.JavaMail.zimbra@nod.at>
References: <20230923005856.2538223-1-wangzhaolong1@huawei.com>
	<1131184426.81026.1695650583370.JavaMail.zimbra@nod.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_073739_951975_749094AC 
X-CRM114-Status: GOOD (  14.04  )
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

SGkgUmljaGFyZCwKCnJpY2hhcmRAbm9kLmF0IHdyb3RlIG9uIE1vbiwgMjUgU2VwIDIwMjMgMTY6
MDM6MDMgKzAyMDAgKENFU1QpOgoKPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4g
PiBWb246ICJaaGFvTG9uZyBXYW5nIiA8d2FuZ3poYW9sb25nMUBodWF3ZWkuY29tPgo+ID4gQW46
ICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sICJyaWNoYXJkIiA8
cmljaGFyZEBub2QuYXQ+LCAiVmlnbmVzaCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4K
PiA+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGlu
dXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4sICJjaGVuZ3poaWhhbzEi
Cj4gPiA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+LCAiWmhhb0xvbmcgV2FuZyIgPHdhbmd6aGFv
bG9uZzFAaHVhd2VpLmNvbT4sICJ5aSB6aGFuZyIgPHlpLnpoYW5nQGh1YXdlaS5jb20+LCAieWFu
Z2Vya3VuIgo+ID4gPHlhbmdlcmt1bkBodWF3ZWkuY29tPgo+ID4gR2VzZW5kZXQ6IFNhbXN0YWcs
IDIzLiBTZXB0ZW1iZXIgMjAyMyAwMjo1ODo1Ngo+ID4gQmV0cmVmZjogW1JGQ10gbXRkOiBGaXgg
ZXJyb3IgY29kZSBsb3NzIGluIG10ZGNoYXJfcmVhZCgpIGZ1bmN0aW9uLiAgCj4gCj4gPiBJbiB0
aGUgZmlyc3Qgd2hpbGUgbG9vcCwgaWYgdGhlIG10ZF9yZWFkKCkgZnVuY3Rpb24gcmV0dXJucyAt
RUJBRE1TRwo+ID4gYW5kICdyZXRsZW4nIHJldHVybnMgMCwgdGhlIGxvb3AgYnJlYWsgYW5kIHRo
ZSBmdW5jdGlvbiByZXR1cm5zIHZhbHVlCj4gPiAndG90YWxfcmV0bGVuJyBpcyAwLCBub3QgdGhl
IGVycm9yIGNvZGUuICAKPiAKPiBHaXZlbiB0aGlzIGEgc2Vjb25kIHRob3VnaHQuIEkgZG9uJ3Qg
dGhpbmsgYSBOQU5EIGRyaXZlciBpcyBhbGxvd2VkIHRvIHJldHVybgo+IGxlc3MgdGhhbiByZXF1
ZXN0cyBieXRlcyBhbmQgc2V0dGluZyBFQkFETVNHLgo+IFVCSSdzIElPIHBhdGggaGFzIGEgY29t
bWVudCBvbiB0aGF0Ogo+IAo+ICAgICAgICAgICAgICAgICAvKgo+ICAgICAgICAgICAgICAgICAg
KiBUaGUgZHJpdmVyIHNob3VsZCBuZXZlciByZXR1cm4gLUVCQURNU0cgaWYgaXQgZmFpbGVkIHRv
IHJlYWQKPiAgICAgICAgICAgICAgICAgICogYWxsIHRoZSByZXF1ZXN0ZWQgZGF0YS4gQnV0IHNv
bWUgYnVnZ3kgZHJpdmVycyBtaWdodCBkbwo+ICAgICAgICAgICAgICAgICAgKiB0aGlzLCBzbyB3
ZSBjaGFuZ2UgaXQgdG8gLUVJTy4KPiAgICAgICAgICAgICAgICAgICovCj4gICAgICAgICAgICAg
ICAgIGlmIChyZWFkICE9IGxlbiAmJiBtdGRfaXNfZWNjZXJyKGVycikpIHsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICB1YmlfYXNzZXJ0KDApOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGVy
ciA9IC1FSU87Cj4gICAgICAgICAgICAgICAgIH0KCkludGVyZXN0aW5nLiBTaGFsbCB3ZSBhZGQg
dGhpcyBjaGVjayB0byB0aGUgbXRkX3JlYWQoKSBwYXRoIGFzIHdlbGw/CgpNYXliZSB3aXRoIGEg
V0FSTl9PTigpPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
