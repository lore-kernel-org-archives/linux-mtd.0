Return-Path: <SRS0=6cMw=TN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94345C04AB1
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2019 09:59:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6426A20989
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2019 09:59:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kSO2DerM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6426A20989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+E3KGwXJfJkyYMiyz4fnG95D+g7LYJSWPD6Uvcq1No=; b=kSO2DerMUhnLN8
	1ecZPXUNAd0oLzGYxlXaPdkjd2aEzHW0kChpTQNvziWaegDdZ2hTcyWnpWwvKEYNhkzWVxUxye5hs
	u1C+VvO9Q9FaQirf77mKLP2Ja1gYAcUtfgQcRDW5/DowgSxXQiABW2hDnoWz9WoIKDIc2upxJZzvF
	GYfjoqVaA+f94MDi3Ts3nR4+hz3gY20AvOKWO0/6POJtkg3EfeS62QTYAlr7m5oJY2Q3HukP0ymqi
	A8HM17qmiUk4L8elJj2Shf3f8CLA3+hP0glmlZsIgPXcAOEM2V6uTX6PUeZi07XWcUl/13UHIpnbv
	I1zzK5yB93rms9Jq7pXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQ7kI-0005yy-S4; Mon, 13 May 2019 09:59:46 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQ7kC-0005mk-F8
 for linux-mtd@lists.infradead.org; Mon, 13 May 2019 09:59:44 +0000
X-Originating-IP: 77.154.224.5
Received: from xps13 (5.224.154.77.rev.sfr.net [77.154.224.5])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A2A7F6000D;
 Mon, 13 May 2019 09:59:28 +0000 (UTC)
Date: Mon, 13 May 2019 11:59:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v1] mtd: rawnand: Add Macronix NAND read retry support
Message-ID: <20190513115926.3e862566@xps13>
In-Reply-To: <OF3A216E48.80ABBB8A-ON482583F9.002A09DA-482583F9.002AD40E@mxic.com.tw>
References: <1557474062-4949-1-git-send-email-masonccyang@mxic.com.tw>
 <20190510094528.6008e8da@xps13>
 <OF5E2BF75D.98A43E33-ON482583F6.002E7A65-482583F6.0030A2DE@mxic.com.tw>
 <20190510111121.54f42e70@xps13>
 <OF3A216E48.80ABBB8A-ON482583F9.002A09DA-482583F9.002AD40E@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_025941_216060_D86B1610 
X-CRM114-Status: GOOD (  21.15  )
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
Cc: bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgptYXNvbmNjeWFuZ0BteGljLmNvbS50dyB3cm90ZSBvbiBNb24sIDEzIE1heSAy
MDE5IDE1OjQ3OjUzICswODAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gCj4gPiA+ICAgCj4gPiA+ID4g
ICAKPiA+ID4gPiA+ICsgICBpZiAocmV0KQo+ID4gPiA+ID4gKyAgICAgIHByX2Vycigic2V0IGZl
YXR1cmUgZmFpbGVkIHRvIHJlYWQgcmV0cnkgbW9kZWQ6JWRcbiIsICAgCj4gbW9kZSk7IAo+ID4g
PiA+IAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIkZhaWxlZCB0byBzZXQgcmVhZCBy
ZXRyeSBtb2RlOiAlZFxuIgo+ID4gPiA+IAo+ID4gPiA+IEkgdGhpbmsgeW91IGNhbiBhYm9ydCB0
aGUgb3BlcmF0aW9uIHdpdGggYSBuZWdhdGl2ZSByZXR1cm4gY29kZSBpbiAgIAo+IHRoaXMKPiA+
ID4gPiBjYXNlLgo+ID4gPiA+ICAgCj4gPiA+IAo+ID4gPiBBZnRlciBzZXQgZmVhdHVyZSBvcGVy
YXRpb24sIHRoaXMgTkFORCBkZXZpY2UgbmVlZCBhIGdldCBmZWF0dXJlICAgCj4gY29tbWFuZCAK
PiA+IAo+ID4gWW91IG5lZWQgdG8gYWRkIGEgY29tbWVudCBmb3IgdGhpcy4gIAo+IAo+IG9rYXks
IHdpbGwgYWRkIHRoaXMgY29tbWVudCBieSBuZXh0IHZlcnNpb24uCj4gCj4gPiAgIAo+ID4gPiBv
cgo+ID4gPiBTVyByZXNldCBjb21tYW5kIHRvIGV4aXQgcmVhZCByZXRyeSBtb2RlLgo+ID4gPiBU
aGVyZWZvcmUsIHNldCBmZWF0dXJlcyBjb21tYW5kIGZvbGxvd2VkIGJ5IGdldCBmZWF0dXJlIGNv
bW1hbmQgaXMgICAKPiBuZWVkZWQuCj4gPiAKPiA+IEluIHRoaXMgY2FzZSB5b3UgbXVzdCBjaGVj
ayBmaXJzdCB0aGF0IGJvdGggc2V0IGFuZCBnZXQgYXJlIHN1cHBvcnRlZC4KPiA+ICAgCj4gCj4g
b2theSwgdGhhbmtzLgo+IAo+IAo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgIGlmIChteGlj
LT5yZWxpYWJpbGl0eV9mdW5jICYgTUFDUk9OSVhfUkVBRF9SRVRSWV9CSVQpIHsKPiA+ID4gPiA+
ICsgICAgICAgICBjaGlwLT5yZWFkX3JldHJpZXMgPSBNQUNST05JWF9SRUFEX1JFVFJZX01PREUg
KyAxOyAgIAo+ID4gPiA+IAo+ID4gPiA+IFdoeSArMSBoZXJlLCBJIGFtIG1pc3Npbmcgc29tZXRo
aW5nPyAgIAo+ID4gPiAKPiA+ID4gCj4gPiA+IFdpdGhvdXQgKyAxLCByZWFkIHJldHJ5IG1vZGUg
aXMgdXAgdG8gNCByYXRoZXIgdGhhbiA1Lgo+ID4gPiBCdXQgdGhpcyBOQU5EIGRldmljZSBzdXBw
b3J0IHJlYWQgcmV0cnkgbW9kZSB1cCB0byA1Lgo+ID4gPiAgIAo+ID4gCj4gPiBJZiB0aGVyZSBh
cmUgNSBtb2RlcywgeW91IG5lZWQgdG8gc2V0IDUgdG8gY2hpcC0+cmVhZF9yZXRyaWVzLCBub3Qg
Ni4KPiA+IAo+ID4gSWYgb25seSA0IG1vZGVzIGFyZSB1c2VkLCB0aGVyZSBpcyBwcm9iYWJseSBh
IGJ1ZyBpbiB0aGUgY29yZSB0aGF0Cj4gPiBtdXN0IGJlIGZpeGVkLCBwbGVhc2UgZG8gbm90IHdv
cmthcm91bmQgaXQgaW4gdGhlIGRyaXZlciEgIAo+IAo+IAo+IEl0IHNlZW1zIHNvbWUgcGF0Y2hl
cyBpcyBuZWVkZWQgaW4gbmFuZF9iYXNlLmMKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIAo+IGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiBpbmRleCBkZGQzOTZlLi41NmJlM2E5IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gKysrIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiBAQCAtMzEwMSw3ICszMTAxLDggQEAgc3Rh
dGljIGludCBuYW5kX3NldHVwX3JlYWRfcmV0cnkoc3RydWN0IG5hbmRfY2hpcCAKPiAqY2hpcCwg
aW50IHJldHJ5X21vZGUpCj4gIHsKPiAgICAgICAgIHByX2RlYnVnKCJzZXR0aW5nIFJFQUQgUkVU
UlkgbW9kZSAlZFxuIiwgcmV0cnlfbW9kZSk7Cj4gCj4gLSAgICAgICBpZiAocmV0cnlfbW9kZSA+
PSBjaGlwLT5yZWFkX3JldHJpZXMpCj4gKyAgICAgICBpZiAocmV0cnlfbW9kZSA+IGNoaXAtPnJl
YWRfcmV0cmllcykKCklmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIGNoaXAtPnJlYWRfcmV0cmll
cyBpcyB0aGUgdG90YWwgbnVtYmVyIG9mCidtb2Rlcycgc28gdGhlIGxhc3QgdmFsaWQgbW9kZSBp
cyBpbmRlZWQgY2hpcC0+cmVhZF9yZXRyaWVzIC0xLgoKSSB0aG91Z2h0IHRoZSBwcm9ibGVtIHdv
dWxkIGNvbWUgZnJvbSB0aGUgY29yZSBidXQgSSB3YXMgd3JvbmcsIHlvdQphY3R1YWxseSBuZWVk
IGEgTUFDUk9OSVhfTlVNX1JFQURfUkVUUllfTU9ERVMgc2V0IHRvIDYuIFBsZWFzZSBoYXZlIHR3
bwpkZWZpbmVzIGlmIHlvdSBuZWVkIGJvdGggKHRoZSBmaXJzdCBvbmUgYmVpbmcgc29tZXRoaW5n
IGxpa2UKTUFDUk9OSVhfTUFYSU1VTV9SRUFEX1JFVFJZX01PREUgc2V0IHRvIDUpLgoKClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
