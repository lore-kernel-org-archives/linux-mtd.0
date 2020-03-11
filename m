Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CF9C10F27
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 09:22:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8BB42146E
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 09:22:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ob2LXE8X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8BB42146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lY47MC7GLIpUNTzRxg0MTnFNqaBsb71NdhTeUN0QKSk=; b=ob2LXE8XSf49mN
	Fawmuh7xTplIXfDy9EUldP+VNgz/+/MfglwRKDcOKfTn6WNC2iN3VdKLP4aCts9/dw+PUWqsLy7y0
	9BTDKchKJGHj/OgmDsvDlMiv5SR4Knuq2dbYtMNuDXqVcRViqN0OnoZgtjnQjBqR9Mp9AJuKWy3hn
	k0g+NACCYA+Rd0+AHljXnheaZgGQXXZHRc7cmyAcJZyv2SMZR2amJxjUx5nUPUbQQMZ25mfEgrbyz
	u8S4I3XCqSiw3X1vuoFWf5yNGKKdSWhFW0XJ57nxTcy1Ndgj60DYwAk6/jYGtTn1PHfObp6kXUUPE
	j2VLXdUvsJF6SEQ0o5Bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBxZV-0006OU-Pg; Wed, 11 Mar 2020 09:22:37 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBxZO-0006Ky-VF; Wed, 11 Mar 2020 09:22:33 +0000
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 296831BF20B;
 Wed, 11 Mar 2020 09:22:20 +0000 (UTC)
Date: Wed, 11 Mar 2020 10:22:19 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH 3/3] spi: spi-mem: MediaTek: Add SPI NAND Flash
 interface driver for MediaTek MT7622
Message-ID: <20200311102219.419feb66@xps13>
In-Reply-To: <CAJsYDVJeZGpz6K2w1JuBVXM+zdFca9qp3+=PERTE2avehw6LXg@mail.gmail.com>
References: <1536716612-24610-1-git-send-email-xiangsheng.hou@mediatek.com>
 <1536716612-24610-4-git-send-email-xiangsheng.hou@mediatek.com>
 <20181023075247.004982c9@bbrezillon>
 <1540532796.24602.11.camel@mhfsdcap03>
 <20181026080833.2fedbd94@bbrezillon>
 <CAJsYDV+dAikBZ4gg_3u7z_jgV2ZehhyWyRQ709dNQV0XdDOUbQ@mail.gmail.com>
 <CAJsYDV+ACknTVAhVJ-R-8p7H0B3XdP9nnrRZ+erJ=vbqt_VeKw@mail.gmail.com>
 <20200311091813.41b55a97@collabora.com>
 <CAJsYDVJeZGpz6K2w1JuBVXM+zdFca9qp3+=PERTE2avehw6LXg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_022231_275359_8D1C0C2D 
X-CRM114-Status: GOOD (  37.15  )
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
Cc: ryder.lee@mediatek.com, Boris Brezillon <bbrezillon@kernel.org>,
 Mark Brown <broonie@kernel.org>, sean.wang@mediatek.com,
 linux-mediatek@lists.infradead.org,
 "Bayi Cheng \(=?UTF-8?B?56iL5YWr5oSP?=\)" <bayi.cheng@mediatek.com>,
 linux-spi@vger.kernel.org, marek.vasut@gmail.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 "Benliang Zhao \(=?UTF-8?B?6LW15pys5Lqu?=\)" <benliang.zhao@mediatek.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2h1YW5ob25nLAoKQ2h1YW5ob25nIEd1byA8Z2NoOTgxMjEzQGdtYWlsLmNvbT4gd3JvdGUg
b24gV2VkLCAxMSBNYXIgMjAyMCAxNzoxNTozOAorMDgwMDoKCj4gSGkhCj4gCj4gT24gV2VkLCBN
YXIgMTEsIDIwMjAgYXQgNDoxOCBQTSBCb3JpcyBCcmV6aWxsb24KPiA8Ym9yaXMuYnJlemlsbG9u
QGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+ID4KPiA+ICtNaXF1ZWwgd2hvIHdvcmtlZCBvbiB0aGUg
RUNDIGVuZ2luZSBhYnN0cmFjdGlvbiBbM10gcmVjZW50bHkuCj4gPgo+ID4gSGVsbG8gQ2h1YW5o
b25nLAo+ID4KPiA+IE9uIFdlZCwgMTEgTWFyIDIwMjAgMTU6MzU6NDMgKzA4MDAKPiA+IENodWFu
aG9uZyBHdW8gPGdjaDk4MTIxM0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gIAo+ID4gPiBIaSBCb3Jp
cyEKPiA+ID4KPiA+ID4gW3Jlc2VuZCB0byB5b3UgYmVjYXVzZSBvZiB0aGUgd3JvbmcgbWFpbCBh
ZGRyZXNzIGluIHByZXZpb3VzIG9uZS5dCj4gPiA+Cj4gPiA+IEknbSBhYm91dCB0byBwaWNrIHRo
aXMgZHJpdmVyIHVwIGFuZCBzdGFydCB1cHN0cmVhbSBpdCBpbiB0aGUgZnV0dXJlLgo+ID4gPiBT
byBJJ20gYW5zd2VyaW5nCj4gPiA+IHlvdXIgcXVlc3Rpb25zIGJlbG93IGFuZCB3b3VsZCBsaWtl
IHRvIGdldCB5b3VyIGZ1cnRoZXIgc3VnZ2VzdGlvbnMuCj4gPiA+Cj4gPiA+IE9uIEZyaSwgT2N0
IDI2LCAyMDE4IGF0IDI6MDkgUE0gQm9yaXMgQnJlemlsbG9uCj4gPiA+IDxib3Jpcy5icmV6aWxs
b25AYm9vdGxpbi5jb20+IHdyb3RlOiAgCj4gPiA+ID4gPiA+IFRoZXJlJ3MgYSBmdW5kYW1lbnRh
bCBpc3N1ZSB3aXRoIHRoaXMgZHJpdmVyOiBzcGktbWVtIHdhcyBkZXNpZ25lZCB0byBiZQo+ID4g
PiA+ID4gPiBtZW1vcnkgYWdub3N0aWMsIGFuZCB5b3Ugc2VlbSB0byBoYXZlIGEgU1BJIGNvbnRy
b2xsZXIgdGhhdCBzdXBwb3J0cwo+ID4gPiA+ID4gPiBvbmx5IFNQSSBOQU5Ecy4gSXMgdGhhdCBj
b3JyZWN0LCBvciBpcyBpdCBqdXN0IHRoYXQgeW91IGRldmVsb3BlZCB0aGUKPiA+ID4gPiA+ID4g
ZHJpdmVyIHdpdGggU1BJIE5BTkRzIGluICBtaW5kPwo+ID4gPiA+ID4gPiAgCj4gPiA+ID4gPiBZ
ZXMsIHRoaXMgZHJpdmVyIHN1cHBvcnRzIG9ubHkgU1BJIE5BTkRzLgo+ID4gPiA+ID4gQWN0dWFs
bHksIE1lZGlhdGVrJ3MgY29udHJvbGxlciBpcyBkZXNpZ25lZCBmb3IgTkFORCBzcGVjaWZpY2Fs
bHksIHdoaWNoCj4gPiA+ID4gPiBjYW4gc3VwcG9ydCBTUEkgTkFORHMgYW5kIFBBUkFMTEVMIE5B
TkRzLGFuZCB0aGlzIGRyaXZlciBpcyBqdXN0IGZvciBTUEkKPiA+ID4gPiA+IE5BTkRzLiAgCj4g
PiA+ID4KPiA+ID4gPiBIbSwgSSdtIG5vdCBzbyBzdXJlIGFib3V0IHRoYXQgKEkgbWlnaHQgYmUg
d3JvbmcgdGhvdWdoKSwgaXQgc2VlbXMgeW91Cj4gPiA+ID4gY2FuIHNlbmQgYW55IGNvbW1hbmQg
eW91IHdhbnQsIG5vdCBvbmx5IFNQSSBOQU5EIHJlbGF0ZWQgb25lcy4gTWF5YmUgdGhlCj4gPiA+
ID4gY29udHJvbGxlciBpcyBvcHRpbWl6ZWQgZm9yIFNQSSBOQU5EcyBidXQgY2FuIGRvIGFsbCBr
aW5kIG9mIFNQSQo+ID4gPiA+IHRyYW5zZmVycy4gIAo+ID4gPgo+ID4gPiBZb3UgYXJlIGNvcnJl
Y3QgaGVyZS4gVGhpcyBjb250cm9sbGVyIGNhbiBwZXJmb3JtIGdlbmVyaWMgc3BpLW1lbSBvcGVy
YXRpb25zLAo+ID4gPiBhbmQgaXQgaGFzIHNwZWNpYWwgcm91dGluZXMgZm9yIHBhZ2UgY2FjaGUg
Ui9XIHRoYXQgdXRpbGl6ZSBjb250cm9sbGVyJ3MgRUNDCj4gPiA+IGZ1bmN0aW9uYWxpdHkuICAK
PiA+Cj4gPiBTb3VuZHMgc2ltaWxhciB0byB0aGUgd2F5IHRoZSBNWElDIGNvbnRyb2xsZXIgd29y
a3MsIGFuZCB0aGF0J3MKPiA+IGFjdHVhbGx5IHdoYXQgTWlxdWVsIGlzIHRyeWluZyB0byBzdXBw
b3J0IHdpdGggaGlzIEVDQyBlbmdpbmUKPiA+IGFic3RyYWN0aW9uIHNlcmllcyBbM10uCj4gPiAg
Cj4gPiA+IEkgdGhpbmsgdGhlIHB1cnBvc2Ugb2YgdGhpcyBpcyB0byBwcm92aWRlIGJldHRlciBF
Q0MgY2FwYWJpbGl0eQo+ID4gPiBmb3Igc29tZSBTUEkgTkFORHMgd2l0aCB3b3JzZSBFQ0MgYWxn
b3JpdGhtIG9uIGNoaXAuICAKPiA+Cj4gPiBZZXAsIG9yIG1ha2UgaXQgZmFzdGVyLiBBY3R1YWxs
eSB0aGUgcmVhc29uIGRvZXNuJ3QgbWF0dGVyLCBJIHRoaW5rCj4gPiB3ZSBhbGwgYWdyZWUgdGhh
dCB3ZSdsbCBoYXZlIHRvIHN1cHBvcnQgZXh0ZXJuYWwgRUNDIGZvciBTUEkgTkFORHMgYXQKPiA+
IHNvbWUgcG9pbnQsIGhlbmNlIHRoZSB3b3JrIE1pcXVlbCBoYXMgYmVlbiBkb2luZy4KPiA+ICAK
PiA+ID4gIAo+ID4gPiA+ID4gPiBEb24ndCBrbm93IHdoYXQncyBwb3NzaWJsZSB0byBkbyB3aXRo
IHlvdXIgY29udHJvbGxlciwgYW5kIG1heWJlIGl0J3MKPiA+ID4gPiA+ID4gbm90IGFibGUgdG8g
ZXhlY3V0ZSByYW5kb20gU1BJIG1lbW9yeSBvcGVyYXRpb25zLCBidXQgaW4gdGhpcyBjYXNlIHdl
Cj4gPiA+ID4gPiA+IHNob3VsZCBjb25zaWRlciBhIGRpZmZlcmVudCBzb2x1dGlvbiB0byBzdXBw
b3J0IHRoaXMgZHJpdmVyLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBEbyB5b3UgaGF2ZSBhIHB1
YmxpYyBkYXRhc2hlZXQgSSBjYW4gbG9vayBhdD8KPiA+ID4gPiA+ID4gIAo+ID4gPiA+ID4gV2Ug
ZG8gbm90IGhhdmUgYSBwdWJsaWMgZGF0YXNoZWV0IGZvciBNZWRpYXRlayBjb250cm9sbGVyIGN1
cnJlbnRseS4gIAo+ID4gPiA+Cj4gPiA+ID4gVW5mb3J0dW5hdGVseSwgdGhlcmUncyBub3QgbXVj
aCBJIGNhbiBkbyB3aXRob3V0IGEgY2xlYXIgdW5kZXJzdGFuZGluZwo+ID4gPiA+IG9mIGhvdyB0
aGUgY29udHJvbGxlciB3b3Jrcy4KPiA+ID4gPiAgCj4gPiA+Cj4gPiA+IEkgZm91bmQgYSBwdWJs
aWMgZGF0YXNoZWV0IFswXSBvbiB3aWtpIHBhZ2UgZm9yIEJhbmFuYSBQaSBSNjQgWzFdLgo+ID4g
PiBSZWdpc3RlciBkZXNjcmlwdGlvbiBpcyBhdmFpbGFibGUgdW5kZXIgIk5BTkQgZmxhc2ggaW50
ZXJmYWNlIiBzZWN0aW9uCj4gPiA+IHN0YXJ0aW5nIGF0IHBhZ2UgNTkyLgo+ID4gPiBUaGVyZSdz
IGEgaGFja2llciB2ZXJzaW9uIG9mIHRoaXMgZHJpdmVyIGluIE9wZW5XcnQgWzJdIHdoaWNoIGNo
ZWNrcwo+ID4gPiBvcGNvZGUgYW5kIHVzZSBjb250cm9sbGVyIHJvdXRpbmUgZm9yIHBhZ2UgY2Fj
aGUgUi9XLgo+ID4gPgo+ID4gPiBFQ0MgcGFydCBvZiB0aGlzIGNvbnRyb2xsZXIgY2FuIGFsc28g
YmUgdXNlZCBhcyBhIHN0YW5kYWxvbmUgRUNDCj4gPiA+IGFsZ29yaXRobSBhbmQgcGVyZm9ybSBF
Q0Mgb3BlcmF0aW9ucyBvbiBkYXRhIHByb3ZpZGVkIGJ5IENQVS4gIAo+IAo+IFRoZSBzb2x1dGlv
biBJJ20gcmVmZXJyaW5nIHRvIGhlcmUgaXM6Cj4gMS4gcmVhZCB1bmNvcnJlY3RlZCBkYXRhIHRv
IGhvc3QgZGlyZWN0bHkgZnJvbSBTUEkgTkFORAo+IDIuIHN0YXJ0IGFuIEVDQyBjb3JyZWN0aW9u
IHNlcGFyYXRlbHkKPiAKPiA+ID4gQnV0IEkgdGhpbmsgaWYgaXQncyBpbXBsZW1lbnQgdGhpcyB3
YXksIHdlIHdhc3RlZCB0aGUgcGFnZSBjYWNoZQo+ID4gPiBSL1cgcm91dGluZXMgaW4gdGhpcyBj
b250cm9sbGVyLiAgCj4gPgo+ID4gT2gsIHlvdSBwcm9iYWJseSBkb24ndCB3YW50IHRoZSBwYWdl
IGNhY2hlIHRvIGJlIGFjdGl2ZSBhbnl3YXkuIFdoZW4KPiA+IHRoZSBmcmFtZXdvcmsgcmVhZHMg
YSBOQU5EIHBhZ2UsIGl0IGFsc28gY2hlY2tzIHRoZSBudW1iZXIgb2YgRUNDCj4gPiBlcnJvcnMs
IGlmIHRoZSBwYWdlIGlzIGhlbGQgaW4gc29tZSBpbnRlcm5hbCBjYWNoZSwgeW91IHdvbid0IHNl
ZQo+ID4gdGhlIGV2b2x1dGlvbiBvZiB0aGlzIG51bWJlci4gTm90ZSB0aGF0IHRoZSBGUyBzaG91
bGQgZG8gc29tZSBjYWNoaW5nLAo+ID4gc28gY2FjaGluZyB0aGluZ3MgYXQgdGhlIEhXIGxldmVs
IGlzIHByb2JhYmx5IHVzZWxlc3MuICAKPiAKPiBJdCBkb2Vzbid0IGNhY2hlIGFueXRoaW5nIGlu
IGNvbnRyb2xsZXIuIFRoZSBSL1cgcm91dGluZSBJIHJlZmVyIHRvIGlzOgo+IFdoZW4gd2UgaXNz
dWUgYSByZXF1ZXN0IHRvIHJlYWQgcGFnZSBjYWNoZSBvbiBTUEkgTkFORDoKPiAxLiBob3N0IHBy
b2dyYW1zIGEgRE1BLWFibGUgbWVtb3J5IGFyZWEgZm9yIHJlY2VpdmluZyBkYXRhLgo+IDIuIGNv
bnRyb2xsZXIgcmVhZHMgdGhlIHBhZ2UgY2FjaGUgZnJvbSBTUEkgTkFORAo+IDMuIGNvbnRyb2xs
ZXIgZ2V0IHRoZSBkYXRhIGFuZCBzdGFydCBFQ0MgY29ycmVjdGlvbgo+IDQuIGNvcnJlY3RlZCBk
YXRhIHdpbGwgYmUgc2VudCBiYWNrIHRvIGhvc3QgdmlhIERNQQo+IDUuIGhvc3QgY291bGQgY2hl
Y2sgRUNDIHN0YXR1cwo+IAo+IHdyaXRpbmcgb2YgcGFnZSBjYWNoZSBnb2VzIHNpbWlsYXJseS4K
PiBUaGVyZSdzIG5vIG5lZWQgZm9yIGEgc2VwYXJhdGVkIEVDQyByZXF1ZXN0IGNvbXBhcmluZyB0
byBwcmV2aW91cwo+IG9uZS4KPiAKPiA+ICAKPiA+ID4KPiA+ID4gSSBoYXZlIHR3byBvdGhlciBp
bml0aWFsIHRob3VnaHRzOgo+ID4gPiAxLiBhYnN0cmFjdCBzb21lIGtpbmQgb2YgRUNDIGZ1bmN0
aW9uYWxpdHkgaW4gc3BpLW1lbSBpbnRlcmZhY2UKPiA+ID4gICAgIEkgaGF2ZW4ndCByZWFsbHkg
bGVhcm5lZCBFQ0Mgc3R1ZmYgc28gSSBkb24ndCBrbm93IHdoZXRoZXIgdGhpcyBpcwo+ID4gPiAg
ICAgcG9zc2libGUgYW5kIHdoYXQga2luZCBvZiBhcmd1bWVudCB3ZSBuZWVkcyBmb3IgaXQuICAK
PiA+Cj4gPiBOb3BlLCBzcGktbWVtIHNob3VsZCBzdGF5IGZvY3VzZWQgb24gU1BJIHRyYW5zZmVy
cywgbm90aGluZwo+ID4gbWVtb3J5LXNwZWNpZmljIHNob3VsZCBsZWFrIHRoZXJlLgo+ID4gIAo+
ID4gPiAyLiBtb2RpZnkgU1BJLU5BTkQgY29yZSB0byBhZGQgc3VwcG9ydCBmb3Igc3BlY2lhbCBT
UEktTkFORCBjb250cm9sbGVyLgo+ID4gPiAgICAgVGhpcyBsaW1pdHMgY29udHJvbGxlcidzIGFi
aWxpdHkgYW5kIGFkZHMgZXh0cmEgYnVyZGVuIGZvciBmdXR1cmUgZXh0ZW50aW9uCj4gPiA+ICAg
ICBvZiBTUEktTkFORCBmcmFtZXdvcmsuICAKPiA+Cj4gPiBUaGF0IGRvZXNuJ3Qgd29yayBlaXRo
ZXIgYXMgc29tZSBFQ0MgZW5naW5lcyBhcmUgc2hhcmVkIGJldHdlZW4gdGhlCj4gPiByYXcgTkFO
RCBhbmQgc3BpLW1lbSBJUHMuCj4gPiAgCj4gPiA+Cj4gPiA+IFdoaWNoIHdheSB3b3VsZCB5b3Ug
cHJlZmVyIGFuZCBkbyB5b3UgaGF2ZSBvdGhlciBzdWdnZXN0aW9ucz8gIAo+ID4KPiA+IFNlZSBb
M10uIEkgdGhpbmsgeW91IGNhbiBhbHJlYWR5IGJhc2UgeW91ciB3b3JrIG9uIE1pcXVlbCdzIHNl
cmllcywgYnV0Cj4gPiBtYXliZSBoZSBoYXMgYSBtb3JlIHVwLXRvLWRhdGUgdmVyc2lvbiB0byBz
aGFyZS4gSSdsbCBsZXQgeW91IHN5bmMgd2l0aAo+ID4gaGltLiAgCgpJIGFtIGFjdGl2ZWx5IHdv
cmtpbmcgb24gaXQsIHRoaXMgc2VyaWVzIGlzIGFkZGluZyBhbiAiRUNDIGVuZ2luZQpmcmFtZXdv
cmsiIHRoYXQgY291bGQgcG90ZW50aWFsbHkgZml0IGFueSBhcmNoaXRlY3R1cmUuIEkgYW0gY3Vy
cmVudGx5Cndvcmtpbmcgd2l0aCBhIE1hY3Jvbml4IGV4dGVybmFsIEVDQyBlbmdpbmUsIEkgd2ls
bCAic29vbiIgc2VuZCBhIG5ldwp2ZXJzaW9uIG9mIGl0LCBJJ2xsIGNvcHkgeW91LgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
