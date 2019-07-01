Return-Path: <SRS0=0U+/=U6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB0EC0650E
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 10:05:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32C7320881
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 10:05:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MkCYCHjP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32C7320881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rSxI5ADbY5IEDsgeyZWbF2TlZInfbZ4s0WEI3Vev58s=; b=MkCYCHjPsc473l
	d24AHbgQhfd5bU7S6QcsDKy84wVf5ODgboU7oVGYPNYG2x7xzFQ5kNTp7PD0cmayWDfp0WhyXrL9P
	I+ujiNmWaHUfDUUEoDx3scttFt3yokXnaMox8Nc7f4FaFQS9lE8qOwL6XdOEMX+h9pVNk4mmdi7B6
	QQeuTzSuOFYAqThwXmhgldoUS1eg5hVjVPaOg7ZrNFBUETHNNZMXJWh14TbDKOoqFtrMN78g4yPt+
	Wks4KXdrOReYnggdfvl2MM6061cg5wj3gV8LlFQWsz2f4eyeTe0fiSUe+J5GV0H+PZUJVk7rjkgMz
	S0OwgJv5dVEX9dDR6oGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhtBS-0006jB-Bi; Mon, 01 Jul 2019 10:05:14 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhtBP-0006eF-3c
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2019 10:05:12 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4E933C0009;
 Mon,  1 Jul 2019 10:04:55 +0000 (UTC)
Date: Mon, 1 Jul 2019 12:04:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Sroka <piotrs@cadence.com>
Subject: Re: [PATCH v2 1/2] mtd: nand: Add Cadence NAND controller driver
Message-ID: <20190701120454.6c8ac48e@xps13>
In-Reply-To: <20190701095143.GA21903@global.cadence.com>
References: <20190219161406.4340-1-piotrs@cadence.com>
 <20190219161823.22466-1-piotrs@cadence.com>
 <20190305190954.6c38d681@xps13>
 <20190321093356.GA19577@global.cadence.com>
 <20190512142426.11453a6c@xps13>
 <20190606151948.GA10565@global.cadence.com>
 <20190627181542.131aa061@xps13>
 <20190701095143.GA21903@global.cadence.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_030511_309902_69D301D7 
X-CRM114-Status: GOOD (  17.85  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Burton <paul.burton@mips.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, linux-mtd@lists.infradead.org,
 Dmitry Osipenko <digetx@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGlvdHIsCgpQaW90ciBTcm9rYSA8cGlvdHJzQGNhZGVuY2UuY29tPiB3cm90ZSBvbiBNb24s
IDEgSnVsIDIwMTkgMTA6NTE6NDUKKzAxMDA6CgoKWy4uLl0KPiA+PiA+PiA+Cj4gPj4gPj4gPlRo
aXMgZHJpdmVyIGlzIHdheSB0b28gbWFzc2l2ZSwgSSBhbSBwcmV0dHkgc3VyZSBpdCBjYW4gc2hy
aW5rIGEKPiA+PiA+PiA+bGl0dGxlIGJpdCBtb3JlLgo+ID4+ID4+ID5bLi4uXQo+ID4+ID4+ID4g
IAo+ID4+ID4+IEkgd2lsbCB0cnkgdG8gbWFrZSBpdCBzaG9yZXIgYnV0IGl0IHdpbGwgYmUgZGlm
dWN1bHQgdG8gYWNoaXZlLiBJdCBpcyBiZWNhdXNlIC0gdGhlcmUgYXJlIGEgbG90IG9mIGNhbGN1
bGF0aW9uIG5lZWRlZCBmb3IgUEhZICAgICAgLSBFQ0MgYXJlIGludGVybGVhdmVkIHdpdGggZGF0
YSAobGlrZSBvbiBtYXJ2ZWxsLW5hbmQgb3IgZ3BtaS1uYW5kKS4KPiA+PiA+PiAgICBUaGVyZWZv
cmU6ICAgICsgUkFXIG1vZGUgaXMgY29tcGxpY2F0ZWQgICAgKyBwcm90ZWN0aW5nIEJCTSBpbmNy
ZWFzZXMgbnVtYmVyIG9mIGxpbmVzIG9mIHNvdXJjZSBjb2RlCj4gPj4gPj4gLSBuZWVkIHRvIHN1
cHBvcnQgdHdvIERNQSBlbmdpbmVzIGludGVybmFsIGFuZCBleHRlcm5hbCAoc2xhdmUpIFdlIHdp
bGwgc2VlIG9uIG5leHQgcGF0Y2ggdmVyc2lvbiB3aGF0IGlzIHRoZSByZXN1bHQuICAgICAgVGhh
dCBwYWdlIGxheW91dCBsb29rczogIAo+ID4+ID4KPiA+PiA+TWF5YmUgeW91IGRvbid0IG5lZWQg
dG8gc3VwcG9ydCBib3RoIGludGVybmFsIGFuZCBleHRlcm5hbCBETUE/Cj4gPj4gPgo+ID4+ID5J
IGFtIHByZXR0eSBzdXJlIHRoZXJlIGFyZSByb29tcyBmb3Igc2l6ZSByZWR1Y3Rpb24uICAKPiA+
Pgo+ID4+IEkgZGVzY3JpYmUgaG93IGl0IHdvcmtzIGluIGdlbmVyYWwgYW5kIG1heWJlIHlvdSBo
ZWxwIG1lIGNob3NlIGJldHRlciBzb2x1dGlvbi4KPiA+Pgo+ID4+IEhXIGNvbnRyb2xsZXIgY2Fu
IHdvcmsgaW4gMyBtb2Rlcy4gUElPIC0gY2FuIHdvcmsgaW4gbWFzdGVyIG9yIHNsYXZlIERNQQo+
ID4+IENETUEgLSBuZWVkcyBNYXN0ZXIgRE1BIGZvciBhY2Nlc3NpbmcgY29tbWFuZCBkZXNjcmlw
dG9ycy4KPiA+PiBHZW5lcmljIG1vZGUgLSBjYW4gdXNlIG9ubHkgU2xhdmUgRE1BLgo+ID4+Cj4g
Pj4gR2VuZXJpYyBtb2RlIGlzIG5lY2Nlc3NlcnkgdG8gaW1wbGVtZW50IGZ1bmN0aW9ucyBvdGhl
ciB0aGFuIHBhZ2UKPiA+PiBwcm9ncmFtLCBwYWdlIHJlYWQsIGJsb2NrIGVyYXNlLiBTbyBpdCBp
cyBlc3NlbnRpYWwuIEkgY2Fubm90IGF2b2lkCj4gPj4gdG8gdXNlIFNsYXZlIERNQS4gIAo+ID4K
PiA+VGhpcyBkZXNlcnZlcyBhIG5pY2UgY29tbWVudCBhdCB0aGUgdG9wLiAgCj4gT2sgSSB3aWxs
IGFkZCB0aGUgbW9kZXMgZGVzY3JpcHRpb24gdG8gY292ZXIgbGV0dGVyLiA+CgpOb3Qgb25seSB0
byB0aGUgY292ZXIgbGV0dGVyOiBQZW9wbGUgcmVhZCB0aGUgY29kZS4gSW50ZXJlc3RlZCBwZW9w
bGUKbWlnaHQgYWxzbyByZWFkIHRoZSBjb21taXQgbG9nIHdoaWNoIGlzIHF1aXRlIGVhc3kgdG8g
ZmluZC4gVGhlIGNvdmVyCmxldHRlciBob3dldmVyIHdpbGwganVzdCBkaXNhcHBlYXIgaW4gdGhl
IGhpc3Rvcnkgb2YgdGhlIEludGVybmV0LiBJCndvdWxkIHJhdGhlciBwcmVmZXIgeW91IGV4cGxh
aW4gaG93IHRoZSBJUCB3b3JrcyBhdCB0aGUgdG9wIG9mIHRoZQpkcml2ZXIuCgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
