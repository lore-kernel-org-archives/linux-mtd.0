Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D86DEB64DC
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jul 2023 09:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eEp8Bov8qbifMAML6soMlwOJR4FvBxLqihVoF3gLfmc=; b=JaW9tnWBhvvULW
	nmPaIT4IEvNNUCZ0pij2lKTb1m1WZ0KEyd8s+KgrAuYY+csnH48XRMjQykPgy/+ltcG2m8yRzB2su
	xxggxVml7fdBwwBsmFK2PxtlTuT1iO1LQ25AntCT1d/Vwc9pMi6/vQ5ttHe74r3Kb5RkzJCTkVfmf
	Wd3J5cTKqPPOBDl8+7I3w1n5+1BE/R9pvNxxg2fEcZAExlUuGSkE6A0tgWGBi538QfXwUAEI7DbZW
	fIkl84zSV2USExZ6PTWQqQiVsKVWz174M6y6f/hUQUT9NlmPtDDjQZmG2CLRAWFmt0pDJxy2M6zVQ
	iNq9mJfJUcivKpT0OmCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGFfW-009tPV-2T;
	Mon, 03 Jul 2023 09:16:26 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGFfU-009tOf-0B
	for linux-mtd@lists.infradead.org;
	Mon, 03 Jul 2023 09:16:25 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3a1ebb79579so2940849b6e.3
        for <linux-mtd@lists.infradead.org>; Mon, 03 Jul 2023 02:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688375782; x=1690967782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqdI2XQQ+EUNzF0Fdic8Am/4oVxGp9ySFAmwOiVSp0Y=;
        b=oMQSVS617snIWivrlRE23hB11GHoJjP5xwhKVxmZhIcwtwg6h47gkIcaf9luibMpZ+
         AT2BsqEsU0wrR0bBrzAzDmXg482kvRpHKEFRyJYCYtkdDTmT8bkl1Yh7HPIdHUYDfIb4
         bPgIgPiYzNBGS2AfgXiCNWzfRFhXb2Jyzq7vWvn/yd5xwvQkMS30EjF3eNvDanWfcHtp
         kybgTvUqiqQ7flrIRFenHqfQT5jUfDSb2JCn2Mad3XyAO1S546+CJmaM4Zd3BC5gVRFo
         TXwkvK974q/B9ynoM5qeRLuo3wyYIBrMxaT2spdkAGzOFgqzcIDpvDqnVyR30hUtrjhy
         kYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688375782; x=1690967782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqdI2XQQ+EUNzF0Fdic8Am/4oVxGp9ySFAmwOiVSp0Y=;
        b=WY6a5sEks07Cj6f9PBrR8zKJebkRoTEha0mOfz1IiPvaSnqzsX1xPGZqQ1d0bPqyWH
         xGLmNkz5sfAHBzbPmw1YbyWdnlzcRNBXa5y4pALNYv4WHqlXOYYY94ZXx+gl5cS6q42B
         r4q2CaLV/czDtYnVUwvjOoJ3S+UbmFZrN1o+GVaRfAcyrKFDU0S8lS4elPc2VwxGxcdT
         AIyxoTclf4ZtbQv0JvpFgVIqdZdXqHmCB8JAxtEin+5J0CEVJwjHmxNFjmz/VR3JyJ9S
         FiatTFsySikekt7CXuDv2WZFu2Ixjxl8tn1tBgAhxBPivXNFSX2wL+/IduWEP/LFbslI
         JPsQ==
X-Gm-Message-State: AC+VfDzyZbZzGJfiOJ4RxKUxn33RSHH/3h3wdpAL+2KDYpo5WdUhZN6H
	QXwGjHjZ8UtRLENvbGRuU+gDDwUKfzLx6gGw/XOAbeeb8VcZOw==
X-Google-Smtp-Source: ACHHUZ7cCams3eWXcwmpK2VV2qfZ8U8yLjTet0PO5LnFuW14hFW5HYitP+QPJCoozrmsTis0OjMYnCOXGXpY1cuhsdE=
X-Received: by 2002:aca:1215:0:b0:3a1:e974:8643 with SMTP id
 21-20020aca1215000000b003a1e9748643mr7966186ois.49.1688375781852; Mon, 03 Jul
 2023 02:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAP1tNvS=NVAm-vfvYWbc3k9Cx9YxMc2uZZkmXk8h1NhGX877Zg@mail.gmail.com>
 <20230526201420.231092a0@xps-13> <CAP1tNvQsmYKMHZ662f1yiLv2JmZZrnQsJr2Lf5xiafxJSkZfBQ@mail.gmail.com>
 <20230529101240.53065e04@xps-13> <CAP1tNvRTRkXMztGL=nxrd-Cv5xO58-R=A_M2r65d6cyidoVz0g@mail.gmail.com>
 <20230529134619.255d0b07@xps-13> <PH0PR08MB788936E00C0DD958BFB9B3F6DB4B9@PH0PR08MB7889.namprd08.prod.outlook.com>
 <CAP1tNvQg+3O6LOaAnAMXionvLUy2FkF7yWtjXUma-ZLL3EE7nQ@mail.gmail.com>
 <20230601093734.3c752d2f@xps-13> <PH0PR08MB7889C9577C6AD5BA2221B74DDB499@PH0PR08MB7889.namprd08.prod.outlook.com>
 <CAP1tNvTS=kW_pPM5Vn4COmCXR7L6wj+CXtKs_Tnf=UQk2i7=Bg@mail.gmail.com>
 <20230605103943.064d142e@xps-13> <PH0PR08MB7889A36C14C2229C3DA3CDB0DB4DA@PH0PR08MB7889.namprd08.prod.outlook.com>
 <PH0PR08MB7889328970694F570AD16E4FDB26A@PH0PR08MB7889.namprd08.prod.outlook.com>
In-Reply-To: <PH0PR08MB7889328970694F570AD16E4FDB26A@PH0PR08MB7889.namprd08.prod.outlook.com>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Mon, 3 Jul 2023 12:16:10 +0300
Message-ID: <CAP1tNvSG-J4Yaq=o_5WX+TybM56AhAVg1Ub5yLoE73GjXj0Oig@mail.gmail.com>
Subject: Re: [EXT] Re: Boot failed after patch "mtd: rawnand: Support for
 sequential cache reads"
To: Bean Huo <beanhuo@micron.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, JaimeLiao <jaimeliao.tw@gmail.com>, 
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_021624_092353_6826605F 
X-CRM114-Status: GOOD (  28.25  )
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

SGVsbG8uCgpGb3Igbm93IEkganVzdCBjaGFuZ2VkIHJhd25hbmRfY2hlY2tfY29udF9yZWFkX3N1
cHBvcnQoKSBmdW5jdGlvbiB0bwp0dXJuIG9mZiBzdXBwb3J0ZWRfb3AuY29udF9yZWFkIHZhcmlh
YmxlLgpJIGhhdmVuJ3QgdHJpZWQgYW55dGhpbmcgbmV3LgoK0L/QvSwgMjYg0LjRjtC9LiAyMDIz
4oCv0LMuINCyIDEyOjIyLCBCZWFuIEh1byA8YmVhbmh1b0BtaWNyb24uY29tPjoKPgo+IEhpIEFs
ZXhhbmRlciwKPgo+IERvIHlvdSBoYXZlIGFueSB1cGRhdGUgb24gdGhpcyBpc3N1ZT8KPgo+Cj4g
S2luZCByZWdhcmRzLAo+IEJlYW4KPgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+
IEZyb206IEJlYW4gSHVvCj4gPiBTZW50OiBNb25kYXksIEp1bmUgNSwgMjAyMyA1OjQ2IFBNCj4g
PiBUbzogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT47IEFsZXhhbmRl
ciBTaGl5YW4KPiA+IDxlYWdsZS5hbGV4YW5kZXI5MjNAZ21haWwuY29tPgo+ID4gQ2M6IEphaW1l
TGlhbyA8amFpbWVsaWFvLnR3QGdtYWlsLmNvbT47IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gPiBTdWJqZWN0OiBSRTogW0VYVF0gUmU6IEJvb3QgZmFpbGVkIGFmdGVyIHBhdGNoICJt
dGQ6IHJhd25hbmQ6IFN1cHBvcnQgZm9yIHNlcXVlbnRpYWwKPiA+IGNhY2hlIHJlYWRzIgo+ID4K
PiA+IEhpIE1pcXVlbAo+ID4KPiA+IEkgb25seSBjYW4gc2F5LCB3ZSBoYXZlIG5vdCBleHBlcmll
bmNlZCB0aGlzIGtpbmQgaXNzdWUgeWV0LiAgTXkgc3VnZ2VzdGlvbiBhcyB5b3VycywKPiA+IHBs
ZWFzZSBmaXJzdGx5IExldCBBbGV4IGFkZCBkZWJ1ZyBwcmludCBpbiBtdGQsIGVzcGVjaWFsbHkg
aW4gTkFORCBkcml2ZXIuIFRvIGNoZWNrCj4gPiB3aGF0IGV4YWN0bHkgZXJyb3IgY2F1c2VzIHRo
aXMgU3F1YXNoRlMgY29tcGxhaW4sIGlzIGl0IElPIGVycm9yLCAgb3IgQ1JDLCAgb3IgRUNDCj4g
PiBlcnJvciwgb3IgTkFORCBkZXZpY2Ugbm8gcmVzcG9uc2UgYW5kIHRpbWVvdXQ/Cj4gPgo+ID4g
S2luZCByZWdhcmRzLAo+ID4gQmVhbgo+ID4KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0KPiA+ID4gRnJvbTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4K
PiA+ID4gU2VudDogTW9uZGF5LCBKdW5lIDUsIDIwMjMgMTA6NDAgQU0KPiA+ID4gVG86IEFsZXhh
bmRlciBTaGl5YW4gPGVhZ2xlLmFsZXhhbmRlcjkyM0BnbWFpbC5jb20+Cj4gPiA+IENjOiBCZWFu
IEh1byA8YmVhbmh1b0BtaWNyb24uY29tPjsgSmFpbWVMaWFvIDxqYWltZWxpYW8udHdAZ21haWwu
Y29tPjsKPiA+ID4gbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+ID4gU3ViamVjdDog
UmU6IFtFWFRdIFJlOiBCb290IGZhaWxlZCBhZnRlciBwYXRjaCAibXRkOiByYXduYW5kOiBTdXBw
b3J0Cj4gPiA+IGZvciBzZXF1ZW50aWFsIGNhY2hlIHJlYWRzIgo+ID4gPgo+ID4gPiBDQVVUSU9O
OiBFWFRFUk5BTCBFTUFJTC4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMg
dW5sZXNzCj4gPiA+IHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQgd2VyZSBleHBlY3Rpbmcg
dGhpcyBtZXNzYWdlLgo+ID4gPgo+ID4gPgo+ID4gPiBIaSBBbGV4YW5kZXIsCj4gPiA+Cj4gPiA+
IGVhZ2xlLmFsZXhhbmRlcjkyM0BnbWFpbC5jb20gd3JvdGUgb24gRnJpLCAyIEp1biAyMDIzIDEy
OjUyOjA4ICswMzAwOgo+ID4gPgo+ID4gPiA+IEhlbGxvLgo+ID4gPiA+Cj4gPiA+ID4gPiBBcyB5
b3UgbWVudGlvbmVkIG5vIEVDQyBlcnJvci4gIEFuZCBTcXVhc2hGUyBjb21wbGFpbnM6IFVuYWJs
ZSB0bwo+ID4gPiA+ID4gcmVhZCBkYXRhCj4gPiA+IGNhY2hlLgo+ID4gPiA+ID4gV2Ugd2FudCB0
byBzZWUgSS9PeCwgUkUjLCBXRSMgYW5kIFIvQiMsIHRvIGNoZWNrIGlmIGNvbW1hbmQgaW5wdXQK
PiA+ID4gPiA+IGFuZCBkYXRhCj4gPiA+IG91dHB1dCBwcm9wZXJseS4KPiA+ID4gPiA+IEl0IGlz
IGJldHRlciB0byBjYXB0dXJlIHRoZSBjb21tYW5kIDMxaCwgYW5kIGl0cyBmb2xsb3dpbmcgZGF0
YS4KPiA+ID4gPgo+ID4gPiA+IEkgb25seSBoYXZlIGEgdHdvLWNoYW5uZWwgb3NjaWxsb3Njb3Bl
IDopIEluIGFueSBjYXNlLCBpbiBvcmRlciB0bwo+ID4gPiA+IGNhcHR1cmUgdGhlIHJpZ2h0IG1v
bWVudCwgSSBuZWVkIHRvIHNvbWVob3cgbG9vcCBjb21tYW5kIDB4MzEgd2hlbgo+ID4gPiA+IGFu
IGVycm9yIG9jY3VycyBpbiBvcmRlciB0byB0YWtlIGEgcGljdHVyZS4gUmlnaHQ/Cj4gPiA+ID4K
PiA+ID4gPiBQbGVhc2UsIHRlbGwgbWUgd2hlcmUgSSBjYW4gcGF0Y2ggdGhlIG5hbmRfYmFzZSB0
byBnZXQgc3VjaCBhbgo+ID4gPiA+IGluZmluaXR5IGxvb3Agb24gZXJyb3I/Cj4gPiA+Cj4gPiA+
IEFueXdoZXJlIGluIHRoZSBjb3JlIHlvdSBjb3VsZCBqdXN0IG1ha2UgeW91ciBvd24gZXhlY19v
cCBzZXF1ZW5jZSBhbmQKPiA+ID4gY2FsbCBpdCBpbiBhIGxvb3AgSSBndWVzcz8KPiA+ID4KPiA+
ID4gQmVhbiwgd2hhdCBhcmUgeW91IHRyeWluZyB0byBwaWN0dXJlIHByZWNpc2VseT8gSGF2ZSB5
b3UgZXZlciBoYWQgYW55Cj4gPiA+IGlzc3VlcyB3aXRoIHRoZXNlIGNvbW1hbmRzPyBDYW4gQWxl
eGFuZGVyIHRyeSB0byBhZGQgYSBzdXJnaWNhbCBkZWxheSBzb21ld2hlcmU/Cj4gPiA+Cj4gPiA+
IFRoYW5rcywKPiA+ID4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
