Return-Path: <SRS0=x3fM=EE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE9DC2D0A3
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 08:37:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B06FA20757
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 08:37:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TvsSgmwW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B06FA20757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9SK5bIP5X9ywtDg7POrp4tDCrEat2LqOSbALV7eQ910=; b=TvsSgmwWwQXGW/UUuLx4cPeBi
	ryxGuOcIoq675gc8M6oeRtQ2s9MDhyQ7uorUAtvspQLx+E3hrjxD73RgBKIb8rv8ETW04piwdGDJS
	45RCXGnN0ZVEKXJWUsqHUwBf6DWj7h4ck1L93TVTJUZWI9o2swNcSLlk1JwMkjhhf0U9LuOrTCX85
	Mm7cGRXtUv6UvCTPBx6IPJZuGtH/UlKHyZsMdgNiAseMxcRwfjqcpPPa+6ACqCmZCUMD4UFrdi0km
	4ovrA5sZMa04Yd9u0yzgMKGQ7L7n+lLq96oGbeOFdcIs4RV8ppU5AYyMAiAtA+CCiTPWqTZD7Mc6J
	YHAXdePXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY3Qw-0000uR-0A; Thu, 29 Oct 2020 08:37:22 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY3Qt-0000sp-08
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2020 08:37:20 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E16B8E0014;
 Thu, 29 Oct 2020 08:37:12 +0000 (UTC)
Date: Thu, 29 Oct 2020 09:37:11 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: mdalam@codeaurora.org
Subject: Re: [PATCH 0/5] mtd: rawnand: qcom: Add support for QSPI nand
Message-ID: <20201029093711.0c7c5903@xps13>
In-Reply-To: <20201029085344.5b2a4b51@xps13>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
 <20201028104835.3dc31745@xps13>
 <10db598eed716d7759bc0125b6977cf1@codeaurora.org>
 <20201029085344.5b2a4b51@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_043719_258988_41AB6137 
X-CRM114-Status: GOOD (  26.07  )
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

Ck1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlIG9uIFRodSwg
MjkgT2N0IDIwMjAKMDg6NTM6NDQgKzAxMDA6Cgo+IEhlbGxvLAo+IAo+IG1kYWxhbUBjb2RlYXVy
b3JhLm9yZyB3cm90ZSBvbiBXZWQsIDI4IE9jdCAyMDIwIDIzOjU0OjIzICswNTMwOgo+IAo+ID4g
T24gMjAyMC0xMC0yOCAxNToxOCwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+ID4gPiBIZWxsbywK
PiA+ID4gCj4gPiA+IE1kIFNhZHJlIEFsYW0gPG1kYWxhbUBjb2RlYXVyb3JhLm9yZz4gd3JvdGUg
b24gU2F0LCAxMCBPY3QgMjAyMAo+ID4gPiAxMTowMTozNyArMDUzMDoKPiA+ID4gICAgIAo+ID4g
Pj4gUVBJQyAyLjAgc3VwcG9ydHMgU2VyaWFsIE5BTkQgc3VwcG9ydCBpbiBhZGRpdGlvbiB0byBh
bGwgZmVhdHVyZXMgYW5kCj4gPiA+PiBjb21tYW5kcyBpbiBRUElDIDEuMCBmb3IgcGFyYWxsZWwg
TkFORC4gUGFyYWxsZWwgYW5kIFNlcmlhbCBOQU5EID4+IGNhbm5vdAo+ID4gPj4gb3BlcmF0ZSBz
aW11bHRhbmVvdXNseS4gUVNQSSBuYW5kIGRldmljZXMgd2lsbCBjb25uZWN0IHRvIFFQSUMgPj4g
SU9fTUFDUk8KPiA+ID4+IGJsb2NrIG9mIFFQSUMgY29udHJvbGxlci4gVGhlcmUgaXMgYSBzZXBh
cmF0ZSBJT19NQUNSTyBjbG9jayBmb3IgPj4gSU9fTUFDUk8KPiA+ID4+IGJsb2NrLiBEZWZhdWx0
IElPX01BQ1JPIGJsb2NrIGRpdmlkZSB0aGUgaW5wdXQgY2xvY2sgYnkgNC4gc28gaWYgPj4gSU9f
TUFDUk8KPiA+ID4+IGlucHV0IGNsb2NrIGlzIDMyME1IeiB0aGVuIG9uIGJ1cyBpdCB3aWxsIGJl
IDgwTUh6LCBzbyBRU1BJIG5hbmQgPj4gZGV2aWNlCj4gPiA+PiBzaG91bGQgYWxzbyBzdXBwb3J0
IHRoaXMgZnJlcXVlbmN5LiAgICAKPiA+ID4+ID4+IFFQSUMgcHJvdmlkZXMgNCBkYXRhIHBpbnMg
dG8gUVNQSSBuYW5kLiBJbiBzdGFuZGFyZCBTUEkgbW9kZSAoeDEgbW9kZSkgPj4gZGF0YSAgICAK
PiA+ID4+IHRyYW5zZmVyIHdpbGwgb2NjdXIgb24gb25seSAyIHBpbnMgb25lIHBpbiBmb3IgU2Vy
aWFsIGRhdGEgaW4gYW5kIG9uZSA+PiBmb3IKPiA+ID4+IHNlcmlhbCBkYXRhIG91dC4gSW4gUVVB
RCBTUEkgbW9kZSAoeDQgbW9kZSkgZGF0YSB0cmFuc2ZlciB3aWxsIG9jY3VyID4+IGF0IGFsbAo+
ID4gPj4gdGhlIGZvdXIgZGF0YSBsaW5lcy4gUVBJQyBjb250cm9sbGVyIHN1cHBvcnRzIGNvbW1h
bmQgZm9yIHgxIG1vZGUgYW5kID4+IHg0IG1vZGUuICAgIAo+ID4gPj4gPj4gTWQgU2FkcmUgQWxh
bSAoNSk6ICAgIAo+ID4gPj4gICBkdC1iaW5kaW5nczogcWNvbV9uYW5kYzogSVBRNTAxOCBRUElD
IE5BTkQgZG9jdW1lbnRhdGlvbgo+ID4gPj4gICBtdGQ6IHJhd25hbmQ6IHFjb206IEFkZCBpbml0
aWFsIHN1cHBvcnQgZm9yIHFzcGkgbmFuZAo+ID4gPj4gICBtdGQ6IHJhd25hbmQ6IHFjb206IFJl
YWQgUVBJQyB2ZXJzaW9uCj4gPiA+PiAgIG10ZDogcmF3bmFuZDogcWNvbTogRW5hYmxlIHN1cHBv
cnQgZm9yIGVyYXNlLHJlYWQgJiB3cml0ZSBmb3Igc2VyaWFsCj4gPiA+PiAgICAgbmFuZC4KPiA+
ID4+ICAgbXRkOiByYXduYW5kOiBxY29tOiBBZGQgc3VwcG9ydCBmb3Igc2VyaWFsIHRyYWluaW5n
LiAgICAKPiA+ID4+ID4+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcWNvbV9uYW5kYy50
eHQgICAgICAgICB8ICAgMyArICAgIAo+ID4gPj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRf
aWRzLmMgICAgICAgICAgICAgICAgICAgIHwgIDEzICsKPiA+ID4+ICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9xY29tX25hbmRjLmMgICAgICAgICAgICAgICAgICB8IDUwMiA+PiArKysrKysrKysrKysr
KysrKysrKy0KPiA+ID4+ICAzIGZpbGVzIGNoYW5nZWQsIDQ5NCBpbnNlcnRpb25zKCspLCAyNCBk
ZWxldGlvbnMoLSkgICAgCj4gPiA+PiA+ID4gSSdtIHNvcnJ5IGJ1dCB0aGlzIHNlcmllcyBjbGVh
cmx5IGJyZWFrcyB0aGUgY3VycmVudCBsYXllcmluZy4gSSBjYW5ub3QgICAgCj4gPiA+IGF1dGhv
cml6ZSBTUEktTkFORCBjb2RlIHRvIGZhbGwgaW50byB0aGUgcmF3IE5BTkQgc3Vic3lzdGVtLgo+
ID4gPiAgICAgCj4gPiAKPiA+IEkgYW0gYWdyZWUgd2l0aCB5b3UsIHdlIHNob3VsZCBub3QgYWRk
IFNQSS1OQU5EIGNoYW5nZXMgaW5zaWRlCj4gPiByYXcgTkFORCBzdWJzeXN0ZW0uCj4gPiAgIAo+
ID4gPiBBcyBib3RoIHR5cG9sb2dpZXMgY2Fubm90IGJlIHVzZWQgYXQgdGhlIHNhbWUgdGltZSwg
SSBndWVzcyB5b3Ugc2hvdWxkCj4gPiA+IGhhdmUgYW5vdGhlciBkcml2ZXIgaGFuZGxpbmcgdGhp
cyBmZWF0dXJlIHVuZGVyIHRoZSBzcGkvIHN1YnN5c3RlbSArCj4gPiA+IGEgZmV3IGRlY2xhcmF0
aW9ucyBpbiB0aGUgU1BJLU5BTkQgZGV2aWNlcyBsaXN0Lgo+ID4gPiAgICAgCj4gPiAKPiA+IElu
aXRpYWxseSBJIHdhcyBzdGFydGVkIHdyaXRpbmcgc2VwYXJhdGUgZHJpdmVyIHVuZGVyIFNQSS1O
QU5EIHN1YnN5c3RlbSB0aGVuIEkKPiA+IHJlYWxpemVkIHRoYXQgbW9yZSB0aGFuIDg1JSBvZiBy
YXcvcWNvbV9uYW5kLmMgY29kZSBnZXR0aW5nIGR1cGxpY2F0ZWQuCj4gPiAKPiA+IFRoYXQncyB3
aHkgSSBoYXZlIGFkZGVkIHRoaXMgU1BJLU5BTkQgY2hhbmdlIGluIHJhdy9xY29tX25hbmQuYyBz
aW5jZQo+ID4gbW9yZSB0aGFuIDg1JSBvZiBjb2RlIHdpbGwgYmUgcmV1c2VkLgo+ID4gCj4gPiBJ
ZiBJIHdpbGwgYWRkIHRoaXMgY2hhbmdlIGluc2lkZSBTUEktTkFORCBzdWJzeXN0ZW0gdGhlbiBt
dWNoIG9mCj4gPiByYXcvcWNvbV9uYW5kLmMgY29kZSB3aWxsIGdldCBkdXBsaWNhdGVkLiBXb3Vs
ZCBpdCBiZSBvayA/ICAKPiAKPiBXaGF0IGFib3V0IG1vdmluZyB0aGUgZ2VuZXJpYyBjb2RlIHRv
IGRyaXZlcnMvbXRkL25hbmQvY29tbW9uLyBhbmQKPiByZWZlcnJpbmcgdG8gaXQgZnJvbSBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmQuYyBhbmQKPiBkcml2ZXJzL3NwaS9zcGktcWNvbS5j
IChvciBzdWNoKT8KCkFjdHVhbGx5LCBwZXJoYXBzIGRyaXZlcnMvbWVtb3J5LyBpcyB0aGUgcmln
aHQgbG9jYXRpb24gZm9yIHRoZSBnZW5lcmljCmJpdHMuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
