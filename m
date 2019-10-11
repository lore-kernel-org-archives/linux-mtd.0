Return-Path: <SRS0=7oHA=YE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AD8ECE58C
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2019 06:45:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5254720650
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2019 06:45:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hOXof5Wy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5254720650
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=duJhhNTtwGWC43yJ82EpeeyajpTAz6PksXUx6XgeKdM=; b=hOXof5WyFV/hkZ
	HbZdWvps9lZbPnqpQiTn0JgLYtM+qf3Ggz6X2jFRugHlscFHJk23WRFGdNGb+Xtc3x+cmkOTg0jsP
	ZwW18FkaYEm7PAo+YhMOQsF8gqgmwg7asuXeyaKgxhjggHndou59zSTWM+4ogT44ZB5Ej6t8Hum1r
	4h538XzYkB13pzsfVcCz5fGe8fEXpDfVDqbwNdo0txbCpkz1DeHJpCQU7GTZASc2hCVqKEZaSAFuJ
	LIUMlZsuYjP2julWqjIlSa4yHR8U0QZqw2Ksgbg1JeiNw3O2aQN7x1mwo3ZYUBKkhsflnutrk5J/6
	HW1z6XGWruCiEZfEocZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iIogF-0000x3-BC; Fri, 11 Oct 2019 06:45:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIog6-0000pK-AR; Fri, 11 Oct 2019 06:45:31 +0000
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D1DE7289C93;
 Fri, 11 Oct 2019 07:45:26 +0100 (BST)
Date: Fri, 11 Oct 2019 08:45:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 00/16] mtd: spi-nor: aspeed: AST2600 support and extensions
Message-ID: <20191011084503.5b7a7c2c@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <CACPK8Xe__AYvrh40vqjwoM=XKJfp5MeqrMARpFUDGWCyJK6jXQ@mail.gmail.com>
References: <20191004115919.20788-1-clg@kaod.org>
 <20191009225555.67622339@dhcp-172-31-174-146.wireless.concordia.ca>
 <CACPK8Xe__AYvrh40vqjwoM=XKJfp5MeqrMARpFUDGWCyJK6jXQ@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191010_234530_494119_FD67D577 
X-CRM114-Status: GOOD (  21.05  )
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
 linux-mtd@lists.infradead.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAxMCBPY3QgMjAxOSAyMzo0Nzo0NSArMDAwMApKb2VsIFN0YW5sZXkgPGpvZWxAam1z
LmlkLmF1PiB3cm90ZToKCj4gT24gV2VkLCA5IE9jdCAyMDE5IGF0IDIwOjU2LCBCb3JpcyBCcmV6
aWxsb24KPiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+ID4KPiA+IEhp
IENlZHJpYywKPiA+Cj4gPiBPbiBGcmksICA0IE9jdCAyMDE5IDEzOjU5OjAzICswMjAwCj4gPiBD
w6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPiB3cm90ZToKPiA+ICAKPiA+ID4gSGVsbG8s
Cj4gPiA+Cj4gPiA+IFRoaXMgc2VyaWVzIGZpcnN0IGV4dGVuZHMgdGhlIHN1cHBvcnQgZm9yIHRo
ZSBBc3BlZWQgQVNUMjUwMCBhbmQKPiA+ID4gQVNUMjQwMCBTTUMgZHJpdmVyLiBJdCBhZGRzIER1
YWwgRGF0YSBzdXBwb3J0IGFuZCByZWFkIHRyYWluaW5nIGdpdmluZwo+ID4gPiB0aGUgYmVzdCBy
ZWFkIHNldHRpbmdzIGZvciBhIGdpdmVuIGNoaXAuIFN1cHBvcnQgZm9yIHRoZSBuZXcgQVNUMjYw
MAo+ID4gPiBTb0MgaXMgYWRkZWQgYXQgdGhlIGVuZC4KPiA+ID4KPiA+ID4gSSB1bmRlcnN0YW5k
IHRoYXQgYSBuZXcgc3BpX21lbSBmcmFtZXdvcmsgZXhpc3RzIGFuZCBJIGRvIGhhdmUgYW4KPiA+
ID4gZXhwZXJpbWVudGFsIGRyaXZlciB1c2luZyBpdC4gQnV0IHVuZm9ydHVuYXRlbHksIGl0IGlz
IGRpZmZpY3VsdCB0bwo+ID4gPiBpbnRlZ3JhdGUgdGhlIHJlYWQgdHJhaW5pbmcuIFRoZSBBc3Bl
ZWQgY29uc3RyYWludHMgYXJlIG5vdCBjb21wYXRpYmxlCj4gPiA+IGFuZCBpIGhhdmVuJ3QgaGFk
IHRoZSB0aW1lIHRvIGV4dGVuZCB0aGUgY3VycmVudCBmcmFtZXdvcmsuICAKPiA+Cj4gPiBIbSwg
SSBkb24ndCB0aGluayB0aGF0J3MgYSBnb29kIHJlYXNvbiB0byBwdXNoIG5ldyBmZWF0dXJlcyB0
byB0aGUKPiA+IGV4aXN0aW5nIGRyaXZlciwgZXNwZWNpYWxseSBzaW5jZSBJIGFza2VkIG90aGVy
cyB0byBtaWdyYXRlIHRoZWlyCj4gPiBkcml2ZXJzIHRvIHNwaS1tZW0gaW4gdGhlIHBhc3QuIEkg
ZG8gdW5kZXJzdGFuZCB5b3VyIGNvbmNlcm5zLCBhbmQgSSdsbAo+ID4gbGV0IHRoZSBTUEkgTk9S
L01URCBtYWludGFpbmVycyBtYWtlIHRoZSBmaW5hbCBjYWxsLCBidXQgSSB0aGluayBpdCdkCj4g
PiBiZSBiZXR0ZXIgZm9yIHRoZSBTUEkgTUVNIGVjb3N5c3RlbSB0byB0aGluayBhYm91dCB0aGlz
IGxpbmstdHJhaW5pbmcKPiA+IEFQSSAoVmlnbmVzaCBuZWVkcyBpdCBmb3IgdGhlIENhZGVuY2Ug
ZHJpdmVyIElJUkMpIHJhdGhlciB0aGFuIHB1c2hpbmcKPiA+IHRoaXMga2luZCBvZiBmZWF0dXJl
IHRvIHNwaS1ub3IgY29udHJvbGxlciBkcml2ZXJzLiAgCj4gCj4gQXMgQ2VkcmljIG1lbnRpb25l
ZCwgdGhlIE9wZW5CTUMgcHJvamVjdCBoYXMgYmVlbiBzaGlwcGluZyB0aGUgcmVhZAo+IHRyYWlu
aW5nIGNvZGUgZm9yIHRoZSBhc3QyNDAwL2FzdDI0MDAgZm9yIHNldmVyYWwgeWVhcnMgbm93LiBJ
dCB3b3VsZAo+IGJlIGdyZWF0IHRvIHNlZSBpdCBpbiBtYWlubGluZS4KPiAKPiBJIHRoaW5rIGl0
J3MgcmVhc29uYWJsZSB0byBhc2sgZm9yIHRoZSBkcml2ZXIgdG8gYmUgbW92ZWQgdG8gdGhlCj4g
c3BpLW1lbSBzdWJzeXN0ZW0gb25jZSBpdCBoYXMgdGhlIHJlcXVpcmVkIEFQSXMuCgpFeGNlcHQg
aXQgd29uJ3QgaGF2ZSB0aGUgbmVjZXNzYXJ5IEFQSXMgdW5sZXNzIHNvbWVvbmUgd29ya3Mgb24g
aXQsIGFuZAphZGRpbmcgdGhpcyBmZWF0dXJlIHRvIGV4aXN0aW5nIHNwaS1ub3IgZHJpdmVycyB3
b24ndCBoZWxwIGFjaGlldmluZwp0aGlzIGdvYWwuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
