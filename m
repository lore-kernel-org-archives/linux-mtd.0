Return-Path: <SRS0=0vqE=QZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6990BC43381
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Feb 2019 11:27:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37FB22173C
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Feb 2019 11:27:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tpTv+5F5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HysycyDG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37FB22173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JcmHmQCjoO9k/Rx9PehiMQTlKGKscwf5MO/CyzAmfWM=; b=tpTv+5F5j68kiW
	8COQiDZEgZ+FV54Av/agg6kzbgv9lCMdM2L2995VfOJMRpbSaznlAy9c9NqGK0xHoN7gBjJc3owNI
	3J6rpuCcEzNcsQVbNKa1xv/Fz8h4wwdYShQarH500hQKZuxammkgp8lMOaldPhwWfaujhZA0kCHBQ
	wqG6C69Q9lZpEXWgvRLaX0sd+Hb2jmKmE1riubjMbGomg58XCO7VKqr0Zm9EfD1oHX5LF8kMAkIzV
	cteDBKpfTyX5b2G2T5MRMPQuGtO2dz7ja3r3XLXT9z+hokCmaNeh9uyrnXJoPnA2rfm1AqQWRVsb9
	az2IJjd6MJBKqNj3Lycw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvh5I-0008Kh-BZ; Mon, 18 Feb 2019 11:27:40 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvh5E-0008Cp-7J
 for linux-mtd@lists.infradead.org; Mon, 18 Feb 2019 11:27:38 +0000
Received: by mail-pf1-x443.google.com with SMTP id n125so1142513pfn.5
 for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2019 03:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J1W8J+XryZz0Wu4TjBg9Mn7LLQ80UXeyGkDnIQuozzU=;
 b=HysycyDGwpbD4B74avEKxk5hh5xL4ALKs5d05F2+N09eZDDCRhm4IIkGae0y1lXO93
 vhfzAMeB8g9i+exXWwDCUnXaRdPFHnt5LQ0pK+HzRqnuU4b7x/Fzo3Nd9Ti42dRTHwwS
 xwVTCnX7YgRL7S3XLyjwAaMSD+2gZfs7iQPfWwg/jZZJWNQf8kPUHZ0Z4Kmn0b3c4tbg
 mrOUoBbN+JkGnkoi5u5CNfn2B98eQIK2UI9AJPNEENindLzBwdL5MA1EKRaHiBAb1/gR
 vLrBbWuU+MUaIne3UNyiFWTScoSv9TFWo5mhTsX819tO4jiFseTXKmlO3CN/yHTUPg9M
 GCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J1W8J+XryZz0Wu4TjBg9Mn7LLQ80UXeyGkDnIQuozzU=;
 b=N2G7l7c/H2gll4XvBQrcPXXu03qzbdmO+ZKnH0fIQzoyg2qPNGk6njDePI2sKWGTwK
 lBz39TwZXGPea+BnTDWPszETidiMC00F7kO6oDnOGvoRpQTlvmbX+RSX0qTjMssKDXPs
 SRTO5NJEFeDN3fx2WDKaFspW0SlZW6aO4wpSrJH030CwAdxWuN/IMWmH456M34iNKVp/
 PxZIdHTSTmcm6B/hktZyEJomDBvc73of6ORv0pHJviQaZDFWJB0u6eEb5cJf6bpMk5JE
 qtxykLst2NMnrix2f6/J92ePIicsCxNjwzk6Pk4QdgLS4oj0YPsgcG+mTH4OGTLid4NM
 P5ig==
X-Gm-Message-State: AHQUAubRTWd4p4WZ/MjJdTPosC7FQUWxrJhd6OPjIziPjsYXi+k+mWTr
 RB6f0Thm64Cx8OsQcg6DGT+Qz8hTrGLB/0hCXYY=
X-Google-Smtp-Source: AHgI3IZbNct7SjZuiichaIVvvem3hjaea32h4QBSuTRMFq2nf34VSR8/uJ2+KVgyHNM2VFvs6qFlwiMbDDLYzOVwgZE=
X-Received: by 2002:a63:d810:: with SMTP id b16mr18162458pgh.220.1550489253975; 
 Mon, 18 Feb 2019 03:27:33 -0800 (PST)
MIME-Version: 1.0
References: <20181221115831.9595-1-emil.lenngren@gmail.com>
 <20190105145845.7a28d8f8@bbrezillon>
 <CAO1O6se_1oPv6SogDkkMaF1K9N7XxtTzeHAruibB8fph+mam=A@mail.gmail.com>
 <20190106091049.01e2e3d9@bbrezillon>
In-Reply-To: <20190106091049.01e2e3d9@bbrezillon>
From: Emil Lenngren <emil.lenngren@gmail.com>
Date: Mon, 18 Feb 2019 12:27:25 +0100
Message-ID: <CAO1O6scHuaGJsS1wXtEpxi930K57yDBUZggb1Sik9XoZMJA+8A@mail.gmail.com>
Subject: Re: [PATCH] mtd: spinand: Wait after erase in spinand_markbad
To: Boris Brezillon <bbrezillon@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_032736_664347_C49C7491 
X-CRM114-Status: GOOD (  27.45  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpEZW4gc8O2biA2IGphbi4gMjAxOSBrbCAwOToxMSBza3JldiBCb3JpcyBCcmV6aWxsb24g
PGJicmV6aWxsb25Aa2VybmVsLm9yZz46Cj4KPiBPbiBTYXQsIDUgSmFuIDIwMTkgMjI6MDE6NDQg
LTA4MDAKPiBFbWlsIExlbm5ncmVuIDxlbWlsLmxlbm5ncmVuQGdtYWlsLmNvbT4gd3JvdGU6Cj4K
PiA+IEhpLAo+ID4KPiA+IERlbiBsw7ZyIDUgamFuLiAyMDE5IGtsIDA1OjU5IHNrcmV2IEJvcmlz
IEJyZXppbGxvbiA8YmJyZXppbGxvbkBrZXJuZWwub3JnPjoKPiA+ID4KPiA+ID4gT24gRnJpLCAy
MSBEZWMgMjAxOCAxMjo1ODoxNCArMDEwMAo+ID4gPiBFbWlsIExlbm5ncmVuIDxlbWlsLmxlbm5n
cmVuQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gU1BJIE5BTkQgZmxhc2hlcyBkb24n
dCBhY2NlcHQgbmV3IGNvbW1hbmRzIHdoaWxlIGFuIGVyYXNlIGlzIG9uZ29pbmcuCj4gPiA+ID4g
TWFrZSBzdXJlIHRvIHdhaXQgdW50aWwgdGhlIGRldmljZSBpcyByZWFkeSBiZWZvcmUgd3JpdGlu
ZyB0aGUgbWFya2VyLgo+ID4gPiA+Cj4gPiA+ID4gSnVzdCBhcyB3aXRoIHRoZSBlcmFzZSBvcCwg
bm8gZXJyb3IgY2hlY2sgaXMgcGVyZm9ybWVkIHNpbmNlIHdlIHdhbnQKPiA+ID4gPiB0byBjb250
aW51ZSB3cml0aW5nIHRoZSBtYXJrZXIgZXZlbiBpZiB0aGUgZXJhc2UgZmFpbHMuCj4gPiA+ID4K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIExlbm5ncmVuIDxlbWlsLmxlbm5ncmVuQGdtYWls
LmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIHwg
MiArKwo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPiA+ID4KPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9t
dGQvbmFuZC9zcGkvY29yZS5jCj4gPiA+ID4gaW5kZXggNDc5YzJmMmNmMS4uYzI3MjRkMzRlNiAx
MDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiA+ID4gPiAr
KysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiA+ID4gPiBAQCAtNjg1LDYgKzY4NSw4
IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9tYXJrYmFkKHN0cnVjdCBuYW5kX2RldmljZSAqbmFuZCwg
Y29uc3Qgc3RydWN0IG5hbmRfcG9zICpwb3MpCj4gPiA+ID4KPiA+ID4gPiAgICAgICBzcGluYW5k
X2VyYXNlX29wKHNwaW5hbmQsIHBvcyk7Cj4gPiA+ID4KPiA+ID4gPiArICAgICBzcGluYW5kX3dh
aXQoc3BpbmFuZCwgTlVMTCk7Cj4gPiA+ID4gKwo+ID4gPgo+ID4gPiBBZnRlciB0aGlua2luZyBh
IGJpdCBtb3JlIGFib3V0IGl0LCBJIHRoaW5rIHdlIHNob3VsZCBzaW1wbHkgd3JpdGUgdGhlCj4g
PiA+IEJCTSBhbmQgc2tpcCB0aGUgZXJhc2Ugb3BlcmF0aW9uLiBNYXJraW5nIGEgYmxvY2sgYmFk
IGlzIGp1c3QgYWJvdXQKPiA+ID4gd3JpdGluZyAwIHRvIHRoZSBmaXJzdCAyIGJ5dGVzIG9mIHRo
ZSBPT0IgYXJlYSwgYW5kIHdlIGRvbid0IG5lZWQgdGhlCj4gPiA+IGJsb2NrIHRvIGJlIGVyYXNl
ZCB0byBkbyB0aGF0Lgo+ID4gPgo+ID4KPiA+IEkgY29tcGFyZWQgd2l0aCB0aGUgcmF3IGFuZCBp
bXBsZW1lbnRhdGlvbiBpbgo+ID4gbmFuZF9ibG9ja19tYXJrYmFkX2xvd2xldmVsLCBpdCBhbHNv
IGVyYXNlcyBmaXJzdCwgaWdub3JpbmcgYQo+ID4gcG90ZW50aWFsIGVycm9yLgo+Cj4gWWVzLCBh
bmQgSSB0aGluayB0aGlzIGltcGxlbWVudGF0aW9uIHdhcyBpbnNwaXJlZCBieSB0aGUgcmF3bmFu
ZCBvbmUsCj4gYnV0IEknbSBub3Qgc3VyZSB0aGUgcmF3bmFuZCBpbXBsZW0gaXMgY29ycmVjdC4K
Pgo+ID4KPiA+IE9uIHRoZSBvdGhlciBoYW5kLCBhIGNvbW1vbiBzcGkgZmxhc2ggY2hpcCBNWDM1
TEYxR0U0QUIgc3RhdGVzIGluIHRoZQo+ID4gZGF0YXNoZWV0IHRoYXQgaXQncyBub3QgcmVjb21t
ZW5kZWQgdG8gZXJhc2UgYSBiYWQgYmxvY2ssIGJ1dCBubwo+ID4gcmVhc29uIHdoeS4KPgo+IEJl
Y2F1c2UgdGhlIGVyYXNlIG1pZ2h0IHN1Y2NlZWQgYW5kIHJlc2V0IHRoZSBCQk0gdG8gMHhmZiwg
dGh1cyBtYXJraW5nCj4gdGhlIGJsb2NrIGdvb2QgZXZlbiBpZiBpdCdzIHVucmVsaWFibGUuCj4K
PiA+IEF0IHRoZSBzYW1lIHRpbWUsIGl0J3MgZ2VuZXJhbGx5IGRpc2FsbG93ZWQgdG8gd3JpdGUg
dGhlCj4gPiBzYW1lIHBhZ2UgdHdpY2UuLi4KPgo+IFRoYXQncyBvbmx5IGlmIHlvdSBjYXJlIGFi
b3V0IHRoZSBkYXRhIHlvdSB3cml0ZSB0byB0aGUgcGFnZS4gTWFya2luZyBhCj4gYmxvY2sgYmFk
IGlzIGp1c3QgYWJvdXQgc2V0dGluZyB0aGUgQkJNIHRvIDB4MCwgd2hpY2ggc2hvdWxkIGFsd2F5
cyB3b3JrCj4gZXZlbiBpZiB0aGUgcGFnZSB5b3UncmUgd3JpdGluZyB0byBoYXMgYWxyZWFkeSBi
ZWVuIHdyaXR0ZW4sIHNpbXBseQo+IGJlY2F1c2UgYSAxIC0+IDAgY2VsbCB0cmFuc2l0aW9uIGRv
ZXMgbm90IHJlcXVpcmUgYW4gZXJhc2UgKG9ubHkgYSAwIC0+Cj4gMSB0cmFuc2l0aW9uIGRvZXMp
LgoKU2hvdWxkIHRoZSBCQk0gYmUgd3JpdHRlbiB3aXRoIG9yIHdpdGhvdXQgRUNDPyBOb3cgaXQg
dXNlcyB3aGF0ZXZlcgptb2RlIHdhcyB1c2VkIGluIHRoZSBsYXN0IG9wZXJhdGlvbi4gQWxzbyBm
b3IgcmVhZGluZywgSSBzZWUgdGhlCiJzcGluYW5kX2lzYmFkIiBmdW5jdGlvbiBzZXRzIC5tb2Rl
IHRvIE1URF9PUFNfUkFXIGJ1dCB0aGF0IGZpZWxkCmRvZXNuJ3Qgc2VlbSB0byBiZSBpbnNwZWN0
ZWQsIGFnYWluIHVzaW5nIHRoZSBzYW1lIEVDQyBtb2RlIGFzIGluIHRoZQpsYXN0IG9wZXJhdGlv
bi4KSXNuJ3QgaXQgYmVzdCB0byB1c2UgdGhlIG5vbi1FQ0MgbW9kZSBmb3IgYm90aCByZWFkaW5n
IGFuZCB3cml0aW5nIHRoZQpCQk0/IElmIHdlIHdvdWxkIHVzZSBFQ0MgbW9kZSBhbmQgb3Zlcndy
aXRlIHRoZSBwYWdlIHdoZW4gd3JpdGluZyB0aGUKQkJNIG1hcmtlciwgSSBndWVzcyB0aGUgY29u
dHJvbGxlciBuZWVkcyB0byBzdG9yZSBhIHNlY29uZCBlcnJvcgpjb3JyZWN0aW9uIGNvZGUgKG92
ZXJ3cml0aW5nIHRoZSBwcmV2aW91cyBvbmUpLCB3aGljaCB3aWxsIHByb2JhYmx5CmxlYWQgdG8g
RUNDIGZhaWx1cmUgaWYgbGF0ZXIgcmVhZCBpbiBFQ0MtbW9kZSAoYW5kIHdobyBrbm93cyBpZiBp
dAp3aWxsICJjb3JyZWN0IiB0aGUgemVybyBiaXRzIHRvIG9uZXMuLi4pLgoKL0VtaWwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
