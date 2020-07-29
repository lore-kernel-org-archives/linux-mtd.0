Return-Path: <SRS0=wlsi=BI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD69EC433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jul 2020 20:56:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D3362074B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jul 2020 20:56:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2KaEOqwk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="Zvip8zar"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D3362074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vlZhZiSKHdpI85DBCzTeZNOgWiElOAoRjbXdcD2BgQ8=; b=2KaEOqwkCBCvCc5NPXZFL7RIz
	7aX9VkC8fwzkDphlIMAFJgM8MDoY57pFDOhgfB76sC4PUMOp+7wCBmdvLq6srJPiyuXX1M5s7G36b
	tb02ZQcl6G85zUQvJZycNXsUKZXDpcYjvMyNnW+0P7sWKNiw4SRvHFNzlMkKf0lnEQZTdPwgQdCQK
	d8JBpJF4ObiBKw+rpHrGFYfc7ZqKWV5ZeIchL9PzxW1ULyH7d0KH8pWicL51WtRgIEpTSNxKGQXUt
	AG/BY7RLoPiWFcPOH5Ph1f3ZDJ5DRe6YsKScSqG8ZtaeLhuo08K8uQdqGu4ldNp0twRLEhDMDNuFL
	WgQcL0nMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0t6H-00014x-Ob; Wed, 29 Jul 2020 20:54:57 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0t6A-00014M-53
 for linux-mtd@lists.infradead.org; Wed, 29 Jul 2020 20:54:51 +0000
Received: by mail-qk1-x744.google.com with SMTP id u64so23604085qka.12
 for <linux-mtd@lists.infradead.org>; Wed, 29 Jul 2020 13:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hML/G2Vc4+8j8itR9nKQsmnhixEhsDERowGsOaYy7Gw=;
 b=Zvip8zarCHkiOAp40mMHVMaLvnPMf3ZQI2kSo9fjzG0D6nM7fysyjZo3oR16GmU5un
 RZJgAoIIftLEUrNHVTF5d0lcuWp9PmRHSF3BhGGu49F/B7bFuFDHer7uqebnWZZFa3Fx
 ImE6syx7IxfsoVqZFf3KE2Y2ZOVMFUPq/qg/Qr9gfRk4irvzzWLIKi2tVewrQsPEdZRU
 b7JOXqr/VFRFAD8UjkJ6aUCSZWimOZhK9HJsrNnkF9fgcDXyegTccsVKvnXdv9NOYyfQ
 ivnNne6r436/TAQ9T6N0GFYlXffps/RnZu6Py4vMLefN7S89NM15w3rCHeUH2y6nq22u
 n+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hML/G2Vc4+8j8itR9nKQsmnhixEhsDERowGsOaYy7Gw=;
 b=l2dPkkSAZifUDnqMlk4gN1wHqht7tazqfxJYD1ahE6c5o5cJt/KkqrBrFYNFJYhb6B
 jG7Y4khvg72nk07UzVlgDvSp3sxY6IOR/CPpBW/5GNzsQubyg6IQgxiOAqBcqof6dPPA
 +ZujoxGRyxDGw5pZgXmvO2RRxsCaas2Z7elw1zAmS7i3ul7t2h4Lul4vFZQ4YsdbqQqq
 O/V+b7Ttx/9QClzc/CNhIxczOA3JXVe9AcN9dCR4Be69b1d9qeYdxeH+Ovw5hmyCwIdk
 p3IQQJgfe6uZWof5sICmwfskgxUCK0Z7YUCjqKmkkhb6uGtZIVwdDSv0SGFfvMHjzyHt
 9pTw==
X-Gm-Message-State: AOAM533Ro6IekZlQY5hT7ppo+9azq2Xs43q1fl2qk6fmN2rubX/BqElY
 yvGHKhNkHz/pKJ86NPx4Ge2lp3dasM/NJzJemFen/w==
X-Google-Smtp-Source: ABdhPJziT1y1KwgPcmp+p6p/09SIbNmExj8/wOsyvDR2EqdYDYLBrsq7yFVHctr2qgO+0kbNSt238S1a8b5CibuBZ3s=
X-Received: by 2002:ae9:eb81:: with SMTP id
 b123mr35072208qkg.288.1596056086506; 
 Wed, 29 Jul 2020 13:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200724212853.11601-1-daniel.gutson@eclypsium.com>
 <20200725055649.GA1047853@kroah.com>
 <CAFmMkTE_dT9+WJYyb19uQ_HmgJWZSARBy6PveheQJk++NuGbkQ@mail.gmail.com>
 <20200726071723.GB441916@kroah.com>
 <CAFmMkTFzGfFDrJrdgHztzLK2K-zBWy6T2Tv+G4-rrbVpbahkgg@mail.gmail.com>
 <CAK8P3a1nA7K15Cxz84Q8Grw3tKfgkUmsfURcytJEWb_0Wjqm5w@mail.gmail.com>
 <CAFmMkTExBY3V_Ghej7Bzjatg+vFtWq3UZmKzjAiEoR9EqnFN9Q@mail.gmail.com>
In-Reply-To: <CAFmMkTExBY3V_Ghej7Bzjatg+vFtWq3UZmKzjAiEoR9EqnFN9Q@mail.gmail.com>
From: Daniel Gutson <daniel@eclypsium.com>
Date: Wed, 29 Jul 2020 17:54:35 -0300
Message-ID: <CAFmMkTEO7VNKJeYz2uoHsS-yN_aY8UuiQ2GcCq9NyAD5481ZGA@mail.gmail.com>
Subject: Re: [PATCH] Module argument to control whether intel-spi-pci attempts
 to turn the SPI flash chip writeable
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_165450_203655_83E186EA 
X-CRM114-Status: GOOD (  28.53  )
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
Cc: Richard Hughes <hughsient@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdWwgMjcsIDIwMjAgYXQgMTI6MzEgUE0gRGFuaWVsIEd1dHNvbiA8ZGFuaWVsQGVj
bHlwc2l1bS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMjcsIDIwMjAgYXQgMTI6MTUgUE0g
QXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBKdWwg
MjcsIDIwMjAgYXQgNTowNSBQTSBEYW5pZWwgR3V0c29uIDxkYW5pZWxAZWNseXBzaXVtLmNvbT4g
d3JvdGU6Cj4gPiA+IE9uIFN1biwgSnVsIDI2LCAyMDIwIGF0IDQ6MTcgQU0gR3JlZyBLcm9haC1I
YXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4gPiA+Pgo+ID4gPj4g
T24gU2F0LCBKdWwgMjUsIDIwMjAgYXQgMDI6MjA6MDNQTSAtMDMwMCwgRGFuaWVsIEd1dHNvbiB3
cm90ZToKPiA+ID4+ID4gRWwgc8OhYi4sIDI1IGp1bC4gMjAyMCAyOjU2IGEuIG0uLCBHcmVnIEty
b2FoLUhhcnRtYW4gPAo+ID4gPj4gPiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gZXNjcmli
acOzOgo+ID4gPj4gPgo+ID4gPj4gPgo+ID4gPj4gPiAxKSBJIGp1c3QgZGlkIHRoZSBzYW1lIHRo
YXQgaW50ZWwtc3BpLmMgZG9lcy4KPiA+ID4+Cj4gPiA+PiBObyBuZWVkIHRvIGNvcHkgYmFkIGV4
YW1wbGVzIDopCj4gPiA+Cj4gPiA+Cj4gPiA+IERpZG4ndCBrbm93IGl0IHdhcyBhIGJhZCBleGFt
cGxlLiBXaGF0J3MgaXMgdGhlIGN1cnJlbnQgbW9kZXJuIG1lY2hhbmlzbSB0aGF0IHJlcGxhY2Vz
IGluaXRpYWxpemF0aW9uLXRpbWUgY29uZmlndXJhdGlvbj8KPiA+Cj4gPiBJJ2Qgc2F5IHlvdSdk
IGdlbmVyYWxseSB3YW50IHRoaXMgdG8gYmUgYSBwZXItaW5zdGFuY2Ugc2V0dGluZywgd2hpY2gK
PiA+IGNvdWxkIGJlIGEgc3lzZnMgYXR0cmlidXRlIG9mIHRoZSBwaHlzaWNhbCBkZXZpY2UsIG9y
IGFuIGlvY3RsIGZvciBhbgo+ID4gZXhpc3RpbmcgdXNlciBzcGFjZSBhYnN0cmFjdGlvbi4KPgo+
IEJ1dCBzdGlsbCwgdGhleSBhcmUgbm90IGVxdWl2YWxlbnQuIFRoZSBpbml0aWFsIGNvbmZpZ3Vy
YXRpb24gcmVtYWlucwo+IGNvbnN0YW50IGZvciB0aGUgcmVzdCBvZiB0aGUgbGlmZSBvZiB0aGUg
ZHJpdmVyLCB3aGVyZWFzIHRoZQo+IHN5c2ZzIGF0dHJpYnV0ZSBpcyBzZXQgYWZ0ZXIgdGhlIGlu
aXRpYWxpemF0aW9uIGFuZCBjYW4gYmUgcmUtc2V0IG92ZXIKPiB0aW1lLiBJJ20gbm90IGFza2lu
ZyBtb2R1bGUgcGFyYW1ldGVycyAidG8gY29tZSBiYWNrIiBpZgo+IHRoZXkgYXJlIG5vdyBjb25z
aWRlcmVkIG9ic29sZXRlLCBJJ20ganVzdCB0cnlpbmcgdG8gdW5kZXJzdGFuZC4KPgo+ID4KPiA+
IEluIHRoZSBjaGFuZ2Vsb2csIHlvdSBzaG91bGQgYWxzbyBleHBsYWluIHdoYXQgdGhpcyBpcyB1
c2VkIGZvci4gRG8KPiA+IHlvdSBhY3R1YWxseSB3YW50IHRvIHdyaXRlIHRvIGEgZGV2aWNlIHRo
YXQgaXMgbWFya2VkIHJlYWQtb25seSwgb3IKPiA+IGFyZSB5b3UganVzdCB0cnlpbmcgdG8gbWFr
ZSB0aGUgaW50ZXJmYWNlIG1vcmUgY29uc2lzdGVudCBiZXR3ZWVuIHRoZQo+ID4gdHdvIGRyaXZl
cnM/Cj4KPiBUaGUgZGV2aWNlIGNhbiBlaXRoZXIgYmUgbG9ja2VkIG9yIHVubG9ja2VkLiBJZiBp
dCBpcyB1bmxvY2tlZCwgaXQgY2FuCj4gYmUgc2V0IHdyaXRhYmxlIGRlcGVuZGluZyBvbiB0aGUg
bW9kdWxlCj4gYXJndW1lbnQgaW4gaW50ZWwtc3BpLCBvciBzdHJhaWdodCB3cml0YWJsZSBpbiBp
bnRlbC1zcGktcGNpLiBXaGljaCBpcwo+IGRhbmdlcm91cy4KPiBJIHdhbnRlZCB0byBtYWtlLCBh
cyB5b3Ugc2F5LCB0aGUgaW50ZXJmYWNlIGNvbnNpc3RlbnQuCj4gRXhwb3NpbmcgYW4gaW50ZXJm
YWNlIHRvIHRoZSB1c2VyICh2aWEgYSBzeXNmcyBhdHRyaWJ1dGUpIHRvIHRyeSB0bwo+IG1ha2Ug
dGhlIGRyaXZlciB3cml0YWJsZSBpcyBkZWZpbml0aXZlbHkgYSBiYWQgaWRlYS4KPiBJJ2QgcmF0
aGVyIGRvIG5vdGhpbmcgKG5vIG1vZHVsZSBhcmcpIHJhdGhlciB0aGFuIG9wZW4gdGhhdAo+IGhl
cmUtYmUtZHJhZ29ucyBkb29yLgoKcGluZy4KVGhpcyBpcyBhIHJlYWwgZXhpc3RpbmcgcHJvYmxl
bSB0aGF0IEknbSB0cnlpbmcgdG8gYWRkcmVzcy4KVGhlcmUncyBjdXJyZW50bHkgbm8gd2F5IHRv
IHByZXZlbnQgdGhlIGtlcm5lbCB0byB0cnkgdG8gdHVybgp0aGUgU1BJIGZsYXNoIGNoaXAgd3Jp
dGFibGUgZm9yIHRoZSBkZXZpY2UgSURzIGhhbmRsZWQgYnkKaW50ZWwtc3BpLXBjaS4gQW5kIGFs
bG93aW5nIHVzZXJzcGFjZSB0byBzd2l0Y2ggaXQgYmV0d2Vlbgp3cml0YWJsZS9ub24td3JpdGFi
bGUgaXMgbm90IGFuIG9wdGlvbi4KV2hhdCBvdGhlciBtZWNoYW5pc20gY2FuIEkgdXNlIG90aGVy
IHRoYW4gdGhlIG1vZHVsZSBwYXJhbWV0ZXIsCnNvCiAtIG5vdCBhY2Nlc3NpYmxlIHRocm91Z2gg
dXNlciBzcGFjZQogLSBpZGVhbGx5IHNldCBvbmNlLCBpZGVhbGx5IGF0IGluaXRpYWxpemF0aW9u
IHRpbWUKClRoYW5rcywKCiAgICBEYW5pZWwuCgoKPgo+ID4KPiA+ICAgICAgQXJuZAo+Cj4KPgo+
IC0tCj4gRGFuaWVsIEd1dHNvbgo+IEFyZ2VudGluYSBTaXRlIERpcmVjdG9yCj4gRW5naW5pZWVy
aW5nIERpcmVjdG9yCj4gRWNseXBzaXVtCj4KPiBCZWxvdyBUaGUgU3VyZmFjZTogR2V0IHRoZSBs
YXRlc3QgdGhyZWF0IHJlc2VhcmNoIGFuZCBpbnNpZ2h0cyBvbgo+IGZpcm13YXJlIGFuZCBzdXBw
bHkgY2hhaW4gdGhyZWF0cyBmcm9tIHRoZSByZXNlYXJjaCB0ZWFtIGF0IEVjbHlwc2l1bS4KPiBo
dHRwczovL2VjbHlwc2l1bS5jb20vcmVzZWFyY2gvI3RocmVhdHJlcG9ydAoKCgotLSAKRGFuaWVs
IEd1dHNvbgpBcmdlbnRpbmEgU2l0ZSBEaXJlY3RvcgpFbmdpbmllZXJpbmcgRGlyZWN0b3IKRWNs
eXBzaXVtCgpCZWxvdyBUaGUgU3VyZmFjZTogR2V0IHRoZSBsYXRlc3QgdGhyZWF0IHJlc2VhcmNo
IGFuZCBpbnNpZ2h0cyBvbgpmaXJtd2FyZSBhbmQgc3VwcGx5IGNoYWluIHRocmVhdHMgZnJvbSB0
aGUgcmVzZWFyY2ggdGVhbSBhdCBFY2x5cHNpdW0uCmh0dHBzOi8vZWNseXBzaXVtLmNvbS9yZXNl
YXJjaC8jdGhyZWF0cmVwb3J0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
