Return-Path: <SRS0=c5zc=3K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84473C2D0CE
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jan 2020 15:28:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56A6124125
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jan 2020 15:28:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aaRdwHct";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fbBQ0cRn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56A6124125
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pPdi+DSPOsLTgriIDFG9EaPUPUr4OJVcRD1sEd/1MS8=; b=aaRdwHctpLP+5i
	xt6XQGC8dSwfcLCNugd+MMhpMXXHO8+8ahKThD+TJblsQsmwvfKwNjjFWbX0bWHYHlGMu5q+OG3IR
	rQFVe7j3b5BAoeWPG3D4lOvpxN5NsZQsALt9BdNq58rUePMETbmJMqap3evN1DSpUC7vqkaOVwUXk
	MzVpEDpetd/Qzg+7yYSlJ2K4zJ5YwDquFIxSyFZcUtmBqdKXx0u8t84Fgix64+za3z/t9MSlWnv7M
	e7ns3h766U2YLaI3yrbRCJBj/JVq9cadsmfwhJuqqMVMCzTEi5Jo4Uu18SbCRMKjivik0QuxrnD5r
	LuvGFMGT0/NKmJ4dsCHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itvS7-0004wl-DM; Tue, 21 Jan 2020 15:28:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itvS5-0004wW-Ve
 for linux-mtd@bombadil.infradead.org; Tue, 21 Jan 2020 15:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gfw6YYLniJfxvaARvmGKlkV8FS2fHNxGx3xKyFl5+b4=; b=fbBQ0cRnHBI9v1c2Af7pyTs2cK
 BIsiIXkAQt8czSh9x6ZTsm6zMgfy6BdOQ1LeZL5nhtOL5CjXGMMMDPI5IzBrhNryth82AoQbdEzpt
 BZTyKkBT3LsxTQkpEE7yUQ42VMV6kNuLBM/vbZ2I6abNaBetN1VmXlaHw86i0VCGzraLhq5hb3RUy
 nzmR83h0b8Vpt8k2xgrCAZ5oH0tR0bQ3T3/YY1Ct+XNEm9V9YFSUcd5GnJnlvsW2W3rbDFhgZTP7m
 1FYwkAagQefjFY6Wf+hcQZlOqGBoarEdfhei17rS2S9NuZGGePwqJER+1kw/okf93u0riXSuLVBmF
 jnLe+XOg==;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itvSQ-0001Qt-13
 for linux-mtd@lists.infradead.org; Tue, 21 Jan 2020 15:28:50 +0000
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 3B12A10000F;
 Tue, 21 Jan 2020 15:27:36 +0000 (UTC)
Date: Tue, 21 Jan 2020 16:27:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
Subject: Re: [EXT] Re: [PATCH 3/4] mtd: spinand: Add M70A series Micron SPI
 NAND devices
Message-ID: <20200121162734.464123fd@xps13>
In-Reply-To: <MN2PR08MB6397EE91C508B6DA2263F3D6B80D0@MN2PR08MB6397.namprd08.prod.outlook.com>
References: <20200119145432.10405-1-sshivamurthy@micron.com>
 <20200119145432.10405-4-sshivamurthy@micron.com>
 <20200120111626.7cb2f6c5@xps13>
 <MN2PR08MB6397062A37D39287E820A0D8B80D0@MN2PR08MB6397.namprd08.prod.outlook.com>
 <20200121144034.05a8f49d@xps13>
 <MN2PR08MB6397EE91C508B6DA2263F3D6B80D0@MN2PR08MB6397.namprd08.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_152846_102935_D8702196 
X-CRM114-Status: GOOD (  31.72  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Shivamurthy Shastri <shiva.linuxworks@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2hpdmFtdXJ0aHksCgoiU2hpdmFtdXJ0aHkgU2hhc3RyaSAoc3NoaXZhbXVydGh5KSIgPHNz
aGl2YW11cnRoeUBtaWNyb24uY29tPiB3cm90ZSBvbgpUdWUsIDIxIEphbiAyMDIwIDE0OjU5OjEx
ICswMDAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gPiAKPiA+IEhpIFNoaXZhbXVydGh5LAo+ID4gCj4g
PiAiU2hpdmFtdXJ0aHkgU2hhc3RyaSAoc3NoaXZhbXVydGh5KSIgPHNzaGl2YW11cnRoeUBtaWNy
b24uY29tPiB3cm90ZQo+ID4gb24KPiA+IFR1ZSwgMjEgSmFuIDIwMjAgMTI6MjM6MjAgKzAwMDA6
Cj4gPiAgIAo+ID4gPiBIaSBNaXF1ZWwsCj4gPiA+ICAKPiA+ID4gPgo+ID4gPiA+IEhpIFNoaXZh
LAo+ID4gPiA+Cj4gPiA+ID4gVGhpcyBpcyByZW1hcmsgY29tbW9uIHRvIHRoZSBmb3VyIHBhdGNo
ZXM6IHlvdSBtaXNzIHRoZSAndjInIHByZWZpeCBpbgo+ID4gPiA+IHRoZSBvYmplY3QuCj4gPiA+
ID4gIAo+ID4gPgo+ID4gPiBTb3JyeSBmb3IgdGhpcyBtaXN0YWtlLgo+ID4gPiBJIHJlY29nbml6
ZWQgdGhpcyBhZnRlciBzZW5kaW5nIG91dCB0aGUgcGF0Y2hlcy4KPiA+ID4gIAo+ID4gPiA+IHNo
aXZhLmxpbnV4d29ya3NAZ21haWwuY29tIHdyb3RlIG9uIFN1biwgMTkgSmFuIDIwMjAgMTU6NTQ6
MzEgKzAxMDA6Cj4gPiA+ID4gIAo+ID4gPiA+ID4gRnJvbTogU2hpdmFtdXJ0aHkgU2hhc3RyaSA8
c3NoaXZhbXVydGh5QG1pY3Jvbi5jb20+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gQWRkIGRldmljZSB0
YWJsZSBmb3IgTTcwQSBzZXJpZXMgTWljcm9uIFNQSSBOQU5EIGRldmljZXMuCj4gPiA+ID4gPgo+
ID4gPiA+ID4gV2hpbGUgYXQgaXQsIGRpc2FibGUgdGhlIENvbnRpbnVvdXMgUmVhZCBmZWF0dXJl
IHdoaWNoIGlzIGVuYWJsZWQgYnkKPiA+ID4gPiA+IGRlZmF1bHQuICAKPiA+ID4gPgo+ID4gPiA+
IENhbiB5b3UgcGxlYXNlIGdpdmUgdXMgbW9yZSBkZXRhaWwgb24gd2h5IHRoaXMgaXMgYW4gaXNz
dWU/ICAKPiA+ID4KPiA+ID4gIkNvbnRpbnVvdXMgUmVhZCIgaXMgdGhlIG5ldyBmZWF0dXJlIGFk
ZGVkIGJ5IHRoZSBNaWNyb24gZm9yCj4gPiA+IE03MEEgc2VyaWVzIGRldmljZXMuIElmIHRoaXMg
ZmVhdHVyZSBpcyBlbmFibGVkLCB0aGUgUkVBRCBjb21tYW5kCj4gPiA+IGRvZXNuJ3Qgb3V0cHV0
IHRoZSBPT0IgYXJlYS4gVGhlIGZvbGxvd2luZyBzaG9ydCBkZXNjcmlwdGlvbgo+ID4gPiBkZXNj
cmliZXMgdGhpcyBmZWF0dXJlLgo+ID4gPgo+ID4gPiBEZXNjcmlwdGlvbjoKPiA+ID4gSWYgdGhl
IENvbnRpbnVvdXMgUmVhZCBmZWF0dXJlIGlzIGVuYWJsZWQsIHRoZSBkZXZpY2UgcHJvdmlkZXMK
PiA+ID4gdGhlIGNhcGFiaWxpdHkgdG8gcmVhZCB0aGUgd2hvbGUgYmxvY2sgd2l0aCBhIHNpbmds
ZSBjb21tYW5kLgo+ID4gPiBIb3dldmVyLCB0aGUgcmVhZCBjb21tYW5kIGRvZXNuJ3Qgb3V0cHV0
IHRoZSBPT0IgYXJlYS4KPiA+ID4KPiA+ID4gUmVhZCBjb21tYW5kIGJlaGF2aW9yIChpZiBDb250
aW51b3VzIFJlYWQgZW5hYmxlZCk6Cj4gPiA+IFRoZSBSRUFEIENBQ0hFIGNvbW1hbmQgZG9lc24n
dCByZXF1aXJlIHRoZSBzdGFydGluZyBjb2x1bW4gYWRkcmVzcy4KPiA+ID4gVGhlIGRldmljZSBh
bHdheXMgb3V0cHV0IHRoZSBkYXRhIHN0YXJ0aW5nIGZyb20gdGhlIGZpcnN0IGNvbHVtbiBvZiB0
aGUKPiA+ID4gY2FjaGUgcmVnaXN0ZXIsIGFuZCBvbmNlIHRoZSBlbmQgb2YgdGhlIGNhY2hlIHJl
Z2lzdGVyIHJlYWNoZWQsIHRoZSBkYXRhCj4gPiA+IG91dHB1dCBjb250aW51ZXMgdGhyb3VnaCB0
aGUgbmV4dCBwYWdlLiBXaXRoIHRoZSBjb250aW51b3VzIHJlYWQgbW9kZSwKPiA+ID4gaXQgaXMg
cG9zc2libGUgdG8gcmVhZCBvdXQgdGhlIGVudGlyZSBibG9jayB1c2luZyBhIHNpbmdsZSBSRUFE
IGNvbW1hbmQsIGFuZAo+ID4gPiBvbmNlIHRoZSBlbmQgb2YgdGhlIGJsb2NrIHJlYWNoZWQsIHRo
ZSBvdXRwdXQgcGlucyBiZWNvbWUgSGlnaC1aIHN0YXRlLiAgCj4gPiAKPiA+IE9rIEkgdW5kZXJz
dGFuZCBiZXR0ZXIuIEluIHRoaXMgY2FzZSB0aGVyZSBpcyBubyBuZWVkIHRvIHNwbGl0IHRoaXMK
PiA+IGNvbW1pdCwgaW5zdGVhZCBqdXN0IHJld29yZCB0aGUgY29tbWl0IGxvZyB0byBzb21ldGhp
bmcgbGlrZToKPiA+ICAgCj4gPiAtLS0+OC0tLSAgCj4gPiBBZGQgZGV2aWNlIHRhYmxlIGZvciBN
NzBBIHNlcmllcyBNaWNyb24gU1BJLU5BTkQgZGV2aWNlcy4KPiA+IAo+ID4gQXMgb3Bwb3NlZCB0
byB0aGUgTTYwQSBzZXJpZXMgYWxyZWFkeSBzdXBwb3J0ZWQsIE03MEEgcGFydHMgaGF2ZSB0aGUK
PiA+ICJDb250aW51b3VzIFJlYWQiIGZlYXR1cmUgZW5hYmxlZCBieSBkZWZhdWx0IHdoaWNoIGRv
ZXMgbm90IGZpdCB0aGUKPiA+IHN1YnN5c3RlbSBuZWVkcy4KPiA+IAo+ID4gPGhlcmUgZXhwbGFp
biB0aGUgZmVhdHVyZT4uCj4gPiAKPiA+IEhlbmNlLCB3ZSBkaXNhYmxlIHRoZSBmZWF0dXJlIGF0
IHByb2JlIHRpbWUuCj4gPiAtLS04PC0tLQo+ID4gICAKPiAKPiBTdXJlLCBJIHdpbGwgY2hhbmdl
IGFzIHBlciB5b3VyIHN1Z2dlc3Rpb24uCj4gCj4gPiBIb3dldmVyLCBiZWxvdywgeW91IGRpc2Fi
bGUgdGhpcyBiaXQgZm9yIGFsbCB0aGUgcGFydHMuIElzIHRoaXMgcmVhbGx5Cj4gPiBvaz8gU291
bGRuJ3Qgd2UgbWFrZSBpdCBtb3JlIHNwZWNpZmljIHRvIHRoaXMgc2VyaWVzPyAgCj4gCj4gSXQg
aXMgb2sgYmVjYXVzZSB0aGlzIGJpdCBpcyB1bnVzZWQgaW4gb3RoZXIgc2VyaWVzLgoKSSB3b3Vs
ZCByYXRoZXIgcHJlZmVyIHRvIGF2b2lkIHRoaXMga2luZCBvZiBhcnJhbmdlbWVudC4gUGxlYXNl
IGNoYW5nZQp0aGlzIGJpdCBvbmx5IGZvciB0aGUgc2VyaWVzIHdoaWNoIGhhcyBpdC4KCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
