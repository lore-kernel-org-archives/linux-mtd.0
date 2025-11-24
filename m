Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E072BCFA466
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Nov 2025 09:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2gT2qUm94bHLDmfoDT/yJL2gRJjXmvx5YyzcAlmj8I=; b=tUodG1VH8RlAoP
	rt9J+E92JZ2u48AKfbtwP+lsZ3fzwUH4gF1A3k0Glk1SZaKdN35M+5NVG59NsR08YoMedL+agfkNs
	OvzD38hGPnCwq9tfzwcuRqrvYQJNC/F5rPZHsq2bHrd5RzVo7wxncMzIdiImL1SODvsXRgIpaXfvy
	/GC08Nz2cpYrCVIwIV+wvHwnsTGOxmgQ49Zzk+vzE/FDoWV8Z+ZTS/HQhmHcHmb4EoSrk0A40j4HC
	CtsQe5EmaQwocG0mqGOpnikP1ucvdLuYMVCX5+8ZY9q5UuCIbur9q9/CEDbCRNMve+HIlFNNphj1r
	rUHwMSTGYY7/7dqkW/KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSfb-0000000BK8q-0r6Q;
	Mon, 24 Nov 2025 09:15:39 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSfY-0000000BK82-1tky
	for linux-mtd@lists.infradead.org;
	Mon, 24 Nov 2025 09:15:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E71D5C13998;
	Mon, 24 Nov 2025 09:15:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 640AF606FC;
	Mon, 24 Nov 2025 09:15:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D5AF103713AF;
	Mon, 24 Nov 2025 10:15:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763975732; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=03OD2P7ERGBbMgJiyugvPdSPJyomRkhnTmtbVz/dSh0=;
	b=HpnpNCbVCEwC6zcDqvyAMfa0wevqDDYwnID803/o1/ZYO2X9sgXnfGlg6YxuRZsReGrPSr
	ZkocVNZdOQkdG8Mws2I91qKyek+7zXoH5FkA4vpRu2FQqhfGVx55zwfRONcOtR3AR8mOCE
	OxGWOkZjQsD5bxDK9YlRFepLYJ4b8U7HfrYkymd6yIZddecTunyOKrHvBp440Yh7cdOxnl
	KCana2Ac57SJNXctzJ4Zj3KhKQN2nHjJJe3R6qmtM3QCzrK7VAtuD++30a3+BH5SBqAlCT
	VZJPBbV7joyaK2E2DGd++X5wKQuSXiEa16WTsMj7+plr0s2xC8KR7NnqH9uIvw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Marc Olberding" <molberding@nvidia.com>,  "Tudor Ambarus"
 <tudor.ambarus@linaro.org>,  "Pratyush Yadav" <pratyush@kernel.org>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Fix w25q01jv flags
In-Reply-To: <DEGSOCUMG4WZ.3IYU22B83Z2AI@kernel.org> (Michael Walle's message
	of "Mon, 24 Nov 2025 09:50:27 +0100")
References: <20251121-w25q01jv_fixup-v1-1-3d175050db73@nvidia.com>
	<87jyzfzwpw.fsf@bootlin.com> <DEGRVEN1ZNUY.OCJLFWDG8XD4@kernel.org>
	<87bjkrzvk7.fsf@bootlin.com> <DEGSOCUMG4WZ.3IYU22B83Z2AI@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 24 Nov 2025 10:15:28 +0100
Message-ID: <87wm3fyeof.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_011536_642531_4C881BCA 
X-CRM114-Status: GOOD (  22.24  )
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

T24gMjQvMTEvMjAyNSBhdCAwOTo1MDoyNyArMDEsICJNaWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBNb24gTm92IDI0LCAyMDI1IGF0IDk6MjUgQU0gQ0VULCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gMjQvMTEvMjAyNSBhdCAwOToxMjoz
OCArMDEsICJNaWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+Pj4g
SGksCj4+Pgo+Pj4+PiArCQkubm9fc2ZkcF9mbGFncyA9IFNFQ1RfNEssCj4+Pj4KPj4+PiBUaGlz
IG9uZSBpcyB0aGUgcmlnaHQgZml4IGFuZCBzaG91bGQgc3RhbmQgYWxvbmUgaW4gaXRzIG93biBw
YXRjaCAoZmlyc3QKPj4+PiBpbiB0aGUgc2VyaWVzIGlmIHlvdSBhZGQgc3VwcG9ydCBmb3IgdGhl
IGJsb2NrIHByb3RlY3Rpb24pLgo+Pj4KPj4+IE9ubHkgaWYgdGhhdCBmbGFzaCByZWFsbHkgZG9l
c24ndCBoYXZlIFNGRFAuIEJ1dCBzaW5jZSB0aGUgZW50cnkKPj4+IGRpZG4ndCBoYXZlIGEgc2l6
ZSBwcm9wZXJ0eSB0aGUgZmxhc2ggKm11c3QqIGhhdmUgU0ZEUCBpbiB0aGUgZmlyc3QKPj4+IHBs
YWNlLiAgT3RoZXJ3aXNlIGl0IHdvbid0IGV2ZW4gYmUgcHJvYmVkLiBQbGVhc2UgcHJvdmlkZSBh
IGR1bXAgb2YKPj4+IHRoZSBTRkRQIHRhYmxlcywgc2VlIFsxXS4KPj4KPj4gU0ZEUCBkYXRhIGlz
IGluIGxvcmUKPgo+IEF0IGxlYXN0IHlvdXJzIDopIEFuZCBpZiBJIGRlY29kZSB0aGF0IGNvcnJl
Y3RseSBieSBoYW5kLCBpdCBoYXMgdGhlCj4gNGsgZXJhc2Ugc2l6ZSBiaXQgc2V0IGFzIHdlbGwg
YXMgdGhlIGNvcnJlY3Qgb3Bjb2RlIDIwaCBvciAyMWggZm9yCj4gNGJ5dGUgYWRkcmVzc2luZy4K
Pgo+PiAsIGJ1dCBub3QgdGhlIHBhcmFtcyB3aGljaCBhcmUgbWlzc2luZyAoPykgTWFyYywgY2Fu
Cj4+IHlvdSBjb21wYXJlIHdpdGggeW91ciBkYXRhPwo+PiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyNTAxMTAtd2luYm9uZC02LTEyLXJjMS1ub3Itdm9sYXRpbGUtYml0LXYzLTEtNzM1
MzYzZjhjYzdkQGJvb3RsaW4uY29tLwo+Pgo+Pj4gQWxzbyBwbGVhc2UgcHJvdmlkZSB0aGUgY29u
dGVudHMgb2YKPj4+IC9zeXMva2VybmVsL2RlYnVnL3NwaS1ub3Ivc3BpTi5OL3BhcmFtcy4KPj4+
Cj4+PiAtbWljaGFlbAo+Pgo+PiBNeSB1bmRlcnN0YW5kaW5nICh3aGljaCBtYXkgY2xlYXJseSBi
ZSBlcnJvbmVvdXMpIGlzIHRoYXQgbW9zdCBvZiB0aGVzZQo+PiBmbGFzaGVzIHN1cHBvcnQgNEsg
YmxvY2tzIGJ1dCBzb21laG93IGRvbid0IGFkdmVydGlzZSBpdCBpbiB0aGVpciBTRkRQCj4+IGRh
dGEsIHNvIGV2ZXJ5IHRpbWUgd2UgZGVzY3JpYmUgYSBjaGlwIHdlIG11c3QgcmVtZW1iZXIgdG8g
dGljayB0aGF0Cj4+IGZsYWcuCj4KPiBXaGljaCBmbGFnPyBTRUNUXzRLPyBJIGRvbid0IHRoaW5r
IHRoYXQgd2lsbCBiZSB1c2VkIGF0IGFsbCwgZG9lcwo+IGl0PyBJdCdzIG9ubHkgdXNlZCBpbiBz
cGlfbm9yX25vX3NmZHBfaW5pdF9wYXJhbXMoKSB3aGljaCBpbiB0dXJuIGlzCj4gb25seSBjYWxs
ZWQgaW4gc3BpX25vcl9pbml0X3BhcmFtc19kZXByZWNhdGVkKCkgKG9yIGlmIFNLSVBfU0ZEUCBp
cwo+IHNldCkuIAo+Cj4+IEkgZ3Vlc3MgYWxsXldtb3N0IGNoaXBzIGhhdmUgNGsgYmxvY2tzIGNv
bXBhdGliaWxpdHkgc3VwcG9ydCwgYnV0IGluCj4+IGdlbmVyYWwgd2UgcHJlZmVyIHRvIHVzZSBi
aWdnZXIgYmxvY2tzICh0aGUgb25lcyBhZHZlcnRpc2VkIGluIHRoZSBTRkRQCj4+IGRhdGEpLiBN
aWNoYWVsLCBhbSBJIGJlaW5nIG1pc2xlYWQgYnkgdGhlIGRlY2FkZXMgb2YgaGlzdG9yeSB0aGF0
IHdlbnQKPj4gdGhyb3VnaCB0aGUgc3BpLW5vciBjb3JlPyA6KQo+Cj4gWW91IG1lYW4gQ09ORklH
X01URF9TUElfTk9SX1VTRV80S19TRUNUT1JTPyBCdXQgdGhhdCBoYXMgbm90aGluZyB0bwo+IHRv
IHdpdGggdGhlIGZsYXNoZGIvc2ZkcCBwYXJzaW5nLgoKV2VsbCBJIGV4cGVjdCBDT05GSUdfTVRE
X1NQSV9OT1JfVVNFXzRLX1NFQ1RPUlMgdG8gaGF2ZSBubyBlZmZlY3QKaWYgdGhlIFNFQ1RfNEsg
ZmxhZyBpcyB1bnNldC4gSSBiZWxpZXZlIE1hcmMgaXMgdXNpbmcgdGhlIHNhbWUgY2hpcCBhcyBJ
CmFtLCBidXQgZW5hYmxlZCB0aGlzIG9wdGlvbiBmb3IgY29tcGF0aWJpbGl0eSByZWFzb25zPwoK
QnV0IGFzIHlvdSBzYXksIHRoaXMgNEsgY2FwYWJpbGl0eSBpcyBhZHZlcnRpc2VkIGJ5ICJteSIg
Y2hpcCwgc28gaWYKTWFyYyBmYWNlcyBhbiBpc3N1ZSB3aXRoIGl0LCBpdCBtYXkgaW5kaWNhdGUg
dGhhdCB3ZSBhcmUgaGF2aW5nIGFuIElECmNvbGxpc2lvbj8KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
