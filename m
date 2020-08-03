Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C2CC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 13:11:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0ADB206D7
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 13:11:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h4RLOmX+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0ADB206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PpaHP17brYdWxenlDARB1oviFxhi6c0+5XZq4TI9Mio=; b=h4RLOmX+s2wvKCEcOzYAPeluU
	Wswpd8P3XMOWOXtfDaJAacZNZiPo/0WPRDf0Wu5tR46bwD8MS2kJlTxFT0UXA+hl4f0DIsmjWE6He
	1onmLlmyMgTh5dC02QKI+2RlYn68J5yYiE2eH1dua0CBwckMGc+DatbdgY91Ytr3i+f7IyC23WsO2
	g4mf4xszFqJvQWn3re1vXHTmHfPkEj3UzKJC4U5k2ktw65qgQiSUGL1Z6P1UA3/i1zHaV2LVZwQON
	76d1yRp5BbO4Fmo0GpN/eOPa9V23KlyQo6V/q19W+kdakNJW4/mWj4WPZIV5gbv1J0u9CMSLlsbxQ
	zp9lTsy8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2aEZ-0001tG-CB; Mon, 03 Aug 2020 13:10:31 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2aEW-0001sZ-Bu
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 13:10:29 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1F3EE20003;
 Mon,  3 Aug 2020 13:10:23 +0000 (UTC)
Date: Mon, 3 Aug 2020 15:10:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: Invalid ONFI PARAM PAGE
Message-ID: <20200803151022.4848e35b@xps13>
In-Reply-To: <20200803090626.xwbxnlynun6nmnh7@pengutronix.de>
References: <20200730121425.rjeo6qh4fxisargl@pengutronix.de>
 <20200803104727.1edf834e@xps13>
 <20200803090626.xwbxnlynun6nmnh7@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_091028_661854_9EDB4986 
X-CRM114-Status: GOOD (  25.41  )
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
Cc: bbrezillon@kernel.org, linux-mtd@lists.infradead.org,
 peterpandong@micron.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFyY28sCgpNYXJjbyBGZWxzY2ggPG0uZmVsc2NoQHBlbmd1dHJvbml4LmRlPiB3cm90ZSBv
biBNb24sIDMgQXVnIDIwMjAKMTE6MDY6MjYgKzAyMDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiB0aGFu
a3MgZm9yIHlvdXIgcmVzcG9uc2UgOikKPiAKPiBPbiAyMC0wOC0wMyAxMDo0NywgTWlxdWVsIFJh
eW5hbCB3cm90ZToKPiA+IEhpIE1hcmNvLAo+ID4gCj4gPiBNYXJjbyBGZWxzY2ggPG0uZmVsc2No
QHBlbmd1dHJvbml4LmRlPiB3cm90ZSBvbiBUaHUsIDMwIEp1bCAyMDIwCj4gPiAxNDoxNDoyNSAr
MDIwMDoKPiA+ICAgCj4gPiA+IEhpLAo+ID4gPiAKPiA+ID4gYSBjdXN0b21lciBvZiB1cyB1c2Vz
IG1pY3JvbiBuYW5kIGZsYXNoIGRldmljZXMgZm9yIHRoZWlyIGxvY2FsIHN0b3JhZ2UuCj4gPiA+
IFRoZXkgYXJlIG5vdyBoYXZpbmcgc29tZSB0cm91YmxlcyB3aXRoIGEgZmV3IGRldmljZXMuIExl
dCBtZSBzdGFydCB3aXRoCj4gPiA+IHRoZSBmb2xsb3dpbmc6Cj4gPiA+ICAgMSkgV2UgY2FuIHN1
Y2Nlc3NmdWxseSByZWFkIHRoZSBuYW5kIGlkIGZpZWxkIGJ5OiAgCj4gPiA+ICAgICAgLT4gc2Vs
ZWN0X2NoaXAKPiA+ID4gICAgICAtPiBjbWRmdW5jKG10ZCwgTkFORF9DTURfUkVTRVQpCj4gPiA+
ICAgICAgLT4gY21kZnVuYyhtdGQsIE5BTkRfQ01EX1JFQURJRCkgQWRkcj0weDAwCj4gPiA+ICAg
ICAgLT4gOHRpbWVzOiByZWFkX2J5dGUobXRkKSAgICAKPiA+ID4gCj4gPiA+ICAgICAgVGhlIE5B
TkQgZGV2aWNlIHJlc3BvbnNlIHdpdGggdGhlIGZvbGxvd2luZzoKPiA+ID4gICAgICBuYW5kOiBp
ZF9kYXRhWzBdOiAweDJjCj4gPiA+ICAgICAgbmFuZDogaWRfZGF0YVsxXTogMHhkYwo+ID4gPiAg
ICAgIG5hbmQ6IGlkX2RhdGFbMl06IDB4OTAKPiA+ID4gICAgICBuYW5kOiBpZF9kYXRhWzNdOiAw
eDk1Cj4gPiA+ICAgICAgbmFuZDogaWRfZGF0YVs0XTogMHg1Ngo+ID4gPiAgICAgIG5hbmQ6IGlk
X2RhdGFbNV06IDB4MAo+ID4gPiAgICAgIG5hbmQ6IGlkX2RhdGFbNl06IDB4MAo+ID4gPiAgICAg
IG5hbmQ6IGlkX2RhdGFbN106IDB4MAo+ID4gPiAKPiA+ID4gICAgICBBY2Nyb2RpbmcgdGhlIHNj
aGVtYXRpYyBhbmQgdGhlIGRhdGFzaGVldCB0aGlzIGlzIHJpZ2h0Lgo+ID4gPiAKPiA+ID4gICAy
KSBUbyBkZXRlY3QgdGhlIE9ORkkgY29tcGF0aWJpbGl0eSB3ZSBub3cgaXNzdWU6ICAKPiA+ID4g
ICAgICAtPiBjbWRmdW5jKG10ZCwgTkFORF9DTURfUkVBRElEKSBBZGRyPTB4MjAgICAgCj4gPiA+
IAo+ID4gPiAgICAgIGFuZCBnZXR0aW5nIHRoZSBleHBlY3RlZCAnTycsJ04nLCdGJywnSScgc2ln
bmF0dXJlLgo+ID4gPiAKPiA+ID4gICAgMykgTm93IHdlIGFyZSB0cnlpbmcgdG8gUmVhZCB0aGUg
UEFSQU0gUGFnZSBieTogIAo+ID4gPiAgICAgICAtPiBjbWRmdW5jKG10ZCwgTkFORF9DTURfUEFS
QU0pCj4gPiA+ICAgICAgIC0+IHRyeSB0byByZWFkIHRoZSB0aGUgcGFyYW0gcGFnZSBhbmQgaWYg
bm90IHN1Y2Nlc3NmdWwgdHJ5IHRvICAgIAo+ID4gPiAgICAgICAgICByZWFkIHRoZSBjb3BpZXMu
Cj4gPiA+IAo+ID4gPiAgICAgICBIZXJlIHRoaW5ncyBnZXR0aW5nIGNyYXp5IHNpbmNlIHdlIGFy
ZSByZWFkaW5nIGFsbCB0aGUgdGltZSAnMHhmZicuCj4gPiA+IAo+ID4gPiAgICA0KSBTaW5jZSBC
YXJlYm94IChCb290bG9hZGVyKSBjYW4ndCByZWFkIHRoZSBPTkZJIHBhcmFtIHBhZ2Ugd2UKPiA+
ID4gICAgICAgY2FsY3VsYXRlIHRoZSB2YWx1ZXMgYXMgZXhwZWN0ZWQgZnJvbSB0aGUgcGFyYW0g
cGFnZS4gQnV0IG5vdyB3ZQo+ID4gPiAgICAgICBjYW4ndCBhY2Nlc3MgQkJUIChub3QgZm91bmQp
IG5vciB3ZSBhcmUgbm90IGFibGUgdG8gd3JpdGUgdG8gdGhlCj4gPiA+ICAgICAgIE9PQiBBcmVh
ICh0aGUgY2hpcCBpcyBub3Qgd3JpdGUgcHJvdGVjdGVkKS4KPiA+ID4gCj4gPiA+IFRoZSBlbGVj
dHJpY2FsIHNpZ25hbHMgYXJlIGxvb2tpbmcgZ29vZCBhbmQgc2luY2Ugd2UgY2FuIHJldHJpZXZl
IHRoZQo+ID4gPiBpZC1kYXRhIGl0IHNob3VsZCBiZSBubyBQQ0IgYnVnLiBEaWQgYW55b25lIHN0
cnVnZ2xlZCB3aXRoIHN1Y2ggcHJvYmxlbXMKPiA+ID4gdG9vPwo+ID4gPiAKPiA+ID4gQlRXOgo+
ID4gPiBJIGFsc28gZ2V0ICcweGZmJyBpZiBJIHNlbmQgYSBSRUFEX1VOSVFVRV9JRCBjb21tYW5k
IGFuZCB0cnlpbmcgdG8gcmVhZAo+ID4gPiB0aGUgMTYgY29waWVzIG9mIHRoZSAzMmJ5dGUgdW5p
cXVlLWlkLgo+ID4gPiAKPiA+ID4gQW55IGFuc3dlcnMgYXJlIHdlbGNvbWUgOikgIAo+ID4gCj4g
PiBDb3VsZCB5b3Ugc2hhcmUgbW9yZSBkZXRhaWxzIGFib3V0IHRoZSBzaXR1YXRpb24geW91ciBj
dXN0b21lciBpcwo+ID4gZmFjaW5nPyBEaWQgdGhpcyB3b3JrIGJlZm9yZT8gSXMgdGhpcyBhbiB1
cGRhdGU/IElmIHllcyBmcm9tIHdoYXQKPiA+IHZlcnNpb24gdG8gd2hhdCB2ZXJzaW9uPyBBbHNv
LCBpcyB0aGlzIGEgTGludXggb3IgQmFyZWJveCBpc3N1ZT8gIAo+IAo+IFRoaXMgaXNzdWUgZ2V0
J3MgdHJpZ2dlcmVkIHJpZ2h0IGFmdGVyIHRoZSBmaXJzdCBzdGFydC11cC4gU29tZSBkZXZpY2Vz
Cj4gZG8gd29yayBhbmQgc29tZSBvZiB0aGVtIGRvbid0IGFmdGVyIHRoZSBwcm9kdWN0aW9uLiBJ
IHRoaW5rIGl0J3Mgbm90IGEKPiBMaW51eCBub3IgYSBCYXJlYm94IGlzc3VlLiBTaW5jZSBCYXJl
Ym94IGNhbid0IGZpbmQgdGhlIEJCVCBhbmQgYWxsCj4gb3RoZXIgc3R1ZmYgSSBza2lwcGVkIHBy
b3BwZXIgTGludXggdGVzdHMuIEkgd2lsbCB0ZXN0IGlmIExpbnV4IGNhbgo+IGlkZW50aWZ5IGFu
ZCBzZXR1cCB0aGUgY2hpcC4gQnV0IEkgdGhpbmsgTGludXggd2lsbCBzZXRwIGludG8gdGhlIHNh
bWUKPiBOQU5ELUlzc3Vlcy4KPiAKPiBJIGFza2VkIG9uIHRoaXMgTUwgc2luY2UgeW91IGd1eXMg
YXJlIHRoZSBFeHBlcnRzIGhlcmUgYW5kIG1heWJlIHlvdSBoYWQKPiBzZWUgYSAnbm90IGZ1bGwg
cHJlZmFjdG9yZWQnIE5BTkQgZGV2aWNlIHRvby4KPiAKPiBSZWdhcmRzLAo+ICAgTWFyY28KClRo
YW5rcyBmb3IgZGV0YWlsaW5nLCBJIHVuZGVyc3RhbmQgeW91ciBwcm9ibGVtIG5vdy4gV2VsbCBJ
IGhvbmVzdGx5CmRvbid0IGhhdmUgYW55IGlkZWEgd2h5IGEgZmxhc2hpbmcgcHJvY2VzcyB3b3Vs
ZCB3b3JrIHdpdGggYSBjaGlwIGFuZAp0b3RhbGx5IGZhaWwgb3RoZXJ3aXNlLCBpZiBub3QgYSBo
YXJkd2FyZSBpc3N1ZS4gTWF5YmUgdGhlcmUgaXMgYQpjbG9ja2luZyBzcGVjaWZpY2l0eT8KClNv
cnJ5IGZvciBub3QgYmVpbmcgaGVscGZ1bCBhdCBhbGwgOikKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
