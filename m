Return-Path: <SRS0=kpjk=74=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EABFC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 07:22:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E3962068E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 07:22:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="duUnwdTd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E3962068E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QTVF+OavmvxUS/6L70+S1W+9Gn36Rzx0S+8O/dQilI0=; b=duUnwdTdzK1nsz
	tmGs5f2P6sc5QgCVGYVI0cK6kX5eQAQ5DgVbamW3xp3WJLrJplV1At/380auXSIc8qIG9RYV9Pqi3
	4hHXfXc/WVrFln1pThJH0pY2iuBnxBfF3ZmxM1Ce0jmAJsW84F86LvzAn1fWzSJ95jzNdDXCaHeiH
	4szImrOj/SNiV9UbrRBbtohn1oaRfNRi7mp7w8aKxSbxKUoGdzTAMpgOkyPQN94D/FIc/ao4ghN2u
	iXlXE5UG18vm8F8GkBLDgeaC4vEeouaqwELBdR7ygzVttiTz7pWnc8Fo5ZtKdL/ZnA7RZ1fYGmzG7
	hhvVRBoNFwDbQm7czOTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkjRq-0003yc-Ot; Mon, 15 Jun 2020 07:22:26 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkjRo-0003y0-7M
 for linux-mtd@lists.infradead.org; Mon, 15 Jun 2020 07:22:25 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 49AE41C000B;
 Mon, 15 Jun 2020 07:22:22 +0000 (UTC)
Date: Mon, 15 Jun 2020 09:22:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [Patch] mtd: set master partition panic write flag
Message-ID: <20200615092221.7f269810@xps13>
In-Reply-To: <CB182F6C-EB9E-4E90-BF6E-115C925FCFFE@gmail.com>
References: <20200504235403.13504-1-kdasu.kdev@gmail.com>
 <CB182F6C-EB9E-4E90-BF6E-115C925FCFFE@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_002224_398968_820AE20D 
X-CRM114-Status: GOOD (  15.16  )
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
Cc: Richard Weinberger <richard@nod.at>, bcm-kernel-feedback-list@broadcom.com,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS2FtYWwsCgpLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4gd3JvdGUgb24gU2F0
LCAxMyBKdW4gMjAyMCAwMjo0OTozMQotMDQwMDoKCj4gQ2FuIHlvdSBwbGVhc2UgYWNjZXB0IHRo
aXMgaWYgdGhlcmUgYXJlIG5vIG9iamVjdGlvbnMuCj4gCj4gS2FtYWwKPiAKPiA+IE9uIE1heSA0
LCAyMDIwLCBhdCA3OjU0IFBNLCBLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPiAKPiA+IO+7v0NoZWNrIGFuZCBzZXQgbWFzdGVyIHBhbmljIHdyaXRlIGZsYWcgc28g
dGhhdCBsb3cgbGV2ZWwgZHJpdmVycwo+ID4gY2FuIHVzZSBpdCB0byB0YWtlIHJlcXVpcmVkIGFj
dGlvbiB0byBlbnN1cmUgb29wcyBkYXRhIGdldHMgd3JpdHRlbgo+ID4gdG8gYXNzaWduZWQgbXRk
b29wcyBkZXZpY2UgcGFydGl0aW9uLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBLYW1hbCBEYXN1
IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gZHJpdmVycy9tdGQvbXRkY29yZS5j
IHwgNCArKy0tCj4gPiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIvZHJpdmVy
cy9tdGQvbXRkY29yZS5jCj4gPiBpbmRleCAyOTE2Njc0MjA4YjMuLjdlMzdlZDJmMzhlYSAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQv
bXRkY29yZS5jCj4gPiBAQCAtMTIzNSw4ICsxMjM1LDggQEAgaW50IG10ZF9wYW5pY193cml0ZShz
dHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IHRvLCBzaXplX3QgbGVuLCBzaXplX3QgKnJldGxl
biwKPiA+ICAgICAgICByZXR1cm4gLUVST0ZTOwo+ID4gICAgaWYgKCFsZW4pCj4gPiAgICAgICAg
cmV0dXJuIDA7Cj4gPiAtICAgIGlmICghbXRkLT5vb3BzX3BhbmljX3dyaXRlKQo+ID4gLSAgICAg
ICAgbXRkLT5vb3BzX3BhbmljX3dyaXRlID0gdHJ1ZTsKPiA+ICsgICAgaWYgKCFtYXN0ZXItPm9v
cHNfcGFuaWNfd3JpdGUpCj4gPiArICAgICAgICBtYXN0ZXItPm9vcHNfcGFuaWNfd3JpdGUgPSB0
cnVlOwo+ID4gCj4gPiAgICByZXR1cm4gbWFzdGVyLT5fcGFuaWNfd3JpdGUobWFzdGVyLCBtdGRf
Z2V0X21hc3Rlcl9vZnMobXRkLCB0byksIGxlbiwKPiA+ICAgICAgICAgICAgICAgICAgICByZXRs
ZW4sIGJ1Zik7Cj4gPiAtLSAKPiA+IDIuMTcuMQo+ID4gICAKCkkgdGhpbmcgd2UgbWlzc2VkIGl0
LiBIb3dldmVyLCBzaG91bGRuJ3Qgd2UgaGF2ZSBhIENjOi9GaXhlczogcGFpciBvZgp0YWdzIGhl
cmU/IFdlIGNvdWxkIHNlbmQgaXQgYXMgcGFydCBvZiBhIGZpeGVzIFBSIHRoZW4uCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
