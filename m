Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C7CC433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:13:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B9B264E4A
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B9B264E4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yFDFitOwBEWpBUqeOFi7xIcPvERYZumDqu+++hTpLdk=; b=Gb81c9Br9JEppIshNrosXMSXr
	b/KZAlOQcxCnrFTMoC0MMNVwd7cmAy/df1//b3czCmGMUwfW6gcQP6rOQogNkJDeDXe1stVA90Hep
	s8K6ukud/t3024Xw0mikJqnjj2OAjgDS9vUPOTjEqguJnOI25vj3KxmD+trnIKGpsBSyTDFcTR+fe
	jyMWTM6UWtp+g+hhvYHA40gM/PMLKYgx7JDyq47IjzYzlKeyalZWXKYWNwgJ4Ha0iD9rTd6Hq1x9T
	wP/SSwB7NV/R8lb2kLfAOjLlRqBTUnVeRgPJOtxP9hRw8TlSseeirIjIKHhZS+Oec6WnGbKJorK8p
	RNIFK6iNQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHSF4-0055Hu-1U; Wed, 03 Mar 2021 14:12:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHS5k-0052LW-Bc
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=5L5Ct2Lhi3TlhOlOwDZW6JSf+iH8t0/QmFC1SY/SvN4=; b=lHi6MmvytwNwQ3h4YjNbWOBl1u
 QaYdbl0kG2W6MvIgAvzk4OQHDYYsn1SgQR4kaCwDiVAwf3wY1P4ptqq4LNfdM6pQIll34YMy90xul
 d0mg74zU5VyHUV4HN2y2kQGkU61e5ANtxZDazOe9u+SifFdC4kObVCrTQi1yj9seFaXDuYNTGrkje
 V9d69Mhy4Wjxn7zc1qXrhonG3KrNo5g0ZMM2J3uaXmWMqIJtP3oiL0AWh8HMxM8HsrONan8T+3C6a
 3qQEYuVszGPhID1bmSw324UPWZbUHnZyxhYosjqe+41vJFLgUcsC9varO6+qy080QyF9mn+7I80nU
 RKHyyOLg==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH4QM-00H7my-MP
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 12:46:51 +0000
Received: from xps13 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 537E9240002;
 Tue,  2 Mar 2021 12:46:19 +0000 (UTC)
Date: Tue, 2 Mar 2021 13:46:17 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-api@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Tudor.Ambarus@microchip.com
Subject: Re: [RFC PATCH] mtd: add OTP (one-time-programmable) erase ioctl
Message-ID: <20210302134617.5aa78cc4@xps13>
In-Reply-To: <20210302110927.6520-1-michael@walle.cc>
References: <20210302110927.6520-1-michael@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_124651_919019_FB09CBB3 
X-CRM114-Status: GOOD (  24.32  )
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

SGkgTWljaGFlbCwKCk1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+IHdyb3RlIG9uIFR1
ZSwgIDIgTWFyIDIwMjEgMTI6MDk6MjcKKzAxMDA6Cgo+IFRoaXMgbWF5IHNvdW5kIGxpa2UgYSBj
b250cmFkaWN0aW9uIGJ1dCBzb21lIFNQSS1OT1IgZmxhc2hlcyByZWFsbHkKPiBzdXBwb3J0IGVy
YXNpbmcgdGhlaXIgT1RQIHJlZ2lvbiB1bnRpbCBpdCBpcyBmaW5hbGx5IGxvY2tlZC4gSGF2aW5n
IHRoZQo+IHBvc3NpYmlsaXR5IHRvIGVyYXNlIGFuIE9UUCByZWdpb24gbWlnaHQgY29tZSBpbiBo
YW5keSBkdXJpbmcKPiBkZXZlbG9wbWVudC4KPiAKPiBUaGUgaW9jdGwgYXJndW1lbnQgZm9sbG93
cyB0aGUgT1RQTE9DSyBzdHlsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFdhbGxlIDxt
aWNoYWVsQHdhbGxlLmNjPgo+IC0tLQo+IE9UUCBzdXBwb3J0IGZvciBTUEktTk9SIGZsYXNoZXMg
bWF5IGJlIG1lcmdlZCBzb29uOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8y
MDIxMDIxNjE2MjgwNy4xMzUwOS0xLW1pY2hhZWxAd2FsbGUuY2MvCj4gCj4gVHVkb3Igc3VnZ2Vz
dGVkIHRvIGFkZCBzdXBwb3J0IGZvciB0aGUgT1RQIGVyYXNlIG9wZXJhdGlvbiBtb3N0IFNQSS1O
T1IKPiBmbGFzaGVzIGhhdmU6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkL2Q0
Zjc0YjFiLWZhMWItOTdlYy04NThjLWQ4MDdmZTFmOWU1N0BtaWNyb2NoaXAuY29tLwo+IAo+IFRo
ZXJlZm9yZSwgdGhpcyBpcyBhbiBSRkMgdG8gZ2V0IHNvbWUgZmVlZGJhY2sgb24gdGhlIE1URCBz
aWRlLCBvbmNlIHRoaXMKPiBpcyBmaW5pc2hlZCwgSSBjYW4gcG9zdCBhIHBhdGNoIGZvciBtdGQt
dXRpbHMuIFRoZW4gd2UnbGwgaGF2ZSBhIGZvdW5kYXRpb24KPiB0byBhZGQgdGhlIHN1cHBvcnQg
dG8gU1BJLU5PUi4KPiAKPiAgZHJpdmVycy9tdGQvbXRkY2hhci5jICAgICAgfCAgNyArKysrKyst
Cj4gIGRyaXZlcnMvbXRkL210ZGNvcmUuYyAgICAgIHwgMTIgKysrKysrKysrKysrCj4gIGluY2x1
ZGUvbGludXgvbXRkL210ZC5oICAgIHwgIDMgKysrCj4gIGluY2x1ZGUvdWFwaS9tdGQvbXRkLWFi
aS5oIHwgIDIgKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNoYXIuYyBiL2RyaXZlcnMv
bXRkL210ZGNoYXIuYwo+IGluZGV4IDMyMzAzNWQ0ZjJkMC4uZGE0MjNkZDAzMWFlIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvbXRkL210ZGNoYXIuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210ZGNoYXIu
Ywo+IEBAIC02NjEsNiArNjYxLDcgQEAgc3RhdGljIGludCBtdGRjaGFyX2lvY3RsKHN0cnVjdCBm
aWxlICpmaWxlLCB1X2ludCBjbWQsIHVfbG9uZyBhcmcpCj4gIAljYXNlIE9UUEdFVFJFR0lPTkNP
VU5UOgo+ICAJY2FzZSBPVFBHRVRSRUdJT05JTkZPOgo+ICAJY2FzZSBPVFBMT0NLOgo+ICsJY2Fz
ZSBPVFBFUkFTRToKPiAgCWNhc2UgRUNDR0VUTEFZT1VUOgo+ICAJY2FzZSBFQ0NHRVRTVEFUUzoK
PiAgCWNhc2UgTVRERklMRU1PREU6Cj4gQEAgLTkzOCw2ICs5MzksNyBAQCBzdGF0aWMgaW50IG10
ZGNoYXJfaW9jdGwoc3RydWN0IGZpbGUgKmZpbGUsIHVfaW50IGNtZCwgdV9sb25nIGFyZykKPiAg
CX0KPiAgCj4gIAljYXNlIE9UUExPQ0s6Cj4gKwljYXNlIE9UUEVSQVNFOgo+ICAJewo+ICAJCXN0
cnVjdCBvdHBfaW5mbyBvaW5mbzsKPiAgCj4gQEAgLTk0NSw3ICs5NDcsMTAgQEAgc3RhdGljIGlu
dCBtdGRjaGFyX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLCB1X2ludCBjbWQsIHVfbG9uZyBhcmcp
Cj4gIAkJCXJldHVybiAtRUlOVkFMOwo+ICAJCWlmIChjb3B5X2Zyb21fdXNlcigmb2luZm8sIGFy
Z3AsIHNpemVvZihvaW5mbykpKQo+ICAJCQlyZXR1cm4gLUVGQVVMVDsKPiAtCQlyZXQgPSBtdGRf
bG9ja191c2VyX3Byb3RfcmVnKG10ZCwgb2luZm8uc3RhcnQsIG9pbmZvLmxlbmd0aCk7Cj4gKwkJ
aWYgKGNtZCA9PSBPVFBMT0NLKQo+ICsJCQlyZXQgPSBtdGRfbG9ja191c2VyX3Byb3RfcmVnKG10
ZCwgb2luZm8uc3RhcnQsIG9pbmZvLmxlbmd0aCk7Cj4gKwkJZWxzZQo+ICsJCQlyZXQgPSBtdGRf
ZXJhc2VfdXNlcl9wcm90X3JlZyhtdGQsIG9pbmZvLnN0YXJ0LCBvaW5mby5sZW5ndGgpOwo+ICAJ
CWJyZWFrOwo+ICAJfQo+ICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIv
ZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gaW5kZXggMmQ2NDIzZDg5YTE3Li5kODQ0ZDcxOGVmNzcg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQv
bXRkY29yZS5jCj4gQEAgLTE5MTgsNiArMTkxOCwxOCBAQCBpbnQgbXRkX2xvY2tfdXNlcl9wcm90
X3JlZyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IGZyb20sIHNpemVfdCBsZW4pCj4gIH0K
PiAgRVhQT1JUX1NZTUJPTF9HUEwobXRkX2xvY2tfdXNlcl9wcm90X3JlZyk7Cj4gIAo+ICtpbnQg
bXRkX2VyYXNlX3VzZXJfcHJvdF9yZWcoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCBmcm9t
LCBzaXplX3QgbGVuKQo+ICt7Cj4gKwlzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlciA9IG10ZF9nZXRf
bWFzdGVyKG10ZCk7Cj4gKwo+ICsJaWYgKCFtYXN0ZXItPl9lcmFzZV91c2VyX3Byb3RfcmVnKQo+
ICsJCXJldHVybiAtRU9QTk9UU1VQUDsKPiArCWlmICghbGVuKQo+ICsJCXJldHVybiAwOwoKU2hv
dWxkIHdlIGFkZCBhIHNhbml0eSBjaGVjayBlbmZvcmNpbmcgdGhhdCB3ZSBkb24ndCB0cnkgdG8g
YWNjZXNzCmJleW9uZCB0aGUgZW5kIG9mIHRoZSBPVFAgYXJlYT8KCj4gKwlyZXR1cm4gbWFzdGVy
LT5fZXJhc2VfdXNlcl9wcm90X3JlZyhtYXN0ZXIsIGZyb20sIGxlbik7Cj4gK30KPiArRVhQT1JU
X1NZTUJPTF9HUEwobXRkX2VyYXNlX3VzZXJfcHJvdF9yZWcpOwo+ICsKPiAgLyogQ2hpcC1zdXBw
b3J0ZWQgZGV2aWNlIGxvY2tpbmcgKi8KPiAgaW50IG10ZF9sb2NrKHN0cnVjdCBtdGRfaW5mbyAq
bXRkLCBsb2ZmX3Qgb2ZzLCB1aW50NjRfdCBsZW4pCj4gIHsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9tdGQvbXRkLmggYi9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaAo+IGluZGV4IDE1NzM1
N2VjMTQ0MS4uNzM0YWQ3YThjMzUzIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbXRkL210
ZC5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9tdGQvbXRkLmgKPiBAQCAtMzM2LDYgKzMzNiw4IEBA
IHN0cnVjdCBtdGRfaW5mbyB7Cj4gIAkJCQkgICAgIHNpemVfdCBsZW4sIHNpemVfdCAqcmV0bGVu
LCB1X2NoYXIgKmJ1Zik7Cj4gIAlpbnQgKCpfbG9ja191c2VyX3Byb3RfcmVnKSAoc3RydWN0IG10
ZF9pbmZvICptdGQsIGxvZmZfdCBmcm9tLAo+ICAJCQkJICAgIHNpemVfdCBsZW4pOwo+ICsJaW50
ICgqX2VyYXNlX3VzZXJfcHJvdF9yZWcpIChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IGZy
b20sCj4gKwkJCQkgICAgIHNpemVfdCBsZW4pOwo+ICAJaW50ICgqX3dyaXRldikgKHN0cnVjdCBt
dGRfaW5mbyAqbXRkLCBjb25zdCBzdHJ1Y3Qga3ZlYyAqdmVjcywKPiAgCQkJdW5zaWduZWQgbG9u
ZyBjb3VudCwgbG9mZl90IHRvLCBzaXplX3QgKnJldGxlbik7Cj4gIAl2b2lkICgqX3N5bmMpIChz
dHJ1Y3QgbXRkX2luZm8gKm10ZCk7Cj4gQEAgLTUxNyw2ICs1MTksNyBAQCBpbnQgbXRkX3JlYWRf
dXNlcl9wcm90X3JlZyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IGZyb20sIHNpemVfdCBs
ZW4sCj4gIGludCBtdGRfd3JpdGVfdXNlcl9wcm90X3JlZyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwg
bG9mZl90IHRvLCBzaXplX3QgbGVuLAo+ICAJCQkgICAgc2l6ZV90ICpyZXRsZW4sIHVfY2hhciAq
YnVmKTsKPiAgaW50IG10ZF9sb2NrX3VzZXJfcHJvdF9yZWcoc3RydWN0IG10ZF9pbmZvICptdGQs
IGxvZmZfdCBmcm9tLCBzaXplX3QgbGVuKTsKPiAraW50IG10ZF9lcmFzZV91c2VyX3Byb3RfcmVn
KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgZnJvbSwgc2l6ZV90IGxlbik7Cj4gIAo+ICBp
bnQgbXRkX3dyaXRldihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgY29uc3Qgc3RydWN0IGt2ZWMgKnZl
Y3MsCj4gIAkgICAgICAgdW5zaWduZWQgbG9uZyBjb3VudCwgbG9mZl90IHRvLCBzaXplX3QgKnJl
dGxlbik7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9tdGQvbXRkLWFiaS5oIGIvaW5jbHVk
ZS91YXBpL210ZC9tdGQtYWJpLmgKPiBpbmRleCA2NWI5ZGI5MzY1NTcuLjI0MjAxNWY2MGQxMCAx
MDA2NDQKPiAtLS0gYS9pbmNsdWRlL3VhcGkvbXRkL210ZC1hYmkuaAo+ICsrKyBiL2luY2x1ZGUv
dWFwaS9tdGQvbXRkLWFiaS5oCj4gQEAgLTIwNSw2ICsyMDUsOCBAQCBzdHJ1Y3Qgb3RwX2luZm8g
ewo+ICAgKiB3aXRob3V0IE9PQiwgZS5nLiwgTk9SIGZsYXNoLgo+ICAgKi8KPiAgI2RlZmluZSBN
RU1XUklURQkJX0lPV1IoJ00nLCAyNCwgc3RydWN0IG10ZF93cml0ZV9yZXEpCj4gKy8qIEVyYXNl
IGEgZ2l2ZW4gcmFuZ2Ugb2YgdXNlciBkYXRhIChtdXN0IGJlIGluIG1vZGUgJU1URF9GSUxFX01P
REVfT1RQX1VTRVIpICovCj4gKyNkZWZpbmUgT1RQRVJBU0UJCV9JT1IoJ00nLCAyNSwgc3RydWN0
IG90cF9pbmZvKQo+ICAKPiAgLyoKPiAgICogT2Jzb2xldGUgbGVnYWN5IGludGVyZmFjZS4gS2Vl
cCBpdCBpbiBvcmRlciBub3QgdG8gYnJlYWsgdXNlcnNwYWNlCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
