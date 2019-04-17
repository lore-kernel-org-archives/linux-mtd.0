Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96780C10F12
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 07:08:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65B0220675
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 07:08:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qOumXPwi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LKmmuADf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65B0220675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObbJX5cXdT6dDAykY17DmrJaodA/k8WSTmXnrZttR6Y=; b=qOumXPwiKgfH7j
	W5spPrdro8q4QdAiw1ZlBAYS9u0HWwPYXleSEU9SkJvjZ+tRrNE/u1vd4EKQ7F038MnL3dic4/eKV
	w2ek6sBakZLrkCdUFbLq4oEKwh2kMGGhcJxutZ0+naOoQBbcJMheYucI7artsixBbtnLcLU/lHR82
	3osekCZ9hk2TAH7Wn+5B5D2QISdgKAKZeCy6IGcDjwwLCGNziI09PIfZr1vkv3KE5wmP67fNIPzR8
	aeQQyCgShPVadPD9zlwPjkkrXqkILJK5/2z9bS0U6TzhH4QvcKOXRF3IHBnyr0ibOfHkPEBLso6eL
	021IoGXaGSU6MGYPxNWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGegh-0005tz-I5; Wed, 17 Apr 2019 07:08:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGegg-0005tY-0O
 for linux-mtd@bombadil.infradead.org; Wed, 17 Apr 2019 07:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oDDsd3biCGV2MNKmKzEyekYCgVkmNFPLMDTspB9sxjI=; b=LKmmuADfYSl1gxmQEzznfZj2wB
 y0TuFHps//y5vziPtVRkD1msqCZ/mQyQgLA9WsEPvC3CbimlTAOhbJtZ9oCk1c5PsBwyCmofFegpe
 OAeZhmS4gUfICwNYX3DqEHfW7FA+CDXNL/ifMWX+AvUw/2KNZ/VaaFIn5yHaeaRFukhpmFIf8Sh4N
 b3yDPMAv/6PG4tPbBUtxg3jLnHj4lVCQ83npgS6IjnvubwedM8Cr2pfnHDicqcoFE/htijqBmuRJk
 vy9TzwkiuXVjb867R93w35qheTy3HPP0dhmyOb0+QHi8FFyvdzXe1BceKJ7FEGbGEBUMubdAeCNPX
 ZaTGrefA==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGegc-0002IC-Ju
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 07:08:52 +0000
X-Originating-IP: 90.88.160.238
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C2AD0E0014;
 Wed, 17 Apr 2019 07:08:18 +0000 (UTC)
Date: Wed, 17 Apr 2019 09:08:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH] mtd: rawnand: Add Macronix NAND read retry and
 randomizer support
Message-ID: <20190417090817.7a0c4638@xps13>
In-Reply-To: <OF84BD5411.301E92AC-ON482583DF.000CC3CC-482583DF.000F4920@mxic.com.tw>
References: <1554780172-23111-1-git-send-email-masonccyang@mxic.com.tw>
 <20190409090427.22de9917@collabora.com>
 <OF6C97E4DE.45261545-ON482583D7.00340468-482583D7.0034B3FE@mxic.com.tw>
 <20190409114701.744c2c8c@collabora.com>
 <OF9601E14B.A48284C4-ON482583D8.0005E3EB-482583D8.0006CC14@mxic.com.tw>
 <20190410092258.332ef399@collabora.com>
 <OF071D3608.9D6D2523-ON482583D9.00173F52-482583D9.0018188C@mxic.com.tw>
 <20190411085353.4c1af008@collabora.com>
 <OF34672B6F.AACFE22C-ON482583D9.00335814-482583D9.0033A673@mxic.com.tw>
 <20190411112943.1fecfa69@collabora.com>
 <OF84BD5411.301E92AC-ON482583DF.000CC3CC-482583DF.000F4920@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_080850_741958_A300854A 
X-CRM114-Status: GOOD (  42.35  )
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
Cc: bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgptYXNvbmNjeWFuZ0BteGljLmNvbS50dyB3cm90ZSBvbiBXZWQsIDE3IEFwciAy
MDE5IDEwOjQ2OjU3ICswODAwOgoKPiBIaSBCb3JpcywKPiAgCj4gIAo+ID4gPiA+ID4gPiA+ID4g
U3ViamVjdAo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBSZTogW1BBVENIXSBtdGQ6
IHJhd25hbmQ6IEFkZCBNYWNyb25peCBOQU5EIHJlYWQgcmV0cnkgYW5kICAgCj4gPiA+ID4gPiBy
YW5kb21pemVyICAgCj4gPiA+ID4gPiA+ID4gc3VwcG9ydCAgIAo+ID4gPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+ID4gPiBPbiBUdWUsIDkgQXByIDIwMTkgMTc6MzU6MzkgKzA4MDAKPiA+ID4gPiA+
ID4gPiA+IG1hc29uY2N5YW5nQG14aWMuY29tLnR3IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gICAK
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IGtvYmpfYXR0cmlidXRlIHN5c2ZzX214aWNfbmFuZCA9Cj4gPiA+ID4gPiA+ID4g
PiA+ID4gPiArICAgX19BVFRSKG5hbmRfcmFuZG9tLCBTX0lSVUdPIHwgU19JV1VTUiwKPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgbXhpY19uYW5kX3JhbmRfdHlwZV9zaG93LAo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICBteGljX25hbmRfcmFuZF90eXBlX3N0b3JlKTsg
ICAKPiA+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gPiBObywgd2UgZG9uJ3Qg
d2FudCB0byBleHBvc2UgdGhhdCB0aHJvdWdoIGEgc3lzZnMgZmlsZSwgICAKPiA+ID4gPiA+IGVz
cGVjaWFsbHkgICAKPiA+ID4gPiA+ID4gPiBzaW5jZSAgIAo+ID4gPiA+ID4gPiA+ID4gPiA+IGNo
YW5naW5nIHRoZSByYW5kb21pemVyIGNvbmZpZyBtZWFucyBtYWtpbmcgdGhlIE5BTkQgICAKPiA+
ID4gdW5yZWFkYWJsZSAgIAo+ID4gPiA+ID4gZm9yICAgCj4gPiA+ID4gPiA+ID4gPiA+ID4gdGhv
c2UgdGhhdCBoYXZlIHVzZWQgaXQgYmVmb3JlIHRoZSBjaGFuZ2UuCj4gPiA+ID4gPiA+ID4gPiA+
ID4gICAKPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+IE91ciBvbi1kaWUgcmFu
ZG9taXplciBpcyBzdGlsbCByZWFkYWJsZSBmcm9tIHVzZXIgYWZ0ZXIgICAKPiB0aGUgCj4gPiA+
ID4gPiBmdW5jdGlvbiAgIAo+ID4gPiA+ID4gPiA+ID4gPiBpcyBlbmFibGVkLiAgIAo+ID4gPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBZb3UgbWVhbiB0aGUgbWVtb3J5IGlzIHN0aWxsIHJl
YWRhYmxlIG5vIG1hdHRlciB0aGUgICAKPiByYW5kb21pemVyIAo+ID4gPiA+ID4gc3RhdGUuICAg
Cj4gPiA+ID4gPiA+ID4gPiBOb3Qgc3VyZSBob3cgdGhhdCdzIHBvc3NpYmxlLCBidXQgb2theS4K
PiA+ID4gPiA+ID4gPiA+ICAgCj4gPiA+ID4gPiA+ID4gPiA+IFRoaXMgcmFuZG9taXplciBpcyBq
dXN0IGxpa2UgYSBpbnRlcm5hbCBtZW1vcnkgY2VsbCAKPiA+ID4gPiA+ID4gPiA+ID4gcmVsaWFi
aWxpdHkgZW5oYW5jZWQuICAgCj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IFdoeSBk
b24ndCB5b3UgZW5hYmxlIGl0IGJ5IGRlZmF1bHQgdGhlbj8gICAKPiA+ID4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gPiBUaGUgcGVuYWx0eSBvZiByYW5kb21pemVyIGlzIHJlYWQvd3JpdGUgcGVyZm9y
bWFuY2UgZG93bi4KPiA+ID4gPiA+ID4gPiBpLmUsLiB0UFJPRyAzMDAgdXMgdG8gMzQwIHVzIChy
YW5kb21pemVyIGVuYWJsZSkKPiA+ID4gPiA+ID4gPiB0aGVyZWZvcmUsIGRpc2FibGUgaXQgYnkg
ZGVmYXVsdC4gICAKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEknbSBhIGJpdCBwdXp6bGVkLiBP
biB0aGUgTkFORCBJJ3ZlIHNlZW4gdGhhdCByZXF1aXJlZCBkYXRhCj4gPiA+ID4gPiA+IHJhbmRv
bWl6YXRpb24gaXQncyBub3Qgc29tZXRoaW5nIHlvdSdkIHdhbnQgdG8gZGlzYWJsZSBhcyB0aGlz
ICAgCj4gPiA+IGltcGxpZWQgIAo+ID4gPiA+ID4gPiBwb29yIGRhdGEgcmV0ZW50aW9uLiBXaGF0
J3MgdGhlIHVzZSBjYXNlIGhlcmU/IEFyZSB3ZSB0YWxraW5nICAgCj4gYWJvdXQgCj4gPiA+IFNM
QyAgCj4gPiA+ID4gPiA+IG9yIE1MQyBOQU5Ecz8gU2hvdWxkIHdlIGVuYWJsZSB0aGlzIGZlYXR1
cmUgb25jZSB3ZSBzdGFydCBzZWVpbmcgICAKPiAgCj4gPiA+IHRoYXQgIAo+ID4gPiA+ID4gPiB0
aGUgTkFORCBzdGFydHMgYmVpbmcgbGVzcyByZWxpYWJsZSAoYmFzaWNhbGx5IHdoZW4gcmVhZC1y
ZXRyeSAgIAo+ID4gPiBoYXBwZW5zICAKPiA+ID4gPiA+ID4gbW9yZSBvZnRlbik/IEkgcmVhbGx5
IHRoaW5rIHRoaXMgaXMgc29tZXRoaW5nIHlvdSBzaG91bGQgZGVjaWRlICAgIAo+IAo+ID4gPiBr
ZXJuZWwgIAo+ID4gPiA+ID4gPiBzaWRlLCBiZWNhdXNlIHVzZXJzIGhhdmUgbm8gY2x1ZSB3aGVu
IGl0J3MgYXBwcm9wcmlhdGUgdG8gc3dpdGNoICAgCj4gIAo+ID4gPiB0aGlzICAKPiA+ID4gPiA+
ID4gZmVhdHVyZSBvbi9vZmYuCj4gPiA+ID4gPiA+ICAgCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEl0
J3MgU0xDIE5BTkQgYW5kIHNlZW1zIHRvIGhhcyBub3RoaW5nIHRvIGRvIHdpdGggcmVhZC1yZXRy
eSAgIAo+IGhhcHBlbnMuCj4gPiA+ID4gPiBsYXRlciwgSSB3aWxsIGdldCBtb3JlIGluZm9ybWF0
aW9uIGZvciB5b3VyIGNvbmNlcm5zLiAgIAo+ID4gPiA+IAo+ID4gPiA+IFdlbGwsIHRoaXMgZmVh
dHVyZSBpcyBvcHRpb25hbCwgYW5kIGNhbiBiZSBlbmFibGVkIHRvIGltcHJvdmUKPiA+ID4gPiBy
ZWxpYWJpbGl0eS4gU291bmRzIGxpa2UgYSBnb29kIHJlYXNvbiB0byBlbmFibGUgaXQgd2hlbiB5
b3VyIE5BTkQKPiA+ID4gPiBkZXZpY2Ugc3RhcnRzIHNob3dpbmcgcmVsaWFiaWxpdHkgaXNzdWVz
LCBhbmQgdGhlIG51bWJlciBvZiAgIAo+IHJlYWRfcmV0cnkKPiA+ID4gPiBhdHRlbXB0cyByZWZs
ZWN0cyB0aGUgd2VhciBsZXZlbCBwcmV0dHkgd2VsbC4gQWx0ZXJuYXRpdmVseSwgeW91ICAgCj4g
Y291bGQKPiA+ID4gPiB1c2UgdGhlIG51bWJlciBvZiBiaXRmbGlwcywgYnV0LCBpbiBhbnkgY2Fz
ZSwgZG9uJ3QgZXhwZWN0IHRoZSB1c2VyICAgCj4gdG8KPiA+ID4gPiB0YWtlIHRoaXMgZGVjaXNp
b24sIGJlY2F1c2UgYWxtb3N0IG5vYm9keSBrbm93cyB3aGF0IHRoZSByYW5kb21pemVyCj4gPiA+
ID4gaXMgbmVlZGVkIGZvci4KPiA+ID4gPiAgIAo+ID4gPiA+ID4gICAKPiA+ID4gPiA+ID4gPiAg
IAo+ID4gPiA+ID4gPiA+ID4gICAKPiA+ID4gPiA+ID4gPiA+ID4gSXQgY291bGQgYmUgZW5hYmxl
IGF0IGFueSB0aW1lIHdpdGggT1RQIGJpdCBmdW5jdGlvbiBhbmQgICAKPiA+ID4gdGhhdCdzICAg
Cj4gPiA+ID4gPiB3aHkgICAKPiA+ID4gPiA+ID4gPiA+ID4gd2UgcGF0Y2ggaXQgYnkgc3lzLWZz
LiAgIAo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBTb3JyeSwgYnV0IHRoYXQncyBu
b3QgYSBnb29kIHJlYXNvbiB0byBleHBvc2UgdGhhdCB0aHJvdWdoICAgCj4gPiA+IHN5c2ZzLiAg
IAo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEFueSBnb29kIHdheSB0byBleHBvc2UgcmFu
ZG9taXplciBmdW5jdGlvbiBmb3IgdXNlciA/ICAgCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBE
b24ndCBleHBvc2UgaXQgOlAuICAgCj4gPiA+ID4gPiAKPiA+ID4gPiA+IG9oLCBva2F5LCBJIHdp
bGwgcmVtb3ZlIHN5cy1mcyByYW5kb21pemVyLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJcyBpdCBP
SyB0byBrZWVwIHNldC9nZXQgZmVhdHVyZXMgZm9yIHJhbmRvbWl6ZXIgPyAgIAo+ID4gPiA+IAo+
ID4gPiA+IEkgZG9uJ3QgdGhpbmsgaXQncyBhIGdvb2QgaWRlYSB0byBoYXZlIGRlYWQgY29kZSwg
c28gbm8uIEJ1dCBJJ20gICAKPiBwcmV0dHkKPiA+ID4gPiBzdXJlIHdlJ2xsIGZpbmQgYSB3YXkg
dG8gdXNlL2V4cG9zZSB0aGlzIGZlYXR1cmUuICAgCj4gPiA+IAo+ID4gPiBva2F5LCBncmVhdCEK
PiA+ID4gTG9va2luZyBmb3J3YXJkIHRvIGhlYXJpbmcgdGhpcyBmZWF0dXJlIHVzZS9leHBvc2Uu
ICAKPiA+IAo+ID4gQnV0IGZvciB0aGF0IHRvIGhhcHBlbiB3ZSBhcmUgd2FpdGluZyBmb3IgaW5w
dXRzIGFib3V0IHdoZW4gdGhpcyBpcwo+ID4gc3VwcG9zZWQgdG8gYmUgdXNlZC4uLiAgCj4gCj4g
Cj4gVGhlIG1haW4gcmVhc29uIHRvIGRpc2FibGUgUmFuZG9taXplciBpbiBkZWZhdWx0IGlzCj4g
Tk9QID0gNCAoZGVmYXVsdCkgY2hhbmdlIHRvIE5PUCA9IDEgKFJhbmRvbWl6ZXIgZW5hYmxlKSwg
Cj4gTk9QOiBudW1iZXIgb2YgcGFydGlhbCBwcm9ncmFtIGN5Y2xlcyBpbiBzYW1lIHBhZ2UKCkkg
YW0gbm90IHN1cmUgdG8gdW5kZXJzdGFuZCwgaXMgdGhpcyByZWxhdGVkIHRvIHdoYXQgd2UgY2Fs
bCAnc3VicGFnZXMnPwoKPiAKPiBTb21lIE9TIGZpbGUgc3lzdGVtcyhvciBGVEwpIG11Y2ggY29u
Y2VybiBOT1AgPSA0IGFuZCAKPiBhbnkgYmV0dGVyIHdheSB0aGFuIHN5cy1mcyB0byBlbmFibGUg
aXQ/CgpzeXNmcyBlbnRyeSA9PiB1c2VyIGFjdGlvbgpUaGUgdXNlciBoYXMgYWJzb2x1dGVseSBu
byB3YXkgdG8ga25vdyB3aGVuIGl0IGlzIHJlbGV2YW50IHRvIGVuYWJsZQp0aGUgcmFuZG9taXpl
ci4gVGhlIGtlcm5lbCBtdXN0IGJlIGluIGNoYXJnZSBvZiBpdC4gU28gdGhlIHF1ZXN0aW9uIGlz
Ogp3aGVuIGlzIGl0IHJlbGV2YW50IHRvIGVuYWJsZSB0aGUgcmFuZG9taXplcj8gV2hhdCBjcml0
ZXJpYT8gV2hhdAp0aHJlc2hvbGQ/CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
