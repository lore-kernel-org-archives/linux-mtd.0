Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D4FC25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 13:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gw46Fz5p6DYTUZ9c8vFm3QERUcaSpGdx6iU5YjbH3AU=; b=kGkcpPyjdO+DCP
	hHFX1uFJ7N+YijAhJpCVBB5pDFkoQyZb8cT3gVkB2STfussvaofz8edv+9Uvumo7rxHOxUNubadwj
	Xwp0IvLHTktZ6XpGQ4lpI13Xk6CCMHHiBKdbAyT47oxiSfnLLPs8AR/GdGnMckHe04kDHYy6aOusM
	onpCgfw3EekATF89e1Ese68hrc+L9Nm9x7fDnYMKzEOwdWiBOZKtLDPWjvh5VIbV9QBjLcDDjzt9J
	YYwXqNbVhlHJB8CIRvGxdnbzJJp2irAJv5qjSk9o654hEmE8HaLSHkyLexnogV530cRmgEL6tythk
	ahoGadZkniGR2dZkiJzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7anb-00000004vVL-1ZBw;
	Thu, 16 May 2024 13:05:31 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7anX-00000004vS7-3SQ5
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 13:05:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 779A2FF810;
	Thu, 16 May 2024 13:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715864725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tahKfh/1DJlK3/OTKCEXmpwJffF0zZ1wUE3RarZ3vao=;
	b=M5r7Jr1r0XfTPsjxh1qWfT090A+s4RSCwaxB6oe8GHVOsCU3RJ/lE5ilPZd4WP/7YY8r17
	JhJi19gcZdy8hnovjQUx9DHGb1StGUXJFMqRv2PlomoOlgNxj/91ycHem84JhXwpFm0Uif
	RS1kBpeJAT4Sy0pB+3rwOjgoZzAe8+nsdOBjktHzso+pabO3pTWP/bmor3TkCWFfyLG2ga
	Wg05nAdMtk80eVJtcAkS4yPMlmkhRvgPZvWG5MOCbCilVGP9Avm1HN01BHLXIyAtPDmhBw
	OirXuwMxU9meBbhM5jiBNM51T5fldR7EcLJxuY3m0odJZBdTjNaEr4Oq1tbPcw==
Date: Thu, 16 May 2024 15:05:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] mtd: nand: mxc_nand: implement exec_op
Message-ID: <20240516150524.24be4aeb@xps-13>
In-Reply-To: <ZkXvyiuB4B2Fbz4l@pengutronix.de>
References: <20240514-mtd-nand-mxc-nand-exec-op-v3-0-3e6f45fd3d82@pengutronix.de>
	<20240514-mtd-nand-mxc-nand-exec-op-v3-2-3e6f45fd3d82@pengutronix.de>
	<20240516103214.57a8ce33@xps-13>
	<ZkXfJ6n-06YqOr39@pengutronix.de>
	<20240516124405.2da1aa23@xps-13>
	<ZkXvyiuB4B2Fbz4l@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_060528_076427_A2B96444 
X-CRM114-Status: GOOD (  18.17  )
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

SGkgU2FzY2hhLAoKcy5oYXVlckBwZW5ndXRyb25peC5kZSB3cm90ZSBvbiBUaHUsIDE2IE1heSAy
MDI0IDEzOjM2OjQyICswMjAwOgoKPiBPbiBUaHUsIE1heSAxNiwgMjAyNCBhdCAxMjo0NDowNVBN
ICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgU2FzY2hhLAo+ID4gCj4gPiBzLmhh
dWVyQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIFRodSwgMTYgTWF5IDIwMjQgMTI6MjU6NDMgKzAy
MDA6Cj4gPiAgIAo+ID4gPiBPbiBUaHUsIE1heSAxNiwgMjAyNCBhdCAxMDozMjoxNEFNICswMjAw
LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPiA+ID4gSGkgU2FzY2hhLAo+ID4gPiA+ICAgICAK
PiA+ID4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG5hbmRfb3BfcGFyc2VyIG14Y25kX29wX3Bh
cnNlciA9IE5BTkRfT1BfUEFSU0VSKAo+ID4gPiA+ID4gKwlOQU5EX09QX1BBUlNFUl9QQVRURVJO
KG14Y25kX2RvX2V4ZWNfb3AsCj4gPiA+ID4gPiArCQkJICAgICAgIE5BTkRfT1BfUEFSU0VSX1BB
VF9DTURfRUxFTShmYWxzZSksCj4gPiA+ID4gPiArCQkJICAgICAgIE5BTkRfT1BfUEFSU0VSX1BB
VF9BRERSX0VMRU0odHJ1ZSwgNyksCj4gPiA+ID4gPiArCQkJICAgICAgIE5BTkRfT1BfUEFSU0VS
X1BBVF9DTURfRUxFTSh0cnVlKSwKPiA+ID4gPiA+ICsJCQkgICAgICAgTkFORF9PUF9QQVJTRVJf
UEFUX1dBSVRSRFlfRUxFTSh0cnVlKSwKPiA+ID4gPiA+ICsJCQkgICAgICAgTkFORF9PUF9QQVJT
RVJfUEFUX0RBVEFfSU5fRUxFTSh0cnVlLCBNQVhfREFUQV9TSVpFKSksICAgIAo+ID4gPiA+IAo+
ID4gPiA+IENNRCwgQUREUiwgQ01ELCBEQVRBIGlzIHRoZSBSTkRPVVQgcGF0dGVybi4gU28gaXQg
aXMgbm93IHdvcmtpbmcgZmluZT8gICAgCj4gPiA+IAo+ID4gPiBZZXMsIFJORE9VVCBpcyB3b3Jr
aW5nIG5vdy4gIAo+ID4gCj4gPiBFeGNlbGxlbnQhCj4gPiAgIAo+ID4gPiA+IE9yIGRpZCB5b3Ug
Zm9yZ2V0IHRvIGFkYXB0IHRoZSBwYXR0ZXJucyB0byB5b3VyIHVzZSBjYXNlPyAgICAKPiA+ID4g
Cj4gPiA+IEFsdGhvdWdoIGl0IGxvb2tzIGxpa2UgdGhlIHBhdHRlcm5zIGZyb20gdGhlIHBsMzV4
LW5hbmQtY29udHJvbGxlci5jLAo+ID4gPiB0aGVyZSBpcyBvbmUgc2xpZ2h0IGRpZmZlcmVuY2Uu
IFRoZSAnZmFsc2UnIGluIHRoZSBOQU5EX09QX1BBUlNFUl9QQVRfQ01EX0VMRU0KPiA+ID4gYWJv
dmUgaGFzIHRoZSBlZmZlY3QgdGhhdCBhIHBsYWluIE5BTkRfT1BfUEFSU0VSX1BBVF9EQVRBX0lO
X0VMRU0gaXMKPiA+ID4gZGlzYWxsb3dlZC4gIAo+ID4gCj4gPiBJJ20gbm90IHN1cmUgSSBmb2xs
b3csIHRoZSBhYm92ZSBwYXR0ZXJuIG1lYW5zOiBhIHNpbmdsZSBjb21tYW5kIGN5Y2xlCj4gPiBp
cyBzdXBwb3J0ZWQsIG5vPyAgCj4gCj4gQSBzaW5nbGUgY29tbWFuZCBjeWNsZSBpbmRlZWQgaXMg
YW5kIHNoYWxsIGJlIHN1cHBvcnRlZC4gVGhlCj4gcGwzNXgtbmFuZC1jb250cm9sbGVyLmMgSSBj
b3BpZWQgdGhpcyBmcm9tIGhhcwo+IE5BTkRfT1BfUEFSU0VSX1BBVF9DTURfRUxFTSh0cnVlKS4g
V2l0aCBhbGwgZWxlbWVudHMgYmVpbmcgb3B0aW9uYWwgdGhpcwo+IGFsc28gYWxsb3dzIGEgc2lu
Z2xlIE5BTkRfT1BfUEFSU0VSX1BBVF9EQVRBX0lOX0VMRU0oKQo+IChzdXBwb3J0ZWRfb3AuZGF0
YV9vbmx5X3JlYWQgYmVjb21lcyB0cnVlKS4gSSBjYW4ndCBzdXBwb3J0IHRoYXQsIHNvIEkKPiBt
YWRlIHRoZSBDTUQgbWFuZGF0b3J5LgoKQWxyaWdodCwgeWVhaC4gQWNrLgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
