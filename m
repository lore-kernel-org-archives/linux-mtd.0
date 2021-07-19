Return-Path: <SRS0=DZ8H=ML=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B3AC07E95
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 15:20:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3208611C1
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 15:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3208611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gorani.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0y6Do/SI+Sb7AWYR+drI9an22cHHh8u3rt/QcRVc4g=; b=W+WLHj3anA1YDr3XAFdvrVwiul
	nNirmgppPPeDdT82sbv5ji2LJOOL+oPzrdONvJa6Ui/AzG75Q41a6LSm9gVfa5ezoycKPWWSQXyNS
	swPrjAEhtYq+AnI6LPjZ+pOsNdg8dpMOC/O3Z030pJTnoE3FcmACM3xP7GRYYVExldATnecEtAbUV
	2Za/Udkt5bDTA2TJZcSk4WOKOhLhFGwSSXNw6PFUiKhyrlr1l9bG6U31PNELAuC7MkV8xuY6JysEW
	qtBmiFa0GirSjsywS/RW8PSaGMzIdVoS9oczCmqfwX5wP0Vuyx5NbOhwGP9UT1ox4pdYnsqR88g0J
	Lr89Nsyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5V3Z-00A3Xh-Ih; Mon, 19 Jul 2021 15:19:45 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050::465:103])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5V3W-00A3Vs-Rx
 for linux-mtd@lists.infradead.org; Mon, 19 Jul 2021 15:19:44 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4GT59k3TMWzQjwF;
 Mon, 19 Jul 2021 17:19:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001; 
 t=1626707976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pdqOnPONPs7ePl98NjSnmZ9WUsuCMZR4UzmCrljURZs=;
 b=NNRdhhfRdY0hVmSxGjbG0d/kOiz0VYidhSVTnUGbQ7CXnr2iVniIOAIAsgo2d/ursVwtKw
 CI1t3oBVHl+OR3O9jwOh9t71/h2r3H+rSunMoeAwlBw/Wo7zTW8qFsR9FjHbLVw4A8tb2r
 XUE53eeMKG9HfVxrHasjRMu5Ck3P+zHoYLXje38Lv0O0raSniKW+LqmxhWy1WVd6iCtNh+
 YeS2Nl9Yq1buculBO10xRgfLXQARI175fyvW7bENd6Bevop3f12oMpji2HQEFqrXTcpRkF
 KI+P44pdAOARqybf3v7moRqm2JdG1wxoODPss0PomOmA8K+JxzTbJJ0bIOcvGw==
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id vPSnF9bdteTn; Mon, 19 Jul 2021 17:19:34 +0200 (CEST)
Subject: Re: [PATCH] mtd: spi-nor: esmt: Use correct name of f25l32qa
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20210620085639.143694-1-mans0n@gorani.run>
 <dad2160dba9070f1516519bdd00207ac@walle.cc>
From: Sungbo Eo <mans0n@gorani.run>
Message-ID: <e7fca59e-f7f5-f5f8-9e3b-001c5c938659@gorani.run>
Date: Tue, 20 Jul 2021 00:19:26 +0900
MIME-Version: 1.0
In-Reply-To: <dad2160dba9070f1516519bdd00207ac@walle.cc>
Content-Language: en-US
X-Rspamd-Queue-Id: C9615180C
X-Rspamd-UID: 6551df
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_081943_133672_456B5D93 
X-CRM114-Status: GOOD (  19.48  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wNy0xNyAwMToxMSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBBbSAyMDIxLTA2LTIw
IDEwOjU2LCBzY2hyaWViIFN1bmdibyBFbzoKPj4gVGhlIGZsYXNoIElEIG9mIEYyNUwzMlFBIGlz
IDB4OGM0MDE2LCB3aGVyZWFzIHRoYXQgb2YgRjI1TDMyUUEoMlMpIGlzCj4+IDB4OGM0MTE2LiBG
MjVMMzJRQSgyUykgaXMgdGhlIG5ld2VyIHZlcnNpb24gb2YgRjI1TDMyUUEgYW5kIGl0cyBCUG4g
Yml0cwo+PiBhcmUgbm9uLXZvbGF0aWxlLCB1bmxpa2UgaXRzIG9sZGVyIHZlcnNpb24uCj4+Cj4+
IFJlZmVyZW5jZXM6IAo+PiBodHRwczovL3d3dy5lc210LmNvbS50dy91cGxvYWQvcGRmL0VTTVQv
ZGF0YXNoZWV0cy9GMjVMMzJRQS5wZGYKPj4gUmVmZXJlbmNlczoKPj4gaHR0cHM6Ly93d3cuZXNt
dC5jb20udHcvdXBsb2FkL3BkZi9FU01UL2RhdGFzaGVldHMvRjI1TDMyUUFfMSgyUykucGRmCj4g
Cj4gIkRhdGFzaGVldDoiIHBsZWFzZQo+IAo+PiBTaWduZWQtb2ZmLWJ5OiBTdW5nYm8gRW8gPG1h
bnMwbkBnb3JhbmkucnVuPgo+PiAtLS0KPj4gQXQgZmlyc3QgSSB3YXMgZ29pbmcgdG8gc2VuZCBh
IG5ldyBzdXBwb3J0IHBhdGNoIG9mIEYyNUwxNlBBKDJTKSwKPj4gYnV0IGJlZm9yZSB0aGF0LCBJ
IHdhbnRlZCB0byBtYWtlIHN1cmUgaWYgIigycykiIHN1ZmZpeCBpcyBva2F5IG9yIAo+PiB1bm5l
Y2Vzc2FyeS4KPj4gLS0tCj4+IMKgZHJpdmVycy9tdGQvc3BpLW5vci9lc210LmMgfCA0ICsrLS0K
Pj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9lc210LmMgYi9kcml2ZXJzL210ZC9z
cGktbm9yL2VzbXQuYwo+PiBpbmRleCBjZmM5MjE4YzEwNTMuLjUxYjNmZjc2NGVmNiAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9lc210LmMKPj4gKysrIGIvZHJpdmVycy9tdGQv
c3BpLW5vci9lc210LmMKPj4gQEAgLTEyLDggKzEyLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBm
bGFzaF9pbmZvIGVzbXRfcGFydHNbXSA9IHsKPj4gwqDCoMKgwqAgLyogRVNNVCAqLwo+PiDCoMKg
wqDCoCB7ICJmMjVsMzJwYSIsIElORk8oMHg4YzIwMTYsIDAsIDY0ICogMTAyNCwgNjQsCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTRUNUXzRLIHwgU1BJX05PUl9IQVNfTE9DSyB8
IFNQSV9OT1JfU1dQX0lTX1ZPTEFUSUxFKSB9LAo+PiAtwqDCoMKgIHsgImYyNWwzMnFhIiwgSU5G
TygweDhjNDExNiwgMCwgNjQgKiAxMDI0LCA2NCwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgU0VDVF80SyB8IFNQSV9OT1JfSEFTX0xPQ0spIH0sCj4+ICvCoMKgwqAgeyAiZjI1bDMy
cWEoMnMpIiwgSU5GTygweDhjNDExNiwgMCwgNjQgKiAxMDI0LCA2NCwKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTRUNUXzRLIHwgU1BJX05PUl9IQVNfTE9DSykgfSwK
Pj4gwqDCoMKgwqAgeyAiZjI1bDY0cWEiLCBJTkZPKDB4OGM0MTE3LCAwLCA2NCAqIDEwMjQsIDEy
OCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNFQ1RfNEsgfCBTUElfTk9SX0hB
U19MT0NLKSB9LAo+PiDCoH07Cj4gCj4gVHVkb3IgaGFzIGRlY2lkZSBvbiB0aGF0IG5hbWUgLSBv
ciB0aGUgdXNlIG9mIHBhcmVudGhlc2VzLiBJIGRvbid0IGhhdmUgYQo+IHN0cm9uZyBvcGluaW9u
IG9uIGl0LgoKSSdtIGNvbmNlcm5lZCB0aGF0IGFueSBvdGhlciBkZXZpY2VzIGRvIG5vdCBjb250
YWluIHBhcmVudGhlc2VzIGluIHRoZWlyIAptb2RlbCBuYW1lcy4uLiBJJ20gZmluZSB3aXRoICJm
MjVsMzJxYS0ycyIgaWYgcHJlZmVycmVkLgoKPiAKPiBGV0lXLAo+IFJldmlld2VkLWJ5OiBNaWNo
YWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPgoKVGhhbmtzIGZvciB5b3VyIHJldmlldyEKCj4g
Cj4gLW1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
