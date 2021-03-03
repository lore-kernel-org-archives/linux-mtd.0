Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44983C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 23:13:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC64F64E46
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 23:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC64F64E46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5fpwSU8WzBqQykPB65IC7DMkO51c+cS4z2QVkvdo4Y=; b=B45rMyLJfzgtKv
	xsV82AD0+qF68dbPy9Zq/nVnHG9U2kqY9SSWe/WLuDCd4HUzk8UeRhKS8pBN2IlkC0dYI+9e8lhqh
	o5QihDAn3fkWRO2vhCgFkWCReTnT4U0X3glqNZpXUxuUlnacMyrQRGKP//toXipscvUUv1MQQ6YU3
	txozQLvw5yJqTW7g1D+jR+sI5YSYUcFQ11l0iwmrUyvGFzjlAgwagh7cK7jWGTjm9loTvxejDV8xa
	POwHGBW0VGBUypoVWYr2trhy7cblQPrBCEpNTEO8d8y4Z7I31JpdkMYFMFgaeLaGDtOulRYqvdsbi
	eChIEOrQOKHOlD1cAG3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHaeJ-006t2K-95; Wed, 03 Mar 2021 23:11:23 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHUBi-005Z8J-M2
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 16:17:28 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C0AEF6083244;
 Wed,  3 Mar 2021 17:17:18 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 47tz6j-1yi-U; Wed,  3 Mar 2021 17:17:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A02CD6083275;
 Wed,  3 Mar 2021 17:17:16 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id S4uJLM3KDg-S; Wed,  3 Mar 2021 17:17:16 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 7E9876083244;
 Wed,  3 Mar 2021 17:17:16 +0100 (CET)
Date: Wed, 3 Mar 2021 17:17:16 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <689194005.42755.1614788236355.JavaMail.zimbra@nod.at>
In-Reply-To: <YD+0mAPTMN8AwNBx@kroah.com>
References: <20210303155735.25887-1-michael@walle.cc>
 <YD+0mAPTMN8AwNBx@kroah.com>
Subject: Re: [PATCH] mtd: require write permissions for locking and badblock
 ioctls
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: require write permissions for locking and badblock ioctls
Thread-Index: KRfYtqpl1pr2bZDMHpym/f0qKEWheA==
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

TWljaGFlbCwKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBWb246ICJHcmVnIEty
b2FoLUhhcnRtYW4iIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBBbjogIk1pY2hhZWwg
V2FsbGUiIDxtaWNoYWVsQHdhbGxlLmNjPgo+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxp
c3RzLmluZnJhZGVhZC5vcmc+LCAibGludXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZz4sICJNaXF1ZWwgUmF5bmFsIgo+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwg
InJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJWaWduZXNoIFJhZ2hhdmVuZHJhIiA8dmlnbmVz
aHJAdGkuY29tPgo+IEdlc2VuZGV0OiBNaXR0d29jaCwgMy4gTcOkcnogMjAyMSAxNzowODo1Ngo+
IEJldHJlZmY6IFJlOiBbUEFUQ0hdIG10ZDogcmVxdWlyZSB3cml0ZSBwZXJtaXNzaW9ucyBmb3Ig
bG9ja2luZyBhbmQgYmFkYmxvY2sgaW9jdGxzCgo+IE9uIFdlZCwgTWFyIDAzLCAyMDIxIGF0IDA0
OjU3OjM1UE0gKzAxMDAsIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+IE1FTUxPQ0ssIE1FTVVOTE9D
SyBhbmQgT1RQTE9DSyBtb2RpZnkgcHJvdGVjdGlvbiBiaXRzLiBUaHVzIHJlcXVpcmUKPj4gd3Jp
dGUgcGVybWlzc2lvbi4gRGVwZW5kaW5nIG9uIHRoZSBoYXJkd2FyZSBNRU1MT0NLIG1pZ2h0IGV2
ZW4gYmUKPj4gd3JpdGUtb25jZSwgZS5nLiBmb3IgU1BJLU5PUiBmbGFzaGVzIHdpdGggdGhlaXIg
V1AjIHRpZWQgdG8gR05ELiBPVFBMT0NLCj4+IGlzIGFsd2F5cyB3cml0ZS1vbmNlLgo+PiAKPj4g
TUVNU0VUQkFEQkxPQ0sgbW9kaWZpZXMgdGhlIGJhZCBibG9jayB0YWJsZS4KPj4gCj4+IEZpeGVz
OiBmN2U2YjE5YmM3NjQgKCJtdGQ6IHByb3Blcmx5IGNoZWNrIGFsbCB3cml0ZSBpb2N0bHMgZm9y
IHBlcm1pc3Npb25zIikKPj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3
YWxsZS5jYz4KPj4gLS0tCj4+ICBkcml2ZXJzL210ZC9tdGRjaGFyLmMgfCA4ICsrKystLS0tCj4+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IFRo
YW5rcyBmb3IgYXVkaXRpbmcgdGhlIHJlc3Qgb2YgdGhlc2UgZnJvbSBteSBvcmlnaW5hbCBwYXRj
aC4gIElmIHRoaXMKPiBpcyBvayB3aXRoIHVzZXJzcGFjZSB0b29scywgaXQncyBmaW5lIHdpdGgg
bWUsIGJ1dCBJIGRvbid0IGV2ZW4gaGF2ZQo+IHRoaXMgaGFyZHdhcmUgdG8gdGVzdCB3aXRoIDop
CgpUaGF0J3MgbXkgZmVhci4gTWljaGFlbCwgZGlkIHlvdSB2ZXJpZnk/CkluIGdlbmVyYWwgeW91
IG5lZWQgdG8gYmUgcm9vdCB0byBvcGVuIHRoZXNlIGRldmljZSBmaWxlcy4KU28sIEkgZG9uJ3Qg
c2VlIGEgc2VjdXJpdHkgcHJvYmxlbSBoZXJlLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
