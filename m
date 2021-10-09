Return-Path: <SRS0=mnIE=O5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D5A4C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 05:54:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C397C60F6B
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 05:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C397C60F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzj1KZPm/WmX0+6roow5SbOOvX7yWZorgODpC+vmtOM=; b=gCzusmAXBqwLhc
	FP3WWWogtNguAqkBlKwS9Q7e4d4D6/fRq7ZD4SfhnRhgeFuVGyegR0a14JuiSEtK3ie32OtUayWGy
	YZcBatXy74AR013OD7TqIIvJ5S9SoWpBOpY2g5NXljTvnDJtB4kN6joUl8pEPlAoMFLWkJY6ZU1ti
	AiZeSCMVlGRfYJOc0AEDsIWA3RUNBjU91Rt1Thvl8fWMqBfyjKlo/a5rLUnCWc0z6b/3S5W987iwK
	tousz08/VL6/+WNJRpwDcWEEdNo4ABqx28A248QQW7sK2FIx9mvg9G1f6QFAs/ITbT71CSZTLtDZl
	nqvMhuKr3/VWUUjpUIJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ5In-005CRb-Us; Sat, 09 Oct 2021 05:53:46 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ5Ik-005CR9-0Q
 for linux-mtd@lists.infradead.org; Sat, 09 Oct 2021 05:53:43 +0000
Received: by mail-pl1-x62c.google.com with SMTP id x8so7484649plv.8
 for <linux-mtd@lists.infradead.org>; Fri, 08 Oct 2021 22:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JG8exk8jHpk2TyO1FH7ip/JFW+euPRnaRlCHf0AucGQ=;
 b=J+k10H4Xu4y6yBfnAP2z3KAqGSJE+EQY1U3ihTxi1chvxQxVSXALeIw4BjLrNg/n4Q
 h4XiuVfPlLSwRAxmno13MaYGa6XUfU1a97MCzmW++LNcbKVuJIBV1kvTZZz4VWF2wsuZ
 MnSvbdItmajNnE7O/KYNpNvTbHZ4iy0cqs+Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JG8exk8jHpk2TyO1FH7ip/JFW+euPRnaRlCHf0AucGQ=;
 b=gDlZkh9bSknGo8B9r5mzPWlPVdXnXd3ugmVNsNNx6y9yQxIu2WQYQGTnjquDJMU6f/
 vXE4ekk2uGG0CSjrL3uQKRrobItdmYgjOlyx743d7SdKfwg6HAD5YqnJIP94sdE/gkMn
 ShoqTxaJXROFqZTCdHvgtWIvN0js+Khn2z+EDQ2ddU/lUg1KGbuc38BwZLroKCrAHvWp
 7pIaJzbRJVlF1/v0pOFjy/99CNYnh86Y8S+Rr8hNERjCBWY08s7P5aLkg4/bQNe6JjkZ
 9sVzgCRVQ+otqwdIyGOzjaDY5a6fRjEcYmuynqga5CaNFU4dhYTPLxJu7HMRVoWlPGK/
 zUMg==
X-Gm-Message-State: AOAM533+UHaUiKpuueIGK21ruC04tgQo9C7IrTC1vUOSEGo6Gju/Kh8J
 1evc/1EprPVlTpMpOwCi/9yY0BjiCqq+OcMqWIpt/AR5nUumQQ==
X-Google-Smtp-Source: ABdhPJyd+H5szNnFAb+VX+wJ4DvIK4+54DbWhs/iwFnhrzaD6ITUgICV6IUgl0DlDlTHS0DsWFR9POfFaRSmDa7e268=
X-Received: by 2002:a17:902:7b85:b0:13d:cdc4:9531 with SMTP id
 w5-20020a1709027b8500b0013dcdc49531mr13621003pll.27.1633758819523; Fri, 08
 Oct 2021 22:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20211008152905.2fbdcce9@xps13> <20211008153631.3f1a09aa@xps13>
 <6364938.4vTCxPXJkl@n95hx1g2> <20211008180752.09f33896@xps13>
In-Reply-To: <20211008180752.09f33896@xps13>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sat, 9 Oct 2021 07:53:26 +0200
Message-ID: <CAOf5uwkTzPtqjO0XQ7otzNKLugUzS+9MJg0GkdtvV2JY4=n5mw@mail.gmail.com>
Subject: Re: GPMI iMX6ull timeout on DMA
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Christian Eggers <ceggers@arri.de>,
 =?UTF-8?Q?Stefan_Riedm=C3=BCller?= <S.Riedmueller@phytec.de>, 
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "han.xu@nxp.com" <han.xu@nxp.com>, 
 Christian Hemp <C.Hemp@phytec.de>, "gerg@kernel.org" <gerg@kernel.org>, 
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_225342_235360_4F833D1F 
X-CRM114-Status: GOOD (  31.78  )
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

SGkKCk9uIEZyaSwgT2N0IDgsIDIwMjEgYXQgNjowNyBQTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIENocmlzdGlhbiwKPgo+IGNlZ2dlcnNA
YXJyaS5kZSB3cm90ZSBvbiBGcmksIDggT2N0IDIwMjEgMTU6NDk6MjEgKzAyMDA6Cj4KPiA+IE9u
IEZyaWRheSwgOCBPY3RvYmVyIDIwMjEsIDE1OjM2OjMxIENFU1QsIE1pcXVlbCBSYXluYWwgd3Jv
dGU6Cj4gPiA+Cj4gPiA+IG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gRnJpLCA4
IE9jdCAyMDIxIDE1OjI5OjA1ICswMjAwOgo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gSWYgdGhpcyBj
bG9jayAoYXMgSSB1bmRlcnN0YW5kKSBkb2VzIG5vdCBwcmV2ZW50IHVzIHRvIGFjY2VzcyB0aGUK
PiA+ID4gPiByZWdpc3RlcnMgYnV0IG9ubHkgZmVlZHMgdGhlIGV4dGVybmFsIE5BTkQgYnVzIHBh
cnQsIHRoZW4gdGhlcmUgaXMgbm8KPiA+ID4gPiBuZWVkIHRvIGVuYWJsZSBpdCBpbiB0aGUgcHJv
YmUsIGp1c3QgYWNxdWlyaW5nIGl0IHdpbGwgYmUgZW5vdWdoLgo+ID4KPiA+IGNsb2Nrc1swXSBp
cyAiZ3BtaV9pbyIgd2hpY2ggc291bmRzIG1vcmUgbGlrZSBpL28gdGhhbiByZWdpc3RlcnMuIFNv
IGxldHMKPiA+IHRyeSB0byByZW1vdmUgdGhlIGluaXRpYWwgY2FsbCB0byBjbGtfc2V0X3JhdGUo
KS4KPiA+Cj4gPiA+ID4gVGhlbiwgdGhlIGZpcnN0IGNhbGwgZm9yIGFuIElPIG9wZXJhdGlvbiB3
aXRoIC0+bXVzdF9hcHBseV90aW1pbmdzCj4gPiA+ID4gc2hvdWxkOgo+ID4gPiA+Cj4gPiA+ID4g
ICBpZiAoaW14NikKPiA+ID4gPiAgICAgICAgICAgZGlzYWJsZV9jbGsoKTsKPiA+ID4gPgo+ID4g
PiA+ICAgY2xrX3NldF9yYXRlKCk7Cj4gPiA+ID4KPiA+ID4gPiAgIGlmIChpbXg2KQo+ID4gPiA+
ICAgICAgICAgICBlbmFibGVfY2xrKCk7Cj4gPgo+ID4gRG8geW91IHRoaW5rIHRoYXQgdGhlIG5l
ZWQgZm9yIGF2b2lkaW5nIGNsb2NrIGdsaXRjaGVzIGlzIGkuTVg2IHNwZWNpZmljPwo+ID4gVGhl
IGVycmF0YSBJIG1lbnRpb25lZCBpcyBzcGVjaWZpYyBmb3IgdGhlIGJvb3Rsb2FkZXIgc29mdHdh
cmUsIGJ1dCAoSSB0aGluaykKPiA+IHRoZSByZXF1aXJlbWVudCBmb3Igc3dpdGNoaW5nIG9mZiB0
aGUgY2xvY2tzIGdhdGVzIHByaW9yIGNoYW5naW5nIHRoZSBkaXZpZGVycwo+ID4gbWF5IGFwcGx5
IGFsc28gZm9yIG90aGVyIHNlcmllcy4KPgo+IEkgaG9uZXN0bHkgZG9uJ3Qga25vdywgcGVyaGFw
cyBIYW4gaGF2ZSBtb3JlIGRldGFpbHMgYWJvdXQgaXQuIElmIHlvdQo+IHRoaW5rIGl0J3MgYSB3
aWRlciBpc3N1ZSwgdGhlbiB3ZSBjYW4ganVzdCBkbyB0aGUgZGlzYWJsZS9lbmFibGUgc3RlcAo+
IHdpdGhvdXQgYW55IGZ1cnRoZXIgY2hlY2tzLgo+CgpTdGlsbCBkb24ndCBleHBsYWluIHdoeSBp
dCB3YXMgd29ya2luZyBvbiB0aGUgb2xkIGRyaXZlci4gVGhlIGdsaXRjaAp3YXMgYWxyZWFkeSB0
aGVyZSwKc28ganVzdCBhIGRlbGF5IGNhbiBkbyB0aGUgdHJpY2suIEZvciBpbXgyOCB3ZSBuZWVk
IHRvIHJlcGFyZW50IHRvIGEKZGlmZmVyZW50IGNsb2NrIHRoZQpuYW5kIGRyaXZlciBpbiBvcmRl
ciB0byBnZXQgdGhlIGZyZXF1ZW5jeSB3ZSB3YW50IGluIEVETyBtb2RlLiBJJ20Kc3RpbGwgdGhp
bmtpbmcgdGhhdApzZXQgdGhlIGZyZXF1ZW5jeSB3aXRob3V0IHdpdGhvdXQgZ2V0IGJhY2sgYW5k
IHVuZGVyc3RhbmQgaWYgaW4gdGhhdAplZG8gbW9kZSBpcyB2YWxpZAppcyBzdGlsbCBhIGJ1Zy4K
Ck1pY2hhZWwKCj4gPiA+IEFjdHVhbGx5IHdlIHNob3VsZCBlbnN1cmUgY2xrcyBhcmUgZW5hYmxl
ZCBpbiB0aGUgIWlteDYgY2FzZSBhbnl3YXksCj4gPiA+IGJ1dCB0aGlzIGlzIG5lZWRlZCBvbmx5
IG9uY2Ugc28gZWl0aGVyIHdlIGtlZXAgZW5hYmxpbmcgdGhlIGNsb2NrIGluCj4gPiA+IHRoZSBw
cm9iZSBvciB3ZSBjaGVjayBoZXJlIGlmIHRoZSBjbGsgaGFzIGFscmVhZHkgYmVlbiBlbmFibGVk
IG9yIG5vdC4KPiA+IFRoZSBjbG9ja3MgYXJlIGFscmVhZHkgZW5hYmxlZCAoYW5kIGtlcHQgb24p
IGluIHByb2JlLiBUaGUgaW5pdGlhbCBjYWxsIHRvCj4gPiBjbGtfc2V0X3JhdGUoKSBpcyBqdXN0
IGFib3ZlIHRoaXMgKGJ1dCB0aGUgY2xvY2tzIGFyZSBub3QgZGlzYWJsZWQgYXQgdGhpcwo+ID4g
c3RhZ2UgYXMgYWxsIGdhdGVzIGhhdmUgYmVlbiBlbmFibGVkIGJ5IHRoZSBib290IGxvYWRlciku
Cj4KPiBUaGUgSU8gY2xvY2sgc2hvdWxkIGJlIGVuYWJsZWQgYW5kIHNldCB0byBhIHBhcnRpY3Vs
YXIgcmF0ZSB0aGUgZmlyc3QKPiB0aW1lIHRoZSBkaWUgaXMgc2VsZWN0ZWQgdG8gcGVyZm9ybSBh
IE5BTkQgb3BlcmF0aW9uLCBvciB3aGVuIHdlIHN3aXRjaAo+IGZyb20gb25lIGRldmljZSB0byB0
aGUgb3RoZXIgKHRoaXMgZG9lcyBub3QgYXBwbHkgdG8gdGhlIEdQTUkgZHJpdmVyCj4gZm9yIG5v
dykuIFNvIHdlIGNhbiBkcm9wIHRoZSBlbmFibGUvc2V0X3JhdGUgY2FsbCBpbiB0aGUgcHJvYmUg
aWYgdGhlCj4gYXNzdW1wdGlvbiB0aGF0IHRoaXMgY2xvY2sgb25seSBmZWVkcyB0aGUgZXh0ZXJu
YWwgYnVzIGlzIHJpZ2h0Lgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCgoKLS0gCk1pY2hhZWwgTmF6
emFyZW5vIFRyaW1hcmNoaQpDby1Gb3VuZGVyICYgQ2hpZWYgRXhlY3V0aXZlIE9mZmljZXIKTS4g
KzM5IDM0NyA5MTMgMjE3MAptaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KCkFtYXJ1bGEgU29sdXRpb25zIEJWCkpvb3AgR2Vlc2lu
a3dlZyAxMjUsIDExMTQgQUIsIEFtc3RlcmRhbSwgTkwKVC4gKzMxICgwKTg1IDExMSA5MTcyCmlu
Zm9AYW1hcnVsYXNvbHV0aW9ucy5jb20Kd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
