Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67031C282C2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 22:20:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34D8F2147C
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 22:20:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RQP73lBd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34D8F2147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQukAphl0F6RvMxreAwt2uxo7NPWkW+c6pZ+XMBGpsE=; b=RQP73lBd9OddYg
	2nAy1fIwE3apkc9CezmF53QTjil87jy0jw2NPoworCfg6ikAHzbtkY7iOC7LJ4oCAr5b9DyrS+U6v
	XaPJSYGDsaej9ifvgPIUqrpMfN8eDEwtV5tjAIurPc6dI0BDvUEQxOS6849P6eXLfIYUfHBIPojDQ
	mO/LEvaUREOdYIWRJ7wMBusTsUReGeUqATMug/LevbfGiYwtnEgScemqUHDXsFS+Kw+hFUwj5tQZ6
	hiDKHiZSJpj1BY71mbk95YcQ6jLlBpiVh4yuOOjc8JyFF8qQLpUqvvKkkcCReGn81LbrX4CvxyvCf
	Bdznzum0q+3GzP2IVPvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grs2H-0008Ij-9o; Thu, 07 Feb 2019 22:20:45 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grs2E-0008IN-AK
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 22:20:44 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 2FA8F100003;
 Thu,  7 Feb 2019 22:20:29 +0000 (UTC)
Date: Thu, 7 Feb 2019 23:20:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH] mtd: rawnand: denali_dt: remove single anonymous clock
 support
Message-ID: <20190207232028.26b4a7f5@xps13>
In-Reply-To: <ea245b53-59c9-0d7f-f33a-44aa93db99ac@kernel.org>
References: <1547539894-12898-1-git-send-email-yamada.masahiro@socionext.com>
 <20190115092229.59e09c2d@xps13>
 <CAK7LNATnfTQXHrXJQp7732-e7hvd8ORcYubyDmz0KHaRXRMDqQ@mail.gmail.com>
 <20190128112007.440046e6@xps13>
 <da2ea926-30e9-c7b9-8b1f-ee65ccc0fb7a@kernel.org>
 <20190131182644.366a54a5@bbrezillon>
 <20190205141853.4b7ed954@xps13>
 <ea245b53-59c9-0d7f-f33a-44aa93db99ac@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_142042_506844_03039F85 
X-CRM114-Status: GOOD (  16.96  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRGluaCwKCkRpbmggTmd1eWVuIDxkaW5ndXllbkBrZXJuZWwub3JnPiB3cm90ZSBvbiBUaHUs
IDcgRmViIDIwMTkgMTI6MTc6NTAKLTA2MDA6Cgo+IE9uIDIvNS8xOSA3OjE4IEFNLCBNaXF1ZWwg
UmF5bmFsIHdyb3RlOgo+ID4gSGkgRGluaCwKPiA+IAo+ID4gQm9yaXMgQnJlemlsbG9uIDxiYnJl
emlsbG9uQGtlcm5lbC5vcmc+IHdyb3RlIG9uIFRodSwgMzEgSmFuIDIwMTkKPiA+IDE4OjI2OjQ0
ICswMTAwOgo+ID4gICAKPiA+PiBIaSBEaW5oLAo+ID4+Cj4gPj4gT24gVGh1LCAzMSBKYW4gMjAx
OSAxMToyNDoxNiAtMDYwMAo+ID4+IERpbmggTmd1eWVuIDxkaW5ndXllbkBrZXJuZWwub3JnPiB3
cm90ZToKPiA+PiAgCj4gPj4+IE9uIDEvMjgvMTkgNDoyMCBBTSwgTWlxdWVsIFJheW5hbCB3cm90
ZTogICAgCj4gPj4+PiBIaSBEaW5oLAo+ID4+Pj4KPiA+Pj4+IE1hc2FoaXJvIFlhbWFkYSA8eWFt
YWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+IHdyb3RlIG9uIFdlZCwgMTYgSmFuCj4gPj4+PiAy
MDE5IDEwOjI3OjExICswOTAwOgo+ID4+Pj4gICAgICAgCj4gPj4+Pj4gKCtDQyBEaW5oIE5ndXll
bikKPiA+Pj4+Pgo+ID4+Pj4+IE9uIFR1ZSwgSmFuIDE1LCAyMDE5IGF0IDU6MjIgUE0gTWlxdWVs
IFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6ICAgICAgCj4gPj4+Pj4+
Cj4gPj4+Pj4+IEhpIE1hc2FoaXJvLAo+ID4+Pj4+Pgo+ID4+Pj4+PiBNYXNhaGlybyBZYW1hZGEg
PHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPiB3cm90ZSBvbiBUdWUsIDE1IEphbgo+ID4+
Pj4+PiAyMDE5IDE3OjExOjM0ICswOTAwOgo+ID4+Pj4+PiAgICAgICAgCj4gPj4+Pj4+PiBDb21t
aXQgNmYxZmU5N2JlYzM0ICgibXRkOiByYXduYW5kOiBkZW5hbGlfZHQ6IGFkZCBtb3JlIGNsb2Nr
cyBiYXNlZAo+ID4+Pj4+Pj4gb24gSVAgZGF0YXNoZWV0IikgaW50cm9kdWNlZCBhIG1vcmUgY29y
cmVjdCBiaW5kaW5nIHRoYXQgcmVxdWlyZXMKPiA+Pj4+Pj4+IHRocmVlIG5hbWVkIGNsb2Nrcy4K
PiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBOb3cgdGhhdCBhbGwgdXBzdHJlYW0gRFQgZmlsZXMgbWlncmF0
ZWQgb3ZlciB0byBpdCwgcmVtb3ZlIHRoZSBzaW5nbGUKPiA+Pj4+Pj4+IGFub255bW91cyBjbG9j
ayBzdXBwb3J0LiAgICAgICAgCj4gPj4+Pj4+Cj4gPj4+Pj4+IEkgd291bGQgbG92ZSB0byBkbyB0
aGF0IGJ1dCBJIHRoaW5rIHRoaXMgaXMgYWdhaW5zdCB0aGUgIkRUIGJhY2t3YXJkCj4gPj4+Pj4+
IGNvbXBhdGliaWxpdHkgcnVsZSIuICAgICAgICAKPiA+Pj4+Pgo+ID4+Pj4+IFllYWgsIEkga25v
dyB0aGlzIHJ1bGUsIGJ1dCB3ZSBicmVhayBEVCBiaW5kaW5nIGZyb20gdGltZSB0byB0aW1lLgo+
ID4+Pj4+Cj4gPj4+Pj4KPiA+Pj4+PiAgICAgIAo+ID4+Pj4+PiBBbnl3YXksIElJUkMgaXQgaXMg
YWNjZXB0ZWQgdGhhdCB0aGlzIGtpbmQgb2YKPiA+Pj4+Pj4gcnVsZSBtaWdodCBiZSBicm9rZW4g
aWYgZGVjaWRlZCBwZXIgdGhlIGFyY2gtbWFpbnRhaW5lciAoaW4gdGhpcwo+ID4+Pj4+PiBjYXNl
LCB5b3UgSSBzdXBwb3NlKS4gU28gaWYgdGhpcyBpcyByZWFsbHkgd2hhdCB5b3Ugd2FudCwgSSds
bCBxdWV1ZQo+ID4+Pj4+PiBpdC4gICAgICAgIAo+ID4+Pj4+Cj4gPj4+Pj4gTXkgcGxhdGZvcm0g
aXMgZmluZSwgYnV0IHRoaXMgZHJpdmVyIGlzIHVzZWQgYnkgU09DRlBHQSBib2FyZHMgYXMgd2Vs
bC4KPiA+Pj4+Pgo+ID4+Pj4+IEkgQ0NlZCB0aGUgU09DRlBHQSBtYWludGFpbmVyLCBEaW5oIE5n
dXllbi4KPiA+Pj4+PiAgICAgIAo+ID4+Pj4KPiA+Pj4+IEdlbnRsZSBwaW5nIG9uIHRoaXMgdG9w
aWMuCj4gPj4+PiAgICAgICAKPiA+Pj4KPiA+Pj4gVGhpcyBwYXRjaCBsb29rcyBmaW5lIHRvIGJl
LiBGZWVsIGZyZWUgdG8gYWRkOgo+ID4+Pgo+ID4+PiBUZXN0ZWQtYnk6IERpbmggTmd1eWVuIDxk
aW5ndXllbkBrZXJuZWwub3JnPiAgICAKPiA+Pgo+ID4+IEkgdGhpbmsgTWlxdWVsIGlzIHdhaXRp
bmcgZm9yIGFuIEFja2VkLWJ5IHRvIGNvbmZpcm0gdGhhdCB5b3UncmUgb2theQo+ID4+IGJyZWFr
aW5nIGJhY2t3YXJkIGNvbXBhdCB3aXRoIG9sZCBEVC4gIAo+ID4gCj4gPiBZZXMsIEkgYW0gd2Fp
dGluZyBmb3IgeW91ciBBY2tlZC1ieS4KPiA+IAo+ID4gICAKPiAKPiBBY2tlZC1ieTogRGluaCBO
Z3V5ZW4gPGRpbmd1eWVuQGtlcm5lbC5vcmc+Cj4gCj4gRGluaAoKQXBwbGllZCB0byBuYW5kL25l
eHQuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
