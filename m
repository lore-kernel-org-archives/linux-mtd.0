Return-Path: <SRS0=kfRK=BG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CC6C433E3
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 17:04:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F22320719
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 17:04:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T1nL/BPF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F22320719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EAAMKgjhqdbyIzrlIS+Zjaq5wFEh2nWSua3WEIMtM+8=; b=T1nL/BPF33oxv2aAz3vaq9skE
	JoNtgl5XFhG0AodeZs8yLsDW31EGkeL7i3UWDxnV0KfN2oyTvEh+qILyK3xxsm8jdbStupI6sRF7z
	7vL0I5q3WqR1+FuXY/nzeTHTbSDxQAz7xag25RabT/CxSd3gZwQWLXOfzIfb4rExq9Ig/XdqZY9Pf
	MCyn41fGqkIDZbmVWfjjfZx/9nQVj8bpN/E/lsSO8RhtPkhvXkIV+EAiFh0evNx2mRXF5HCpp/pLe
	zA3xx4NLoChpoZtY7vaXT2Gar8OtymhjwfYEVZqvSaRJ4WK4ZVa1YpZvFjTgzjLXr3OmTzWu77eAQ
	XEyTLqSMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k06Wr-00047N-Fy; Mon, 27 Jul 2020 17:03:09 +0000
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k06Wp-00046E-Ka
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2020 17:03:08 +0000
Received: by mail-ed1-f65.google.com with SMTP id c15so3030167edj.3
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jul 2020 10:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=m5pStuZGF1Su2qanmiDVuEvfYQ90bm1Risw4vLu52TA=;
 b=hJx23fYhMExueL91f7f/tnBSM4vi9z1jKl5ONf0Vp+FpXcrEnMt3/J4VdSAYjKelFt
 Gf8l4zA2sJnDeC53BND9RAnJ+U469/VIVLah60yPWLf0hq2aBUhQYFj22e3YjZUzFCgx
 utIFX4l+eVbxfr3jJVhbDJR3lJ3ncEmj1Dk3RIraoOgpBIoJOu2kkbUuTHnqusE0SS/k
 8kDpU7OCIaonzUL4I9WhMPAlQUIhk+AOttS2wERf5jismNbborKHGgNckqAq+RCl9E/w
 cSY1HB8dA0QMFvyWFKRTM93aCdTrx7oOEZbtWIkZaFeHCBb0OlNHapWaBRuCHpDQBPuh
 xYFA==
X-Gm-Message-State: AOAM531pqiUQEjreU1AH8V9px8lwtoIQlJLx5Wn96kkBHdfiq98X1OtI
 7+oqEq1l1ftC3tudWE/Z0GcBYeLTdpg=
X-Google-Smtp-Source: ABdhPJzK+jjRoJ65ijtuAY/v3feRZx9jqvfIP6SDKNST7vf2+VBdYCOvHgvl54SbPjeFHmGsL/fa8Q==
X-Received: by 2002:aa7:d2d2:: with SMTP id k18mr21411115edr.16.1595869385368; 
 Mon, 27 Jul 2020 10:03:05 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id
 dc12sm5975430ejb.124.2020.07.27.10.03.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jul 2020 10:03:04 -0700 (PDT)
Date: Mon, 27 Jul 2020 19:03:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: ingenic: Limit MTD_NAND_JZ4780 to
 architecture only
Message-ID: <20200727170302.GA3507@kozik-lap>
References: <CAJKOXPc2w0QHQDEwqoeg9Nm361MszM4LRaCoJD2En-fPgPp+4Q@mail.gmail.com>
 <IBDZDQ.K28R5FAI0BXI2@crapouillou.net>
 <20200724155436.GA7460@kozik-lap>
 <K5Y0EQ.WYAK00ADM46F3@crapouillou.net>
 <CAK8P3a0HDu15u5dREd6gk_e9D6mrZ9JqT0DJs9AeC9C2602nAw@mail.gmail.com>
 <20200726160616.GA2662@kozik-lap>
 <RO33EQ.546WD84D5N7K2@crapouillou.net>
 <20200726161545.GA6058@kozik-lap>
 <B243EQ.VEXGA7ZL5JAE2@crapouillou.net>
 <CAK8P3a1r6AMz2wKBEosAqn7qkuJY4LGFYK7o85sO++d+TSVOgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1r6AMz2wKBEosAqn7qkuJY4LGFYK7o85sO++d+TSVOgQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_130307_744562_9AE29AC2 
X-CRM114-Status: GOOD (  27.27  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdWwgMjcsIDIwMjAgYXQgMDk6NTU6NTRBTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBTdW4sIEp1bCAyNiwgMjAyMCBhdCA2OjIwIFBNIFBhdWwgQ2VyY3VlaWwgPHBh
dWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZToKPiA+IExlIGRpbS4gMjYganVpbC4gMjAyMCDDoCAx
ODoxNSwgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiBhIMOpY3JpdCA6Cj4g
PiA+IE9uIFN1biwgSnVsIDI2LCAyMDIwIGF0IDA2OjEyOjI3UE0gKzAyMDAsIFBhdWwgQ2VyY3Vl
aWwgd3JvdGU6Cj4gPiA+PiAgTGUgZGltLiAyNiBqdWlsLiAyMDIwIMOgIDE4OjA2LCBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IGEgw6ljcml0Cj4gID4KPiA+ID4gT0ssIHRo
YXQncyB0cnVlLiBBbnl3YXksIEkgZG9uJ3QgaGF2ZSBzdHJvbmcgb3BpbmlvbiBvbiBhbnkgb2Yg
dGhpcy4gSQo+ID4gPiBqdXN0IGZvbGxvd2VkIEFybmQncyBoaW50Lgo+ID4gPgo+ID4gPiBGb3Ig
dGhlIG1lbW9yeSBkcml2ZXIgKGFuZCBNVEQgTkFORCBhcyB3ZWxsKSB3aGljaCBvbmUgeW91IHBy
ZWZlcjoKPiA+ID4gMS4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIwMDcyNDA3NDAz
OC41NTk3LTYta3J6a0BrZXJuZWwub3JnLwo+ID4gPiAyLiBkZXBlbmRzIG9uIE1BQ0hfSU5HRU5J
QyB8fCBNSVBTX0dFTkVSSUMgfHwgQ09NUElMRV9URVNUCj4gPiA+Cj4gPiA+ID8KPiA+Cj4gPiBJ
J2Qgc2F5IGEgc2xpZ2h0bHkgbW9kaWZpZWQgIzEuIFRoZSBkcml2ZXIgc2hvdWxkbid0IGJlICJk
ZWZhdWx0IHkiIGluCj4gPiB0aGUgZmlyc3QgcGxhY2UsIHNvIHRoZSBwYXRjaCBjb3VsZCBiZSB0
byBkaXNhYmxlIGl0IGJ5IGRlZmF1bHQuCj4gCj4gSWYgaXQgZGVmYXVsdHMgdG8gJ24nIGV2ZW4g
Zm9yIE1BQ0hfSU5HRU5JQywgeW91IG1heSBoYXZlIHRvIGVuYWJsZQo+IGl0IGluIHRoZSBmb3Vy
IGRlZmNvbmZpZyBmaWxlcyBmb3IgdGhlc2UgbWFjaGluZXMgdG8gYXZvaWQgc3VycHJpc2VzLgoK
RXhhY3RseS4gTm90aGluZyBlbHNlIHNlbGVjdHMgSlo0NzgwX05FTUMsIHNvIGVpdGhlciB3ZSBr
ZWVwIGRlZmF1bHQgeQooImlmIE1BQ0hfSU5HRU5JQyB8fCBNSVBTX0dFTkVSSUMiKSwgb3IgeW91
IHNlbGVjdCBpdCBkaXJlY3RseSBmcm9tCk1BQ0hfSU5HRU5JQy9NSVBTX0dFTkVSSUMuCgpBIHJl
bGF0ZWQgcXVlc3Rpb24gaXMgaG93IGVzc2VudGlhbCBhcmUgdGhlc2UgZHJpdmVycz8gQXQgbGVh
c3QgZm9yIEFSTQpwbGF0Zm9ybXMsIGFsbCBlc3NlbnRpYWwgU29DIGJsb2Nrcy9JUHMgYXJlIHNl
bGVjdGVkIGJ5IGRlZmF1bHQsIGlmCnN1cHBvcnQgZm9yIGNob3NlbiBTb0MgaXMgZW5hYmxlZC4g
T25seSBub24tZXNzZW50aWFsIHN0dWZmIGlzIGxlZnQsCmUuZy4gRFJNLCBjcHVmcmVxLCBkZXZm
cmVxLCBBREMsIGNyeXB0bywgdmlkZW8sIFVTQiwgZU1NQyAoYWx0aG91Z2ggb25lCmNvdWxkIGFy
Z3VlIHRoYXQgaXQgaXMgZXNzZW50aWFsKSwgSU9NTVUuCgo+ID4gQW5kIHdoZW4gdGhlIEluZ2Vu
aWMgY29kZSBpcyBtZXJnZWQgaW50byB0aGUgTUlQUyBnZW5lcmljIGZyYW1ld29yaywgSSdsbAo+
ID4gc2VuZCBhIHNldCBvZiBwYXRjaGVzIHRvIGNoYW5nZSBhbGwgZHJpdmVyIGRlcGVuZGVuY2ll
cyBvbiBNSVBTIHRvCj4gPiBNSVBTX0dFTkVSSUMuCj4gCj4gVGhlIHdheSB3ZSBkbyBpdCBvbiBB
cm0sIHRoZSBtYWNoaW5lIEtjb25maWcgaWRlbnRpZmllcnMgc3RheSBhcm91bmQKPiBldmVuIGZv
ciBtdWx0aXBsYXRmb3JtIHRhcmdldHMgKHdoaWNoIG5vdyBtYWtlIHVwIGJhc2ljYWxseSBhY3Rp
dmVseQo+IG1haW50YWluZWQgbWFjaGluZXMpLgo+IAo+IEkgZG9uJ3QgdGhpbmsgaXQgbWFrZXMg
YW55IHNlbnNlIGZvciBhIGRyaXZlciB0byBkZXBlbmQgb24gTUlQU19HRU5FUklDOgo+IGVpdGhl
ciBpdCBpcyBhIGdlbmVyaWMgZHJpdmVyIHRoYXQgc2hvdWxkIGFsd2F5cyBiZSB2aXNpYmxlIG9y
IGl0IGlzIHNwZWNpZmljCj4gdG8gYSBzZXQgb2YgU29DcyBhbmQgc2hvdWxkIGRlcGVuZCBvbiBz
b21lIGNvcnJlc3BvbmRpbmcgdmVuZG9yCj4gc3BlY2lmaWMgaWRlbnRpZmllcnMuCgpJZiBzdXBw
b3J0IGZvciBJbmdlbmljIGlzIHByb3ZpZGVkIGFsc28gYnkgTUlQU19HRU5FUklDICh3aXRob3V0
CnNlbGVjdGluZyBNQUNIX0lOR0VOSUMpLCB0aGVuIGl0IG1ha2VzIHNlbnNlLiBUaGlzIHdvdWxk
IGJlIGp1c3QgYQpkaWZmZXJlbnQgd2F5IHRoYW4gQVJNIG9mIGJ1aWxkaW5nIG11bHRpLXBsYXRm
b3JtIGtlcm5lbC4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
