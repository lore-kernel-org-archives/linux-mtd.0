Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,URIBL_RHS_DOB
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBCCC10F0E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:20:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B91D206B6
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:20:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V9HXfHXH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B91D206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Ncj4GNLNb4xwN+xJ1YcyAZHE9g5wwdO/HT3/GI7WiQ=; b=V9HXfHXHu0qgVG
	ClPtCkXvek4JwltCz/5xd8cmeHEFpzU5V95+RxmoUQRYacQJWxHtb1kNJqfHSpawm5mMYRloZ0Bly
	NvVMhsoc1YsRuWr7IFCWnVpQyL65PxRfhmrfqDXJ9+5vbvfC67+TJpJRhh7uoJTbfICPVVPyXrrLJ
	afEq5U4AaTB5O9JdEsyAfzQdeZ+CojPrmjgGG9jYP2Vz5GFuqPDSbEwJ4TbTD/OqZtLPtNC9Y8Cv7
	V/5/T7g/EhbFqYYyvE+YWuHM13qV+2U76VIrXMr7SXYq2BFsSZFBiRJVc2S7ePJG0ZQDHR9+ihS/h
	6CxLl3pGjYth1YkXGUmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH9lk-0000ZD-UG; Thu, 18 Apr 2019 16:20:12 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH9lg-0008H9-1q
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 16:20:10 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id F0805FF802;
 Thu, 18 Apr 2019 16:20:00 +0000 (UTC)
Date: Thu, 18 Apr 2019 18:19:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: Fix helper name in comment
Message-ID: <20190418181959.43a474e5@xps13>
In-Reply-To: <20190408092849.23478-1-miquel.raynal@bootlin.com>
References: <20190408092849.23478-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_092008_342857_5B79A901 
X-CRM114-Status: GOOD (  14.99  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZSBv
biBNb24sICA4IEFwciAyMDE5CjExOjI4OjQ5ICswMjAwOgoKPiBTaW5jZSB0aGUgbWlncmF0aW9u
IG9mIHRoZSBkcml2ZXIgdG8gc3RvcCB1c2luZyB0aGUgbGVnYWN5Cj4gLT5zZWxlY3RfY2hpcCgp
IGhvb2ssIHRoZSBtYXJ2ZWxsX25mY19zZWxlY3RfY2hpcCgpIGhlbHBlciBoYXMgYmVlbiAgCj4g
J3JlbmFtZWQnIHRvIG1hcnZlbGxfbmZjX3NlbGVjdF90YXJnZXQoKS4gVXBkYXRlIGEgbGVmdC1v
dmVyIHJlZmVyZW5jZQo+IHRvIHRoaXMgaGVscGVyIGluIGEgY29tbWVudCBpbiB0aGUgLT5yZXN1
bWUoKSBwYXRoLgo+IAo+IEZpeGVzOiBiMjUyNTE0MTRmNmUwMCAoIm10ZDogcmF3bmFuZDogbWFy
dmVsbDogU3RvcCBpbXBsZW1lbnRpbmcgLT5zZWxlY3RfY2hpcCgpIikKPiBTaWduZWQtb2ZmLWJ5
OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IC0tLQo+ICBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVs
bF9uYW5kLmMKPiBpbmRleCBkOTg0NTM4OTgwZTIuLjY3OTZjNzAxNWQ4NiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L21hcnZlbGxfbmFuZC5jCj4gQEAgLTI5ODksNyArMjk4OSw3IEBAIHN0YXRpYyBp
bnQgX19tYXliZV91bnVzZWQgbWFydmVsbF9uZmNfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikK
PiAgCj4gIAkvKgo+ICAJICogUmVzZXQgbmZjLT5zZWxlY3RlZF9jaGlwIHNvIHRoZSBuZXh0IGNv
bW1hbmQgd2lsbCBjYXVzZSB0aGUgdGltaW5nCj4gLQkgKiByZWdpc3RlcnMgdG8gYmUgcmVzdG9y
ZWQgaW4gbWFydmVsbF9uZmNfc2VsZWN0X2NoaXAoKS4KPiArCSAqIHJlZ2lzdGVycyB0byBiZSBy
ZXN0b3JlZCBpbiBtYXJ2ZWxsX25mY19zZWxlY3RfdGFyZ2V0KCkuCj4gIAkgKi8KPiAgCW5mYy0+
c2VsZWN0ZWRfY2hpcCA9IE5VTEw7Cj4gIAoKCkFwcGxpZWQgdG8gCmh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgCmJyYW5jaCBuYW5k
L25leHQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
