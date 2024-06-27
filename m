Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2597C3064D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 15:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ciEKI+dDSiKX1Ie8EdYBCsKQI6ODEKC7I8iIRcqHT+E=; b=j1mwK4jfbKsovI
	5OH4zGaB8p4CnLWaPmATS7xQuI/SG9fBxsmwwb0Q0rrjGrv2l00AkoZ0TyFjAwgMzzEIhh+L5dWzL
	MutawSvFpeuDRyjXaJtQlYGYdf6Prl0wnJc9YxQOK0nM0vPf/FIkO2mdfgDffb+PQzFGuMJHLc0VA
	Tvq2qcjM4x0GGb4/kviFeZ+OpIWK/tAMjHXtJ981/NaaMXEz8YAIFWq0hTisfJaHG5/YdZrGxTWX5
	1svwnp2cwKWTIwGXPrVLqiAphiEdQZy/jwngZjioVCUSyNaTh0wHHgmaNDtsrO3rE+cFJCYGH0y37
	JMXJZL4CNSNWl3BtJkKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqd1-0000000Akng-0pUS;
	Thu, 27 Jun 2024 15:01:39 +0000
Received: from mail-yb1-f182.google.com ([209.85.219.182])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqcy-0000000Akld-0R7I
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jun 2024 15:01:37 +0000
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dfb05bcc50dso7068780276.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2024 08:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500492; x=1720105292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zg4w7tXCY7d1fGix7mfUzMIgqJ5X93RyC1ZsNDKryqU=;
        b=vpcXVKk2EnKsA1NqhPWnNyQUqr97KMvloZQSOlKpKqt9C+SO0v8BEQobxxU8IaZeFB
         r77ZltO7UUk5gOBerO159dGc7aEFkXzrFNPgcbYO/FyvZoZnB0q36KVnwyyrvoJ81eoZ
         j1FiYcyeAj+WUnTNIKC5OW/t9abHv4pZ4ZjTAACyYsbM14TWCAnZCFCY746rOYFtWZwu
         QPrrtqCrta1QgouoZD/K8OqeBIBc+g3gdAXOJxe0jItK4UREJwsVjccW/m8dwE+SseD1
         1NtyeFXtTRPw18RmgIxUzH55+JSOymMWGRIdJQ7/sEQiobZeUneTc5a5538kEP5usVSZ
         eczA==
X-Forwarded-Encrypted: i=1; AJvYcCUJR/SvRfOhFQoMydsk2kt2HwpDbC6b6x6XGDOc3wdzag5ASvg4Dep2Ln6e5nGD83c8hQ7W/InvDcx0AyzFSYa7eC7oQ9wBdngPXkkUiQ==
X-Gm-Message-State: AOJu0Yyje8sQWlhb+WDcmX7APDKjS2dnl1TWtt95wEcSUraxegihvrmV
	kpj0JEX7US+XxdrpBlcG5X54igzLiB9ChyGmVtQ6t1Tqw+ExFKKq6PTNF5+R
X-Google-Smtp-Source: AGHT+IHlMgbDHOF1hkGiBpx24nNFmRlcGNtxWT/jWfq+PxJlxvtEGqRGZpiLg+1YcaTJ6DPNSSe1LQ==
X-Received: by 2002:a0d:ea10:0:b0:627:7630:800a with SMTP id 00721157ae682-643acb19ba3mr130535827b3.49.1719500491852;
        Thu, 27 Jun 2024 08:01:31 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6497b00cea7sm2690807b3.146.2024.06.27.08.01.31
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 08:01:31 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dff06b3f413so7441707276.3
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2024 08:01:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXKRe8S1/1UGauJw2enmHaLP5R94la7eOfZtt2B1cfpAMSlT8YSHk5KxK9J2eaRpmCmyPfB2MtXNIcp9p5iHZzUAPAGN4q5VBSwbz7vmQ==
X-Received: by 2002:a05:690c:f0a:b0:63b:d0df:ffe5 with SMTP id
 00721157ae682-643ac81d7b3mr161262737b3.45.1719500490444; Thu, 27 Jun 2024
 08:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240620-upstream-nfc-mcf5441x-v1-1-69b64807d7a6@yoseli.org>
In-Reply-To: <20240620-upstream-nfc-mcf5441x-v1-1-69b64807d7a6@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Jun 2024 17:01:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6z6OST=U3cvt3NRe3nj7DKCf+0O4v9s14ZV-j2v=qrA@mail.gmail.com>
Message-ID: <CAMuHMdV6z6OST=U3cvt3NRe3nj7DKCf+0O4v9s14ZV-j2v=qrA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Add support for M5441x NFC
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Stefan Agner <stefan@agner.ch>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_080136_168117_4C85AC9D 
X-CRM114-Status: GOOD (  34.22  )
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

SGkgSmVhbi1NaWNoZWwsCgpPbiBUaHUsIEp1biAyMCwgMjAyNCBhdCA2OjI14oCvUE0gSmVhbi1N
aWNoZWwgSGF1dGJvaXMKPGplYW5taWNoZWwuaGF1dGJvaXNAeW9zZWxpLm9yZz4gd3JvdGU6Cj4g
VGhlIHZmNjEwX25mYyBkcml2ZXIgaXMgYWxzbyB0aGUgb25lIHdoaWNoIHNob3VsZCBiZSB1c2Vk
IGZvciB0aGUKPiBjb2xkZmlyZSBzZXJpZXMuIFNhZGx5LCB0aGVzZSBkZXZpY2UgZG9uJ3Qgc3Vw
cG9ydCBkZXZpY2UtdHJlZSBhbmQgc28gd2UKPiBuZWVkIHRvIGRvIGEgZmV3IG1vZGlmaWNhdGlv
bnM6Cj4gLSBBZGFwdCB0aGUgcHJvYmUgdG8gdXNlIHBkYXRhIGlmIGF2YWlsYWJsZQo+IC0gQWRk
IGEgbmV3IHZhcmlhbnQgYXMgdGhlcmUgaXMgYSBzbWFsbCBwYXJ0IHRvIGFkYXB0IGluCj4gICB2
ZjYxMF9uZmNfc2VsZWN0X3RhcmdldCgpCj4gLSBBZGQgdGhlIGNvcnJlc3BvbmRpbmcgbWlzc2lu
ZyByZWdpc3RlciBkZWZpbml0aW9ucwo+Cj4gVGVzdGVkIHN1Y2Nlc3NmdWxseSBvbiBhIDU0NDE4
IGN1c3RvbSBib2FyZCB3aXRoIGEgcmF3IE5BTkQ6Cj4gWyAgICAyLjY0MDAwMF0gbmFuZDogZGV2
aWNlIGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4MmMsIENoaXAgSUQ6IDB4ZGMKPiBbICAgIDIu
NjUwMDAwXSBuYW5kOiBNaWNyb24gTVQyOUY0RzA4QUJBREFXUAo+IFsgICAgMi42NTAwMDBdIG5h
bmQ6IDUxMiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOiAyMDQ4LCBP
T0Igc2l6ZTogNjQKPgo+IFNpZ25lZC1vZmYtYnk6IEplYW4tTWljaGVsIEhhdXRib2lzIDxqZWFu
bWljaGVsLmhhdXRib2lzQHlvc2VsaS5vcmc+CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCgo+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3ZmNjEwX25mYy5jCj4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvdmY2MTBfbmZjLmMKPiBAQCAtODEwLDYgKzg0MCw3IEBAIHN0YXRpYyBpbnQgdmY2
MTBfbmZjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICBzdHJ1
Y3QgdmY2MTBfbmZjICpuZmM7Cj4gICAgICAgICBzdHJ1Y3QgbXRkX2luZm8gKm10ZDsKPiAgICAg
ICAgIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXA7Cj4gKyAgICAgICBzdHJ1Y3QgbmFuZF9jaGlwICpw
ZGF0YTsKPiAgICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqY2hpbGQ7CgpBcyByZXBvcnRlZCBi
eSB0aGUgcm9ib3QsIHRoaXMgaXMgbm93IHVudXNlZC4KCj4gICAgICAgICBpbnQgZXJyOwo+ICAg
ICAgICAgaW50IGlycTsKPiBAQCAtODIwLDMwICs4NTEsNTMgQEAgc3RhdGljIGludCB2ZjYxMF9u
ZmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPgo+ICAgICAgICAgbmZjLT5k
ZXYgPSAmcGRldi0+ZGV2Owo+ICAgICAgICAgY2hpcCA9ICZuZmMtPmNoaXA7Cj4gKyAgICAgICBw
ZGF0YSA9IGRldl9nZXRfcGxhdGRhdGEoJnBkZXYtPmRldik7Cj4gKyAgICAgICBpZiAocGRhdGEp
Cj4gKyAgICAgICAgICAgICAgICpjaGlwID0gKnBkYXRhOwo+ICsKPiAgICAgICAgIG10ZCA9IG5h
bmRfdG9fbXRkKGNoaXApOwo+Cj4gICAgICAgICBtdGQtPm93bmVyID0gVEhJU19NT0RVTEU7Cj4g
ICAgICAgICBtdGQtPmRldi5wYXJlbnQgPSBuZmMtPmRldjsKPiAtICAgICAgIG10ZC0+bmFtZSA9
IERSVl9OQU1FOwo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBXZSBrZWVwIHRoZSBNVEQg
bmFtZSB1bmNoYW5nZWQgdG8gYXZvaWQgYnJlYWtpbmcgcGxhdGZvcm1zCj4gKyAgICAgICAgKiB3
aGVyZSB0aGUgTVREIGNtZGxpbmUgcGFyc2VyIGlzIHVzZWQgYW5kIHRoZSBib290bG9hZGVyCj4g
KyAgICAgICAgKiBoYXMgbm90IGJlZW4gdXBkYXRlZCB0byB1c2UgdGhlIG5ldyBuYW1pbmcgc2No
ZW1lLgo+ICsgICAgICAgICovCj4gKyAgICAgICBpZiAoIW5mYy0+ZGV2LT5vZl9ub2RlKQo+ICsg
ICAgICAgICAgICAgICBtdGQtPm5hbWUgPSAiTkFORCI7Cj4gKyAgICAgICBlbHNlCj4gKyAgICAg
ICAgICAgICAgIG10ZC0+bmFtZSA9IERSVl9OQU1FOwo+Cj4gICAgICAgICBpcnEgPSBwbGF0Zm9y
bV9nZXRfaXJxKHBkZXYsIDApOwo+ICAgICAgICAgaWYgKGlycSA8IDApCj4gICAgICAgICAgICAg
ICAgIHJldHVybiBpcnE7Cj4KPiAgICAgICAgIG5mYy0+cmVncyA9IGRldm1fcGxhdGZvcm1faW9y
ZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKPiAtICAgICAgIGlmIChJU19FUlIobmZjLT5yZWdzKSkK
PiArICAgICAgIGlmIChJU19FUlIobmZjLT5yZWdzKSkgewo+ICsgICAgICAgICAgICAgICBkZXZf
ZXJyKG5mYy0+ZGV2LCAiVW5hYmxlIHRvIG1hcCByZWdpc3RlcnMhXG4iKTsKPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIFBUUl9FUlIobmZjLT5yZWdzKTsKPiArICAgICAgIH0KPgo+ICsjaWZkZWYg
Q09ORklHX09GCgpEbyB5b3UgbmVlZCBhbGwgdGhlICNpZmRlZmZlcnk/Cgo+ICAgICAgICAgbmZj
LT5jbGsgPSBkZXZtX2Nsa19nZXRfZW5hYmxlZCgmcGRldi0+ZGV2LCBOVUxMKTsKClBlcmhhcHMg
cmVwbGFjZSBieSBkZXZtX2Nsa19nZXRfb3B0aW9uYWxfZW5hYmxlZCgpIGluc3RlYWQ/Cgo+ICAg
ICAgICAgaWYgKElTX0VSUihuZmMtPmNsaykpIHsKPiAgICAgICAgICAgICAgICAgZGV2X2Vycihu
ZmMtPmRldiwgIlVuYWJsZSB0byBnZXQgYW5kIGVuYWJsZSBjbG9jayFcbiIpOwo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gUFRSX0VSUihuZmMtPmNsayk7Cj4gICAgICAgICB9Cj4KPiAtICAgICAg
IG5mYy0+dmFyaWFudCA9IChlbnVtIHZmNjEwX25mY192YXJpYW50KWRldmljZV9nZXRfbWF0Y2hf
ZGF0YSgmcGRldi0+ZGV2KTsKPiAtICAgICAgIGlmICghbmZjLT52YXJpYW50KQo+IC0gICAgICAg
ICAgICAgICByZXR1cm4gLUVOT0RFVjsKPiArICAgICAgIGNvbnN0IHZvaWQgKmRhdGEgPSBkZXZp
Y2VfZ2V0X21hdGNoX2RhdGEoJnBkZXYtPmRldik7Cj4KPiArICAgICAgIG5mYy0+dmFyaWFudCA9
IChlbnVtIHZmNjEwX25mY192YXJpYW50KWRhdGE7Cj4gKyAgICAgICBpZiAoIW5mYy0+dmFyaWFu
dCkgewo+ICsgICAgICAgICAgICAgICBkZXZfZXJyKG5mYy0+ZGV2LCAiTm8gdmFyaWFudCBkYXRh
IGZvdW5kIVxuIik7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+ICsgICAgICAg
fQo+ICsjZWxzZQo+ICsgICAgICAgbmZjLT52YXJpYW50ID0gKGVudW0gdmY2MTBfbmZjX3Zhcmlh
bnQpcGxhdGZvcm1fZ2V0X2RldmljZV9pZChwZGV2KS0+ZHJpdmVyX2RhdGE7Cj4gKyNlbmRpZgo+
ICsjaWZkZWYgQ09ORklHX09GCj4gICAgICAgICBmb3JfZWFjaF9hdmFpbGFibGVfY2hpbGRfb2Zf
bm9kZShuZmMtPmRldi0+b2Zfbm9kZSwgY2hpbGQpIHsKCmZvcl9lYWNoX2F2YWlsYWJsZV9jaGls
ZF9vZl9ub2RlX3Njb3BlZCguLi4pLCBzbyB0aGUgY2hpbGQgdmFyaWFibGUKbm8gbG9uZ2VyIG5l
ZWRzIHRvIGJlIGRlY2xhcmVkIGF0IHRoZSB0b3AuCgo+ICAgICAgICAgICAgICAgICBpZiAob2Zf
ZGV2aWNlX2lzX2NvbXBhdGlibGUoY2hpbGQsICJmc2wsdmY2MTAtbmZjLW5hbmRjcyIpKSB7Cj4K
PiBAQCAtODYyLDYgKzkxNiwxMCBAQCBzdGF0aWMgaW50IHZmNjEwX25mY19wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgICAgICAgICBkZXZfZXJyKG5mYy0+ZGV2
LCAiTkFORCBjaGlwIHN1Yi1ub2RlIG1pc3NpbmchXG4iKTsKPiAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FTk9ERVY7Cj4gICAgICAgICB9Cj4gKyNlbHNlCj4gKyAgICAgICBuZmMtPmNsayA9IE5V
TEw7Cj4gKyAgICAgICBtdGQtPmRldi5wYXJlbnQgPSAmcGRldi0+ZGV2Owo+ICsjZW5kaWYKPgo+
ICAgICAgICAgY2hpcC0+b3B0aW9ucyB8PSBOQU5EX05PX1NVQlBBR0VfV1JJVEU7Cj4KCkdye29l
dGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBV
eXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0
QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
