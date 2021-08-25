Return-Path: <SRS0=OVP+=NQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B50C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Aug 2021 08:49:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA6D861176
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Aug 2021 08:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA6D861176
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpjhOF6XkylPxDQbiuy+9rYTTfTqgOiPXHSa1tP/Psc=; b=Y4eGX/c/pTdrfJ
	nnAzSSTZHm29+PbTnegndP5ajg3WhpjRBedBykn8/fBcoluwtE8sXLv47xnYxBznEsa0Cqlh4vhQj
	8mQQOaRKp/DY34RZvDpdLVeV4wWYCBrxR/bmqzEWffZV9QMRapScRmLDMpy0lb9vpoinus2pUbW5Y
	vpZ38xLnw/43szsAO9yV6rEvTBxqdC2HjRM0wCv2gDUpba2FRVXSTwLdOHCM5Scx1LoYddga3wQop
	oTkh1o6mAn77hVc5aUiPrkomzFqHfkW3FlmMq1J5CjAeE+M3rfekLCpHDfxDzb5LB8RCYw9xJWiJW
	wRgkXcC5KHvhsAeitIEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIoZm-005zgE-Ai; Wed, 25 Aug 2021 08:48:02 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIoZd-005zfC-W8
 for linux-mtd@lists.infradead.org; Wed, 25 Aug 2021 08:47:57 +0000
Received: by mail-qk1-x72d.google.com with SMTP id 14so26242656qkc.4
 for <linux-mtd@lists.infradead.org>; Wed, 25 Aug 2021 01:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=utvwaDtqiuzdYnqZLvGiSSQNitaqJgqrwf7/GnryxS8=;
 b=OBekRaKU3Bx1jjoWQpUl9EQYlFrgpb2pZGz9B7ndyce+B/FgUoU7XzebTTmSj5fU4i
 fReUfTnqhdquSAhAk7RGfXCT1hMtZZaW+7kGmR/yi4VjeOtblQvXJni7R4jaBjqImWAl
 xKp4TSNUeMVvTDyYGrno1xg8rqaGBEZ3vJhiQU8UcBgVDzw3sd5WZXLsTatsAgDdJiml
 KlO74SJpp2yUk/9ZaazfZsntE44tDVyMQBF6bjaXOOnf3XhPYrYF5UOpZ3Len1OoQaa4
 2jtlehK9Si3iAdSCexnh32MDUdbMo5mz5+xmmrZ8Ks2zPY/+rWdcJF7+SoneZ0lRjaVZ
 Tfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=utvwaDtqiuzdYnqZLvGiSSQNitaqJgqrwf7/GnryxS8=;
 b=dMd2zD3oi6IVJTMcf6xVtSUxV6jIrhWWURTyyEZFWYGZUtP+7jH9uTgHQntaYbpbBF
 7RHiaD12a+UvQZoJs66MAkZXqR9D7ybwHY5vr42m5GXV706hA1DBOTpBwRCjIqlCYubG
 7s30bydIv9wXD8tnB+2rm12wsFNogNmjwoXMSk4hEZl3efY3gZ461diMRHMOXdwKwcVc
 050vOjSCz4m5NfDlPJMs6M4OTMFXAQevpV1OMpVKyvLrrEeZHnubglnAWwQp8Znb174A
 BTSbG6dT2YD2+qLNOXmGonOFrZdqDbMU1S6ussCpwXIteroBZSDQ9TpRg0nfz27+295Y
 QmTw==
X-Gm-Message-State: AOAM531Xd0jVOmKTIs9Gs0DHJMhgR1kN7ZsykcQgNkymyQzBUOAye2KO
 2TXrm5xMQ/ZxjovWhU+GtDhveoSDDojQxXxsW54=
X-Google-Smtp-Source: ABdhPJz6k8CyRZmfeTsBewdLSHdb+a5JQbfYt7URFG1PxLH912k2H6q+UNrRszg9yY00WRKSXACwhgn4UROAG5A2q/A=
X-Received: by 2002:a05:620a:318c:: with SMTP id
 bi12mr11285336qkb.263.1629881270979; 
 Wed, 25 Aug 2021 01:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210808072643.GA5084@ubuntu> <20210816093126.442f74a1@xps13>
 <CAE9cyGQ+Bb3rQxiF4My9zXwg_+QYifaCckE=C6spAtN9_4dBFQ@mail.gmail.com>
 <20210819100334.6af2d86e@xps13>
 <CAE9cyGSF2vTCptSZd3uMFaZPD=as=PwZY14S+zDhzjWCmsfmpQ@mail.gmail.com>
 <20210823172413.0bc4ab3a@xps13>
 <CAE9cyGTKFcMuxePo2SgxkBe_cWvP5nZ_SDcnuUtwaE5o9oVq3g@mail.gmail.com>
 <20210824192203.076df55e@xps13>
In-Reply-To: <20210824192203.076df55e@xps13>
From: Kestrel seventyfour <kestrelseventyfour@gmail.com>
Date: Wed, 25 Aug 2021 10:47:40 +0200
Message-ID: <CAE9cyGQ9_--=+MGc4_vTV1BkR6jv2RZcixyfLtCozXo349+6KA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use
 device tree setting
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_014754_106761_499532E0 
X-CRM114-Status: GOOD (  33.11  )
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

SGkgTWlxdcOobCwKCkFtIERpLiwgMjQuIEF1Zy4gMjAyMSB1bSAxOToyMiBVaHIgc2NocmllYiBN
aXF1ZWwgUmF5bmFsCjxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPjoKPgo+IEhlbGxvLAo+Cj4g
S2VzdHJlbCBzZXZlbnR5Zm91ciA8a2VzdHJlbHNldmVudHlmb3VyQGdtYWlsLmNvbT4gd3JvdGUg
b24gVHVlLCAyNCBBdWcKPiAyMDIxIDA5OjE1OjQ5ICswMjAwOgo+Cj4gPiBIaSBNaXF1w6hsLAo+
ID4KPiA+IEFtIE1vLiwgMjMuIEF1Zy4gMjAyMSB1bSAxNzoyNCBVaHIgc2NocmllYiBNaXF1ZWwg
UmF5bmFsCj4gPiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT46Cj4gPiA+Cj4gPiA+IEhpIEtl
c3RyZWwsCj4gPiA+Cj4gPiA+IEtlc3RyZWwgc2V2ZW50eWZvdXIgPGtlc3RyZWxzZXZlbnR5Zm91
ckBnbWFpbC5jb20+IHdyb3RlIG9uIE1vbiwgMjMgQXVnCj4gPiA+IDIwMjEgMTM6MTk6NDMgKzAy
MDA6Cj4gPiA+Cj4gPiA+ID4gSGkgTWlxdcOobCwKPiA+ID4gPgo+ID4gPiA+IEFtIERvLiwgMTku
IEF1Zy4gMjAyMSB1bSAxMDowMyBVaHIgc2NocmllYiBNaXF1ZWwgUmF5bmFsCj4gPiA+ID4gPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Ogo+ID4gLi4uCj4gPiA+ID4KPiA+ID4gPiB0aGFuayB5
b3UgZm9yIHlvdXIgcmVzcG9uc2UuCj4gPiA+ID4gSWYgSSByZW1vdmUgdGhlIG5hbmQtZWNjLXh4
eCBwcm9wZXJ0aWVzIGluIHRoZSBkZXZpY2UgdHJlZSwgdGhlIGRldmljZSB3aXRoCj4gPiA+ID4g
dGhlIFRvc2hpYmEgTkFORCBjaGlwIGlzIHdvcmtpbmcuIEhvd2V2ZXIsIHRoZSBkZXZpY2Ugd2l0
aCB0aGUgTWljcm9uCj4gPiA+ID4gTkFORCBmYWlscyB3aXRoIE5PIEVDQyBmdW5jdGlvbnMgc3Vw
cGxpZWQ7IGhhcmR3YXJlIEVDQyBub3QgcG9zc2libGUsCj4gPiA+ID4gc2VlbXMgdG8gYmUgYXQg
bGluZSA1MzY3IG9yIGVxdWl2YWxlbnQuCj4gPiA+ID4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyNM
NTM2Nwo+ID4gPiA+Cj4gPiA+ID4gSXQgbG9va3MgbGlrZSB0aGUgbWljcm9uIG5hbmQgZHJpdmVy
IHN1cHBvcnRzIG9uIGRpZSBvbmx5IGlmIGl0cwo+ID4gPiA+IHNwZWNpZmllZCBpbnQgdGhlCj4g
PiA+ID4gRGV2aWNlIHRyZWU6Cj4gPiA+ID4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21pY3Jvbi5jI0w1MTEK
PiA+ID4gPiBUaGUgTWljcm9uIE5BTkQgZHJpdmVyIHByb2JhYmx5IG5lZWRzIHRvIHNldCB0aGUg
RUNDIHR5cGUgdG8gT04gRElFIGlmIHRoZQo+ID4gPiA+IHZhcmlhYmxlIG9uZGllIGNvbnRhaW5z
IHRoZSBzdXBwb3J0ZWQgYXR0cmlidXRlPyEKPiA+ID4KPiA+ID4gWW91J3JlIHJpZ2h0IGJ1dCBJ
IGRvbid0IHNlZSBhbnkgZWFzeSB1cHN0cmVhbS1hYmxlIHNvbHV0aW9uIGhlcmUuCj4gPiA+IENo
YW5naW5nIHRoZSBiZWhhdmlvciBpbiB0aGUgWHdheSBkcml2ZXIgd291bGQgY2VydGFpbmx5IGJy
ZWFrIHVzZXJzLAo+ID4gPiBjaGFuZ2luZyB0aGUgYmVoYXZpb3IgaW4gdGhlIE1pY3JvbiBkcml2
ZXIgd291bGQgY2VydGFpbmx5IGJyZWFrIGV2ZW4KPiA+ID4gbW9yZSB1c2Vycy4gVGhlIHJvb3Qg
Y2F1c2UgYmVpbmcgYW4gYWJzZW5jZSBvZiBwcm9wZXIgZGVzY3JpcHRpb24gKHRoZQo+ID4gPiBp
bnRlZ3JhdGlvbiBjaGFuZ2VkKS4gSG9uZXN0bHkgSSBmZWVsIHN0dWNrLCBtYXliZSB5b3UgY2Fu
IHRyeSB0bwo+ID4gPiByZWdpc3RlciB5b3VyIGRldmljZSwgaWYgaXQgZmFpbHMsIGNoYW5nZSB0
aGUgaW50ZWdyYXRpb24gaW4gdGhlIGRyaXZlcgo+ID4gPiAodG8gYW4gb25kaWUgZWNjIGVuZ2lu
ZSkgdGhlbiByZXRyeT8KPiA+ID4KPiA+ID4gVGhhbmtzLAo+ID4gPiBNaXF1w6hsCj4gPgo+ID4g
RG8geW91IHRoaW5rIGFkZGluZyBzb21ldGhpbmcgbGlrZSBiZWxvdyBhdCB0aGUgZm9sbG93aW5n
IGxvY2F0aW9uCj4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291
cmNlL2RyaXZlcnMvbXRkL25hbmQvcmF3L3h3YXlfbmFuZC5jI0wyMjMKPiA+IHdvdWxkIGJlIHVw
c3RyZWFtYWJsZSAod2l0aCBvciB3aXRob3V0IGRldmljZSB0cmVlIHByb3BlcnR5Pyk/Cj4gPgo+
ID4gICAgICAgICBlcnIgPSBuYW5kX3NjYW4oJmRhdGEtPmNoaXAsIDEpOwo+ID4gICAgICAgICBp
ZiAoZXJyIC8qICYmIG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgImxhbnRpcSxyZXRyeS1vbi1k
aWUiKSAqLykgewo+ID4gICAgICAgICAgICAgICAgIGRhdGEtPmNoaXAuZWNjLmVuZ2luZV90eXBl
ID0gTkFORF9FQ0NfRU5HSU5FX1RZUEVfT05fRElFOwo+ID4gICAgICAgICAgICAgICAgIGVyciA9
IG5hbmRfc2NhbigmZGF0YS0+Y2hpcCwgMSk7Cj4gPiAgICAgICAgICAgICAgICAgaWYgKGVycikg
cmV0dXJuIGVycjsKPiA+ICAgICAgICAgfQo+ID4KPiA+IEl0IHN0aWxsIHRocm93cyB0aGUga2Vy
bmVsIHdhcm5pbmcgb24gZmlyc3QgdHJ5LCBidXQgdGhlIHNlY29uZCB0cnkgdGhlbiB3b3Jrcy4K
Pgo+IENhbiB5b3UgcGxlYXNlIHJlbWluZCBtZSB3aGF0IGlzIHh3YXkvbGFudGlxL3lvdXIgc2V0
dXAvaG93IHB1YmxpYyBpdAo+IGlzL3dobydzIHVzaW5nIHRoaXMgZHJpdmVyPwo+Cj4gVGhhbmtz
LAo+IE1pcXXDqGwKCkl0cyBmb3IgT3BlbndydCwgSSB3b3VsZCBsaWtlIHRvIGFkZCBzdXBwb3J0
IGZvciAzIG1vcmUgZGV2aWNlcwpBVk0gZnJpdHpib3ggMzQ5MC81NDkwIGFuZCA3NDkwLiBUaGV5
IGFsbCBoYXZlIHZhcnlpbmcgTkFORCBjaGlwcy4KSSBoYXZlIGluaXRpYWxseSBjcmVhdGVkIGEg
UFIgdG8gaGF2ZSBteSBpbml0aWFsIHBhdGNoIHRlc3RlZDoKaHR0cHM6Ly9naXRodWIuY29tL29w
ZW53cnQvb3BlbndydC9wdWxsLzQ0MjYKVGhlcmUgaXMgYWxyZWFkeSBvbmUgZGV2aWNlIHN1cHBv
cnRlZCB3aGljaCBoYXMgdHdvIERUQnMgb25lIGZvcgpNaWNyb24gYW5kIG9uZSBmb3Igbm9uIE1p
Y3JvbiAoMzM3MCksIGJ1dCBpdHMgbm90IHZlcnkgc3RyYWlnaHQgZm9yd2FyZC4KV2l0aG91dCBo
YXZpbmcgdGhpcyBpc3N1ZSBzb2x2ZWQsIGZsYXNoaW5nIHRob3NlIGRldmljZXMgd291bGQgYmUK
cG9zc2libHkgaGF2aW5nIGlzc3VlcyBkZXBlbmRpbmcgb24gTkFORCBjaGlwIG9yIHRoZSBhd2t3
YXJkCndvcmthcm91bmQgb2YgZmxhc2hpbmcgb25lIGltYWdlIGFuZCBpZiBpdCBkb2VzIG5vdCBi
b290LCBib290IHRoZQpvdGhlciBvbmUuIFdpdGhvdXQgc2VsZiBzb2xkZXJlZCBzZXJpYWwgY29u
c29sZSwgaXQgd291bGQgbm90IHZlcnkKZWFzeSB0byBmaWd1cmUgb3V0IHRoZSBOQU5EIG1hbnVm
YWN0dXJlci4KVGhlIEFWTSBzdG9jayBmaXJtd2FyZSBpcyBvbGQga2VybmVsIGFuZCBkb2VzIG5v
dCB1c2UgZGV2aWNlCnRyZWUgZm9yIE5BTkQsIHRoZXkganVzdCBxdWVyeSBhbGwgcG9zc2libGUg
bWFudWZhY3R1cmVycyBhbmQgc2V0CnVwIE5BTkQgYmFzZWQgb24gbWFudWZhY3R1cmVyIHF1ZXJ5
LgoKVGhhbmtzLCBEYW5pZWwuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
