Return-Path: <SRS0=DDtA=BE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB4DC433E1
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Jul 2020 18:32:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85F4F206D7
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Jul 2020 18:32:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="llKU7n/i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85F4F206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p8SQ2CQV1Iz5XKhYkbrd2tzDylOIJ48N/gpNfnKnClw=; b=llKU7n/iSaxTJkVq9sTNzT3pY
	mvbWvpYwWkk+DAzqFuUxsJkyQLRA1r+15QbMofZMDL60YiIgfdcikgZKH41JzoXlQYhM0YYDPnAJH
	gIcHLKjg5cF/aTk+S3EpjJtjxrFoHMSwKKPDNmZh+zw11BKRzfoh1Ryxovq1stPnZWGQU9eWMILwC
	8xMpsFOONnvOkVg8M6YAswYZX2JK9LH3vxHS+wK8Q6WA7M1TOHIJkX0d0vXuGCEioLLhCGto+OGpA
	AmYfGZKqkX1Sa0f6Pv4J6PsYavDOpXq9Fok6h8one/RQoXs1wbGYMHKtQVfIp+cfnzRjQmGSa1rcx
	JI95b2Xow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzOx7-0002kP-Lp; Sat, 25 Jul 2020 18:31:21 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzOx4-0002iK-RR
 for linux-mtd@lists.infradead.org; Sat, 25 Jul 2020 18:31:19 +0000
Received: from mail-qt1-f176.google.com ([209.85.160.176]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M6m1g-1jsEDE22wQ-008Ig8 for <linux-mtd@lists.infradead.org>; Sat, 25 Jul
 2020 20:31:14 +0200
Received: by mail-qt1-f176.google.com with SMTP id w9so9351596qts.6
 for <linux-mtd@lists.infradead.org>; Sat, 25 Jul 2020 11:31:14 -0700 (PDT)
X-Gm-Message-State: AOAM531rN8cTw7nT50pMairRfBcpTxd2yHJ9eGjtvdCkhLa5/wQkcN40
 sShTvZw0SlLZD7jXsqomrgXLLx2Mje0sHeGfbME=
X-Google-Smtp-Source: ABdhPJzHTyApat0bw84tF3h2Af+bo13zlqQHPFO7nlxTyX9nNY7CCrPypsrX45LFfU24UHEra8Rxd1j0sNISFQyNMFw=
X-Received: by 2002:ac8:5195:: with SMTP id c21mr454635qtn.304.1595701873366; 
 Sat, 25 Jul 2020 11:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200724145401.2566-1-krzk@kernel.org>
 <20200724145401.2566-3-krzk@kernel.org>
 <PWBZDQ.D1XCW6N2YMRA@crapouillou.net>
 <CAJKOXPc2w0QHQDEwqoeg9Nm361MszM4LRaCoJD2En-fPgPp+4Q@mail.gmail.com>
 <IBDZDQ.K28R5FAI0BXI2@crapouillou.net> <20200724155436.GA7460@kozik-lap>
 <K5Y0EQ.WYAK00ADM46F3@crapouillou.net>
In-Reply-To: <K5Y0EQ.WYAK00ADM46F3@crapouillou.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 25 Jul 2020 20:30:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0HDu15u5dREd6gk_e9D6mrZ9JqT0DJs9AeC9C2602nAw@mail.gmail.com>
Message-ID: <CAK8P3a0HDu15u5dREd6gk_e9D6mrZ9JqT0DJs9AeC9C2602nAw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: ingenic: Limit MTD_NAND_JZ4780 to
 architecture only
To: Paul Cercueil <paul@crapouillou.net>
X-Provags-ID: V03:K1:VNA3od5dZuWu2+SX8URfsb5XyLJqdeQB14AqPRuXzrS96w4lOPn
 nkgliXWoHeZJxFztZcM1rsrILgXEmdH9YcMe+VjRzEcnAsFeb6G2uviavTQHL6Sc7nLmORa
 csOQipk60ocu8O/aZzoaeoSBfG0KGZwsLEyxhs4F7lzGuICboAoqct5C9O8OHV4+9WgNTy2
 BU3EcBrzCbeRCi9/XXpAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:F86ipqGfF6Y=:iZ5W2oTAtloSc3QJS4ytCd
 5m0vS5deK5iFDYzsXH7Q0a37YTrt3GEMW6BbLA8fEEUPFW1UPyfLPbYQyvtL/BuJv7lQFVuSs
 S9C4YS/uUNuhQ3wbMHG44/Zmw293rbg8pVmOwIjgGSgE0QWkzMCKlB1is998Bc72uoyAkMw+h
 tS2zQToJrjrcBWqZ9u/aR8Km8W0cwh7Cv3ukLvSR11AukNONQP1xMSL5KSU7Ej+nib3/I8CXH
 DLjiq5V7IrGnoKIbp5xSk2tkDZBariWxXhTIWzpl8vxk/5qIzvE8WCd44lmAmA+v2SZsL0NDR
 Uq8hMIDMHeCP9lB8efxpwKeO1LQ84wqQlnr61hLPW3tdvJx8suRFKyg89SdOMbS7brE14fKZ6
 WV6cz+9SCF4IGKf0pPY3Lgt657PYOSxeTwBMfRd+8EJ+9ANd16zxzVR1XiUCmamNr5edZBB/j
 lN530Q4qVL7S0Mc1r9nfY+/QwOuQ5c5FHW8i2iwIYrvuteZ4ZdFcBHknGFUB1urqBNwjBrrQ0
 ge1N+sUCDxt3giqBireKMCJ6LWPqK5Pmpgf2uP+n9DmYMLJjlPj8ofEZJPZGvzsa1qv+hHDCg
 oGom81h9NTyzztK9t7oBr5DmM5bzBTlC2tBaf63o9yszbhxGITZ57mxO6a0fzAT9RTHrjXJAk
 armayGR1W7Qlui4x55dBMqVzax+hi4FelZJDHtxF+25nnNbpd8f4PVWlO2bbLnr353ItTm1Eq
 ChP1atviSABVtqqwzE2lUhyPvkvmvsUTqpELm3v9wy43T+lhCJJ8r6U1O5n6mkqCTa7YcK4aa
 5fL0ny0v77p5TGvjSvnetisqX3+S/w8JQsxONH9D7FycVShA6kplLx617icIqlSIr1nXDZc45
 zVbDmL11uYsyyi9n7ajK91WJIa4V1HZKn2QR5gUlptQel7VOCUXzm9kyL4U3uVjgKmc5pXpnz
 X1aojPjyIBg3dzijMQU1CFopvJCC7lPdJkVOeMwcKQaIFNuvuMiVs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_143119_110746_51D8901A 
X-CRM114-Status: GOOD (  17.97  )
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
 Krzysztof Kozlowski <krzk@kernel.org>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBKdWwgMjUsIDIwMjAgYXQgMjoxNyBQTSBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBv
dWlsbG91Lm5ldD4gd3JvdGU6Cj4gTGUgdmVuLiAyNCBqdWlsLiAyMDIwIMOgIDE3OjU0LCBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IGEKPiDDqWNyaXQgOgo+ID4gT24gRnJp
LCBKdWwgMjQsIDIwMjAgYXQgMDU6NTA6MDZQTSArMDIwMCwgUGF1bCBDZXJjdWVpbCB3cm90ZToK
PiA+PiAgTGUgdmVuLiAyNCBqdWlsLiAyMDIwIMOgIDE3OjMzLCBLcnp5c3p0b2YgS296bG93c2tp
Cj4gPj4gPGtyemtAa2VybmVsLm9yZz4gYSDDqWNyaXQ6Cj4gPj4gID4gT24gRnJpLCAyNCBKdWwg
MjAyMCBhdCAxNzoxOSwgUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gPj4g
ID4gd3JvdGU6Cj4gPj4KPiA+PiAgT24gTUlQUywgdGhlIFNvQyBzZWxlY3Rpb24gaXMgYSBLY29u
ZmlnICJjaG9pY2UiLCBzbyB5b3UgY2FuIG9ubHkKPiA+PiBzdXBwb3J0Cj4gPj4gIG9uZSBTb0Mg
ZmFtaWx5LCB1bmZvcnR1bmF0ZWx5Lgo+ID4KPiA+IExldCdzIHNheSBzb21lb25lIHNlbGVjdGVk
IHRoZW4gc29tZSBvdGhlciBhcmNoaXRlY3R1cmUKPiA+IChNSVBTX0FMQ0hFTVkpLgo+ID4gVGhl
eSBjb3VsZCBzZWxlY3QgdGhpcyBNVEQgZHJpdmVyLgo+ID4KPiA+IERvZXMgaXQgbWVhbiB0aGV5
IHdvdWxkIGJlIGFibGUgdG8gcnVuIGl0IG9uIEluZ2VuaWMgaGFyZHdhcmU/Cj4KPiBJbiAqdGhl
b3J5KiB5ZXMsIGFzIGxvbmcgYXMgdGhlIEtjb25maWcgb3B0aW9ucyB0aGF0IE1BQ0hfSU5HRU5J
Qwo+IHNlbGVjdHMgYXJlIGVuYWJsZWQsIHRoZSBrZXJuZWwgc2hvdWxkIGJvb3QgYW5kIHdvcmsg
b24gSW5nZW5pYyBTb0NzLgoKUmlnaHQgbm93LCB0aGlzIHdvbid0IHdvcmsgeWV0LCBiZWNhdXNl
IHRoZXJlIGFyZSBwbGF0Zm9ybSBzcGVjaWZpYwpmdW5jdGlvbnMgdGhhdCBhcmUgaW1wbGVtZW50
ZWQgYnkgZWFjaCBvZiB0aGUgcGxhdGZvcm1zIGluIGFyY2gvbWlwcywKZS5nLiBhcmNoL21pcHMv
Z2VuZXJpYy9pbml0LmMgYW5kIGFyY2gvbWlwcy9qejQ3NDAvc2V0dXAuYy4KCkEgbG90IG9mIHRo
ZSBuZXdlciBwbGF0Zm9ybXMgYXJlIHBhcnQgb2YgYXJjaC9taXBzL2dlbmVyaWMKKENPTkZJR19N
SVBTX0dFTkVSSUMpLCB3aGljaCByb3VnaGx5IGNvcnJlc3BvbmRzIHRvCkNPTkZJR19BUkNIX01V
TFRJUExBVEZPUk0gb24gaW4gYXJjaC9hcm0vLgpTaW1pbGFybHksIHRoZXJlIGFyZSBoZWFkZXIg
ZmlsZXMgaW4gYXJjaC9taXBzL2luY2x1ZGUvYXNtL21hY2gtKi8KdGhhdCBjb25mbGljdCBhbmQg
eW91IG5lZWQgdG8gaGF2ZSB0aGUgcmlnaHQgb25lLgoKVG8gaGF2ZSBtb3JlIHRoYW4gb25lIHBs
YXRmb3JtIGVuYWJsZWQsIGVhY2ggb25lIG5lZWRzIHRvCmhhdmUgYWxsIG9mIHRoYXQgcGxhdGZv
cm0gY29kZSBjb252ZXJ0ZWQgdG8gZml0IGludG8gdGhlCk1JUFNfR0VORVJJQyBmcmFtZXdvcmsu
IFRoaXMgY2FuIGJlIGEgbG90IG9mIHdvcmssIGJ1dApJIHN1cHBvc2UgdGhlIGluZ2VuaWMgcGxh
dGZvcm0gd291bGQgYmUgYSBjYW5kaWRhdGUgZm9yCndoaWNoIHRoaXMgbWFrZXMgc2Vuc2UsIGFz
IGxvbmcgYXMgbmV3IFNvQ3Mgb2YgdGhhdCBmYW1pbHkKc3RpbGwgY29tZSBvdXQuCgogICAgICAg
QXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
