Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08616606A31A
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 15:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TzLootwF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y0KeBoD5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v8FwZG6TjnIDw84FkE1e71KZptKnLybTqA33VcDP2yE=; b=TzLootwFVwdN4zPOD1nj79Yi4K
	UF1c4H9R2RRhFR7CvGcaGgESxwNTuKMx6b0INAOxJMUQnQz5H6VZOcsbkXwFZwN9W0/qtvM2O3j07
	p4TK9n63hnVMDO0qVH2Ag3Q7feHXNr5QUhAFPPB3OyOUG9stut03e/TAHGYKUAVeznn7zFGMr8bip
	93mTPJcsXSkcnWyGtFUe2dpHZaWguk6Flefw0ryi1TEQ7R+2U0u7chiuuhl8pGR+RAlF1wirejh9F
	IigqL8BSjVH9uJTlrx9y8eCIoOya4lPyPxo+fmj9lms2hwpIhQDfQ/BJsmmJ/ruu+qhZ6Nc3NSa7n
	Y9UyM6+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoPD-0000000BzWM-1Jxy;
	Fri, 30 Oct 2026 15:20:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoPC-0000000BzWF-1aoJ
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 15:20:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C6AC60252;
	Fri, 30 Oct 2026 15:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9901F000C1;
	Fri, 30 Oct 2026 15:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793373632;
	bh=Va0qgRoJC+I6P43e2l3958jRXn40zSbCj1URiH+FBbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y0KeBoD53Ydllwz2in3UhuiHG2bujYRXt3cOrbJS8W98PxnrG4HJx+ZCFZJSpSkzp
	 /uoT2guTiI9ng75XMKcPVvCbunXgpcgvHXqe+3xNw/xy7Y3dfvDFb27vv6Oaen00na
	 ylaNBfo4HIDyDxW4I8FfCuifAlMJYzS3PpRi+bokcbLio4PEU5IisVvpIhAHOIuXCX
	 2dFDkKGbLe9Gkff3SS1Ph7CadEluB0igIPFOeTzY/sSBDZ+cKETNLXLPCJV4JHFASJ
	 lOOOZ52kWpSlQwrWe2/COaCCzcBcieuMEy04uHSMHj59MK6P7cFhwBF7kbbZMMlpM8
	 2F6ZYEpz7I01A==
Message-ID: <sashiko-outbox-191156@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: gpmi: terminate the DMA chain on
 completion timeout
To: "Samarth Narang" <samarth.colleges@gmail.com>, "Han Xu" <han.xu@nxp.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Richard Weinberger" <richard@nod.at>, imx@lists.linux.dev, linux-mtd@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20261030150929.2944717-1-samarth.colleges@gmail.com>
References: <20261030150929.2944717-1-samarth.colleges@gmail.com>
Date: Fri, 30 Oct 2026 15:20:32 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiByYXduYW5k
OiBncG1pOiB1bnN5bmNocm9uaXplZCBETUEgdGVybWluYXRpb24gaW4gZ3BtaV9uZmNfZXhlY19v
cCgpCi0tCgpjb21taXQgZjlhYWM3OTJmOThkNTAyOTJmMDFkMDhiMDFkZDFiMDZkY2Y4NGFjMApB
dXRob3I6IFNhbWFydGggTmFyYW5nIDxzYW1hcnRoLmNvbGxlZ2VzQGdtYWlsLmNvbT4KCm10ZDog
cmF3bmFuZDogZ3BtaTogdGVybWluYXRlIHRoZSBETUEgY2hhaW4gb24gY29tcGxldGlvbiB0aW1l
b3V0CgpUaGlzIGNvbW1pdCBjYWxscyBkbWFlbmdpbmVfdGVybWluYXRlX3N5bmMoKSBiZWZvcmUg
dW5tYXBwaW5nIERNQSBidWZmZXJzCndoZW4gYSBETUEgY29tcGxldGlvbiB0aW1lb3V0IG9jY3Vy
cyBpbiBncG1pX25mY19leGVjX29wKCksIGludGVuZGluZyB0bwpzdG9wIHRoZSBBUEJIIERNQSBj
aGFubmVsIGFuZCBwcmV2ZW50IHN0YWxlIGRlc2NyaXB0b3JzIGZyb20gcnVubmluZyBhZ2FpbnN0
CnVubWFwcGVkIGJ1ZmZlcnMuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9n
cG1pLW5hbmQvZ3BtaS1uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3Bt
aS1uYW5kLmMKPiBpbmRleCA1MjcxNjVjY2M4MzlkLi44NjE2M2E1NTJhYWQ4IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYwo+ICsrKyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYwo+IEBAIC0yNjU5LDYgKzI2
NTksNyBAQCBzdGF0aWMgaW50IGdwbWlfbmZjX2V4ZWNfb3Aoc3RydWN0IG5hbmRfY2hpcCAqY2hp
cCwKPiAgCWlmICghdG8pIHsKPiAgCQlkZXZfZXJyKHRoaXMtPmRldiwgIkRNQSB0aW1lb3V0LCBs
YXN0IERNQVxuIik7Cj4gIAkJZ3BtaV9kdW1wX2luZm8odGhpcyk7Cj4gKwkJZG1hZW5naW5lX3Rl
cm1pbmF0ZV9zeW5jKGdldF9kbWFfY2hhbih0aGlzKSk7CgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9l
cyBkbWFlbmdpbmVfdGVybWluYXRlX3N5bmMoKSBhY3R1YWxseSBzeW5jaHJvbml6ZSB3aXRoIHRo
ZSBjaGFubmVsIElSUQphbmQgY29tcGxldGlvbiB0YXNrbGV0IG9uIG14cy1kbWE/CgpJbiBkcml2
ZXJzL2RtYS9teHMtZG1hLmMsIG14c19kbWFfcHJvYmUoKSBkb2VzIG5vdCBpbXBsZW1lbnQKZGV2
aWNlX3N5bmNocm9uaXplLCBzbyBkbWFlbmdpbmVfc3luY2hyb25pemUoKSBpcyBhIG5vLW9wLCBh
bmQKbXhzX2RtYV90ZXJtaW5hdGVfYWxsKCkgcmVzZXRzIHRoZSBjaGFubmVsIHdpdGhvdXQga2ls
bGluZyBteHNfY2hhbi0+dGFza2xldApvciBjbGVhcmluZyBteHNfY2hhbi0+ZGVzYy5jYWxsYmFj
azoKCmRyaXZlcnMvZG1hL214cy1kbWEuYzpteHNfZG1hX3Rlcm1pbmF0ZV9hbGwoKSB7CglteHNf
ZG1hX3Jlc2V0X2NoYW4oY2hhbik7CglteHNfZG1hX2Rpc2FibGVfY2hhbihjaGFuKTsKCglyZXR1
cm4gMDsKfQoKRnVydGhlcm1vcmUsIHdoZW4gbXhzX2RtYV9yZXNldF9jaGFuKCkgcmVzZXRzIGFu
IGFjdGl2ZSBBUEJIIGNoYW5uZWwgKG9yIGlmCmEgbGF0ZSBjb21wbGV0aW9uIGludGVycnVwdCBy
YWNlcyB3aXRoIHRoZSB0aW1lb3V0KSwgbXhzX2RtYV9pbnRfaGFuZGxlcigpCmZpcmVzIGZvciB0
aGUgdGVybWluYXRpb24gZXJyb3IgKGVyciA9PSAweDAxKSBvciBjb21wbGV0aW9uIGFuZCBzY2hl
ZHVsZXMKbXhzX2NoYW4tPnRhc2tsZXQ6Cgpkcml2ZXJzL2RtYS9teHMtZG1hLmM6bXhzX2RtYV9p
bnRfaGFuZGxlcigpIHsKCS4uLgoJaWYgKGVycikgewoJCWRldl9kYmcobXhzX2RtYS0+ZG1hX2Rl
dmljZS5kZXYsCgkJCSIlczogZXJyb3IgaW4gY2hhbm5lbCAlZFxuIiwgX19mdW5jX18sCgkJCWNo
YW4pOwoJCW14c19jaGFuLT5zdGF0dXMgPSBETUFfRVJST1I7CgkJbXhzX2RtYV9yZXNldF9jaGFu
KCZteHNfY2hhbi0+Y2hhbik7Cgl9CgkuLi4KCS8qIHNjaGVkdWxlIHRhc2tsZXQgb24gdGhpcyBj
aGFubmVsICovCgl0YXNrbGV0X3NjaGVkdWxlKCZteHNfY2hhbi0+dGFza2xldCk7Cn0KCkJlY2F1
c2UgbXhzX2NoYW4tPnRhc2tsZXQgaXMgbm90IHN5bmNocm9uaXplZCBiZWZvcmUKZG1hZW5naW5l
X3Rlcm1pbmF0ZV9zeW5jKCkgcmV0dXJucywgY291bGQgbXhzX2RtYV90YXNrbGV0KCkgcnVuCmRt
YV9pcnFfY2FsbGJhY2sodGhpcykgYW5kIGNvbXBsZXRlIHRoaXMtPmRtYV9kb25lIGFmdGVyIGEg
c3Vic2VxdWVudApncG1pX25mY19leGVjX29wKCkgY2FsbCBoYXMgYWxyZWFkeSByZWluaXRpYWxp
emVkIHRoaXMtPmRtYV9kb25lIGFuZApzdWJtaXR0ZWQgYSBuZXcgdHJhbnNmZXIsIGNhdXNpbmcg
dGhlIG5ldyBvcGVyYXRpb24gdG8gY29tcGxldGUgcHJlbWF0dXJlbHkKYW5kIHVubWFwIGl0cyBi
dWZmZXJzIHdoaWxlIERNQSBpcyBzdGlsbCBhY3RpdmU/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcg
wrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDMwMTUwOTI5LjI5NDQ3MTct
MS1zYW1hcnRoLmNvbGxlZ2VzQGdtYWlsLmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
