Return-Path: <SRS0=JUqn=BF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178B8C433E1
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jul 2020 16:07:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8CD7206D8
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jul 2020 16:07:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m5GEC1z3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8CD7206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VPloy7bHAhlrD8byiGdLV5N73P1OiFzaxT9/Y5fTkPo=; b=m5GEC1z3JN7aPrmLhjur40Miy
	eNgbxvEmxxEwQvHyHKrtJY1I4Ym+XgQwQNUy5QQFgtjTpikLI7XoIK6k97w3LmNKNEFiJ4ePQ8LlO
	lKGRV+29bEG2YCR84y8RbKRh1wW4u2VGqkSGAQJ279SWGDho//KfIMrOtc1kDHGaiuL1H+kSfixcz
	KKvO+VXXKOTowBz8wfV60uV6puqFvCgpszji/SuRTABHTpvObd301OPaAcyMXLhtXKkBMqkGk/rHT
	aO3clPomdpe/UtVGUxFBG0hMq8OjpgUn9waoyrMYVgkrKBQevFdGW6ubMDyPIlQFfoXmiMtVzsDQX
	7eD3kOnmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzjAP-0004df-BU; Sun, 26 Jul 2020 16:06:25 +0000
Received: from mail-ed1-f67.google.com ([209.85.208.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzjAN-0004bl-0z
 for linux-mtd@lists.infradead.org; Sun, 26 Jul 2020 16:06:23 +0000
Received: by mail-ed1-f67.google.com with SMTP id by13so10341645edb.11
 for <linux-mtd@lists.infradead.org>; Sun, 26 Jul 2020 09:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=HVDed5GzTM+SeS9A/Yc6EBjUf1WiDYt+EY8Pko2sA2k=;
 b=LzXRjYbwtmMuhknCyh7Y1XgHwbJsUqurQ+GqwQwiMnPN+Scbj3xjvVI7zQmEGkQGC3
 +4HfGgura9V3uWUQVZCJ6vj+l1JrIEIfAzlyEBZxxk27hcfYwJzOZFI2+nyu3DQYgDjI
 HI5HrBBtSYsyVYs+OGIxsR5zSsTZfMi0W0Q/b+CikY+f5NYYKN9pWTe+ZqNPrRJ/NNF0
 d1DZc6stGPvWfbE04NjMGKoj4AKzQny5Xj1KCLpyLkQdwGnY/o45PQO41ZYtrRbpkKHF
 qZN9hSzFssXBOvx79ASDKiLE7uqJBwtLHuzCW93jMilC64H16s25fHePD3cbJtdot1dF
 fepA==
X-Gm-Message-State: AOAM531umYs2QoEZefiUucqDK6ob4UkBaUf6GQkoZn/YawrWX5IjBRyb
 BRO/bgHnQljN+tNZ/h42aec=
X-Google-Smtp-Source: ABdhPJyLPyzKwOXAsWWyhP51C8gBvqiTT4WGC2guizxtQvvG0OGK4bGBtl2FjRWkQqAcoQwV1gtvvw==
X-Received: by 2002:aa7:d8cf:: with SMTP id k15mr17211563eds.250.1595779579782; 
 Sun, 26 Jul 2020 09:06:19 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id sd8sm3385328ejb.58.2020.07.26.09.06.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 26 Jul 2020 09:06:18 -0700 (PDT)
Date: Sun, 26 Jul 2020 18:06:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: ingenic: Limit MTD_NAND_JZ4780 to
 architecture only
Message-ID: <20200726160616.GA2662@kozik-lap>
References: <20200724145401.2566-1-krzk@kernel.org>
 <20200724145401.2566-3-krzk@kernel.org>
 <PWBZDQ.D1XCW6N2YMRA@crapouillou.net>
 <CAJKOXPc2w0QHQDEwqoeg9Nm361MszM4LRaCoJD2En-fPgPp+4Q@mail.gmail.com>
 <IBDZDQ.K28R5FAI0BXI2@crapouillou.net>
 <20200724155436.GA7460@kozik-lap>
 <K5Y0EQ.WYAK00ADM46F3@crapouillou.net>
 <CAK8P3a0HDu15u5dREd6gk_e9D6mrZ9JqT0DJs9AeC9C2602nAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0HDu15u5dREd6gk_e9D6mrZ9JqT0DJs9AeC9C2602nAw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200726_120623_100836_99C636A0 
X-CRM114-Status: GOOD (  22.44  )
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

T24gU2F0LCBKdWwgMjUsIDIwMjAgYXQgMDg6MzA6NTZQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBTYXQsIEp1bCAyNSwgMjAyMCBhdCAyOjE3IFBNIFBhdWwgQ2VyY3VlaWwgPHBh
dWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZToKPiA+IExlIHZlbi4gMjQganVpbC4gMjAyMCDDoCAx
Nzo1NCwgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiBhCj4gPiDDqWNyaXQg
Ogo+ID4gPiBPbiBGcmksIEp1bCAyNCwgMjAyMCBhdCAwNTo1MDowNlBNICswMjAwLCBQYXVsIENl
cmN1ZWlsIHdyb3RlOgo+ID4gPj4gIExlIHZlbi4gMjQganVpbC4gMjAyMCDDoCAxNzozMywgS3J6
eXN6dG9mIEtvemxvd3NraQo+ID4gPj4gPGtyemtAa2VybmVsLm9yZz4gYSDDqWNyaXQ6Cj4gPiA+
PiAgPiBPbiBGcmksIDI0IEp1bCAyMDIwIGF0IDE3OjE5LCBQYXVsIENlcmN1ZWlsIDxwYXVsQGNy
YXBvdWlsbG91Lm5ldD4KPiA+ID4+ICA+IHdyb3RlOgo+ID4gPj4KPiA+ID4+ICBPbiBNSVBTLCB0
aGUgU29DIHNlbGVjdGlvbiBpcyBhIEtjb25maWcgImNob2ljZSIsIHNvIHlvdSBjYW4gb25seQo+
ID4gPj4gc3VwcG9ydAo+ID4gPj4gIG9uZSBTb0MgZmFtaWx5LCB1bmZvcnR1bmF0ZWx5Lgo+ID4g
Pgo+ID4gPiBMZXQncyBzYXkgc29tZW9uZSBzZWxlY3RlZCB0aGVuIHNvbWUgb3RoZXIgYXJjaGl0
ZWN0dXJlCj4gPiA+IChNSVBTX0FMQ0hFTVkpLgo+ID4gPiBUaGV5IGNvdWxkIHNlbGVjdCB0aGlz
IE1URCBkcml2ZXIuCj4gPiA+Cj4gPiA+IERvZXMgaXQgbWVhbiB0aGV5IHdvdWxkIGJlIGFibGUg
dG8gcnVuIGl0IG9uIEluZ2VuaWMgaGFyZHdhcmU/Cj4gPgo+ID4gSW4gKnRoZW9yeSogeWVzLCBh
cyBsb25nIGFzIHRoZSBLY29uZmlnIG9wdGlvbnMgdGhhdCBNQUNIX0lOR0VOSUMKPiA+IHNlbGVj
dHMgYXJlIGVuYWJsZWQsIHRoZSBrZXJuZWwgc2hvdWxkIGJvb3QgYW5kIHdvcmsgb24gSW5nZW5p
YyBTb0NzLgo+IAo+IFJpZ2h0IG5vdywgdGhpcyB3b24ndCB3b3JrIHlldCwgYmVjYXVzZSB0aGVy
ZSBhcmUgcGxhdGZvcm0gc3BlY2lmaWMKPiBmdW5jdGlvbnMgdGhhdCBhcmUgaW1wbGVtZW50ZWQg
YnkgZWFjaCBvZiB0aGUgcGxhdGZvcm1zIGluIGFyY2gvbWlwcywKPiBlLmcuIGFyY2gvbWlwcy9n
ZW5lcmljL2luaXQuYyBhbmQgYXJjaC9taXBzL2p6NDc0MC9zZXR1cC5jLgoKSSB3b3VsZCBzYXkg
ZXZlbiBtb3JlIC0gbm8gRFRTIHdvdWxkIGJlIHByb3ZpZGVkIGZvciBzdWNoIGNvbmZpZ3VyYXRp
b24uCkFsbCBJbmdlbmljIERUU2VzIGFyZSBpbmNsdWRlZCBvbmx5IHdpdGggTUFDSF9JTkdFTklD
LiAgWW91IGNhbm5vdCBidWlsZAphIGtlcm5lbCB3b3JraW5nIG9uIEluZ2VuaWMgd2l0aG91dCBN
QUNIX0lOR0VOSUMuIEV2ZW4gaW4gdGhlb3J5LgoKPiAKPiBBIGxvdCBvZiB0aGUgbmV3ZXIgcGxh
dGZvcm1zIGFyZSBwYXJ0IG9mIGFyY2gvbWlwcy9nZW5lcmljCj4gKENPTkZJR19NSVBTX0dFTkVS
SUMpLCB3aGljaCByb3VnaGx5IGNvcnJlc3BvbmRzIHRvCj4gQ09ORklHX0FSQ0hfTVVMVElQTEFU
Rk9STSBvbiBpbiBhcmNoL2FybS8uCj4gU2ltaWxhcmx5LCB0aGVyZSBhcmUgaGVhZGVyIGZpbGVz
IGluIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9tYWNoLSovCj4gdGhhdCBjb25mbGljdCBhbmQgeW91
IG5lZWQgdG8gaGF2ZSB0aGUgcmlnaHQgb25lLgo+IAo+IFRvIGhhdmUgbW9yZSB0aGFuIG9uZSBw
bGF0Zm9ybSBlbmFibGVkLCBlYWNoIG9uZSBuZWVkcyB0bwo+IGhhdmUgYWxsIG9mIHRoYXQgcGxh
dGZvcm0gY29kZSBjb252ZXJ0ZWQgdG8gZml0IGludG8gdGhlCj4gTUlQU19HRU5FUklDIGZyYW1l
d29yay4gVGhpcyBjYW4gYmUgYSBsb3Qgb2Ygd29yaywgYnV0Cj4gSSBzdXBwb3NlIHRoZSBpbmdl
bmljIHBsYXRmb3JtIHdvdWxkIGJlIGEgY2FuZGlkYXRlIGZvcgo+IHdoaWNoIHRoaXMgbWFrZXMg
c2Vuc2UsIGFzIGxvbmcgYXMgbmV3IFNvQ3Mgb2YgdGhhdCBmYW1pbHkKPiBzdGlsbCBjb21lIG91
dC4KCkkgY2FuIHRoZXJlZm9yZSBjaGFuZ2UgdGhlIHBhdGNoIHRvOgpkZXBlbmRzIG9uIE1BQ0hf
SU5HRU5JQyB8fCBNSVBTX0dFTkVSSUMgfHwgQ09NUElMRV9URVNUCgpPdGhlciBzb2x1dGlvbiBp
cyB0byBsZWF2ZSBNVEQgZHJpdmVyIGFzIGlzIGFuZCBmb3IgdGhlIG1lbW9yeSBkcml2ZXIgZ28K
d2l0aCBteSB2MiBhcHByb2FjaDoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIwMDcy
NDA3NDAzOC41NTk3LTYta3J6a0BrZXJuZWwub3JnLwoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
