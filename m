Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B87C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 09:50:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D88720836
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 09:50:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NxuTmYaX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D88720836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0HidKM/5EBv81EMoroiKler+FxlEHHLqDQvyAxi5z9c=; b=NxuTmYaXbhZ22e
	/nwfqvwiDggUNKQrkTCa5VQl7kWWKBJKt/wgz5zyjE8SIGJ31pvMjSlFKrN3RuaoD1SB2G9ztWX7L
	ZSCLNJi8bG83a6d268IGlwMO7X+0fqtNhdXcrqs3BO8Dz4XHOfOv6K++FyQGxc5X7B+XKlOLeSsuw
	8lLfoVJwdD5GXl5a/uzsFuCLQ8cnndNIe74vVmQCfMNAZr4xmWJqO4pLfysXeUjLnqjuzjMXrRvHu
	KV3i04xDiJNChpMh3nLcH6t1Fsbsx/dNiB16DZtd/BzdwqIE+lKdVUczCTwCEFUMJgOhAd1gcOGFv
	5RQIcRfuhjb2GiBHX7yQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0kEt-0006Am-GP; Mon, 04 Mar 2019 09:50:27 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0kEq-00069u-Jg
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 09:50:26 +0000
Received: from xps13 (aaubervilliers-681-1-27-150.w90-88.abo.wanadoo.fr
 [90.88.147.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0F483200002;
 Mon,  4 Mar 2019 09:50:14 +0000 (UTC)
Date: Mon, 4 Mar 2019 10:50:14 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 2/9] dt-bindings: mtd: ingenic: Change 'BCH' to 'ECC'
 in documentation
Message-ID: <20190304105014.0cceea0a@xps13>
In-Reply-To: <20190209192305.4434-2-paul@crapouillou.net>
References: <20190209192305.4434-1-paul@crapouillou.net>
 <20190209192305.4434-2-paul@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_015024_953126_9A7EBA60 
X-CRM114-Status: GOOD (  24.26  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGF1bCwKClBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZSBvbiBT
YXQsICA5IEZlYiAyMDE5IDE2OjIyOjU4Ci0wMzAwOgoKPiBUaGUgSlo0NzQwIEVDQyBoYXJkd2Fy
ZSBpcyBub3QgQkNIIGJ1dCBSZWVkLVNvbG9tb24sIHNvIGl0IG1ha2VzIG1vcmUKPiBzZW5zZSB0
byB1c2UgdGhlIG1vcmUgZ2VuZXJpYyBFQ0MgdGVybS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVs
IENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KPiAtLS0KPiAKPiBDaGFuZ2VzOgo+IAo+
IHYzOiBOZXcgcGF0Y2gKPiAKPiB2NDogTm8gY2hhbmdlCj4gCj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9pbmdlbmljLGp6NDc4MC1uYW5kLnR4dCAgICB8IDE4ICsrKysrKysrKy0tLS0t
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2lu
Z2VuaWMsano0NzgwLW5hbmQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9pbmdlbmljLGp6NDc4MC1uYW5kLnR4dAo+IGluZGV4IGE1Yjk0MGYxOGJmNi4uNWE0NWNj
NTRmNDZkIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvaW5nZW5pYyxqejQ3ODAtbmFuZC50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL2luZ2VuaWMsano0NzgwLW5hbmQudHh0Cj4gQEAgLTEsNCArMSw0IEBA
Cj4gLSogSW5nZW5pYyBKWjQ3ODAgTkFORC9CQ0gKPiArKiBJbmdlbmljIEpaNDc4MCBOQU5EL0VD
Qwo+ICAKPiAgVGhpcyBmaWxlIGRvY3VtZW50cyB0aGUgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9y
IE5BTkQgZmxhc2ggZGV2aWNlcyBvbiB0aGUKPiAgSlo0NzgwLiBOQU5EIGRldmljZXMgYXJlIGNv
bm5lY3RlZCB0byB0aGUgTkVNQyBjb250cm9sbGVyIChkZXNjcmliZWQgaW4KPiBAQCAtMTQsMTAg
KzE0LDEwIEBAIFJlcXVpcmVkIE5BTkQgY29udHJvbGxlciBkZXZpY2UgcHJvcGVydGllczoKPiAg
ICBhbiBvZmZzZXQgb2YgMCBhbmQgYSBzaXplIG9mIDB4MTAwMDAwMCAoaS5lLiB0aGUgd2hvbGUg
TkVNQyBiYW5rKS4KPiAgCj4gIE9wdGlvbmFsIE5BTkQgY29udHJvbGxlciBkZXZpY2UgcHJvcGVy
dGllczoKPiAtLSBpbmdlbmljLGJjaC1jb250cm9sbGVyOiBUbyBtYWtlIHVzZSBvZiB0aGUgaGFy
ZHdhcmUgQkNIIGNvbnRyb2xsZXIsIHRoaXMKPiAtICBwcm9wZXJ0eSBtdXN0IGNvbnRhaW4gYSBw
aGFuZGxlIGZvciB0aGUgQkNIIGNvbnRyb2xsZXIgbm9kZS4gVGhlIHJlcXVpcmVkCj4gKy0gaW5n
ZW5pYyxiY2gtY29udHJvbGxlcjogVG8gbWFrZSB1c2Ugb2YgdGhlIGhhcmR3YXJlIEVDQyBjb250
cm9sbGVyLCB0aGlzCj4gKyAgcHJvcGVydHkgbXVzdCBjb250YWluIGEgcGhhbmRsZSBmb3IgdGhl
IEVDQyBjb250cm9sbGVyIG5vZGUuIFRoZSByZXF1aXJlZAoKSSB0aGluayB0aGVyZSBpcyBhbHJl
YWR5IGEgJ2VjYy1lbmdpbmUnIHByb3BlcnR5IHVzZWQgYnkgTVRLIGFuZCBBdG1lbApOQU5EIGNv
bnRyb2xsZXJzIHRvIHBvaW50IHRvIHRoZSBFQ0MgZW5naW5lIGJsb2NrLiBQbGVhc2UgdXNlIHRo
aXMKcHJvcGVydHkgaW5zdGVhZCBvZiB0aGUgaW5nZW5pYyBzcGVjaWZpYyBvbmUuCgo+ICAgIHBy
b3BlcnRpZXMgZm9yIHRoaXMgbm9kZSBhcmUgZGVzY3JpYmVkIGJlbG93LiBJZiB0aGlzIGlzIG5v
dCBzcGVjaWZpZWQsCj4gLSAgc29mdHdhcmUgQkNIIHdpbGwgYmUgdXNlZCBpbnN0ZWFkLgo+ICsg
IHNvZnR3YXJlIEVDQyB3aWxsIGJlIHVzZWQgaW5zdGVhZC4KPiAgCj4gIE9wdGlvbmFsIGNoaWxk
cmVuIG5vZGVzOgo+ICAtIEluZGl2aWR1YWwgTkFORCBjaGlwcyBhcmUgY2hpbGRyZW4gb2YgdGhl
IE5BTkQgY29udHJvbGxlciBub2RlLgo+IEBAIC03MCwxNyArNzAsMTcgQEAgbmVtYzogbmVtY0Ax
MzQxMDAwMCB7Cj4gIAl9Owo+ICB9Owo+ICAKPiAtVGhlIEJDSCBjb250cm9sbGVyIGlzIGEgc2Vw
YXJhdGUgU29DIGNvbXBvbmVudCB1c2VkIGZvciBlcnJvciBjb3JyZWN0aW9uIG9uCj4gK1RoZSBF
Q0MgY29udHJvbGxlciBpcyBhIHNlcGFyYXRlIFNvQyBjb21wb25lbnQgdXNlZCBmb3IgZXJyb3Ig
Y29ycmVjdGlvbiBvbgo+ICBOQU5EIGRldmljZXMuIFRoZSBmb2xsb3dpbmcgaXMgYSBkZXNjcmlw
dGlvbiBvZiB0aGUgZGV2aWNlIHByb3BlcnRpZXMgZm9yIGEKPiAtQkNIIGNvbnRyb2xsZXIuCj4g
K0VDQyBjb250cm9sbGVyLgo+ICAKPiAtUmVxdWlyZWQgQkNIIHByb3BlcnRpZXM6Cj4gK1JlcXVp
cmVkIEVDQyBwcm9wZXJ0aWVzOgo+ICAtIGNvbXBhdGlibGU6IFNob3VsZCBiZSBvbmUgb2Y6Cj4g
ICAgKiBpbmdlbmljLGp6NDc0MC1lY2MKPiAgICAqIGluZ2VuaWMsano0NzI1Yi1iY2gKPiAgICAq
IGluZ2VuaWMsano0NzgwLWJjaAo+IC0tIHJlZzogU2hvdWxkIHNwZWNpZnkgdGhlIEJDSCBjb250
cm9sbGVyIHJlZ2lzdGVycyBsb2NhdGlvbiBhbmQgbGVuZ3RoLgo+IC0tIGNsb2NrczogQ2xvY2sg
Zm9yIHRoZSBCQ0ggY29udHJvbGxlci4KPiArLSByZWc6IFNob3VsZCBzcGVjaWZ5IHRoZSBFQ0Mg
Y29udHJvbGxlciByZWdpc3RlcnMgbG9jYXRpb24gYW5kIGxlbmd0aC4KPiArLSBjbG9ja3M6IENs
b2NrIGZvciB0aGUgRUNDIGNvbnRyb2xsZXIuCj4gIAo+ICBFeGFtcGxlOgo+ICAKClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
