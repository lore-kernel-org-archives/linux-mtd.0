Return-Path: <SRS0=GkoH=M5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3C4C4338F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 18:18:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 740B961179
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 18:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 740B961179
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9qMfUdp+R3Yoo1QMRhAlS3SgsUUf9lrrgscW5i+OmI=; b=h/YZXCYR443rAG
	c0xC1FyWmlIF82mC0j195uJdQhZ/KgPrEhv6q4Ibqd0tdsKjzynXjQIMWqBT3vPPP0pF3smkK1P+X
	Cdc65ngqJTobGvfdDblbrND253oBohqA0DGf1HKXsEjYXWQJK5stipu1JaVZ0T1D/1irjPyVfdVA6
	365DlR/AQCuGc24+0dy8mJEaChwLKTaqca9xoLrSANZubIYhFx0fxTrPJh9k03mmMqZovOh/m0pi1
	SeCCYx1kF0Z1Xiu+MdmpH5k2ik+KQknK3XvHz+CTyuKjKNxyfJqbjDg2OiVHSu4m8R4nKXMkgW0Rd
	XGHodUAAE41H+wqOS7WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC4QN-00D7CN-4M; Fri, 06 Aug 2021 18:18:27 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC4QJ-00D7Bk-PG
 for linux-mtd@lists.infradead.org; Fri, 06 Aug 2021 18:18:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id DE67BC0002;
 Fri,  6 Aug 2021 18:18:21 +0000 (UTC)
Date: Fri, 6 Aug 2021 20:18:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Young <sean@mess.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/4] mtd: rfd_ftl: add discard support
Message-ID: <20210806201820.512beda8@xps13>
In-Reply-To: <cdc2b33790398d42f310af350298c1e781a50991.1626169090.git.sean@mess.org>
References: <cover.1626169090.git.sean@mess.org>
 <cdc2b33790398d42f310af350298c1e781a50991.1626169090.git.sean@mess.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_111823_998285_D8C68C7F 
X-CRM114-Status: GOOD (  17.98  )
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

SGkgU2VhbiwKClNlYW4gWW91bmcgPHNlYW5AbWVzcy5vcmc+IHdyb3RlIG9uIFR1ZSwgMTMgSnVs
IDIwMjEgMTA6NDQ6MDEgKzAxMDA6Cgo+IEkgcHJvcG9zZWQgdGhpcyBjaGFuZ2UgMTYgeWVhcnMg
YWdvIGJlZm9yZSBkaXNjYXJkIHdhcyBhIGZlYXR1cmUgaW4KPiB0aGUgYmxvY2sgbGF5ZXI6IGh0
dHBzOi8vbHduLm5ldC9BcnRpY2xlcy8xNjI3NzYvCj4gCj4gTm93IHRoYXQgdGhlIGJsb2NrIGxh
eWVyIGhhcyBkaXNjYXJkLCB3ZSBjYW4gZmluYWxseSBtZXJnZSB0aGlzIGNoYW5nZS4KCkNhbiB5
b3UgZXhwbGFpbiB3aHkgdGhpcyBpcyBuZWVkZWQgaGVyZT8KCihhbHNvIHBsZWFzZSBhZGQgdGhl
IG1haW50YWluZXJzIGluIENjOiBmb3IgdGhlIHYyKQoKPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIFlv
dW5nIDxzZWFuQG1lc3Mub3JnPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9yZmRfZnRsLmMgfCAyOSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9yZmRfZnRsLmMgYi9kcml2ZXJz
L210ZC9yZmRfZnRsLmMKPiBpbmRleCA3YjI0M2YyYjJmYTMuLjdmNWY2ZDI0N2NhZSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL210ZC9yZmRfZnRsLmMKPiArKysgYi9kcml2ZXJzL210ZC9yZmRfZnRs
LmMKPiBAQCAtNzA1LDYgKzcwNSwzNCBAQCBzdGF0aWMgaW50IHJmZF9mdGxfd3JpdGVzZWN0KHN0
cnVjdCBtdGRfYmxrdHJhbnNfZGV2ICpkZXYsIHVfbG9uZyBzZWN0b3IsIGNoYXIgKgo+ICAJcmV0
dXJuIHJjOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW50IHJmZF9mdGxfZGlzY2FyZHNlY3Qoc3RydWN0
IG10ZF9ibGt0cmFuc19kZXYgKmRldiwKPiArCQkJICAgICAgIHVuc2lnbmVkIGxvbmcgc2VjdG9y
LCB1bnNpZ25lZCBpbnQgbnJfc2VjdHMpCj4gK3sKPiArCXN0cnVjdCBwYXJ0aXRpb24gKnBhcnQg
PSAoc3RydWN0IHBhcnRpdGlvbiAqKWRldjsKPiArCXVfbG9uZyBhZGRyOwo+ICsJaW50IHJjOwo+
ICsKPiArCXdoaWxlIChucl9zZWN0cykgewo+ICsJCWlmIChzZWN0b3IgPj0gcGFydC0+c2VjdG9y
X2NvdW50KQo+ICsJCQlyZXR1cm4gLUVJTzsKPiArCj4gKwkJYWRkciA9IHBhcnQtPnNlY3Rvcl9t
YXBbc2VjdG9yXTsKPiArCj4gKwkJaWYgKGFkZHIgIT0gLTEpIHsKPiArCQkJcmMgPSBtYXJrX3Nl
Y3Rvcl9kZWxldGVkKHBhcnQsIGFkZHIpOwo+ICsJCQlpZiAocmMpCj4gKwkJCQlyZXR1cm4gcmM7
Cj4gKwo+ICsJCQlwYXJ0LT5zZWN0b3JfbWFwW3NlY3Rvcl0gPSAtMTsKPiArCQl9Cj4gKwo+ICsJ
CXNlY3RvcisrOwo+ICsJCW5yX3NlY3RzLS07Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30K
PiArCj4gIHN0YXRpYyBpbnQgcmZkX2Z0bF9nZXRnZW8oc3RydWN0IG10ZF9ibGt0cmFuc19kZXYg
KmRldiwgc3RydWN0IGhkX2dlb21ldHJ5ICpnZW8pCj4gIHsKPiAgCXN0cnVjdCBwYXJ0aXRpb24g
KnBhcnQgPSAoc3RydWN0IHBhcnRpdGlvbiopZGV2Owo+IEBAIC03ODYsNiArODE0LDcgQEAgc3Rh
dGljIHN0cnVjdCBtdGRfYmxrdHJhbnNfb3BzIHJmZF9mdGxfdHIgPSB7Cj4gIAo+ICAJLnJlYWRz
ZWN0CT0gcmZkX2Z0bF9yZWFkc2VjdCwKPiAgCS53cml0ZXNlY3QJPSByZmRfZnRsX3dyaXRlc2Vj
dCwKPiArCS5kaXNjYXJkCT0gcmZkX2Z0bF9kaXNjYXJkc2VjdCwKPiAgCS5nZXRnZW8JCT0gcmZk
X2Z0bF9nZXRnZW8sCj4gIAkuYWRkX210ZAk9IHJmZF9mdGxfYWRkX210ZCwKPiAgCS5yZW1vdmVf
ZGV2CT0gcmZkX2Z0bF9yZW1vdmVfZGV2LAoKCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
