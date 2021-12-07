Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF88C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 08:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oMKG6qj5BIfCn1FaoqXiX4SATUKQWJ+LZbMNz3PH7Tk=; b=L8nsjOOJ26/qXe
	QW8RQpC9pvExaCb5iOL2O8YLzGnGcITbFqyHRpc3YopRFh9Kld7yrHim5mGkws+2Mm3UF/+oRm7R8
	I28Hh/O38KeydfJh74ts9lSSYJDOmW3njv+L92KThMvMjnb8Hcz5iq/K6npq7gGqpu+KpdHESJcg+
	NUjXJ98YkRVkzS9caWUZhxKge424VefuFnB/RJrycCAVbnV5oX9IXgvuJiMOgfe75yc3V7MbHZfxT
	NaYzkpiu9/tZ4MnynClAMxun9nt1LhUpZhJyDCqZjs/YiCn5KE8XIWpOeSKSvULNJOGqMiAhQvkRU
	1flMkHrhV3A2eJs3+M7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muWJN-007ett-5m; Tue, 07 Dec 2021 08:58:57 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muW54-007anD-JV
 for linux-mtd@lists.infradead.org; Tue, 07 Dec 2021 08:44:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9A91E20000C;
 Tue,  7 Dec 2021 08:44:06 +0000 (UTC)
Date: Tue, 7 Dec 2021 09:44:05 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <p.yadav@ti.com>,
 <michael@walle.cc>, <linux-mtd@lists.infradead.org>, <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <thomas.petazzoni@bootlin.com>,
 <monstr@monstr.eu>, <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: mtd: spi-nor: Allow two CS per device
Message-ID: <20211207094405.6083b141@xps13>
In-Reply-To: <e5d05d00-8823-f9a2-156e-ac0c268d705c@microchip.com>
References: <20211206095921.33302-1-miquel.raynal@bootlin.com>
 <20211206095921.33302-2-miquel.raynal@bootlin.com>
 <e5d05d00-8823-f9a2-156e-ac0c268d705c@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_004410_821929_7ED6363E 
X-CRM114-Status: GOOD (  20.65  )
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

SGVsbG8gVHVkb3IsCgpUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20gd3JvdGUgb24gVHVlLCA3
IERlYyAyMDIxIDA3OjE2OjExICswMDAwOgoKPiBIaSwgTWlxdWVsLAo+IAo+IE9uIDEyLzYvMjEg
MTE6NTkgQU0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90
IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250
ZW50IGlzIHNhZmUKPiA+IAo+ID4gVGhlIFhpbGlueCBRU1BJIGNvbnRyb2xsZXIgaGFzIHR3byBh
ZHZhbmNlZCBtb2RlcyB3aGljaCBhbGxvdyB0aGUKPiA+IGNvbnRyb2xsZXIgdG8gYmVoYXZlIGRp
ZmZlcmVudGx5IGFuZCBjb25zaWRlciB0d28gZmxhc2hlcyBhcyBvbmUgc2luZ2xlCj4gPiBzdG9y
YWdlLgo+ID4gCj4gPiBPbmUgb2YgdGhlc2UgdHdvIG1vZGVzIGlzIHF1aXRlIGNvbXBsZXggdG8g
c3VwcG9ydCBmcm9tIGEgYmluZGluZyBwb2ludAo+ID4gb2YgdmlldyBhbmQgaXMgdGhlIGR1YWwg
cGFyYWxsZWwgbWVtb3JpZXMuIEluIHRoaXMgbW9kZSwgZWFjaCBieXRlIG9mCj4gPiBkYXRhIGlz
IHN0b3JlZCBpbiBib3RoIGRldmljZXM6IHRoZSBldmVuIGJpdHMgaW4gb25lLCB0aGUgb2RkIGJp
dHMgaW4KPiA+IHRoZSBvdGhlci4gVGhlIHNwbGl0IGlzIGF1dG9tYXRpY2FsbHkgaGFuZGxlZCBi
eSB0aGUgUVNQSSBjb250cm9sbGVyIGFuZAo+ID4gaXMgdHJhbnNwYXJlbnQgZm9yIHRoZSB1c2Vy
Lgo+ID4gCj4gPiBUaGUgb3RoZXIgbW9kZSBpcyBzaW1wbGVyIHRvIHN1cHBvcnQsIGl0IGlzIGNh
bGxlZCBkdWFsIHN0YWNrZWQKPiA+IG1lbW9yaWVzLiBUaGUgY29udHJvbGxlciBzaGFyZXMgdGhl
IHNhbWUgU1BJIGJ1cyBidXQgZWFjaCBvZiB0aGUgZGV2aWNlcwo+ID4gY29udGFpbiBoYWxmIG9m
IHRoZSBkYXRhLiBPbmNlIGluIHRoaXMgbW9kZSwgdGhlIGNvbnRyb2xsZXIgZG9lcyBub3QKPiA+
IGZvbGxvdyBDUyByZXF1ZXN0cyBidXQgaW5zdGVhZCBpbnRlcm5hbGx5IHdpcmVzIHRoZSB0d28g
Q1MgbGV2ZWxzIHdpdGgKPiA+IHRoZSB2YWx1ZSBvZiB0aGUgbW9zdCBzaWduaWZpY2FudCBhZGRy
ZXNzIGJpdC4gIAo+IAo+IFRoZSBzdGFja2VkIG1vZGUgdGhhdCB5b3UgZGVzY3JpYmUgc2VlbXMg
cGFydGljdWxhciB0byBhIHNwZWNpZmljCj4gdmVuZG9yLiBUaGVyZSBhcmUgbXVsdGkgZGllIE5P
UiBmbGFzaGVzIHdoaWNoIGRvIG5vdCByZXF1aXJlIGFueQo+IGNvbnRyb2xsZXIgaW50ZXJ2ZW50
aW9uLCB0aGUgbG9naWMgaXMgaGVsZCBhdCB0aGUgZmxhc2ggbGV2ZWw6Cj4gaHR0cHM6Ly9tZWRp
YS13d3cubWljcm9uLmNvbS8tL21lZGlhL2NsaWVudC9nbG9iYWwvZG9jdW1lbnRzL3Byb2R1Y3Rz
L3RlY2huaWNhbC1ub3RlL25vci1mbGFzaC90bjI1MDVfbjI1cV9tdDI1cV9zdGFja2VkX2Rldmlj
ZXMucGRmP3Jldj03YTIzY2M5NTIzOGU0NmY3YjIyZTJhOWY2YmM3MzZiNwo+IAo+IENhbiB5b3Ug
cG9pbnQgdXMgdG8gd2hpY2gga2luZCBvZiBtZW1vcmllcyB5b3UncmUgd2lsbGluZyB0byBhZGQK
PiBzdXBwb3J0IGZvcj8gU29tZSBkYXRhc2hlZXRzIHdpbGwgYmUgYmVzdC4KClVuZm9ydHVuYXRl
bHkgSSBkb24ndCBoYXZlIGFueSBkYXRhc2hlZXRzIHRvIHByb3Bvc2UsIEkgdGhpbmsgdGhpcyBt
b2RlCm11c3QgYmUgc2VlbiBsaWtlIGEgY29udHJvbGxlciBhYnN0cmFjdGlvbiBvZiBhbnkgZGV2
aWNlIHdpdGggc2V2ZXJhbApwaHlzaWNhbCBjcy4KClRoZSBxdWVzdGlvbjogInNob3VsZCB0aGVz
ZSBwcm9wZXJ0aWVzIGJlIGNvbW1vbiB0byBhbGwgZGV2aWNlcyIgaXMKc3RpbGwgb3BlbiwgSSBk
b24ndCBoYXZlIGEgc3Ryb25nIG9waW5pb24sIHdoZXRoZXIgd2Ugc2hvdWxkIG1ha2UgdGhlc2UK
WGlsaW54IHNwZWNpZmljLCBvciBub3QuIEZvciBub3cgdGhleSBhcmUsIGJ1dCBpbiB0aGUgbmVh
ciBmdXR1cmUsIGl0CmlzIG5vdCBzbyBzdXJlIChhbmQgbXkgY3J5c3RhbCBiYWxsIGlzIHVuZGVy
IG1haW50ZW5hbmNlIDspICkuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
