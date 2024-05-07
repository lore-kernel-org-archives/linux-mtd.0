Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E63C10F1A
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2024 08:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ujolTT3Mb1w5yIo8YNZqluu3u5mfpCY5qkJSjWRsjc4=; b=Y3dNvoV7KZLaCZ
	iO0XGkEEZQBs8TBVrQ9sxddEMMEXYZi1vOdpNyAWvn21s3bgU6NqqwTITC/vNOU1gMZxRqX7QmW3/
	xKikfP1om9dG61iIiPbJpUfl+74ya4gJmwG2DZZaFAoqNwU8HuRnnSu1UJxG29RAVDTgMKIvC9hSL
	LPh/R3ZG3Ea1zf0/D4s0Fe+117GtNwGqCilJuCucMEDvE25wf3zDghfuVLQBI/CWBWv+2UJwpsDWr
	0OJ9Iasn3SHKsdHk3w/JXm+TNF7p8/eTcylzHYIQdPcmdc0cClf9O9ccIyY35QcDOZxFneCMyC5rx
	UGrcyoZ+BKZ1mwk4BrGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4GfE-0000000ADU4-0Fvy;
	Tue, 07 May 2024 08:59:08 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Gf5-0000000ADSt-1Wf9
	for linux-mtd@lists.infradead.org;
	Tue, 07 May 2024 08:59:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 525711BF208;
	Tue,  7 May 2024 08:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715072324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a2sHF3ypEAiEpeHREQw270xHX0lb0//dUYs40hlXNE8=;
	b=bTVq2gkSqk6FKob/jyCEmCCnfPOvQ8h/4EGY7Zxu9FmE/5MAShOQd3K3Nnjz642jMgVVgc
	nhMb4ZrwKUJVMKuZbwAwBxgeCtCi9mxHDy4miCjkugz2kftrYmualM6ISAF1FvvS5cSlHu
	oDubIS3KuhWqxy+8Rh5KPyNdwg6CHGnGnIWtR2SYMpUY5e3p+YRNfhfyK1TqNMJYf//v65
	n9iT+M6bvWKXI2EfKC1ZZTxKczPkEYeyxDJ3DtrkHcOeEdv/k5yhINfzI1ugFfqe/0732n
	+DIrV2UQxtCpflT+0yngNyVLqQCesFxyRxot2c9z3b5e/V0I55F9La4cNPHegw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] mtd: rawnand: Ensure ECC configuration is propagated to upper layers
Date: Tue,  7 May 2024 10:58:42 +0200
Message-Id: <20240507085842.108844-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_015859_937848_55A12332 
X-CRM114-Status: GOOD (  14.82  )
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

VW50aWwgcmVjZW50bHkgdGhlICJ1cHBlciBsYXllciIgd2FzIE1URC4gQnV0IGZvbGxvd2luZyBp
bmNyZW1lbnRhbApyZXdvcmtzIHRvIGJyaW5nIHNwaS1uYW5kIHN1cHBvcnQgYW5kIG1vcmUgcmVj
ZW50bHkgZ2VuZXJpYyBFQ0Mgc3VwcG9ydCwKdGhlcmUgaXMgbm93IGFuIGludGVybWVkaWF0ZSAi
Z2VuZXJpYyBOQU5EIiBsYXllciB0aGF0IGFsc28gbmVlZHMgdG8gZ2V0CmFjY2VzcyB0byBzb21l
IHZhbHVlcy4gV2hlbiB1c2luZyAiY29udmVydGVkIiBFQ0MgZW5naW5lcywgbGlrZSB0aGUKc29m
dHdhcmUgb25lcywgdGhlc2UgdmFsdWVzIGFyZSBhbHJlYWR5IHByb3BhZ2F0ZWQgY29ycmVjdGx5
LiBCdXQKb3RoZXJ3aXNlIHdoZW4gdXNpbmcgZ29vZCBvbGQgcmF3IE5BTkQgY29udHJvbGxlciBk
cml2ZXJzLCB3ZSBuZWVkIHRvCm1hbnVhbGx5IHNldCB0aGVzZSB2YWx1ZXMgb3Vyc2VsdmVzIGF0
IHRoZSBlbmQgb2YgdGhlICJzY2FuIiBvcGVyYXRpb24sCm9uY2UgdGhlc2UgdmFsdWVzIGhhdmUg
YmVlbiBuZWdvdGlhdGVkLgoKV2l0aG91dCB0aGlzIHByb3BhZ2F0aW9uLCBsYXRlciAoZ2VuZXJp
YykgY2hlY2tzIGxpa2UgdGhlIG9uZSB3YXJuaW5nCnVzZXJzIHRoYXQgdGhlIEVDQyBzdHJlbmd0
aCBpcyBub3QgaGlnaCBlbm91Z2ggbWlnaHQgc2ltcGx5IG5vIGxvbmdlcgp3b3JrLgoKRml4ZXM6
IDhjMTI2NzIwZmUxMCAoIm10ZDogcmF3bmFuZDogVXNlIHRoZSBFQ0MgZnJhbWV3b3JrIG5hbmRf
ZWNjX2lzX3N0cm9uZ19lbm91Z2goKSBoZWxwZXIiKQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
ZwpSZXBvcnRlZC1ieTogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgpDbG9z
ZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9aaGUySnR2dk4xTTRPbXB3QHBlbmd1dHJv
bml4LmRlLwpTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPgotLS0KCkhlbGxvIFNhc2NoYSwgdGhpcyBpcyBvbmx5IGNvbXBpbGUgdGVzdGVkLCB3
b3VsZCB5b3UgbWluZCBjaGVja2luZyBpZgp0aGF0IGZpeGVzIHlvdXIgc2V0dXA/ClRoYW5rcywg
TWlxdcOobAoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIHwgOSArKysrKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L25hbmRfYmFzZS5jCmluZGV4IGQ3ZGJiZDQ2OWI4OS4uYWNkMTM3ZGQwOTU3IDEwMDY0NAot
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYworKysgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9uYW5kX2Jhc2UuYwpAQCAtNjMwMSw2ICs2MzAxLDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBuYW5kX29wcyByYXduYW5kX29wcyA9IHsKIHN0YXRpYyBpbnQgbmFuZF9zY2FuX3RhaWwo
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKIHsKIAlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRf
dG9fbXRkKGNoaXApOworCXN0cnVjdCBuYW5kX2RldmljZSAqYmFzZSA9ICZjaGlwLT5iYXNlOwog
CXN0cnVjdCBuYW5kX2VjY19jdHJsICplY2MgPSAmY2hpcC0+ZWNjOwogCWludCByZXQsIGk7CiAK
QEAgLTY0NDUsOSArNjQ0NiwxMyBAQCBzdGF0aWMgaW50IG5hbmRfc2Nhbl90YWlsKHN0cnVjdCBu
YW5kX2NoaXAgKmNoaXApCiAJaWYgKCFlY2MtPndyaXRlX29vYl9yYXcpCiAJCWVjYy0+d3JpdGVf
b29iX3JhdyA9IGVjYy0+d3JpdGVfb29iOwogCi0JLyogcHJvcGFnYXRlIGVjYyBpbmZvIHRvIG10
ZF9pbmZvICovCisJLyogUHJvcGFnYXRlIEVDQyBpbmZvIHRvIHRoZSBnZW5lcmljIE5BTkQgYW5k
IE1URCBsYXllcnMgKi8KIAltdGQtPmVjY19zdHJlbmd0aCA9IGVjYy0+c3RyZW5ndGg7CisJaWYg
KCFiYXNlLT5lY2MuY3R4LmNvbmYuc3RyZW5ndGgpCisJCWJhc2UtPmVjYy5jdHguY29uZi5zdHJl
bmd0aCA9IGVjYy0+c3RyZW5ndGg7CiAJbXRkLT5lY2Nfc3RlcF9zaXplID0gZWNjLT5zaXplOwor
CWlmICghYmFzZS0+ZWNjLmN0eC5jb25mLnN0ZXBfc2l6ZSkKKwkJYmFzZS0+ZWNjLmN0eC5jb25m
LnN0ZXBfc2l6ZSA9IGVjYy0+c2l6ZTsKIAogCS8qCiAJICogU2V0IHRoZSBudW1iZXIgb2YgcmVh
ZCAvIHdyaXRlIHN0ZXBzIGZvciBvbmUgcGFnZSBkZXBlbmRpbmcgb24gRUNDCkBAIC02NDU1LDYg
KzY0NjAsOCBAQCBzdGF0aWMgaW50IG5hbmRfc2Nhbl90YWlsKHN0cnVjdCBuYW5kX2NoaXAgKmNo
aXApCiAJICovCiAJaWYgKCFlY2MtPnN0ZXBzKQogCQllY2MtPnN0ZXBzID0gbXRkLT53cml0ZXNp
emUgLyBlY2MtPnNpemU7CisJaWYgKCFiYXNlLT5lY2MuY3R4Lm5zdGVwcykKKwkJYmFzZS0+ZWNj
LmN0eC5uc3RlcHMgPSBlY2MtPnN0ZXBzOwogCWlmIChlY2MtPnN0ZXBzICogZWNjLT5zaXplICE9
IG10ZC0+d3JpdGVzaXplKSB7CiAJCVdBUk4oMSwgIkludmFsaWQgRUNDIHBhcmFtZXRlcnNcbiIp
OwogCQlyZXQgPSAtRUlOVkFMOwotLSAKMi40MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
