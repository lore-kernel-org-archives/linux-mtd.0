Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DDBC3A5A6
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 11:27:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8561B21929
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 11:27:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TdjtNKep"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8561B21929
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xHP/y1D+jwrtGwIZl7Q+9qSeTYpM8C8f4dzVZLunZg=; b=TdjtNKepHrLAeO
	wcXOBoBOPzjYJ3iK/+v//wR/fv4GU8n6iQUnZ9YKtmFGO50GHy6fHCQvL0uQ5Oxs8lohD5006ARde
	QmgbdTsPDclEumDuUFgep0WXO+/Z5g8q+2x6MPhTBWtkgZpqN+I2D6LepVfNQjmc6IpG8YfaBNaTP
	Dt2huiewk0L3cJP5piQWgUojqq4TzirQZcID7dtOAGF2eE5Td0A/qBoDdPXhqC1N2MMiBJOL8WUml
	Rv18SpxVvWcJyQycwB3U/lhfheGSvjLUHsBxwKGOtZAMVHWfV+ERwTh9vPxuwc8F9pvIu/vt0yUo1
	Ti3jotk8YUoOi/eJuFwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAub1-0002Kd-Mp; Thu, 19 Sep 2019 11:27:35 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAuax-0002K2-1u
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2019 11:27:33 +0000
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 859D0100006;
 Thu, 19 Sep 2019 11:27:20 +0000 (UTC)
Date: Thu, 19 Sep 2019 13:27:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Nyekjaer <sean@geanix.com>
Subject: Re: [Bug] mtd: rawnand: gpmi
Message-ID: <20190919132719.3ca48967@xps13>
In-Reply-To: <a4a68ef3-3f66-3e5e-b0d9-cf5d5e898b40@geanix.com>
References: <6a333d0f-09b2-d0d1-a3a5-955b31b6291e@geanix.com>
 <20190910095515.yjg6zcoqrtwylyg3@pengutronix.de>
 <a0f518e3-2465-8e64-418b-cac27cde98de@geanix.com>
 <20190910104807.7r3x2crdhpcteomn@pengutronix.de>
 <b26d583f-454f-fbf1-280d-f1753cc13896@geanix.com>
 <20190910110833.5ngkqpgdps4y3t2v@pengutronix.de>
 <3a1a0bf1-4dd0-9be1-23bd-a2e1f2bc6783@geanix.com>
 <a4a68ef3-3f66-3e5e-b0d9-cf5d5e898b40@geanix.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_042731_403812_44AD85CE 
X-CRM114-Status: GOOD (  20.06  )
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
Cc: mkl@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2VhbiwKClNlYW4gTnlla2phZXIgPHNlYW5AZ2Vhbml4LmNvbT4gd3JvdGUgb24gVGh1LCAx
OSBTZXAgMjAxOSAxMzoyMTo1NgorMDIwMDoKCj4gT24gMTAvMDkvMjAxOSAxMy41MSwgU2VhbiBO
eWVramFlciB3cm90ZToKPiA+IAo+ID4gCj4gPiBPbiAxMC8wOS8yMDE5IDEzLjA4LCBTYXNjaGEg
SGF1ZXIgd3JvdGU6ICAKPiA+PiBPbiBUdWUsIFNlcCAxMCwgMjAxOSBhdCAwMTowMDozMFBNICsw
MjAwLCBTZWFuIE55ZWtqYWVyIHdyb3RlOiAgCj4gPj4+Cj4gPj4+Cj4gPj4+IE9uIDEwLzA5LzIw
MTkgMTIuNDgsIFNhc2NoYSBIYXVlciB3cm90ZTogIAo+ID4+Pj4gT24gVHVlLCBTZXAgMTAsIDIw
MTkgYXQgMTI6MTg6MjVQTSArMDIwMCwgU2VhbiBOeWVramFlciB3cm90ZTogIAo+ID4+Pj4+Cj4g
Pj4+Pj4KPiA+Pj4+PiBPbiAxMC8wOS8yMDE5IDExLjU1LCBTYXNjaGEgSGF1ZXIgd3JvdGU6ICAK
PiA+Pj4+Pj4+IFvCoMKgwqAgMi40MzQwNTddIEJhZCBibG9jayB0YWJsZSB3cml0dGVuIHRvIDB4
MDAwMDFmZmMwMDAwLCB2ZXJzaW9uID4+Pj4+Pj4gMHgwMQo+ID4+Pj4+Pj4gW8KgwqDCoCAyLjQz
NzI1NF0gQmFkIGJsb2NrIHRhYmxlIHdyaXR0ZW4gdG8gMHgwMDAwMWZmODAwMDAsIHZlcnNpb24g
Pj4+Pj4+PiAweDAxICAKPiA+Pj4+Pj4gV2hhdCBhYm91dCB0aGlzICJCYWQgYmxvY2sgdGFibGUg
d3JpdHRlbiIgbWVzc2FnZT8gWW91IHNob3VsZCBzZWUgPj4+Pj4+IHRoaXMKPiA+Pj4+Pj4gZXhh
Y3RseSBvbmNlLiBEbyB5b3Ugc2VlIHRoaXMgbXVsdGlwbGUgdGltZXMsIGVzcGVjaWFsbHkgd2hl
biA+Pj4+Pj4gc3dpdGNoaW5nCj4gPj4+Pj4+IGtlcm5lbHMgYmV0d2VlbiB0aGUgZ29vZCBvbmUg
YW5kIHRoZSBiYWQgb25lPwo+ID4+Pj4+Pgo+ID4+Pj4+PiBTYXNjaGEgIAo+ID4+Pj4+Cj4gPj4+
Pj4gTm90IGV4YWN0bHkgc3VyZSB3aGF0IHlvdSBtZWFuLCBidXQgaGVyZSBpcyB0aGUgZHVtcHM6
Cj4gPj4+Pj4KPiA+Pj4+PiBCZWZvcmUgKG10ZDogcmF3bmFuZDogZ3BtaTogSW1wbGVtZW50IGV4
ZWNfb3ApCj4gPj4+Pj4gW8KgwqDCoCAzLjM4OTM1Ml0gQmFkIGJsb2NrIHRhYmxlIHdyaXR0ZW4g
dG8gMHgwMDAwMWZmYzAwMDAsIHZlcnNpb24gMHgwMQo+ID4+Pj4+IFvCoMKgwqAgMy4zOTkwMTld
IEJhZCBibG9jayB0YWJsZSB3cml0dGVuIHRvIDB4MDAwMDFmZjgwMDAwLCB2ZXJzaW9uIDB4MDEK
PiA+Pj4+Pgo+ID4+Pj4+IEFmdGVyCj4gPj4+Pj4gW8KgwqDCoCAzLjMwMTA5Nl0gQmFkIGJsb2Nr
IHRhYmxlIHdyaXR0ZW4gdG8gMHgwMDAwMWZmYzAwMDAsIHZlcnNpb24gMHgwMQo+ID4+Pj4+IFvC
oMKgwqAgMy4zMTA1OTldIEJhZCBibG9jayB0YWJsZSB3cml0dGVuIHRvIDB4MDAwMDFmZjgwMDAw
LCB2ZXJzaW9uIDB4MDEgIAo+ID4+Pj4KPiA+Pj4+IFRoZSBCYWQgYmxvY2sgdGFibGUgaXMgd3Jp
dHRlbiBvbmNlLiBXaGVuIHlvdSBzZWUgdGhpcyBtZXNzYWdlIG11bHRpcGxlCj4gPj4+PiB0aW1l
cyB0aGVuIHRoaXMgbWVhbnMgdGhhdCBMaW51eCBjYW4ndCByZWFkIHRoZSBCQlQgYW5kIHdyaXRl
cyBpdCA+Pj4+IGFnYWluLgo+ID4+Pj4gU28gdGhlIHF1ZXN0aW9uIGlzOiBTdGFydCB0aGUgZ29v
ZCBrZXJuZWwgbXVsdGlwbGUgdGltZXMuIERvIHlvdSBzZWUKPiA+Pj4+IHRoaXMgbWVzc2FnZSBv
bmNlIG9yIG9uIGVhY2ggYm9vdD8gVGhlbiBzdGFydCB0aGUgYmFkIEtlcm5lbCBtdWx0aXBsZQo+
ID4+Pj4gdGltZXMuIERvIHlvdSBzZWUgdGhlIG1lc3NhZ2Ugb25jZSBvciBvbiBlYWNoIGJvb3Q/
Cj4gPj4+Pgo+ID4+Pj4gU2FzY2hhCj4gPj4+PiAgCj4gPj4+Cj4gPj4+IFUtYm9vdDogIAo+ID4+
PiA9PiBuYW5kIGVyYXNlLmNoaXAgIAo+ID4+Pgo+ID4+PiBOQU5EIGVyYXNlLmNoaXA6IGRldmlj
ZSAwIHdob2xlIGNoaXAKPiA+Pj4gU2tpcHBpbmcgYmFkIGJsb2NrIGF0wqAgMHgwYzc4MDAwMAo+
ID4+PiBTa2lwcGluZyBiYWQgYmxvY2sgYXTCoCAweDE4MDAwMDAwCj4gPj4+IFNraXBwaW5nIGJh
ZCBibG9jayBhdMKgIDB4MTgwNDAwMDAKPiA+Pj4gU2tpcHBpbmcgYmFkIGJsb2NrIGF0wqAgMHgx
ZmYwMDAwMAo+ID4+PiBTa2lwcGluZyBiYWQgYmxvY2sgYXTCoCAweDFmZjQwMDAwCj4gPj4+IFNr
aXBwaW5nIGJhZCBibG9jayBhdMKgIDB4MWZmODAwMDAKPiA+Pj4gU2tpcHBpbmcgYmFkIGJsb2Nr
IGF0wqAgMHgxZmZjMDAwMAo+ID4+Pgo+ID4+PiBMb29rIHdlaXJkIGl0IG1hcmtzIHRoZSBiYnQg
bG9jYXRpb24gYmFkID8gIAo+ID4+Cj4gPj4gWWVzLCB0aGF0J3Mgbm9ybWFsLiBUaGUgQkJUIGl0
c2VsZiBpcyBtYXJrZWQgYXMgYmFkLiBPdGhlcndpc2UgdGhlIHRoZXkKPiA+PiB3b3VsZCBqdXN0
IGJlIHVzZWQgYnkgcmVndWxhciBtdGQgdXNlcnMuCj4gPj4gIAo+ID4+PiBPciBpcyBpdCBhIHVi
b290IGZlYXR1cmU/Cj4gPj4+IEkgaGF2ZSB0cmllZCBhbm90aGVyIGJvYXJkLCBhbmQgdWJvb3Qg
bWFya3MgdGhlIGJidCBsb2NhdGlvbiBiYWQgb24gPj4+IHRoYXQgYXMKPiA+Pj4gd2VsbAo+ID4+
Pgo+ID4+PiBGaXJzdCBib290Ogo+ID4+PiBbwqDCoMKgIDQuMTQ5ODcwXSBuYW5kOiBkZXZpY2Ug
Zm91bmQsIE1hbnVmYWN0dXJlciBJRDogMHg5OCwgQ2hpcCBJRDogMHhkYwo+ID4+Pgo+ID4+Pgo+
ID4+PiBbwqDCoMKgIDQuMTU2NTg5XSBuYW5kOiBUb3NoaWJhIE5BTkQgNTEyTWlCIDMsM1YgOC1i
aXQKPiA+Pj4gW8KgwqDCoCA0LjE2MTUwMF0gbmFuZDogNTEyIE1pQiwgU0xDLCBlcmFzZSBzaXpl
OiAyNTYgS2lCLCBwYWdlIHNpemU6ID4+PiA0MDk2LCBPT0IKPiA+Pj4gc2l6ZTogMTI4Cj4gPj4+
Cj4gPj4+IFvCoMKgwqAgNC4xNzU5MThdIEJhZCBibG9jayB0YWJsZSBub3QgZm91bmQgZm9yIGNo
aXAgMAo+ID4+PiBbwqDCoMKgIDQuMTg0MDU5XSBCYWQgYmxvY2sgdGFibGUgbm90IGZvdW5kIGZv
ciBjaGlwIDAKPiA+Pj4gW8KgwqDCoCA0LjE4ODgwOF0gU2Nhbm5pbmcgZGV2aWNlIGZvciBiYWQg
YmxvY2tzCj4gPj4+IFvCoMKgwqAgNC42OTAxODNdIEJhZCBlcmFzZWJsb2NrIDc5OCBhdCAweDAw
MDAwYzc4MDAwMAo+ID4+PiBbwqDCoMKgIDUuMTU1NTA0XSBCYWQgZXJhc2VibG9jayAxNTM2IGF0
IDB4MDAwMDE4MDAwMDAwCj4gPj4+IFvCoMKgwqAgNS4xNjEwMDhdIEJhZCBlcmFzZWJsb2NrIDE1
MzcgYXQgMHgwMDAwMTgwNDAwMDAKPiA+Pj4gW8KgwqDCoCA1LjQ4Nzg4M10gQmFkIGJsb2NrIHRh
YmxlIHdyaXR0ZW4gdG8gMHgwMDAwMWZmYzAwMDAsIHZlcnNpb24gMHgwMSAgCj4gPj4KPiA+PiBB
bmQgaXMgdGhpcyB0aGUgYmFkIGtlcm5lbCBvciB0aGUgZ29vZCBrZXJuZWw/IFRoZSBxdWVzdGlv
biBJIGFtIHRyeWluZwo+ID4+IHRvIGFuc3dlciBpczogQ2FuIHRoZSBnb29kIGtlcm5lbCByZWFk
IHRoZSBCQlQgaXQgaGFzIHdyaXR0ZW4/IENhbiB0aGUKPiA+PiBiYWQgS2VybmVsIGRvIHRoYXQ/
ICAKPiA+IAo+ID4gVGhlICJGaXJzdCBib290IiBhbmQgIlNlY29uZCBib290IiB3YXMgYmVmb3Jl
IHRoZSBleGVjX29wIHBhdGNoLi4uCj4gPiAKPiA+IFRoaXMgaXMgdGhlIG5ldyBrZXJuZWwgaW5j
bHVkaW5nIHRoZSBleGVjX29wIHBhdGNoOgo+ID4gW8KgwqDCoCAxLjM0MzYxNV0gbmFuZDogZGV2
aWNlIGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4OTgsIENoaXAgSUQ6IDB4ZGMKPiA+IAo+ID4g
W8KgwqDCoCAxLjM0MzY1Nl0gbmFuZDogVG9zaGliYSBOQU5EIDUxMk1pQiAzLDNWIDgtYml0Cj4g
PiAKPiA+IFvCoMKgwqAgMS4zNDM2OTNdIG5hbmQ6IDUxMiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTog
MjU2IEtpQiwgcGFnZSBzaXplOiA0MDk2LCA+IE9PQiBzaXplOiAxMjgKPiA+IFvCoMKgwqAgMS4z
NDg2NjZdIHJhbmRvbTogZmFzdCBpbml0IGRvbmUKPiA+IFvCoMKgwqAgMS4zNDk1MThdIEJhZCBi
bG9jayB0YWJsZSBub3QgZm91bmQgZm9yIGNoaXAgMAo+ID4gW8KgwqDCoCAxLjM1MTQ1MV0gQmFk
IGJsb2NrIHRhYmxlIG5vdCBmb3VuZCBmb3IgY2hpcCAwCj4gPiBbwqDCoMKgIDEuMzUxNDg2XSBT
Y2FubmluZyBkZXZpY2UgZm9yIGJhZCBibG9ja3MKPiA+IFvCoMKgwqAgMS44MjczMzddIEJhZCBl
cmFzZWJsb2NrIDc5OCBhdCAweDAwMDAwYzc4MDAwMAo+ID4gCj4gPiBbwqDCoMKgIDIuMjY1OTQ5
XSBCYWQgZXJhc2VibG9jayAxNTM2IGF0IDB4MDAwMDE4MDAwMDAwCj4gPiBbwqDCoMKgIDIuMjY2
MzE4XSBCYWQgZXJhc2VibG9jayAxNTM3IGF0IDB4MDAwMDE4MDQwMDAwCj4gPiAKPiA+IFvCoMKg
wqAgMi41NzI4MjBdIEJhZCBibG9jayB0YWJsZSB3cml0dGVuIHRvIDB4MDAwMDFmZmMwMDAwLCB2
ZXJzaW9uIDB4MDEKPiA+IFvCoMKgwqAgMi41NzYxMjBdIEJhZCBibG9jayB0YWJsZSB3cml0dGVu
IHRvIDB4MDAwMDFmZjgwMDAwLCB2ZXJzaW9uIDB4MDEKPiA+IAo+ID4gW8KgwqDCoCAyLjU3NzA4
N10gMyBmaXhlZC1wYXJ0aXRpb25zIHBhcnRpdGlvbnMgZm91bmQgb24gTVREIGRldmljZSBncG1p
LW5hbmQKPiA+IFvCoMKgwqAgMi41NzcxMjddIENyZWF0aW5nIDMgTVREIHBhcnRpdGlvbnMgb24g
ImdwbWktbmFuZCI6Cj4gPiBbwqDCoMKgIDIuNTc3MTg4XSAweDAwMDAwMDAwMDAwMC0weDAwMDAw
MDgwMDAwMCA6ICJib290Igo+ID4gCj4gPiAKPiA+IAo+ID4gW8KgwqDCoCAyLjU4NDE2Ml0gMHgw
MDAwMDA4MDAwMDAtMHgwMDAwMWNhMDAwMDAgOiAidWJpIgo+ID4gW8KgwqDCoCAyLjYwODU3MV0g
MHgwMDAwMWNhMDAwMDAtMHgwMDAwMjAwMDAwMDAgOiAidGVzdGluZyIKPiA+IFvCoMKgwqAgMi42
MTQxMzZdIGdwbWktbmFuZCAxODA2MDAwLmdwbWktbmFuZDogZHJpdmVyIHJlZ2lzdGVyZWQuCj4g
PiAKPiA+IEV4YWN0bHkgdGhlIHNhbWUgb3V0cHV0Li4uIHdoaWNoIG11c3QgbWVhbiBpdCBmYWls
cyByZWFkaW5nL3dyaXRpbmcgdGhlID4gYmJ0IG9uIHRoZSA0LjE5Lnggc2VyaWVzIGtlcm5lbC4K
PiA+IAo+ID4gL1NlYW4gIAo+IAo+IEhpIFNhc2NoYQo+IAo+IFBsZWFzZSBsZXQgbWUga25vdyB3
aGVuIHlvdSBoYXZlIHNvbWUgdGltZSB0byBsb29rIGludG8gdGhpcyA6LSkKPiBJIGRvc2VuJ3Qg
c2VlbSByaWdodCB0aGF0IGl0IHdyaXRlcyB0aGUgYmJ0IG9uIGEgNC4xOSBzZXJpZXMga2VybmVs
IHR3aWNlCj4gCgpGb3IgbWUgdGhlIGRpc3R1cmJpbmcgcGFydCBpczoKCj4gPj4+IFvCoMKgwqAg
NC4xNzU5MThdIEJhZCBibG9jayB0YWJsZSBub3QgZm91bmQgZm9yIGNoaXAgMAo+ID4+PiBbwqDC
oMKgIDQuMTg0MDU5XSBCYWQgYmxvY2sgdGFibGUgbm90IGZvdW5kIGZvciBjaGlwIDAKCldyaXRp
bmcgdGhlIEJCVCB0d2ljZSBpcyBleHBlY3RlZC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
