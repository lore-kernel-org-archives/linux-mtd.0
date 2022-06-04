Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B26C43334
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jun 2022 11:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/kRDsqU1+pgP5aI5p3dwXm+oXU7Ep5h2kqvbbLu/eXw=; b=DryBYbIIP/fZUO
	nIU+IAbUtqzrJAaEXE0rTbRJC4T8RCx/yGEDDS8i4XqbtvW9O8bedYUTUZf2ckzMiLfPevc6uCRZS
	At2PxbxY9NI7DFjod5gQufB61EKISoIE4lWeWx+ty/mM0QEy0UIv1CqHhzUk1UMqRLvw0laKXCiQX
	/bVOSPkdOpqUrz98cEb5khGZprp307puW5WM+KFkA2XBpKBCphhAiLlpS3FjaqGG8+pdArknAJbzh
	cCdJl/sPeS1ZHQ066PYZZEVrB6dJ+z4Uh5Wtk3RBAY8ym5l50w/R66oLvbpIHGIxqxAvJlcpW61Gv
	08mdI17Xjl08lBQz3b2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxRxY-00BF5D-OH; Sat, 04 Jun 2022 11:28:48 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxRxU-00BF43-98
	for linux-mtd@lists.infradead.org; Sat, 04 Jun 2022 11:28:46 +0000
Received: by mail-wr1-x429.google.com with SMTP id m26so1981280wrb.4
        for <linux-mtd@lists.infradead.org>; Sat, 04 Jun 2022 04:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:from:to:cc:subject:date:in-reply-to:message-id
         :mime-version:content-transfer-encoding;
        bh=3uG8xyMjnXx7c6ijyi/jcLDfsclMzUeircX6QJbta/8=;
        b=m3q/TDCe4KEr/Dcx3rCB6H/JPC/jABlp0co9FPBCnoTd9ukVp13ue0JJ0Z+1LWKRr2
         qQd09wlQu34iE3GlCFFAbl1Cm2OnrMKV5m8jLe7q5sMOvd2Z8nQ7HSeKFzcwvOm3jRZI
         hSyLvBDNrE3JWff4zTjo1uY1yCoqZsoza3c+PT5MdbenHjOewpKEb8uL6hfnZAC1O9m3
         YqEybPrN+wUUN/KBL5O7X/MPJa+oKtjxz5eF1AL8DSXWgTTt7RnDbQ+GEHTq3IpmhmZ4
         hQETfZDyIeCHnJcrOGReO5nDwc7zTQp/ELb4T6s7xxz5zHo6I0J2vNKBnlWGvXCvnSk0
         GitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=3uG8xyMjnXx7c6ijyi/jcLDfsclMzUeircX6QJbta/8=;
        b=ZnN+YsItvzof0qrVSDPUWSHbkGSUNgWZxMhCTo9pEwDvprnllHfAcOAlmAulZ0zMQa
         puWOgqAiA8Tr91XAAW1fFaqK72+z7zgt6tQxnN/t+nZUR9/eroFx+YnOinHOvBlcBdQp
         3OeZwabjAKITIWWcroBvT430PSUCKZubEIKs0Ju+zbDqGXxom0O6YUyXF7PItxsN0s0z
         HmlZgR3WuWEiA17CJnDvXaT7H7+odNmRFmGgWSvdBMuRs+J4tZZtoGtP5Sf2jqWUGC3L
         rR191fPvbir5l9oIrRkdkS/1Yvao5W+xY21FXzfTbEhmS2fJQgEhu7kf+nVMcBnvNeEn
         iwtw==
X-Gm-Message-State: AOAM53135KFr72oBb0B36cD9VqV/1s3f4QUeUSVedFE9/kH+ocoDE/FO
	A70A+94q/h4eFefWzQ+RlVI=
X-Google-Smtp-Source: ABdhPJxTtXBhVP7HJ0sDgN5YLAKTZXPZIcQ8MoPwQcPB5Rx9H6+6Jrh/oxVu0meN56FeDIQaYYN0UA==
X-Received: by 2002:adf:fb0d:0:b0:20d:97e:17ce with SMTP id c13-20020adffb0d000000b0020d097e17cemr12586543wrr.585.1654342118252;
        Sat, 04 Jun 2022 04:28:38 -0700 (PDT)
Received: from localhost (92.40.202.89.threembb.co.uk. [92.40.202.89])
        by smtp.gmail.com with ESMTPSA id x14-20020adff0ce000000b00210396b2eaesm12229149wro.45.2022.06.04.04.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 04:28:37 -0700 (PDT)
References: <20220603135149.11570-1-aidanmacdonald.0x0@gmail.com>
 <20220603155600.3eab9890@xps-13>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spinand: Add support for ATO25D1GA
Date: Sat, 04 Jun 2022 12:26:57 +0100
In-reply-to: <20220603155600.3eab9890@xps-13>
Message-ID: <KsriIipAd1t8rfznYrBvTQbGe3yoRXOX@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220604_042844_383957_ACD645C2 
X-CRM114-Status: GOOD (  21.45  )
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

Ck1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyaXRlczoKCj4gSGkg
QWlkYW4sCj4KPiBhaWRhbm1hY2RvbmFsZC4weDBAZ21haWwuY29tIHdyb3RlIG9uIEZyaSwgIDMg
SnVuIDIwMjIgMTQ6NTE6NDkgKzAxMDA6Cj4KPj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBBVE8yNUQx
R0EgU1BJIE5BTkQgZmxhc2guCj4+IAo+PiBEYXRhc2hlZXQ6Cj4+IC0gaHR0cHM6Ly9hdHRhLnN6
bGNzYy5jb20vdXBsb2FkL3B1YmxpYy9wZGYvc291cmNlLzIwMTkxMjEyL0M0NjkzMjBfMDQ1OTlE
NjdCMDNCMDc4MDQ0RUI2NUZGNUFFRERERTkucGRmCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBBaWRh
biBNYWNEb25hbGQgPGFpZGFubWFjZG9uYWxkLjB4MEBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgZHJp
dmVycy9tdGQvbmFuZC9zcGkvTWFrZWZpbGUgfCAgMiArLQo+PiAgZHJpdmVycy9tdGQvbmFuZC9z
cGkvYXRvLmMgICAgfCA4NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAg
ZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jICAgfCAgMSArCj4+ICBpbmNsdWRlL2xpbnV4L210
ZC9zcGluYW5kLmggICB8ICAxICsKPj4gIDQgZmlsZXMgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbXRkL25hbmQv
c3BpL2F0by5jCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvTWFrZWZp
bGUgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9NYWtlZmlsZQo+PiBpbmRleCA4MGRhYmU2ZmYwZjMu
LmFlMTdjMTNkMWFiZSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvTWFrZWZp
bGUKPj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvTWFrZWZpbGUKPj4gQEAgLTEsMyArMSwz
IEBACj4+ICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4+IC1zcGluYW5kLW9i
anMgOj0gY29yZS5vIGdpZ2FkZXZpY2UubyBtYWNyb25peC5vIG1pY3Jvbi5vIHBhcmFnb24ubyB0
b3NoaWJhLm8gd2luYm9uZC5vIHh0eC5vCj4+ICtzcGluYW5kLW9ianMgOj0gYXRvLm8gY29yZS5v
IGdpZ2FkZXZpY2UubyBtYWNyb25peC5vIG1pY3Jvbi5vIHBhcmFnb24ubyB0b3NoaWJhLm8gd2lu
Ym9uZC5vIHh0eC5vCj4KPiBJIHdvdWxkIGtlZXAgY29yZS5vIGZpcnN0IGluIHRoYXQgbGlzdCwg
ZXZlbiBpZiBpdCBicmVha3MgYWxwaGFiZXRpY2FsCj4gb3JkZXJpbmcgc2xpZ2h0bHkgOikKPgo+
IE90aGVyd2lzZSB0aGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZS4KPgoKT2theSwgSSdsbCBzZW5k
IGEgdjIgdG8gZml4IHRoYXQuCgo+PiAgb2JqLSQoQ09ORklHX01URF9TUElfTkFORCkgKz0gc3Bp
bmFuZC5vCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9hdG8uYyBiL2RyaXZl
cnMvbXRkL25hbmQvc3BpL2F0by5jCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAw
MDAwMDAwMDAwMC4uODJiMzc3YzA2ODEyCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvZHJpdmVy
cy9tdGQvbmFuZC9zcGkvYXRvLmMKPj4gQEAgLTAsMCArMSw4NiBAQAo+PiArLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPj4gKy8qCj4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjIg
QWlkYW4gTWFjRG9uYWxkCj4+ICsgKgo+PiArICogQXV0aG9yOiBBaWRhbiBNYWNEb25hbGQgPGFp
ZGFubWFjZG9uYWxkLjB4MEBnbWFpbC5jb20+Cj4+ICsgKi8KPj4gKwo+PiArI2luY2x1ZGUgPGxp
bnV4L2RldmljZS5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+PiArI2luY2x1ZGUg
PGxpbnV4L210ZC9zcGluYW5kLmg+Cj4+ICsKPj4gKwo+PiArI2RlZmluZSBTUElOQU5EX01GUl9B
VE8JCTB4OWIKPj4gKwo+PiArCj4+ICtzdGF0aWMgU1BJTkFORF9PUF9WQVJJQU5UUyhyZWFkX2Nh
Y2hlX3ZhcmlhbnRzLAo+PiArCQlTUElOQU5EX1BBR0VfUkVBRF9GUk9NX0NBQ0hFX1g0X09QKDAs
IDEsIE5VTEwsIDApLAo+PiArCQlTUElOQU5EX1BBR0VfUkVBRF9GUk9NX0NBQ0hFX09QKHRydWUs
IDAsIDEsIE5VTEwsIDApLAo+PiArCQlTUElOQU5EX1BBR0VfUkVBRF9GUk9NX0NBQ0hFX09QKGZh
bHNlLCAwLCAxLCBOVUxMLCAwKSk7Cj4+ICsKPj4gK3N0YXRpYyBTUElOQU5EX09QX1ZBUklBTlRT
KHdyaXRlX2NhY2hlX3ZhcmlhbnRzLAo+PiArCQlTUElOQU5EX1BST0dfTE9BRF9YNCh0cnVlLCAw
LCBOVUxMLCAwKSwKPj4gKwkJU1BJTkFORF9QUk9HX0xPQUQodHJ1ZSwgMCwgTlVMTCwgMCkpOwo+
PiArCj4+ICtzdGF0aWMgU1BJTkFORF9PUF9WQVJJQU5UUyh1cGRhdGVfY2FjaGVfdmFyaWFudHMs
Cj4+ICsJCVNQSU5BTkRfUFJPR19MT0FEX1g0KGZhbHNlLCAwLCBOVUxMLCAwKSwKPj4gKwkJU1BJ
TkFORF9QUk9HX0xPQUQoZmFsc2UsIDAsIE5VTEwsIDApKTsKPj4gKwo+PiArCj4+ICtzdGF0aWMg
aW50IGF0bzI1ZDFnYV9vb2JsYXlvdXRfZWNjKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2Vj
dGlvbiwKPj4gKwkJCQkgICBzdHJ1Y3QgbXRkX29vYl9yZWdpb24gKnJlZ2lvbikKPj4gK3sKPj4g
KwlpZiAoc2VjdGlvbiA+IDMpCj4+ICsJCXJldHVybiAtRVJBTkdFOwo+PiArCj4+ICsJcmVnaW9u
LT5vZmZzZXQgPSAoMTYgKiBzZWN0aW9uKSArIDg7Cj4+ICsJcmVnaW9uLT5sZW5ndGggPSA4Owo+
PiArCXJldHVybiAwOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW50IGF0bzI1ZDFnYV9vb2JsYXlv
dXRfZnJlZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IHNlY3Rpb24sCj4+ICsJCQkJICAgc3Ry
dWN0IG10ZF9vb2JfcmVnaW9uICpyZWdpb24pCj4+ICt7Cj4+ICsJaWYgKHNlY3Rpb24gPiAzKQo+
PiArCQlyZXR1cm4gLUVSQU5HRTsKPj4gKwo+PiArCWlmIChzZWN0aW9uKSB7Cj4+ICsJCXJlZ2lv
bi0+b2Zmc2V0ID0gKDE2ICogc2VjdGlvbik7Cj4+ICsJCXJlZ2lvbi0+bGVuZ3RoID0gODsKPj4g
Kwl9IGVsc2Ugewo+PiArCQkvKiBmaXJzdCBieXRlIG9mIHNlY3Rpb24gMCBpcyByZXNlcnZlZCBm
b3IgdGhlIEJCTSAqLwo+PiArCQlyZWdpb24tPm9mZnNldCA9IDE7Cj4+ICsJCXJlZ2lvbi0+bGVu
Z3RoID0gNzsKPj4gKwl9Cj4+ICsKPj4gKwlyZXR1cm4gMDsKPj4gK30KPj4gKwo+PiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBtdGRfb29ibGF5b3V0X29wcyBhdG8yNWQxZ2Ffb29ibGF5b3V0ID0gewo+
PiArCS5lY2MgPSBhdG8yNWQxZ2Ffb29ibGF5b3V0X2VjYywKPj4gKwkuZnJlZSA9IGF0bzI1ZDFn
YV9vb2JsYXlvdXRfZnJlZSwKPj4gK307Cj4+ICsKPj4gKwo+PiArc3RhdGljIGNvbnN0IHN0cnVj
dCBzcGluYW5kX2luZm8gYXRvX3NwaW5hbmRfdGFibGVbXSA9IHsKPj4gKwlTUElOQU5EX0lORk8o
IkFUTzI1RDFHQSIsCj4+ICsJCSAgICAgU1BJTkFORF9JRChTUElOQU5EX1JFQURJRF9NRVRIT0Rf
T1BDT0RFX0FERFIsIDB4MTIpLAo+PiArCQkgICAgIE5BTkRfTUVNT1JHKDEsIDIwNDgsIDY0LCA2
NCwgMTAyNCwgMjAsIDEsIDEsIDEpLAo+PiArCQkgICAgIE5BTkRfRUNDUkVRKDEsIDUxMiksCj4+
ICsJCSAgICAgU1BJTkFORF9JTkZPX09QX1ZBUklBTlRTKCZyZWFkX2NhY2hlX3ZhcmlhbnRzLAo+
PiArCQkJCQkgICAgICAmd3JpdGVfY2FjaGVfdmFyaWFudHMsCj4+ICsJCQkJCSAgICAgICZ1cGRh
dGVfY2FjaGVfdmFyaWFudHMpLAo+PiArCQkgICAgIFNQSU5BTkRfSEFTX1FFX0JJVCwKPj4gKwkJ
ICAgICBTUElOQU5EX0VDQ0lORk8oJmF0bzI1ZDFnYV9vb2JsYXlvdXQsIE5VTEwpKSwKPj4gK307
Cj4+ICsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9tYW51ZmFjdHVyZXJfb3BzIGF0
b19zcGluYW5kX21hbnVmX29wcyA9IHsKPj4gK307Cj4+ICsKPj4gK2NvbnN0IHN0cnVjdCBzcGlu
YW5kX21hbnVmYWN0dXJlciBhdG9fc3BpbmFuZF9tYW51ZmFjdHVyZXIgPSB7Cj4+ICsJLmlkID0g
U1BJTkFORF9NRlJfQVRPLAo+PiArCS5uYW1lID0gIkFUTyIsCj4+ICsJLmNoaXBzID0gYXRvX3Nw
aW5hbmRfdGFibGUsCj4+ICsJLm5jaGlwcyA9IEFSUkFZX1NJWkUoYXRvX3NwaW5hbmRfdGFibGUp
LAo+PiArCS5vcHMgPSAmYXRvX3NwaW5hbmRfbWFudWZfb3BzLAo+PiArfTsKPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2Nv
cmUuYwo+PiBpbmRleCBkNWI2ODVkMTYwNWUuLjlkNzM5MTBhN2FlOCAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3Bp
L2NvcmUuYwo+PiBAQCAtOTI3LDYgKzkyNyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbmFuZF9v
cHMgc3BpbmFuZF9vcHMgPSB7Cj4+ICB9Owo+PiAgCj4+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHNw
aW5hbmRfbWFudWZhY3R1cmVyICpzcGluYW5kX21hbnVmYWN0dXJlcnNbXSA9IHsKPj4gKwkmYXRv
X3NwaW5hbmRfbWFudWZhY3R1cmVyLAo+PiAgCSZnaWdhZGV2aWNlX3NwaW5hbmRfbWFudWZhY3R1
cmVyLAo+PiAgCSZtYWNyb25peF9zcGluYW5kX21hbnVmYWN0dXJlciwKPj4gIAkmbWljcm9uX3Nw
aW5hbmRfbWFudWZhY3R1cmVyLAo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tdGQvc3Bp
bmFuZC5oIGIvaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oCj4+IGluZGV4IDU1ODRkM2JiNjU1
Ni4uNmQzMzkyYTdlZGM2IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L210ZC9zcGluYW5k
LmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oCj4+IEBAIC0yNjAsNiArMjYw
LDcgQEAgc3RydWN0IHNwaW5hbmRfbWFudWZhY3R1cmVyIHsKPj4gIH07Cj4+ICAKPj4gIC8qIFNQ
SSBOQU5EIG1hbnVmYWN0dXJlcnMgKi8KPj4gK2V4dGVybiBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9t
YW51ZmFjdHVyZXIgYXRvX3NwaW5hbmRfbWFudWZhY3R1cmVyOwo+PiAgZXh0ZXJuIGNvbnN0IHN0
cnVjdCBzcGluYW5kX21hbnVmYWN0dXJlciBnaWdhZGV2aWNlX3NwaW5hbmRfbWFudWZhY3R1cmVy
Owo+PiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBzcGluYW5kX21hbnVmYWN0dXJlciBtYWNyb25peF9z
cGluYW5kX21hbnVmYWN0dXJlcjsKPj4gIGV4dGVybiBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9tYW51
ZmFjdHVyZXIgbWljcm9uX3NwaW5hbmRfbWFudWZhY3R1cmVyOwo+Cj4KPiBUaGFua3MsCj4gTWlx
dcOobAoKUmVnYXJkcywKQWlkYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
