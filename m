Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8AEC43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:22:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8F742063F
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:22:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nB/Ra7W0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8F742063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hR74eMlT23JrNS9JtLXrhVlrANybPmbhmJvZWZ0jvFw=; b=nB/Ra7W0mMG3mb
	rpWIPAqbJSPaNKr+sFAoWZd+YGowpo0L245mOXYO6mIKuHljUlHZ1BqGeVzwYAu9/4eEpwYcAmuYp
	ZmiQaoe0koiT4D4NGAcMDHvpMQ6qpRB+Dui4+qcF42xLtaUh+eJq4Ds5t3mcdOX0pcFUL1wDhJ+d0
	xyvBZYTFqqejmdyQpAGfpJRERhZkOLCrRjptZWRuhOJ5JOsRtzR1YDCfKfJiPitAnoYjVt+oqdOdr
	mH4MG/pjTt1PSSKfCbViMOl9OTsETJT17k8i68JL7d0jVuZG8ht5LThV4JhWfXvzc4Ej7u47+zgDT
	657/msdc6N1/haTWhyvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL2UD-0002yG-Ct; Mon, 29 Apr 2019 09:22:09 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL2U8-0002xI-1o; Mon, 29 Apr 2019 09:22:06 +0000
X-Originating-IP: 90.88.147.33
Received: from xps13 (aaubervilliers-681-1-27-33.w90-88.abo.wanadoo.fr
 [90.88.147.33]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 513621C0013;
 Mon, 29 Apr 2019 09:22:00 +0000 (UTC)
Date: Mon, 29 Apr 2019 11:22:00 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>
Subject: Re: [PATCH 5/5] mtd: rawnand: mtk: Setup empty page threshold
 correctly
Message-ID: <20190429112200.42a86815@xps13>
In-Reply-To: <20190429063834.45967-6-xiaolei.li@mediatek.com>
References: <20190429063834.45967-1-xiaolei.li@mediatek.com>
 <20190429063834.45967-6-xiaolei.li@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_022204_245126_2244A78E 
X-CRM114-Status: GOOD (  12.66  )
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
Cc: richard@nod.at, linux-mediatek@lists.infradead.org,
 linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWGlhb2xlaSwKClhpYW9sZWkgTGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPiB3cm90ZSBv
biBNb24sIDI5IEFwciAyMDE5IDE0OjM4OjM0CiswODAwOgoKPiBNVEsgTkFORCBDb250cm9sbGVy
IGhhcyB0aGUgYWJpbGl0eSB0byBjaGVjayB3aGV0aGVyIHJlYWQgZGF0YSBhcmUKPiBtb3N0bHkg
MHhmZiBieSBjb21wYXJpbmcgemVybyBiaXQgY29udXQgb2YgcmVhZCBkYXRhIHdpdGggZW1wdHkK
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvdW50ID8gCj4gdGhyZXNob2xk
IGF1dG9tYXRpY2FsbHkuCj4gCj4gQnV0IG5vdyB3ZSBuZXZlciBzZXQgdGhpcyB0aHJlc2hvbGQg
YW5kIGFsd2F5cyBtYWtlIGl0IGJlIGRlZmF1bHQgdmFsdWUKPiB3aGljaCBpcyAxMC4KPiAKPiBU
aGlzIHBhdGNoIGZpeGVzIHRoaXMgcHJvYmxlbSBieSBzZXR0aW5nIGVtcHR5IHRocmVzaG9sZCBh
cyB0aGUgcHJvZHVjdAo+IG9mIHJlYWQgc2VjdG9yIGNvdW50IGFuZCBlY2Mgc3RyZW5ndGguCgpE
byB3ZSB1c2UgdGhlc2UgZmVhdHVyZSB5ZXQ/CgpzL2VjYy9FQ0MvCgo+IAo+IEZpeGVzOiA5M2Ri
NDQ2YTQyNGMgKCJtdGQ6IG5hbmQ6IG1vdmUgcmF3IE5BTkQgcmVsYXRlZCBjb2RlIHRvIHRoZSBy
YXcvIHN1YmRpciIpCgpEaXR0by4KCj4gU2lnbmVkLW9mZi1ieTogWGlhb2xlaSBMaSA8eGlhb2xl
aS5saUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5k
LmMgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L210a19uYW5kLmMKPiBpbmRleCBjZjVlNTBlNzA0YWUuLjY3NWQ0ZmFhMzQ4MCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jCj4gKysrIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYwo+IEBAIC05NCw2ICs5NCw3IEBACj4gICNkZWZpbmUg
TkZJX01BU1RFUl9TVEEJCSgweDIyNCkKPiAgI2RlZmluZQkJTUFTVEVSX1NUQV9NQVNLCQkoMHgw
RkZGKQo+ICAjZGVmaW5lIE5GSV9FTVBUWV9USFJFU0gJKDB4MjNDKQo+ICsjZGVmaW5lCQlFTVBU
WV9USFJFU0hfTUFTSwlHRU5NQVNLKDcsIDApCj4gIAo+ICAjZGVmaW5lIE1US19OQU1FCQkibXRr
LW5hbmQiCj4gICNkZWZpbmUgS0IoeCkJCQkoKHgpICogMTAyNFVMKQo+IEBAIC05MzEsNiArOTMy
LDEwIEBAIHN0YXRpYyBpbnQgbXRrX25mY19yZWFkX3N1YnBhZ2Uoc3RydWN0IG10ZF9pbmZvICpt
dGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAl9Cj4g
IAo+ICsJLyogU2V0dXAgZW1wdHkgdGhyZXNob2xkICovCj4gKwlyZWcgPSBtYXgoc2VjdG9ycyAq
IGNoaXAtPmVjYy5zdHJlbmd0aCwgRU1QVFlfVEhSRVNIX01BU0spOwo+ICsJbmZpX3dyaXRlbChu
ZmMsIHJlZywgTkZJX0VNUFRZX1RIUkVTSCk7Cj4gKwo+ICAJcmVnID0gbmZpX3JlYWR3KG5mYywg
TkZJX0NORkcpOwo+ICAJcmVnIHw9IENORkdfUkVBRF9FTiB8IENORkdfRE1BX0JVUlNUX0VOIHwg
Q05GR19BSEI7Cj4gIAlpZiAoIXJhdykgewoKCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
