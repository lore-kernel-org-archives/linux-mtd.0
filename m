Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E90AC43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 08:22:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0082214AF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 08:22:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GphWeLLM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0082214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2zd/uvKO9zKu8MRJ3oeeLfWjQ4toFlKfibuBkaaWys=; b=GphWeLLMj/+w8b
	9SqEcRILXgy2oqGbKI1NE62ybOdnQyEQUWZJtjJPhW1f4ql+TcROrKtAz14hcaNZKQqyYjRXXUqk4
	IG5g6cQodTUj5Lg6vCNeE/YLohqi/A9sounO7MUdKGcaG/F0TK6T7ZcsEo6SrrNRtnagAzGIE1fhf
	UXOqaYVBIlWHFrcq4lv7D0xlKSJY+nTNGKHmwuWKynM1PjP25Rh5pLnZWgp6tCBdSpJDF3JRp1OnV
	I9EI8Ig05qH+Ig1CeoC29XTnSmS0BQWUGgurtlbJ8Js5iypv4JXyxxCvCBZaM7XWr8XrSiNwrJLe5
	ht3SvnQzvxmyT2HIk6iQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL1YP-0002oD-AG; Mon, 29 Apr 2019 08:22:25 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL1YM-0002nl-Us
 for linux-mtd@lists.infradead.org; Mon, 29 Apr 2019 08:22:24 +0000
X-Originating-IP: 90.88.147.33
Received: from xps13 (aaubervilliers-681-1-27-33.w90-88.abo.wanadoo.fr
 [90.88.147.33]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4BCAEFF81D;
 Mon, 29 Apr 2019 08:22:17 +0000 (UTC)
Date: Mon, 29 Apr 2019 10:22:16 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Subject: Re: [PATCH 5/5] mtd: onenand/samsung: Set name field of mtd_info
 struct
Message-ID: <20190429102216.3235c48c@xps13>
In-Reply-To: <20190426164224.11327-6-pawel.mikolaj.chmiel@gmail.com>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
 <20190426164224.11327-6-pawel.mikolaj.chmiel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_012223_139324_AE8B2FF9 
X-CRM114-Status: GOOD (  11.93  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, bbrezillon@kernel.org,
 richard@nod.at, linux-kernel@vger.kernel.org,
 Tomasz Figa <tomasz.figa@gmail.com>, marek.vasut@gmail.com,
 kyungmin.park@samsung.com, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGF3ZcWCLAoKUGF3ZcWCIENobWllbCA8cGF3ZWwubWlrb2xhai5jaG1pZWxAZ21haWwuY29t
PiB3cm90ZSBvbiBGcmksIDI2IEFwciAyMDE5CjE4OjQyOjI0ICswMjAwOgoKPiBGcm9tOiBUb21h
c3ogRmlnYSA8dG9tYXN6LmZpZ2FAZ21haWwuY29tPgo+IAo+IFRoaXMgcGF0Y2ggYWRkcyBpbml0
aWFsaXphdGlvbiBvZiAubmFtZSBmaWVsZCBvZiBtdGRfaW5mbyBzdHJ1Y3QgdG8KPiBhdm9pZCBw
cmludGluZyAiKG51bGwpIiBpbiBrZXJuZWwgbG9nIG1lc3NhZ2VzLCBzdWNoIGFzOgo+IAo+IFsg
ICAgMS45NDI1MTldIDEgb2ZwYXJ0IHBhcnRpdGlvbnMgZm91bmQgb24gTVREIGRldmljZSAobnVs
bCkKPiBbICAgIDEuOTQ5NzA4XSBDcmVhdGluZyAxIE1URCBwYXJ0aXRpb25zIG9uICIobnVsbCki
Ogo+IAo+IFNpZ25lZC1vZmYtYnk6IFRvbWFzeiBGaWdhIDx0b21hc3ouZmlnYUBnbWFpbC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogUGF3ZcWCIENobWllbCA8cGF3ZWwubWlrb2xhai5jaG1pZWxAZ21h
aWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvc2Ftc3VuZy5jIHwgMSAr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL29uZW5hbmQvc2Ftc3VuZy5jIGIvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5k
L3NhbXN1bmcuYwo+IGluZGV4IDBmNDUwNjA0NDEyZi4uMWZkYTFmMzI0Y2M2IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9zYW1zdW5nLmMKPiArKysgYi9kcml2ZXJzL210
ZC9uYW5kL29uZW5hbmQvc2Ftc3VuZy5jCj4gQEAgLTg4Niw2ICs4ODYsNyBAQCBzdGF0aWMgaW50
IHMzY19vbmVuYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAkJcmV0
dXJuIC1FTk9NRU07Cj4gIAo+ICAJdGhpcyA9IChzdHJ1Y3Qgb25lbmFuZF9jaGlwICopICZtdGRb
MV07Cj4gKwltdGQtPm5hbWUgPSBkZXZfbmFtZSgmcGRldi0+ZGV2KTsKPiAgCW10ZC0+cHJpdiA9
IHRoaXM7Cj4gIAltdGQtPmRldi5vZl9ub2RlID0gbnA7Cj4gIAltdGQtPmRldi5wYXJlbnQgPSAm
cGRldi0+ZGV2OwoKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
