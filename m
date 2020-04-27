Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8493C4CECD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:35:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C13D9205C9
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:35:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HzVrJsMs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C13D9205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0GalzX8crJpYV9CrkL2fB7j8CSiGq7Gf2Y0uUGrbSIQ=; b=HzVrJsMs85vhUE
	wnECI7qr8YVbUgkbSrOHHFuqivRx9/nTMzafR3q6m+LXBBfYTrbAxpfhCfNWTOECJ21CuiJpBVSSO
	/lzUS0BFPejcgGjSkRwlsEm19j+CQaeMCM10axQlRGW7BuFiCMt0mZgJ5FRwN44tzgBtkT/BzXk/6
	4vNgNNVyhPq6UBGbCjoSBhYmka6dZ75PrIWlizocb9RFNyYmTA0bouDsE/yJyZARPkBlgwKolaLO6
	TGHzuUNls5whevRViTBC12gOvUlZis/+YNf8PR0PFFLVVWRop/C2sLl1oDL2aQVMXra5oWJOStB/V
	l9U3ruGVWqJh1es/d1uQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT9XO-0007EX-Ha; Mon, 27 Apr 2020 19:35:30 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT9XL-0007Da-7m
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 19:35:28 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id C8A44240002;
 Mon, 27 Apr 2020 19:35:21 +0000 (UTC)
Date: Mon, 27 Apr 2020 21:35:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 04/17] mtd: rawnand: cafe: Include linux/io.h instead of
 asm/io.h
Message-ID: <20200427213520.4590b116@xps13>
In-Reply-To: <20200427082028.394719-5-boris.brezillon@collabora.com>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
 <20200427082028.394719-5-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_123527_417166_08AEF6A4 
X-CRM114-Status: GOOD (  10.75  )
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
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBNb24sIDI3IEFwcgoyMDIwIDEwOjIwOjE0ICswMjAwOgoKPiBEcml2ZXJzIHNo
b3VsZCBpbmNsdWRlIHRoZSBhc20gaGVhZGVycyBkaXJlY3RseS4KCiAgICAgICAgICAgICAgICBu
b3QgPwoKPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBj
b2xsYWJvcmEuY29tPgoKV2l0aCB0aGlzIGNoYW5nZWQsCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvbXRkL25h
bmQvcmF3L2NhZmVfbmFuZC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
Y2FmZV9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZlX25hbmQuYwo+IGluZGV4IDQ3
YWFjZmFiOGVjYi4uMTU2YTMwOGI1MzBiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2NhZmVfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FmZV9uYW5kLmMK
PiBAQCAtMjMsNyArMjMsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KPiAg
I2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+IC0j
aW5jbHVkZSA8YXNtL2lvLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9pby5oPgo+ICAKPiAgI2RlZmlu
ZSBDQUZFX05BTkRfQ1RSTDEJCTB4MDAKPiAgI2RlZmluZSBDQUZFX05BTkRfQ1RSTDIJCTB4MDQK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
