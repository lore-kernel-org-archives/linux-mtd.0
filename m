Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536ABC4708D
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 10:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmdOWI5P1QBTpUKpen/fgraijJm//7toCJ2EtmHLNqg=; b=xAzSrcBQhCvG38
	YUx6AahpXSQPVsasO7HVHyISHT1HCz5T1TNz9mB6mz1RDmfpUH4C5pr0amPfD8dFqwVqGsG6Mg9jA
	IwHGc5JxJt27UduxU1ITMjAHDha/gy/Zh78W7VCpd4rsYBz9Fszs8AVKdkZKMMpxFvdU81wsP5aTt
	om1Og52oy6iz4VIGfLY1pd5rAie1r514tgmVULRZRzrj2AnzOg9ZQV2MJ7XaAOGOViAe+VO+WjsPL
	DbLMfI6YZ+b09njBmSU1AMew+kfV1aNvk/KJd/uOSdk1oBolJL5BQk0A2njR4EQZbBxnjYxxkTvGX
	u+bhv6+lG0la5OsYdVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13g8-00Fl5R-QN; Fri, 02 Dec 2022 10:54:00 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13fo-00Fkse-Qw; Fri, 02 Dec 2022 10:53:43 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BA35820004;
	Fri,  2 Dec 2022 10:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669978413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/xbDowsjdVxGHiCknMNfQWZp8ui3AZGVt031X2dFPgs=;
	b=V0G7HbGVHu1UnQcFOkheErwQ54WBVfssvbvblVvAgBmx2/cx07Wal5slnmzOCj2mHSdCZT
	YefGXDygzc/XOR2ApaE0zcUcJ/FkG6jbDuje8RBXRdeECWF405vrCpCnhxrHa4wNSA9zUK
	QR/nXDeMQLRr1AV/hpTTmGFTQg3Gx85OkgD6vYnqn17a721nUP6htat0+vYd6e3yCF+exk
	fT6byoQdarowANubLCUHizmAnEXebaR9HoPnF+DxHdq8xQV+tvW63souC5VUlj1QlFrF3I
	iTfpNzAyL5tomVH96yN3nCH/tadjyBct/q8cOc8gYi9AOOGxJVK4Kt9pVggE+Q==
Date: Fri, 2 Dec 2022 11:53:27 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, Marek Vasut
 <marex@denx.de>, Francesco Dolcini <francesco.dolcini@toradex.com>, Shawn
 Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is
 0
Message-ID: <20221202115327.4475d3a2@xps-13>
In-Reply-To: <Y4nSXQirO2N5IRfu@francesco-nb.int.toradex.com>
References: <20221202071900.1143950-1-francesco@dolcini.it>
	<20221202101418.6b4b3711@xps-13>
	<Y4nPmzdgaabg3a3/@francesco-nb.int.toradex.com>
	<Y4nSXQirO2N5IRfu@francesco-nb.int.toradex.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_025341_233222_0A9BFB23 
X-CRM114-Status: GOOD (  40.50  )
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

SGkgRnJhbmNlc2NvLAoKZnJhbmNlc2NvQGRvbGNpbmkuaXQgd3JvdGUgb24gRnJpLCAyIERlYyAy
MDIyIDExOjI0OjI5ICswMTAwOgoKPiBPbiBGcmksIERlYyAwMiwgMjAyMiBhdCAxMToxMjo0M0FN
ICswMTAwLCBGcmFuY2VzY28gRG9sY2luaSB3cm90ZToKPiA+IEhlbGxvIE1pcXVlbCwKPiA+IAo+
ID4gT24gRnJpLCBEZWMgMDIsIDIwMjIgYXQgMTA6MTQ6MThBTSArMDEwMCwgTWlxdWVsIFJheW5h
bCB3cm90ZTogIAo+ID4gPiBmcmFuY2VzY29AZG9sY2luaS5pdCB3cm90ZSBvbiBGcmksICAyIERl
YyAyMDIyIDA4OjE5OjAwICswMTAwOiAgCj4gPiA+ID4gRnJvbTogRnJhbmNlc2NvIERvbGNpbmkg
PGZyYW5jZXNjby5kb2xjaW5pQHRvcmFkZXguY29tPgo+ID4gPiA+IAo+ID4gPiA+IEFkZCBhIGZh
bGxiYWNrIG1lY2hhbmlzbSB0byBoYW5kbGUgdGhlIGNhc2UgaW4gd2hpY2ggI3NpemUtY2VsbHMg
aXMgc2V0Cj4gPiA+ID4gdG8gPDA+LiBBY2NvcmRpbmcgdG8gdGhlIERUIGJpbmRpbmcgdGhlIG5h
bmQgY29udHJvbGxlciBub2RlIHNob3VsZCBoYXZlCj4gPiA+ID4gc2V0IGl0IHRvIDAgYW5kIHRo
aXMgaXMgbm90IGNvbXBhdGlibGUgd2l0aCB0aGUgbGVnYWN5IHdheSBvZgo+ID4gPiA+IHNwZWNp
ZnlpbmcgcGFydGl0aW9ucyBkaXJlY3RseSBhcyBjaGlsZCBub2RlcyBvZiB0aGUgbmFuZC1jb250
cm9sbGVyIG5vZGUuICAKPiA+ID4gCj4gPiA+IEkgdW5kZXJzdGFuZCB0aGUgcHJvYmxlbSwgSSB1
bmRlcnN0YW5kIHRoZSBmaXgsIGJ1dCBJIGhhdmUgdG8gc2F5LCBJCj4gPiA+IHN0cm9uZ2x5IGRp
c2xpa2UgaXQgOikgVG91Y2hpbmcgYW4gbXRkIGNvcmUgZHJpdmVyIHRvIGZpeCBhIHNpbmdsZQo+
ID4gPiBicm9rZW4gdXNlIGNhc2UgbGlrZSB0aGF0IGlzLi4uIHByb2JsZW1hdGljLCBmb3IgdGhl
IGxlYXN0LiAgCj4gPiBJIGp1c3Qgbm90aWNlZCBpdCAyIGRheXMgYWZ0ZXIgdGhpcyBwYXRjaCB3
YXMgYmFja3BvcnRlZCB0byBhIHN0YWJsZQo+ID4ga2VybmVsLCBJIGFtIGp1c3QgdGhlIGZpcnN0
IG9uZSB0byBub3RpY2UsIHdlIGFyZSBub3QgdGFsa2luZyBhYm91dCBhIHNpbmdsZQo+ID4gdXNl
IGNhc2UuCj4gPiAgIAo+ID4gPiBJIGFtIHNvcnJ5IGJ1dCBpZiBhIDYuMCBrZXJuZWwgYnJlYWtz
IGJlY2F1c2U6ICAKPiA+IE5vdCBvbmx5IGtlcm5lbCA2LjAgaXMgY3VycmVudGx5IGJyb2tlbi4g
VGhpcyBwYXRjaCBpcyBnb2luZyB0byBiZQo+ID4gYmFja3BvcnRlZCB0byBhbnkgc3RhYmxlIGtl
cm5lbCBnaXZlbiB0aGUgZml4ZXMgdGFnIGl0IGhhcy4KPiA+ICAgCj4gPiA+IElmIHlvdSByZWFs
bHkgd2FudCB0byB3b3JrYXJvdW5kIFUtQm9vdCwgZWl0aGVyIHlvdSByZXZlcnQgdGhhdCBwYXRj
aAo+ID4gPiBvciB5b3UganVzdCBmaXggdGhlIERUIGRlc2NyaXB0aW9uIGluc3RlYWQuIFRoZSBw
YXJlbnQvY2hpbGQvcGFydGl0aW9ucwo+ID4gPiBzY2hlbWUgaGFzIGJlZW4gZW5mb3JjZWQgZm9y
IG1heWJlIDUgeWVhcnMgbm93IGFuZCBmb3IgYSBnb29kIHJlYXNvbjogYQo+ID4gPiBOQU5EIGNv
bnRyb2xsZXIgd2l0aCBwYXJ0aXRpb25zIGRvZXMgbm90IG1ha2UgX2FueV8gc2Vuc2UuIFRoZXJl
IGFyZQo+ID4gPiBwbGVudHkgb2YgZXhhbXBsZXMgb3V0IHRoZXJlLCBpbXg3LWNvbGlicmkuZHRz
aSBoYXMgcmVjZWl2ZWQgbWFueQo+ID4gPiB1cGRhdGVzIHNpbmNlIGl0cyBpbnRyb2R1Y3Rpb24g
KGZvciB0aGUgYmVzdCksIHNvIHdoeSBub3QgdGhpcyBvbmU/ICAKPiA+IAo+ID4gSSBjYW4gYW5k
IEkgd2lsbCB1cGRhdGUgaW14Ny1jb2xpYnJpLmR0c2kgKHBhdGNoIGNvbWluZyksCgo6dGh1bWJf
dXA6Cgo+ID4gYnV0IGlzIHRoaXMKPiA+IGdvb2QgZW5vdWdoIGdpdmVuIHRoZSBraW5kIG9mIGJv
b3QgZmFpbHVyZSByZWdyZXNzaW9uIHRoaXMgaW50cm9kdWNlPyBXZQo+ID4gYXJlIGdvaW5nIHRv
IGhhdmUgb2xkIHUtYm9vdCBhcm91bmQgdGhhdCB3aWxsIG5vdCB3b3JrIHdpdGggaXQsIGFuZCB0
aGUgIAo+IAo+IEp1c3QgYW5vdGhlciBwaWVjZSBvZiBpbmZvcm1hdGlvbiwgc3VwcG9ydCBmb3Ig
dGhlIHBhcnRpdGlvbnMgbm9kZSBpbgo+IFUtQm9vdCB3YXMgYWRkZWQgaW4gdmVyc2lvbiB2MjAy
Mi4wNCBbMV0sIHdlIGFyZSBub3QgdGFsa2luZyBhYm91dCBhbmNpZW50Cj4gb2xkIGxlZ2FjeSBz
dHVmZi4KCklmIGl0IGlzIHNvIHJlY2VudCwgdGhlbiB0aGlzIGlzIHdoYXQgbmVlZHMgdG8gYmUg
Zml4ZWQsIGFuZCBpdCBzaG91bGQKbm90IGJvdGhlciAibWFueSIgcGVvcGxlIGJlY2F1c2UgMjAy
Mi4wNCBpcyBub3Qgc28gb2xkLgoKU28gSSBhbSBhIGJpdCBsb3N0LCBJSVVDIHdoYXQgaXMgY3Vy
cmVudGx5IGJyb2tlbiBpczoKLSBVLUJvb3QgPiAyMDIyLjA0IGFuZCBhbnkgdmVyc2lvbiBvZiBM
aW51eCB3aXRoIHRoZSBiYWNrcG9ydD8KCj4gSWYgSSBhZGQgdGhlIHBhcnRpdGlvbnMgbm9kZSBh
cyBhIGNoaWxkIG9mIG15IG5hbmQgY29udHJvbGxlciwgYXMgSSB3YXMKPiBwbGFubmluZyB0byBk
byBhbmQgSSB3cm90ZSAxMCBsaW5lcyBhYm92ZSwgSSB3aWxsIGNyZWF0ZSBhIG5ldyBmbGF2b3Ig
b2YKPiBub24tYm9vdGluZyBzeXN0ZW0gd2l0aCBVLUJvb3Qgb2xkZXIgdGhhbiB2MjAyMi4wNCA6
LS8KCkkgdGhpbmsgdGhlcmUgaXMgYSBsaXR0bGUgY29uZnVzaW9uIGhlcmUuIFlvdSBhcmUgcmVm
ZXJyaW5nIHRvIHRoZSBOQU5ECmNvbnRyb2xsZXIgbm9kZSwgdGhlIGNvbW1pdCByZWZlcnMgdG8g
dGhlIE5BTkQgY2hpcCBub2RlLiBXaGF0IHRoaXMKY29tbWl0IGRvZXMgbG9va3MgZmluZSBiZWNh
dXNlIGl0IGp1c3QgdHJpZXMgdG8gdXNlIHRoZSBwYXJ0aXRpb25zIHt9Cm5vZGUgcmF0aGVyIHRo
YW4gdGhlIE5BTkQgY2hpcCBub2RlIGFuZCBpZiB0aGUgcGFydGl0aW9ucyB7fSBub2RlCmFscmVh
ZHkgZXhpc3QsIEkgZXhwZWN0ICNhZGRyZXNzLWNlbGxzIGFuZCAjc2l6ZS1jZWxscyB0byBiZSBk
ZWZpbmVkCmFuZCBiZSAhPSAwIGFscmVhZHkuCgpIZXJlIGlzIGEgcHJvcGVyIGRlc2NyaXB0aW9u
OgoKbmFuZC1jb250cm9sbGVyIHsKCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJI3NpemUtY2VsbHMg
PSA8MD47CgluYW5kLWNoaXAgewoJCXBhcnRpdGlvbnMgewoJCQkjYWRkcmVzcy1jZWxscyA9IDwx
IG9yIDI+OwoJCQkjc2l6ZS1jZWxscyA9IDwxIG9yIDI+OwoJCQlwYXJ0aXRpb25AeCB7IH07CgkJ
CXBhcnRpdGlvbkB5IHsgfTsKCQl9OwoJfTsKCgkvKiBIZXJlIHlvdSBjYW4gdmVyeSB3ZWxsIGhh
dmUgYW5vdGhlciBuYW5kLWNoaXAgbm9kZSB3aXRoCgkgKiBhbm90aGVyIHJlZyBwcm9wZXJ0eSB3
aGljaCByZXByZXNlbnRzIGl0cyBvd24gQ1MgYW5kIGFub3RoZXIKCSAqIHNldCBvZiBwYXJ0aXRp
b25zLgoJICovCn07Cgo+IFUtQm9vdCBvbGRlciB0aGFuIHYyMDIyLjA0IHdpbGwgdXBkYXRlIHRo
ZSBuYW5kIGNvbnRyb2xsZXIgbm9kZSBuZXZlcgo+IHRoZSBsZXNzLCB0aGUgcGFydGl0aW9uIG5v
ZGUgd2lsbCBzdGlsbCBiZSB0aGVyZSBhbmQgTGludXggd2lsbCB1c2UgaXQsCj4gYnV0IGl0IHdp
bGwgYmUgZW1wdHkgc2luY2Ugbm9ib2R5IHBvcHVsYXRlIGl0Lgo+IAo+IEZyYW5jZXNjbwo+IAo+
IFsxXSBjb21taXQgMzZmZWUyZjc2MjFlICgiY29tbW9uOiBmZHRfc3VwcG9ydDogYWRkIHN1cHBv
cnQgZm9yICJwYXJ0aXRpb25zIiBzdWJub2RlIHRvIGZkdF9maXh1cF9tdGRwYXJ0cygpIikKCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
