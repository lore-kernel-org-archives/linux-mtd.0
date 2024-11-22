Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791F3E65D25
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Nov 2024 05:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XibkCGeGwkzcif1/gda9hxhNr+AWU4bXXl1s4YpGHJg=; b=cWXnnLuxEFA0O2
	o1oxerHRi+DPtn5Z74Zg+2yi2dpe74wrup3C3D0r6Bl/K+QFpTzL2MtCdzz+Z60UBXV9AKMBnIaHx
	mui1ZDIg0TuVIo1mSTvqxYt0TwWOB7WFheLjHiQNBKoHUfz4WYv2U9O1sXdPKwsWTldPDzorc5Vy0
	rHHzfFqw+VLmjK6W32nF1pp5U8p8uTke4hIuISXc+zx3hDESIRDSlOWOilo2i1D4oy7emHyQY6HlR
	Rb/QQDSbvl9212DD3OsaubAZJH1hJXKZ2b+EkBZR6HzyvIEyRQ2crxrcdmAElBNdMY63nFaxLVnBp
	un4utxr1aWTrsQo+uM1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEMQB-00000001g6Z-39qS;
	Fri, 22 Nov 2024 05:41:35 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEMQ7-00000001g5o-3sXO
	for linux-mtd@lists.infradead.org;
	Fri, 22 Nov 2024 05:41:34 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ea6f821decso1474068a91.1
        for <linux-mtd@lists.infradead.org>; Thu, 21 Nov 2024 21:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732254090; x=1732858890; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRLhlT6BUPUcyfB1wAf+ZRvTDTQX7bRCFvxCdNEhT0g=;
        b=ZBTr02ak6hFX8yi3AadZCkyNoQtDv/969aGs2qRJIl3v93MaDz0jBCjMOuzyEATUo9
         7CsKGd2nyvoEGAUxJrx6C/pY6wMvmrEUr7iIFwYvpi5+GCVRlj0Hyz1l/eF5zksq6v0E
         xOxwzNT+f6P/VZIwAoY9jdeSuJoMTTANmSOOGQbz8cUf+5l1sUbDGtHOx4np3Nm9R9eK
         wLI+RJYjf1nBreVRzAqD4LZxNth+Wzzptj7luhkAaIPTDHO7NgmywKewxmT1TBBhvJZY
         V6MtG7MpXI0gg4pSmay2VIJSwuKFQ2nBSk1veRcg7BvtBKuc0Fzhx9qt+Rv+OPd8IrzQ
         o5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732254090; x=1732858890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRLhlT6BUPUcyfB1wAf+ZRvTDTQX7bRCFvxCdNEhT0g=;
        b=s503wv2BKBvajQYxoVhYRB21Hg4hqbQS5oqEIpvvw3V6wbgc0Y9hQCcrjewH9P2qte
         VVSNPBekXmy51Q3DpgQ+v3GI1QpvCkX9VbTHHivxw+kRuCbjWVQKX3lomQ566v7M0YWZ
         fu/FXFVsIDIjOnEBQnydKKgLg4XWJbcy3hXE49ZyMuxGQgwVG5w2N0YHzaVFDr6LOu2u
         kp/hgfRf+wmL6LFFxMxa1xMYYzVCH3HOxlUtniu+gsOGoqgfc5KGIuWl63QM5bnvgphU
         ATfMSaiCWI6gTvKMSWoXIbvVIETTzzRRsQsZ5Bxs1cHBJULtTdNe5LNl9XEtQc7aTF5j
         iayQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUYUMsHJmakFZVARZ+FHskIM8YxK2h8H7+4Uw96NLaKFQPslUcy+iRoReVjxEhEGWSnOa6pHOTds8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWSHCpLZeQ51NP8/WZNkkSo8nC3WQuEJMzbO0fSRSO+9xdNyJV
	COc2Q6152/3+vFT+qgop2toVSgih1hWB5brousihPfU7VoxObwGaGwBNvP9QwvV0b9K0bHDjsfF
	+qTwsndH73ubuo64b3siSMkSclW+Vyw==
X-Gm-Gg: ASbGncuZ3NCqqWieZkp6283zdzhckctNmjmLo8bzZBu0rSM/YsQEMSOfPHEV4dCxR0e
	eV6gL3ZYLVgJRaVSYxfCUxsTI7unAw/w=
X-Google-Smtp-Source: AGHT+IEyVCzMcdMryX0lgYESYDrmU9kzmvBbRGqC+o+udh2wOqUaYHFru/zgP8Lgukz/1J57KURts0G6RadctvD7ZfE=
X-Received: by 2002:a17:90b:1b46:b0:2ea:5fed:4a2b with SMTP id
 98e67ed59e1d1-2eb0e2303e4mr2082476a91.15.1732254090490; Thu, 21 Nov 2024
 21:41:30 -0800 (PST)
MIME-Version: 1.0
References: <20241114023528.181583-1-linchengming884@gmail.com>
 <20241114023528.181583-2-linchengming884@gmail.com> <87a5dw25pl.fsf@bootlin.com>
In-Reply-To: <87a5dw25pl.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Fri, 22 Nov 2024 13:39:08 +0800
Message-ID: <CAAyq3SYMh+DDB6Wzh623-0YcBXQ8UoQq4nK5+g5wmy4HyCY1uQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nand: Add read retry support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_214131_978883_844AF379 
X-CRM114-Status: GOOD (  29.35  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjTlubQxMeaciDE45pelIOmAseS4gCDkuIvljYg2OjMx5a+r6YGT77yaCj4KPgo+IEhpIENo
ZW5nIE1pbmcsCj4KPiBPbiAxNC8xMS8yMDI0IGF0IDEwOjM1OjI3ICswOCwgQ2hlbmcgTWluZyBM
aW4gPGxpbmNoZW5nbWluZzg4NEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBGcm9tOiBDaGVuZyBN
aW5nIExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+ID4KPiA+IFdoZW4gdGhlIGhvc3Qg
RUNDIGZhaWxzIHRvIGNvcnJlY3QgdGhlIGRhdGEgZXJyb3Igb2YgTkFORCBkZXZpY2UsCj4gPiB0
aGVyZSdzIGEgc3BlY2lhbCByZWFkIGZvciBkYXRhIHJlY292ZXJ5IG1ldGhvZCB3aGljaCBob3N0
IHNldHVwcwo+Cj4gSGVyZSBpcyBhIHN1Z2dlc3Rpb24gZm9yIHJld29yZGluZyB0aGUgc2Vjb25k
IHBhcnQgb2YgeW91ciBjb21taXQgbG9nOgo+Cj4gLi4uIHdoaWNoIGNhbiBiZSBzZXR1cCBieSB0
aGUgaG9zdCBmb3IgdGhlIG5leHQgcmVhZC4gVGhlcmUgYXJlIHNldmVyYWwKPiByZXRyeSBsZXZl
bHMgdGhhdCBjYW4gYmUgYXR0ZW1wdGVkIHVudGlsIHRoZSBsb3N0IGRhdGEgaXMgcmVjb3ZlcmVk
IG9yCj4gZGVmaW5pdGVseSBhc3N1bWVkIGxvc3QuCj4KClRoYW5rIHlvdSBmb3IgeW91ciBzdWdn
ZXN0aW9uLiBJIHdpbGwgbWFrZSBhZGp1c3RtZW50cyBiYXNlZCBvbiBpdC4KCj4gPiBmb3IgdGhl
IG5leHQgcmVhZCByZXRyeSBtb2RlIGFuZCBtYXkgcmVjb3ZlciB0aGUgbG9zdCBkYXRhIGJ5IGhv
c3QKPiA+IEVDQyBhZ2Fpbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVuZyBNaW5nIExpbiA8
Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9z
cGkvY29yZS5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiA+ICBp
bmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmggfCAxNCArKysrKysrKysrKysrKwo+ID4gIDIgZmls
ZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9z
cGkvY29yZS5jCj4gPiBpbmRleCA0ZDc2ZjlmNzFhMGUuLmJkNTMzOWEzMDhhYSAxMDA2NDQKPiA+
IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9zcGkvY29yZS5jCj4gPiBAQCAtNjcyLDEwICs2NzIsMTQgQEAgc3RhdGljIGludCBzcGlu
YW5kX210ZF9yZWd1bGFyX3BhZ2VfcmVhZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IGZy
b20sCj4gPiAgICAgICBzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQgPSBtdGRfdG9fc3Bp
bmFuZChtdGQpOwo+ID4gICAgICAgc3RydWN0IG5hbmRfZGV2aWNlICpuYW5kID0gbXRkX3RvX25h
bmRkZXYobXRkKTsKPiA+ICAgICAgIHN0cnVjdCBuYW5kX2lvX2l0ZXIgaXRlcjsKPiA+ICsgICAg
IHN0cnVjdCBtdGRfZWNjX3N0YXRzIG9sZF9zdGF0czsKPgo+IFJldmVyc2UgY2hyaXN0bWFzIHRy
ZWUgaXMgbmljZXIgOikKCkdvdCBpdCEgSSdsbCBtYWtlIHRoZSBjaGFuZ2VzLgoKPgo+ID4gICAg
ICAgYm9vbCBkaXNhYmxlX2VjYyA9IGZhbHNlOwo+ID4gICAgICAgYm9vbCBlY2NfZmFpbGVkID0g
ZmFsc2U7Cj4gPiArICAgICB1bnNpZ25lZCBpbnQgcmV0cnlfbW9kZSA9IDA7Cj4gPiAgICAgICBp
bnQgcmV0Owo+ID4KPiA+ICsgICAgIG9sZF9zdGF0cyA9IG10ZC0+ZWNjX3N0YXRzOwo+ID4gKwo+
ID4gICAgICAgaWYgKG9wcy0+bW9kZSA9PSBNVERfT1BTX1JBVyB8fCAhbXRkLT5vb2JsYXlvdXQp
Cj4gPiAgICAgICAgICAgICAgIGRpc2FibGVfZWNjID0gdHJ1ZTsKPiA+Cj4gPiBAQCAtNjg3LDE4
ICs2OTEsNDMgQEAgc3RhdGljIGludCBzcGluYW5kX210ZF9yZWd1bGFyX3BhZ2VfcmVhZChzdHJ1
Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IGZyb20sCj4gPiAgICAgICAgICAgICAgIGlmIChyZXQp
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPgo+ID4gK3JlYWRfcmV0cnk6Cj4g
PiAgICAgICAgICAgICAgIHJldCA9IHNwaW5hbmRfcmVhZF9wYWdlKHNwaW5hbmQsICZpdGVyLnJl
cSk7Cj4gPiAgICAgICAgICAgICAgIGlmIChyZXQgPCAwICYmIHJldCAhPSAtRUJBRE1TRykKPiA+
ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+Cj4gPiAtICAgICAgICAgICAgIGlmIChy
ZXQgPT0gLUVCQURNU0cpCj4gPiArICAgICAgICAgICAgIGlmIChyZXQgPT0gLUVCQURNU0cgJiYg
c3BpbmFuZC0+c2V0X3JlYWRfcmV0cnkpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAo
c3BpbmFuZC0+cmVhZF9yZXRyaWVzICYmICgrK3JldHJ5X21vZGUgPCBzcGluYW5kLT5yZWFkX3Jl
dHJpZXMpKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBzcGluYW5k
LT5zZXRfcmVhZF9yZXRyeShzcGluYW5kLCByZXRyeV9tb2RlKTsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGlmIChyZXQgPCAwKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGVjY19mYWlsZWQgPSB0cnVlOwo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBicmVhazsKPgo+IFdoYXQgaXMgdGhpcyBicmVhayBnb25uYSBk
bz8gWW91J3JlIG5vdCBpbiBhIGxvb3AuIEkgZG9uJ3QgdGhpbmsgYnJlYWtzCj4gaGF2ZSBhbnkg
ZWZmZWN0IG9uIGlmIGJsb2Nrcy4KClRoZXJlJ3MgYSBuYW5kZGV2X2lvX2Zvcl9lYWNoX3BhZ2Ug
aXRlcmF0aW9uIGFib3ZlLCBzbyB0aGUgYnJlYWsKd2FzIGludGVuZGVkIHRvIHRlcm1pbmF0ZSB0
aGF0IGxvb3AuIEhvd2V2ZXIsIEkgcmVhbGl6ZWQgdGhhdCBicmVhawpzaG91bGQgYmUgcmVwbGFj
ZWQgd2l0aCByZXR1cm4gcmV0IGJlY2F1c2UgaWYgdGhlIHNldCBmZWF0dXJlIG9wZXJhdGlvbgpm
YWlscywgaXQgc2hvdWxkIHJldHVybiB0aGUgZXJyb3IuCgo+Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB9Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAv
KiBSZXNldCBlY2Nfc3RhdHM7IHJldHJ5ICovCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtdGQtPmVjY19zdGF0cyA9IG9sZF9zdGF0czsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGdvdG8gcmVhZF9yZXRyeTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB9IGVs
c2Ugewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogTm8gbW9yZSByZXRyeSBt
b2RlczsgcmVhbCBmYWlsdXJlICovCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBl
Y2NfZmFpbGVkID0gdHJ1ZTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB9Cj4gPiArICAgICAg
ICAgICAgIH0gZWxzZSBpZiAocmV0ID09IC1FQkFETVNHKSB7Cj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgZWNjX2ZhaWxlZCA9IHRydWU7Cj4gPiAtICAgICAgICAgICAgIGVsc2UKPiA+ICsgICAg
ICAgICAgICAgfSBlbHNlIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAqbWF4X2JpdGZsaXBz
ID0gbWF4X3QodW5zaWduZWQgaW50LCAqbWF4X2JpdGZsaXBzLCByZXQpOwo+ID4gKyAgICAgICAg
ICAgICB9Cj4gPgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKClRoYW5rcywKQ2hlbmcgTWluZyBMaW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
