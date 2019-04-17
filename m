Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1155DC10F12
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:05:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4D242177B
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:05:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HRUrKAy8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4D242177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1TTey8NXlpoGfj8nQ+Kb9F7lY8LlzphgoOK34quHOaY=; b=HRUrKAy8I4sRRD
	2Unvnu5XvxLVPZHyV3k40IHlb+leLfV0m3+JJiLJe8ma5Fbe2bbSXagXWtTMIY84bK4atZPLXVp+t
	+17O4G5T1coA7IB43vsW/+T90M4w/3OvE0m8rfXUtz9QUO+hlKWB9Cp6ZuYS/aXuBzcRow6OrmJnn
	ehRsF2LIt84Fuhs2y/HBVx1tM8u94s2fZzZmtIAtSTwhsP/FkIQo5X4uhLheOexOA+KqXvpWCY2te
	m0RjRvsUlU8QJwOYA1aIop7cZ319e9yFM6s+VNaI4Tsdh95TlgpZzywBvfAMzJVdUVtOCc9e6gqfs
	hf3LXa14ClsUqbHX4pIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGhRn-0001Wf-HN; Wed, 17 Apr 2019 10:05:43 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhRk-0001V8-43
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 10:05:41 +0000
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8745020000D;
 Wed, 17 Apr 2019 10:05:27 +0000 (UTC)
Date: Wed, 17 Apr 2019 12:05:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v4 4/7] mtd: nand: Make flags for bad block marker
 position more granular
Message-ID: <20190417120526.1fd9130c@xps13>
In-Reply-To: <20190218104122.18788-5-frieder.schrempf@kontron.de>
References: <20190218104122.18788-1-frieder.schrempf@kontron.de>
 <20190218104122.18788-5-frieder.schrempf@kontron.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_030540_313095_5D5529E1 
X-CRM114-Status: GOOD (  10.12  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRnJpZWRlciwKClNjaHJlbXBmIEZyaWVkZXIgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5k
ZT4gd3JvdGUgb24gTW9uLCAxOCBGZWIKMjAxOSAxMDo0Mjo0NSArMDAwMDoKCj4gRnJvbTogRnJp
ZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPgo+IAo+IFRvIGJlIGFi
bGUgdG8gY2hlY2sgYW5kIHNldCBiYWQgYmxvY2sgbWFya2VycyBpbiB0aGUgZmlyc3QgYW5kCj4g
c2Vjb25kIHBhZ2Ugb2YgYSBibG9jayBpbmRlcGVuZGVudGx5IG9mIGVhY2ggb3RoZXIsIHdlIGNy
ZWF0ZQo+IHNlcGFyYXRlIGZsYWdzIGZvciBib3RoIGNhc2VzLgo+IAo+IFByZXZpb3VzbHkgTkFO
RF9CQk1fU0VDT05EUEFHRSBtZWFudCwgdGhhdCBib3RoLCB0aGUgZmlyc3QgYW5kIHRoZQo+IHNl
Y29uZCBwYWdlIHdlcmUgdXNlZC4gV2l0aCB0aGlzIHBhdGNoIE5BTkRfQkJNX0ZJUlNUUEFHRSBz
dGFuZHMgZm9yCj4gdXNpbmcgdGhlIGZpcnN0IHBhZ2UgYW5kIE5BTkRfQkJNX1NFQ09ORFBBR0Ug
Zm9yIHVzaW5nIHRoZSBzZWNvbmQKPiBwYWdlLgo+IAo+IFRoaXMgcGF0Y2ggaXMgb25seSBmb3Ig
cHJlcGFyYXRpb24gb2Ygc3Vic2VxdWVudCBjaGFuZ2VzIGFuZCBkb2VzCj4gbm90IGltcGxlbWVu
dCB0aGUgbG9naWMgdG8gYWN0dWFsbHkgaGFuZGxlIGJvdGggZmxhZ3Mgc2VwYXJhdGVseS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBGcmllZGVyIFNjaHJlbXBmIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRy
b24uZGU+Cj4gUmV2aWV3ZWQtYnk6IEJvcmlzIEJyZXppbGxvbiA8YmJyZXppbGxvbkBrZXJuZWwu
b3JnPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
