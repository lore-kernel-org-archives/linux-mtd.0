Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F38CD6E60
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2026 12:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lTuG4K6HEaAbQ8c8ToIJ+JApl3UUQim2wYrQxauaNU4=; b=MiemHjgEnrvgQv
	IluOeh1yDJCeKl1beh0zNIE8T3Gn/y13e/4eKf0QAoR0fjiCNNDrvwTaZ1V3EJ0x5JStsBmT7Vkzu
	BW3BLl+SyHfTghw8QFp/9zvff+kLPAuu7CSydS4o8JefG8fbfdF+TSxqss+mqQQdHTDWvZrmoi2yM
	E9F+kxo/Qp+WTzXG17OBLESxZnR+WOytxFCZrJXpvy8KAr2xBPHhpRFhd1QP4TayflOKyr0TJxjch
	aJlPBRyOyipCiCTaddn1FlcOAKPZZoF7MP9b6q7E8xWwaykVkEgwjcJPvave0HY6tmX2cVyfos5p/
	sdLfGvCU1QgcagV607Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUO59-0000000CxjK-1QF7;
	Tue, 02 Jun 2026 12:18:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUO56-0000000Cxit-1WQI
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jun 2026 12:18:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7B0A04E42DCC;
	Tue,  2 Jun 2026 12:18:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41356603BC;
	Tue,  2 Jun 2026 12:18:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B693110888429;
	Tue,  2 Jun 2026 14:18:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780402729; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LDb4o52DTUweCNoaveunh0r8+3SLZ3VLRjrgEU8ebf0=;
	b=F4ukxueRbcpmWVLMtCyjP8pu5HOz/aIu4z/6QeJu7cdoxhQ7cJDhxIu1oMOrZM1UAFwyob
	aTrZLusfl8KLnYxou0aIsz+BGN9PSb3Pqg3A3ygNJA0a3jXyyT2lXVAFsT9Tv4uNat8J0H
	b8Gc8eB+y6OiTIU8WL1Wk65mX2Bjv02CyJWSbw34U0xrtBn1PDJwVFjiReZfeRbdTeJwMC
	mgtmwgZj422X0cAIdfUxSuvPhljWjKxGy5pzSANENbAISkYtAonhN+xiodHUC0pT7OkQWx
	2ZYqxq58hl545Fg1Jx/v6CsgOfHznY3XwrdzKKvZZ1m6YJ8N6RdCO/99a04X3g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v3 11/13] mtd: spinand: run PHY tuning after init and
 update dirmap frequencies
In-Reply-To: <2f509130-491c-4a66-9156-39b01b40e65f@ti.com> (Santhosh Kumar
	K.'s message of "Mon, 1 Jun 2026 14:46:44 +0530")
References: <20260527175527.2247679-1-s-k6@ti.com>
	<20260527175527.2247679-12-s-k6@ti.com> <87mrxjg9zi.fsf@bootlin.com>
	<2f509130-491c-4a66-9156-39b01b40e65f@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 02 Jun 2026 14:18:37 +0200
Message-ID: <87y0gx16g2.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_051852_560213_DAEA8125 
X-CRM114-Status: GOOD (  16.09  )
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

SGVsbG8gU2FudGhvc2gsCgo+Pj4gKwkvKgo+Pj4gKwkgKiBEaXJtYXBzIHdlcmUgc2V0IHVwIGlu
IHNwaW5hbmRfaW5pdCgpIGJlZm9yZSB0dW5pbmcgcmFuOyB1cGRhdGUKPj4+ICsJICogdGhlaXIg
b3AgdGVtcGxhdGVzIHRvIHVzZSB0aGUgdmFsaWRhdGVkIGZyZXF1ZW5jeS4KPj4+ICsJICovCj4+
PiArCWlmICghcmV0KSB7Cj4+PiArCQlzdHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmQgPSBzcGluYW5k
X3RvX25hbmQoc3BpbmFuZCk7Cj4+PiArCQlpbnQgaTsKPj4+ICsKPj4+ICsJCWZvciAoaSA9IDA7
IGkgPCBuYW5kLT5tZW1vcmcucGxhbmVzX3Blcl9sdW47IGkrKykgewo+Pj4gKwkJCWlmIChzcGlu
YW5kLT5kaXJtYXBzW2ldLnJkZXNjKSB7Cj4+PiArCQkJCXNwaW5hbmQtPmRpcm1hcHNbaV0ucmRl
c2MtPmluZm8ucHJpbWFyeV9vcF90bXBsLm1heF9mcmVxID0KPj4+ICsJCQkJCXNwaW5hbmQtPm1h
eF9yZWFkX29wLm1heF9mcmVxOwo+Pj4gKwkJCQlzcGluYW5kLT5kaXJtYXBzW2ldLnJkZXNjLT5p
bmZvLnNlY29uZGFyeV9vcF90bXBsLm1heF9mcmVxID0KPj4+ICsJCQkJCXNwaW5hbmQtPm1heF9y
ZWFkX29wLm1heF9mcmVxOwo+Pj4gKwkJCX0KPj4+ICsJCQlpZiAoc3BpbmFuZC0+ZGlybWFwc1tp
XS53ZGVzYykKPj4+ICsJCQkJc3BpbmFuZC0+ZGlybWFwc1tpXS53ZGVzYy0+aW5mby5wcmltYXJ5
X29wX3RtcGwubWF4X2ZyZXEgPQo+Pj4gKwkJCQkJc3BpbmFuZC0+bWF4X3dyaXRlX29wLm1heF9m
cmVxOwo+Pj4gKwkJfQo+Pj4gKwl9Cj4+IFVuZm9ydHVuYXRlbHksIGhvdCBmaXhpbmcgdGhlIGRp
cm1hcHMgaXMgaW52YWxpZC4gV2hlbiB3ZSB0YWtlIHRoZQo+PiBiZXN0Cj4+IHZhcmlhbnQsIHdl
IHNlbGVjdCBhIG1heGltdW0gc3BlZWQgdGhhdCBtYXkgYmUgbG93ZXIgdGhhbiB0aGUgdHVuZWQg
UEhZCj4+IHNwZWVkLiBXZSBjYW5ub3QganVzdCBvdmVyd3JpdGUgdGhhdCB2YWx1ZSB3aXRob3V0
IGNvbnNlcXVlbmNlLCBiZWNhdXNlCj4+IGRlcGVuZGluZyBvbiB0aGUgYm91bmRhcmllcyB3ZSBj
cm9zcywgZXh0cmEgZHVtbXkgY3ljbGVzIG1heSBiZQo+PiByZXF1aXJlZC4KPj4gSSBiZWxpZXZl
IHNwaW5hbmRfc2VsZWN0X29wX3ZhcmlhbnQoKSBzaGFsbCBiZSBhd2FyZSBvZiB0aGUgZGlmZmVy
ZW50Cj4+IHBvc3NpYmxlIHNwZWVkcy4gSXQgc2hvdWxkIGxvb2sgZm9yIHRoZSBtYXhfc3BlZWRf
aHogY2FwYWJpbGl0eSBhbmQgbm90Cj4+IGZvciB0aGUgYmFzZV9zcGVlZF9oeiwgYW5kIGZhbGxi
YWNrIHRvIGJhc2Vfc3BlZWRfaHogaW4gY2FzZSBvZgo+PiBpc3N1ZS4KPj4gT3Igb3RoZXJ3aXNl
LCBtYXliZSB3ZSBjb3VsZCBnbyB0aHJvdWdoIHRoZSB3aG9sZSBJL08gdmFyaWFudAo+PiBzZWxl
Y3Rpb24gYWdhaW4gYWZ0ZXIgdHVuaW5nLCB3aXRoIHRoZSBhY3R1YWwgbWF4aW11bSBzcGVlZCBz
ZXQuCj4KPiBHb29kIGNhdGNoLiBVcGRhdGluZyB0aGUgZGlybWFwIHRlbXBsYXRlcyBhZnRlciB0
aGV5IGhhdmUgYWxyZWFkeSBiZWVuCj4gY3JlYXRlZCBpcyBpbmRlZWQgbm90IGNvcnJlY3QsIGFz
IHRoZSBvcGVyYXRpb24gc2VsZWN0aW9uIG1heSBkZXBlbmQgb24KPiB0aGUgZmluYWwgZnJlcXVl
bmN5IGFuZCBhc3NvY2lhdGVkIHBhcmFtZXRlcnMgc3VjaCBhcyBkdW1teSBjeWNsZXMuCj4KPiBJ
bnN0ZWFkIG9mIHBhdGNoaW5nIHRoZSBkaXJtYXBzIGFmdGVyIHR1bmluZywgSSdsbCBtb3ZlIHRo
ZQo+IF9leGVjdXRlX3R1bmluZygpIGNhbGwgYmVmb3JlIGRpcm1hcCBjcmVhdGlvbi4gVGhpcyB3
YXksIHRoZSB2YWxpZGF0ZWQKPiBmcmVxdWVuY3kgY2FuIGJlIHdyaXR0ZW4gYmFjayBpbnRvIHRo
ZSBzZWxlY3RlZCByZWFkL3dyaXRlIHZhcmlhbnQsIGFuZAo+IHRoZSBkaXJtYXBzIHdpbGwgdGhl
biBiZSBjcmVhdGVkIHVzaW5nIHRoZSBmaW5hbCBvcHMuCj4KPiBJJ2xsIHJld29yayB0aGUgZmxv
dyBhY2NvcmRpbmdseSBhbmQgbGV0IHlvdSBrbm93IHRoZSByZXN1bHRzIG9uY2UgSSd2ZQo+IHRl
c3RlZCBpdC4KCklmIHRoaXMgaXMgZG9hYmxlLCBpdCBpcyBjbGVhcmx5IHRoZSBiZXN0IGFwcHJv
YWNoLCBidXQgb24gdGhlIG90aGVyCnNpZGUgeW91IG1pZ2h0IG5lZWQgdG8ga25vdyB3aGF0IGlz
IHRoZSByZWFkIHZhcmlhbnQgYmVmb3JlIHJ1bm5pbmcgdGhlCnR1bmluZyBhbGdvcml0aG0sIHNv
IEkgYW0gbm90IHN1cmUgaXQgaXMgZmVhc2libGUuIEknbGwgbGV0IHlvdSBkaWcgdGhlCnRvcGlj
IGFuZCBwcm9wb3NlIHRoZSBiZXN0IGFwcHJvYWNoIHlvdSBmaW5kIQoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
