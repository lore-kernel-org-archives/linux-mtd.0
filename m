Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE0DC282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 15:55:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D6762075D
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 15:55:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iBTLiMb/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D6762075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQ0Z5IsqhBqNB38ulDp65orrpvlc04bi1mdGbOsZYNY=; b=iBTLiMb/vzryil
	3aMkTjZlwMcgh34wK3ZWRVyRVZoeri4Ex8wQwr1tMyHhEowKmxL2gk20jEOeeK16tP/hUCyq6cklf
	QfMsYdjinwKeZ89NmLrcKH02SNzyThnlEbF2wFwu95/dFcdxg71Dr2bjh3CcfQOLrI+gfA6OzgWa9
	LKB+zO+6Z1l102aAfCSGQyFtBNHUEDsEj1saxrHoFc7B5Luj0IeWhpBuZbOMhWxRQsJEPU29coCML
	Zhs//l9uGtpg29mm4c1fUJIB0P+wnHf5VAbtHmibNbCMgJ6QLofmRbKTXnavxpBDWGGO+fSplKDkP
	HajArEifbISLEcKEcmKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr349-0004zy-48; Tue, 05 Feb 2019 15:55:17 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr344-0004zf-LR
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 15:55:15 +0000
Received: from xps13 (aaubervilliers-681-1-80-177.w90-88.abo.wanadoo.fr
 [90.88.22.177]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 634AA200014;
 Tue,  5 Feb 2019 15:55:04 +0000 (UTC)
Date: Tue, 5 Feb 2019 16:55:02 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wen Yang <yellowriver2010@hotmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: jz4780: fix possible object reference
 leak
Message-ID: <20190205165502.2b8be890@xps13>
In-Reply-To: <HK0PR02MB3634AB4C3584FD37B3335075B26E0@HK0PR02MB3634.apcprd02.prod.outlook.com>
References: <HK0PR02MB3634AB4C3584FD37B3335075B26E0@HK0PR02MB3634.apcprd02.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_075512_856890_A48C92F7 
X-CRM114-Status: GOOD (  17.58  )
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
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "harveyhuntnexus@gmail.com" <harveyhuntnexus@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgV2VuLAoKV2VuIFlhbmcgPHllbGxvd3JpdmVyMjAxMEBob3RtYWlsLmNvbT4gd3JvdGUgb24g
VHVlLCA1IEZlYiAyMDE5CjE1OjA3OjIxICswMDAwOgoKPiBvZl9maW5kX2RldmljZV9ieV9ub2Rl
KCkgdGFrZXMgYSByZWZlcmVuY2UgdG8gdGhlIHN0cnVjdCBkZXZpY2UKPiB3aGVuIGl0IGZpbmRz
IGEgbWF0Y2ggdmlhIGdldF9kZXZpY2UsIHRoZXJlIGlzIG5vIG5lZWQgdG8gY2FsbAo+IGdldF9k
ZXZpY2UoKSB0d2ljZS4KPiBXZSBhbHNvIHNob3VsZCBtYWtlIHN1cmUgdG8gZHJvcCB0aGUgcmVm
ZXJlbmNlIHRvIHRoZSBkZXZpY2UKPiB0YWtlbiBieSBvZl9maW5kX2RldmljZV9ieV9ub2RlKCkg
b24gZHJpdmVyIHVuYmluZC4KPiAKPiBGaXhlczogYWUwMmFiMDBhYTNjICgibXRkOiBuYW5kOiBq
ejQ3ODA6IGRyaXZlciBmb3IgTkFORCBkZXZpY2VzIG9uIEpaNDc4MCBTb0NzIikKPiBTaWduZWQt
b2ZmLWJ5OiBXZW4gWWFuZyA8eWVsbG93cml2ZXIyMDEwQGhvdG1haWwuY29tPgo+IFN1Z2dlc3Rl
ZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiBDYzogSGFy
dmV5IEh1bnQgPGhhcnZleWh1bnRuZXh1c0BnbWFpbC5jb20+Cj4gQ2M6IEJvcmlzIEJyZXppbGxv
biA8YmJyZXppbGxvbkBrZXJuZWwub3JnPgo+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPgo+IENjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0
Pgo+IENjOiBEYXZpZCBXb29kaG91c2UgPGR3bXcyQGluZnJhZGVhZC5vcmc+Cj4gQ2M6IEJyaWFu
IE5vcnJpcyA8Y29tcHV0ZXJzZm9ycGVhY2VAZ21haWwuY29tPgo+IENjOiBNYXJlayBWYXN1dCA8
bWFyZWsudmFzdXRAZ21haWwuY29tPgo+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gLS0tCj4gdjItPnYxOiBTaW5j
ZSB0aGVyZSBpcyB0aGUgb25seSBvbmUgdXNlciwgbGV0J3MgcmVtb3ZlIHRoZSBlcnJfcHV0X2Rl
dmljZSBsYWJlbC4KPiAKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvano0NzgwX2JjaC5jIHwgOCAr
KysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9qejQ3ODBfYmNoLmMgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9qejQ3ODBfYmNoLmMKPiBpbmRleCA3MjAxODI3Li4zNjM0NjVj
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2p6NDc4MF9iY2guYwo+ICsrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2p6NDc4MF9iY2guYwo+IEBAIC0yODEsMTAgKzI4MSwxMiBA
QCBzdGF0aWMgc3RydWN0IGp6NDc4MF9iY2ggKmp6NDc4MF9iY2hfZ2V0KHN0cnVjdCBkZXZpY2Vf
bm9kZSAqbnApCj4gIAlzdHJ1Y3Qgano0NzgwX2JjaCAqYmNoOwo+ICAKPiAgCXBkZXYgPSBvZl9m
aW5kX2RldmljZV9ieV9ub2RlKG5wKTsKPiAtCWlmICghcGRldiB8fCAhcGxhdGZvcm1fZ2V0X2Ry
dmRhdGEocGRldikpCj4gKwlpZiAoIXBkZXYpCj4gIAkJcmV0dXJuIEVSUl9QVFIoLUVQUk9CRV9E
RUZFUik7Cj4gLQo+IC0JZ2V0X2RldmljZSgmcGRldi0+ZGV2KTsKPiArCWlmICghcGxhdGZvcm1f
Z2V0X2RydmRhdGEocGRldikpIHsKPiArCQlwdXRfZGV2aWNlKCZwZGV2LT5kZXYpOwo+ICsJCXJl
dHVybiBFUlJfUFRSKC1FUFJPQkVfREVGRVIpOwo+ICsJfQo+ICAKPiAgCWJjaCA9IHBsYXRmb3Jt
X2dldF9kcnZkYXRhKHBkZXYpOwo+ICAJY2xrX3ByZXBhcmVfZW5hYmxlKGJjaC0+Y2xrKTsKCkFj
a2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
