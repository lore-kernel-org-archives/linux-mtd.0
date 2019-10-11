Return-Path: <SRS0=7oHA=YE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A22EC47404
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2019 12:08:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C850A214E0
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2019 12:08:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JW9ZyfbY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C850A214E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mM1UIy7PkZQelXUJiPD54GuJPAwtyK/uREfAmqHAFcs=; b=JW9ZyfbYnl60bU
	kCZ/17gLG6GdcfK/NE/nx9+qQV9oDzhJ6qWKRczEywMiZ6hdUNSt6LiiRjVK81zHdfr5R8lWCA3xR
	stEzUBcwSxeZ8Pbc5iitjugz8MjBsOlxrYnxkmjZBOEU0D8wOb1LXig39LOcyX+ox1n2Jl4yQbYBe
	tsoBvWkvv2n2TJmAR476c74J9HcdvcP70bEuA/SsTqLg78ZrE9ChhfZxyo4c9mIy9QwFvtsx35OWZ
	sOSFy1ViDA7bZfgxzf/MkisTtR0oSzQShajuEQQQVyuTPlWfQXYWgRq7ymqJvTMNhc2HVEFgAcceI
	9c3aCQ7x4JEshNquFg6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iItiF-0001Vo-Bq; Fri, 11 Oct 2019 12:08:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIthz-0001LX-Ph; Fri, 11 Oct 2019 12:07:50 +0000
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9C41D290E70;
 Fri, 11 Oct 2019 13:07:35 +0100 (BST)
Date: Fri, 11 Oct 2019 14:07:26 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 00/16] mtd: spi-nor: aspeed: AST2600 support and extensions
Message-ID: <20191011140611.5a34e1fb@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <026b5c55-194c-934f-e039-7c4d28861d53@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
 <20191009225555.67622339@dhcp-172-31-174-146.wireless.concordia.ca>
 <CACPK8Xe__AYvrh40vqjwoM=XKJfp5MeqrMARpFUDGWCyJK6jXQ@mail.gmail.com>
 <20191011084503.5b7a7c2c@dhcp-172-31-174-146.wireless.concordia.ca>
 <3836fcc4-c8b0-ed04-0c52-7c642794ecb8@kaod.org>
 <20191011115129.3897cd17@dhcp-172-31-174-146.wireless.concordia.ca>
 <026b5c55-194c-934f-e039-7c4d28861d53@kaod.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191011_050749_168692_BAF81E2F 
X-CRM114-Status: GOOD (  31.82  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Andrew Jeffery <andrew@aj.id.au>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Joel Stanley <joel@jms.id.au>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxMSBPY3QgMjAxOSAxMzo0Nzo1MyArMDIwMApDw6lkcmljIExlIEdvYXRlciA8Y2xn
QGthb2Qub3JnPiB3cm90ZToKCj4gT24gMTEvMTAvMjAxOSAxMTo1MSwgQm9yaXMgQnJlemlsbG9u
IHdyb3RlOgo+ID4gT24gRnJpLCAxMSBPY3QgMjAxOSAxMToyOTo0OSArMDIwMAo+ID4gQ8OpZHJp
YyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4gd3JvdGU6Cj4gPiAgIAo+ID4+IE9uIDExLzEwLzIw
MTkgMDg6NDUsIEJvcmlzIEJyZXppbGxvbiB3cm90ZTogIAo+ID4+PiBPbiBUaHUsIDEwIE9jdCAy
MDE5IDIzOjQ3OjQ1ICswMDAwCj4gPj4+IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+IHdy
b3RlOgo+ID4+PiAgICAgCj4gPj4+PiBPbiBXZWQsIDkgT2N0IDIwMTkgYXQgMjA6NTYsIEJvcmlz
IEJyZXppbGxvbgo+ID4+Pj4gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZTog
ICAgCj4gPj4+Pj4KPiA+Pj4+PiBIaSBDZWRyaWMsCj4gPj4+Pj4KPiA+Pj4+PiBPbiBGcmksICA0
IE9jdCAyMDE5IDEzOjU5OjAzICswMjAwCj4gPj4+Pj4gQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0Br
YW9kLm9yZz4gd3JvdGU6Cj4gPj4+Pj4gICAgICAKPiA+Pj4+Pj4gSGVsbG8sCj4gPj4+Pj4+Cj4g
Pj4+Pj4+IFRoaXMgc2VyaWVzIGZpcnN0IGV4dGVuZHMgdGhlIHN1cHBvcnQgZm9yIHRoZSBBc3Bl
ZWQgQVNUMjUwMCBhbmQKPiA+Pj4+Pj4gQVNUMjQwMCBTTUMgZHJpdmVyLiBJdCBhZGRzIER1YWwg
RGF0YSBzdXBwb3J0IGFuZCByZWFkIHRyYWluaW5nIGdpdmluZwo+ID4+Pj4+PiB0aGUgYmVzdCBy
ZWFkIHNldHRpbmdzIGZvciBhIGdpdmVuIGNoaXAuIFN1cHBvcnQgZm9yIHRoZSBuZXcgQVNUMjYw
MAo+ID4+Pj4+PiBTb0MgaXMgYWRkZWQgYXQgdGhlIGVuZC4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gSSB1
bmRlcnN0YW5kIHRoYXQgYSBuZXcgc3BpX21lbSBmcmFtZXdvcmsgZXhpc3RzIGFuZCBJIGRvIGhh
dmUgYW4KPiA+Pj4+Pj4gZXhwZXJpbWVudGFsIGRyaXZlciB1c2luZyBpdC4gQnV0IHVuZm9ydHVu
YXRlbHksIGl0IGlzIGRpZmZpY3VsdCB0bwo+ID4+Pj4+PiBpbnRlZ3JhdGUgdGhlIHJlYWQgdHJh
aW5pbmcuIFRoZSBBc3BlZWQgY29uc3RyYWludHMgYXJlIG5vdCBjb21wYXRpYmxlCj4gPj4+Pj4+
IGFuZCBpIGhhdmVuJ3QgaGFkIHRoZSB0aW1lIHRvIGV4dGVuZCB0aGUgY3VycmVudCBmcmFtZXdv
cmsuICAgICAgCj4gPj4+Pj4KPiA+Pj4+PiBIbSwgSSBkb24ndCB0aGluayB0aGF0J3MgYSBnb29k
IHJlYXNvbiB0byBwdXNoIG5ldyBmZWF0dXJlcyB0byB0aGUKPiA+Pj4+PiBleGlzdGluZyBkcml2
ZXIsIGVzcGVjaWFsbHkgc2luY2UgSSBhc2tlZCBvdGhlcnMgdG8gbWlncmF0ZSB0aGVpcgo+ID4+
Pj4+IGRyaXZlcnMgdG8gc3BpLW1lbSBpbiB0aGUgcGFzdC4gSSBkbyB1bmRlcnN0YW5kIHlvdXIg
Y29uY2VybnMsIGFuZCBJJ2xsCj4gPj4+Pj4gbGV0IHRoZSBTUEkgTk9SL01URCBtYWludGFpbmVy
cyBtYWtlIHRoZSBmaW5hbCBjYWxsLCBidXQgSSB0aGluayBpdCdkCj4gPj4+Pj4gYmUgYmV0dGVy
IGZvciB0aGUgU1BJIE1FTSBlY29zeXN0ZW0gdG8gdGhpbmsgYWJvdXQgdGhpcyBsaW5rLXRyYWlu
aW5nCj4gPj4+Pj4gQVBJIChWaWduZXNoIG5lZWRzIGl0IGZvciB0aGUgQ2FkZW5jZSBkcml2ZXIg
SUlSQykgcmF0aGVyIHRoYW4gcHVzaGluZwo+ID4+Pj4+IHRoaXMga2luZCBvZiBmZWF0dXJlIHRv
IHNwaS1ub3IgY29udHJvbGxlciBkcml2ZXJzLiAgICAgIAo+ID4+Pj4KPiA+Pj4+IEFzIENlZHJp
YyBtZW50aW9uZWQsIHRoZSBPcGVuQk1DIHByb2plY3QgaGFzIGJlZW4gc2hpcHBpbmcgdGhlIHJl
YWQKPiA+Pj4+IHRyYWluaW5nIGNvZGUgZm9yIHRoZSBhc3QyNDAwL2FzdDI0MDAgZm9yIHNldmVy
YWwgeWVhcnMgbm93LiBJdCB3b3VsZAo+ID4+Pj4gYmUgZ3JlYXQgdG8gc2VlIGl0IGluIG1haW5s
aW5lLgo+ID4+Pj4KPiA+Pj4+IEkgdGhpbmsgaXQncyByZWFzb25hYmxlIHRvIGFzayBmb3IgdGhl
IGRyaXZlciB0byBiZSBtb3ZlZCB0byB0aGUKPiA+Pj4+IHNwaS1tZW0gc3Vic3lzdGVtIG9uY2Ug
aXQgaGFzIHRoZSByZXF1aXJlZCBBUElzLiAgICAKPiA+Pj4KPiA+Pj4gRXhjZXB0IGl0IHdvbid0
IGhhdmUgdGhlIG5lY2Vzc2FyeSBBUElzIHVubGVzcyBzb21lb25lIHdvcmtzIG9uIGl0LCBhbmQK
PiA+Pj4gYWRkaW5nIHRoaXMgZmVhdHVyZSB0byBleGlzdGluZyBzcGktbm9yIGRyaXZlcnMgd29u
J3QgaGVscCBhY2hpZXZpbmcKPiA+Pj4gdGhpcyBnb2FsLiAgICAKPiA+Pgo+ID4+Cj4gPj4gV2hh
dCB3b3VsZCB5b3Ugc3VnZ2VzdCA/IFNvbWV0aGluZyBsaWtlIHRoZSBwYXRjaCBiZWxvdyB3aGlj
aCB3b3VsZAo+ID4+IGNhbGwgYSAndHJhaW4nIG9wZXJhdGlvbiBhdCB0aGUgZW5kIG9mIHNwaV9h
ZGRfZGV2aWNlKCkuICAKPiA+IAo+ID4gVGhpcyBoYXMgYmVlbiBkaXNjdXNzZWQgaW4gdGhlIHBh
c3Qgd2l0aCBWaWduZXNoLCBidXQgSSBjYW4ndCBmaW5kIHRoZQo+ID4gdGhyZWFkIHdoZXJlIHRo
aXMgZGlzY3Vzc2lvbiBoYXBwZW5lZC4gTXkgdW5kZXJzdGFuZGluZyB3YXMgdGhhdCBsaW5rCj4g
PiB0cmFpbmluZyB3b3VsZCB1c2UgYSBjb21tYW5kIHdpdGggd2VsbC1rbm93biBvdXRwdXQgKGlz
IHRoZXJlIGEKPiA+IGRlZGljYXRlZCBTUEkgTk9SIGNvbW1hbmQgZm9yIHRoYXQ/KSBhbmQgdGVz
dCBkaWZmZXJlbnQgY2xrIHNldHRpbmdzCj4gPiB1bnRpbCBpdCBmaW5kcyBvbmUgdGhhdCB3b3Jr
cy4gIAo+IAo+IFRoZSByZWFkIHRyYWluaW5nIG9uIEFzcGVlZCBjb25zaXN0cyBvZiBmaW5kaW5n
IHRoZSBhcHByb3ByaWF0ZSByZWFkCj4gdGltaW5nIGRlbGF5cyBmb3Igd2VsbC1rbm93biBIQ0xL
IGRpdmlkZXJzIGFuZCBzdG9yZSB0aGUgcmVzdWx0cyBpbiAKPiB0aGUgUmVhZCBUaW1pbmcgQ29t
cGVuc2F0aW9uIHJlZ2lzdGVyLiAKPiAKPiBXZSBmaXJzdCByZWFkIGEgZ29sZGVuIGJ1ZmZlciBh
dCBsb3cgc3BlZWQgYW5kIHRoZW4gcGVyZm9ybSByZWFkcyB3aXRoIAo+IGRpZmZlcmVudCBjbG9j
a3MgYW5kIGRlbGF5IGN5Y2xlIHNldHRpbmdzIHRvIGZpbmQgYSBicmVha2luZyBwb2ludC4KCldo
ZXJlIGRvZXMgdGhpcyBnb2xkZW4gYnVmZmVyIGNvbWUgZnJvbT8gRG8geW91IGhhdmUgYSBzcGVj
aWZpYyBjb21tYW5kCnRvIGFjY2VzcyBpdD8gSXMgaXQgYSBOT1Igc2VjdGlvbiB3aXRoIHdlbGwt
a25vd24gZGF0YT8KCj4gVGhpcyAKPiBzZWxlY3RzIHRoZSBkZWZhdWx0IGNsb2NrIGZyZXF1ZW5j
eSBmb3IgdGhlIENFeCBjb250cm9sIHJlZ2lzdGVyLiAKPiAKPiAgCj4gPj4gQWxzbywgd2hlbiBk
b2luZyByZWFkIHRyYWluaW5nLCB3ZSBtaWdodCBuZWVkIHRvIGtub3cgc29tZSBsb3dsZXZlbCAK
PiA+PiBjaGFyYWN0ZXJpc3RpY3Mgb2YgdGhlIGNoaXAgYmVpbmcgdHJhaW5lZC4gU2hvdWxkIHdl
IG9mZmVyIGEgd2F5IAo+ID4+IHRvIGdyYWIgdGhlIHByb2JlZCBtMjVwODAgZGV2aWNlIGFuZCBn
aXZlIGFjY2VzcyB0byB0aGUgdW5kZXJseWluZyAKPiA+PiAnc3RydWN0IHNwaV9ub3InID8gCj4g
Pj4KPiA+PiAgIHN0YXRpYyBzdHJ1Y3Qgc3BpX25vciAqc3BpX2dldF9wbm9yKHN0cnVjdCBzcGlf
ZGV2aWNlICpzcGkpCj4gPj4gICB7Cj4gPj4gCXN0cnVjdCBzcGlfbWVtICpzcGltZW0gPSBzcGlf
Z2V0X2RydmRhdGEoc3BpKTsKPiA+PiAJc3RydWN0IG0yNXAgKmZsYXNoID0gc3BpX21lbV9nZXRf
ZHJ2ZGF0YShzcGltZW0pOwo+ID4+Cj4gPj4gCXJldHVybiBmbGFzaCA/ICZmbGFzaC0+c3BpX25v
ciA6IE5VTEw7Cj4gPj4gICB9Cj4gPj4KPiA+PiBZZWFoLCBpdCdzIGhpZGVvdXMuIEkganVzdCB3
YW50IHRvIHJhaXNlIHRoZSBpc3N1ZS4gIAo+ID4gCj4gPiBPaCBuby4gV2UgZGVmaW5pdGVseSBk
b24ndCB3YW50IHRvIGV4cG9zZSB0aGUgc3BpX25vciBjaGlwIHRvIHRoZQo+ID4gc3BpX21lbSBs
YXllciwgYnV0LCBpZiBuZWVkZWQsIHdlIGNhbiBhZGQgbW9yZSBmaWVsZHMgdG8gc3BpX21lbSBh
bmQKPiA+IGxldCB0aGUgc3BpX21lbSBkcml2ZXIgZmlsbCB0aGVtLiBXZSBqdXN0IG5lZWQgdG8g
ZmlndXJlIG91dCB3aGF0J3MKPiA+IHJlYWxseSBuZWVkZWQuICAKPiAKPiBXZSBuZWVkIHRoZSBT
UEkvTk9SIGZsYXNoIGNoYXJhY3RlcmlzdGljcyBmb3IgbGluayB0cmFpbmluZyBhbmQgaXRzIAo+
IHNpemUgdG8gY29uZmlndXJlIHRoZSBjb250cm9sbGVyIHRvIGFjY2VzcyB0aGUgQ1Mgb24gdGhl
IEFIQiB3aW5kb3cuIAoKV2UgbWFuYWdlZCB0byBkZWFsIHdpdGggZGlyZWN0IG1hcHBpbmcgd2l0
aG91dCBoYXZpbmcgdG8gZXhwbGljaXRseSBwYXNzCnRoZSBOT1Igc2l6ZSAod2UganVzdCBwYXNz
IHRoZSBzaXplIG9mIHRoZSBkaXJlY3QgbWFwcGluZyB3ZSB3YW50IHRvCmNyZWF0ZSkuIFdoYXQg
ZG8geW91IG5lZWQgdGhlIHNpemUgZm9yPyBJcyBpdCBqdXN0IHRvIGNvbmZpZ3VyZSB0aGUgQUhC
CndpbmRvdyBmb3IgdGhlIGxpbmstdHJhaW5pbmcgc3R1ZmY/IElmIHRoYXQncyB0aGUgY2FzZSwg
SSBndWVzcyB0aGlzCmNhbiBiZSBwYXJ0IG9mIHRoZSBvcF90ZW1wbGF0ZSBJIHdhcyB0YWxraW5n
IGFib3V0LCBvciBtYXliZSBwYXNzZWQgYXMKZXh0cmEgcGFyYW1ldGVycy4KCj4gCj4gWyAuLi4g
XQo+IAo+ID4+ICAJaW50ICgqZndfdHJhbnNsYXRlX2NzKShzdHJ1Y3Qgc3BpX2NvbnRyb2xsZXIg
KmN0bHIsIHVuc2lnbmVkIGNzKTsKPiA+PiArCj4gPj4gKwlpbnQJCQkoKnRyYWluKShzdHJ1Y3Qg
c3BpX2RldmljZSAqc3BpKTsgIAo+ID4gCj4gPiBXYXMgbW9yZSB0aGlua2luZyBvZiBzb21ldGhp
bmcgbGlrZToKPiA+IAo+ID4gCWludCAoKmxpbmtfc2V0dXApKHN0cnVjdCBzcGlfbWVtICptZW0s
Cj4gPiAJCQkgIHN0cnVjdCBzcGlfbWVtX29wICpvcF90ZW1wbGF0ZSwKPiA+IAkJCSAgLi4uKTsK
PiA+IAo+ID4gd2hlcmUgdGhlIG9wX3RlbXBsYXRlIHdvdWxkIHBvdGVudGlhbGx5IGRpZmZlciBk
ZXBlbmRpbmcgb24gdGhlIHR5cGUgb2YKPiA+IG1lbW9yeSAoTk9SLCBOQU5ELCBTUkFNPykuIEkg
YWxzbyBkb24ndCBrbm93IHdoYXQgb3RoZXIgcGFyYW1zIHdvdWxkIGJlCj4gPiBuZWVkZWQgdG8g
ZG8gdGhlIGxpbmsgdHJhaW5pbmcuICAKPiAKPiBUaGUgQXNwZWVkIGNvbnRyb2xsZXIgbmVlZHMg
dG8gc2V0IHJlYWQgZGVsYXkgdGltaW5ncyBhdCBkaWZmZXJlbnQgSENMSwo+IHNldHRpbmdzLiBJ
dCdzIGRvaW5nIHJlYWQgb3BlcmF0aW9ucyB3aXRoIHRoZSBkZWZhdWx0IElPIG1vZGUuCgpTbyB5
b3UgbmVlZCBpbmZvcm1hdGlvbiBhYm91dCB0aGUgdGhlb3JldGljYWwgcmVhZCBkZWxheSBzbyB5
b3UgY2FuCmFkanVzdCB0aGVtLCByaWdodC4gSSBndWVzcyB0aGF0J3Mgc29tZXRoaW5nIHdlIGNh
biBwYXNzIHRvIHRoZQotPmxpbmtfc2V0dXAoKSBob29rLgoKPiAgCj4gPiBCVFcsIHRoaXMgaG9v
ayBzaG91bGQgYmUgaW4gdGhlIHNwaV9tZW1fY29udHJvbGxlcl9vcHMgc3RydWN0IG5vdCBpbgo+
ID4gc3BpX2NvbnRyb2xsZXIuICAKPiAKPiBvay4gTGV0J3Mgd2FpdCBmb3IgZmVlZGJhY2sgZnJv
bSBWaW5lc2guCgpUaGFua3MgZm9yIHN0YXJ0aW5nIHRoaXMgZGlzY3Vzc2lvbi4KCkJvcmlzCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
