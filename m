Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FA5C46467
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 09:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rY3cmdEryfMzG0gQrj3eLqkfjnvC+hq50oIPmNA5MsM=; b=LWS/rxFtAoweeW
	C7LbCDERv1w/kAmvSPl/9DJXGjB8yCGru2RmgCraJxbpzWZi5Sj9vpyrtTrZyQNYjZHcYQDo2cwe/
	YN16vL8cLNh0R+mC5EhchlNOTdB5dOW16DJHsqoLfy6FX27lECas0O2P0bLTd6+tT2d9lOayXJarQ
	H4NLl05vmvOAmZkxjNLcSZ4nPOKXyeqYND9iPPiwv89QvGXnV09UV/YMPlLbj7hE01S97NM9IpAyr
	dSCaDSbuChBLVXlWg4dUeaS0KeBJ1U3GRGChN4m9sO5dB15At5WI84lnEMzMb6hh0pYSVupqGSicD
	FghrcgELGEDZSH2xcu6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHKe-009zmZ-5s; Mon, 02 Jan 2023 09:42:12 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHIg-009yex-ER; Mon, 02 Jan 2023 09:40:33 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4B6C6240009;
	Mon,  2 Jan 2023 09:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672652406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5E6lCTS2ynO3kNOr2DrozkQ00vp5/Kkw0BvSXENsHXY=;
	b=H4c1yh/VB54M+SKD9HDIZAF63eVXa2yhH6f6CxSWCVqlmzIWxOgkzo+mKG7usBZesd4axd
	q8cwWe5EB8lRIlWHxMOoZLRHic6sLONpwflfrR7ksq6/5TeWBsqqjNz0H/oIzhiUXlC2Xr
	/gQni3u+Mvg0qvh4LVdTOQi9XVxmFN1QgL3tWhGTI+60xdbq2xJqkzKKohLpJfgvZ3ueGl
	6mQ7NEKtYXhlViLCJhIXm96QQ7ZwGbaPRLTOBY6/z8PZXWgEMhBCtC6YBCjLLq3U+pvIZa
	TZWEW9T/0v9VEixvNZaL6G2IHHBOGAtOAez+WSlNcM6EVnmyNUNDiDgCnQbolw==
Date: Mon, 2 Jan 2023 10:40:04 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>, Shawn Guo
 <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, u-boot@lists.denx.de
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is
 0
Message-ID: <20230102104004.6abae6da@xps-13>
In-Reply-To: <Y5ydGhn/qYUalamm@francesco-nb.int.toradex.com>
References: <Y5wiAPvPU+YY39oX@francesco-nb.int.toradex.com>
	<6f5f5b32-d7fe-13cc-b52d-83a27bd9f53e@denx.de>
	<20221216120155.4b78e5cf@xps-13>
	<Y5xmi62hR6JeYUt1@francesco-nb.int.toradex.com>
	<20221216143720.3c8923d8@xps-13>
	<fb55a784-eda3-8916-1413-581b9436b3f2@denx.de>
	<20221216163501.1c2ace21@xps-13>
	<Y5ydGhn/qYUalamm@francesco-nb.int.toradex.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_014011_764656_667FF521 
X-CRM114-Status: GOOD (  27.25  )
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

SGkgRnJhbmNlc2NvLAoKZnJhbmNlc2NvQGRvbGNpbmkuaXQgd3JvdGUgb24gRnJpLCAxNiBEZWMg
MjAyMiAxNzozMDoxOCArMDEwMDoKCj4gT24gRnJpLCBEZWMgMTYsIDIwMjIgYXQgMDQ6MzU6MDFQ
TSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IG1hcmV4QGRlbnguZGUgd3JvdGUgb24g
RnJpLCAxNiBEZWMgMjAyMiAxNTozMjoyOCArMDEwMDogIAo+ID4gPiBUaGUgc2Vjb25kIHBhcnQg
b2YgdGhlIG1lc3NhZ2UsIGFzIGZhciBhcyBJIHVuZGVyc3RhbmQgaXQsIGlzCj4gPiA+ICJpZ25v
cmUgcHJvYmxlbXMgdGhpcyB3aWxsIGNhdXNlIHRvIHVzZXJzIG9mIGJvYXJkcyB3ZSBkbyBub3Qg
a25vdwo+ID4gPiBhYm91dCwgbGV0IHRoZW0gcnVuIGludG8gdW5ib290YWJsZSBzeXN0ZW1zIGFm
dGVyIHNvbWUgbGludXgga2VybmVsCj4gPiA+IHVwZGF0ZSwgICAKPiA+IAo+ID4gTm93IHlvdSBr
bm93IHdoYXQga2VybmVsIHVwZGF0ZSB3aWxsIGJyZWFrIHRoZW0sIHNvIHlvdSBjYW4gcHJldmVu
dCBpdAo+ID4gZnJvbSBoYXBwZW5pbmcuIAo+ID4gCj4gPiBGb3IgYm9hcmRzIHdpdGhvdXQgZXZl
biBhIGR0c2kgaW4gdGhlIGtlcm5lbCwgc2hvdWxkIHdlIGNhcmU/ICAKPiAKPiBXb3VsZCBjYXJp
bmcgZm9yIHRob3NlIGJvYXJkcyBub3QgYmUganVzdCBleGFjdCB0aGUgc2FtZSBhcyBjYXJpbmcg
Zm9yCj4gc29tZSBVRUZJL0FDUEkgbWVzcyBmb3Igd2hpY2ggbm8gc291cmNlIGNvZGUgaXMgbm9y
bWFsbHkgYXZhaWxhYmxlIGFuZAo+IG5vYm9keSByZWFsbHkga25vd24gYXQgd2hpY2ggcG9pbnQg
dGhlIHZhcmlvdXMgdmVuZG9ycyBoYXZlIGZvcmtlZCB0aGVpcgo+IHNvdXJjZSBjb2RlIGZyb20g
c29tZSBJbnRlbCBvciBBTUQgb3Igd2hhdGV2ZXIgcmVmZXJlbmNlIGNvZGU/CgpJIGFtIHNvcnJ5
IEkgZG9uJ3Qga25vdyBVRUZJL0FDUEkgd2VsbCBlbm91Z2ggdG8gZGlzY3VzcyBpdC4KCj4gSU1I
TyB3ZSBzaG91bGQgY2FyZSBmb3IgdGhlIG11bHRpcGxlIHJlYXNvbiBJIGhhdmUgYWxyZWFkeSB3
cml0dGVuIGluIG15Cj4gcHJldmlvdXMgZW1haWxzLgo+IAo+IEFuZCBob25lc3RseSwganVzdCBh
cyBhIHNpZGUgY29tbWVudCwgSSB3b3VsZCBmZWVsIHdheSBtb3JlIGhhcHB5Cj4gdG8ga25vdyB0
aGF0IHRoZSBlbGV2YXRvciBjb250cm9sIHN5c3RlbSBpbiB0aGUgZWxldmF0b3IgSSB1c2UgZXZl
cnlkYXkKPiBvciB0aGUgY2hlbWljYWwgaW5kdXN0cmlhbCBwbGFuIEhNSSBuZXh0IHRvIG15IGhv
bWUgaXMgcnVubmluZyBhbiB1cCB0bwo+IGRhdGUgTGludXggc3lzdGVtIHRoYXQgaXMgbm90IGFm
ZmVjdGVkIGJ5IGtub3duIHNlY3VyaXR5IHZ1bG5lcmFiaWxpdGllcwo+IGFuZCB0aGV5IGRpZCBz
dG9wIHVwZGF0aW5nIGl0IGp1c3QgYmVjYXVzZSB0aGVyZSB3YXMgc29tZSByYW5kb20gYnVnCj4g
cHJldmVudGluZyB0aGUgdXBkYXRlZCBrZXJuZWwgdG8gYm9vdCBhbmQgbm9ib2R5IGhhZCB0aGUg
dGltZS9za2lsbCB0bwo+IGludmVzdGlnYXRlIGFuZCBmaXggaXQuIFsxXQoKVGhlIGlzc3VlIGNv
bWVzIGZyb20gYSB2ZXJ5IHNwZWNpZmljIFUtQm9vdCBmdW5jdGlvbiB0aGF0IHNob3VsZCBoYXZl
Cm5ldmVyIGV4aXN0ZWQuIEkgaG9wZSBwZW9wbGUgd29ya2luZyBvbiBjaGVtaWNhbCBwbGFudHMg
ZG8gbm90IG1ha2UKdXNlIG9mIHRoZXNlIGFuZCB3aWxsIG5vdCBkaXNyZWdhcmQgdGhlICJ5b3Vy
IERUIGlzIGJyb2tlbiB0aGVyZSBbLi4uXSIKd2FybmluZyB3ZSBwbGFuIHRvIGFkZCByaWdodCBi
ZWZvcmUgdGhlaXIgdXBkYXRlZCBib2FyZCB3aWxsIGZhaWwuIFdlCmFyZSBub3QgbGl2aW5nIHBl
b3BsZSBpbiB0aGUgZGFyaywgSSBhZ3JlZWQgZm9yIGEgd2FybmluZywgYnV0IEkgZG9uJ3QKdGhp
bmsgYXBwbHlpbmcgdGhlIHByb3Bvc2VkIGZpeCBibGluZGx5IGlzIHdpc2UgYW5kIGZ1dHVyZS1w
cm9vZi4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
