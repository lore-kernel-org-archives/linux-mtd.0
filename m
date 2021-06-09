Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9D8C48BCF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 15:01:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBEBB611CC
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 15:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBEBB611CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgARPyIW0yqQ7adK+MmV4nVQFVAsFTrjucyuC2McM2Y=; b=FBaYaSPS9W/puz
	mSvR4G+45w7L6t3lt0LMI+qIYu1m0dO46JgsP/+OuS+Yy4B8Zqf/goHjRgBrrYMFFUgET156ag1yp
	96t71LewEwhDj6VsOYMOgoxJ5mbeFmeAlCUY9n2s4uywjDih3EXEnO5IH1/GbYesdzhFZGl81+YEP
	cxBrMcqbxXG7RRY9XWXLJD3KPdEKgN56URO228k8nALgDnxj1H9j8l5es8WvxlHESG/3aLJR//CP6
	vuLV0lQbN0HWo5E6mUPStfoymjQnMDA/bnYQlepeyPJsBoCUl1GyHvjmUZPGkP3rjwg4WgaPt6BE3
	7lsWZ2pQQEkC32hQ2FCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqzgt-00ESqk-UH; Wed, 09 Jun 2021 15:00:24 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqyvd-00EE6I-Bj; Wed, 09 Jun 2021 14:11:35 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B57C21BF203;
 Wed,  9 Jun 2021 14:11:29 +0000 (UTC)
Date: Wed, 9 Jun 2021 16:11:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Michal Simek <monstr@monstr.eu>, Naga
 Sureshkumar Relli <nagasure@xilinx.com>, Amit Kumar Mahapatra
 <akumarma@xilinx.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>, Siva Durga
 Prasad Paladugu <sivadur@xilinx.com>
Subject: Re: [PATCH v22 09/18] dt-binding: memory: pl353-smc: Convert to yaml
Message-ID: <20210609161128.16cdf5ec@xps13>
In-Reply-To: <77db74d3-c44a-6aa3-1b61-f6bed565fa04@canonical.com>
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
 <20210609080112.1753221-10-miquel.raynal@bootlin.com>
 <e431d594-05cd-27b8-fcbe-11c310b99cd3@canonical.com>
 <20210609153410.53eadf8e@xps13>
 <77db74d3-c44a-6aa3-1b61-f6bed565fa04@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_071133_733942_C0D2E772 
X-CRM114-Status: GOOD (  24.85  )
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

SGkgS3J6eXN6dG9mLCBSb2IsCgpLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93
c2tpQGNhbm9uaWNhbC5jb20+IHdyb3RlIG9uIFdlZCwgOQpKdW4gMjAyMSAxNTo1NDoxOSArMDIw
MDoKCj4gT24gMDkvMDYvMjAyMSAxNTozNCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIEty
enlzenRvZiwKPiA+IAo+ID4gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3Nr
aUBjYW5vbmljYWwuY29tPiB3cm90ZSBvbiBXZWQsIDkKPiA+IEp1biAyMDIxIDE0OjEyOjQwICsw
MjAwOgo+ID4gICAKPiA+PiBPbiAwOS8wNi8yMDIxIDEwOjAxLCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
OiAgCj4gPj4+IENvbnZlcnQgdGhpcyBiaW5kaW5nIGZpbGUgdG8geWFtbCBzY2hlbWEuCj4gPj4+
Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxp
bi5jb20+Cj4gPj4+IC0tLQo+ID4+PiAgLi4uL21lbW9yeS1jb250cm9sbGVycy9hcm0scGwzNTMt
c21jLnlhbWwgICAgIHwgMTMzICsrKysrKysrKysrKysrKysrKwo+ID4+PiAgLi4uL2JpbmRpbmdz
L21lbW9yeS1jb250cm9sbGVycy9wbDM1My1zbWMudHh0IHwgIDQ1IC0tLS0tLQo+ID4+PiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMzMgaW5zZXJ0aW9ucygrKSwgNDUgZGVsZXRpb25zKC0pCj4gPj4+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9y
eS1jb250cm9sbGVycy9hcm0scGwzNTMtc21jLnlhbWwKPiA+Pj4gIGRlbGV0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL3Bs
MzUzLXNtYy50eHQKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvYXJtLHBsMzUzLXNtYy55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9hcm0scGwz
NTMtc21jLnlhbWwKPiA+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+Pj4gaW5kZXggMDAwMDAw
MDAwMDAwLi4xZGU2Zjg3ZDQ5ODYKPiA+Pj4gLS0tIC9kZXYvbnVsbAo+ID4+PiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2FybSxwbDM1
My1zbWMueWFtbAo+ID4+PiBAQCAtMCwwICsxLDEzMyBAQAo+ID4+PiArIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gPj4+ICslWUFNTCAx
LjIKPiA+Pj4gKy0tLQo+ID4+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9t
ZW1vcnktY29udHJvbGxlcnMvYXJtLHBsMzUzLXNtYy55YW1sIwo+ID4+PiArJHNjaGVtYTogaHR0
cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPj4+ICsKPiA+Pj4g
K3RpdGxlOiBBUk0gUEwzNTMgU3RhdGljIE1lbW9yeSBDb250cm9sbGVyIChTTUMpIGRldmljZS10
cmVlIGJpbmRpbmdzCj4gPj4+ICsKPiA+Pj4gK21haW50YWluZXJzOgo+ID4+PiArICAtIE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPj4+ICsgIC0gTmFnYSBTdXJl
c2hrdW1hciBSZWxsaSA8bmFnYS5zdXJlc2hrdW1hci5yZWxsaUB4aWxpbnguY29tPgo+ID4+PiAr
Cj4gPj4+ICtkZXNjcmlwdGlvbjoKPiA+Pj4gKyAgVGhlIFBMMzUzIFN0YXRpYyBNZW1vcnkgQ29u
dHJvbGxlciBpcyBhIGJ1cyB3aGVyZSB5b3UgY2FuIGNvbm5lY3QgdHdvIGtpbmRzCj4gPj4+ICsg
IG9mIG1lbW9yeSBpbnRlcmZhY2VzLCB3aGljaCBhcmUgTkFORCBhbmQgbWVtb3J5IG1hcHBlZCBp
bnRlcmZhY2VzIChzdWNoIGFzCj4gPj4+ICsgIFNSQU0gb3IgTk9SKS4KPiA+Pj4gKwo+ID4+PiAr
IyBXZSBuZWVkIGEgc2VsZWN0IGhlcmUgc28gd2UgZG9uJ3QgbWF0Y2ggYWxsIG5vZGVzIHdpdGgg
J2FybSxwcmltZWNlbGwnCj4gPj4+ICtzZWxlY3Q6Cj4gPj4+ICsgIHByb3BlcnRpZXM6Cj4gPj4+
ICsgICAgY29tcGF0aWJsZToKPiA+Pj4gKyAgICAgIGNvbnRhaW5zOgo+ID4+PiArICAgICAgICBl
bnVtOgo+ID4+PiArICAgICAgICAgIC0gYXJtLHBsMzUzLXNtYy1yMnAxICAgIAo+ID4+Cj4gPj4g
VGhhdCdzIGEgY29uc3QuLi4gYnV0IGFsc28gSSBkb24ndCBnZXQgdGhlIG5lZWQgZm9yIHNlbGVj
dC4gIAo+ID4gCj4gPiBJIHRoaW5rIHRoaXMgaXMgbmVlZGVkIHRvIGVuc3VyZSB0aGlzIGJpbmRp
bmcgaXMgbm90IGVuZm9yY2VkIGFnYWluc3QKPiA+IGFybSxwcmltZWNlbGwgY29tcGF0aWJsZSBu
b2RlcyB3aGljaCBhcmUgbm90IGZlYXR1cmluZyB0aGUKPiA+IGFybSxwbDM1My1zbWMtcjJwMSBj
b21wYXRpYmxlLiAgCj4gCj4gV2hpY2ggc2VlbXMgdG8gYmUgcmVzdWx0IG9mIHVudXN1YWwgY29t
cGF0aWJsZSBtYXRjaCwgc28gb25jZSB5b3UKPiBjb252ZXJ0IHRvIHJlZ3VsYXIgbWF0Y2gsIHRo
aXMgc2VsZWN0IGlzIG5vdCBuZWVkZWQuCgpJIGRvbid0IHRoaW5rIHNvLCBJIHJlY2VpdmVkIGEg
aGludCBmcm9tIFJvYiBzb21lIHRpbWUgYWdvLCBoZSB0b2xkCm1lIHRvIGFkZCB0aGlzIGFkZGl0
aW9uYWwgc2VsZWN0IGxpbmUgYXMgaW4gYWxsIG90aGVyIGFybSxwcmltZWNlbGwKYmluZGluZy4K
ClJvYiwgYW55IGFkZGl0aW9uYWwgaW5mbyByZWdhcmRpbmcgdGhpcz8KCgo+ID4+PiArCj4gPj4+
ICsgICIjYWRkcmVzcy1jZWxscyI6Cj4gPj4+ICsgICAgY29uc3Q6IDIKPiA+Pj4gKwo+ID4+PiAr
ICAiI3NpemUtY2VsbHMiOgo+ID4+PiArICAgIGNvbnN0OiAxCj4gPj4+ICsKPiA+Pj4gKyAgcmVn
Ogo+ID4+PiArICAgIGl0ZW1zOgo+ID4+PiArICAgICAgLSBkZXNjcmlwdGlvbjogY29uZmlndXJh
dGlvbiByZWdpc3RlcnMgZm9yIHRoZSBob3N0IGFuZCBzdWItY29udHJvbGxlcnMgICAgCj4gPj4K
PiA+PiBKdXN0IG1heEl0ZW1zLiBEZXNjcmlwdGlvbiBpcyBvYnZpb3VzLiAgCj4gPiAKPiA+IEkg
ZG9uJ3QgdGhpbmsgaXQgaXMgdGhhdCBvYnZpb3VzIGJlY2F1c2UgdGhlcmUgYXJlIGFjdHVhbGx5
IDQgYXJlYXMKPiA+IGFuZCwgYmVjYXVzZSBvZiB0aGUgeWFtbCBsYW5ndWFnZSwgd2Ugb25seSBk
ZXNjcmliZSBvbmUgaW4gdGhlIHJlZwo+ID4gcHJvcGVydHkgd2hpbGUgdGhlIG90aGVycyBhbmQg
ZGVmaW5lZCBpbiB0aGUgcmFuZ2VzIHByb3BlcnR5LCBidXQKPiA+IHRoYXQncyBmaW5lIGJ5IG1l
LCBJJ2xsIGRyb3AgdGhlIGRlc2NyaXB0aW9uIGFuZCBzdGljayB0byBhCj4gPiBtYXhJdGVtcyBl
bnRyeS4gIAo+IAo+IFRoZSBleHBsYW5hdGlvbiBvZiBhbGwgZm91ciBhcmVhcyBjb3VsZCBoYXZl
IHNlbnNlLCBidXQgbm93IGl0IHN0YXRlcwo+IHRoZSBvYnZpb3VzIC0gdGhlc2UgYXJlIGNvbmZp
Z3VyYXRpb24gcmVnaXN0ZXJzIDopCgpXZWxsLCB0aGF0J3MgdHJ1ZSA6KQoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
