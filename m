Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB80C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 20:31:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFF9761601
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 20:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFF9761601
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D/Pwbz1rKMpsZeLuIrmbBnhvvun7/6Q7FYP/K6YUuNE=; b=QifpyMXHjgkroZxOOfUhaABW/E
	XSWWI+UUNlR3b7ZknEDTWhu5mVKmN2oHfnEJ4Yeb7MSGAUeFSYQbLEGDo7uI2dctMJgNHSDRha0R2
	CHDDX9d2IO+m07c60bXlRlStE18M2gRwBvtGCY32BPn/ABVhK1eeYYlXWtjMWWwy5pe9D9g8Jp5lm
	0V8ieZ6tds7kVwzAPcZ56up+Up/k/v52qTODlfinX30uOGa/z1pKkT4HPa/fNz0cH0QY46gdXLZjf
	5zpDel2vMr9diL/iuReC5SoQOCrApjmSvek8Mij7ppI1v9CBNJpV7l0I++ddQKY2/cZwE/Lo8cXOA
	XD469OjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4rSe-0002Bp-Ge; Wed, 27 Jan 2021 20:30:44 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4rSN-00026b-Ng
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 20:30:30 +0000
X-Originating-IP: 86.210.203.150
Received: from localhost.localdomain
 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr [86.210.203.150])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 8C0751BF210;
 Wed, 27 Jan 2021 20:30:21 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 0/9] Better solution for the OMAP fix
Date: Wed, 27 Jan 2021 21:30:11 +0100
Message-Id: <20210127203020.9574-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_153028_032817_72BBF772 
X-CRM114-Status: GOOD (  10.69  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Adam Ford <aford173@gmail.com>, ladis@triops.cz,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpJIHJlY2VudGx5IGdvdCBhIGJ1ZyByZXBvcnQgcmVnYXJkaW5nIHRoZSBPTUFQIGRy
aXZlci4gV2UgZml4ZWQgaXQgYW5kCm1lcmdlZCB0aGUgZml4LiBUaGlzIGZpeCB3YXMgaW52b2x2
aW5nIGFjY2Vzc2luZyBCQ0ggaW50ZXJuYWwgdmFsdWVzCmZyb20gd2l0aGluIHRoZSBPTUFQIGRy
aXZlciB3aGljaCBpcyBmYXIgZnJvbSBpZGVhbC4KCk5vdyB0aGF0IHRoZSB1cmdlbmNlIGlzIGdv
bmUsIGhlcmUgaXMgYSBzZXJpZXMgdG8gZG8gaXQgInRoZSBwcm9wZXIKd2F5Ii4KCkNoZWVycywK
TWlxdcOobAoKTWFpbiBjaGFuZ2VzIGluIHYzOgoqIEV4cG9ydCB0aGUgbnVtYmVyIG9mIEVDQyBz
dGVwcwoqIEFkZCBhICdnZXQgbnVtYmVyIG9mIEVDQyBieXRlcyBwZXIgc3RlcCcgaGVscGVyLgoK
TWlxdWVsIFJheW5hbCAoOSk6CiAgbXRkOiBuYW5kOiBMZXQgRUNDIGVuZ2luZXMgYWR2ZXJ0aXpl
IHRoZSBleGFjdCBudW1iZXIgb2Ygc3RlcHMKICBtdGQ6IG5hbmQ6IGVjYy1iY2g6IFBvcHVsYXRl
IHRoZSBwdWJsaWMgbnN0ZXBzIGZpZWxkCiAgbXRkOiBuYW5kOiBlY2MtaGFtbWluZzogUG9wdWxh
dGUgdGhlIHB1YmxpYyBuc3RlcHMgZmllbGQKICBtdGQ6IG5hbmQ6IEFkZCBhIGhlbHBlciB0byBy
ZXRyaWV2ZSB0aGUgbnVtYmVyIG9mIEVDQyBzdGVwcwogIG10ZDogbmFuZDogQWRkIGEgaGVscGVy
IHRvIHJldHJpZXZlIHRoZSBudW1iZXIgb2YgRUNDIGJ5dGVzIHBlciBzdGVwCiAgbXRkOiByYXdu
YW5kOiBUcnkgbm90IHRvIHVzZSB0aGUgRUNDIHByaXZhdGUgc3RydWN0dXJlcwogIG10ZDogcmF3
bmFuZDogb21hcDogVXNlIEVDQyBpbmZvcm1hdGlvbiBmcm9tIHRoZSBnZW5lcmljIHN0cnVjdHVy
ZXMKICBtdGQ6IG5hbmQ6IGVjYy1iY2g6IFVzZSB0aGUgcHVibGljIG5zdGVwcyBmaWVsZAogIG10
ZDogbmFuZDogZWNjLWhhbW1pbmc6IFVzZSB0aGUgcHVibGljIG5zdGVwcyBmaWVsZAoKIGRyaXZl
cnMvbXRkL25hbmQvZWNjLXN3LWJjaC5jICAgICAgICAgICB8IDEwICsrKysrLS0tLS0KIGRyaXZl
cnMvbXRkL25hbmQvZWNjLXN3LWhhbW1pbmcuYyAgICAgICB8IDEwICsrKysrLS0tLS0KIGRyaXZl
cnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jICAgICAgICB8IDE2ICsrKysrKystLS0tLS0tLS0K
IGRyaXZlcnMvbXRkL25hbmQvcmF3L29tYXAyLmMgICAgICAgICAgICB8IDE0ICsrKysrKysrLS0t
LS0tCiBpbmNsdWRlL2xpbnV4L210ZC9uYW5kLWVjYy1zdy1iY2guaCAgICAgfCAgMiAtLQogaW5j
bHVkZS9saW51eC9tdGQvbmFuZC1lY2Mtc3ctaGFtbWluZy5oIHwgIDIgLS0KIGluY2x1ZGUvbGlu
dXgvbXRkL25hbmQuaCAgICAgICAgICAgICAgICB8IDIyICsrKysrKysrKysrKysrKysrKysrKysK
IDcgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pCgotLSAK
Mi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
