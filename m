Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C83C43334
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 14:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5zOR+2eZ3q8v8rITiiY+ogari/0NyKrAtKqHb4h0Wcs=; b=uLZJlluA4ePKCb
	eZcu2Fatw7fUDdYTfMbNaONRnX5mktfnv8dXYnzLr8IyhX207uw7kn7MKGUSxs85QflIajAE1FKAC
	pe9iJWWjmVk7YO5RpdXbbCJnjCuuBf0KHwQEhHYWV0qTs2YYrNTkmC2YzbAOvi0mZYn27y+yHvy7Z
	0iO9XUiCI5IRCupDO73PJMt99yVQuU5XRucp6t7eWnJP68yYFL21h9kgnAz7snCWAdr2qUcnzgzEM
	LI0cxhqJYYUDuRUmNLuymdhA7565DTQReGrqsxuOS5ox8O1V4Eu2oNWPsxu5+2PlpjnlSz6yV4CYN
	V32S7xzBOMgr7f/7dDqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDGS-001QY7-3n; Mon, 06 Jun 2022 13:59:28 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDGP-001QX4-2W
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2022 13:59:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 26008C0004;
	Mon,  6 Jun 2022 13:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654523961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0NkA1A0ey2uaMVz3Gy7ymZ3Msnd8fXMqcNX5X3+7de8=;
	b=Pti1I0T7S6xVZeMpStyTtOzCazhDPBRoPn9mDIcK9KKsnnVmSIok3qluy88+eFewtcxtBV
	6DNs+j9leLLVY3EChxFkFPC/64VAduIUsKB0u1v0EagX9Iv+++gjl0fjfzftwcUSFeNks2
	d0BpDNbRcD5JkEs1cf1lM5tv2+kWyfxZ1xa+bTbN3DlHj+uFtwULxHM1C1Zq/WRHhh2OH+
	5QzPqB5IpEYP21KGL9MGwhm387A9D3HxV83dugJzgMYP/+paGGqJhEjTUL7USRsDFrsPho
	vXXzByWAWcy2v+aSsw5rnQSz7WE0SEtxcTomT7PB/SR7OFk0fXyOQne8tyijtA==
Date: Mon, 6 Jun 2022 15:59:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Lamparter <christian.lamparter@isd.uni-stuttgart.de>
Cc: linux-mtd@lists.infradead.org, Yoshio Furuyama
 <ytc-mb-yfuruyama7@kioxia.com>, Andreas =?UTF-8?B?QsO2aGxlcg==?=
 <dev@aboehler.at>
Subject: Re: [PATCH] mtd: rawnand: add support for Toshiba TC58NVG0S3HTA00
 NAND flash
Message-ID: <20220606155919.23001410@xps-13>
In-Reply-To: <bdd78c78-be40-1c31-f46e-41ed2a0cbd04@isd.uni-stuttgart.de>
References: <20220420104034.6333-1-dev@aboehler.at>
	<bdd78c78-be40-1c31-f46e-41ed2a0cbd04@isd.uni-stuttgart.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_065925_577483_4A244CDA 
X-CRM114-Status: GOOD (  30.95  )
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

SGkgQ2hyaXN0aWFuLAoKY2hyaXN0aWFuLmxhbXBhcnRlckBpc2QudW5pLXN0dXR0Z2FydC5kZSB3
cm90ZSBvbiBTdW4sIDUgSnVuIDIwMjIKMTc6MzE6MzMgKzAyMDA6Cgo+IEhpLAo+IAo+IE9uIDIw
LzA0LzIwMjIgMTI6NDAsIEFuZHJlYXMgQsO2aGxlciB3cm90ZToKPiA+IFRoZSBUb3NoaWJhIFRD
NThOVkcwUzNIVEEwMCBpcyBkZXRlY3RlZCB3aXRoIDY0IGJ5dGUgT09CIHdoaWxlIHRoZSBmbGFz
aAo+ID4gaGFzIDEyOCBieXRlcyBPT0IuIFRoaXMgYWRkcyBhIHN0YXRpYyBOQU5EIElEIGVudHJ5
IHRvIGNvcnJlY3QgdGhpcy4KPiA+Cj4gPiBUZXN0ZWQgb24gRlJJVFohQm94IDc1MzAgZmxhc2hl
ZCB3aXRoIE9wZW5XcnQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBCw7ZobGVyIDxk
ZXZAYWJvZWhsZXIuYXQ+Cj4gPiAtLS0KPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25h
bmRfaWRzLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfaWRzLmMKPiA+IEBA
IC0yOSw2ICsyOSw5IEBAIHN0cnVjdCBuYW5kX2ZsYXNoX2RldiBuYW5kX2ZsYXNoX2lkc1tdID0g
ewo+ID4gWy4uLl0KPiA+ICsJeyJUQzU4TlZHMFMzSFRBMDAgMUcgMy4zViA4LWJpdCIsCj4gPiAr
CQl7IC5pZCA9IHsweDk4LCAweGYxLCAweDgwLCAweDE1fSB9LAo+ID4gKwkJICBTWl8ySywgU1pf
MTI4LCBTWl8xMjhLLCAwLCA0LCAxMjgsIE5BTkRfRUNDX0lORk8oOCwgU1pfNTEyKSwgfSwgIAo+
IAo+IEBNaW5xdWVsLCB0aGVyZSBpcyBtb3JlIHRvIHRoaXMgcGF0Y2ggdGhhbiBpdCBtZWV0cyB0
aGUgZXllLgo+IAo+IEl0IHR1cm5lZCBvdXQgdGhpcyAiNC1ieXRlIiBJRCBtaWdodCBoYXZlIGJl
ZW4gYW4gaG9uZXN0IG1pc3Rha2UuCj4gV2UgaGF2ZSB0aGlzIGRvY3VtZW50ZWQgaW4gdGhlIE9w
ZW5XcnQgR2l0aHViIGlzc3VlICM5OTYyIFswXSB0aXRsZWQ6Cj4gIkZyaXR6Ym94IG1lbW9yeSBj
aGlwIG1pc2RldGVjdGlvbiBzaW5jZSAwYmM3OTRhNiAobWFzdGVyIGFuZCAyMi4wMykiCj4gKHNv
bWUgcGFydHMgb2YgdGhpcyBhcmUgYWxzbyBpbiB0aGUgb3BlbndydCBmb3J1bS4gQnV0IHRoZXJl
J3MgYSBsaW5rIHRvCj4gdGhlIHRocmVhZCBpbiB0aGUgZ2l0aHViIGlzc3VlKS4KPiAKPiBSZWdy
ZXR0YWJseSwgSSBkbyB0aGluayB0aGF0IEFuZHJlYXMgY2hpcCBtaWdodCBoYXZlIGJlZW4gYQo+
IGNvdW50ZXJmZWl0IG9yIGRhbWFnZWQgKHRoYXQgc2hvdWxkIGhhdmUgZW5kZWQgdXAgaW4gdGhl
Cj4gZ2FyYmFnZSBiaW4gaW5zdGVhZCBvZiBoaXMgcm91dGVyKS4KPiAKPiBIaXMgY2hpcHMgcmVw
b3J0cyBqdXN0IHRoZSBmaXJzdCBmb3VyIGJ5dGVzIG9mIHRoZSBjaGlwIElEOgo+ICI5OCBmMSA4
MCAxNSAwMCAwMCAwMCAwMCIuIEJ1dCBhY2NvcmRpbmcgdG8gS294aWFzL1Rvc2hpYmEncyBkYXRh
c2hlZXQgWzFdLAo+IHRoZXJlIHNob3VsZCBoYXZlIGJlZW4gYXQgbGVhc3QgYW5vdGhlciA1dGgg
bm9uLXplcm8gYnl0ZSBpbiB0aGUgSUQuCj4gKEkgZm91bmQgYSBsaW51eC1tdGQgcG9zdCBbMl0g
d2l0aCB0aGUgc2FtZSBjaGlwIGFuZCB0aGUgT1AgcmVwb3J0czoKPiAiMHg5OCAweGYxIDB4ODAg
MHgxNSAweDcyIDB4MTYgMHgwOCAweDAwIiBmb3IgdGhlIGZ1bGwgSUQpLgoKVGhhdCdzIGJhZCBs
dWNrLi4uCgo+IFdoYXQgdG8gZG8gaW4gdGhpcyBzaXR1YXRpb24/IEJlY2F1c2UgdGhlIHBhdGNo
IGFzIGlzIGlzIGNhdXNpbmcgYm9vdCBmYWlsdXJlcwo+IGZvciBkZXZpY2VzIHdpdGggb3RoZXIg
S2lveGlhL1Rvc2hpYmEgY2hpcHMuIFRoaXMgaXMgYmVjYXVzZSB0aGV5IGFsc28KPiBtYXRjaCB0
aGUgZmlyc3QgZm91ciBieXRlcyBidXQgaGF2ZSBkaWZmZXJlbnQgT09CIHNpemVzICg2NCwgaW5z
dGVhZCBvZiAxMjgpLgo+IAo+IEFuZHJlYXMgaGFzIHByb3Bvc2VkIHRoZSBmb2xsb3dpbmc6IHVw
ZGF0ZSB0aGUgaWRfbGVuIHRvIDgsIHRoaXMgd2lsbCBoZWxwCj4gZml4IHRoZSBib290IGZhaWx1
cmVzIHdpdGggb3RoZXIgY2hpcHMgbGlrZSB0aGUgVEM1OEJWRzBTM0hUQTAwLCBzaW5jZSBpdAo+
IGhhcyBkaWZmZXJlbnQgdmFsdWVzIGZvciB0aGUgY2hpcC1pZCBhZnRlciB0aGUgNHRoIGJ5dGUu
fAo+IHwKPiAKPiB8eyJUQzU4TlZHMFMzSFRBMDAgMUcgMy4zViA4LWJpdCIsIHsgLmlkID0gezB4
OTgsIDB4ZjEsIDB4ODAsIDB4MTV9IH0sIFNaXzJLLCBTWl8xMjgsIFNaXzEyOEssIDAsIDgsIDEy
OCwgTkFORF9FQ0NfSU5GTyg4LCBTWl81MTIpLCB9LHwKPiAKPiB8fFJldmVydGluZyB3b3VsZCBi
ZSBhbiBvcHRpb24sIGJ1dCBpZiB0aGlzIGlzIGEgY291bnRlcmZlaXQgc2l0dWF0aW9uIHRoZW4K
PiBzaW1pbGFyICJjaGlwcyIgY291bGQgZW5kIHVwIGluIG90aGVyIGRldmljZXMgYW5kIHdlIGFy
ZSBqdXN0IHVubHVja3kKPiBvbmVzIHRoYXQgYXJlIHRoZSBmaXJzdCB0byByZXBvcnQgaXQgOi0o
IC4KCkRvIHlvdSBoYXZlIGEgd2F5IHRvIHByb2JlIHRoZSBhbW91bnQgb2YgYWZmZWN0ZWQgZGV2
aWNlcyBhbW9uZyB0aGUKY29tbXVuaXR5IG9yIHBlcmhhcHMgYnkgdGFsa2luZyB0byB0aGUgdmVu
ZG9yPwoKUmV2ZXJ0aW5nIHNlZW1zIHRoZSBzYWZlc3Qgb3B0aW9uIGhlcmUsIG5vdCBrbm93aW5n
IGhvdyBtYW55IGRldmljZXMKaGF2ZSB0aGVzZSBkYW1hZ2VkL2NvdW50ZXJmZWl0IGNoaXBzLiBJ
ZiBpdCBpcyBqdXN0IGEgY291cGxlIGFuZCBvbmx5IG9uCkZyaXR6Ym94ZXMsIGFzIHN1Z2dlc3Rl
ZCBpbiB0aGUgR2l0aHViIGlzc3VlIHRoaXMgcGF0Y2ggY291bGQgYmUKY2FycmllZCB0aHJvdWdo
IE9wZW5XUlQgYW5kIHRoYXQgd291bGQgc2VlbSBtb3JlIGZ1dHVyZSBwcm9vZiBJTUhPLgoKVGhl
IHNlY29uZCBzb2x1dGlvbiAoZW5sYXJnaW5nIHRoZSBJRCBsZW5ndGgpIG1pZ2h0IHdvcmssIGJ1
dCBmZWVscwpkaXJ0eSwgdGhhdCdzIHdoeSBJIHdvdWxkIGdvIGZvciByZXZlcnRpbmcgdGhpcyBp
bW1lZGlhdGVseSAoSSB3aWxsCnNlbmQgaXQgdGhyb3VnaCBmaXhlcyksIHNvIHRoYXQgdGhlIHN1
cHBvcnQgZm9yIHRoaXMgY2hpcCBtaWdodCBqdXN0CmRpc2FwcGVhciAic2lsZW50bHkiLiBUaGVu
IHdlIGhhdmUgYW5vdGhlciByZWxlYXNlIHRvIGRlY2lkZSB3aGV0aGVyCml0IGlzIGFwcHJvcHJp
YXRlIHRvIHVzZSB0aGUgOC1ieXRlIElEIGhhY2sgaW4gdGhlIG1haW5saW5lIGtlcm5lbC4KCkNh
biB5b3UgcGxlYXNlIHNlbmQgYSBwYXRjaD8KCj4gfHwKPiAKPiB8UmVnYXJkcywgQ2hyaXN0aWFu
fAo+IAo+IAo+IFswXSA8aHR0cHM6Ly9naXRodWIuY29tL29wZW53cnQvb3BlbndydC9pc3N1ZXMv
OTk2Mj4KPiBbMV0gPGh0dHBzOi8vbWVkaWEuZGlnaWtleS5jb20vcGRmL0RhdGElMjBTaGVldHMv
VG9zaGliYSUyMFBERnMvS0lPWElBX1RDNThOVkcwUzNIVEEwMF9SZXYyLjAwX0UxOTEwMDFDLnBk
Zj4gcGFnZSAzNQo+IFsyXSA8aHR0cHM6Ly9saW51eC1tdGQuaW5mcmFkZWFkLm5hcmtpdmUuY29t
LzhEUnhhczJNL3BhdGNoLW10ZC1uYW5kLWRldGVjdC1vb2Itc2l6ZS1mb3ItdG9zaGliYS0yNG5t
LXJhdy1zbGM+CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
