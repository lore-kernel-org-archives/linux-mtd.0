Return-Path: <SRS0=z9um=NK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BD8C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 07:22:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6359C60E78
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 07:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6359C60E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Ipy9FbrhVoO5/JLt3iyI4+nwwp1ay1awAJnqW/TBG0=; b=JNZdGvFEgV7Dky
	rFcm8/rL7ao8dBCdDljvmWnhIpsbHudh7TdnUa1f9kNvg0xQ6ZLl+ssPz/XiyvPjgRTS5FcLVxuk/
	S8TwdsxjJsymMiPewAYUoAN9D851ijEuDQPyGYyPOLXHz7EegL/BkzDzFO+4HmoeFTRFt9OskKBlq
	hclSVkwrt6IjDbjTodwWkC8HFmzaIc0o1I9AZZgBlXvfAaHdfd9hq1H+g51NZ3wq3WC9oHYc4023I
	kbuyYor4XJT6R0rtmjS99UmvHzrFpIu1fp+mN0/4rK4FbJWlv9auPBQcNGaiS0Icr3QjXuesycdCl
	mc3m2MEJf90wEtvtrxnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGcNC-007VXy-3p; Thu, 19 Aug 2021 07:21:58 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGcN9-007VXE-MK
 for linux-mtd@lists.infradead.org; Thu, 19 Aug 2021 07:21:57 +0000
Received: by mail-qk1-x734.google.com with SMTP id y144so6147626qkb.6
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 00:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ngHcFDqQ1j+n3F31ocLMtlBEmQPg6UzMIi3K1sWBYPM=;
 b=Hxz3wXp4xkukyYcRN75ic33Wy9j/OeoWUyhYHcD8T8PrjwTQYhZSUffjx4b5UScAbj
 45blejav29JbC8dMiLpw31qu5nC3Bcrv2JdWaswgL04BS2bWlzrnNIfCnNYhvk0HRgKc
 Y+855ca8divtpuXN03KT98GvduX9L3yKeCoOZKAoh/m9UV+b1HFayFa2OlP5NUKxdh6y
 PGXRVHYOi17DYsz5UhUALl9sg+uu2/qRpLKrCqN5vgLZBtvOoG51hXCHxg1LLrJe62Dd
 pgSVYIsdNg7/drjVWpOkFsBF39Yug7YoovhgotiHU3mv5zUPuFBOUTdUqJlMgoRbTi19
 rVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ngHcFDqQ1j+n3F31ocLMtlBEmQPg6UzMIi3K1sWBYPM=;
 b=V7904nwnnaMC7BwXJfpLX1R1jlnoFfiKUOAaRIDrnft2fdNGB2ZlOka5PSxHJSRKv+
 FIxOU8yEYiemr/HRCiP6uYFpcJAVthLuITfadVNPndgPGGlsFsFfrZEl96W8lE8EUUjM
 sttTTN5WCCxd8JXp9UArqKcFazYg1aPrVu20W1uzKzBkYpLSjIDYj5hfkcP81OKZtUjh
 ee3DEpyJaVOcBRuKy4iCAfmsnD+QSFtEJ/nBt66JFddtm176bfphLwF9FOVN2ogRGbw1
 DYqeMAmH6fln2LL+fHyX5eQey57yzL/jrnHEz4HXntIzJHbRySq6srlDuYewXUEZDPHg
 uSXw==
X-Gm-Message-State: AOAM533Ik5FItF1+Pqczfcl5gjtpUI70QeSiF2pyMw3YLNfHizGoX9iC
 akql8zRCGYWNgDEltwttMILF/pGXXsUrxPBHIa8=
X-Google-Smtp-Source: ABdhPJx0+Gd0tKYQIWj8E5Nl4J1+5LzmOfbJHPwLl1ec1YRNUfof+WFfR6rQwvwAaKe/78NTgvz7TreEfWm4Ssl0MxY=
X-Received: by 2002:a05:620a:2205:: with SMTP id
 m5mr2410153qkh.126.1629357713544; 
 Thu, 19 Aug 2021 00:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210808072643.GA5084@ubuntu> <20210816093126.442f74a1@xps13>
In-Reply-To: <20210816093126.442f74a1@xps13>
From: Kestrel seventyfour <kestrelseventyfour@gmail.com>
Date: Thu, 19 Aug 2021 09:21:42 +0200
Message-ID: <CAE9cyGQ+Bb3rQxiF4My9zXwg_+QYifaCckE=C6spAtN9_4dBFQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use
 device tree setting
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_002155_800046_DEA3C1C6 
X-CRM114-Status: GOOD (  31.20  )
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

SGkgTWlxdcOobAoKQW0gTW8uLCAxNi4gQXVnLiAyMDIxIHVtIDA5OjMxIFVociBzY2hyaWViIE1p
cXVlbCBSYXluYWwKPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Ogo+Cj4gSGkgRGFuaWVsLAo+
Cj4gRGFuaWVsIEtlc3RyZWwgPGtlc3RyZWxzZXZlbnR5Zm91ckBnbWFpbC5jb20+IHdyb3RlIG9u
IFN1biwgOCBBdWcgMjAyMQo+IDA5OjI2OjQzICswMjAwOgo+Cj4gPiBTb21lIGRldmljZXMgdXNl
IE1pY3JvbiBOQU5EIGNoaXBzLCB3aGljaCB1c2Ugb24tZGllIEVDQy4gVGhlIGhhcmRjb2RlZAo+
ID4gc2V0dGluZyBvZiBOQU5EX0VDQ19FTkdJTkVfVFlQRV9TT0ZUIG1ha2VzIHRoZW0gdW51c2Fi
bGUsIGJlY2F1c2UgdGhlCj4gPiBzb2Z0d2FyZSBFQ0Mgb24gdG9wIG9mIHRoZSBoYXJkd2FyZSBF
Q0MgcHJvZHVjZXMgZXJyb3JzIGZvciBldmVyeSByZWFkCj4gPiBhbmQgd3JpdGUgYWNjZXNzLCBu
b3QgdG8gbWVudGlvbiB0aGF0IGJvb3RpbmcgZG9lcyBub3Qgd29yaywgYmVjYXVzZQo+ID4gdGhl
IGJvb3QgbG9hZGVyIHVzZXMgdGhlIGNvcnJlY3QgRUNDIHdoZW4gdHJ5aW5nIHRvIGxvYWQgdGhl
IGtlcm5lbAo+ID4gYW5kIHN0b3BzIGxvYWRpbmcgb24gc2V2ZXJlIEVDQyBlcnJvcnMuCj4gPiBU
aGlzIHBhdGNoIHJlcXVpcmVzIHRoZSBkZXZpY2VzIHRoYXQgY3VycmVudGx5IHdvcmsgd2l0aCB0
aGUgaGFyZCBjb2RlZAo+ID4gc2V0dGluZyB0byBzZXQgdGhlIG5hbmQtZWNjLW1vZGUgcHJvcGVy
dHkgdG8gc29mdCBpbiB0aGVpciBkZXZpY2UKPiA+IHRyZWUuCj4gPgo+Cj4gUGxlYXNlIGFkZCBh
IEZpeGVzOiBhbmQgQ2M6IHN0YWJsZSB0YWdzLCB5b3Ugd2lsbCBhbHNvIG5lZWQgdG8gc2VuZCB0
bwo+IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgYSBkaWZmZXJlbnQgdmVyc2lvbiBvZiB0aGUgcGF0
Y2ggZm9yIHRoZSBrZXJuZWwKPiA1LjQgSUlVQy4KPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVs
IEtlc3RyZWwgPGtlc3RyZWxzZXZlbnR5Zm91ckBnbWFpbC5jb20+Cj4gPiBUZXN0ZWQtYnk6IEFs
ZWtzYW5kZXIgSmFuIEJhamtvd3NraSA8b2xlazJAd3AucGw+ICMgdGVzdGVkIG9uIEJUIEhvbWUg
SHViIDVBCj4gPiAtLS0KPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy94d2F5X25hbmQuYyB8IDIg
LS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcveHdheV9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy94d2F5X25hbmQuYwo+ID4gaW5kZXggMjY3NTE5NzZlNTAyLi4wYTRiMGFhN2RkNGMgMTAwNjQ0
Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy94d2F5X25hbmQuYwo+ID4gKysrIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcveHdheV9uYW5kLmMKPiA+IEBAIC0xNDgsOCArMTQ4LDYgQEAgc3Rh
dGljIHZvaWQgeHdheV93cml0ZV9idWYoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3QgdV9j
aGFyICpidWYsIGludCBsZW4pCj4gPgo+ID4gIHN0YXRpYyBpbnQgeHdheV9hdHRhY2hfY2hpcChz
dHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ID4gIHsKPiA+IC0gICAgIGNoaXAtPmVjYy5lbmdpbmVf
dHlwZSA9IE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQ7Cj4gPiAtCj4gPiAgICAgICBpZiAoY2hp
cC0+ZWNjLmFsZ28gPT0gTkFORF9FQ0NfQUxHT19VTktOT1dOKQo+ID4gICAgICAgICAgICAgICBj
aGlwLT5lY2MuYWxnbyA9IE5BTkRfRUNDX0FMR09fSEFNTUlORzsKPgo+IFlvdSBhbHNvIG5lZWQg
dG8gb25seSBzZXQgdGhlIEhhbW1pbmcgYWxnb3JpdGhtIHdoZW4gZW5naW5lX3R5cGUgaXMKPiBU
WVBFX1NPRlQuCj4KPiBUaGFua3MsCj4gTWlxdcOobAoKSSBhbSByZWFsbHkgc3RydWdnbGluZyB3
aXRoIHdoYXQgdG8gZG8uIEZvciBvbmUgb2YgdGhlIGFmZmVjdGVkCmRldmljZXMsIHRoZXkgY3Jl
YXRlZCB0d28gZGV2aWNlCnRyZWVzLCBvbmUgZm9yIE1pY3JvbiBhbmQgb25lIGZvciBhbGwgb3Ro
ZXJzLiBXaGljaCBvYnZpb3VzbHkgaGFkIG5vCmVmZmVjdCBkdWUgdG8gdGhlCmhhcmRjb2RlZCBz
ZXR0aW5ncywgd2hpY2ggbGVkIG1lIHRvIFBhdGNoIDIgYW5kIEkgdGhvdWdodCwgc28gYmUgaXQu
CkJ1dCB0aGUgcHJvY2VzcyB0byBmaWd1cmUKb3V0IGlmIG9uZXMgZGV2aWNlIGhhcyBNaWNyb24g
Q2hpcHMgaXMgZXNzZW50aWFsbHkgZmxhc2hpbmcgYW4gaW1hZ2UKYW5kIGlmIGl0IGRvZXMgbm90
IHdvcmssCnVzZSB0aGUgc3RvY2sgT0VNIHJlY292ZXJ5IGFuZCB0cnkgdGhlIG90aGVyIGltYWdl
LgpIb3dldmVyLCBzaW5jZSBNaWNyb24gaXMgdGhlIG9ubHkgY2hpcCB0aGF0IGlzIHRyZWF0ZWQg
ZGlmZmVyZW50bHksIEkgd29uZGVyCmlmIHlvdXIgZmlyc3QgcHJvcG9zYWwsIGV2ZW4gdGhvdWdo
IGl0IGlzIGhhY2t5LCBpcyB0aGUgYmV0dGVyCmFwcHJvYWNoIHRvIHNvbHZlIHRoZSBpc3N1ZQpm
b3IgdGhlIE1pY3JvbiBkZXZpY2VzIG5vdCBib290aW5nIGFuZCB0aHJvd2luZyBFQ0MgZXJyb3Jz
LiBXaGF0IGRvIHlvdSB0aGluaz8KRm9sbG93IHVwIGZpcnN0IHBhdGNoIG9yIHRoaXMgb25lPwoK
VGhhbmtzLCBEYW5pZWwuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
