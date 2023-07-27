Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AE8C0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 14:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0zLRthq7Xq7kKLaWUdwBTEr7/lyVPRCTh0uoGlKNRE=; b=0mEvUjCED8UHos
	xnTttzKZrmjyt+L3k+whSbXCt7FUbdjUJfik+GgzAWYi/XcRWVFyxYMTWM/7EgXqT1lKyFwTfs5NT
	M41CS6vDBDSbrtGs5mRpWg6MH3j2/A6uAhMqvRrMKP0f7bChomYXIZU3n0NEo2Qz2bMgB94OtsnU4
	JX4JgwT509M4N588B0EnJq6vRc2SWx4CegPS+mP1MAab+S0cAv6KAjeCNLHi2Rh65RnFLFevv9twq
	KpYG9e8mQf49EU7WvisRWhf5UC583XgZmo+nxkbZCz5atsuyOFEOEdISZQ8axq+PjolH0RtIRLDSC
	mtOXL4Vxe7DvEyYHRJDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2So-00FYUX-0s;
	Thu, 27 Jul 2023 14:59:38 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2Sj-00FYNu-2o;
	Thu, 27 Jul 2023 14:59:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4A424000D;
	Thu, 27 Jul 2023 14:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690469968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1pXsh+frWW0hGafp90WDzUVq0+ieBfBq8jclmQ7WvGY=;
	b=DD1G/c3ArI7uPwq3jiaW1I9jnhFXaTj1D1iRmuc/0O8eU46egaFMDRwwcyRlsZMeXmdL9j
	6t02XacS7R6k9AeuEUsvcNU0ylnObC9XL/CcjemSSagCnT3Ui3qbc9eS63tib8tEaO1cvy
	fhfZ6r2aewiEAEtJ6KIzfgFgrlKLAh6opsnl+A67qP0lxUB9bihkuVVLqzxjgktRhkImM/
	VYJaaZIjlZutuqJ35C+94kqirIsMo14ZI74e73d56yA8wgTGBwNX0YmGyVs0BQT2NBo3R7
	MzMz02lP/1WSNkHb7+gjmG/IJbR+sBjTGd/dSlBk5ZuNVgHggyIkNZReZf8eMw==
Date: Thu, 27 Jul 2023 16:59:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, Sricharan Ramabadhran
 <quic_srichara@quicinc.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, kernel
 test robot <lkp@intel.com>
Subject: Re: [PATCH 8/8] mtd: rawnand: qcom: Fix address parsing within
 ->exec_op()
Message-ID: <20230727165923.32488041@xps-13>
In-Reply-To: <20230717063843.GA7062@thinkpad>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
	<20230716144612.32132-9-miquel.raynal@bootlin.com>
	<20230717063843.GA7062@thinkpad>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_075934_341143_06E533D6 
X-CRM114-Status: GOOD (  23.23  )
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

SGkgU2FkcmUsCgptYW5pQGtlcm5lbC5vcmcgd3JvdGUgb24gTW9uLCAxNyBKdWwgMjAyMyAxMjow
ODo0MyArMDUzMDoKCj4gT24gU3VuLCBKdWwgMTYsIDIwMjMgYXQgMDQ6NDY6MTJQTSArMDIwMCwg
TWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IFRoZSBuYWRkcnMgdmFyaWFibGUgaXMgaW5pdGlhbGl6
ZWQgYnV0IG5vdCB1c2VkLiBGaXhpbmcgdGhpcyBjb3VsZCBoYXZlCj4gPiBiZWVuIGEgbWF0dGVy
IG9mIGRyb3BwaW5nIHRoZSB2YXJpYWJsZSwgYnV0IHRoZSByaWdodCB3YXkgdG8gZG8gaXQgbG9v
a3MKPiA+IGEgYml0IG1vcmUgY29tcGxleDogd2UgY2FuIGF2b2lkIHVzZWxlc3Mgd3JpdGVzIHRv
IHRoZSBxX29wIHN0cnVjdHVyZSBieQo+ID4gdXNpbmcgaXQuIEluIHByYWN0aWNlIHdlIGNvdWxk
IGV2ZW4gaGF2ZSBwb3NzaWJsZSBvdXQtb2YtYm91bmQgYnVncyB3aXRoCj4gPiB0aGUgZXhpc3Rp
bmcgaW1wbGVtZW50YXRpb24uIExldCdzIGZpeCBhbGwgdGhhdCBieSBqdXN0IHBlcmZvcm1pbmcg
dGhlCj4gPiByaWdodCBudW1iZXIgb2YgYXNzaWdubWVudHMgaW4gdGhlIGFkZHJ7MSwyfV9yZWcg
ZmllbGRzLgo+ID4gCj4gPiBGaXhlczogODk1NTBiZWIwOThlICgibXRkOiByYXduYW5kOiBxY29t
OiBJbXBsZW1lbnQgZXhlY19vcCgpIikKPiA+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2Jv
dCA8bGtwQGludGVsLmNvbT4KPiA+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Ut
a2J1aWxkLWFsbC8yMDIzMDcxMzE5NTkuUGRQU0M4NkstbGtwQGludGVsLmNvbS8KPiA+IENsb3Nl
czogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDIzMDcxMzE3MzAuTk9Z
YmNqQnItbGtwQGludGVsLmNvbS8KPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+ICAKPiAKPiBMR1RNISBCdXQgSSdtIHJlbHlpbmcgb24g
U2FkcmUgdG8gdGVzdCBpdC4KPiAKPiBBY2tlZC1ieTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxt
YW5pQGtlcm5lbC5vcmc+CgpJIGRvbid0IHRoaW5rIEkndmUgcmVjZWl2ZWQgZmVlZGJhY2sgZnJv
bSBTYWRyZSwgSSB3b3VsZCBsaWtlIHRvIGNsb3NlCnRoZXNlIGlzc3VlcywgY2FuIHlvdSBwbGVh
c2UgdGVzdCBhbmQgZ2l2ZSB1cyBmZWVkYmFjaz8KClRoYW5rcyBhIGxvdCwKTWlxdcOobAoKPiAK
PiAtIE1hbmkKPiAKPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMu
YyB8IDEzICsrKysrKystLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gPiBp
bmRleCA0ZmM4ZGFmYThmMDMuLmRjOGNhNjBmYzJlMiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
cWNvbV9uYW5kYy5jCj4gPiBAQCAtMjYxNiwxMiArMjYxNiwxMyBAQCBzdGF0aWMgdm9pZCBxY29t
X3BhcnNlX2luc3RydWN0aW9ucyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ID4gIAkJCW9mZnNl
dCA9IG5hbmRfc3Vib3BfZ2V0X2FkZHJfc3RhcnRfb2ZmKHN1Ym9wLCBvcF9pZCk7Cj4gPiAgCQkJ
bmFkZHJzID0gbmFuZF9zdWJvcF9nZXRfbnVtX2FkZHJfY3ljKHN1Ym9wLCBvcF9pZCk7Cj4gPiAg
CQkJYWRkcnMgPSAmaW5zdHItPmN0eC5hZGRyLmFkZHJzW29mZnNldF07Cj4gPiAtCQkJZm9yIChp
ID0gMDsgaSA8IE1BWF9BRERSRVNTX0NZQ0xFOyBpKyspIHsKPiA+IC0JCQkJaWYgKGkgPCA0KQo+
ID4gLQkJCQkJcV9vcC0+YWRkcjFfcmVnIHw9ICh1MzIpYWRkcnNbaV0gPDwgaSAqIDg7Cj4gPiAt
CQkJCWVsc2UKPiA+IC0JCQkJCXFfb3AtPmFkZHIyX3JlZyB8PSBhZGRyc1tpXTsKPiA+IC0JCQl9
Cj4gPiArCj4gPiArCQkJZm9yIChpID0gMDsgaSA8IG1pbl90KHVuc2lnbmVkIGludCwgNCwgbmFk
ZHJzKTsgaSsrKQo+ID4gKwkJCQlxX29wLT5hZGRyMV9yZWcgfD0gYWRkcnNbaV0gPDwgKGkgKiA4
KTsKPiA+ICsKPiA+ICsJCQlpZiAobmFkZHJzID4gNCkKPiA+ICsJCQkJcV9vcC0+YWRkcjJfcmVn
IHw9IGFkZHJzWzRdOwo+ID4gKwo+ID4gIAkJCXFfb3AtPnJkeV9kZWxheV9ucyA9IGluc3RyLT5k
ZWxheV9uczsKPiA+ICAJCQlicmVhazsKPiA+ICAKPiA+IC0tIAo+ID4gMi4zNC4xCj4gPiAgIAo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
