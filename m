Return-Path: <SRS0=+z0R=Y7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DAA4C5DF61
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 10:13:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2029D2084D
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 10:13:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s7U0M+eE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2029D2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PIlhfA8JfbCfJii5FMrJjmni1rM5ZS6yT1rE0pAbBaE=; b=s7U0M+eEyDCB3J
	MX4Ui/ErycKTvLXsnmdyFNyWXH1Sx5Sh0vlVPJ9D+twmipvhsllOcvzQGvP2vcZeq+Tms61OWIJFJ
	jN9ULzvEhsoYCWEFq8LjGl6fJPmaU1RSB+S2PsY49qE4yUMfqFUFPrvTi+lEXPTiPbR0EpDJmMLRA
	phK6oDDNOOmQ2NzE3Dkk9zt9JPMhS+KZiVhljePWbXMmE+/Vd/WprQB/Zq2e1n0cVeOz7UG3wzk5c
	JOLIwmooP3Qc905N0NOGgjtJ7YTb0uQgNWl2BmaL6VkAdXVa9vjemXPKgYDMJfflgphOCTgFVYPiV
	fyaauZeNOpaPkkStQEhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSenQ-0004xd-RK; Thu, 07 Nov 2019 10:13:44 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSenN-0004wf-4z
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2019 10:13:43 +0000
X-Originating-IP: 86.206.246.123
Received: from xps13 (lfbn-tou-1-421-123.w86-206.abo.wanadoo.fr
 [86.206.246.123]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 14DDB2412FB;
 Thu,  7 Nov 2019 10:09:27 +0000 (UTC)
Date: Thu, 7 Nov 2019 11:09:26 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] mtd: no need to check return value of debugfs_create
 functions
Message-ID: <20191107110042.13acd6f5@xps13>
In-Reply-To: <20191107091518.GA1328892@kroah.com>
References: <20191107085111.GA1274176@kroah.com>
 <20191107100923.7c94820e@xps13>
 <20191107091518.GA1328892@kroah.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_021341_330603_784B5DB9 
X-CRM114-Status: GOOD (  18.51  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR3JlZywKCkdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
IHdyb3RlIG9uIFRodSwgNyBOb3YKMjAxOSAxMDoxNToxOCArMDEwMDoKCj4gT24gVGh1LCBOb3Yg
MDcsIDIwMTkgYXQgMTA6MDk6NDRBTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhp
IEdyZWcsCj4gPiAKPiA+IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlv
bi5vcmc+IHdyb3RlIG9uIFRodSwgNyBOb3YKPiA+IDIwMTkgMDk6NTE6MTEgKzAxMDA6Cj4gPiAg
IAo+ID4gPiBXaGVuIGNhbGxpbmcgZGVidWdmcyBmdW5jdGlvbnMsIHRoZXJlIGlzIG5vIG5lZWQg
dG8gZXZlciBjaGVjayB0aGUKPiA+ID4gcmV0dXJuIHZhbHVlLiAgVGhlIGZ1bmN0aW9uIGNhbiB3
b3JrIG9yIG5vdCwgYnV0IHRoZSBjb2RlIGxvZ2ljIHNob3VsZAo+ID4gPiBuZXZlciBkbyBzb21l
dGhpbmcgZGlmZmVyZW50IGJhc2VkIG9uIHRoaXMuICAKPiA+IAo+ID4gSSBkaWRuJ3Qga25vdyBh
Ym91dCB0aGlzLiBJcyB0aGlzIHNvbWV0aGluZyBuZXcgb3IgaGFzIGl0IGJlZW4gdGhlIHJ1bGUK
PiA+IHNpbmNlIHRoZSBiZWdpbm5pbmc/IEluIHRoZSAgY2FzZSwgZG9uJ3Qgd2UgbmVlZCBhIEZp
eGVzIHRhZyBoZXJlPyAgCj4gCj4gSXQncyBiZWVuIHRoZSB3YXkgYWx3YXlzLCBidXQgYXMgb2Yg
YSBmZXcga2VybmVsIHJlbGVhc2VzIGFnbywgZGVidWdmcwo+IGlzIGV2ZW4gbW9yZSAiZmF1bHQt
dG9sZXJhbnQiIG9mIHN0dWZmIGxpa2UgdGhpcy4KPiAKPiBBbmQgdGhlcmUncyBubyBuZWVkIGZv
ciBhICJGaXhlczoiIGFzIHRoaXMgaXMganVzdCB3b3JrIHRvIGNsZWFuIHVwIHRoZQo+IGRlYnVn
ZnMgYXBpIGFuZCB1c2FnZSAoSSBoYXZlIGEgbG90IG1vcmUgd29yayB0byBkbyBhZnRlciB0aGVz
ZSB0eXBlcyBvZgo+IGNoYW5nZXMuKQoKT2ssIHRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24u
CgpDaGVlcnMhCk1pcXXDqGwKCj4gCj4gPiAgIAo+ID4gPiBDYzogRGF2aWQgV29vZGhvdXNlIDxk
d213MkBpbmZyYWRlYWQub3JnPgo+ID4gPiBDYzogQnJpYW4gTm9ycmlzIDxjb21wdXRlcnNmb3Jw
ZWFjZUBnbWFpbC5jb20+Cj4gPiA+IENjOiBNYXJlayBWYXN1dCA8bWFyZWsudmFzdXRAZ21haWwu
Y29tPgo+ID4gPiBDYzogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4K
PiA+ID4gQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gPiA+IENjOiBW
aWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5jb20+Cj4gPiA+IENjOiBBcnRlbSBCaXR5
dXRza2l5IDxkZWRla2luZDFAZ21haWwuY29tPgo+ID4gPiBDYzogbGludXgtbXRkQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiA+ID4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4g
U2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz4gIAo+ID4gCj4gPiBbLi4uXQo+ID4gICAKPiA+ID4gKwo+ID4gPiArCWQtPmRmc19lbXVs
YXRlX2lvX2ZhaWx1cmVzID0gZGVidWdmc19jcmVhdGVfZmlsZSgidHN0X2VtdWxhdGVfaW9fZmFp
bHVyZXMiLAo+ID4gPiArCQkJCQkJCSBTX0lXVVNSLCBkLT5kZnNfZGlyLAo+ID4gPiArCQkJCQkJ
CSAodm9pZCAqKXViaV9udW0sCj4gPiA+ICsJCQkJCQkJICZkZnNfZm9wcyk7Cj4gPiA+ICsKPiA+
ID4gKwlkLT5kZnNfZW11bGF0ZV9wb3dlcl9jdXQgPSBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJ0c3Rf
ZW11bGF0ZV9wb3dlcl9jdXQiLAo+ID4gPiArCQkJCQkJICAgICAgIFNfSVdVU1IsIGQtPmRmc19k
aXIsCj4gPiA+ICsJCQkJCQkgICAgICAgKHZvaWQgKil1YmlfbnVtLAo+ID4gPiArCQkJCQkJICAg
ICAgICZkZnNfZm9wcyk7ICAKPiA+IAo+ID4gTml0cGljazogSSB0aGluayB3ZSBtaXNzIGFuIGVt
cHR5IGxpbmUgaGVyZS4gSSBjYW4gZml4IGl0IHdoZW4gYXBwbHlpbmcuICAKPiAKPiBBaCwgb29w
cywgc29ycnkgYWJvdXQgdGhhdC4KPiAKPiB0aGFua3MsCj4gCj4gZ3JlZyBrLWgKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
