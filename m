Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F77AC6FD1D
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Mar 2023 11:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WHwDMs0v7kjIZK92TjnuZ7yDvUJK0x6zLRkLJ/QChxU=; b=UG1IGLz/mUA5yg
	tbYzzRqCkt/b5ie0TM/C492gtX1EEqLeZa8bgJlPsS6HQ088B+9/L3sepRHOCsiMlQ0pzTQaG/8MN
	cTuwmj0kgd3MG58yAd5oyT5YY/GuW1phb4O9qDq1BEieTK0t1Ih++U0QmAcnGFD6GKGsodZC62vG3
	ecNVn4DMNXlYAedHHc401l2Z97p/bW11pfsmsSZKgDNfJDphMeJ9qG8OxQxeao+F1GW04/RWgDlUJ
	Dv2PalW47r157lWZ/w4qV12EZwia9U2Ek3HYi2NqEE82Ia0HTfpJcKT7M8m/a8qo0XdWVI/Sobg/4
	rl2rKzXztfjloC+HJZeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDbw-008oOm-2I;
	Mon, 20 Mar 2023 11:23:32 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDbs-008oMP-1c
	for linux-mtd@lists.infradead.org;
	Mon, 20 Mar 2023 11:23:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7103EC0007;
	Mon, 20 Mar 2023 11:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679311404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3GxUwPveHsZvyMwDwLLZk2hdUyMktBZGU7FJ/Soqmh0=;
	b=gGi4dCUZcFrDP/zHzeFmqnWISoMSjSeL9ba+XGPDiNclb37e3kM2xqKdtVhsYYxLcEqhjw
	VlF3oVUqVYGd5oCt3VAadvLkWFj5Qlds2UO8VLJrpOfavj/4LbSgcS5+smStptzT6Jv+H/
	HPkM0WBH64kRGKD7uInjpnFjREiXcCjC7ICOJb/z1Xf5hBJ4krv7KcsoGo+glgjfSjnc0g
	knabPVcJY/3EUmtpLhvjkpxrd40ijaeepMOwZW8vSZVajHkRz5PlMbEV8yjnXwn0RUmsCs
	6Dn1ujYSNzfcTH96BHdHz4MiBU6XIwm7az86xtvQNtKKo1GUfBDfU8B42nuYDA==
Date: Mon, 20 Mar 2023 12:23:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: Avoid printing error messages on probe
 deferrals
Message-ID: <20230320122321.052d58bf@xps-13>
In-Reply-To: <b12a0baf-b7a0-80a2-fe78-08b3b227e0c5@gmail.com>
References: <20230307192506.439532-1-miquel.raynal@bootlin.com>
	<b12a0baf-b7a0-80a2-fe78-08b3b227e0c5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_042328_852991_52A220A7 
X-CRM114-Status: GOOD (  20.80  )
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBNb24sIDIwIE1hciAyMDIzIDEy
OjE3OjEyICswMTAwOgoKPiBPbiA3LjAzLjIwMjMgMjA6MjUsIE1pcXVlbCBSYXluYWwgd3JvdGU6
Cj4gPiBUaGVyZSBpcyBubyByZWFzb24gdG8gY29tcGxhaW4gYWJvdXQgcHJvYmUgZXJyb3JzIGlu
IGNhc2Ugb2YgZGVmZXJyYWxzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHYyOgo+
ID4gKiBVc2Ugb2YgZGV2X2Vycl9wcm9iZSgpLgo+ID4gCj4gPiAgIGRyaXZlcnMvbXRkL210ZGNv
cmUuYyB8IDkgKysrKy0tLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRjb3Jl
LmMgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiA+IGluZGV4IDBmZWFjYjlmYmRhYy4uZTRlMTAy
NTg1MDIxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gPiArKysgYi9k
cml2ZXJzL210ZC9tdGRjb3JlLmMKPiA+IEBAIC01MzYsMTIgKzUzNiwxMSBAQCBzdGF0aWMgaW50
IG10ZF9udm1lbV9hZGQoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gPiAgIAltdGQtPm52bWVtID0g
bnZtZW1fcmVnaXN0ZXIoJmNvbmZpZyk7Cj4gPiAgIAlpZiAoSVNfRVJSKG10ZC0+bnZtZW0pKSB7
Cj4gPiAgIAkJLyogSnVzdCBpZ25vcmUgaWYgdGhlcmUgaXMgbm8gTlZNRU0gc3VwcG9ydCBpbiB0
aGUga2VybmVsICovCj4gPiAtCQlpZiAoUFRSX0VSUihtdGQtPm52bWVtKSA9PSAtRU9QTk9UU1VQ
UCkgewo+ID4gKwkJaWYgKFBUUl9FUlIobXRkLT5udm1lbSkgPT0gLUVPUE5PVFNVUFApCj4gPiAg
IAkJCW10ZC0+bnZtZW0gPSBOVUxMOwo+ID4gLQkJfSBlbHNlIHsKPiA+IC0JCQlkZXZfZXJyKCZt
dGQtPmRldiwgIkZhaWxlZCB0byByZWdpc3RlciBOVk1FTSBkZXZpY2VcbiIpOwo+ID4gLQkJCXJl
dHVybiBQVFJfRVJSKG10ZC0+bnZtZW0pOwo+ID4gLQkJfQo+ID4gKwkJZWxzZQo+ID4gKwkJCXJl
dHVybiBkZXZfZXJyX3Byb2JlKCZtdGQtPmRldiwJUFRSX0VSUihtdGQtPm52bWVtKSwKPiA+ICsJ
CQkJCSAgICAgIkZhaWxlZCB0byByZWdpc3RlciBOVk1FTSBkZXZpY2VcbiIpOyAgCj4gCj4gRXZl
biBvbmUgbW9yZSBpbXByb3ZlbWVudCByZXF1ZXN0IHBvc3NpYmlsaXR5IGFuZCByZXF1ZXN0IGZy
b20gbWU6Cj4gIkZhaWxlZCB0byByZWdpc3RlciBOVk1FTSBkZXZpY2U6ICVkXG4iCgpJIGdldCB0
aGUgcmVxdWVzdCwgYnV0IGFzIEkgd2FzIHNheWluZyBpbiB0aGUgb3RoZXIgdGhyZWFkLCBpc24n
dCB0aGlzCmFscmVhZHkgaGFuZGxlZD8KCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9iYXNlL2NvcmUuYyNMNDk2MQoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
