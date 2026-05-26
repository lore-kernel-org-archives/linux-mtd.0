Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D10CD5BC8
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 15:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1wF+eDG+LLENSTAx70xaDcxLZt5IBltW+c6mlODlPA=; b=1OloMHcpjv2j80
	AEwY2Xo71TVuGHKkt9CALOvIBREyr/0UOdrx2z57SEjaEFzLScpVfadC5PCt+SQaA+k6xxOwBPlyv
	SAn1ieaa2/97s123nit5JvPUF7G8d2MbA7CbyMktVjMF88Wd908EjiVLQ8NT7yfGTAF9cKWo9hNVY
	Zm+endIsngUSpClAM2MPf76CxkWGK7XbvbcK+fFFB3oHdt+quSZFCPaFONkLBqoTlI5y8qytn/IOz
	xUZBxadRgjVqlKFVhqm01/hiBFjwRRnoSab1457kj7h3ipu//5snO3ZPW+V8V0rG0GFVvKYDYq68e
	UZORSSiOHVZnzbjx+K9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtZm-00000002Low-0HNf;
	Tue, 26 May 2026 15:20:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtZj-00000002Lmd-0aCy
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 15:20:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 71CAF43A2B;
	Tue, 26 May 2026 15:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9D91F000E9;
	Tue, 26 May 2026 15:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779808810;
	bh=SH8qWHJju4uEAUf18GIpquuRbDg0vcsabcryMTE0gLE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Yf74WaraQu+culrxNM7OHuH/zSP4TM4/HGEx2r/fpoNbU4BL7xtLWNZxgSbUt7SXh
	 9T6fAf5xsM2R0n5yG8qom6jBLJIp+HKzyfs1j/9YkdJ2/T+gUycOjKkEBH6KnE+Xcj
	 geeN1dYKtNOtgXZ6COQi/gJnMToYeDPUVWQcI11nnoARWBfi8xpqWkJiWhueZevFEY
	 +R3MeI0W6TilQF5kgigh6D+kl9WvKV642zUaO5awh/BwT1jOmqMd6iiNJEraBusVMe
	 V+zWOYT16/jLo2/oBL18U5Cny1aV31ES4zb7gm4LLjeWtfwZZ2dlc0Mu9Y9z/KmPij
	 da3VA4tVczz1Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,  Takahiro
 Kuwano <takahiro.kuwano@infineon.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Jonathan Corbet
 <corbet@lwn.net>,  Shuah Khan <skhan@linuxfoundation.org>,  Sean Anderson
 <sean.anderson@linux.dev>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  stable@kernel.org
Subject: Re: [PATCH v5 04/28] mtd: spi-nor: swp: Improve locking user
 experience
In-Reply-To: <87v7cakz7u.fsf@bootlin.com> (Miquel Raynal's message of "Tue, 26
	May 2026 16:44:05 +0200")
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
	<20260507-winbond-v6-18-rc1-spi-nor-swp-v5-4-93453e1a9597@bootlin.com>
	<9432f07f-3724-4257-b6ab-84721e619f78@linaro.org>
	<875x4fphgr.fsf@bootlin.com>
	<779f2680-2c67-4bbd-9576-bde8e83d111d@linaro.org>
	<87o6i7o0tj.fsf@bootlin.com> <2vxz8q965ub7.fsf@kernel.org>
	<87v7cakz7u.fsf@bootlin.com>
Date: Tue, 26 May 2026 17:20:06 +0200
Message-ID: <2vxzcxyi42qh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_082011_227254_CDA2C7AD 
X-CRM114-Status: GOOD (  23.90  )
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

T24gVHVlLCBNYXkgMjYgMjAyNiwgTWlxdWVsIFJheW5hbCB3cm90ZToKCj4gSGkgUHJhdHl1c2gs
Cj4KPj4gQW5kIGhlcmUncyB3aGF0IEkgYW0gdGhpbmtpbmc6IHRoZSBmaXJzdCA5IHBhdGNoZXMg
YXJlIHJldmlld2VkIGFuZCBnb29kCj4+IHRvIGdvLiBJIHdhbnQgdG8gbGFuZCB0aGVtIGluIHRo
aXMgbWVyZ2Ugd2luZG93IHNvIHdlIGN1dCBkb3duIHlvdXIKPj4gcGF0Y2hzZXQgYW5kIGxhbmQg
c3R1ZmYgc29vbmVyLgo+Pgo+PiBVbmZvcnR1bmF0ZWx5IEkganVzdCBjYW4ndCBzZWVtIHRvIGZp
bmQgdGltZSB0byByZXZpZXcgdGhpcyBzZXJpZXMgc28gSQo+PiBob3BlIHRoaXMgaGVscHMgc29t
ZSBhdCBsZWFzdC4KPgo+IEkga25vdyB3aGF0IHRoZSBtYWludGFpbmVyIGxvYWQgY2FuIGJlLCBz
b21ldGltZXMgaXQgZG9lcyBub3QgcGxheSB3ZWxsCj4gd2l0aCB0aGUgcmVzdCBvZiB0aGUgeW91
ciBwZXJzb25hbCBhbmQgcHJvZmVzc2lvbmFsIGR1dGllcy4gQnV0IHRoZQo+IHNlcmllcyBoYXMg
YWxyZWFkeSBiZWVuIG9uIHRoZSBsaXN0IGZvciBhYm91dCA4IG1vbnRocywgaXQncyBiZWVuIGxv
b2tlZAo+IGF0IGJ5IG90aGVyIHBlb3BsZSwgdGhlIG9uZXMgd2hvIGhhZCBlbm91Z2ggdGltZSB0
byBkZWRpY2F0ZSB0byBpdC4gRnJvbQo+IG15IHBlcnNwZWN0aXZlLCBhc2tpbmcgc3VjaCBjb250
cmlidXRpb25zIHRvIHdhaXQgaW5kZWZpbml0ZWx5IGFuZCB0aGVuCj4gc3VnZ2VzdGluZyBwYXJ0
aWFsIGFwcGxpY2F0aW9uIHdpdGhvdXQgYSB0ZWNobmljYWwgcmVhc29uIGlzIG5vdCBhCj4gc3Vz
dGFpbmFibGUgd2F5IHRvIGhhbmRsZSBjb250cmlidXRpb25zLiBUaGlzIHNlcmllcyBoYXMgbm90
IG1vdmVkIG11Y2gsCj4gaXQgY291bGQgaGF2ZSBiZWVuIGFwcGxpZWQgKm11Y2gqIGVhcmxpZXIu
IEkndmUgbm93IGFkZHJlc3NlZCBtb3N0IG9mCj4gdGhlIGNvbW1lbnRzIGZyb20gU2FzaGlrbywg
djYgaXMgY29taW5nLCBmdXJ0aGVyIGltcHJvdmluZyB0aGUgcXVhbGl0eQo+IGZvciBzdXJlLCBh
cyB0aGVyZSB3ZXJlIGJ1Z3MgLSB0aGVyZSBhcmUgYWx3YXlzLiBJIGFtIG9mIGNvdXJzZSBoYXBw
eSB0bwo+IGFkZHJlc3MgZnVydGhlciB0ZWNobmljYWwgY29uY2VybnMsIGlmIHRoZXJlIGFyZSBh
bnksIGJ1dCBJIHdvdWxkCj4gc3Ryb25nbHkgcHJlZmVyIG1lcmdpbmcgdGhlIHNlcmllcyBhcyB0
aGUgY29oZXJlbnQgc2V0IGl0IHdhcyBpbnRlbmRlZAo+IHRvIGJlLCByYXRoZXIgdGhhbiBvbmx5
IHRha2luZyB0aGUgcHJlcGFyYXRvcnkgcGFydHMuCgpVbmZvcnR1bmF0ZWx5IEkgYW0gb25seSBh
IHBhdGNoIG1vbmtleSBmb3IgU1BJIE5PUiB0aGVzZSBkYXlzIGFuZCBkbyBub3QKaGF2ZSBhbnkg
dGltZSB0byBkbyByZXZpZXdzLCBlc3BlY2lhbGx5IGZvciBiaWcgc2VyaWVzLiBJIG1haW5seSBj
aGVjawpmb3IgcmV2aWV3ZWQgcGF0Y2hlcyBhbmQgdHJ5IHRvIGFwcGx5IHRoZW0uIEV2ZW4gdGhh
dCBpcyBiZWNvbWluZyBoYXJkZXIKdGhlc2UgZGF5cyBzaW5jZSBJIGFtIG1vcmUgYnVzeSBhdCBu
ZXcgJERBWUpPQi4KCkkgdW5kZXJzdGFuZCB5b3VyIGZydXN0cmF0aW9uLCBhbmQgZG8gdGFrZSB0
aGUgYmxhbWUgZm9yIHRoaXMsIGJ1dAp1bmZvcnR1bmF0ZWx5IGNhbid0IHByb21pc2UgYW55dGhp
bmcgYmV0dGVyIGluIHRoZSBmdXR1cmUuIFdlIHByZXR0eQptdWNoIGRvbid0IGhhdmUgYW55IGFj
dGl2ZSByZXZpZXdlcnMgaW4gU1BJIE5PUi4gTWljaGFlbCBhbmQgVHVkb3IgYXJlCmFsc28gc2hv
cnQgb24gdGltZSB0aGVzZSBkYXlzLiBJZiB5b3VyIGVtcGxveWVyIGNhcmVzIGFib3V0IFNQSSBO
T1IsCnBlcmhhcHMgeW91IGNhbiBlbmNvdXJhZ2UgdGhlbSB0byBzdXBwb3J0IGRldmVsb3BlcnMg
aW4gaGVscGluZyBvdXQgd2l0aApyZXZpZXdzIGFuZCBtYWludGVuYW5jZS4KCkFwcGx5aW5nIHRo
ZSByZXZpZXdlZCBwYXRjaGVzIHJlZHVjZXMgdGhlIHRvdGFsIHBhdGNoc2V0IHNpemUgYW5kIGRv
ZXMKbWFrZSB0aGluZ3MgZWFzaWVyIHRvIHJldmlldyBhbmQgbGFuZC4gU28gSSBkb24ndCBnZXQg
d2h5IHlvdSBhcmUgc28Kb3Bwb3NlZCB0byB0aGUgaWRlYS4KCkJ1dCBhbnl3YXksIEknbGwgYml0
ZSB0aGUgYnVsbGV0IGhlcmUgYW5kIGFwcGx5IHRoZSBzZXJpZXMuIFlvdQpnZW5lcmFsbHkgaGF2
ZSBoaWdoIHF1YWxpdHkgcGF0Y2hlcyBzbyBJIGFtIG5vdCBzdXBlciB3b3JyaWVkIGFib3V0IHRo
aXMKdG8gYmVnaW4gd2l0aC4gV2UgY2FuIGRlYWwgd2l0aCB0aGUgYnVncyBvciBzaG9ydGNvbWlu
Z3MgbGF0ZXIgSQpzdXBwb3NlLi4uCgo+Cj4gT24gdG9wIG9mIHRoYXQsIGFzIG1lbnRpb25lZCBw
cmV2aW91c2x5LCBJIG5vdyBoYXZlIGFkZGl0aW9uYWwgc3BpLW5vcgo+IGltcHJvdmVtZW50cyBh
bmQgY2xlYW51cHMgd2FpdGluZyBiZWhpbmQgdGhpcyBzZXJpZXMuIEtlZXBpbmcgc3VjaCBhCj4g
bGFyZ2Ugc3RhY2sgb2Ygb3V0IG9mIHRyZWUgcGF0Y2hlcyBmb3IgbW9udGhzIGlzIGJlY29taW5n
IHBhaW5mdWwgdG8KPiBtYWludGFpbi4KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgotLSAKUmVnYXJk
cywKUHJhdHl1c2ggWWFkYXYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
