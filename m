Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37BEC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:00:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 452BA610A5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 452BA610A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qdOzR2VpYGg6D1JRfItOz/0W9hL2iapCatc3Mcsq2Mc=; b=GXs5DNHXUoIImIYLaMx7aEM5Eo
	vnrCxvIH35Ipeuq3l9Z8OEYDwKDj1AvrrowNCFFgYdjZ3tIx9RnY9fTbNrLV02istNK4KKPoaF2Gw
	B9YB+HQVZU3rhOC5SJoVVb2SVJ5AslyIJPUhhCyl2e+YYQ/XKpM30nqWMjPPo0/g4owfNVoIh4t/T
	Tlg1wVxqSdGdF+Rczth92ZnG1hq+kXZTJak6pVeS7x44+bEMkojLO1QG8Eh95aEflkpRw5OAHeqqC
	PLc2nVHtXg3JymwhfITHsyb6HkMJubk13DeUbtruXlngH4c+telWyc68EchWjjbC+61Rzhw2L6kvS
	OW6Jc02g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYNN3-00GKYp-6Y; Thu, 07 Oct 2021 06:59:13 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYNMz-00GKXE-N3
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 06:59:11 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 079DC61B8F39;
 Thu,  7 Oct 2021 08:59:05 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id MsTuCasGed6T; Thu,  7 Oct 2021 08:59:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5F45A61B8F5A;
 Thu,  7 Oct 2021 08:59:04 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dzbW2WUixznh; Thu,  7 Oct 2021 08:59:04 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3BA2461B8F39;
 Thu,  7 Oct 2021 08:59:04 +0200 (CEST)
Date: Thu, 7 Oct 2021 08:59:03 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Message-ID: <837215091.45041.1633589943979.JavaMail.zimbra@nod.at>
In-Reply-To: <20211005144936.xnkzugjr3oygauei@lug-owl.de>
References: <20211001192836.n6eek7rno7ewvmu7@lug-owl.de>
 <20211005144936.xnkzugjr3oygauei@lug-owl.de>
Subject: Re: PING: [PATCH] Don't overflow when writing a key
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF92 (Linux)/8.8.12_GA_3809)
Thread-Topic: PING: [PATCH] Don't overflow when writing a key
Thread-Index: +Bp2Zyfw65UU/scTJm1o0Kxf69rEaA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_235909_944351_C998DA7E 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkphbi1CZW5lZGljdCBHbGF3
IiA8amJnbGF3QGx1Zy1vd2wuZGU+Cj4gQW46ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMu
aW5mcmFkZWFkLm9yZz4KPiBDQzogIkFydGVtIEJpdHl1dHNraXkiIDxhcnRlbS5iaXR5dXRza2l5
QGxpbnV4LmludGVsLmNvbT4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4gR2VzZW5kZXQ6
IERpZW5zdGFnLCA1LiBPa3RvYmVyIDIwMjEgMTY6NDk6MzYKPiBCZXRyZWZmOiBQSU5HOiBbUEFU
Q0hdIERvbid0IG92ZXJmbG93IHdoZW4gd3JpdGluZyBhIGtleQoKPiBIaSwKPiAKPiBPbiBGcmks
IDIwMjEtMTAtMDEgMjE6Mjg6MzYgKzAyMDAsIEphbi1CZW5lZGljdCBHbGF3IDxqYmdsYXdAbHVn
LW93bC5kZT4gd3JvdGU6Cj4+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9rZXkuaCBiL2ZzL3ViaWZz
L2tleS5oCj4+IGluZGV4IDgxNDJkOWQ2ZmU1ZC4uNDBlZGNjYTdiYTYyIDEwMDY0NAo+PiAtLS0g
YS9mcy91Ymlmcy9rZXkuaAo+PiArKysgYi9mcy91Ymlmcy9rZXkuaAo+PiBAQCAtNDM2LDcgKzQz
Niw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBrZXlfd3JpdGUoY29uc3Qgc3RydWN0IHViaWZzX2lu
Zm8gKmMsCj4+ICAKPj4gIAl0LT5qMzJbMF0gPSBjcHVfdG9fbGUzMihmcm9tLT51MzJbMF0pOwo+
PiAgCXQtPmozMlsxXSA9IGNwdV90b19sZTMyKGZyb20tPnUzMlsxXSk7Cj4+IC0JbWVtc2V0KHRv
ICsgOCwgMCwgVUJJRlNfTUFYX0tFWV9MRU4gLSA4KTsKPj4gKwltZW1zZXQodG8gKyA4LCAwLCBV
QklGU19TS19MRU4gLSA4KTsKPj4gIH0KPj4gIAo+PiAgLyoqCj4gCj4gSSB3YW50ZWQgdG8gZ2l2
ZSB0aGlzIGxpdHRsZSBwYXRjaCBhIHBpbmcgc2luY2UgdGhlcmUgd2Fzbid0IGEgcmVwbHkKCklu
IE1URCdzIHBhdGNod29yayBpdCBpcyBtYXJrZWQgYXMgIlVuZGVyIHJldmlldyIsIHNvIGl0IGlz
IG5vdCBsb3N0LgoKPiB1bnRpbCBub3cgYW5kIEkgdGhpbmsgaXQgbWlnaHQgZml4IGFuIG92ZXJm
bG93LgoKWW91ciBmaXggbG9va3MgbGVnaXQgYnV0IHNpbmNlIEknbSB0cmF2ZWxpbmcgSSBuZWVk
IHRvIGdpdmUgaXQgYSBkZWVwZXIKdGhvdWdodCB3aGVuIEknbSBiYWNrIGhvbWUuCkknbSBhIGxp
dHRsZSBwdXp6bGVkIHdoeSBub2JvZHkgbm90aWNlZCB0aGUgc3RhY2sgY29ycnVwdGlvbiBzbyBm
YXIsCmtleV93cml0ZSgpIGhhcyBiZWVuIGRvaW5nIHNpbmNlIGV2ZXIuCgpUaGFua3MsCi8vcmlj
aGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
