Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C3AC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 08:55:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B727206DD
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 08:55:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TCzXiXaQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B727206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MpnPmSDqzCKIquysA8eGEr0Ag5wcVtvxe227NYScY4k=; b=TCzXiXaQ099kHb
	ZR4xubDu9BfLjQNQarBtCz7YnpLHwA00llrlNw12j1GuN3U7oi+Tj/QQaOVeYC6my5Aoxw1FTSvkh
	WYFevGMUIXqtYy0o3IQPKAqmRK4chAS7P+iVAoaqprDom/3H7OMsZOe4u5vgNNhHBQbNV2XNXBfkL
	Q9Uw6f20x+JpkkE4+8o9NSPNwVCVVYyImEE7qVCjeDb+7+LuX5JkEjpyV1PDm06tqMtHoNzwtPMgq
	V3ZcYwqg1Z5uOEpyHx1DzKEN4SI0Qep4M7ZRGyr2qHLstIoiHuKaAocyKxPL0XdLSvAYJ52dTsoOW
	LHpjrbMUFDGtaECz3O1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd8t3-0002ug-P1; Mon, 25 May 2020 08:55:09 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd8t0-0001xx-MS
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 08:55:08 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 14B3B200018;
 Mon, 25 May 2020 08:55:03 +0000 (UTC)
Date: Mon, 25 May 2020 10:55:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 00/17] Clean nandsim error path
Message-ID: <20200525105502.287ecac5@xps13>
In-Reply-To: <20200525085329.17259-1-miquel.raynal@bootlin.com>
References: <20200525085329.17259-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_015506_878215_E70DEB31 
X-CRM114-Status: GOOD (  13.58  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlIG9uIE1vbiwg
MjUgTWF5IDIwMjAKMTA6NTI6MTAgKzAyMDA6Cgo+IEhlbGxvLAo+IAo+IEFzIHBhcnQgb2YgYSBi
aWdnZXIgY2xlYW51cCBJIHJlYWxpemVkIHRoZSBlcnJvciBwYXRoIG9mIG5hbmRzaW0uYyB3YXMK
PiBob3JyaWJseSB3cm9uZy4gVGhlcmUgYXJlIGEgZmV3IGFkZGl0aW9uYWwgY2hhbmdlcywgbGlr
ZSBoYXZpbmcgYQo+IGNvbnNpc3RlbnQgbmFtaW5nIGZvciBhIGdpdmVuIG9iamVjdCwgYnV0IG1v
cmVvdmVyIHRoaXMgaXMgYW4gZXJyb3IKPiBwYXRoIGNsZWFudXAsIGRyaXZlci13aWRlLgoKV3Jv
bmcgb3BlcmF0aW9uIG9uIG15IHNpZGUsIEkgd2FzIGFib3V0IHRvIHNlbmQgOTAgcGF0Y2hlcyBz
byBJCmNhbmNlbGVkIHRoZSBvcGVyYXRpb24uCgpJIHdpbGwgcmVzZW5kLCBzb3JyeSBmb3IgdGhl
IG5vaXNlLgoKPiAKPiBDaGVlcnMsCj4gTWlxdcOobAo+IAo+IENoYW5nZXMgaW4gdjI6Cj4gKiBS
ZW9yZGVyZWQgdGhlIGtmcmVlKCkgYW5kIHRoZSBsaXN0X2RlbCgpIHRvIGF2b2lkIGEgdXNlIGFm
dGVyIGZyZWUKPiAgIGlzc3VlIHRoYXQgSSBpbnRyb2R1Y2VkIGluIHYxLgo+ICogVXNlZCBkZWJ1
Z2ZzX3JlbW92ZV9yZWN1cnNpdmUoKSBpbnN0ZWFkIG9mIGp1c3QgZGVidWdmc19yZW1vdmUoKS4K
PiAKPiBNaXF1ZWwgUmF5bmFsICgxNyk6Cj4gICBtdGQ6IHJhd25hbmQ6IG5hbmRzaW06IENvbnNp
c3RlbnQgdXNlIG9mICducycgaW5zdGVhZCBvZiAnZGV2Jwo+ICAgbXRkOiByYXduYW5kOiBuYW5k
c2ltOiBVc2Ugb2N0YWwgcGVybWlzc2lvbnMKPiAgIG10ZDogcmF3bmFuZDogbmFuZHNpbTogVXNl
IGEgY29uc2lzdGVudCBuc18gcHJlZml4IGZvciBhbGwgZnVuY3Rpb25zCj4gICBtdGQ6IHJhd25h
bmQ6IG5hbmRzaW06IENsZWFuIGVycm9yIGhhbmRsaW5nCj4gICBtdGQ6IHJhd25hbmQ6IG5hbmRz
aW06IEtlZXAgdHJhY2sgb2YgdGhlIGNyZWF0ZWQgZGVidWdmcyBlbnRyaWVzCj4gICBtdGQ6IHJh
d25hbmQ6IG5hbmRzaW06IFJlbW92ZSBkZWJ1Z2ZzIGVudHJpZXMgYXQgdW5sb2FkIHRpbWUKPiAg
IG10ZDogcmF3bmFuZDogbmFuZHNpbTogRml4IHRoZSB0d28gbnNfYWxsb2NfZGV2aWNlKCkgZXJy
b3IgcGF0aHMKPiAgIG10ZDogcmF3bmFuZDogbmFuZHNpbTogRnJlZSBwYXJ0aXRpb24gbmFtZXMg
b24gZXJyb3IgaW4gbnNfaW5pdCgpCj4gICBtdGQ6IHJhd25hbmQ6IG5hbmRzaW06IEZyZWUgdGhl
IGFsbG9jYXRlZCBkZXZpY2Ugb24gZXJyb3IgaW4gbnNfaW5pdCgpCj4gICBtdGQ6IHJhd25hbmQ6
IG5hbmRzaW06IEZyZWUgdGhlIHBhcnRpdGlvbiBuYW1lcyBpbiBuc19mcmVlKCkKPiAgIG10ZDog
cmF3bmFuZDogbmFuZHNpbTogU3RvcCB1c2luZyBuYW5kX3JlbGVhc2UoKQo+ICAgbXRkOiByYXdu
YW5kOiBuYW5kc2ltOiBVc2UgYW4gYWRkaXRpb25hbCBsYWJlbCB3aGVuIGZyZWVpbmcgdGhlCj4g
ICAgIG5hbmRzaW0gb2JqZWN0Cj4gICBtdGQ6IHJhd25hbmQ6IG5hbmRzaW06IEZyZWUgZXJhc2Vf
YmxvY2tfd2VhciBvbiBlcnJvcgo+ICAgbXRkOiByYXduYW5kOiBuYW5kc2ltOiBGaXggdGhlIGxh
YmVsIHBvaW50aW5nIG9uIG5hbmRfY2xlYW51cCgpCj4gICBtdGQ6IHJhd25hbmQ6IG5hbmRzaW06
IE1hbmFnZSBsaXN0cyBvbiBlcnJvciBpbiBuc19pbml0X21vZHVsZSgpCj4gICBtdGQ6IHJhd25h
bmQ6IG5hbmRzaW06IFJlbmFtZSBhIGxhYmVsIGluIG5zX2luaXRfbW9kdWxlKCkKPiAgIG10ZDog
cmF3bmFuZDogbmFuZHNpbTogUmVvcmdhbml6ZSBuc19jbGVhbnVwX21vZHVsZSgpCj4gCj4gIGRy
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRzaW0uYyB8IDQzNyArKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI1MyBpbnNlcnRpb25zKCspLCAxODQgZGVs
ZXRpb25zKC0pCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
