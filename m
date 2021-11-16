Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36C5C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 08:20:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B39F61B49
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 08:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B39F61B49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1LBIgsrmDjXSAu2lJdIKJ3mhYFEDmqxRHPpFUZXeLAg=; b=blnJechxxIo8ck
	Oi3tS2xb6E+lU7hA+xsukApZBDwwPdV05G/PLq20bgqK2PdFI/rmXEH7h0tMDwhT1+XEDiotMu2Gk
	6JtU0MXiYNHJ3xeuU4IF7sWSJWh9ow7mQcTlNTo8UP4taINQpsr7HbOJjwKyRDETz6sx9b7TUYl+g
	7JiTMrthb2SnBYUNoPyVSNW+Z8aO9cu+7SJnp9n3MGP+AiY/3BhgD7NQpqeKm7IdFMALt3MMt9dFM
	o4hL9niys3oPcBHOzrUlnbkmUQlDBt39Fq+licj5JR7nGNkAN1wHmtBgs5cLBqqkm8P47XRVYaSWy
	KtQ4q7QVdfpqlQYDfqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmtgg-000fj1-B4; Tue, 16 Nov 2021 08:19:30 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmtgc-000fiF-Pc
 for linux-mtd@lists.infradead.org; Tue, 16 Nov 2021 08:19:28 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 7D5AAFF811;
 Tue, 16 Nov 2021 08:19:19 +0000 (UTC)
Date: Tue, 16 Nov 2021 09:19:18 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>, Mark Brown
 <broonie@kernel.org>, <linux-mtd@lists.infradead.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Michal Simek <monstr@monstr.eu>
Subject: Re: [RFC PATCH 0/3] Dual stacked/parallel memories bindings
Message-ID: <20211116091918.62143e75@xps13>
In-Reply-To: <20211115102308.64chfwj2vtssiyin@ti.com>
References: <20211112152411.818321-1-miquel.raynal@bootlin.com>
 <20211115102308.64chfwj2vtssiyin@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_001927_008508_E4FD62FB 
X-CRM114-Status: GOOD (  33.36  )
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

SGkgUHJhdHl1c2gsCgpwLnlhZGF2QHRpLmNvbSB3cm90ZSBvbiBNb24sIDE1IE5vdiAyMDIxIDE1
OjUzOjEwICswNTMwOgoKPiBPbiAxMi8xMS8yMSAwNDoyNFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
Ogo+ID4gSGVsbG8gUm9iLCBNYXJrLCBUdWRvciAmIFByYXR5dXNoLAo+ID4gCj4gPiBIZXJlIGlz
IGFuIFJGQyB0byBvcGVuIHRoZSBkaXNjdXNzaW9uIGFib3V0IHRoZSBzZW5zaXRpdmUgdGFzayBv
Zgo+ID4gc3VwcG9ydGluZyBzcGVjaWZpYyBTUEkgY29udHJvbGxlciBtb2RlcyBsaWtlIFhpbGlu
eCdzIHdoZXJlIHRoZQo+ID4gY29udHJvbGxlciBjYW4gaGlnaGx5IGFic3RyYWN0IHRoZSBoYXJk
d2FyZSBhbmQgcHJvdmlkZSBhY2Nlc3MgdG8gYQo+ID4gc2luZ2xlIGJpZ2dlciBkZXZpY2UgaW5z
dGVhZC4gSSdsbCBsZXQgeW91IGdvIHRocm91Z2ggdGhlIHNlcmllcyBhbmQKPiA+IHRlbGwgbWUg
d2hhdCB5b3UgdGhpbmsuCj4gPiAKPiA+IEkgdGhpbmsgdGhlcmUgYXJlIHR3byBwb3NzaWJsZSBh
cHByb2FjaGVzOgo+ID4gMS0gRGVzY3JpYmUgdGhlIHR3byBkZXZpY2VzIGFzIGJlaW5nIGEgc2lu
Z2xlIG9uZSB3aGljaCBpcyB3aGF0IHdlIHdpbGwKPiA+ICAgIGdldCBmcm9tIHRoZSBjb250cm9s
bGVyIGFueXdheSAoaW1wbGllcyBzdXBwb3J0aW5nIHR3byBDUyBwZXIgU1BJCj4gPiAgICBkZXZp
Y2UpCj4gPiBvcgo+ID4gMi0gRGVzY3JpYmUgdGhlIHR3byBkZXZpY2VzIGluIHRoZSBkZXZpY2Ug
dHJlZSBhbmQgdGhlbiBieSBzb2Z0d2FyZSBoYWNrCj4gPiAgICBpbnRvIHRoZSBNVEQgY29yZSB0
byBzaW11bGF0ZSBhIHNpbmdsZSBkZXZpY2UgdG8gdGFsayB0by4gIAo+IAo+IEFwcHJvYWNoIDEg
bWFrZXMgbW9yZSBzZW5zZSB0byBtZSBzaW5jZSBvbmNlIHdlIGltcGxlbWVudCBpdCB5b3UgY2Fu
IAo+IGFsc28gdXNlIHN1Y2ggbXVsdGktQ1MgZmxhc2hlcyB3aXRoICJkdW1iZXIiIGNvbnRyb2xs
ZXJzIGFzIHdlbGwgbGlrZSAKPiBzcGktY2FkZW5jZS1xdWFkc3BpLiBUaGVyZSwgdGhlIGRyaXZl
ciB3b3VsZCBoYXZlIHRvIG1hbnVhbGx5IHNldCB0aGUgCj4gY2hpcCBzZWxlY3QgaW5zdGVhZCBv
ZiBpdCBiZWluZyBkb25lIGF1dG9tYXRpY2FsbHkgYnkgbG9va2luZyBhdCB0aGUgdG9wIAo+IGJp
dC4gVGhpcyB3b3VsZCBhdCBsZWFzdCB3b3JrIGZvciB0aGUgZHVhbC1zdGFja2VkIG1lbW9yaWVz
LgoKSSBiZWxpZXZlIGl0IHdvdWxkLiBCdXQgaW4gdGhhdCBjYXNlIHdlIHNob3VsZCB0aGluayBh
Ym91dCBhIG1vcmUKZ2VuZXJpYyBiaW5kaW5nIGZvciB0aGUgc3RhY2tlZCBtb2RlLiBTbyBmYXIg
SSd2ZSBwcm9wb3NlZDoKLSB4bG54LGR1YWwtc3RhY2tlZC1tZW1vcmllcwotIHhsbngsZHVhbC1w
YXJhbGxlbC1tZW1vcmllcwoKSXQgYWN0dWFsbHkgbG9va3MgbGlrZSB0aGUgZm9ybWVyIG1pZ2h0
IGJlIGEgZ2VuZXJpYyBiaW5kaW5nLiBXaGF0IGRvCnlvdSB0aGluayBpcyBiZXN0IGJldHdlZW46
Ci0gJ2R1YWwtc3RhY2tlZC1tZW1vcmllcycKLSAnc3RhY2tlZC1tZW1vcmllcycgKCdkdWFsJyBp
cyBlbmNvZGVkIGluIHRoZSByZWcgcHJvcGVydHkpCi0gbm8gc3BlY2lmaWMgcHJvcGVydHksIGl0
J3MganVzdCBhIG1lbW9yeSB3aXRoIHR3byBDUywgYWdhaW4gJ3JlZycKICBnaXZlcyB1cyB0aGUg
aW5mb3JtYXRpb24uCgpUaGVuIHdlIGNvdWxkIGtlZXAgb25seSB0aGUgbGF0dGVyIHByb3BlcnR5
LCB3aGljaCBsb29rcyBtb3JlIHNwZWNpZmljCnRvIFhpbGlueCBhbmQgdXNlIGl0IGFzIGEgZmxh
c2ggbm9kZSBwcm9wZXJ0eSBpbnN0ZWFkIChhcyBhZHZpc2VkCmJ5IE1hcmspLgoKPiBIb3cgSSBl
bnZpc2lvbiB0aGlzIGJlaW5nIGltcGxlbWVudGVkIGlzIHRoYXQgU1BJIE5PUiB3b3VsZCBiZSBh
d2FyZSBvZiAKPiB0aGUgbnVtYmVyIG9mIENoaXAgU2VsZWN0cyBhbmQgd2hlbiB0byB1c2Ugd2hp
Y2ggb25lLCBhbmQgaXQgd291bGQgCj4gc3BlY2lmeSB0aGUgQ1MgdmFsdWUgaW4gdGhlIFNQSSBN
RU0gb3AuCgpZZXMsIHRoaXMgaXMgdGhlIGFwcHJvYWNoIEkgaGFkIGluIG1pbmQgdG8uIFRoaXMg
Zml0cyBib3RoIHRoZSBwdXJwb3NlCm9mIFNQSS1OT1IgYW5kIFNQSS1OQU5EIHdoaWNoIHdpbGwg
Ym90aCBuZWVkIHRvIGJlIHVwZGF0ZWQgYXMgd2VsbCB0dQpzdXBwb3J0IG11bHRpLUNTLgoKPiBU
aGUgY29udHJvbGxlciBkcml2ZXIgY2FuIHRoZW4gCj4gZXhlY3V0ZSB0aGlzIG9wIGFzIG5lZWRl
ZC4gT25lIHBvaW50IHRvIG5vdGUgaGVyZSBpcyB0aGF0IHRoZSBlbnRpcmUgCj4gbWVtb3J5IHdv
bid0IGJlIHJlYWQgaW4gYSBzaW5nbGUgdHJhbnNhY3Rpb24uIFRoZXJlIHdvdWxkIGJlIDIgCj4g
dHJhbnNhY3Rpb25zOiBvbmUgd2l0aCBDUz0wIGFuZCBvbmUgd2l0aCBDUz0xLiBJcyB0aGlzIGZp
bmUgZm9yIHlvdT8gRG8gCj4geW91IGhhdmUgc29tZXRoaW5nIGVsc2UgaW4gbWluZD8KCkkgYmVs
aWV2ZSB0aGlzIHNob3VsZCBiZSBsZXQgdG8gdGhlIGNvbnRyb2xsZXIncyBkaXNjcmV0aW9uIGFu
ZCBhcHBlYXIKbGlrZSBhIHNpbmdsZSBvcCBpbiB0aGUgdXBwZXIgbGF5ZXJzLgoKPiBJIGFtIG5v
dCBzdXJlIGhvdyB0aGlzIG1vZGVsIHdvdWxkIHdvcmsgZm9yIGEgZHVhbC1wYXJhbGxlbCBtZW1v
cnkgCj4gdGhvdWdoLgoKSWYgdGhlIGNvbnRyb2xsZXIgaXMgYXdhcmUgb2YgdGhlIHR3byBDUyBh
bmQga25vd3MgYWJvdXQgdGhlIGZ1bGwKcmVxdWVzdCB3ZSBjYW4gaG9wZSB0aGF0IGludGVncmF0
aW9uIHdvbid0IGJlIGRpZmZpY3VsdCAobGFzdCBmYW1vdXMKd29yZHMpLgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
