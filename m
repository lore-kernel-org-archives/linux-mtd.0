Return-Path: <SRS0=9XVy=T3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60EDC04AB3
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2019 12:20:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9913C2075C
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2019 12:20:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WqdaAtZ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9913C2075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7vUvx93x3WXFLMg52hJEW+iZa/Qfc1GF/dmE3VJ+LY=; b=WqdaAtZ7Jb0ZAL
	1gMezLZOvnDt2TcsPWvB5q/EpYr9Jk9giQCtZuXP5iZGxFhvOiH4CQyHA4OYMroE6shbwTVwmetPH
	fwDvH+GevA2jVgTGX6UWwotsD3VHsVd2ne989WRqQQlG4IJGIKgNAA4CWJVcz8nE2uyObFlSUHg3w
	O1bHKy9zAfS53pfDtoAQHPL1Yfo9avJZwOuuacmIxUktcOtas65trJI55dg8trpEvmMmVNawfn8BZ
	8L+RNbxf7D+kJbLl4FYQj3F8xHqGdi6sPwNtMPO9M8B/KLXbAbd6JhV5lPyJGaoHMsS4KvRN41t8R
	69jUbEGsoqCGtstWKTSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVEbz-0001ub-7d; Mon, 27 May 2019 12:20:19 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVEbw-0001qR-1i
 for linux-mtd@lists.infradead.org; Mon, 27 May 2019 12:20:17 +0000
X-Originating-IP: 90.88.147.134
Received: from xps13 (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr
 [90.88.147.134]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 7979BC0011;
 Mon, 27 May 2019 12:20:01 +0000 (UTC)
Date: Mon, 27 May 2019 14:20:00 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Weitao Hou <houweitaoo@gmail.com>
Subject: Re: [PATCH] mtd: remove unused value for mtdoops
Message-ID: <20190527141939.57c93fb7@xps13>
In-Reply-To: <20190527121440.19271-1-houweitaoo@gmail.com>
References: <20190527121440.19271-1-houweitaoo@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_052016_236778_34398572 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgV2VpdGFvLAoKV2VpdGFvIEhvdSA8aG91d2VpdGFvb0BnbWFpbC5jb20+IHdyb3RlIG9uIE1v
biwgMjcgTWF5IDIwMTkgMjA6MTQ6NDAKKzA4MDA6Cgo+IHNpbmNlIGhkciB3YXMgbmV2ZXIgdXNl
ZCwgd2UgbmVlZCBub3QgcmVzZXJ2ZSBhbmQgaW5pdCBpdAoKV2hhdCBhYm91dCAiTVREIG9vcHMg
J2hkcicgaGVhZGVyIGlzIG5ldmVyIHVzZWQsIGRyb3AgaXRzCmluaXRpYWxpemF0aW9uLiIKCk1h
eWJlIGEgRml4ZXMgdGFnIHdvdWxkIGJlIGFwcHJvcHJpYXRlLgoKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBXZWl0YW8gSG91IDxob3V3ZWl0YW9vQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQv
bXRkb29wcy5jIHwgNiAtLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZG9vcHMuYyBiL2RyaXZlcnMvbXRkL210ZG9v
cHMuYwo+IGluZGV4IGUwNzhmYzQxYWE2MS4uNmFlNGI3MGViZGJiIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbXRkL210ZG9vcHMuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210ZG9vcHMuYwo+IEBAIC0x
OTEsMTQgKzE5MSw4IEBAIHN0YXRpYyB2b2lkIG10ZG9vcHNfd3JpdGUoc3RydWN0IG10ZG9vcHNf
Y29udGV4dCAqY3h0LCBpbnQgcGFuaWMpCj4gIHsKPiAgCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0g
Y3h0LT5tdGQ7Cj4gIAlzaXplX3QgcmV0bGVuOwo+IC0JdTMyICpoZHI7Cj4gIAlpbnQgcmV0Owo+
ICAKPiAtCS8qIEFkZCBtdGRvb3BzIGhlYWRlciB0byB0aGUgYnVmZmVyICovCj4gLQloZHIgPSBj
eHQtPm9vcHNfYnVmOwo+IC0JaGRyWzBdID0gY3h0LT5uZXh0Y291bnQ7Cj4gLQloZHJbMV0gPSBN
VERPT1BTX0tFUk5NU0dfTUFHSUM7Cj4gLQo+ICAJaWYgKHBhbmljKSB7Cj4gIAkJcmV0ID0gbXRk
X3BhbmljX3dyaXRlKG10ZCwgY3h0LT5uZXh0cGFnZSAqIHJlY29yZF9zaXplLAo+ICAJCQkJICAg
ICAgcmVjb3JkX3NpemUsICZyZXRsZW4sIGN4dC0+b29wc19idWYpOwoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
