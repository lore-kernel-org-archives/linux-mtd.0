Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE557C54E8B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 08:24:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFF8E20A8B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 08:24:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nM8Lnogy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfDT8qi4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFF8E20A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiwVH83CuS04P2GmXMlSMXSJyVh5HQaBUvBZTiyay/0=; b=nM8LnogynpZYXD
	2EbW1sStNGL+UX/W0zOWro+NK1V7CU/7A2tovDDmT5YY4uQ+PYKQdVfWFa82szrsHdVdm8UwlU71g
	PFbutcUILd+kUWjMUJ69Z918wZneNmrj8+lIlT/0R3kLItDDAC6fmdEh5+bkNuTIi5sV2CafMJdHA
	JRtSM2LlkmgAoDir/bv68MdAo3Z70hG1A1+V4iqiFM1KKm8G1IhKtzn+Sd/y2hzVJzjUY9Vx8JKbi
	jGXg68mvgy2OKs1XfBFFlCefgpL+hk7N0BCfQ9oi3HX04YDuEOfjZ+mjngz1CTpl0UbITRoh3qyPz
	Uw2RH55RWw9i1Vbf8YZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYQDN-0000df-Jo; Tue, 12 May 2020 08:24:37 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYQDI-0000Zk-5O
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 08:24:35 +0000
Received: by mail-ej1-x642.google.com with SMTP id x20so6712891ejb.11
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2020 01:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WZmVui63+MZYLGPVMsrYodiyTMhn5xAQUNHMSEpC2WI=;
 b=MfDT8qi45fn3WeCOk2o2t1xYrODuFq3GU+SCCBAWPM2h92+F0KrixpsWHdinUycHmp
 cpvfFmAD+jhqDkkHYWt5Q8cpPEtpVISDTn+fL0txmPjkOFCBhOzA0wcA7xEM///jyCPo
 uwm9RP8IhF+DrMIYEyho+wdOOP8Bp+dRlyrWozPG9P+y5mwanSSevRhmbr/Zcxm6ZCYM
 FG5nskHyavZGHLuX2BeFh1x1xuTXz9NsnKLG/IzAwrXKQ1J3sgROOq4fgIy4zzVWqp3a
 s3mfLkPWMs8+OTrvEBzEwmUog+hIMGUlfQuFbPgJKByrLRdTy95BMayQjTGNRuEujeOp
 Ughw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WZmVui63+MZYLGPVMsrYodiyTMhn5xAQUNHMSEpC2WI=;
 b=XrcyrYMqxlJMt2RV+tr5QUN7JRESeqCWfYvA0ESAvnhKbPyjyHqgr5fNqjYC9kXXSZ
 QT0mi84TDbVc40TUO8wtH99VCnZ7o7SXE8i95otq9RTcazC3PgpImPJqlxdmedqmXaCv
 VxmlecWCnV8aM5UWDc6i9rYmZ9sD3n6ljrzWU9LiuUb+SQnci7xm0k+RlVNn5vSxY5XG
 nnOISov2ncc1Q/6jRAOkBWBhj5KZk8mkten/bOxwhn667e7ORh9SDB5NBEACCAlEBHbX
 NxgGNLQy80M2Y6wY/0U2HpqF/18a86W1ZKtmEPHDOh57vFmZewCFKTFWXuFnD7xl24YM
 CNKw==
X-Gm-Message-State: AGi0Pub5woPKVGrA7IXnrFSknNOjzLOF6hkUxmAJVyBX0V4eezg5Ozw4
 82anC4ke0yJYioBS+F+XblNRUK9ZpX0NuDYvYZU=
X-Google-Smtp-Source: APiQypJ6waQrIqdkBNJiYUFTObsy0HOkI967DYuTmDn/95XvGxRe4QaE7sdEQou1ZWkFZkf4jCo6DOQgEKsAM3GPd/s=
X-Received: by 2002:a17:906:2799:: with SMTP id
 j25mr8522291ejc.369.1589271870256; 
 Tue, 12 May 2020 01:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200505082055.2843847-1-noltari@gmail.com>
 <20200512065111.716801-1-noltari@gmail.com>
 <20200512091637.198dd0c2@xps13>
 <50E32C0E-7485-4180-A072-F7F1CFB45B06@gmail.com>
 <20200512093451.4cde5384@xps13>
In-Reply-To: <20200512093451.4cde5384@xps13>
From: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Date: Tue, 12 May 2020 10:24:16 +0200
Message-ID: <CAKR-sGe7OKYmjiPHK1eLO0P1nLoerMRm_OcUkt9Ay3GtFeTA=w@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: rawnand: brcmnand: correctly verify erased pages
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_012432_237941_38D328AA 
X-CRM114-Status: GOOD (  24.77  )
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
Cc: Vignesh R <vigneshr@ti.com>, kdasu.kdev@gmail.com, richard@nod.at,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 computersforpeace@gmail.com, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdcOobCwKCgpFbCBtYXIuLCAxMiBtYXkuIDIwMjAgYSBsYXMgOTozNCwgTWlxdWVsIFJh
eW5hbAooPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+KSBlc2NyaWJpw7M6Cj4KPiBIaSDDgWx2
YXJvLAo+Cj4gw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdtYWlsLmNvbT4gd3Jv
dGUgb24gVHVlLCAxMiBNYXkgMjAyMAo+IDA5OjI0OjMyICswMjAwOgo+Cj4gPiBIaSBNaXF1w6hs
Cj4gPgo+ID4gPiBFbCAxMiBtYXkgMjAyMCwgYSBsYXMgOToxNiwgTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4gZXNjcmliacOzOgo+ID4gPgo+ID4gPiBIaSDDgWx2YXJv
LAo+ID4gPgo+ID4gPiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29t
PiB3cm90ZSBvbiBUdWUsIDEyIE1heSAyMDIwCj4gPiA+IDA4OjUxOjExICswMjAwOgo+ID4gPgo+
ID4gPj4gVGhlIGN1cnJlbnQgY29kZSBjaGVja3MgdGhhdCB0aGUgd2hvbGUgT09CIGFyZWEgaXMg
ZXJhc2VkLgo+ID4gPj4gVGhpcyBpcyBhIHByb2JsZW0gd2hlbiBKRkZTMiBjbGVhbm1hcmtlcnMg
YXJlIGFkZGVkIHRvIHRoZSBPT0IsIHNpbmNlIGl0IHdpbGwKPiA+ID4+IGZhaWwgZHVlIHRvIHRo
ZSB1c2FibGUgT09CIGJ5dGVzIG5vdCBiZWluZyAweGZmLgo+ID4gPj4gQ29ycmVjdCB0aGlzIGJ5
IG9ubHkgY2hlY2tpbmcgdGhhdCBkYXRhIGFuZCBFQ0MgYnl0ZXMgYXJlbid0IDB4ZmYuCj4gPiA+
Pgo+ID4gPj4gRml4ZXM6IDAyYjg4ZWVhOWY5YyAoIm10ZDogYnJjbW5hbmQ6IEFkZCBjaGVjayBm
b3IgZXJhc2VkIHBhZ2UgYml0ZmxpcHMiKQo+ID4gPj4gU2lnbmVkLW9mZi1ieTogw4FsdmFybyBG
ZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdtYWlsLmNvbT4KPiA+ID4+IC0tLQo+ID4gPj4gdjM6
IEZpeCBjb21taXQgbG9nIGFuZCBtZXJnZSBuYW5kX2NoZWNrX2VyYXNlZF9lY2NfY2h1bmsgY2Fs
bHMuCj4gPiA+PiB2MjogQWRkIEZpeGVzIHRhZwo+ID4gPj4KPiA+ID4+IGRyaXZlcnMvbXRkL25h
bmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCAxOSArKysrKysrKysrKysrKy0tLS0tCj4gPiA+
PiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+ID4+
Cj4gPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5h
bmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiA+ID4+IGlu
ZGV4IGU0ZTNjZWVhYzM4Zi4uODBmZTAxZjAzNTE2IDEwMDY0NAo+ID4gPj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+ID4gPj4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+ID4gPj4gQEAgLTIwMTgsOCArMjAxOCw5
IEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRfcmVhZF9ieV9waW8oc3RydWN0IG10ZF9pbmZvICptdGQs
IHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gPiA+PiBzdGF0aWMgaW50IGJyY21zdGJfbmFuZF92
ZXJpZnlfZXJhc2VkX3BhZ2Uoc3RydWN0IG10ZF9pbmZvICptdGQsCj4gPiA+PiAgICAgICAgICAg
ICAgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgdm9pZCAqYnVmLCB1NjQgYWRkcikKPiA+ID4+IHsK
PiA+ID4+ICsgIHN0cnVjdCBtdGRfb29iX3JlZ2lvbiBvb2JlY2M7Cj4gPiA+PiAgICBpbnQgaSwg
c2FzOwo+ID4gPj4gLSAgdm9pZCAqb29iID0gY2hpcC0+b29iX3BvaTsKPiA+ID4+ICsgIHZvaWQg
Km9vYjsKPiA+ID4+ICAgIGludCBiaXRmbGlwcyA9IDA7Cj4gPiA+PiAgICBpbnQgcGFnZSA9IGFk
ZHIgPj4gY2hpcC0+cGFnZV9zaGlmdDsKPiA+ID4+ICAgIGludCByZXQ7Cj4gPiA+PiBAQCAtMjAz
NSwxMSArMjAzNiwxOSBAQCBzdGF0aWMgaW50IGJyY21zdGJfbmFuZF92ZXJpZnlfZXJhc2VkX3Bh
Z2Uoc3RydWN0IG10ZF9pbmZvICptdGQsCj4gPiA+PiAgICBpZiAocmV0KQo+ID4gPj4gICAgICAg
ICAgICByZXR1cm4gcmV0Owo+ID4gPj4KPiA+ID4+IC0gIGZvciAoaSA9IDA7IGkgPCBjaGlwLT5l
Y2Muc3RlcHM7IGkrKywgb29iICs9IHNhcykgewo+ID4gPj4gKyAgZm9yIChpID0gMDsgaSA8IGNo
aXAtPmVjYy5zdGVwczsgaSsrKSB7Cj4gPiA+PiAgICAgICAgICAgIGVjY19jaHVuayA9IGJ1ZiAr
IGNoaXAtPmVjYy5zaXplICogaTsKPiA+ID4+IC0gICAgICAgICAgcmV0ID0gbmFuZF9jaGVja19l
cmFzZWRfZWNjX2NodW5rKGVjY19jaHVuaywKPiA+ID4+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNoaXAtPmVjYy5zaXplLAo+ID4gPj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb29iLCBzYXMsIE5VTEwsIDAsCj4gPiA+
PiArCj4gPiA+PiArICAgICAgICAgIGlmIChtdGQtPm9vYmxheW91dC0+ZWNjKG10ZCwgaSwgJm9v
YmVjYykpIHsKPiA+ID4KPiA+ID4gUGxlYXNlIHVzZSB0aGUgbXRkY29yZS5jJ3MgaGVscGVycwo+
ID4gPiAobXRkX29vYmxheW91dF9zZXQvZ2V0X2RhdGEvZnJlZS9lY2MvYnl0ZXMpLgoKT2ssIEkg
d2lsbCB1c2UgbXRkX29vYmxheW91dF9lY2MgZnVuY3Rpb24uCgo+ID4gPgo+ID4gPiBBbHNvLCB3
aGF0IGFyZSB5b3UgdHJ5aW5nIHRvIGRpc2NyaW1pbmF0ZSB3aXRoIHRoZSByZXR1cm4gY29kZSBv
ZiB0aGUKPiA+ID4gZnVuY3Rpb24/IFNob3VsZG4ndCB0aGlzIGZ1bmN0aW9uICJhbHdheXMiIHdv
cms/Cj4gPgo+ID4gSnVzdCBtYWtpbmcgc3VyZSBpdCBkb2VzbuKAmXQgcmV0dXJuIGFuIEVSQU5H
RSBpbiBjYXNlIGNoaXAtPmVjYy5zaXplIGRvZXNu4oCZdCBtYXRjaCB0aGUgc2VjdGlvbnMgZnJv
bSBtdGQtPm9vYmxheW91dC0+ZWNjLCB3aGljaCBzaG91bGRu4oCZdCBoYXBwZW4sIHNvIEkgdGhp
bmsgd2UgY2FuIHJlbW92ZSB0aGF0Li4uCj4KPiBUaGUgc3R5bGUgd2UgcHJlZmVyIGZvciBlcnJv
ciBjaGVja2luZyBpczoKPgo+ICAgICAgICAgcmV0ID0gZnVuY3Rpb24oKTsKPiAgICAgICAgIGlm
IChyZXQpCj4gICAgICAgICAgICAgICAgIGRvIHNvbWV0aW5nOwo+Cj4gaW5zdGVhZCBvZjoKPgo+
ICAgICAgICAgaWYgKGZ1bmN0aW9uKCkpCj4KPiBBbnl3YXksIEkgcmVhbGx5IGRvbid0IGtub3cg
aWYgaXQgY2FuIGhhcHBlbiBvciBub3QuIEkgc3VwcG9zZSBpdCBkb2VzLgo+IFdoYXQgSSBkb24n
dCB1bmRlcnN0YW5kIGlzIHlvdXIgIm9vYiA9IGNoaXAtPm9vYl9wb2kgKyBvb2JlY2Mub2Zmc2V0
Ii4KPiBJZiB5b3UgZXhwZWN0IGFuIGVycm9yLCB0aGVuIHlvdSBzaG91bGQgbm90IHVwZGF0ZSB0
aGlzIHBvaW50ZXIsIHJpZ2h0PwoKQWZ0ZXIgc3dpdGNoaW5nIHRvIG10ZF9vb2JsYXlvdXRfZWNj
LCBlcnJvciBjaGVja2luZyBpc24ndCBuZWVkZWQgYW55bW9yZS4KCj4KPiBEb24ndCB5b3UgbmVl
ZCB0byB1c2UgMiAqIGkgaW5zdGVhZCBvZiBpIGhlcmU/IEZvbGxvd2luZyB5b3VyIG90aGVyCj4g
Y29udHJpYnV0aW9uLCBzZWN0aW9ucyBhcmUgZGlzdHJpYnV0ZWQgbGlrZSAiZGF0YS9lY2MvZGF0
YS9lY2MvZXRjIi4KCk5vLCB3ZSdyZSBjaGVja2luZyBFQ0MgYnl0ZXMgaW4gdGhlIE9PQiwgbm90
IGFib3V0IHVzYWJsZSBieXRlcyBpbiB0aGUKT09CIGFyZWEsIHdoaWNoIGlzIHdoYXQgbXkgb3Ro
ZXIgcGF0Y2ggY2hhbmdlcy4KCj4KPiA+Cj4gPiA+Cj4gPiA+PiArICAgICAgICAgICAgICAgICAg
b29iID0gTlVMTDsKPiA+ID4+ICsgICAgICAgICAgICAgICAgICBvb2JlY2MubGVuZ3RoID0gMDsK
PiA+ID4+ICsgICAgICAgICAgfSBlbHNlIHsKPiA+ID4+ICsgICAgICAgICAgICAgICAgICBvb2Ig
PSBjaGlwLT5vb2JfcG9pICsgb29iZWNjLm9mZnNldDsKPiA+ID4+ICsgICAgICAgICAgfQo+ID4g
Pj4gKwo+ID4gPj4gKyAgICAgICAgICByZXQgPSBuYW5kX2NoZWNrX2VyYXNlZF9lY2NfY2h1bmso
ZWNjX2NodW5rLCBjaGlwLT5lY2Muc2l6ZSwKPiA+ID4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG9vYiwgb29iZWNjLmxlbmd0aCwKPiA+ID4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwsIDAsCj4gPiA+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjaGlwLT5lY2Muc3RyZW5n
dGgpOwo+ID4gPgo+ID4gPiBBcyBJIHRvbGQgeW91LCB0aGlzIGhlbHBlciB0YWtlcyAibWFpZCBk
YXRhIiB0aGVuICJzcGFyZSBhcmVhIiB0aGVuCj4gPiA+ICJlY2MgYnl0ZXMiLiBUaGUgbmFtZXMg
YXJlIHByZXR0eSBpbXBvcnRhbnQgaGVyZSBhcyB5b3Ugd2FudCB0byBhdm9pZAo+ID4gPiBjaGVj
a2luZyB0aGUgc3BhcmUgT09CIGJ5dGVzIG9uIHB1cnBvc2UsIHNvIG1heWJlIHlvdSBjb3VsZCBo
YXZlIG1vcmUKPiA+ID4gbWVhbmluZ2Z1bCBuYW1lcyBhbmQgY2FsbCAiZWNjIiBpbnN0ZWFkIG9m
ICJvb2IiIHRoZSBlY2MgcmVnaW9uPwo+ID4KPiA+IEFjdHVhbGx5IEkgdGhvdWdodCB5b3UgbWVh
bnQgdGhlIGNvbW1pdCBsb2csIG5vdCB0aGUgY29kZSBpdHNlbGYuLi4KPgo+IE5vIHByb2JsZW0g
OykgSSBtZWFudCBib3RoIGFjdHVhbGx5LCBBbmQgSSB0aGluayB5b3Ugc2hvdWxkIG5hbWUgdGhl
Cj4gb29iIHBvaW50ZXIgZWNjX2J5dGVzLgo+Cj4gPgo+ID4gPgo+ID4gPj4gICAgICAgICAgICBp
ZiAocmV0IDwgMCkKPiA+ID4+ICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gPgo+
ID4gPgo+ID4gPiBUaGFua3MsCj4gPiA+IE1pcXXDqGwKPiA+Cj4gPiBSZWdhcmRzLAo+ID4gw4Fs
dmFyby4KPiA+Cj4KPgo+Cj4KPiBUaGFua3MsCj4gTWlxdcOobAoKUmVnYXJkcywKw4FsdmFyby4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
