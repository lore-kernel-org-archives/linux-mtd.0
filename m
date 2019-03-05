Return-Path: <SRS0=LjUq=RI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2AFC43381
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2019 07:14:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A98BA20675
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2019 07:14:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e0qfApsg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="iJq8lbC4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A98BA20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j3neCmWYoao4lTSP5Qs/DmwI7n2hTq0aNJWDS61YHmU=; b=e0qfApsgeR1DlF
	ZU62yZ/SEytzMRo4PjOzVr4HR2bhl8DHXqhk64vF9V1dRAsHbUqYi4fSg6ROfV0BYPTw2TD7wmRFP
	ZUUourDa6lnNokLw5iiINcQopUshdm/96nApm5w/efkWFc5F6nb0U017BGLxEW3YA9aZz+TJwgTTY
	7Li4piOO0csEnxmc+IeAAXqyHaDCIwsPsWj3veOdOulHzE6xEpcXP8oN75fWb3yvoZOfY25t9D8HO
	uc1FirvaUYavGd7UBPZbHrJricU/KG+YOl47NcPYXnfhed764acQSkvv4en+jNuMt/Z5YvlN6VYuo
	uiZP77LlTOBbqnvb2keA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h14HK-00054h-Vi; Tue, 05 Mar 2019 07:14:18 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h14HF-00054C-Hu
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2019 07:14:15 +0000
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id x257Dt1k008312
 for <linux-mtd@lists.infradead.org>; Tue, 5 Mar 2019 16:13:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x257Dt1k008312
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1551770036;
 bh=FF/HDKixPCW4Zs6T210fuE1DHadGU2VOVKQBgaV87zo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iJq8lbC4VaeEP4nzOunxNWeFv5UmhQr3SYGcEHc8QsHmCOESoBc6wJpSGeYQvfsIJ
 XAROMr1ojeJhNvjPl0vcaWQlqxfaVbpd+b1oJXZrAi1QcmNCps5cwAXGpdRR9f0ykU
 6eq52LnUaFMt70DonRdDMQJWUB5vsJkGcKD9tQNUCcSHeiikwXyC9+EOBM9vzw2HbS
 E+LZSDATgnqSohfluu4U8YS0TUHQVTsosR4QQ56lnpCQS+sHkckAF8VwTRD6QACmw7
 Et8R90Z45nzHJOUP22WA1rkOZivZXC7bd5TfDldrw66smmgS3ukP+UQbUCS0PWP8qS
 ewYvxpSnsd1Ag==
X-Nifty-SrcIP: [209.85.222.49]
Received: by mail-ua1-f49.google.com with SMTP id u1so6829149uae.12
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2019 23:13:56 -0800 (PST)
X-Gm-Message-State: APjAAAWl/GTSMgAG/Oy8fOPoFYl0ywcIQyataXRWVQQ2g6Ql0cQ8FFIh
 BMlUE/xgBRDeXOPbEuXZ4JFBl6MdAlQO0D7FWfw=
X-Google-Smtp-Source: APXvYqxwMqz2LuTBAW1L2AYPJzwpIICLhgE3zvhVvqcgyg3YskTSz/NTVMbz5wHjYa0aXns+i4CPM5y/mIHaCVNMp68=
X-Received: by 2002:a67:f90e:: with SMTP id t14mr410032vsq.181.1551770035093; 
 Mon, 04 Mar 2019 23:13:55 -0800 (PST)
MIME-Version: 1.0
References: <1549955582-30346-1-git-send-email-yamada.masahiro@socionext.com>
 <1549955582-30346-5-git-send-email-yamada.masahiro@socionext.com>
 <20190304103052.0eba71a6@xps13>
In-Reply-To: <20190304103052.0eba71a6@xps13>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 5 Mar 2019 16:13:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS_c0SsWwwkqc5_HBX560NPM5-QJSH9_JcTLULHvz3b1A@mail.gmail.com>
Message-ID: <CAK7LNAS_c0SsWwwkqc5_HBX560NPM5-QJSH9_JcTLULHvz3b1A@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] mtd: rawnand: denali: switch over to ->exec_op()
 from legacy hooks
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_231413_962220_1F876A95 
X-CRM114-Status: GOOD (  20.59  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKCk9uIE1vbiwgTWFyIDQsIDIwMTkgYXQgNjozMSBQTSBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIE1hc2FoaXJvLAo+Cj4g
TWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4gd3JvdGUgb24g
VHVlLCAxMiBGZWIKPiAyMDE5IDE2OjEyOjU2ICswOTAwOgo+Cj4gPiBJbXBsZW1lbnQgLT5leGVj
X29wKCksIGFuZCByZW1vdmUgdGhlIGRlcHJlY2F0ZWQgaG9va3MuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KPiA+
IC0tLQo+Cj4gVGhhbmtzIGZvciB3b3JraW5nIG9uIHRoaXMsIEkgbGlrZSBpdCB2ZXJ5IG11Y2gh
Cj4KPiA+Cj4gPiBDaGFuZ2VzIGluIHYyOiBOb25lCj4gPgo+ID4gIGRyaXZlcnMvbXRkL25hbmQv
cmF3L2RlbmFsaS5jIHwgMjM0ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMjYgaW5zZXJ0aW9ucygrKSwgMTA4IGRlbGV0aW9u
cygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGkuYyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2RlbmFsaS5jCj4gPiBpbmRleCBhMmZlMmZmLi5iZDdkZjI1
IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZGVuYWxpLmMKPiA+ICsrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2RlbmFsaS5jCj4KPiBbLi4uXQo+Cj4gPiArCj4gPiArc3Rh
dGljIGludCBkZW5hbGlfZXhlY19pbnN0cihzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IG5hbmRfb3BfaW5zdHIgKmluc3Ry
KQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGkgPSB0b19k
ZW5hbGkoY2hpcCk7Cj4gPiArICAgICBib29sIHdpZHRoMTYgPSBjaGlwLT5vcHRpb25zICYgTkFO
RF9CVVNXSURUSF8xNjsKPiA+ICsKPiA+ICsgICAgIHN3aXRjaCAoaW5zdHItPnR5cGUpIHsKPiA+
ICsgICAgIGNhc2UgTkFORF9PUF9DTURfSU5TVFI6Cj4gPiArICAgICAgICAgICAgIGRlbmFsaV9l
eGVjX291dDgoZGVuYWxpLCBERU5BTElfTUFQMTFfQ01ELAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICZpbnN0ci0+Y3R4LmNtZC5vcGNvZGUsIDEpOwo+ID4gKyAgICAgICAgICAg
ICByZXR1cm4gMDsKPiA+ICsgICAgIGNhc2UgTkFORF9PUF9BRERSX0lOU1RSOgo+ID4gKyAgICAg
ICAgICAgICBkZW5hbGlfZXhlY19vdXQ4KGRlbmFsaSwgREVOQUxJX01BUDExX0FERFIsCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5zdHItPmN0eC5hZGRyLmFkZHJzLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluc3RyLT5jdHguYWRkci5uYWRkcnMpOwo+
ID4gKyAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ICsgICAgIGNhc2UgTkFORF9PUF9EQVRBX0lO
X0lOU1RSOgo+ID4gKyAgICAgICAgICAgICAoIWluc3RyLT5jdHguZGF0YS5mb3JjZV84Yml0ICYm
IHdpZHRoMTYgPwo+ID4gKyAgICAgICAgICAgICAgZGVuYWxpX2V4ZWNfaW4xNiA6Cj4gPiArICAg
ICAgICAgICAgICBkZW5hbGlfZXhlY19pbjgpKGRlbmFsaSwgREVOQUxJX01BUDExX0RBVEEsCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluc3RyLT5jdHguZGF0YS5idWYuaW4s
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluc3RyLT5jdHguZGF0YS5sZW4p
Owo+Cj4gSSB0aGluayB0aGlzIGlzIGFidXNpbmcgdGhlIHRlcm5hcnkgb3BlcmF0b3IsIGNhbiB5
b3UgcGxlYXNlIGZpbmQKPiBhbm90aGVyIHdheSBmb3Igd3JpdGluZyB0aGlzPyBPdGhlcndpc2Ug
aXQgaXMgbm90IGVhc2lseSByZWFkYWJsZS4uLiBJZgo+IGl0IGlzIHJlYWxseSB0b28gY29tcGxp
Y2F0ZWQgd2l0aGluIDgwIGNoYXJzLCB0aGVuIG5ldmVyIG1pbmQuCgpZZXMsIEkgYW0gYWJ1c2lu
ZyBpdCwKYnV0IHRoZSBpbnRlbnRpb24gaXMgcXVpdGUgY2xlYXIuCgoKSSBjb3VsZCBzdHVwaWRs
eSByZXBlYXQgdGhlIHNhbWUgZnVuY3Rpb24gYXJndW1lbnRzIGxpa2UgZm9sbG93cywKYnV0IEkg
ZGlkIG5vdCB3YW50IHRvIGRvIGl0LgoKY2FzZSBOQU5EX09QX0RBVEFfSU5fSU5TVFI6CiAgICAg
ICAgaWYgKCFpbnN0ci0+Y3R4LmRhdGEuZm9yY2VfOGJpdCAmJiB3aWR0aDE2KQogICAgICAgICAg
ICAgICAgZGVuYWxpX2V4ZWNfaW4xNihkZW5hbGksIERFTkFMSV9NQVAxMV9EQVRBLAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBpbnN0ci0+Y3R4LmRhdGEuYnVmLmluLAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBpbnN0ci0+Y3R4LmRhdGEubGVuKTsKICAgICAgICBl
bHNlCiAgICAgICAgICAgICAgICBkZW5hbGlfZXhlY19pbjgoZGVuYWxpLCBERU5BTElfTUFQMTFf
REFUQSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnN0ci0+Y3R4LmRhdGEuYnVm
LmluLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluc3RyLT5jdHguZGF0YS5sZW4p
OwoKCgoKCj4gPiArICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gKyAgICAgY2FzZSBOQU5EX09Q
X0RBVEFfT1VUX0lOU1RSOgo+ID4gKyAgICAgICAgICAgICAoIWluc3RyLT5jdHguZGF0YS5mb3Jj
ZV84Yml0ICYmIHdpZHRoMTYgPwo+ID4gKyAgICAgICAgICAgICAgZGVuYWxpX2V4ZWNfb3V0MTYg
Ogo+ID4gKyAgICAgICAgICAgICAgZGVuYWxpX2V4ZWNfb3V0OCkoZGVuYWxpLCBERU5BTElfTUFQ
MTFfREFUQSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluc3RyLT5jdHgu
ZGF0YS5idWYub3V0LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5zdHIt
PmN0eC5kYXRhLmxlbik7Cj4gPiArICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gKyAgICAgY2Fz
ZSBOQU5EX09QX1dBSVRSRFlfSU5TVFI6Cj4gPiArICAgICAgICAgICAgIHJldHVybiBkZW5hbGlf
ZXhlY193YWl0cmR5KGRlbmFsaSk7Cj4gPiArICAgICBkZWZhdWx0Ogo+ID4gKyAgICAgICAgICAg
ICBXQVJOX09OQ0UoMSwgInVuc3VwcG9ydGVkIE5BTkQgaW5zdHJ1Y3Rpb24gdHlwZTogJWRcbiIs
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpbnN0ci0+dHlwZSk7Cj4gPiArCj4gPiArICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gKyAgICAgfQo+ID4gK30KPiA+ICsKPgo+Cj4g
VGhhbmtzLAo+IE1pcXXDqGwKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwoK
CgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlhbWFkYQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
