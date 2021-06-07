Return-Path: <SRS0=QmfO=LB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DECBC47082
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 10:30:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38D576108E
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 10:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38D576108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fuivaN09ncSlc9q1p7BtCi7B8qvTNXjJxNksX8MeLBc=; b=Nnk+RPZYImz9BT
	WY1KIswAc3utKUrVCiuAsAWU5BLH49WkFuz1ot76FHKy0N2Fe/RFUr3ZF180AEZe2PAiNrJV2YLTQ
	x6mGkbJqot7gmMFVNEocue3sc2kNal+osH986Krj/9iSmfV4Arsr/s8V/fw4lSGBytW7VKa36Qr1v
	ZfhSLSCjrtFlqVfywgQXsX53xcaLT5HtCSjugLeO8knPxrfjP8laoqg67yz05o4DpxgPlE9McgYU/
	AgEPmaLDqwq5cBt1HNYlLNfeJsTSwCzzfCQ4JScqTMu0e+iBeR1ymAHMCOMok6j285bQ3X8YjUZ/x
	Pwf4d6pvApGZVPRTS8wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqCVv-002v9p-Ut; Mon, 07 Jun 2021 10:29:48 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqBuA-002iRk-5q
 for linux-mtd@lists.infradead.org; Mon, 07 Jun 2021 09:50:48 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3CA3624000B;
 Mon,  7 Jun 2021 09:50:42 +0000 (UTC)
Date: Mon, 7 Jun 2021 11:50:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>
Cc: mani@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sricharan@codeaurora.org
Subject: Re: [PATCH V3] mtd: rawnand: qcom: avoid writing to obsolete register
Message-ID: <20210607115041.21e21e19@xps13>
In-Reply-To: <1623059017-5058-1-git-send-email-mdalam@codeaurora.org>
References: <1623059017-5058-1-git-send-email-mdalam@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_025046_524474_E21B0171 
X-CRM114-Status: GOOD (  16.53  )
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

SGVsbG8sCgpNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5vcmc+IHdyb3RlIG9uIE1v
biwgIDcgSnVuIDIwMjEKMTU6MTM6MzcgKzA1MzA6Cgo+IFFQSUNfRUJJMl9FQ0NfQlVGX0NGRyBy
ZWdpc3RlciBnb3Qgb2Jzb2xldGUgZnJvbSBRUElDIFYyLjAgb253YXJkcy4KPiBBdm9pZCB3cml0
aW5nIHRoaXMgcmVnaXN0ZXIgaWYgUVBJQyB2ZXJzaW9uIGlzIFYyLjAgb3IgbmV3ZXIuCj4gCj4g
QWxzbyBmaXhlZCBuYW5kYyB1bmRlY2xhcmVkIGlzc3VlIHJlcG9ydGVkIGJ5LAo+IAo+IFJlcG9y
dGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KClRoaXMgdGFnIHNob3Vs
ZCBvbmx5IGJlIGFkZGVkIHdoZW4geW91IGZpeCBzb21ldGhpbmcgdGhhdCBpcyBhbHJlYWR5IGlu
Cm1haW5saW5lLiBUaGUgUmVwb3J0ZWQtYnkgaGVyZSBwb2ludHMgdG8gdjIsIHdoaWNoIG1ha2Vz
IG5vIHNlbnNlLgpQbGVhc2UgZHJvcCBpdC4KCj4gU2lnbmVkLW9mZi1ieTogTWQgU2FkcmUgQWxh
bSA8bWRhbGFtQGNvZGVhdXJvcmEub3JnPgo+IC0tLQo+IFtWM10KPiAgKiBGaXhlZCBuYW5kYyB1
bmRlY2xhcmVkIGlzc3VlLgo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCAx
OCArKysrKysrKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fj
b21fbmFuZGMuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+IGluZGV4IGE2
NGZiNmMuLmVlNTk4NWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9u
YW5kYy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gQEAgLTcz
NCw2ICs3MzQsNyBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfcndfcmVncyhzdHJ1Y3QgcWNvbV9uYW5k
X2hvc3QgKmhvc3QsIGludCBudW1fY3csIGJvb2wgcmVhZCwgaQo+ICB7Cj4gIAlzdHJ1Y3QgbmFu
ZF9jaGlwICpjaGlwID0gJmhvc3QtPmNoaXA7Cj4gIAl1MzIgY21kLCBjZmcwLCBjZmcxLCBlY2Nf
YmNoX2NmZzsKPiArCXN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAqbmFuZGMgPSBnZXRfcWNv
bV9uYW5kX2NvbnRyb2xsZXIoY2hpcCk7Cj4gIAo+ICAJaWYgKHJlYWQpIHsKPiAgCQlpZiAoaG9z
dC0+dXNlX2VjYykKPiBAQCAtNzYyLDcgKzc2Myw4IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9yd19y
ZWdzKHN0cnVjdCBxY29tX25hbmRfaG9zdCAqaG9zdCwgaW50IG51bV9jdywgYm9vbCByZWFkLCBp
Cj4gIAluYW5kY19zZXRfcmVnKGNoaXAsIE5BTkRfREVWMF9DRkcwLCBjZmcwKTsKPiAgCW5hbmRj
X3NldF9yZWcoY2hpcCwgTkFORF9ERVYwX0NGRzEsIGNmZzEpOwo+ICAJbmFuZGNfc2V0X3JlZyhj
aGlwLCBOQU5EX0RFVjBfRUNDX0NGRywgZWNjX2JjaF9jZmcpOwo+IC0JbmFuZGNfc2V0X3JlZyhj
aGlwLCBOQU5EX0VCSTJfRUNDX0JVRl9DRkcsIGhvc3QtPmVjY19idWZfY2ZnKTsKPiArCWlmICgh
bmFuZGMtPnByb3BzLT5xcGljX3YyKQo+ICsJCW5hbmRjX3NldF9yZWcoY2hpcCwgTkFORF9FQkky
X0VDQ19CVUZfQ0ZHLCBob3N0LT5lY2NfYnVmX2NmZyk7Cj4gIAluYW5kY19zZXRfcmVnKGNoaXAs
IE5BTkRfRkxBU0hfU1RBVFVTLCBob3N0LT5jbHJmbGFzaHN0YXR1cyk7Cj4gIAluYW5kY19zZXRf
cmVnKGNoaXAsIE5BTkRfUkVBRF9TVEFUVVMsIGhvc3QtPmNscnJlYWRzdGF0dXMpOwo+ICAJbmFu
ZGNfc2V0X3JlZyhjaGlwLCBOQU5EX0VYRUNfQ01ELCAxKTsKPiBAQCAtMTEzMyw3ICsxMTM1LDgg
QEAgc3RhdGljIHZvaWQgY29uZmlnX25hbmRfcGFnZV9yZWFkKHN0cnVjdCBuYW5kX2NoaXAgKmNo
aXApCj4gIAo+ICAJd3JpdGVfcmVnX2RtYShuYW5kYywgTkFORF9BRERSMCwgMiwgMCk7Cj4gIAl3
cml0ZV9yZWdfZG1hKG5hbmRjLCBOQU5EX0RFVjBfQ0ZHMCwgMywgMCk7Cj4gLQl3cml0ZV9yZWdf
ZG1hKG5hbmRjLCBOQU5EX0VCSTJfRUNDX0JVRl9DRkcsIDEsIDApOwo+ICsJaWYgKCFuYW5kYy0+
cHJvcHMtPnFwaWNfdjIpCj4gKwkJd3JpdGVfcmVnX2RtYShuYW5kYywgTkFORF9FQkkyX0VDQ19C
VUZfQ0ZHLCAxLCAwKTsKPiAgCXdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRfRVJBU0VEX0NXX0RF
VEVDVF9DRkcsIDEsIDApOwo+ICAJd3JpdGVfcmVnX2RtYShuYW5kYywgTkFORF9FUkFTRURfQ1df
REVURUNUX0NGRywgMSwKPiAgCQkgICAgICBOQU5EX0VSQVNFRF9DV19TRVQgfCBOQU5EX0JBTV9O
RVhUX1NHTCk7Cj4gQEAgLTExOTEsOCArMTE5NCw5IEBAIHN0YXRpYyB2b2lkIGNvbmZpZ19uYW5k
X3BhZ2Vfd3JpdGUoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiAgCj4gIAl3cml0ZV9yZWdfZG1h
KG5hbmRjLCBOQU5EX0FERFIwLCAyLCAwKTsKPiAgCXdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRf
REVWMF9DRkcwLCAzLCAwKTsKPiAtCXdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRfRUJJMl9FQ0Nf
QlVGX0NGRywgMSwKPiAtCQkgICAgICBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4gKwlpZiAoIW5hbmRj
LT5wcm9wcy0+cXBpY192MikKPiArCQl3cml0ZV9yZWdfZG1hKG5hbmRjLCBOQU5EX0VCSTJfRUND
X0JVRl9DRkcsIDEsCj4gKwkJCSAgICAgIE5BTkRfQkFNX05FWFRfU0dMKTsKPiAgfQo+ICAKPiAg
LyoKPiBAQCAtMTI0OCw3ICsxMjUyLDggQEAgc3RhdGljIGludCBuYW5kY19wYXJhbShzdHJ1Y3Qg
cWNvbV9uYW5kX2hvc3QgKmhvc3QpCj4gIAkJCQkJfCAyIDw8IFdSX1JEX0JTWV9HQVAKPiAgCQkJ
CQl8IDAgPDwgV0lERV9GTEFTSAo+ICAJCQkJCXwgMSA8PCBERVYwX0NGRzFfRUNDX0RJU0FCTEUp
Owo+IC0JbmFuZGNfc2V0X3JlZyhjaGlwLCBOQU5EX0VCSTJfRUNDX0JVRl9DRkcsIDEgPDwgRUND
X0NGR19FQ0NfRElTQUJMRSk7Cj4gKwlpZiAoIW5hbmRjLT5wcm9wcy0+cXBpY192MikKPiArCQlu
YW5kY19zZXRfcmVnKGNoaXAsIE5BTkRfRUJJMl9FQ0NfQlVGX0NGRywgMSA8PCBFQ0NfQ0ZHX0VD
Q19ESVNBQkxFKTsKPiAgCj4gIAkvKiBjb25maWd1cmUgQ01EMSBhbmQgVkxEIGZvciBPTkZJIHBh
cmFtIHByb2JpbmcgaW4gUVBJQyB2MSAqLwo+ICAJaWYgKCFuYW5kYy0+cHJvcHMtPnFwaWNfdjIp
IHsKPiBAQCAtMjY4OSw3ICsyNjk0LDggQEAgc3RhdGljIGludCBxY29tX25hbmRfYXR0YWNoX2No
aXAoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiAgCQkJCXwgZWNjX21vZGUgPDwgRUNDX01PREUK
PiAgCQkJCXwgaG9zdC0+ZWNjX2J5dGVzX2h3IDw8IEVDQ19QQVJJVFlfU0laRV9CWVRFU19CQ0g7
Cj4gIAo+IC0JaG9zdC0+ZWNjX2J1Zl9jZmcgPSAweDIwMyA8PCBOVU1fU1RFUFM7Cj4gKwlpZiAo
IW5hbmRjLT5wcm9wcy0+cXBpY192MikKPiArCQlob3N0LT5lY2NfYnVmX2NmZyA9IDB4MjAzIDw8
IE5VTV9TVEVQUzsKPiAgCj4gIAlob3N0LT5jbHJmbGFzaHN0YXR1cyA9IEZTX1JFQURZX0JTWV9O
Owo+ICAJaG9zdC0+Y2xycmVhZHN0YXR1cyA9IDB4YzA7CgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
