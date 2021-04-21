Return-Path: <SRS0=I5F2=JS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381F8C433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Apr 2021 23:31:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8613061421
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Apr 2021 23:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8613061421
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IEYCMsNRHSH5RBmnJabb4IscvJ62WRD6W120ArMtoAE=; b=LTLKxcsYkfrQU2ncSY+ltX+9W
	asLXa4AmACoFVhep+SgF2ziu1DggeyInzKa1soWLyRtdUC+YdmH48W2W5l2E7cjjlDvHtkCUwKNnH
	cPRFx7nt6HJb7Oa1KkXHZdatzwI7UBrMh6ggW5U7ynEKDBCzao4HeytjnKevaukTw72/Ymqe4QYJM
	tAsswZjWqwlXGIESWxCBLJViX5RR+h0WiojnzEEoL9rVgN+eU74d3PUQR6fX2f5//aiGDX1Bn7IzB
	YkoN5k0R7JAuEEbmOXPOju1c6QKzhGDhMlrHSXCJh0ZPUiJr/Lp4zFF8mdbpRNYNMatAJ0/eaxbWI
	EiDBQKD8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZMIG-00FNpZ-Ss; Wed, 21 Apr 2021 23:30:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZMIB-00FNpB-Ud
 for linux-mtd@desiato.infradead.org; Wed, 21 Apr 2021 23:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=dhmLdIca+dH9gRUKlBTg6EmPw++FZmoNh1+vjTc3aDE=; b=zpik762zr0PbG9pBcgS3yNAxlW
 NQFhgisKp2UOjZ70pufVKYzKpzbLgqiXVBthAIZe6vu5c/s2l+L7tbu5N/y4fKRj9rMfYMVpbU9FT
 5VIqb0VZ+p+7nWsEq+ZsGvZkO0P3xtbyAQhmAZ0zYJeI/bRYz5lEBtRJZFOrCvxdWqxZUWt8yJLVC
 NaqOZkMt2i/iyfKDjSGOAfwg9wNpgNoxt96uBIc7R/xda1yRio75l4DFR6+YsdL9kUPDdox8ZdBfJ
 FyrMfhAK75K5dfpLH0Bz0Uyivar4ELRXoR0v/zzmQIRIBT4wwBePQx0fmOxgrWsUUUlxQOtUUiPey
 NrkIPJ0g==;
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZMI8-00DGCY-NE
 for linux-mtd@lists.infradead.org; Wed, 21 Apr 2021 23:29:58 +0000
Received: by mail-lf1-x133.google.com with SMTP id h36so15112579lfv.7
 for <linux-mtd@lists.infradead.org>; Wed, 21 Apr 2021 16:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dhmLdIca+dH9gRUKlBTg6EmPw++FZmoNh1+vjTc3aDE=;
 b=eLP3UoRNSHNGfztkoJ9P5hZe0FztP2D2KZY4kWnD8wTDPBSWBljjteqgqkEi4XiVrA
 uK0WOJ4uY3uBGGARjx5ZLoKPErYOVtGTKCUanihOyFS50l0AJP7gLjDC2FsB/3MkrLQ+
 W5Q/dwJwnvtPF9aGVX2dXk7/8oQxB1SJpPNamRMBY3rALzXlzIu51MehB3NfmPDr5wtv
 dfp5UtfPMO97euRpbQcYfxDCwYhZx/XTMVFEVvKD8bkFfiQfDtR93p+qucod4FL8GCpY
 XaDhTiiCwoTLfuqUI9KnmnG1s86Nk4uNUho9MJCwOLRDEhU2VWMpNnxlizEJ+5fz+7t+
 fbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dhmLdIca+dH9gRUKlBTg6EmPw++FZmoNh1+vjTc3aDE=;
 b=hWN3H21+/PwuaAdJ5x3P2iig4xZlIyZS8Z4l+vaGGh0ULPTHGHgL9qfCaxjdo+xmvC
 OWm1i5DRwDTe5d9aDQHonzrCOJCXuV5zWDBTKrYRWV2uBW0h7ol3lMD/xeYw4x6ByfnC
 rIhAMm+JYx7OHqbU4NQiEi01ZmAqXOYoRW4LnGQ6r6uRNR6YA692ht+JNX7uZfRcNaOD
 K+4bGlFwn6bzGnwQHdtbihASDUM6ju6covEGEDbsN2rQihihQB3LOQAbHH+TDK6jO3BU
 XHf3NIJQU6PKuDIPDil3yeQE8wqINmGQWKq6R2cIYDvzIILDr9jFsH3cMfzpk8Ccqrnx
 Deuw==
X-Gm-Message-State: AOAM533nftUvEw8ItlAouK2TR2zjc0lo8ITZqiItqr5nVomxZjfY7Aim
 QW4VkCGOJ72z8ufrLIisx6Sbf1MOXr/qiMVmb3jiyH7Vr4E=
X-Google-Smtp-Source: ABdhPJxgOJBxnmEQ6EHPQ+h6OxDVYSa7LcUiTdiQBBxysuQVJ63Ee21GV5dMMPpUPHjXFkxga1xaRRwtFaqv4H7oTbA=
X-Received: by 2002:a05:6512:1050:: with SMTP id
 c16mr448713lfb.295.1619047793174; 
 Wed, 21 Apr 2021 16:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DufVR=+EzCa1-MPUc+ZefZVTXb5Kgu3Wxms7cxw9GmGg@mail.gmail.com>
 <20210419083738.07a28a20@xps13>
 <CAOMZO5CpzojN1U9HfSA8Vi8uEzrn=0cqo4tMd_qi52F0Q6kObg@mail.gmail.com>
 <20210419135833.3ee22f58@xps13>
 <b6c62efc5b24bc0e04f222095573285f0c977216.camel@phytec.de>
 <20210419173608.434f4b8d@xps13>
 <13112dfe42b99e0c5ef340d9382bb76014bb870c.camel@phytec.de>
 <7615b69a-3b5d-c785-76b9-94b70412e7ca@collabora.com>
In-Reply-To: <7615b69a-3b5d-c785-76b9-94b70412e7ca@collabora.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 Apr 2021 20:29:41 -0300
Message-ID: <CAOMZO5AG-fgZ7a12_Eioj8u+bjjJ5WPG0paS-A+2yXvurw8WFA@mail.gmail.com>
Subject: Re: imx27: No space left to write bad block table
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: =?UTF-8?Q?Stefan_Riedm=C3=BCller?= <S.Riedmueller@phytec.de>, 
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, 
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_162956_805273_344DEDCE 
X-CRM114-Status: GOOD (  44.55  )
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

SGkgR3VpbGxhdW1lLAoKT24gV2VkLCBBcHIgMjEsIDIwMjEgYXQgNTo0NCBQTSBHdWlsbGF1bWUg
VHVja2VyCjxndWlsbGF1bWUudHVja2VyQGNvbGxhYm9yYS5jb20+IHdyb3RlOgoKPiBTb3JyeSBJ
J20gbGF0ZSB0byB0aGUgcGFydHksIHdhcyBidXN5IHdpdGggc29tZSBvdGhlciBrZXJuZWxjaQo+
IGlzc3Vlcy4gIEkgZ2F0aGVyIHRoaXMgaXMgYmVpbmcgcmV2ZXJ0ZWQgYW55d2F5IG5vdywgYnV0
IHBsZWFzZQo+IGxldCBtZSBrbm93IGlmIHlvdSBzdGlsbCBuZWVkIHRvIGNoZWNrIGFueXRoaW5n
LiAgQXMgZmFyIGFzIEkgY2FuCj4gdGVsbCwgdGhlcmUgaGFzbid0IGJlZW4gYW55IGF1dG9tYXRl
ZCBiaXNlY3Rpb24gbGFuZGluZyBvbiB0aGlzCj4gY29tbWl0LgoKVGhhbmtzLiBZZXMsIHdlIGRp
ZCB0aGUgcmV2ZXJ0IGluIGxpbnV4LW5leHQsIGJ1dCBJIGNvdWxkIG5vdCBzZWUgdGhlCm5leHQt
MjAyMTA0MjEgYm9vdCBsb2cgZm9yIHRoZSBpbXgyNy1waHl0ZWMtcGh5Y2FyZC1zLXJkayBib2Fy
ZCB0bwpjb25maXJtIHRoYXQgdGhlIE5BTkQgYmFkIGJsb2NrIHRhYmxlIGNhbiBiZSBmb3VuZCBh
Z2Fpbi4KClRoYW5rcyBmb3IgeW91ciBoZWxwCgoKCgo+Cj4gSXQncyBnZW5lcmFsbHkgcG9zc2li
bGUgdG8gcmUtcnVuIGFueXRoaW5nLCBpLmUuIG1ha2UgYSBrZXJuZWwKPiBidWlsZCB3aXRoIGEg
Y3VzdG9tIHBhdGNoc2V0IGFuZCBydW4gb25lIGdpdmVuIHRlc3Qgb24gYW55IG9mIHRoZQo+IHBs
YXRmb3JtcyBpbiBLZXJuZWxDSS4gIFRoZXJlIGp1c3QgaXNuJ3QgYW55IHB1YmxpYyBzZWxmLXNl
cnZpY2UKPiBmb3IgZG9pbmcgdGhhdCAoeWV0KS4KPgo+IEJlc3Qgd2lzaGVzLAo+IEd1aWxsYXVt
ZQo+Cj4gPj4+IEkgaGF2ZSB0ZXN0ZWQgdGhpcyBvbiBhbiBpLk1YIDYgYnkgc2ltdWxhdGluZyB0
d28gYmFkIEJCVCBibG9ja3MgYnkgc2ltcGx5Cj4gPj4+IHJldHVybmluZyAtRUlPIGluIG5hbmRf
ZXJhc2VfbmFuZCB3aGVuIHRoZSBibG9jayB0byBiZSBlcmFzZWQgaXMgb25lIG9mCj4gPj4+IHRo
ZQo+ID4+PiBmaXJzdCB0d28gQkJUIGJsb2Nrcy4KPiA+Pj4KPiA+Pj4gSSBoYXZlIHNlZW4gdGhp
cyBvbmNlIG9uIGEgY3VzdG9tZXIgYm9hcmQgYnV0IHdlcmUgbm90IGFibGUgdG8gcmVwcm9kdWNl
Cj4gPj4+IGl0Cj4gPj4+IGFueW1vcmUsIHRodXMgdGhlIHNpbXVsYXRpb24gb2YgdGhlIHR3byBi
YWQgYmxvY2tzLgo+ID4+Pgo+ID4+PiBXaXRob3V0IHRoZSBwYXRjaCBiZWxvdyBuZXcgdmVyc2lv
bnMgb2YgdGhlIEJCVCBjYW4gbm8gbG9uZ2VyIGJlIHdyaXR0ZW4KPiA+Pj4gdG8KPiA+Pj4gdGhl
IGZpcnN0IHR3byBibG9ja3MgcmVzZXJ2ZWQgZm9yIHRoZSBCQlQgYnV0IHRoZXkgYXJlIHN0aWxs
IGV2YWx1YXRlZCB0bwo+ID4+PiByZWFkCj4gPj4+IHRoZSBCQlQgZnJvbSBkdXJpbmcgYm9vdCBk
dWUgdGhlIGxhY2sgb2YgYSB0ZXN0IGlmIHRoZXNlIGJsb2NrcyBhcmUgYmFkLgo+ID4+PiBTbwo+
ID4+PiBjaGFuZ2VzIHRvIHRoZSBCQlQgYWZ0ZXIgdGhlc2UgdHdvIGJsb2NrcyB0dXJuIGJhZCBh
cmUgb25seSBrZXB0IGFuZCB1c2VkCj4gPj4+IHVudGlsIHRoZSBuZXh0IHJlYm9vdCB3aGVyZSBh
Z2FpbiB0aGUgb2xkIHZlcnNpb24gb2YgdGhlIHR3byB3b3JuIGJsb2Nrcwo+ID4+PiBpcwo+ID4+
PiB1c2VkIGFzIGEgYmFzaXMuCj4gPj4+Cj4gPj4+IEkgdHJpZWQgdG8gdXNlIHRoZSBzYW1lIG1l
Y2hhbmlzbSB0aGF0IGlzIHVzZWQgdG8gaWRlbnRpZnkgYmFkIGJsb2Nrcwo+ID4+PiBkdXJpbmcg
YQo+ID4+PiBzY2FuIGZvciBiYWQgYmxvY2tzLiBCdXQgbWF5YmUgSSBtaXNzZWQgc29tZXRoaW5n
IHRoZXJlPyBPciB3ZXJlIG15Cj4gPj4+IGFzc3VtcHRpb25zIHdyb25nIGluIHRoZSBmaXJzdCBw
bGFjZT8KPiA+Pgo+ID4+IEhvbmVzdGx5IEkgZG9uJ3Qga25vdyB3aGF0IGlzIHdyb25nIGV4YWN0
bHkgaW4gdGhpcyBwYXRjaC4KPiA+Pgo+ID4+IFdlIHdpbGwgcmV2ZXJ0IHRoZSBjb21taXQgYXMg
aXQgY2xlYXJseSBicmVha3Mgc29tZXRoaW5nIGZ1bmRhbWVudGFsCj4gPj4gYW5kIHRoZSBtZXJn
ZSB3aW5kb3cgaXMgdG9vIGNsb3NlIHRvIGFkb3B0IGEgaGFja2lzaCBhdHRpdHVkZS4KPiA+Pgo+
ID4+IEkgd291bGQgcHJvcG9zZSB0aGUgZm9sbG93aW5nIHRlc3RzIHdpdGggeW91ciBib2FyZDoK
PiA+PiAtIEhhY2sgdGhlIGNvcmUgdG8gYWxsb3cgeW91cnNlbGYgdG8gYWNjZXNzIGJhZCBibG9j
a3MgZnJvbSB1c2Vyc3BhY2UKPiA+PiAgIGZvciB0ZXN0aW5nIHB1cnBvc2VzLgo+ID4+IC0gV2l0
aCB0aGUgYmVsb3cgY29tbWl0LCB5b3Ugc2hvdWxkIGhhdmUgdGhlIHNhbWUgYmVoYXZpb3IgdGhh
bgo+ID4+ICAgcmVwb3J0ZWQgYnkgRmFiaW8uCj4gPj4gLSBSZXZlcnQgdGhlIGNvbW1pdC4KPiA+
PiAtIE1hbnVhbGx5IGNoYW5nZSB0aGUgYmFkIGJsb2NrIG1hcmtlcnMgKG5hbmRkdW1wLCBmbGFz
aF9lcmFzZSwKPiA+PiAgIG5hbmR3cml0ZSkgdG8gZGVjbGFyZSB0aGUgdHdvIHRhYmxlcyBiYWQu
IFJlYm9vdCBhbmQgb2JzZXJ2ZSBpZiB0aGVyZQo+ID4+ICAgYXJlIGFueSBpc3N1ZXMuIFlvdSBj
YW4gdHJ5IHRvIHdvcmsgZnJvbSB0aGVyZS4KPiA+Cj4gPiBUaGFua3MgZm9yIHRoZSBpbnB1dCEg
SSB3aWxsIGZvbGxvdyB5b3VyIHN1Z2dlc3Rpb25zIGFuZCBsZXQgeW91IGd1eXMga25vdyBteQo+
ID4gZmluZGluZ3MuCj4gPgo+ID4gUmVnYXJkcywKPiA+IFN0ZWZhbgo+ID4KPiA+Pgo+ID4+Pj4g
LS0tODwtLS0KPiA+Pj4+Cj4gPj4+PiBjb21taXQgYmQ5YzlmZTJhZDA0NTQ2OTQwZjRhOTk3OWQ2
NzllNjJjYWU2YWE1MQo+ID4+Pj4gQXV0aG9yOiBTdGVmYW4gUmllZG11ZWxsZXIgPHMucmllZG11
ZWxsZXJAcGh5dGVjLmRlPgo+ID4+Pj4gRGF0ZTogICBUaHUgTWFyIDI1IDExOjIzOjM3IDIwMjEg
KzAxMDAKPiA+Pj4+Cj4gPj4+PiAgICAgbXRkOiByYXduYW5kOiBiYnQ6IFNraXAgYmFkIGJsb2Nr
cyB3aGVuIHNlYXJjaGluZyBmb3IgdGhlIEJCVCBpbgo+ID4+Pj4gTkFORAo+ID4+Pj4KPiA+Pj4+
ICAgICBUaGUgYmxvY2tzIGNvbnRhaW5pbmcgdGhlIGJhZCBibG9jayB0YWJsZSBjYW4gYmVjb21l
IGJhZCBhcyB3ZWxsLiBTbwo+ID4+Pj4gICAgIG1ha2Ugc3VyZSB0byBza2lwIGFueSBibG9ja3Mg
dGhhdCBhcmUgbWFya2VkIGJhZCB3aGVuIHNlYXJjaGluZyBmb3IKPiA+Pj4+IHRoZQo+ID4+Pj4g
ICAgIGJhZCBibG9jayB0YWJsZS4KPiA+Pj4+Cj4gPj4+PiAgICAgT3RoZXJ3aXNlIGluIHZlcnkg
cmFyZSBjYXNlcyB3aGVyZSB0d28gQkJUIGJsb2NrcyB3ZWFyIG91dCBpdCBtaWdodAo+ID4+Pj4g
ICAgIGhhcHBlbiB0aGF0IGFuIG9ic29sZXRlIEJCVCBpcyB1c2VkIGluc3RlYWQgb2YgYSBuZXdl
ciBhdmFpbGFibGUKPiA+Pj4+ICAgICB2ZXJzaW9uLgo+ID4+Pj4KPiA+Pj4+ICAgICBTaWduZWQt
b2ZmLWJ5OiBTdGVmYW4gUmllZG11ZWxsZXIgPHMucmllZG11ZWxsZXJAcGh5dGVjLmRlPgo+ID4+
Pj4gICAgIFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxp
bi5jb20+Cj4gPj4+PiAgICAgTGluazoKPiA+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LW10ZC8yMDIxMDMyNTEwMjMzNy40ODExNzItMS1zLnJpZWRtdWVsbGVyQHBoeXRlYy5kZQo+
ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2JidC5j
Cj4gPj4+PiBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmJ0LmMKPiA+Pj4+IGluZGV4IGRj
ZWQzMmExMjZkOS4uNmUyNWE1Y2U1YmE5IDEwMDY0NAo+ID4+Pj4gLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbmFuZF9iYnQuYwo+ID4+Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFu
ZF9iYnQuYwo+ID4+Pj4gQEAgLTUyNSw2ICs1MjUsNyBAQCBzdGF0aWMgaW50IHNlYXJjaF9iYnQo
c3RydWN0IG5hbmRfY2hpcCAqdGhpcywKPiA+Pj4+IHVpbnQ4X3QKPiA+Pj4+ICpidWYsCj4gPj4+
PiAgewo+ID4+Pj4gICAgICAgICB1NjQgdGFyZ2V0c2l6ZSA9IG5hbmRkZXZfdGFyZ2V0X3NpemUo
JnRoaXMtPmJhc2UpOwo+ID4+Pj4gICAgICAgICBzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRf
dG9fbXRkKHRoaXMpOwo+ID4+Pj4gKyAgICAgICBzdHJ1Y3QgbmFuZF9iYnRfZGVzY3IgKmJkID0g
dGhpcy0+YmFkYmxvY2tfcGF0dGVybjsKPiA+Pj4+ICAgICAgICAgaW50IGksIGNoaXBzOwo+ID4+
Pj4gICAgICAgICBpbnQgc3RhcnRibG9jaywgYmxvY2ssIGRpcjsKPiA+Pj4+ICAgICAgICAgaW50
IHNjYW5sZW4gPSBtdGQtPndyaXRlc2l6ZSArIG10ZC0+b29ic2l6ZTsKPiA+Pj4+IEBAIC01NjAs
NiArNTYxLDEwIEBAIHN0YXRpYyBpbnQgc2VhcmNoX2JidChzdHJ1Y3QgbmFuZF9jaGlwICp0aGlz
LAo+ID4+Pj4gdWludDhfdAo+ID4+Pj4gKmJ1ZiwKPiA+Pj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGludCBhY3RibG9jayA9IHN0YXJ0YmxvY2sgKyBkaXIgKiBibG9jazsKPiA+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGxvZmZfdCBvZmZzID0gKGxvZmZfdClhY3RibG9jayA8PCB0aGlz
LQo+ID4+Pj4+IGJidF9lcmFzZV9zaGlmdDsKPiA+Pj4+Cj4gPj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAvKiBDaGVjayBpZiBibG9jayBpcyBtYXJrZWQgYmFkICovCj4gPj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICBpZiAoc2Nhbl9ibG9ja19mYXN0KHRoaXMsIGJkLCBvZmZzLCBidWYp
KQo+ID4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+Pj4+
ICsKPiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIFJlYWQgZmlyc3QgcGFnZSAqLwo+
ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgc2Nhbl9yZWFkKHRoaXMsIGJ1Ziwgb2Zmcywg
bXRkLT53cml0ZXNpemUsIHRkKTsKPiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICgh
Y2hlY2tfcGF0dGVybihidWYsIHNjYW5sZW4sIG10ZC0+d3JpdGVzaXplLAo+ID4+Pj4gdGQpKSB7
Cj4gPj4+Pgo+ID4+Pj4KPiA+Pj4+IFRoYW5rcywKPiA+Pj4+IE1pcXXDqGwKPiA+Pgo+ID4+IFRo
YW5rcywKPiA+PiBNaXF1w6hsCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
