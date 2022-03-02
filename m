Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81630C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 20:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cvCswbbiy4lsG1SN69hF27cfiWt883coY4CedI6Jzqg=; b=gq+EGG0g4KTMm2
	lfESLHedv7RH6KsKgfwHK971yGQM37iUw1YyZ2ccr9O/0oyLCmWxHMEsyND2cFAo1FwXCLYwsLdZd
	DbYPlu7kXWo8cGF9TQqflkjEHkaQaujUUrTcHSm+bt8ffWxWImFhVXvYFYdPknnQsY/DP8gj86IJw
	f9ZTO9fxXFGVSbMy5K6/hjoqykaFfXxoGfxii8ujCecjce80nfpoaCLlZRBZkGb4I//AEq93aXC0O
	OHD3LS0emxjuB6Qr1LDy68mqvXnYl5wvCCERrgIIraO7JwrlD/XZeovWnFagqVoovi4jQ43PUnCdt
	x6/7kW7WOtuNRnTmfIfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPVEV-0043YX-0f; Wed, 02 Mar 2022 20:05:59 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPVER-0043Xf-US
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2022 20:05:57 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2FB451F45056;
 Wed,  2 Mar 2022 20:05:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646251552;
 bh=EC3Sx7CTK8chpFEIlSWop6GT/woJveb8eyelTtp0crI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BVCWm5oC6KGgaBo1E8EZsegF4Znj5jYzCLWXjwdV3e7uMKTFIU48r26VCbvHGGjCU
 AtPtx3Kt4edD8Cr4xTBF+CyD8P3WrPBXLlXo/+g8Dv2z0K+XbL/Kdk6HD/d99LQPSl
 jadXzbibKkrNt223YKJAJVqqqH8XYTCfK1JVDSAlNpGbNfDsUTIA7vpENpzDOovIjQ
 U5bMOU7iYM95gEhbr8ftl4M2+zXZBoxcxS3ONe18Zb8190+c69bYu4oxJWQp7OP/rF
 IB2lLRgJ4eHAvITIkCYUZ6+tBSCejtclMCRJ8HJZUsdto1qNo7YsbzLuNYg5PuFfUc
 zbP6wHe/nGjXg==
Date: Wed, 2 Mar 2022 21:05:46 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>, Daniel Palmer
 <daniel@0x0f.com>, Alexander Lobakin <alobakin@pm.me>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <p.yadav@ti.com>
Subject: Re: [PATCH v3 05/17] mtd: spinand: Define ctrl_ops for non-page
 read/write op templates
Message-ID: <20220302210546.486239b4@collabora.com>
In-Reply-To: <259637a6-e63f-56f0-6cdf-6bd21f8e4453@ti.com>
References: <20220101074250.14443-1-a-nandan@ti.com>
 <20220101074250.14443-6-a-nandan@ti.com>
 <20220103110107.45594e78@collabora.com>
 <bf3ea909-e0a5-eeac-12e9-c8a809685f48@ti.com>
 <20220215183705.574df0c1@collabora.com>
 <259637a6-e63f-56f0-6cdf-6bd21f8e4453@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_120556_323435_38E17642 
X-CRM114-Status: GOOD (  38.45  )
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

T24gV2VkLCAyIE1hciAyMDIyIDIxOjAwOjU1ICswNTMwCkFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFu
QHRpLmNvbT4gd3JvdGU6Cgo+ID4+IDEuIHJlYWRfY2FjaGUsIHdyaXRlX2NhY2hlLCB1cGRhdGVf
Y2FjaGUgb3AgdGVtcGxhdGVzIGRvbid0IGZpdCB3ZWxsCj4gPj4gd2l0aCB0aGUgb3RoZXIgbm9u
LWRhdGEgb3BzLCBhcwo+ID4+IHRoZXNlIGRhdGEgb3BzIGFyZSB1c2VkIHRvIGNyZWF0ZSBhIGRp
cm1hcCwgYW5kIHRoYXQgY2FuIGJlIGRvbmUgb25seQo+ID4+IG9uY2UgYXQgcHJvYmUgdGltZS4g
SGVuY2UsIHRoZXJlCj4gPj4gaXMgYSBkaWZmZXJlbnQgbWVjaGFuaXNtIG9mIHNlbGVjdGluZyBv
ZiBkYXRhIG9wcyBhbmQgbm9uLWRhdGEgb3BzLiAgCj4gPiBOb3Qgc3VyZSBJIHNlZSB3aHkgdGhp
cyBpcyBhIHByb2JsZW0uIFlvdSBjYW4gcG9wdWxhdGUgZGF0YS1vcHMgZm9yIGFsbAo+ID4gbW9k
ZXMsIGFuZCBwaWNrIHRoZSBvbmUgdGhhdCBwcm92aWRlcyB0aGUgYmVzdCBwZXJmcyB3aGVuIHlv
dSBjcmVhdGUKPiA+IHRoZSBkaXJtYXAgKHdoaWNoIHNob3VsZCByZWFsbHkgYmUgYXQgdGhlIGVu
ZCBvZiB0aGUgcHJvYmUsIGlmIGl0J3Mgbm90Cj4gPiBhbHJlYWR5KS4KPiA+ICAKPiA+PiBIZW5j
ZSwgdGhpcyBkaXZpc2lvbiBpbiB0aGUgb3AgdGVtcGxhdGVzCj4gPj4gc3RydWN0IGFzIGRhdGFf
b3BzIGFuZCBjdHJsX29wcyBpcyByZXF1aXJlZC4gQ3VycmVudGx5LCB0aGUgY29yZSBvbmx5Cj4g
Pj4gc3VwcG9ydHMgdXNpbmcgYSBzaW5nbGUgcHJvdG9jb2wgZm9yCj4gPj4gZGF0YSBvcHMsIGNo
b3NlbiBhdCB0aGUgdGltZSBvZiBwcm9iaW5nLiAgCj4gPiBBZ2FpbiwgSSBkb24ndCBzZWUgd2h5
IHlvdSBuZWVkIHRvIGRpZmZlcmVudGlhdGUgdGhlIGNvbnRyb2wgYW5kIGRhdGEKPiA+IG9wcyB3
aGVuIHBvcHVsYXRpbmcgdGhpcyB0YWJsZS4gVGhvc2UgYXJlIGp1c3Qgb3BlcmF0aW9ucyB0aGUg
TkFORAo+ID4gc3VwcG9ydHMsIGFuZCB0aGUgZGF0YSBvcGVyYXRpb25zIGlzIGp1c3QgYSBzdWJz
ZXQuCj4gPiAgCj4gPj4gMi4gSWYgd2UgdXNlIHRoaXMgc2luZ2xlIG9wX3RlbXBsYXRlcyBzdHJ1
Y3QsIEkgY2FuJ3QgdGhpbmsgb2YgYW55IGdvb2QKPiA+PiB3YXkgdG8gaW5pdGlhbGl6ZSB0aGVz
ZSBpbiB0aGUKPiA+PiBtYW51ZmFjdHVyZXJzIGRyaXZlciAod2luYm9uZC5jKSwgcmVmZXIgdG8g
MTd0aCBwYXRjaCBpbiB0aGlzIHNlcmllcy4KPiA+PiBDb3VsZCB5b3UgcGxlYXNlIHN1Z2dlc3Qg
YSBtYWNybwo+ID4+IGltcGxlbWVudGF0aW9uIGFsc28gZm9yIHdpbmJvbmQuYyB3aXRoIHRoZSBz
dWdnZXN0ZWQgb3BfdGVtcGxhdGVzIHN0cnVjdC4gIAo+ID4gRmlyc3QgcmVwbGFjZSB0aGUgb3Bf
dmFyaWFudHMgZmllbGQgYnkgc29tZXRoaW5nIG1vcmUgZ2VuZXJpYzoKPiA+Cj4gPiBzdHJ1Y3Qg
c3BpbmFuZF9pbmZvIHsKPiA+IC4uLgo+ID4gCWNvbnN0IHN0cnVjdCBzcGluYW5kX29wX3Zhcmlh
bnRzICoqb3BzX3ZhcmlhbnRzOwo+ID4gLi4uCj4gPiB9Owo+ID4KPiA+ICNkZWZpbmUgU1BJTkFO
RF9PUF9WQVJJQU5UUyhfaWQsIC4uLikgXAo+ID4gCVtTUElfTkFORF9PUF8gIyMgX2lkXSA9IHsg
X19WQV9BUkdTX18gfQo+ID4KPiA+ICNkZWZpbmUgU1BJTkFORF9PUFNfVkFSSUFOVFMobmFtZSwg
Li4uKQo+ID4gCWNvbnN0IHN0cnVjdCBzcGluYW5kX29wX3ZhcmlhbnRzIG5hbWVbXXsKPiA+IAkJ
X19WQV9BUkdTX18sCj4gPiAJfTsKPiA+Cj4gPiAjZGVmaW5lIFNQSU5BTkRfSU5GT19PUFNfVkFS
SUFOVFMoZGVmcykKPiA+IAkub3BzX3ZhcmlhbnRzID0gZGVmcwo+ID4KPiA+IC4uLgo+ID4KPiA+
IHN0YXRpYyBTUElOQU5EX09QU19WQVJJQU5UUyh3MzVuMDFqd19vcHNfdmFyaWFudHMsCj4gPiAJ
CVNQSU5BTkRfT1BfVkFSSUFOVFMoUkVBRF9DQUNIRSwKPiA+IAkJCVNQSU5BTkRfUEFHRV9SRUFE
X0ZST01fQ0FDSEVfT0NUQUxJT19EVFJfT1AoMCwgMjQsIE5VTEwsIDApLAo+ID4gCQkJU1BJTkFO
RF9QQUdFX1JFQURfRlJPTV9DQUNIRV9PUCh0cnVlLCAwLCAxLCBOVUxMLCAwKSwKPiA+IAkJCS4u
LikpLAo+ID4gCQlTUElOQU5EX09QX1ZBUklBTlRTKFdSSVRFX0NBQ0hFLAo+ID4gCQkJU1BJTkFO
RF9QUk9HX0xPQURfT0NUQUxJT19EVFIodHJ1ZSwgMCwgTlVMTCwgMCksCj4gPiAJCQlTUElOQU5E
X1BST0dfTE9BRCh0cnVlLCAwLCBOVUxMLCAwKSksCj4gPiAJCS4uLgo+ID4gCQlTUElOQU5EX09Q
X1ZBUklBTlRTKFJFU0VULAo+ID4gCQkJU1BJTkFORF9SRVNFVF9PUF9PQ1RBTF9EVFIsCj4gPiAJ
CQlTUElOQU5EX1JFU0VUX09QLAo+ID4gCQkuLi4KPiA+IAkJKTsKPiA+IC4uLiAgCj4gCj4gSSBm
aW5kIGEgaXNzdWUgd2l0aCB0aGlzIGltcGxlbWVudGF0aW9uLCBwbGVhc2UgZ2l2ZSBjb3JyZWN0
aXZlIHN1Z2dlc3Rpb25zOgo+IAo+IEluIHR5cGUgb2Ygb3AgdmFyaWFudCBsaXN0aW5nLCB0aGVy
ZSBpcyBubyB3YXkgdG8gc3BlY2lmeSB0aGUgcHJvdG9jb2wgCj4gb2YgdGhlIG9wIGluIHRoZSB2
YXJpYW50cyBzdHJ1Y3QgaXRzZWxmLgo+ICDCoMKgwqAgLSBUaGlzIHdpbGwgbGVhZCB0byBmaWx0
ZXJpbmcvc29ydGluZy9zZWFyY2hpbmcgb2Ygb3BzIGZvciBmaW5kaW5nIAo+IHRoZSBwcm90b2Nv
bHMgaW4gdGhlIHNwaW5hbmQgY29yZQo+ICDCoMKgwqAgd2hpbGUgaW4gc3BpbmFuZF9tYXRjaF9h
bmRfaW5pdCgpLCB3aGljaCBJIGRvbid0IGZlZWwgaXMgYSBnb29kIHdheSAKPiBmb3IgcHJvdG9j
b2wgYmFzZWQgb3AgY2F0ZWdvcml6YXRpb24uCgpZb3UnbGwgaGF2ZSB0byBnbyBvdmVyIGFsbCB0
aG9zZSBvcGVyYXRpb25zIHRvIGNoZWNrIHdoaWNoIG9uZXMgYXJlCnN1cHBvcnRlZCBieSB0aGUg
Y29udHJvbGxlciBhbnl3YXkuIEFuZCBpdCdzIG5vdCBsaWtlIHRoZQpjbGFzc2lmaWNhdGlvbiBp
cyBjb21wbGljYXRlZCBzaW5jZSB0aGUgY21kIGJ1cy13aWR0aCtEVFIgc2VlbXMgdG8gYmUKdGhl
IGRpc2NyaW1pbmFudCwgYW5kIGl0J3Mgc3RvcmVkIGRpcmVjdGx5IGluIHRoZSBvcGVyYXRpb24g
dGVtcGxhdGUuCgo+ICDCoMKgwqAgLSBUaGlzIHdvdWxkIGFsc28gbGVhZCB0byBjb21wbGV4aXRp
ZXMgaW4gY2FzZXMgb2YgbWl4ZWQgbW9kZSAKPiBvcGVyYXRpb25zLgoKTm90IHN1cmUgd2hhdCB5
b3UgbWVhbiBieSBtaXhlZCBtb2RlLiBBcmUgeW91IHJlZmVycmluZyB0byBzb21ldGhpbmcKbGlr
ZSAxUy04RC04RD8gSUlVQywgYWxsIHdlIGNhcmUgYWJvdXQgaXMgdGhlIG1vZGUgdXNlZCBmb3Ig
dGhlIGNtZApjeWNsZS4gSSBkb24ndCB0aGluayB0aGVyZSBhcmUgY29tbWFuZHMgdG8gc3dpdGNo
IGJldHdlZW4gc3RhdGVsZXNzCigxUy14W1MsRF0teFtTLERdKSBtb2RlcyAoYXNzdW1pbmcgMVMt
eEQteEQgaXMgYSB0aGluZykuCgo+ICDCoMKgwqAgLSBJbiBhZGRpdGlvbiwgd2UgY2FuJ3Qgc2lt
cGx5IGNob29zZSB0aGUgZmlyc3Qgc3VwcG9ydGVkIHByb3RvY29sIAo+IGluIGVhY2ggb3AgaWQs
IGFzIHNvbWUgb3BzIGhhdmUKPiAgwqDCoMKgIGludGVuZGVwZW5kZW5jeSBvZiBwcm90b2NvbCB3
aXRoIG90aGVyIG9wcy4gVGhpcyBpcyBiZWNhdXNlIAo+IG5vbi1kYXRhIG9wcyAobGlrZSByZXNl
dCwgYmxvY2sgZXJhc2UuLikKPiAgwqDCoMKgIGNhbm5vdCBiZSBpbiBkaWZmZXJlbnQgcHJvdG9j
b2xzIGF0IHNhbWUgdGltZSwgc28gaXQgd291bGQgbWFrZSAKPiBzZW5zZSB0byBoYXZlIHNvbWUg
Zm9ybSBvZiBwcm90b2NvbAo+ICDCoMKgwqAgYmFzZWQgYXJyYW5nZW1lbnQgd2hpbGUgbGlzdGlu
ZyB0aGVtLgoKSSdtIG5vdCBzdWdnZXN0aW5nIHRvIGNob29zZSB0aGUgZmlyc3Qgc3VwcG9ydGVk
IG9wZXJhdGlvbiBhbmQgdXNlIGl0CnVuY29uZGl0aW9uYWxseSwgYnV0IGluc3RlYWQgY2hvb3Nl
IG9uZSBvcGVyYXRpb24gcGVyIHN0YXRlZnVsIG1vZGUKKDFTLCAyUywgNFMsIC4uLiwgOEQpIGFu
ZCB1c2UgdGhlIGFwcHJvcHJpYXRlIHRlbXBsYXRlIGRlcGVuZGluZyBvbgp0aGUgbW9kZSB0aGUg
Zmxhc2ggaXMgY3VycmVudGx5IGluLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
