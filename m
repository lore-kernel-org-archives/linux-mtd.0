Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6781C0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBIecpYyG1keNHOzmOEWLWylMiCmKijfZoOZA+P5LWo=; b=2YvBjVYVYIubcW
	OJ7y+au6mr/gotZzvN2boB1I40KuYQQTwQdmbVEU+vEqEZl/sMFEsfRxrrJNXQWvF04C5ONScg3ML
	fFEM4cUp/jWCs0q3nN5Cb6cMHngWDYsMIOKqKSkiR72THD4It+HrcplsrNZqQejCk/TRsTnbsE03V
	gEBVZWwSddTKxzMtYNPJTMOStrojz1Vs9iV4/HaKSv+kHoSEzAx+XSsGZxBJEtgsPZDoDZv7O2Mx4
	o2lCpN9vdjvd094hfC8o5lAeN0XnCPvMMHzp0zNHn/c15S6wA2nXcoMuQMFUhBZcSz3wmL2exviy4
	QfL4C7SOAidNdqPEqNiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0DR-005Uf3-1d;
	Wed, 19 Jul 2023 05:59:13 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0DJ-005Ua9-20
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XBN2hYgkZC+vX2/vBakjoME0dxps0dBkBhnZWQPKiLs=; b=SiN/ld3K/A6l5Gm+9hcqFbrMvH
	0lYYQep8PynR94Vjdw4Ou4CTv62udrm+ay9CKZC4yPB2nB2XungDlxK0BV54MMvKlZE8Ihvn8+O5R
	5I3tTzpCmY8thKG5RPNUleCvULyaKo/6lbNEJXw/4ItaYlfi/bcQ8Jbk4OvJXRhKJ8dr5JL6XNKfV
	Z1K6jQgOdriEQPlHWPkNMzz27rhrH8kInlkl5GIF7v0Csm1SYQxVCLIoj7KfZzwnYUEJpQKI7sKeS
	eGdcZWblAbu6lCgIOsClmDTbmT6HE9DtduZ1mcFY5ziPEpqNYUDnDFO4i8t1B4b7rMd4G13ZjYx+u
	w7rI6ARg==;
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLU7i-009FWt-1t
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 19:43:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D659E1BF206;
	Mon, 17 Jul 2023 19:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689622948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBN2hYgkZC+vX2/vBakjoME0dxps0dBkBhnZWQPKiLs=;
	b=UZlw3ThIPhfB0CmBrpMhZwVxCED6vFYJJwuDlhoSqA8tLKVL7D/rPCapNN98zleSbsa6As
	vlZJsgm6+QsyQpAymX5t2KImlJfSFd5UTSBMJpUjhljQ4hTfD/pppYPrA8N9R9kpiuUTHe
	F4hF873Jzzg2TqZcFlVQYleaC8T5BMs/kSPvjPrI/aq0llu3nnDuh2X1yZcyBPHPR1RSJT
	UzSblPMTFC3WVIp+oRwDDbm13rIi8PtqJRch9XRN8op340K/tdDTdxBli3fYH2fgHlW9i6
	1vlF+vT9kQ377Gj/l3cDr9J9PWRiWFO7nMdM7ZGqENgZrhd5rpIccGZGTYb8nw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/3] mtd: rawnand: pl353: Ensure program page operations are successful
Date: Mon, 17 Jul 2023 21:42:21 +0200
Message-Id: <20230717194221.229778-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717194221.229778-1-miquel.raynal@bootlin.com>
References: <20230717194221.229778-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_204312_717336_3A2D9AAF 
X-CRM114-Status: GOOD (  14.31  )
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

VGhlIE5BTkQgY29yZSBjb21wbGllcyB3aXRoIHRoZSBPTkZJIHNwZWNpZmljYXRpb24sIHdoaWNo
IGl0c2VsZgptZW50aW9ucyB0aGF0IGFmdGVyIGFueSBwcm9ncmFtIG9yIGVyYXNlIG9wZXJhdGlv
biwgYSBzdGF0dXMgY2hlY2sKc2hvdWxkIGJlIHBlcmZvcm1lZCB0byBzZWUgd2hldGhlciB0aGUg
b3BlcmF0aW9uIHdhcyBmaW5pc2hlZCAqYW5kKgpzdWNjZXNzZnVsLgoKVGhlIE5BTkQgY29yZSBv
ZmZlcnMgaGVscGVycyB0byBmaW5pc2ggYSBwYWdlIHdyaXRlIChzZW5kaW5nIHRoZQoiUEFHRSBQ
Uk9HIiBjb21tYW5kLCB3YWl0aW5nIGZvciB0aGUgTkFORCBjaGlwIHRvIGJlIHJlYWR5IGFnYWlu
LCBhbmQKY2hlY2tpbmcgdGhlIG9wZXJhdGlvbiBzdGF0dXMpLiBCdXQgaW4gc29tZSBjYXNlcywg
YWR2YW5jZWQgY29udHJvbGxlcgpkcml2ZXJzIG1pZ2h0IHdhbnQgdG8gb3B0aW1pemUgdGhpcyBh
bmQgY3JhZnQgdGhlaXIgb3duIHBhZ2Ugd3JpdGUKaGVscGVyIHRvIGxldmVyYWdlIGFkZGl0aW9u
YWwgaGFyZHdhcmUgY2FwYWJpbGl0aWVzLCB0aHVzIG5vdCBhbHdheXMKdXNpbmcgdGhlIGNvcmUg
ZmFjaWxpdGllcy4KClNvbWUgZHJpdmVycywgbGlrZSB0aGlzIG9uZSwgZG8gbm90IHVzZSB0aGUg
Y29yZSBoZWxwZXIgdG8gZmluaXNoIGEgcGFnZQp3cml0ZSBiZWNhdXNlIHRoZSBmaW5hbCBjeWNs
ZXMgYXJlIGF1dG9tYXRpY2FsbHkgbWFuYWdlZCBieSB0aGUKaGFyZHdhcmUuIEluIHRoaXMgY2Fz
ZSwgdGhlIGFkZGl0aW9uYWwgY2FyZSBtdXN0IGJlIHRha2VuIHRvIG1hbnVhbGx5CnBlcmZvcm0g
dGhlIGZpbmFsIHN0YXR1cyBjaGVjay4KCkxldCdzIHJlYWQgdGhlIE5BTkQgY2hpcCBzdGF0dXMg
YXQgdGhlIGVuZCBvZiB0aGUgcGFnZSB3cml0ZSBoZWxwZXIgYW5kCnJldHVybiAtRUlPIHVwb24g
ZXJyb3IuCgpDYzogTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT4KQ2M6IHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmcKRml4ZXM6IDA4ZDhjNjIxNjRhMyAoIm10ZDogcmF3bmFuZDogcGwz
NTM6IEFkZCBzdXBwb3J0IGZvciB0aGUgQVJNIFBMMzUzIFNNQyBOQU5EIGNvbnRyb2xsZXIiKQpT
aWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoK
LS0tCgpIZWxsbyBNaWNoYWwsCgpTYW1lIGFzIGZvciB0aGUgQXJhc2FuIGNvbnRyb2xsZXIsIHRo
aXMgaXMgbm90IHRlc3RlZCwgYnV0IEkgYmVsaWV2ZSBpdAppcyByZXF1aXJlZC4gTGV0IG1lIGtu
b3cgaG93IHRlc3RpbmcgZ29lcy4KClRoYW5rcywKTWlxdcOobAotLS0KIGRyaXZlcnMvbXRkL25h
bmQvcmF3L3BsMzV4LW5hbmQtY29udHJvbGxlci5jIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9w
bDM1eC1uYW5kLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3BsMzV4LW5hbmQt
Y29udHJvbGxlci5jCmluZGV4IDI4YjdiZDdlMjJlYi4uOWRkMDZlZWIwMjFlIDEwMDY0NAotLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9wbDM1eC1uYW5kLWNvbnRyb2xsZXIuYworKysgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9wbDM1eC1uYW5kLWNvbnRyb2xsZXIuYwpAQCAtNTEzLDYgKzUxMyw3
IEBAIHN0YXRpYyBpbnQgcGwzNXhfbmFuZF93cml0ZV9wYWdlX2h3ZWNjKHN0cnVjdCBuYW5kX2No
aXAgKmNoaXAsCiAJdTMyIGFkZHIxID0gMCwgYWRkcjIgPSAwLCByb3c7CiAJdTMyIGNtZF9hZGRy
OwogCWludCBpLCByZXQ7CisJdTggc3RhdHVzOwogCiAJcmV0ID0gcGwzNXhfc21jX3NldF9lY2Nf
bW9kZShuZmMsIGNoaXAsIFBMMzVYX1NNQ19FQ0NfQ0ZHX01PREVfQVBCKTsKIAlpZiAocmV0KQpA
QCAtNTY1LDYgKzU2NiwxNCBAQCBzdGF0aWMgaW50IHBsMzV4X25hbmRfd3JpdGVfcGFnZV9od2Vj
YyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAogCWlmIChyZXQpCiAJCWdvdG8gZGlzYWJsZV9lY2Nf
ZW5naW5lOwogCisJLyogQ2hlY2sgd3JpdGUgc3RhdHVzIG9uIHRoZSBjaGlwIHNpZGUgKi8KKwly
ZXQgPSBuYW5kX3N0YXR1c19vcChjaGlwLCAmc3RhdHVzKTsKKwlpZiAocmV0KQorCQlnb3RvIGRp
c2FibGVfZWNjX2VuZ2luZTsKKworCWlmIChzdGF0dXMgJiBOQU5EX1NUQVRVU19GQUlMKQorCQly
ZXQgPSAtRUlPOworCiBkaXNhYmxlX2VjY19lbmdpbmU6CiAJcGwzNXhfc21jX3NldF9lY2NfbW9k
ZShuZmMsIGNoaXAsIFBMMzVYX1NNQ19FQ0NfQ0ZHX01PREVfQllQQVNTKTsKIAotLSAKMi4zNC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
