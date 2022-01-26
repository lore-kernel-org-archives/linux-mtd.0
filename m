Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44F7C28CF5
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 11:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jShLlz/OHoUAuTQltqp3kT6jSAaUwFRL8gazNdWln4E=; b=kFWhXaoDyneEVn
	AQZbFvDHF+7xHyhyjvwdEMHulhB+5AoYyZMoBI+qnzc6k/iZ2Fhpux7hAieOY6fExTCiysmAPSHS1
	rYTCDNvaWIt+WGHyM2hIwDUFZUcos1OZLC93yYdvNxi1Hw6fFNAWVz3+pubkyKtVEghix1Jw2Ioxj
	3Q7FsuMVCGqlp8zGHKVLmIoMCQ8aUGbHwSZQ7w+ZQ29OtNf5LJSBJSY4YJ+U2IiMi7RFm1KmdPKtG
	6FUS9Ta+SBuAnXySM/5dbY0JQu0bO9OKGnPzdGtTUYtrUy2mgPuQu7WclON58MwshTHnjNCcwp4m3
	+BjtShjYkB+P2+KhcIag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCgPT-00BSkT-8X; Wed, 26 Jan 2022 11:24:19 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCgKL-00BRLN-7Q
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 11:19:03 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8435B10000A;
 Wed, 26 Jan 2022 11:18:56 +0000 (UTC)
Date: Wed, 26 Jan 2022 12:18:55 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Michal Simek <monstr@monstr.eu>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, Mark
 Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Subject: Re: [PATCH v4 2/3] spi: dt-bindings: Describe stacked/parallel
 memories modes
Message-ID: <20220126121855.1139be2d@xps13>
In-Reply-To: <CAL_Jsq+1X1V8UUHgfKaSbhZLtche3bqnCj62jFRVWzQLEc3hng@mail.gmail.com>
References: <20211210201039.729961-1-miquel.raynal@bootlin.com>
 <20211210201039.729961-3-miquel.raynal@bootlin.com>
 <YbjVSNAC8M5Y1nHp@robh.at.kernel.org>
 <20211216160226.4fac5ccc@xps13>
 <CAL_Jsq+1X1V8UUHgfKaSbhZLtche3bqnCj62jFRVWzQLEc3hng@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_031901_605400_595314E1 
X-CRM114-Status: GOOD (  24.99  )
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

SGkgUm9iLAoKPiA+IEl0IHNlZW1lZCBsaWtlIHRoZSBvbmx5IHBvc3NpYmxlIHdheSAodGhhdCB0
aGUgdG9vbGluZyB3b3VsZCB2YWxpZGF0ZSkKPiA+IHdhcyB0byB1c2U6Cj4gPgo+ID4gYmluZGlu
Z3M6ICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQ2NC1t
YXRyaXgKPiA+Cj4gPiBTbyBJIGFzc3VtZWQgSSB3YXMgZGVmaW5pbmcgYSBtYXRyaXggb2YgQXhC
IGVsZW1lbnRzLCB3aGVyZSBBIGlzIHRoZQo+ID4gbnVtYmVyIG9mIGRldmljZXMgSSB3YW50IHRv
ICJzdGFjayIgYW5kIEIgaXMgdGhlIG51bWJlciBvZiB2YWx1ZXMKPiA+IG5lZWRlZCB0byBkZXNj
cmliZSBpdHMgc2l6ZSwgc28gMS4gIAo+IAo+IFllYWgsIHRoYXQncyB3ZWxsIHJlYXNvbmVkIGFu
ZCBJIGFncmVlLiBUaGUgb3RoZXIgYXJyYXkgY2FzZSBpcyB5b3UKPiBoYXZlIE4gdmFsdWVzIHdo
ZXJlIGVhY2ggdmFsdWUgcmVwcmVzZW50cyBkaWZmZXJlbnQgZGF0YSByYXRoZXIgdGhhbgo+IGlu
c3RhbmNlcyBvZiB0aGUgc2FtZSBkYXRhLiBUaGUgY2hhbGxlbmdlIGlzIGZvciB0aGUgc2NoZW1h
IGZpeHVwcyB0bwo+IHJlY29nbml6ZSB3aGljaCBpcyB3aGljaCB3aXRob3V0IHNheWluZyB0aGUg
c2NoZW1hIG11c3QgbG9vayBsaWtlCj4gZXhhY3RseSBYIG9yIFkgYXMgdGhlcmUgd2lsbCBiZSBl
eGNlcHRpb25zLgoKT2ssIG5vdyBJIHNlZSB0aGUgcHJvYmxlbSBvbiB0aGUgdG9vbGluZyBzaWRl
IGFuZCB3aHkgeW91IGNob3NlIG5vdCB0bwp1c2UgdGhpcyBzeW50YXguCgo+ID4gSSByZWFsaXpl
ZCB0aGF0IHRoZSBmb2xsb3dpbmcgZXhhbXBsZSwgd2hpY2ggSSB3YXMgZXhwZWN0aW5nIHRvIHdv
cmssCj4gPiB3YXMgZmFpbGluZzoKPiA+Cj4gPiBiaW5kaW5nczogICAgICAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDY0LWFycmF5Cj4gPiBkdDogICAgICAgICAg
ICAgPHByb3BlcnR5PiA9IDx1aW50NjQ+LCA8dWludDY0PjsKPiA+Cj4gPiBJbmRlZWQsIGFzIHlv
dSBwcm9wb3NlLCB0aGlzIGFjdHVhbGx5IHdvcmtzIGJ1dCBkZXNjcmliZXMgdHdvIHZhbHVlcwo+
ID4gKHRpZWQgc29tZWhvdykgaW50byBhIHNpbmdsZSBlbGVtZW50LCB3aGljaCBpcyBub3QgZXhh
Y3RseSB3aGF0IEkKPiA+IHdhbnRlZDoKPiA+Cj4gPiBiaW5kaW5nczogICAgICAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDY0LWFycmF5Cj4gPiBkdDogICAgICAg
ICAgICAgPHByb3BlcnR5PiA9IDx1aW50NjQgdWludDY0PjsKPiA+Cj4gPiBCdXQgbW9yZSBkaXN0
dXJiaW5nLCBhbGwgdGhlIGZvbGxvd2luZyBjb25zdHJ1Y3Rpb25zIHdvcmtlZCwgd2hlbiB1c2lu
Zwo+ID4gMzItYml0cyB2YWx1ZXMgaW5zdGVhZDoKPiA+Cj4gPiBiaW5kaW5nczogICAgICAgJHJl
ZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLWFycmF5Cj4gPiBkdDog
ICAgICAgICAgICAgPHByb3BlcnR5PiA9IDx1aW50MzIgdWludDMyPjsKPiA+Cj4gPiBiaW5kaW5n
czogICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLWFy
cmF5Cj4gPiBkdDogICAgICAgICAgICAgPHByb3BlcnR5PiA9IDx1aW50MzI+LCA8dWludDMyPjsK
PiA+Cj4gPiBiaW5kaW5nczogICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5p
dGlvbnMvdWludDMyLW1hdHJpeAo+ID4gZHQ6ICAgICAgICAgICAgIDxwcm9wZXJ0eT4gPSA8dWlu
dDMyIHVpbnQzMj47Cj4gPgo+ID4gYmluZGluZ3M6ICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVz
LnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMi1tYXRyaXgKPiA+IGR0OiAgICAgICAgICAgICA8cHJv
cGVydHk+ID0gPHVpbnQzMj4sIDx1aW50MzI+OyAgCj4gCj4gVGhhdCB3b3JrcyBiZWNhdXNlIHRo
ZXJlJ3Mgc29tZSByZWFsbHkgdWdseSBjb2RlIHRvIHRyYW5zZm9ybSB0aGUKPiBzY2hlbWEgaW50
byBib3RoIGZvcm1zLgoKR29vZCB0byBrbm93LCB0aGlzIGtpbmQgb2YgcHV6emxlZCBtZSB3aGVu
IEkgdHJpZWQgYWxsIHRoZQpjb25maWd1cmF0aW9ucyA6KQoKPiA+IEkgYW0gZmluZSB3YWl0aW5n
IGEgYml0IGlmIHlvdSB0aGluayB0aGVyZSBpcyBhIG5lZWQgZm9yIHNvbWUgdG9vbGluZwo+ID4g
dXBkYXRlIG9uIHlvdXIgc2lkZS4gT3RoZXJ3aXNlLCBkbyB5b3UgcmVhbGx5IHRoaW5rIHRoYXQg
dGhpcyBzb2x1dGlvbgo+ID4gaXMgdGhlIG9uZSB3ZSBzaG91bGQgcmVhbGx5IHVzZT8KPiA+Cj4g
PiBiaW5kaW5nczogICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
dWludDY0LWFycmF5Cj4gPiBkdDogICAgICAgICAgICAgPHByb3BlcnR5PiA9IDx1aW50NjQgdWlu
dDY0PjsgIAo+IAo+IEJlY2F1c2Ugb2YgdGhlIC9iaXRzLyBpc3N1ZSwgeWVzLgo+IAo+IE1vcmUg
aW1wb3J0YW50bHksIHRoZSBicmFja2V0aW5nIGluIGR0cyBmaWxlcyBpcyBub3QgZ29pbmcgdG8g
bWF0dGVyCj4gc29vbiAoZnJvbSBhIHZhbGlkYXRpb24gcGVyc3BlY3RpdmUpLiBJJ20gd29ya2lu
ZyBvbiBtb3ZpbmcgdmFsaWRhdGlvbgo+IGZyb20gdXNpbmcgdGhlIHlhbWwgZW5jb2RlZCBEVCAo
d2hpY2ggZGVwZW5kcyBvbiBhbmQgcHJlc2VydmVzCj4gYnJhY2tldHMpIHRvIHVzaW5nIGR0YnMu
IFRoaXMgd2lsbCB1c2UgdGhlIHNjaGVtYXMgdG8gZGVjb2RlIHRoZQo+IHByb3BlcnR5IHZhbHVl
cyBpbnRvIHRoZSByaWdodCBmb3JtYXQvdHlwZS4KCk9rLgoKV2VsbCwgdGhhbmtzIGZvciB0aGUg
ZmVlZGJhY2ssIHdpdGggdGhlIGxhdGVzdCBkdC1zY2hlbWEgdGhlIHRvb2xpbmcKbm93IHZhbGlk
YXRlcyB0aGUgYmluZGluZyBzbyBJIGFtIGdvaW5nIHRvIHNlbmQgaXQgYXMgYSB2NiB0byBjb2xs
ZWN0CnlvdXIgQWNrLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
