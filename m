Return-Path: <SRS0=Ud6c=HD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85E4C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 15:09:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35D4264DAD
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 15:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35D4264DAD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pX0KBjbUGgnpSwSi0iJMTr5Ni6y/B1kdjXAX9cRUqX0=; b=2vB+IVTMSE5UrkqAoYseRXJ36
	eWQ78QQHusa3tCWpvQqIJN28ISrKe1rVlKutmaah1e59MNytqGEqR2Aqe1km5EgfUwKEd5NlAGJSy
	b5mJewscqCpWKFD2UG/yC04R+CUkdCSyI/5AiapVDFs3cqO01aEGlkN0/+HZDcnE3DvH1+wnqZ7nE
	Ymw6JCvbnHFl8QgtD6HkQnTIJf7IwsoQEgoJ3fMaGNe1STSjJBvGG9oy7mf+u5++bHIEVtMA/VQqQ
	Mg5Qg8vjrLMEwBd5fYEl9JxoGKc++Fk8b17ylIesQQ6iuJ0On+d/JLFLeXPCVOSFfqYt+MSnqJZBp
	9g3oIJHhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6aoi-0002II-8j; Mon, 01 Feb 2021 15:08:40 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6aoe-0002Gw-Hw
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2021 15:08:37 +0000
Received: by mail-wr1-x429.google.com with SMTP id p15so16896965wrq.8
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2021 07:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sKZCIZQEB1VdwiH3eeQ7BqNO5/rBGycAJwDyARniOm0=;
 b=PoY/NaajLHvtGfgzOZXpShx+7tU3a7ipthI1IC2j088YZyTX7PJ8c+GnFAd1pUqkD6
 TOsfW+8pjbnQjlwb+xU/c5/0sQVyKanrmWDJmwF9TsGHz8KKee3wMVAEJemVduOxM+yy
 zhbmLRDtA4CKy5WWZXgzDLgFYMF+xCDOdnwhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sKZCIZQEB1VdwiH3eeQ7BqNO5/rBGycAJwDyARniOm0=;
 b=cMnM1SYxbuLbeS0vYiZ7CtyTMrkmU8eTyulmQKYn3GdQ5/qF+mJ5x1NKIIQfbfNdQr
 EDDHANvoRaXVVjFj70ZgqQh6X9Qyqa7cj+hCtt/sXLYbwx66uplZ/SpNoX4D6/QdH9NK
 1vzt5qASaeF9wMJfvr58dBJWr/80E8TL7XsrZ6WU77fNqjgQ0wdWQZRlLuYKSighvU81
 +K4/JPJg2IoGiAAMM1mgsX4PqRyG1RjBhzbtdRes4XAhjFajELTGD31Z0arSaq3bip9H
 /SA86uQdN8u6BBqkD9K/Db7tmIRVXMbFWDhA5y/6gbo3fHex2iQM84sL5z3TZoPY7vYK
 VxRA==
X-Gm-Message-State: AOAM531c82IeQykbilmlEy3sZUZhJodVthTbGQEqZwrBAeV4/XSMc2zV
 vppCeafGmyiGBmP/8ZB7/uPZ0O47jEbM5VR8RMYwTA==
X-Google-Smtp-Source: ABdhPJzGSvSaln+Ps5zSiIM6fIrYFKFcX+SfHIHrLZIheqPndLu8R1wPCgkAOB7k5LwoJ5/3FiBV4Mr+ETW1WgDbFP8=
X-Received: by 2002:a05:6000:1547:: with SMTP id
 7mr18837263wry.301.1612192114936; 
 Mon, 01 Feb 2021 07:08:34 -0800 (PST)
MIME-Version: 1.0
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20190730103822.7576645d@xps13>
 <0a6afd79-d5ca-24da-a62c-11146a3522f6@kernel.org>
 <20190731082823.6284f5a9@collabora.com>
 <e47b1de2-501a-9a1f-e980-48d2c396811a@kernel.org>
 <20190802145109.00c4a4eb@collabora.com>
 <b739696d-bb1d-bb04-cd45-3019712e29ad@kernel.org>
 <20190808183651.7c0962e7@collabora.com>
 <694cb2ac-68e6-72b1-3d55-e405b176a17f@kernel.org>
 <20190809082356.0cf60555@collabora.com>
 <ce7157e2-a8d0-7204-4003-8a711acb65b8@kernel.org>
 <20190809093235.09d89e20@collabora.com>
 <c5af9334-f679-6fc9-4d2a-1366a295598a@kernel.org>
 <20190809155934.40c43f29@collabora.com>
 <00b31833-69ba-42c5-57c9-37fa1f70efc5@kernel.org>
 <20190812093129.75888dad@collabora.com>
 <a47792dc-b19f-8af3-8748-5a21fb63271e@kernel.org>
 <CAOf5uwmPzCU8WFRQ1tQBdN7OVGZZ9SvdAG0YqVAyxmA1zwtUhg@mail.gmail.com>
 <2e9e1f1c-ee57-425d-1791-70c66de52637@kernel.org>
 <CAOf5uwm93+ARf=_BckjMar1tpeBs6YHeUwORj5cyhFfvu5fNWQ@mail.gmail.com>
 <20210201151335.210af8ca@xps13>
 <CAOf5uwkivHhMX_mPJymBZxQge_wc4K1p_1S3gsQYHPV40aaj3w@mail.gmail.com>
In-Reply-To: <CAOf5uwkivHhMX_mPJymBZxQge_wc4K1p_1S3gsQYHPV40aaj3w@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 1 Feb 2021 16:08:23 +0100
Message-ID: <CAOf5uwnXB-2xXXXxvH9Fo3ngscccA5Hv7iNTbUYRNFs_iLGJqw@mail.gmail.com>
Subject: Re: GPMI iMX6ull timeout on DMA
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_100836_718045_086BFDC4 
X-CRM114-Status: GOOD (  27.42  )
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
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Greg Ungerer <gerg@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkKCk9uIE1vbiwgRmViIDEsIDIwMjEgYXQgMzozMiBQTSBNaWNoYWVsIE5henphcmVubyBUcmlt
YXJjaGkKPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlOgo+Cj4gSGkKPgo+IE9u
IE1vbiwgRmViIDEsIDIwMjEgYXQgMzoxMyBQTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBNaWNoYWVsLAo+ID4KPiA+IE1pY2hhZWwg
TmF6emFyZW5vIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGUg
b24KPiA+IFNhdCwgMzAgSmFuIDIwMjEgMTA6NDE6MjkgKzAxMDA6Cj4gPgo+ID4gPiBIaSBNaXF1
ZWwKPiA+ID4KPiA+ID4gY29tbWl0IGY4ZTZhZDE0Mzg4MDY3ZjkxYjI2ZDA0NDE4NWQ5NTYyM2Zi
Yzk1MzUKPiA+ID4gQXV0aG9yOiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29s
dXRpb25zLmNvbT4KPiA+ID4gRGF0ZTogICBGcmkgSmFuIDI5IDA4OjQ2OjUzIDIwMjEgKzAxMDAK
PiA+ID4KPiA+ID4gICAgIG10ZDogbmFuZDogQ2FsY3VsYXRlIHRoZSBjbG9jayBiZWZvcmUgZW5h
YmxlIGl0Cj4gPiA+Cj4gPiA+ICAgICBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFRyaW1hcmNoaSA8
bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+ID4gICAgIENoYW5nZS1JZDogSTc5YjBk
YTM5ZGUwYTliMzJlYTBiMDAyZmEyMDBkN2Y0NGQ0ZjhjZTcKPiA+ID4KPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLWxpYi5jCj4gPiA+IGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbGliLmMKPiA+ID4gaW5kZXggMzIyYTAw
ODI5MGU1Li4wYmNhNTJiM2JjOGYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2dwbWktbmFuZC9ncG1pLWxpYi5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2dwbWktbmFuZC9ncG1pLWxpYi5jCj4gPiA+IEBAIC0zNzcsNiArMzc3LDcgQEAgc3RhdGljIHZv
aWQgZ3BtaV9uZmNfY29tcHV0ZV90aW1pbmdzKHN0cnVjdAo+ID4gPiBncG1pX25hbmRfZGF0YSAq
dGhpcywKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0
cnVjdCBuYW5kX3Nkcl90aW1pbmdzICpzZHIpCj4gPiA+ICB7Cj4gPiA+ICAgICAgICAgc3RydWN0
IGdwbWlfbmZjX2hhcmR3YXJlX3RpbWluZyAqaHcgPSAmdGhpcy0+aHc7Cj4gPiA+ICsgICAgICAg
c3RydWN0IHJlc291cmNlcyAqciA9ICZ0aGlzLT5yZXNvdXJjZXM7Cj4gPiA+ICAgICAgICAgdW5z
aWduZWQgaW50IGRsbF90aHJlc2hvbGRfcHMgPSB0aGlzLT5kZXZkYXRhLT5tYXhfY2hhaW5fZGVs
YXk7Cj4gPiA+ICAgICAgICAgdW5zaWduZWQgaW50IHBlcmlvZF9wcywgcmVmZXJlbmNlX3Blcmlv
ZF9wczsKPiA+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgZGF0YV9zZXR1cF9jeWNsZXMsIGRhdGFf
aG9sZF9jeWNsZXMsIGFkZHJfc2V0dXBfY3ljbGVzOwo+ID4gPiBAQCAtNDQwLDYgKzQ0MSw4IEBA
IHN0YXRpYyB2b2lkIGdwbWlfbmZjX2NvbXB1dGVfdGltaW5ncyhzdHJ1Y3QKPiA+ID4gZ3BtaV9u
YW5kX2RhdGEgKnRoaXMsCj4gPiA+ICAgICAgICAgICAgICAgICBody0+Y3RybDFuIHw9IEJGX0dQ
TUlfQ1RSTDFfUkROX0RFTEFZKHNhbXBsZV9kZWxheV9mYWN0b3IpIHwKPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgQk1fR1BNSV9DVFJMMV9ETExfRU5BQkxFIHwKPiA+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVzZV9oYWxmX3BlcmlvZCA/IEJNX0dQTUlfQ1RS
TDFfSEFMRl9QRVJJT0QgOiAwKTsKPiA+ID4gKwo+ID4gPiArICAgICAgIGNsa19zZXRfcmF0ZShy
LT5jbG9ja1swXSwgaHctPmNsa19yYXRlKTsKPiA+ID4gIH0KPiA+ID4KPiA+ID4gIHZvaWQgZ3Bt
aV9uZmNfYXBwbHlfdGltaW5ncyhzdHJ1Y3QgZ3BtaV9uYW5kX2RhdGEgKnRoaXMpCj4gPiA+IEBA
IC00NDksOCArNDUyLDYgQEAgdm9pZCBncG1pX25mY19hcHBseV90aW1pbmdzKHN0cnVjdCBncG1p
X25hbmRfZGF0YSAqdGhpcykKPiA+ID4gICAgICAgICB2b2lkIF9faW9tZW0gKmdwbWlfcmVncyA9
IHItPmdwbWlfcmVnczsKPiA+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgZGxsX3dhaXRfdGltZV91
czsKPiA+ID4KPiA+ID4gLSAgICAgICBjbGtfc2V0X3JhdGUoci0+Y2xvY2tbMF0sIGh3LT5jbGtf
cmF0ZSk7Cj4gPiA+IC0KPiA+ID4gICAgICAgICB3cml0ZWwoaHctPnRpbWluZzAsIGdwbWlfcmVn
cyArIEhXX0dQTUlfVElNSU5HMCk7Cj4gPiA+ICAgICAgICAgd3JpdGVsKGh3LT50aW1pbmcxLCBn
cG1pX3JlZ3MgKyBIV19HUE1JX1RJTUlORzEpOwo+ID4gPgo+ID4gPiBSaWdodCBub3cgSSBoYXZl
IHRoaXMgY2hhbmdlIGFwcGxpZWQgYW5kIHNlZW1zIGZpbmUuIFRoYXQgaXMgdGhlIG9ubHkKPiA+
ID4gZGlmZmVyZW5jZSBJIGdldC4gQ2xvY2sgaXMgYXBwbHkgYSBiaXQgZWFybGllciB0aGF0IHdo
ZW4gaXMgZW5hYmxlZAo+ID4gPiBpdC4KPiA+Cj4gPiBUaGlzIGlzIHZlcnkgaW50ZXJlc3Rpbmcu
IFNvIHRoaXMgd291bGQgbWVhbiB0aGUgaXNzdWUgeW91IGFyZQo+ID4gZXhwZXJpZW5jaW5nIGNv
bWVzIGZyb20gdGhlIGNsb2NrIGRyaXZlciB3aGljaCBraW5kIG9mIHJldHVybnMgdG9vCj4gPiBl
YXJseSBmcm9tIGNsa19zZXRfcmF0ZSgpPyBDb3VsZCB5b3UgcmVwb3J0IHRoaXMgdG8gdGhlIGNs
ayBNTC9OWFAgY2xrCj4gPiBtYWludGFpbmVycyBhbmQga2VlcCB1cyBpbiBjb3B5PyBJZiBpdCBp
cyBhcyBnbG9iYWwgYXMgaXQgc291bmRzLCB3ZQo+ID4gbWlnaHQgbm90IGJlIHRoZSBvbmx5IG9u
ZXMgYWZmZWN0ZWQuCj4gPgo+Cj4gVGhlIGlteDI4IGlzIGJyb2tlbiB0b28sIHNvIGl0J3MgYSBn
ZW5lcmFsIHByb2JsZW0uIEkgbmVlZCB0byB0cmFjZSBpdCBkb3duCj4gSSBoYXZlIGEgcmV2ZXJ0
aW5nIGZvciBsdHMgYnV0IGl0XHMgbm90IHRoZSB3YXkgdG8gZ28KPgoKRm9yIGlteDI4IHlvdSBh
c2sgdG8gc2V0IHRoZSByYXRlIHRvIDIyTWh6IGJ1dCB5b3UgZG9uJ3QgY2FyZSBhYm91dCB0aGUg
Y2xvY2sKdGhhdCB5b3UgZ2V0IGJhY2suIFlvdSBnZXQgYmFjayAxMk1oeiBiZWNhdXNlIHRoZSBi
YXNlIGNsb2NrIGlzIDI0IE1oeiBhbmQgc2VlbXMKdGhhdCBpdCBjYW4gbm90IGdldCB0aGUgcG9p
bnQuIFlvdSBuZWVkIHRvIGNoZWNrIGlmIHRoZSBjbG9jawpyZXF1ZXN0ZWQgaXMgaW4gcmFuZ2Ug
b3IgYXNrCmZvciBzZXRfcmF0ZV9jbGtfbWluIHRvIGF2b2lkIHRvIGhhdmUgc29tZW50aGluZyBs
b3dlci4gVGhlbiBmb3IKaW14NnVsbCBiZWNhdXNlIGlzIHNwb3JhZGljCkkgdGhpbmsgdGhhdCBp
cyBtb3JlIGNvbm5lY3RlZCB0byB0aGUgY2xrX3NldF9yYXRlIGFuZCB3aGVuIHlvdSBjaGFuZ2UK
dGhlIHJlZ2lzdGVyLiBDYW4gbm90IGJlIGEKc2V0dGluZyB0aW1lPwoKTWljaGFlbAoKPiBNaWNo
YWVsCj4KPiA+IFRoYW5rcywKPiA+IE1pcXXDqGwKPgo+Cj4KPiAtLQo+IE1pY2hhZWwgTmF6emFy
ZW5vIFRyaW1hcmNoaQo+IEFtYXJ1bGEgU29sdXRpb25zIEJWCj4gQ09PIENvLUZvdW5kZXIKPiBD
cnVxdWl1c2thZGUgNDcgQW1zdGVyZGFtIDEwMTggQU0gTkwKPiBULiArMzEoMCk4NTExMTkxNzIK
PiBNLiArMzkoMCkzNDc5MTMyMTcwCj4gW2Bhc10gaHR0cHM6Ly93d3cuYW1hcnVsYXNvbHV0aW9u
cy5jb20KCgoKLS0gCk1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaQpBbWFydWxhIFNvbHV0aW9u
cyBCVgpDT08gQ28tRm91bmRlcgpDcnVxdWl1c2thZGUgNDcgQW1zdGVyZGFtIDEwMTggQU0gTkwK
VC4gKzMxKDApODUxMTE5MTcyCk0uICszOSgwKTM0NzkxMzIxNzAKW2Bhc10gaHR0cHM6Ly93d3cu
YW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
