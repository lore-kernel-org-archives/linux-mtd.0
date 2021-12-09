Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27744C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 12:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8mVrmKZny+sEJyrScrQJ6n0MAd+jNh6zIDwIrdcayo=; b=ZJXDEgsMnvVK4R
	hzvHi3HT2JIFGbq1a2dc0DWG1iu2c52fCTzB1rKAnb9qDcyWBY2Qbjt3uq3vAGqcH9uJ52KbqlHQA
	3oiMnreDtI2KyOwl004CYZ/8lussobAxlQj2afdVkQr9WRmDNfYXXaRXtKxB1v2drAHnVKKXUlH43
	peX7fIHbd4Pidd2bAdmBORoo/dIJ8acqb+nbSasBNizLKNTEj7uIODBCfliwJPODQAHZl7chgMne9
	Ak4nE5PTp19c8Kp4MTpCVjnh667CBVXgE8MnOYkPfdzaDYkS8ZvLOBHrVlxAlsao9tl7R/e9iP4xj
	ehX0UOSSFQlpFG6hAxNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvIft-00FxNC-8g; Thu, 09 Dec 2021 12:37:25 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvIfe-00FxHI-SI
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 12:37:13 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 982F36000C;
 Thu,  9 Dec 2021 12:37:06 +0000 (UTC)
Date: Thu, 9 Dec 2021 13:37:05 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tony Lindgren <tony@atomide.com>,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: ti,gpmc-nand: Add missing 'rb-gpios'
Message-ID: <20211209133705.621912fe@xps13>
In-Reply-To: <1744af96-3b71-3d41-12e2-a9052684cb35@kernel.org>
References: <20211206174209.2297565-1-robh@kernel.org>
 <20211209104224.41d42cca@xps13>
 <bebef734-d0d3-e78e-e07a-9160ead1f673@kernel.org>
 <20211209114038.710139a8@xps13>
 <1744af96-3b71-3d41-12e2-a9052684cb35@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_043711_091552_053EC170 
X-CRM114-Status: GOOD (  21.51  )
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

SGkgUm9nZXIsCgo+ID4+Pj4gV2l0aCAndW5ldmFsdWF0ZWRQcm9wZXJ0aWVzJyBzdXBwb3J0IGlt
cGxlbWVudGVkLCB0aGUgVEkgR1BNQyBleGFtcGxlCj4gPj4+PiBoYXMgYSB3YXJuaW5nOgo+ID4+
Pj4KPiA+Pj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJv
bGxlcnMvdGksZ3BtYy5leGFtcGxlLmR0LnlhbWw6IG5hbmRAMCwwOiBVbmV2YWx1YXRlZCBwcm9w
ZXJ0aWVzIGFyZSBub3QgYWxsb3dlZCAoJ3JiLWdwaW9zJyB3YXMgdW5leHBlY3RlZCkKPiA+Pj4+
Cj4gPj4+PiBBZGQgdGhlIG1pc3NpbmcgZGVmaW5pdGlvbiBmb3IgJ3JiLWdwaW9zJy4gICAgCj4g
Pj4+Cj4gPj4+IHJiLWdwaW9zIGlzIGFscmVhZHkgZGVmaW5lZCBpbiBuYW5kLWNvbnRyb2xsZXIu
eWFtbC4gSSBzZWVtcyBsaWtlIHRoZQo+ID4+PiByZWFsIHByb2JsZW0gaXMgdGhhdCB0aGlzIGZp
bGUgZG9lcyBub3QgcmVmZXIgdG8gaXQuIENhbiB5b3UgdXBkYXRlIHRoZQo+ID4+PiBmaXg/ICAg
IAo+ID4+Cj4gPj4gSSBkb24ndCB0aGluayB3ZSBjYW4gcmVmZXIgdG8gbmFuZC1jb250cm9sbGVy
LnlhbWwgcmlnaHQgbm93IGFzIHdlIGFyZSBub3QKPiA+PiBmdWxseSBjb21wYXRpYmxlIHdpdGgg
aXQgeWV0LiBQbGVhc2Ugc2VlIGV4YW1wbGVzIGJlbG93LiAgCj4gPiAKPiA+IFRoaXMgaXMgYSAq
dmVyeSogd3Jvbmcgd2F5IG9mIGRlZmluaW5nIGEgTkFORCBzZXR1cC4gSSB3aWxsIHRha2UgdGhl
Cj4gPiBwYXRjaCB0byBzaWxlbmNlIHRoZSB3YXJuaW5nLCBidXQgcGxlYXNlIGNvbnZlcnQgdGhp
cyByZXByZXNlbnRhdGlvbiB0byAgCj4gCj4gVGhhbmtzIQo+IAo+ID4gdGhlICduZXcnIG9uZS4g
SSBiZWxpZXZlIG9uIHRoZSBkcml2ZXIgc2lkZSBpdCBzaG91bGQgbm90IGJlIHRvbwo+ID4gY29t
cGxpY2F0ZWQgdG8gc3VwcG9ydCBoYXZpbmcgYSBmZXcgb2YgdGhlc2UgcHJvcGVydGllcyBtb3Zl
ZCB0byBhIE5BTkQKPiA+IGNoaXAgc3Vibm9kZSBhbmQgc3RpbGwgc3VwcG9ydCB0aGUgYmVsb3cg
YmluZGluZy4gSnVzdCBiZSB2ZXJ5IGNsZWFyCj4gPiB0aGF0IGlmIHRoZSBsZWdhY3kgYmluZGlu
Z3MgYXJlIHVzZWQsIG9ubHkgYSBzaW5nbGUgY2hpcCBpcyBzdXBwb3J0ZWQuICAKPiAKPiBJIGFn
cmVlIHdpdGggeW91LiBJdCBoYXMgYmVlbiB0aGF0IHdheSBzaW5jZSBhZ2VzLiBJIHdpbGwgbG9v
ayBhdCBjbGVhbmluZwo+IGl0IHVwIHdoZW5ldmVyIHBvc3NpYmxlIGZvciBtZS4gSSB0aGluayB3
ZSB3aWxsIGhhdmUgdG8gc3VwcG9ydCB0aGUgb2xkCj4gYmluZGluZ3MgYXMgd2VsbCBhcyB0aGUg
bmV3IG9uZSBnb2luZyBmb3J3YXJkIGFzIG1hbnkgbGVnYWN5IHBsYXRmb3Jtcwo+IGFyZSB1c2lu
ZyBpdC4KClllcyBvZiBjb3Vyc2UsIHRoaXMgaXMgZXZlbiBhIHByaW1hcnkgcmVxdWlyZW1lbnQu
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
