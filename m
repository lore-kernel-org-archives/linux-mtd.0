Return-Path: <SRS0=dwkY=DE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FFAC4346E
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Sep 2020 19:28:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 638FF206E5
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Sep 2020 19:28:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="txxaZmKr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ns3AfKL+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 638FF206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pWrNskJUO5zff0XJdtYsB2jozans+1P8wMlcTWr3WUk=; b=txxaZmKrmWt4+blfFE10xOsdy
	RTGFua242U5eyAHXCIXxyJyS2zo9h+o4muAiSPGKJQRMB33UTZlDULbT4WyuG3uB6NlvIC4ZRrrax
	RnypLREcEeaUxDSuQREeD841OpV71dAYbI+4x6WwQitu/zP/ZP8oy0vU1P+s4i4PQxatwBhDccpOn
	F74FG1bGcWrBWf5FkYiwLlRt1QIjYL9qWbloqSqqpxlFJh57Uwuca816gSkM0ihrhqqfnZuDHCgBs
	TxFwruFK3P/bChTtx3e3SisEA3vRJPHeWGBU4y/8fgGUKElhah15XVNfYYiNRq+g90j+1+fjzIzPf
	D+CCACD3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMcKZ-0005o8-Pj; Sun, 27 Sep 2020 19:27:31 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMcKX-0005nd-9V
 for linux-mtd@lists.infradead.org; Sun, 27 Sep 2020 19:27:30 +0000
Received: by mail-qt1-x842.google.com with SMTP id c18so6606488qtw.5
 for <linux-mtd@lists.infradead.org>; Sun, 27 Sep 2020 12:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=47MgKbYIVqx4UD+cJRi+AQC7Ggswyr+9dvjpk8Mh5p4=;
 b=Ns3AfKL+lKW03tXo8P4wVM/Nuv13d10CaGwukqWmxD+GLWzbUxKxLqs9SScAr4UQAJ
 24cHzHZX3R3nb6MRKdiqyAa+E4kbO0KooMgiMRj+zqlMRi8SsTPFkEeO3Ljq2NdiThly
 0kv3NRwSycUgNXPqPwgK0mAPeKwuotQ/uWYGnqGXXHarBiQ41NRY07pkh9LHhW2ZoDL9
 JYNHU4/7ydgafbjyrcjQJ6K+XWaSkkrufsFOU8/IBiI5DhRAflKJZQw8UqPrfMN0lem5
 /2APubm13TbTZmNnZzV0SlRupdM15tg9nsOqtr6mMjmr5yOtSWtNJk6R+o97sjrPRZ6N
 974g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=47MgKbYIVqx4UD+cJRi+AQC7Ggswyr+9dvjpk8Mh5p4=;
 b=aFihmNVYYaN9U9TvQuD8vExEKPYzt3TsazlrEOGgitkuzxm7jo7vpRrjd7MfInhLZV
 oYY4rmQvURAVDv+qtp/SnxySkUccVnIQ8XK6c01yy1AENbDj7t/kffgwcEwaw9SK8Cjq
 YOENoK7sk4V2ewZDy8I66iUQGu9WlDh/uek7Vow0jVy1Ve3dVzJYBBc6W8tRGYOBXjDO
 Y+88dipI9Sn89h252oUY41DLDB977Ct354pa2U8q/jAjWhLctHm3UORiIyHsnFh8Q8Wy
 YyVcdglff4ieuRWsOcmG1qjhLy6PuHD+PDCXsQj9emmhLmax48qT4JWR+nmomKCEUynI
 hdXg==
X-Gm-Message-State: AOAM533SOWSNtfy2lDb2tcIGS8vMK9tgCS8V6ZO8RsgAzi7qvNrk1pdu
 YCZU8zusY58UdRPG6aWzNefwr45CzZR3EkhR4uA=
X-Google-Smtp-Source: ABdhPJwVNWuj2qfhBjOYMHWDNfSCT7/WkmeZhOD6barJe2S6Bt2t+9EDEIAcRg+ZFM1j89AjI948grGDNr0Ob2bnyUg=
X-Received: by 2002:ac8:2ac4:: with SMTP id c4mr9421871qta.78.1601234846183;
 Sun, 27 Sep 2020 12:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <CADBnMviQd-9TbkJFUCWE8THCYF9oq-iZfu6Cjxcy9GvTfe=KUg@mail.gmail.com>
 <CAFLxGvw9TMHz5Mf=RYytB3N6uMuK5md+WxF=atzvaXcuibmNsg@mail.gmail.com>
 <CADBnMvjuS4F8CLwbGRTAt3bVyA7DAwEFwMmNqRdNJyZCRpXCXw@mail.gmail.com>
 <CAFLxGvxF_mK573Xhc0w2njjf4qRPSTiMf9B_GRBnJo1kj1MbkQ@mail.gmail.com>
 <CAFLxGvyHWFmLTYmyqmJo9Rfm87D_ZafBWyQSMvdYKLFTUM9p+Q@mail.gmail.com>
 <CADBnMvhcowEVqUYwg3vVK-F-=N+mRNQAsaihXuUorW-iWnWcxg@mail.gmail.com>
 <1929983185.113286.1600681896280.JavaMail.zimbra@nod.at>
 <CADBnMvhKxZSjyzhYxu3FUjZ0KtSDUdfiyEWBnNYP8ireCpkX8Q@mail.gmail.com>
In-Reply-To: <CADBnMvhKxZSjyzhYxu3FUjZ0KtSDUdfiyEWBnNYP8ireCpkX8Q@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 27 Sep 2020 21:27:14 +0200
Message-ID: <CAFLxGvwSUx_JBbvbJjoeyVaH31mMoyTLGm8oGRi75agG0sG30Q@mail.gmail.com>
Subject: Re: UBIFS-AUTH panic after reboot
To: Kristof Havasi <havasiefr@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_152729_341006_050405AF 
X-CRM114-Status: GOOD (  24.99  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBTZXAgMjEsIDIwMjAgYXQgMTI6NDYgUE0gS3Jpc3RvZiBIYXZhc2kgPGhhdmFzaWVm
ckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAyMSBTZXAgMjAyMCBhdCAxMTo1MSwgUmlj
aGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGU6Cj4gPgo+ID4gLS0tLS0gVXJz
cHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+ID4gPj4gPiBEb2VzIHRoZSBwcm9ibGVtIGFsc28gdHJp
Z2dlciB3aXRoIGVuY3J5cHRpb24gZGlzYWJsZWQ/IFNvIGp1c3Qgd2l0aAo+ID4gPj4gPiBhdXRo
ZW50aWNhdGlvbj8KPiA+ID4gSSBjb3VsZG4ndCB0cmlnZ2VyIHRoZSBzYW1lIGVycm9yIHdpdGgg
ZW5jcnlwdGlvbiBkaXNhYmxlZCBhbmQgYXV0aGVudGljYXRpb24KPiA+ID4gZW5hYmxlZC4gRXZl
biBpZiBJIGVuYWJsZWQgYWxsIHRoZSBjaGtfKiBrbm9icyB1bmRlciBrZXJuZWwvZGVidWcvdWJp
ZnMvLCBubwo+ID4gPiBmYWlsZWQgYXNzZXJ0aW9uIG9yIGVycm9yL3dhcm5pbmcgbG9nIGNvdWxk
IGJlIG9ic2VydmVkLgo+ID4KPiA+IFNvLCB3aXRoIGVpdGhlciBlbmNyeXB0aW9uIG9yIGF1dGhl
bnRpY2F0aW9uIGVuYWJsZWQgZXZlcnl0aGluZyBpcyBmaW5lCj4gPiBidXQgd2hlbiBib3RoIGFy
ZSBlbmFibGVkIHlvdSBoaXQgdGhlIHByb2JsZW0/Cj4gPiBJbnRlcmVzdGluZy4KPgo+IFRoYXQg
aXMgZXhhY3RseSB3aGF0IEkgY2FuIG9ic2VydmUuCj4KPiA+Cj4gPiA+PiBEb2VzIGl0IHByaW50
IGJpZyBMUFQgb3Igc21hbGwgTFBUIG1vZGVsPwo+ID4gPgo+ID4gPiBzbWFsbCBMUFQgbW9kZWwu
Cj4gPgo+ID4gSSdsbCB0cnkgdG8gcmVwcm9kdWNlIG5vdyBvbiBhIHNpbWlsYXIgc2l6ZWQgTkFO
RC4gOi0pCj4KPiBJIG1lbnRpb25lZCB0aGF0IEkgdXNlIHRoZSBidWlsZHJvb3QncyBta2ZzLnVi
aWZzIHdpdGggY3VzdG9taXphdGlvbiwKPiBidXQgaGVyZSBhcmUgdGhlIHBhcmFtZXRlcnM6Cj4g
KENvbmZpZ3VyZWQgdmlhIEtjb25maWcpCj4KPiAtLW1heC1sZWItY250PTM5NjgKPiAtLW1pbi1p
by1zaXplPTB4MTAwMAo+IC0tbGViLXNpemU9MHgzRTAwMAo+IC0ta2V5IC9wYXRoL3RvL2tleQo+
IC0ta2V5LWRlc2NyaXB0b3IgZGVhZDEyMzQ1Njc4YmVlZgo+IC0tY2lwaGVyIEFFUy0yNTYtWFRT
Cj4gLS1oYXNoLWFsZ28gc2hhMjU2Cj4gLS1hdXRoLWtleT0icGtjczExOnRva2VuPS4uLiIKPgo+
IFRoZSBmbGFzaCBpcyBhIE1pY3JvbiBNVDI5RjhHMDhBQkFDQVdQLUlUOkMgd2hpY2ggaGFzIDIy
NCBieXRlcyBPT0IsCj4gd2hpY2ggaXMgbm90Cj4gaW5jbHVkZWQgaW4gdGhlIC0tbWluLWlvLXNp
emUuIFRoYXQgaXMgb2ssIGlzbid0PwoKWWVzLiBCb3RoIFVCSSBhbmQgVUJJRlMgZG9uJ3QgdXNl
IE9PQi4KCkkgdGhpbmsgSSd2ZSBmb3VuZCB0aGUgcHJvYmxlbS4gQ2FuIHlvdSBwbGVhc2UgdGVz
dCB0aGUgZm9sbG93aW5nIGNoYW5nZT8KCmRpZmYgLS1naXQgYS9mcy91Ymlmcy9qb3VybmFsLmMg
Yi9mcy91Ymlmcy9qb3VybmFsLmMKaW5kZXggNGE1YjA2ZjhkODEyLi44NjllZjZlZmE0OGYgMTAw
NjQ0Ci0tLSBhL2ZzL3ViaWZzL2pvdXJuYWwuYworKysgYi9mcy91Ymlmcy9qb3VybmFsLmMKQEAg
LTkzNiw4ICs5MzYsNiBAQCBpbnQgdWJpZnNfam5sX3dyaXRlX2lub2RlKHN0cnVjdCB1Ymlmc19p
bmZvICpjLApjb25zdCBzdHJ1Y3QgaW5vZGUgKmlub2RlKQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBpbm9kZS0+aV9pbm8pOwogICAgICAgIHJlbGVhc2VfaGVhZChj
LCBCQVNFSEQpOwoKLSAgICAgICB1Ymlmc19hZGRfYXV0aF9kaXJ0KGMsIGxudW0pOwotCiAgICAg
ICAgaWYgKGxhc3RfcmVmZXJlbmNlKSB7CiAgICAgICAgICAgICAgICBlcnIgPSB1Ymlmc190bmNf
cmVtb3ZlX2lubyhjLCBpbm9kZS0+aV9pbm8pOwogICAgICAgICAgICAgICAgaWYgKGVycikKQEAg
LTk0Nyw2ICs5NDUsOCBAQCBpbnQgdWJpZnNfam5sX3dyaXRlX2lub2RlKHN0cnVjdCB1Ymlmc19p
bmZvICpjLApjb25zdCBzdHJ1Y3QgaW5vZGUgKmlub2RlKQogICAgICAgIH0gZWxzZSB7CiAgICAg
ICAgICAgICAgICB1bmlvbiB1Ymlmc19rZXkga2V5OwoKKyAgICAgICAgICAgICAgIHViaWZzX2Fk
ZF9hdXRoX2RpcnQoYywgbG51bSk7CisKICAgICAgICAgICAgICAgIGlub19rZXlfaW5pdChjLCAm
a2V5LCBpbm9kZS0+aV9pbm8pOwogICAgICAgICAgICAgICAgZXJyID0gdWJpZnNfdG5jX2FkZChj
LCAma2V5LCBsbnVtLCBvZmZzLCBpbGVuLCBoYXNoKTsKICAgICAgICB9CgpBIGZldyBsaW5lcyBi
ZWZvcmUgaW4gdGhlIHdlIGxhc3RfcmVmZXJlbmNlIGNhbGwgdWJpZnNfYWRkX2RpcnQoYywKbG51
bSwgd3JpdGVfbGVuKSBhbmQgd3JpdGVfbGVuIGNvbnRhaW5zCmFscmVhZHkgdGhlIGF1dGggbm9k
ZSBzaXplLiBTbyB0aGUgYXV0aCBub2RlIHNpemUgaXMgYWNjb3VudGVkIHR3aWNlLgpQbGVhc2Ug
bGV0IG1lIGtub3cgd2hldGhlciBpdCBoZWxwcywgSSB0aGluayB1Ymlmc19qbmxfd3JpdGVfaW5v
ZGUoKQpuZWVkcyBtb3JlIGNsZWFudXAuCgotLSAKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
