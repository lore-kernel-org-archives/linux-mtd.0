Return-Path: <SRS0=c5zc=3K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0A3C2D0CE
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jan 2020 13:44:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E15F12070C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jan 2020 13:44:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bMGyfTkD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E15F12070C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Z3AZz+lHl3fEHf72i/d0DWJ5eLt0VwPd5PQtV6ImDw=; b=bMGyfTkDptK4PT
	v1W/JJTN/AamPpt1j6il1m8RExjFjRtjpBamXbnNoJ+ei7ynHw5T46fTehRWK0FrSnLhoztcaxKDM
	+4CMAm8874PjuATlzHQs9K8WBkYvbkZESwff3MjEZ3Bl3ca7x+Lc00k/85syOY+Irm5Of4Xzit8/X
	qakeOPEyHVohk2Qiki/Z2p90BaqIro225vGdqshSBCW9tS5T4emnCW5l2LkfI8PQe49ofLGuE+CYN
	qatbovNDf6oy6knj/+eZfKn13TdvS3N8aRrfK+YTFXstQojpB68JiMlHdvClCkGQxvSOTqb9QfOK9
	+57bgsXIAaaPCvrvRCsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ittpO-0008KK-9E; Tue, 21 Jan 2020 13:44:22 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ittpI-0008Jo-7s
 for linux-mtd@lists.infradead.org; Tue, 21 Jan 2020 13:44:20 +0000
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1645F1C0015;
 Tue, 21 Jan 2020 13:44:05 +0000 (UTC)
Date: Tue, 21 Jan 2020 14:44:05 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
Subject: Re: [EXT] Re: [PATCH 4/4] mtd: spinand: Add new Micron SPI NAND
 devices with multiple dies
Message-ID: <20200121144405.6fd49ae2@xps13>
In-Reply-To: <MN2PR08MB6397E9900A3638E873434B9DB80D0@MN2PR08MB6397.namprd08.prod.outlook.com>
References: <20200119145432.10405-1-sshivamurthy@micron.com>
 <20200119145432.10405-5-sshivamurthy@micron.com>
 <20200120112219.36bae01e@xps13>
 <MN2PR08MB6397E9900A3638E873434B9DB80D0@MN2PR08MB6397.namprd08.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_054416_555341_93442FC3 
X-CRM114-Status: GOOD (  22.33  )
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
 Boris Brezillon <bbrezillon@kernel.org>,
 "shiva.linuxworks@gmail.com" <shiva.linuxworks@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2hpdmFtdXJ0aHksCgoiU2hpdmFtdXJ0aHkgU2hhc3RyaSAoc3NoaXZhbXVydGh5KSIgPHNz
aGl2YW11cnRoeUBtaWNyb24uY29tPiB3cm90ZSBvbgpUdWUsIDIxIEphbiAyMDIwIDEyOjIzOjM2
ICswMDAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gPiAKPiA+IEhpIFNoaXZhLAo+ID4gCj4gPiBzaGl2
YS5saW51eHdvcmtzQGdtYWlsLmNvbSB3cm90ZSBvbiBTdW4sIDE5IEphbiAyMDIwIDE1OjU0OjMy
ICswMTAwOgo+ID4gICAKPiA+ID4gRnJvbTogU2hpdmFtdXJ0aHkgU2hhc3RyaSA8c3NoaXZhbXVy
dGh5QG1pY3Jvbi5jb20+Cj4gPiA+Cj4gPiA+IEFkZCBkZXZpY2UgdGFibGUgZm9yIG5ldyBNaWNy
b24gU1BJIE5BTkQgZGV2aWNlcywgd2hpY2ggaGF2ZSBtdWx0aXBsZQo+ID4gPiBkaWVzLiBXaGls
ZSBhdCBpdCwgYWRkIHN1cHBvcnQgdG8gc2VsZWN0IHRoZSBkaWUuICAKPiA+IAo+ID4gU2FtZSBj
b21tZW50IGFzIGluIDMvNC4gIAo+IAo+IEkgd2lsbCBjb3JyZWN0IHRoZSBjb21tZW50LgoKQWN0
dWFsbHkgbm93IHdpdGggbW9yZSBleHBsYW5hdGlvbiBJIHVuZGVyc3RhbmQgYmV0dGVyLiBQbGVh
c2UKa2VlcCBpbiBtaW5kIHRoYXQgYW55Ym9keSBub3Qga25vd2luZyB3aGF0IHlvdSBkbyBvbiBh
IGRhaWx5IGJhc2lzCnNob3VsZCB1bmRlcnN0YW5kIHdoYXQgdGhpcyBjb21taXQgZG9lcyBhbmQg
d2h5LgoKU28gbGlrZSBiZWZvcmUsIHlvdSBhY3R1YWxseSBkb24ndCBuZWVkIHRvIHNwbGl0IHRo
aXMgcGF0Y2gsIGJ1dAppbnN0ZWFkIHJld29yayB0aGUgY29tbWl0IG1lc3NhZ2UuCgo+IAo+ID4g
ICAKPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogU2hpdmFtdXJ0aHkgU2hhc3RyaSA8c3NoaXZh
bXVydGh5QG1pY3Jvbi5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkv
bWljcm9uLmMgfCA1MCAgCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyAg
Cj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9uLmMgIAo+ID4gYi9kcml2ZXJzL210
ZC9uYW5kL3NwaS9taWNyb24uYyAgCj4gPiA+IGluZGV4IDQ1ZmMzN2M1OGY4YS4uMDNiNDg2ODQz
MjEwIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24uYwo+ID4g
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24uYwo+ID4gPiBAQCAtMTgsNiArMTgs
OCBAQAo+ID4gPiAgI2RlZmluZSBNSUNST05fU1RBVFVTX0VDQ180VE82X0JJVEZMSVBTCSgzIDw8
IDQpCj4gPiA+ICAjZGVmaW5lIE1JQ1JPTl9TVEFUVVNfRUNDXzdUTzhfQklURkxJUFMJKDUgPDwg
NCkKPiA+ID4KPiA+ID4gKyNkZWZpbmUgTUlDUk9OX0RJRV9TRUxFQ1RJT05fQklUCTYKPiA+ID4g
Kwo+ID4gPiAgc3RhdGljIFNQSU5BTkRfT1BfVkFSSUFOVFMocmVhZF9jYWNoZV92YXJpYW50cywK
PiA+ID4gIAkJU1BJTkFORF9QQUdFX1JFQURfRlJPTV9DQUNIRV9RVUFESU9fT1AoMCwgMiwgIAo+
ID4gTlVMTCwgMCksICAKPiA+ID4gIAkJU1BJTkFORF9QQUdFX1JFQURfRlJPTV9DQUNIRV9YNF9P
UCgwLCAxLCBOVUxMLCAwKSwKPiA+ID4gQEAgLTY0LDYgKzY2LDIxIEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgbXRkX29vYmxheW91dF9vcHMgIAo+ID4gbWljcm9uXzhfb29ibGF5b3V0ID0geyAgCj4g
PiA+ICAJLmZyZWUgPSBtaWNyb25fOF9vb2JsYXlvdXRfZnJlZSwKPiA+ID4gIH07Cj4gPiA+Cj4g
PiA+ICtzdGF0aWMgaW50IG1pY3Jvbl9zZWxlY3RfdGFyZ2V0KHN0cnVjdCBzcGluYW5kX2Rldmlj
ZSAqc3BpbmFuZCwKPiA+ID4gKwkJCQl1bnNpZ25lZCBpbnQgdGFyZ2V0KQo+ID4gPiArewo+ID4g
PiArCXN0cnVjdCBzcGlfbWVtX29wIG9wID0gU1BJTkFORF9TRVRfRkVBVFVSRV9PUCgweGQwLAo+
ID4gPiArCQkJCQkJICAgICAgc3BpbmFuZC0+c2NyYXRjaGJ1Zik7Cj4gPiA+ICsKPiA+ID4gKwkv
Kgo+ID4gPiArCSAqIEFzIHBlciBkYXRhc2hlZXQsIGRpZSBzZWxlY3Rpb24gaXMgZG9uZSBieSB0
aGUgNnRoIGJpdCBvZiBEaWUKPiA+ID4gKwkgKiBTZWxlY3QgUmVnaXN0ZXIgKEFkZHJlc3MgMHhE
MCkuCj4gPiA+ICsJICovICAKPiA+IAo+ID4gSSB3b3VsZCBwdXQgdGhpcyBjb21tZW50IGNsb3Nl
IHRvIHRoZSBtYWNybyBkZWZpbml0aW9uLiAgCj4gCj4gU3VyZSwgSSB3aWxsIGRvIGl0Lgo+IAo+
ID4gICAKPiA+ID4gKwkqc3BpbmFuZC0+c2NyYXRjaGJ1ZiA9IHRhcmdldCA8PCBNSUNST05fRElF
X1NFTEVDVElPTl9CSVQ7ICAKPiA+IAo+ID4gRWl0aGVyIHRhcmdldCBpcyBvciBvciAxIGFuZCB5
b3UgY2FuIHVzZSB0aGUgQklUIG1hY3JvLCBvciB5b3Ugc3VwcG9zZQo+ID4gaXQgY2FuIGdvIGhp
Z2hlciBhbmQgdGhlIF9CSVQgc3VmZml4IGRvZXMgbm90IGZpdC4gX1NISUZUIHdvdWxkIHdvcmsK
PiA+IGFuZCBjcmVhdGluZyBhIG1hY3JvIGRpcmVjdGx5IHdvdWxkIGJlIGV2ZW4gYmV0dGVyLgo+
ID4gICAKPiAKPiBJIHdpbGwgY3JlYXRlIG1hY3JvIGRpcmVjdGx5IGFuZCBzZW5kIHRoZSBjb2Rl
IGluIG5leHQgdmVyc2lvbi4KPiAKPiA+ID4gKwo+ID4gPiArCXJldHVybiBzcGlfbWVtX2V4ZWNf
b3Aoc3BpbmFuZC0+c3BpbWVtLCAmb3ApOwo+ID4gPiArfQo+ID4gPiArICAKPiA+IAo+ID4gV2hl
cmUgaXMgdGhpcyBmdW5jdGlvbiB1c2VkPyAgCj4gCj4gSUlVQyB5b3VyIHF1ZXN0aW9uLCB0aGUg
ZnVuY3Rpb24gaXMgdXNlZCBiZWxvdyBpbiBkZXZpY2UgdGFibGUuCj4gVGhlIGxpbmUgaXMgc29t
ZXRoaW5nIGxpa2UsIAo+IAo+IFNQSU5BTkRfU0VMRUNUX1RBUkdFVChtaWNyb25fc2VsZWN0X3Rh
cmdldCkpCgpJIGp1c3QgbWlzc2VkIGl0IDopCgo+IAo+IGZvciBhbGwgdGhlIGRldmljZXMgd2l0
aCBtdWx0aXBsZSBkaWVzLgo+IAo+ID4gICAKPiA+ID4gIHN0YXRpYyBpbnQgbWljcm9uXzhfZWNj
X2dldF9zdGF0dXMoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+ID4gPiAgCQkJCSAg
IHU4IHN0YXR1cykKPiA+ID4gIHsKPiA+ID4gQEAgLTEzMSw2ICsxNDgsMTcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBzcGluYW5kX2luZm8gIAo+ID4gbWljcm9uX3NwaW5hbmRfdGFibGVbXSA9IHsg
IAo+ID4gPiAgCQkgICAgIDAsCj4gPiA+ICAJCSAgICAgU1BJTkFORF9FQ0NJTkZPKCZtaWNyb25f
OF9vb2JsYXlvdXQsCj4gPiA+ICAJCQkJICAgICBtaWNyb25fOF9lY2NfZ2V0X3N0YXR1cykpLAo+
ID4gPiArCS8qIE03OUEgNEdiIDMuM1YgKi8KPiA+ID4gKwlTUElOQU5EX0lORk8oIk1UMjlGNEcw
MUFEQUdEIiwgMHgzNiwKPiA+ID4gKwkJICAgICBOQU5EX01FTU9SRygxLCAyMDQ4LCAxMjgsIDY0
LCAyMDQ4LCA4MCwgMiwgMSwgMiksCj4gPiA+ICsJCSAgICAgTkFORF9FQ0NSRVEoOCwgNTEyKSwK
PiA+ID4gKwkJICAgICBTUElOQU5EX0lORk9fT1BfVkFSSUFOVFMoJnJlYWRfY2FjaGVfdmFyaWFu
dHMsCj4gPiA+ICsJCQkJCSAgICAgICZ3cml0ZV9jYWNoZV92YXJpYW50cywKPiA+ID4gKwkJCQkJ
ICAgICAgJnVwZGF0ZV9jYWNoZV92YXJpYW50cyksCj4gPiA+ICsJCSAgICAgMCwKPiA+ID4gKwkJ
ICAgICBTUElOQU5EX0VDQ0lORk8oJm1pY3Jvbl84X29vYmxheW91dCwKPiA+ID4gKwkJCQkgICAg
IG1pY3Jvbl84X2VjY19nZXRfc3RhdHVzKSwKPiA+ID4gKwkJICAgICBTUElOQU5EX1NFTEVDVF9U
QVJHRVQobWljcm9uX3NlbGVjdF90YXJnZXQpKSwKPiA+ID4gIAkvKiBNNzBBIDRHYiAzLjNWICov
Cj4gPiA+ICAJU1BJTkFORF9JTkZPKCJNVDI5RjRHMDFBQkFGRCIsIDB4MzQsCj4gPiA+ICAJCSAg
ICAgTkFORF9NRU1PUkcoMSwgNDA5NiwgMjU2LCA2NCwgMjA0OCwgNDAsIDEsIDEsIDEpLAo+ID4g
PiBAQCAtMTUxLDYgKzE3OSwyOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaW5hbmRfaW5mbyAg
Cj4gPiBtaWNyb25fc3BpbmFuZF90YWJsZVtdID0geyAgCj4gPiA+ICAJCSAgICAgMCwKPiA+ID4g
IAkJICAgICBTUElOQU5EX0VDQ0lORk8oJm1pY3Jvbl84X29vYmxheW91dCwKPiA+ID4gIAkJCQkg
ICAgIG1pY3Jvbl84X2VjY19nZXRfc3RhdHVzKSksCj4gPiA+ICsJLyogTTcwQSA4R2IgMy4zViAq
Lwo+ID4gPiArCVNQSU5BTkRfSU5GTygiTVQyOUY4RzAxQURBRkQiLCAweDQ2LAo+ID4gPiArCQkg
ICAgIE5BTkRfTUVNT1JHKDEsIDQwOTYsIDI1NiwgNjQsIDIwNDgsIDQwLCAxLCAxLCAyKSwKPiA+
ID4gKwkJICAgICBOQU5EX0VDQ1JFUSg4LCA1MTIpLAo+ID4gPiArCQkgICAgIFNQSU5BTkRfSU5G
T19PUF9WQVJJQU5UUygmcmVhZF9jYWNoZV92YXJpYW50cywKPiA+ID4gKwkJCQkJICAgICAgJndy
aXRlX2NhY2hlX3ZhcmlhbnRzLAo+ID4gPiArCQkJCQkgICAgICAmdXBkYXRlX2NhY2hlX3Zhcmlh
bnRzKSwKPiA+ID4gKwkJICAgICAwLAo+ID4gPiArCQkgICAgIFNQSU5BTkRfRUNDSU5GTygmbWlj
cm9uXzhfb29ibGF5b3V0LAo+ID4gPiArCQkJCSAgICAgbWljcm9uXzhfZWNjX2dldF9zdGF0dXMp
LAo+ID4gPiArCQkgICAgIFNQSU5BTkRfU0VMRUNUX1RBUkdFVChtaWNyb25fc2VsZWN0X3Rhcmdl
dCkpLAo+ID4gPiArCS8qIE03MEEgOEdiIDEuOFYgKi8KPiA+ID4gKwlTUElOQU5EX0lORk8oIk1U
MjlGOEcwMUFEQkZEIiwgMHg0NywKPiA+ID4gKwkJICAgICBOQU5EX01FTU9SRygxLCA0MDk2LCAy
NTYsIDY0LCAyMDQ4LCA0MCwgMSwgMSwgMiksCj4gPiA+ICsJCSAgICAgTkFORF9FQ0NSRVEoOCwg
NTEyKSwKPiA+ID4gKwkJICAgICBTUElOQU5EX0lORk9fT1BfVkFSSUFOVFMoJnJlYWRfY2FjaGVf
dmFyaWFudHMsCj4gPiA+ICsJCQkJCSAgICAgICZ3cml0ZV9jYWNoZV92YXJpYW50cywKPiA+ID4g
KwkJCQkJICAgICAgJnVwZGF0ZV9jYWNoZV92YXJpYW50cyksCj4gPiA+ICsJCSAgICAgMCwKPiA+
ID4gKwkJICAgICBTUElOQU5EX0VDQ0lORk8oJm1pY3Jvbl84X29vYmxheW91dCwKPiA+ID4gKwkJ
CQkgICAgIG1pY3Jvbl84X2VjY19nZXRfc3RhdHVzKSwKPiA+ID4gKwkJICAgICBTUElOQU5EX1NF
TEVDVF9UQVJHRVQobWljcm9uX3NlbGVjdF90YXJnZXQpKSwKPiA+ID4gIH07Cj4gPiA+Cj4gPiA+
ICBzdGF0aWMgaW50IG1pY3Jvbl9zcGluYW5kX2RldGVjdChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2Ug
KnNwaW5hbmQpICAKPiA+IAo+ID4gCj4gPiAKPiA+IAo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobCAg
Cj4gCj4gVGhhbmtzLAo+IFNoaXZhCgoKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
