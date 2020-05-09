Return-Path: <SRS0=nfTR=6X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78960C47255
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 22:30:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F6A520A8B
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 22:30:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jTPCTW+I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F6A520A8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XtLjb+DkHu/LDrSIDSLLGTA8jpzSwHHE69ovcG2F05I=; b=jTPCTW+ICbGlNV
	3euVFSbHGWDj/T+W0SZCkoWJoG2OFcqtj4BbQWel31cAebeadKAeRgCWcdL68zl8Tg9YgGUH30jcP
	6XN5c+9VHNuaHO9GxMcxnkpWgyP5gVZPLrEIilv3G0QdKSuzhh0ueu5JQ4jToqm/Kyv02Wv/dPACt
	V/SxgUiMoZdSAe+37czvmlgpG5IfTbU0WbLB7xb9j9kQsBLNTtM/U+mYr3BBTsnlBbenm7xc52oIH
	SgnfIf+b7wIDnFpO6BiBHREIgfVd/lqxCMrmrkSjw1LOf0aqtqR9gRumwC7DUbX642bdP2cX+kpXT
	4qXem8iQMMoNX57++LoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXXyo-0003r7-Gx; Sat, 09 May 2020 22:29:58 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXXyl-0003qB-EX
 for linux-mtd@lists.infradead.org; Sat, 09 May 2020 22:29:57 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0BCC9FF803;
 Sat,  9 May 2020 22:29:50 +0000 (UTC)
Date: Sun, 10 May 2020 00:29:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 06/17] mtd: rawnand: nandsim: Remove debugfs entries at
 unload time
Message-ID: <20200510002949.6ef593ba@xps13>
In-Reply-To: <1221365235.202803.1589056980096.JavaMail.zimbra@nod.at>
References: <20200509191431.15862-1-miquel.raynal@bootlin.com>
 <20200509191431.15862-7-miquel.raynal@bootlin.com>
 <1221365235.202803.1589056980096.JavaMail.zimbra@nod.at>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_152955_627603_CCD9317F 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: dedekind@infradead.org, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmljaGFyZCwKClJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+IHdyb3RlIG9u
IFNhdCwgOSBNYXkgMjAyMCAyMjo0MzowMAorMDIwMCAoQ0VTVCk6Cgo+IC0tLS0tIFVyc3Byw7xu
Z2xpY2hlIE1haWwgLS0tLS0KPiA+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPgo+ID4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiVmlnbmVz
aCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4sICJUdWRvciBBbWJhcnVzIiA8VHVkb3Iu
QW1iYXJ1c0BtaWNyb2NoaXAuY29tPiwKPiA+ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMu
aW5mcmFkZWFkLm9yZz4KPiA+IENDOiAiQm9yaXMgQnJlemlsbG9uIiA8Ym9yaXMuYnJlemlsbG9u
QGNvbGxhYm9yYS5jb20+LCBkZWRla2luZEBpbmZyYWRlYWQub3JnLCAiTWlxdWVsIFJheW5hbCIK
PiA+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gR2VzZW5kZXQ6IFNhbXN0YWcsIDku
IE1haSAyMDIwIDIxOjE0OjE5Cj4gPiBCZXRyZWZmOiBbUEFUQ0ggMDYvMTddIG10ZDogcmF3bmFu
ZDogbmFuZHNpbTogUmVtb3ZlIGRlYnVnZnMgZW50cmllcyBhdCB1bmxvYWQgdGltZSAgCj4gCj4g
PiBDcmVhdGUgYSBuc19kZWJ1Z2ZzX3JlbW92ZSgpIGhlbHBlciBmb3IgdGhhdCBhbmQgY2FsbCBp
dCBpbgo+ID4gbnNfY2xlYW51cF9tb2R1bGUoKS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+IC0tLQo+ID4gZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbmFuZHNpbS5jIHwgNiArKysrKysKPiA+IDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L25hbmRzaW0uYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRzaW0uYwo+ID4gaW5kZXggYzhl
OWM3MGE2NjQxLi43ODYyYzY1ZTMyYWQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9uYW5kc2ltLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRzaW0uYwo+
ID4gQEAgLTUyMCw2ICs1MjAsMTEgQEAgc3RhdGljIGludCBuc19kZWJ1Z2ZzX2NyZWF0ZShzdHJ1
Y3QgbmFuZHNpbSAqbnMpCj4gPiAJcmV0dXJuIDA7Cj4gPiB9Cj4gPiAKPiA+ICtzdGF0aWMgdm9p
ZCBuc19kZWJ1Z2ZzX3JlbW92ZShzdHJ1Y3QgbmFuZHNpbSAqbnMpCj4gPiArewo+ID4gKwlkZWJ1
Z2ZzX3JlbW92ZShucy0+ZGVudCk7Cj4gPiArfQo+ID4gKwo+ID4gLyoKPiA+ICAqIEFsbG9jYXRl
IGFycmF5IG9mIHBhZ2UgcG9pbnRlcnMsIGNyZWF0ZSBzbGFiIGFsbG9jYXRpb24gZm9yIGFuIGFy
cmF5Cj4gPiAgKiBhbmQgaW5pdGlhbGl6ZSB0aGUgYXJyYXkgYnkgTlVMTCBwb2ludGVycy4KPiA+
IEBAIC0yMzk4LDYgKzI0MDMsNyBAQCBzdGF0aWMgdm9pZCBfX2V4aXQgbnNfY2xlYW51cF9tb2R1
bGUodm9pZCkKPiA+IAlzdHJ1Y3QgbmFuZHNpbSAqbnMgPSBuYW5kX2dldF9jb250cm9sbGVyX2Rh
dGEoY2hpcCk7Cj4gPiAJaW50IGk7Cj4gPiAKPiA+ICsJbnNfZGVidWdmc19yZW1vdmUobnMpOwo+
ID4gCW5zX2ZyZWUobnMpOyAgICAvKiBGcmVlIG5hbmRzaW0gcHJpdmF0ZSByZXNvdXJjZXMgKi8g
IAo+IAo+IFdoeSBpcyB0aGlzIHNwZWNpYWwgYW5kIGNhbm5vdCBkb25lIGluIG5zX2ZyZWUoKT8K
PiAKCm5zX2RlYnVnZnNfY3JlYXRlKCkgaXMgY2FsbGVkIGluIG5zX2luaXRfbW9kdWxlKCksIHNv
IGZvciBtZSBpdCBpcwpuYXR1cmFsIHRvIGNhbGwgbnNfZGVidWdmc19yZW1vdmUgaW4gbnNfY2xl
YW51cF9tb2R1bGUoKS4gTW9yZSB0aGFuCmNhbGxpbmcgaXQgZnJvbSBuc19mcmVlKCkgd2hpY2gg
aXMgdGhlIHN5bW1ldHJ5IG9mIG5zX2luaXQoKS4gTm8/CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
