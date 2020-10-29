Return-Path: <SRS0=x3fM=EE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C63C55179
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 07:54:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC83C218AC
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 07:54:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DxFO+OGL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC83C218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r5gatx44fDKNceQXPoUNrrGFyF3Mek2unIS+/YKc7k4=; b=DxFO+OGL7bJWaE+4/UoN3ShoX
	7rAXBk4liR9FJPt+rAvmtA3azSHLKBy7Vthj6FivBIcDqwgYZPCzEnDWOycPu9MTYeJ8kXNgfZd2u
	OPlJtrQdF615eUG5Dk6uBypFarIiEVnUp18cNlY3XIG2Yj7UAWkoKDeVzDz17g89G7Lq/KWkrShXt
	iBApOFHt+ByzJpMEtLJlsx8Cn3iJBUBjo7LoiR0T9g4KZurbtNlM8CR1HuBaLDICLF0ElFt5h0sW4
	e/VtGo/tBxpPWn1gUqeWVy+N9ImUwXx76RrFBA2VPLJpi42dGWif0ZS0qte5SuabeoIp+VgV/fS3G
	Qh64mnbBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY2kv-0002QE-Bc; Thu, 29 Oct 2020 07:53:57 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY2ks-0002OC-1y
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2020 07:53:55 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1E0AC240002;
 Thu, 29 Oct 2020 07:53:45 +0000 (UTC)
Date: Thu, 29 Oct 2020 08:53:44 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: mdalam@codeaurora.org
Subject: Re: [PATCH 0/5] mtd: rawnand: qcom: Add support for QSPI nand
Message-ID: <20201029085344.5b2a4b51@xps13>
In-Reply-To: <10db598eed716d7759bc0125b6977cf1@codeaurora.org>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
 <20201028104835.3dc31745@xps13>
 <10db598eed716d7759bc0125b6977cf1@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_035354_243143_2F9FFDD7 
X-CRM114-Status: GOOD (  21.36  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, sricharan@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgptZGFsYW1AY29kZWF1cm9yYS5vcmcgd3JvdGUgb24gV2VkLCAyOCBPY3QgMjAyMCAy
Mzo1NDoyMyArMDUzMDoKCj4gT24gMjAyMC0xMC0yOCAxNToxOCwgTWlxdWVsIFJheW5hbCB3cm90
ZToKPiA+IEhlbGxvLAo+ID4gCj4gPiBNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5v
cmc+IHdyb3RlIG9uIFNhdCwgMTAgT2N0IDIwMjAKPiA+IDExOjAxOjM3ICswNTMwOgo+ID4gICAK
PiA+PiBRUElDIDIuMCBzdXBwb3J0cyBTZXJpYWwgTkFORCBzdXBwb3J0IGluIGFkZGl0aW9uIHRv
IGFsbCBmZWF0dXJlcyBhbmQKPiA+PiBjb21tYW5kcyBpbiBRUElDIDEuMCBmb3IgcGFyYWxsZWwg
TkFORC4gUGFyYWxsZWwgYW5kIFNlcmlhbCBOQU5EID4+IGNhbm5vdAo+ID4+IG9wZXJhdGUgc2lt
dWx0YW5lb3VzbHkuIFFTUEkgbmFuZCBkZXZpY2VzIHdpbGwgY29ubmVjdCB0byBRUElDID4+IElP
X01BQ1JPCj4gPj4gYmxvY2sgb2YgUVBJQyBjb250cm9sbGVyLiBUaGVyZSBpcyBhIHNlcGFyYXRl
IElPX01BQ1JPIGNsb2NrIGZvciA+PiBJT19NQUNSTwo+ID4+IGJsb2NrLiBEZWZhdWx0IElPX01B
Q1JPIGJsb2NrIGRpdmlkZSB0aGUgaW5wdXQgY2xvY2sgYnkgNC4gc28gaWYgPj4gSU9fTUFDUk8K
PiA+PiBpbnB1dCBjbG9jayBpcyAzMjBNSHogdGhlbiBvbiBidXMgaXQgd2lsbCBiZSA4ME1Ieiwg
c28gUVNQSSBuYW5kID4+IGRldmljZQo+ID4+IHNob3VsZCBhbHNvIHN1cHBvcnQgdGhpcyBmcmVx
dWVuY3kuICAKPiA+PiA+PiBRUElDIHByb3ZpZGVzIDQgZGF0YSBwaW5zIHRvIFFTUEkgbmFuZC4g
SW4gc3RhbmRhcmQgU1BJIG1vZGUgKHgxIG1vZGUpID4+IGRhdGEgIAo+ID4+IHRyYW5zZmVyIHdp
bGwgb2NjdXIgb24gb25seSAyIHBpbnMgb25lIHBpbiBmb3IgU2VyaWFsIGRhdGEgaW4gYW5kIG9u
ZSA+PiBmb3IKPiA+PiBzZXJpYWwgZGF0YSBvdXQuIEluIFFVQUQgU1BJIG1vZGUgKHg0IG1vZGUp
IGRhdGEgdHJhbnNmZXIgd2lsbCBvY2N1ciA+PiBhdCBhbGwKPiA+PiB0aGUgZm91ciBkYXRhIGxp
bmVzLiBRUElDIGNvbnRyb2xsZXIgc3VwcG9ydHMgY29tbWFuZCBmb3IgeDEgbW9kZSBhbmQgPj4g
eDQgbW9kZS4gIAo+ID4+ID4+IE1kIFNhZHJlIEFsYW0gKDUpOiAgCj4gPj4gICBkdC1iaW5kaW5n
czogcWNvbV9uYW5kYzogSVBRNTAxOCBRUElDIE5BTkQgZG9jdW1lbnRhdGlvbgo+ID4+ICAgbXRk
OiByYXduYW5kOiBxY29tOiBBZGQgaW5pdGlhbCBzdXBwb3J0IGZvciBxc3BpIG5hbmQKPiA+PiAg
IG10ZDogcmF3bmFuZDogcWNvbTogUmVhZCBRUElDIHZlcnNpb24KPiA+PiAgIG10ZDogcmF3bmFu
ZDogcWNvbTogRW5hYmxlIHN1cHBvcnQgZm9yIGVyYXNlLHJlYWQgJiB3cml0ZSBmb3Igc2VyaWFs
Cj4gPj4gICAgIG5hbmQuCj4gPj4gICBtdGQ6IHJhd25hbmQ6IHFjb206IEFkZCBzdXBwb3J0IGZv
ciBzZXJpYWwgdHJhaW5pbmcuICAKPiA+PiA+PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L3Fjb21fbmFuZGMudHh0ICAgICAgICAgfCAgIDMgKyAgCj4gPj4gIGRyaXZlcnMvbXRkL25hbmQv
cmF3L25hbmRfaWRzLmMgICAgICAgICAgICAgICAgICAgIHwgIDEzICsKPiA+PiAgZHJpdmVycy9t
dGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jICAgICAgICAgICAgICAgICAgfCA1MDIgPj4gKysrKysr
KysrKysrKysrKysrKystCj4gPj4gIDMgZmlsZXMgY2hhbmdlZCwgNDk0IGluc2VydGlvbnMoKyks
IDI0IGRlbGV0aW9ucygtKSAgCj4gPj4gPiA+IEknbSBzb3JyeSBidXQgdGhpcyBzZXJpZXMgY2xl
YXJseSBicmVha3MgdGhlIGN1cnJlbnQgbGF5ZXJpbmcuIEkgY2Fubm90ICAKPiA+IGF1dGhvcml6
ZSBTUEktTkFORCBjb2RlIHRvIGZhbGwgaW50byB0aGUgcmF3IE5BTkQgc3Vic3lzdGVtLgo+ID4g
ICAKPiAKPiBJIGFtIGFncmVlIHdpdGggeW91LCB3ZSBzaG91bGQgbm90IGFkZCBTUEktTkFORCBj
aGFuZ2VzIGluc2lkZQo+IHJhdyBOQU5EIHN1YnN5c3RlbS4KPiAKPiA+IEFzIGJvdGggdHlwb2xv
Z2llcyBjYW5ub3QgYmUgdXNlZCBhdCB0aGUgc2FtZSB0aW1lLCBJIGd1ZXNzIHlvdSBzaG91bGQK
PiA+IGhhdmUgYW5vdGhlciBkcml2ZXIgaGFuZGxpbmcgdGhpcyBmZWF0dXJlIHVuZGVyIHRoZSBz
cGkvIHN1YnN5c3RlbSArCj4gPiBhIGZldyBkZWNsYXJhdGlvbnMgaW4gdGhlIFNQSS1OQU5EIGRl
dmljZXMgbGlzdC4KPiA+ICAgCj4gCj4gSW5pdGlhbGx5IEkgd2FzIHN0YXJ0ZWQgd3JpdGluZyBz
ZXBhcmF0ZSBkcml2ZXIgdW5kZXIgU1BJLU5BTkQgc3Vic3lzdGVtIHRoZW4gSQo+IHJlYWxpemVk
IHRoYXQgbW9yZSB0aGFuIDg1JSBvZiByYXcvcWNvbV9uYW5kLmMgY29kZSBnZXR0aW5nIGR1cGxp
Y2F0ZWQuCj4gCj4gVGhhdCdzIHdoeSBJIGhhdmUgYWRkZWQgdGhpcyBTUEktTkFORCBjaGFuZ2Ug
aW4gcmF3L3Fjb21fbmFuZC5jIHNpbmNlCj4gbW9yZSB0aGFuIDg1JSBvZiBjb2RlIHdpbGwgYmUg
cmV1c2VkLgo+IAo+IElmIEkgd2lsbCBhZGQgdGhpcyBjaGFuZ2UgaW5zaWRlIFNQSS1OQU5EIHN1
YnN5c3RlbSB0aGVuIG11Y2ggb2YKPiByYXcvcWNvbV9uYW5kLmMgY29kZSB3aWxsIGdldCBkdXBs
aWNhdGVkLiBXb3VsZCBpdCBiZSBvayA/CgpXaGF0IGFib3V0IG1vdmluZyB0aGUgZ2VuZXJpYyBj
b2RlIHRvIGRyaXZlcnMvbXRkL25hbmQvY29tbW9uLyBhbmQKcmVmZXJyaW5nIHRvIGl0IGZyb20g
ZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kLmMgYW5kCmRyaXZlcnMvc3BpL3NwaS1xY29t
LmMgKG9yIHN1Y2gpPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
