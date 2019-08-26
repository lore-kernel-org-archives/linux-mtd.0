Return-Path: <SRS0=O+vu=WW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28DEC3A59E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 07:24:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6E27206BA
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 07:24:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f3xWJTlY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6E27206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o0MITUXLWOyjx3HviI7DiTxaDP1gRvrHP6oiu7uK+ko=; b=f3xWJTlYKNn8hq
	WBgcoj0rPHqy0YHX0uf2Zm6EIaUfV3YxL5ARllQ1XdgVtG7RCR1uNBKroOw+MDUKoTRoob/SpcOW9
	qoStrL3chVJxdXKPPb3+cgau43W7McA5a0yoRNN/HQAqLpeCjlKQ5TuE9yj0GZ0iVaB+yg7NOTWDc
	g5WVoE9EklsHPLQ2Y6bqn8Ex1i4u6vESOWYyv8Bt/DC4t6ARTyUBry0+fGD3nOy08VYoiAwQbk9/i
	6js6s+mwtZ/F+vOJo+Pgup63P6n7nXVyX14QXDoG7UEVwmDAYH99W8HawU3+efovy5O09ZbVInqYy
	tXbLonBSnpGR1U7LtW4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i29MF-0007vz-9W; Mon, 26 Aug 2019 07:24:07 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i29MA-0007vD-V6
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2019 07:24:04 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id AB25360002;
 Mon, 26 Aug 2019 07:23:45 +0000 (UTC)
Date: Mon, 26 Aug 2019 09:23:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH] Add support for Macronix NAND randomizer
Message-ID: <20190826092344.7b23ede1@xps13>
In-Reply-To: <OFF725800E.8B26D2E9-ON48258462.000B94B2-48258462.000FCB85@mxic.com.tw>
References: <1566280428-4159-1-git-send-email-masonccyang@mxic.com.tw>
 <20190824130329.68f310aa@xps13>
 <OFF725800E.8B26D2E9-ON48258462.000B94B2-48258462.000FCB85@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_002403_153903_1F4FE5FE 
X-CRM114-Status: GOOD (  18.98  )
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
Cc: kstewart@linuxfoundation.org, vigneshr@ti.com, bbrezillon@kernel.org,
 juliensu@mxic.com.tw, richard@nod.at, linux-kernel@vger.kernel.org,
 frieder.schrempf@kontron.de, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, tglx@linutronix.de, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgptYXNvbmNjeWFuZ0BteGljLmNvbS50dyB3cm90ZSBvbiBNb24sIDI2IEF1ZyAy
MDE5IDEwOjUyOjMxICswODAwOgoKPiBIaSBNaXF1ZWwsCj4gPiAKPiA+IE1hc29uIFlhbmcgPG1h
c29uY2N5YW5nQG14aWMuY29tLnR3PiB3cm90ZSBvbiBUdWUsIDIwIEF1ZyAyMDE5IDEzOjUzOjQ4
Cj4gPiArMDgwMDoKPiA+ICAgCj4gPiA+IE1hY3Jvbml4IE5BTkRzIHN1cHBvcnQgcmFuZG9taXpl
ciBvcGVyYXRpb24gZm9yIHVzZXIgZGF0YSBzY3JhbWJsZWQsCj4gPiA+IHdoaWNoIGNhbiBiZSBl
bmFibGVkIHdpdGggYSBTRVRfRkVBVFVSRS4KPiA+ID4gCj4gPiA+IFVzZXIgZGF0YSB3cml0dGVu
IHRvIHRoZSBOQU5EIGRldmljZSB3aXRob3V0IHJhbmRvbWl6ZXIgaXMgc3RpbGwgICAKPiByZWFk
YWJsZQo+ID4gPiBhZnRlciByYW5kb21pemVyIGZ1bmN0aW9uIGVuYWJsZWQuCj4gPiA+IFRoZSBw
ZW5hbHR5IG9mIHJhbmRvbWl6ZXIgYXJlIE5PUCA9IDEgaW5zdGVhZCBvZiBOT1AgPSA0IGFuZCBt
b3JlIHRpbWUgICAKPiBwZXJpb2QKPiA+IAo+ID4gcGxlYXNlIGRvbid0IHVzZSAnTk9QJyBoZXJl
LCB1c2UgJ3N1YnBhZ2UgYWNjZXNzZXMnIGluc3RlYWQsIG90aGVyd2lzZQo+ID4gcGVvcGxlIG1p
Z2h0IG5vdCB1bmRlcnN0YW5kIHdoYXQgaXQgbWVhbnMgd2hpbGUgaXQgaGFzIGEgcmVhbCBpbXBh
Y3QuCj4gPiAgIAo+IAo+IG9rYXksIHVuZGVyc3Rvb2QuIAo+IHdpbGwgZml4IGl0IGJ5IG5leHQg
c3VibWl0dGluZy4KPiAKPiA+ID4gaXMgbmVlZGVkIGluIHByb2dyYW0gb3BlcmF0aW9uIGFuZCBl
bnRlcmluZyBkZWVwIHBvd2VyLWRvd24gbW9kZS4KPiA+ID4gaS5lLiwgdFBST0cgMzAwdXMgdG8g
MzQwdXMocmFuZG9taXplciBlbmFibGVkKQo+ID4gPiAKPiA+ID4gSWYgc3VicGFnZSB3cml0ZSBu
b3QgYXZhaWxhYmxlIHdpdGggaGFyZHdhcmUgRUNDLCBmb3IgZXhhbXBsZSwKPiA+ID4gTkFORCBj
aGlwIG9wdGlvbnMgTkFORF9OT19TVUJQQUdFX1dSSVRFIGJlIHNldCBpbiBkcml2ZXIgYW5kCj4g
PiA+IHJhbmRvbWl6ZXIgZnVuY3Rpb24gaXMgcmVjb21tZW5kZWQgZm9yIGhpZ2gtcmVsaWFiaWxp
dHkuCj4gPiA+IERyaXZlciBjaGVja3MgYnl0ZSAxNjcgb2YgVmVuZG9yIEJsb2NrcyBpbiBPTkZJ
IHBhcmFtZXRlciBwYWdlIHRhYmxlCj4gPiA+IHRvIHNlZSBpZiB0aGlzIGhpZ2gtcmVsaWFiaWxp
dHkgZnVuY3Rpb24gaXMgc3VwcG9ydGVkLgo+ID4gPiAgIAo+ID4gCj4gPiBZb3UgZGlkIG5vdCBm
bGFnZ2VkIHRoaXMgcGF0Y2ggYXMgYSB2MiBhbmQgZm9yZ290IGFib3V0IHRoZSBjaGFuZ2Vsb2cu
ICAKPiAKPiB3aWxsIGZpeCwgdGhhbmsgeW91Lgo+IAo+ID4gWW91IGRpZCBub3QgbGlzdGVuIHRv
IG91ciBjb21tZW50cyBpbiB0aGUgbGFzdCB2ZXJzaW9uIG5laXRoZXIuIEkgd2FzCj4gPiBvcGVu
IHRvIGEgc29sdXRpb24gd2l0aCBhIHNwZWNpZmljIERUIHByb3BlcnR5IGZvciB3YXJuZWQgdXNl
cnMgYnV0IEkKPiA+IGRvbid0IHNlZSBpdCBjb21pbmcuICAKPiAKPiBTb3JyeSBJIG1pc3NlZCB0
aGUgcHJldmlvdXMgdmVyc2lvbiBvZiAicmVhZC1yZXRyeSBhbmQgcmFuZG9taXplciBzdXBwb3J0
IiAKPiBwYXRjaC4gCj4gU3BlY2lmaWMgRFQgcHJvcGVydHkgaXMgYSBnb29kIG1ldGhvZCB0byBj
b250cm9sIGl0Lgo+IAo+IEZvciBtb3JlIGhpZ2gtcmVsaWFiaWxpdHkgY29uY2VybiwgcmFuZG9t
aXplciBpcyByZWNvbW1lbmRlZCB0byBlbmFibGUgYnkgCj4gZGVmYXVsdCwKPiBidXQgc3ViLXBh
Z2Ugd3JpdGUgaXMgbm90IGFsbG93ZWQgd2hlbiByYW5kb21pemVyIGlzIGVuYWJsZWQuCj4gCj4g
U2luY2UgbW9zdCBvZiBIVyBFQ0MgZGlkIG5vdCBzdXBwb3J0IHN1Yi1wYWdlIHdyaXRlIGFuZCB3
ZSB0aGluayBkcml2ZXIgdG8gCj4gY2hlY2sKPiBjaGlwIG9wdGlvbnMgZmxhZ3MgaXMgYW5vdGhl
ciBzaW1wbGUgYW5kIGdvb2Qgd2F5IHRvIGVuYWJsZSByYW5kb21pemVyLgoKU29ycnkgYnV0IHRo
aXMgaXMgd3JvbmcuIFNldmVyYWwgY29udHJvbGxlcnMgYW5kIE5BTkQgY2hpcHMgc3VwcG9ydApz
dWJwYWdlcy4gQW5kIGNoYW5naW5nIG5vdyB0aGUgYmVoYXZpb3Igd2l0aCBzdWNoIGNoaXBzIHdv
dWxkIGVudGlyZWx5CmJyZWFrIHRoZSBjb25jZXJuZWQgc2V0dXBzIChzZWUgQm9yaXMgYW5zd2Vy
IGFib3V0IFVCSSBjb21wbGFpbmluZyBpZgp0aGUgc3VicGFnZSBzaXplIGNoYW5nZXMpLgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
