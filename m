Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9520C61DA4
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Feb 2023 15:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I16xduV6nTClIeIiEOXQ1XqFi5u+94ZMHno2naWa7jw=; b=TlRZRfCy7vncMr
	/iPlJUxnjDDfIGoOf5S2feE+tkvdkNWYJ8mVIXPCR6HXQwqoMX2E2f0rPmZAsFr8eJaGlSPxfzt9P
	ig3sg3qzd/hA7IE63axFOKItmNtJoKglMEL3tcw5cwoHnS1pzNUfxSnh+sb7KAWqdbgiwfctLYvHf
	MPkZsHr+FkWV5ue5v5PktHM/Oul/RDmh/aX0vmBV9d7ar1zQRrEoQjmWOcgczpigGiipghxp0xsmT
	bkGJPoj7t+xaf+RwnCFGZk0lceEnAyz6mDC/eqru5EcB13yaNdxsj40eiKaEdvZcIR6e9eTe2jWF7
	D9wzwcylqsH4dZFKnnYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRxfl-002fkU-O8; Tue, 14 Feb 2023 15:56:49 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRxfh-002fjU-4n
	for linux-mtd@lists.infradead.org; Tue, 14 Feb 2023 15:56:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8F2A52000A;
	Tue, 14 Feb 2023 15:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676390200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vNKGSGMg8f++uU4wWjyIvzgyGnDvNR/WlS+2/U80G8U=;
	b=Ejr7sNtEtXRqpXUU+WCTcDwLrHnimWJPzCRHYgSteerTTDCqasSDuy0z7imGZIbDP+qrap
	03llLZoGdnzSzOHE75z7OC7a/uDELmhZLByqKufP6q1JsgmEOwjEdxwYGPd+MEybsI2m9y
	1CUSy9Y+2T3mqLk6EOCqlBP1/piLzDIm8LqCb9fQKPpCtJyBgG/ixmugcsvrFRcUwqzmg8
	8tKYN704Yar6jK56J2RuNaBe8hCSt1cU8mrEDGvoDD2LhK64AuS9IIOMi4C4VKcFMq8BfD
	uV07gry0AztsNvAV7VPn8IgSQpXyCjIqh/gd8W3PrBDTlybL5KdfFfFFWNYUVQ==
Date: Tue, 14 Feb 2023 16:56:37 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document CPOL/CPHA
 support
Message-ID: <20230214165637.56102b18@xps-13>
In-Reply-To: <CAMuHMdVK7vOTNMF53SvHn8LtiHX7MSN-Fp80jngSsosYBhhrHQ@mail.gmail.com>
References: <afe470603028db9374930b0c57464b1f6d52bdd3.1676384304.git.geert+renesas@glider.be>
	<20230214154433.6a421c51@xps-13>
	<CAMuHMdVK7vOTNMF53SvHn8LtiHX7MSN-Fp80jngSsosYBhhrHQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_075645_468137_5BAD0A1C 
X-CRM114-Status: GOOD (  24.98  )
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

SGkgR2VlcnQsCgpnZWVydEBsaW51eC1tNjhrLm9yZyB3cm90ZSBvbiBUdWUsIDE0IEZlYiAyMDIz
IDE2OjIyOjE1ICswMTAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gVHVlLCBGZWIgMTQsIDIwMjMg
YXQgMzo0NCBQTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90
ZToKPiA+IGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlIHdyb3RlIG9uIFR1ZSwgMTQgRmViIDIwMjMg
MTU6MjY6NDMgKzAxMDA6ICAKPiA+ID4gU1BJIEVFUFJPTXMgdHlwaWNhbGx5IHN1cHBvcnQgYm90
aCBTUEkgTW9kZSAwIChDUE9MPUNQSEE9MCkgYW5kIE1vZGUgMwo+ID4gPiAoQ1BPTD1DUEhBPTEp
LiAgSG93ZXZlciwgdXNpbmcgdGhlIGxhdHRlciBpcyBjdXJyZW50bHkgZmxhZ2dlZCBhcyBhbgo+
ID4gPiBlcnJvciBieSAibWFrZSBkdGJzX2NoZWNrIiwgZS5nLjoKPiA+ID4KPiA+ID4gICAgIGFy
Y2gvYXJtL2Jvb3QvZHRzL3I4YTc3OTEta29lbHNjaC5kdGI6IGZsYXNoQDA6IFVuZXZhbHVhdGVk
IHByb3BlcnRpZXMgYXJlIG5vdCBhbGxvd2VkICgnc3BpLWNwaGEnLCAnc3BpLWNwb2wnIHdlcmUg
dW5leHBlY3RlZCkKPiA+ID4gICAgICAgICAgIEZyb20gc2NoZW1hOiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbAo+ID4gPgo+ID4gPiBGaXgg
dGhpcyBieSBkb2N1bWVudGluZyBzdXBwb3J0IGZvciBDUE9MPUNQSEE9MS4KPiA+ID4KPiA+ID4g
Rml4ZXM6IDIzMzM2M2FiYTcyYWM2MzggKCJzcGkvcGFuZWw6IGR0LWJpbmRpbmdzOiBkcm9wIENQ
SEEgYW5kIENQT0wgZnJvbSBjb21tb24gcHJvcGVydGllcyIpCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4gPiA+IC0tLQo+
ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9y
LnlhbWwgfCA3ICsrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykK
PiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvamVkZWMsc3BpLW5vci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9qZWRlYyxzcGktbm9yLnlhbWwKPiA+ID4gaW5kZXggZjg2MjU1Y2UxM2FmMDg3MS4u
YmI2MmFjNDU4NTgyMjk4MiAxMDA2NDQKPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9yLnlhbWwKPiA+ID4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9yLnlhbWwKPiA+ID4gQEAg
LTc2LDYgKzc2LDEzIEBAIHByb3BlcnRpZXM6Cj4gPiA+ICAgICAgICBJZiAiYnJva2VuLWZsYXNo
LXJlc2V0IiBpcyBwcmVzZW50IHRoZW4gaGF2aW5nIHRoaXMgcHJvcGVydHkgZG9lcyBub3QKPiA+
ID4gICAgICAgIG1ha2UgYW55IGRpZmZlcmVuY2UuCj4gPiA+Cj4gPiA+ICsgIHNwaS1jcG9sOiB0
cnVlCj4gPiA+ICsgIHNwaS1jcGhhOiB0cnVlICAKPiA+Cj4gPiBJIHNlZSB0aGF0IHNwaS1jcG9s
IGFuZCBzcGktY3BoYSBhcmUgZGVzY3JpYmVkIGluIHNwaS1jb250cm9sbGVyLnlhbWwKPiA+IHdo
aWNoIHJlZmVyZW5jZXMgc3BpLXBlcmlwaGVyYWwtcHJvcHMueWFtbCwgYnV0IGplZGVjLHNwaS1u
b3IueWFtbAo+ID4gb25seSByZWZlcmVuY2VzIHNwaS1wZXJpcGhlcmFsLXByb3BzLnlhbWwgbGVh
ZGluZyB0byBzcGktY3BvbCBhbmQKPiA+IHNwaS1jcGhhIG5vdCBiZWluZyByZWNvZ25pemVkIGFz
IHZhbGlkIHByb3BlcnRpZXMuCj4gPgo+ID4gV291bGRuJ3QgaXQgYmUgY2xlYW5lciB0byB0byBo
YXZlIHRoZXNlIHR3byBwcm9wZXJ0aWVzIGRlZmluZWQgaW4KPiA+IHNwaS1wZXJpcGhlcmFsLXBy
b3BzLnlhbWwgaW5zdGVhZD8gIAo+IAo+IFRoZXkgd2VyZSBtb3ZlZCBvdXQgb2YgdGhhdCBmaWxl
IGJ5IHRoZSBjb21taXQgcmVmZXJlbmNlZCBpbiB0aGUKPiBGaXhlczogdGFnIGFib3ZlLCBiZWNh
dXNlIHRoZXkgYXJlIG5vdCBzdXBwb3J0ZWQgYnkgYWxsIFNQSSB0YXJnZXRzLgo+IEl0J3MgdGhl
IHJlc3BvbnNpYmlsaXR5IG9mIHRoZSBTUEkgdGFyZ2V0IGJpbmRpbmdzIHRvIGxpc3Qgd2hhdCBp
cyBzdXBwb3J0ZWQuCgpPb3BzLCBJIG92ZXJsb29rZWQgdGhhdCBsaW5lLgoKSSBhY3R1YWxseSBz
ZWUgbm8gcG9pbnQgaW4gY29uc3RyYWluaW5nIGRldmljZSB0cmVlcyBvbiB0aGF0IHJlZ2FyZCwK
YnV0LCB3ZWxsLCBLcnp5c3p0b2YgaXMgdGhlIGF1dGhvciwgSSBiZWxpZXZlIGhlIGtub3dzIGhp
cyBzdHVmZiwgc28KbGV0J3MgZ28gZm9yIGl0LgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
