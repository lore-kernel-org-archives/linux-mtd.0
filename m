Return-Path: <SRS0=AYH6=Y5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B312C5DF60
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 23:04:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CFCD206BA
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 23:04:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hJPT3Jm2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CFCD206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1pyTxyNpd8gGvaMY3d9cA7zSxY5dLExoAVjFgx6V9f4=; b=hJPT3Jm29L9yup
	ot685bFLhIAWqK3nHanWiWhEP57HxvLQgy+fthsopbHlTj/lyDlFHgGyYBsxH0btR6NihlSRFFWbZ
	2ioQqGNmovzEDWi+xQL4WidTj/PtRfBAXuwDyFZJNk89aqCoMzBpEYooOJA14GgvSdLAGkHjpGE0Z
	hCGO+dvfaTsmlsd3g+HmylPQAiNwtYzX5kTtVmZ9nB6qjIWLtlqebiKGp4iEgsDgwcrCXFc27FlUo
	KwajBXLl1Q6SHt/qlhNBb8R14kH1lA4rMQEB/sV8R9I7SNvpX1NToO8jKBWubDAeQRwNzVFKh5q0u
	b/cKha1zlzttDA0J7lvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS7ri-0003ig-HX; Tue, 05 Nov 2019 23:03:58 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS7rf-0003hO-3O
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2019 23:03:56 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 029076083247;
 Wed,  6 Nov 2019 00:03:45 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id YttQJIBwfaTv; Wed,  6 Nov 2019 00:03:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E7A25608325B;
 Wed,  6 Nov 2019 00:03:42 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Ixxa3dKDNkm8; Wed,  6 Nov 2019 00:03:42 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id BD6116083247;
 Wed,  6 Nov 2019 00:03:42 +0100 (CET)
Date: Wed, 6 Nov 2019 00:03:42 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <1718371158.75883.1572995022606.JavaMail.zimbra@nod.at>
In-Reply-To: <20191105200344.1e8c3eab@xps13>
References: <20191021193343.41320-1-kdasu.kdev@gmail.com>
 <20191105200344.1e8c3eab@xps13>
Subject: Re: [PATCH] mtd: set mtd partition panic write flag
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: set mtd partition panic write flag
Thread-Index: TMsKjlq8YvqFfxDXeku9945usY1L9w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_150355_288440_26D89948 
X-CRM114-Status: GOOD (  13.11  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IEFuOiAiS2FtYWwgRGFzdSIgPGtkYXN1LmtkZXZA
Z21haWwuY29tPgo+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5v
cmc+LCAiYmNtLWtlcm5lbC1mZWVkYmFjay1saXN0IiA8YmNtLWtlcm5lbC1mZWVkYmFjay1saXN0
QGJyb2FkY29tLmNvbT4sCj4gImxpbnV4LWtlcm5lbCIgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc+LCAiRGF2aWQgV29vZGhvdXNlIiA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4sICJCcmlhbiBO
b3JyaXMiCj4gPGNvbXB1dGVyc2ZvcnBlYWNlQGdtYWlsLmNvbT4sICJNYXJlayBWYXN1dCIgPG1h
cmVrLnZhc3V0QGdtYWlsLmNvbT4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiVmlnbmVz
aCBSYWdoYXZlbmRyYSIKPiA8dmlnbmVzaHJAdGkuY29tPgo+IEdlc2VuZGV0OiBEaWVuc3RhZywg
NS4gTm92ZW1iZXIgMjAxOSAyMDowMzo0NAo+IEJldHJlZmY6IFJlOiBbUEFUQ0hdIG10ZDogc2V0
IG10ZCBwYXJ0aXRpb24gcGFuaWMgd3JpdGUgZmxhZwoKPiBIaSBLYW1hbCwKPiAKPiBSaWNoYXJk
LCBzb21ldGhpbmcgdG8gbG9vayBpbnRvIGJlbG93IDopCgpJJ20gc3RpbGwgcmVjb3ZlcmluZyBm
cm9tIGEgYmFkIGNvbGQuIFNvIG15IGJyYWluIGlzIG5vdCBmdWxseSB3b3JraW5nIDspCiAKPiBL
YW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4gd3JvdGUgb24gTW9uLCAyMSBPY3QgMjAx
OSAxNTozMjo1Mgo+IC0wNDAwOgo+IAo+PiBDaGVjayBtdGQgcGFuaWMgd3JpdGUgZmxhZyBhbmQg
c2V0IHRoZSBtdGQgcGFydGl0aW9uIHBhbmljCj4+IHdyaXRlIGZsYWcgc28gdGhhdCBsb3cgbGV2
ZWwgZHJpdmVycyBjYW4gdXNlIGl0IHRvIHRha2UKPj4gcmVxdWlyZWQgYWN0aW9uIHRvIGVuc3Vy
ZSBvb3BzIGRhdGEgZ2V0cyB3cml0dGVuIHRvIGFzc2lnbmVkCj4+IG10ZCBwYXJ0aXRpb24uCj4g
Cj4gSSBmZWVsIHRoZXJlIGlzIHNvbWV0aGluZyB3cm9uZyB3aXRoIHRoZSBjdXJyZW50IGltcGxl
bWVudGF0aW9uCj4gcmVnYXJkaW5nIHBhcnRpdGlvbnMgYnV0IEkgYW0gbm90IHN1cmUgdGhpcyBp
cyB0aGUgcmlnaHQgZml4LiBJcyB0aGlzCj4gc29tZXRoaW5nIHlvdSBkZXRlY3RlZCB3aXRoIHNv
bWUga2luZCBvZiBzdGF0aWMgY2hlY2tlciBvciBkaWQgeW91Cj4gYWN0dWFsbHkgZXhwZXJpZW5j
ZSBhbiBpc3N1ZT8KPiAKPiBJbiB0aGUgY29tbWl0IGxvZyB5b3Ugc2F5ICJjaGVjayBtdGQgKEkg
c3VwcG9zZSB5b3UgbWVhbiB0aGUKPiBtYXN0ZXIpIHBhbmljIHdyaXRlIGZsYWcgYW5kIHNldCB0
aGUgbXRkIHBhcnRpdGlvbiBwYW5pYyB3cml0ZSBmbGFnIgo+IHdoaWNoIG1ha2VzIHNlbnNlLCBi
dXQgaW4gcmVhbGl0eSBteSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgeW91IGRvIHRoZQo+IG9wcG9z
aXRlOiB5b3UgY2hlY2sgbXRkLT5vb3BzX3BhbmljX3dyaXRlIHdoaWNoIGlzIHRoZSBwYXJ0aXRp
b25zJwo+IHN0cnVjdHVyZSwgYW5kIHNldCBwYXJ0LT5wYXJlbnQtPm9vcHNfcGFuaWNfd3JpdGUg
d2hpY2ggaXMgdGhlIG1hc3RlcidzCj4gZmxhZy4KCklJVUMgdGhlIHByb2JsZW0gaGFwcGVucyB3
aGVuIHlvdSBydW4gbXRkb29wcyBvbiBhIG10ZCBwYXJ0aXRpb24uClRoZSB0aGUgZmxhZyBpcyBv
bmx5IHNldCBmb3IgdGhlIHBhcnRpdGlvbiBpbnN0ZWFkIGZvciB0aGUgbWFzdGVyLgoKU28gdGhl
IHJpZ2h0IGZpeCB3b3VsZCBiZSBzZXR0aW5nIHRoZSBwYXJlbnQncyBvb3BzX3BhbmljX3dyaXRl
IGluCm10ZF9wYW5pY193cml0ZSgpLgpUaGVuIHdlIGRvbid0IGhhdmUgdG8gdG91Y2ggbXRkcGFy
dC5jCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
