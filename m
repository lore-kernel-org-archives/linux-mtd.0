Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6626C47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 16:58:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B96AE206D7
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 16:58:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QOlSwMsp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B96AE206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e+UyPPhmYu+zYJ21kU26Ds4AQdaXMsu6AijtW/RUpG8=; b=QOlSwMsppWdAAq
	qamnUMeA1O0tFFJ8oloBD98kztIzOWiZpHHcSHokpmi7sykQ9W1ziU6YuwBRQoiy285UtfGAVcRx0
	P++c50uAxI0tWOlHr6Dnj4wJ6Hsydj9WL9lCMbfb2zDHsPqQLvYEfbcjorWgckrGPpQ7rX+uRF/PV
	OiIA1ZX73Fz0Oomte9MLF1DAR+LT+8I0r6RQ7SKTC3L0gj23dKhJpm5TD5pmlaPqAcatx7gTxsALH
	1Z7doD+V5Njq/smc7x8sK7qq75Lxymkuvacq+rqytq3yfpolHUyrmjsM/XpQ/WSgqUeqpLPmo9A8s
	G9lPp4vbvIwpPajYb8XA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYBkU-0006jo-Uz; Mon, 11 May 2020 16:57:50 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYBkQ-0006j6-TZ; Mon, 11 May 2020 16:57:48 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 12059C0011;
 Mon, 11 May 2020 16:57:40 +0000 (UTC)
Date: Mon, 11 May 2020 18:57:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: bcrmnand: Add exec_op() support
Message-ID: <20200511185739.51c94fd5@xps13>
In-Reply-To: <20200502163432.1543243-3-boris.brezillon@collabora.com>
References: <20200502163432.1543243-1-boris.brezillon@collabora.com>
 <20200502163432.1543243-3-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_095747_226502_1BA167BF 
X-CRM114-Status: GOOD (  17.88  )
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Scott Branden <sbranden@broadcom.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Lee Jones <lee@kernel.org>,
 Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBTYXQsICAyIE1heQoyMDIwIDE4OjM0OjMxICswMjAwOgoKPiBUaGlzIGltcGxl
bWVudGF0aW9uIG9mIGV4ZWNfb3AoKSByZWxpZXMgb24gbG93LWxldmVsIG9wZXJhdGlvbnMgb25s
eS4gV2UKPiBjb3VsZCBhZGQgc3VwcG9ydCBmb3IgaGlnaC1sZXZlbCBvcGVyYXRpb25zIHRvbyB0
aHJvdWdoIGFuIG9wIHBhcnNlciwKPiBidXQgdGhlIGdhaW4gaXMgbGlrZWx5IHRvIGJlIG5lZ2xp
Z2libGUgc2luY2UgcmVhZC93cml0ZSBwYWdlIG9wZXJhdGlvbnMKPiBhbHJlYWR5IGhhdmUgYSBm
YXN0IHBhdGggKHtyZWFkd3JpdGV9X3BhZ2VbcmF3XSgpIGltcGxlbWVudGF0aW9ucykuCgpBZ3Jl
ZWQuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9u
QGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2Jy
Y21uYW5kLmMgfCA3MiArKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDcyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
YnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21u
YW5kLmMKPiBpbmRleCBlNGUzY2VlYWMzOGYuLmU3MDExNzE0Njc1NSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+IEBAIC0xNTk5LDYgKzE1OTksNzcgQEAg
c3RhdGljIGludCBicmNtbmFuZF9sb3dfbGV2ZWxfb3Aoc3RydWN0IGJyY21uYW5kX2hvc3QgKmhv
c3QsCj4gIAlyZXR1cm4gYnJjbW5hbmRfd2FpdGZ1bmMoY2hpcCk7Cj4gIH0KPiAgCj4gK3N0YXRp
YyB2b2lkIGJyY21uYW5kX2V4ZWNfaW5zdHIoc3RydWN0IGJyY21uYW5kX2hvc3QgKmhvc3QsCj4g
KwkJCQljb25zdCBzdHJ1Y3QgbmFuZF9vcF9pbnN0ciAqaW5zdHIsCj4gKwkJCQlib29sIGxhc3Rf
b3ApCj4gK3sKPiArCXVuc2lnbmVkIGludCBpOwo+ICsJY29uc3QgdTggKm91dDsKPiArCXU4ICpp
bjsKPiArCj4gKwlzd2l0Y2ggKGluc3RyLT50eXBlKSB7Cj4gKwljYXNlIE5BTkRfT1BfQ01EX0lO
U1RSOgo+ICsJCWJyY21uYW5kX2xvd19sZXZlbF9vcChob3N0LCBMTF9PUF9DTUQsCj4gKwkJCQkg
ICAgICBpbnN0ci0+Y3R4LmNtZC5vcGNvZGUsIGxhc3Rfb3ApOwo+ICsJCWJyZWFrOwo+ICsKPiAr
CWNhc2UgTkFORF9PUF9BRERSX0lOU1RSOgo+ICsJCWZvciAoaSA9IDA7IGkgPCBpbnN0ci0+Y3R4
LmFkZHIubmFkZHJzOyBpKyspCj4gKwkJCWJyY21uYW5kX2xvd19sZXZlbF9vcChob3N0LCBMTF9P
UF9BRERSLAo+ICsJCQkJCSAgICAgIGluc3RyLT5jdHguYWRkci5hZGRyc1tpXSwKPiArCQkJCQkg
ICAgICBsYXN0X29wKTsKPiArCQlicmVhazsKPiArCj4gKwljYXNlIE5BTkRfT1BfREFUQV9JTl9J
TlNUUjoKPiArCQlpbiA9IGluc3RyLT5jdHguZGF0YS5idWYuaW47Cj4gKwkJZm9yIChpID0gMDsg
aSA8IGluc3RyLT5jdHguZGF0YS5sZW47IGkrKykgewo+ICsJCQlicmNtbmFuZF9sb3dfbGV2ZWxf
b3AoaG9zdCwgTExfT1BfUkQsIDAsIGxhc3Rfb3ApOwo+ICsJCQlpbltpXSA9IGJyY21uYW5kX3Jl
YWRfcmVnKGhvc3QtPmN0cmwsCj4gKwkJCQkJCSAgQlJDTU5BTkRfTExfUkRBVEEpOwo+ICsJCX0K
PiArCQlicmVhazsKPiArCj4gKwljYXNlIE5BTkRfT1BfREFUQV9PVVRfSU5TVFI6Cj4gKwkJb3V0
ID0gaW5zdHItPmN0eC5kYXRhLmJ1Zi5vdXQ7Cj4gKwkJZm9yIChpID0gMDsgaSA8IGluc3RyLT5j
dHguZGF0YS5sZW47IGkrKykKPiArCQkJYnJjbW5hbmRfbG93X2xldmVsX29wKGhvc3QsIExMX09Q
X1dSLCBvdXRbaV0sIGxhc3Rfb3ApOwo+ICsJCWJyZWFrOwo+ICsKPiArCWNhc2UgTkFORF9PUF9X
QUlUUkRZX0lOU1RSOgo+ICsJCS8qCj4gKwkJICogTm90aGluZyB0byBkbyBoZXJlLCBicmNtbmFu
ZF9sb3dfbGV2ZWxfb3AoKSBhbHJlYWR5IHdhaXRzIG9uCj4gKwkJICogRkxBU0hfUkVBRFkgZXZl
cnkgdGltZSBpdCdzIGNhbGxlZC4KPiArCQkgKi8KPiArCQlicmVhazsKPiArCj4gKwlkZWZhdWx0
Ogo+ICsJCWJyZWFrOwo+ICsJfQo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IGJyY21uYW5kX2V4ZWNf
b3Aoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiArCQkJICAgIGNvbnN0IHN0cnVjdCBuYW5kX29w
ZXJhdGlvbiAqb3AsCj4gKwkJCSAgICBib29sIGNoZWNrX29ubHkpCj4gK3sKPiArCXN0cnVjdCBi
cmNtbmFuZF9ob3N0ICpob3N0ID0gbmFuZF9nZXRfY29udHJvbGxlcl9kYXRhKGNoaXApOwo+ICsJ
c3RydWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChjaGlwKTsKPiArCXVuc2lnbmVkIGlu
dCBpOwo+ICsKPiArCWlmIChjaGVja19vbmx5KQo+ICsJCXJldHVybiAwOwo+ICsKPiArCWlmIChv
cC0+ZGVhc3NlcnRfd3ApCj4gKwkJYnJjbW5hbmRfd3AobXRkLCAwKTsKPiArCj4gKwlmb3IgKGkg
PSAwOyBpIDwgb3AtPm5pbnN0cnM7IGkrKykKPiArCQlicmNtbmFuZF9leGVjX2luc3RyKGhvc3Qs
ICZvcC0+aW5zdHJzW2ldLCBpID09IG9wLT5uaW5zdHJzIC0gMSk7CgpNYXliZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoICAgICAgICAg
ICAgICApIAoKdG8gaW1wcm92ZSByZWFkYWJpbGl0eT8KCk9yIGV2ZW4gbWF5YmUgdXNpbmcgYW4g
aW50ZXJtZWRpYXRlIGJvb2xlYW4/Cgo+ICsKPiArCWlmIChvcC0+ZGVhc3NlcnRfd3ApCj4gKwkJ
YnJjbW5hbmRfd3AobXRkLCAxKTsKPiArCj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiAgc3RhdGlj
IHZvaWQgYnJjbW5hbmRfY21kZnVuYyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB1bnNpZ25lZCBj
b21tYW5kLAo+ICAJCQkgICAgIGludCBjb2x1bW4sIGludCBwYWdlX2FkZHIpCj4gIHsKPiBAQCAt
MjU5Nyw2ICsyNjY4LDcgQEAgc3RhdGljIGludCBicmNtbmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3Qg
bmFuZF9jaGlwICpjaGlwKQo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBuYW5kX2NvbnRyb2xs
ZXJfb3BzIGJyY21uYW5kX2NvbnRyb2xsZXJfb3BzID0gewo+ICAJLmF0dGFjaF9jaGlwID0gYnJj
bW5hbmRfYXR0YWNoX2NoaXAsCj4gKwkuZXhlY19vcCA9IGJyY21uYW5kX2V4ZWNfb3AsCj4gIH07
Cj4gIAo+ICBzdGF0aWMgaW50IGJyY21uYW5kX2luaXRfY3Moc3RydWN0IGJyY21uYW5kX2hvc3Qg
Kmhvc3QsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqZG4pCgpXaXRoIHRoaXMgdGlueSBjaGFuZ2UgKGRv
bid0IHJlc2VuZCBpZiB1bm5lZWRlZCk6CgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
