Return-Path: <SRS0=zkQe=CJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC4FC433E2
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2020 13:15:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F982064B
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2020 13:15:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rRI88QKH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98F982064B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rB1ZOpZo+VckVFCgdEUArDb7nSjKoQ+xxUmbFwunQiY=; b=rRI88QKHdcOwePt07l3H2Xvys
	3mLFlwhhd8qvHgSZ8PA/9epbf23ac2zpxG3hw212kOWxPZtz/4iXEKvRIYlafsbKP0l/5oD6D5F86
	qforbVyiY8AdAg9mF+rNOmRvNSX6Vg6YL6RB9Rj0vUe9wsB82WxIl9W3c0yXOlJe0PTeBNBUlZy6J
	NL9USGEkWoXlNQxOGgIg30Z+1oU1rnUuTtjjwoNAep8iYT+JR/tBR5v8OZUGkK6WpvjzrqUll4EMj
	GJc6I8AtwOBjpl7FHsQQCZKcj0ZlXirZxfpQ5VY6VhOWeHGvcsAC2QbuDFLLiv9rhU9mYdlaXzSnw
	uNMR0Ot3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCjdn-0000L1-FI; Mon, 31 Aug 2020 13:14:31 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCiUM-0002Jq-Ms
 for linux-mtd@lists.infradead.org; Mon, 31 Aug 2020 12:00:43 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 879F3240011;
 Mon, 31 Aug 2020 12:00:33 +0000 (UTC)
Date: Mon, 31 Aug 2020 14:00:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Bond <jameslouisebond@gmail.com>
Subject: Re: [PATCH] mtd: ck804xrom: fix missing pci device put in error paths
Message-ID: <20200831140032.0fd355f6@xps13>
In-Reply-To: <CAPKyc-si2e2-9RDgLBO4Ox0wX5fr+NjSM_Noih_Pay+trNzndQ@mail.gmail.com>
References: <20200821070537.30317-1-jameslouisebond@gmail.com>
 <20200827144600.2ec7c4ab@xps13>
 <CAPKyc-si2e2-9RDgLBO4Ox0wX5fr+NjSM_Noih_Pay+trNzndQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_080042_868531_D54021AA 
X-CRM114-Status: GOOD (  11.86  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Ryan Jackson <rjackson@lnxi.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSmFtZXMsCgpKYW1lcyBCb25kIDxqYW1lc2xvdWlzZWJvbmRAZ21haWwuY29tPiB3cm90ZSBv
biBGcmksIDI4IEF1ZyAyMDIwCjIxOjI4OjQwIC0wNTAwOgoKPiBIaSBNaXF1w6hsLAo+IFRoYW5r
cyBmb3IgeW91ciBmZWVkYmFjay4KPiBJIGhhdmUganVzdCByZWNoZWNrZWQgdGhpcyBmdW5jdGlv
biBhbmQgZmluZCB0aGF0ICJwZGV2IiBjdXJyZW50bHkgaXMKPiBhbHJlYWR5IHB1dAo+IGluc2lk
ZSBjazgwNHhyb21fY2xlYW51cCwgc28gbXkgcHJldmlvdXMgcGF0Y2ggaXMgbWVhbmluZ2xlc3Mu
Li4KPiBUaGUgY3VycmVudCBjYWxsaW5nIG9yZGVyIGlzIGxpa2U6Cj4gCj4gd2luZG93LT5wZGV2
ID0gcGNpX2Rldl9nZXQocGRldik7Cj4gLi4uCj4gICAgIGNrODA0eHJvbV9jbGVhbnVwKHdpbmRv
dykKPiAgICAgICAgICAgICAgLT4gIAo+ICAgICAgICAgICAgICAgICAgIHBjaV9kZXZfcHV0KHdp
bmRvdy0+cGRldik7Cj4gQW5kIHNvcnJ5IGZvciBib3RoZXJpbmcgeW91LgoKT2sgdGhhdCdzIGZp
bmUsIHRoYW5rcyBhbnl3YXkhCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
