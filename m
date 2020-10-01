Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55E5C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 10:41:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5644120796
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 10:41:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DbXQLISE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PEq+IhaA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5644120796
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0FJVlhD3N96coMa5I2etCrl+z5yUZ6SwLdaDQhJQNnM=; b=DbXQLISE/P9iiEwSmlPv35YoL
	UmHIgCKejTnl0hfRifRlZyI0nq9IA+oIlhiVQuvjb+LcL9cH3gEULKzI8ZnqJj0/xWDP7ZD3TgeCv
	vSp7n3mOdiydNNDIXZcCYwYBmb+og303mBQG/pNjkdnmRirBr3E3NnEo1rIKuXvHOSggF4uXmEYLC
	CdKksh5s/2U8+zaXpLNuGdpyB2d2KsLsXfRLiA46VB76NWkAIJ6jtkur0P+AtVvBimJWGjQCuwM0C
	ZZ+WmOZN8PD1OQDK308W1b3qrAxskA7Yur+GF0/GHavN0i57zNqbhOWZCYXmMLb33n9PGpBG+Z0QD
	mDx/Ph6XQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNw13-0006rs-NE; Thu, 01 Oct 2020 10:40:49 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNw10-0006r8-Gj
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 10:40:47 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 091Aeeel060723;
 Thu, 1 Oct 2020 05:40:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601548840;
 bh=N9YEPqkdsieOwi0bDbR5PhkEgKwy0dRnGH8nrDktbwM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=PEq+IhaA6pfFeLRh1ukujEcA4GiIQsuWzX9Gd1fi8gDRSJIFgAxi14XMNkBZr0Q1C
 CYQMYd8tbhUEDZ9Lq5aK1yEjXQTlIS6QCwOw46flMwlMiRFnfti4L1QJvZnpGjpEkI
 /BO6XyfNN12iOEQMLdiynGFAytRvDM3UaXXPzd64=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 091Aee1j030734
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 1 Oct 2020 05:40:40 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 05:40:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 05:40:40 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 091AebfS107891;
 Thu, 1 Oct 2020 05:40:38 -0500
Subject: Re: [PATCH v3] mtd: spi-nor: keep lock bits if they are non-volatile
To: Michael Walle <michael@walle.cc>
References: <20200327155939.13153-1-michael@walle.cc>
 <523c3645-e37d-5d86-ba91-5c1be9e3881e@ti.com>
 <fb33aa707744ad6c25a4d332e7d73c58@walle.cc>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <58d1ffaa-53a0-d14a-6448-6203197d7b42@ti.com>
Date: Thu, 1 Oct 2020 16:10:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fb33aa707744ad6c25a4d332e7d73c58@walle.cc>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_064046_636167_615E112C 
X-CRM114-Status: GOOD (  29.80  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxMC8xLzIwIDQ6MjEgQU0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4gQW0gMjAyMC0wOS0z
MCAxMjozNSwgc2NocmllYiBWaWduZXNoIFJhZ2hhdmVuZHJhOgo+IFsuLl0KPj4+IFNpZ25lZC1v
ZmYtYnk6IE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+Cj4+PiAtLS0KPj4+IGNoYW5n
ZXMgc2luY2UgdjI6Cj4+PiDCoC0gYWRkIEtjb25maWcgb3B0aW9uIHRvIGJlIGFibGUgdG8gcmV0
YWluIGxlZ2FjeSBiZWhhdmlvdXIKPj4+IMKgLSByZWJhc2VkIHRoZSBwYXRjaCBkdWUgdG8gdGhl
IHNwaS1ub3IgcmV3cml0ZQo+Pj4gwqAtIGRyb3BwZWQgdGhlIEZpeGVzOiB0YWcsIGl0IGRvZW5z
J3QgbWFrZSBzZW5zZSBhZnRlciB0aGUgc3BpLW5vcgo+Pj4gcmV3cml0ZQo+Pj4gwqAtIG1lbnRp
b24gY29tbWl0IDNlMDkzMGYxMDllNzYgd2hpY2ggZnVydGhlciBtb2RpZmllZCB0aGUgdW5sb2Nr
Cj4+PiDCoMKgIGJlaGF2aW91ci4KPj4+Cj4+PiBjaGFuZ2VzIHNpbmNlIHYxOgo+Pj4gwqAtIGNv
bXBsZXRlbHkgcmV3cm90ZSBwYXRjaCwgdGhlIGZpcnN0IHZlcnNpb24gdXNlZCBhIGRldmljZSB0
cmVlIGZsYWcKPj4+Cj4+PiDCoGRyaXZlcnMvbXRkL3NwaS1ub3IvS2NvbmZpZyB8IDM1ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4+PiDCoGRyaXZlcnMvbXRkL3NwaS1ub3IvYXRtZWwu
YyB8IDI0ICsrKysrKysrKysrKystLS0tLS0tCj4+PiDCoGRyaXZlcnMvbXRkL3NwaS1ub3IvY29y
ZS5jwqAgfCA0NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4+PiDCoGRy
aXZlcnMvbXRkL3NwaS1ub3IvY29yZS5owqAgfMKgIDYgKysrKysKPj4+IMKgZHJpdmVycy9tdGQv
c3BpLW5vci9lc210LmPCoCB8wqAgNiArKy0tLQo+Pj4gwqBkcml2ZXJzL210ZC9zcGktbm9yL2lu
dGVsLmMgfMKgIDYgKystLS0KPj4+IMKgZHJpdmVycy9tdGQvc3BpLW5vci9zc3QuY8KgwqAgfCAy
MSArKysrKysrKystLS0tLS0tLS0KPj4+IMKgaW5jbHVkZS9saW51eC9tdGQvc3BpLW5vci5oIHzC
oCA2ICsrKysrCj4+PiDCoDggZmlsZXMgY2hhbmdlZCwgMTE0IGluc2VydGlvbnMoKyksIDM0IGRl
bGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL0tjb25m
aWcgYi9kcml2ZXJzL210ZC9zcGktbm9yL0tjb25maWcKPj4+IGluZGV4IDZlODE2ZWFmYjMxMi4u
NjQ3ZGUxN2M4MWUyIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9LY29uZmln
Cj4+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL0tjb25maWcKPj4+IEBAIC0yNCw2ICsyNCw0
MSBAQCBjb25maWcgTVREX1NQSV9OT1JfVVNFXzRLX1NFQ1RPUlMKPj4+IMKgwqDCoMKgwqDCoCBQ
bGVhc2Ugbm90ZSB0aGF0IHNvbWUgdG9vbHMvZHJpdmVycy9maWxlc3lzdGVtcyBtYXkgbm90IHdv
cmsgd2l0aAo+Pj4gwqDCoMKgwqDCoMKgIDQwOTYgQiBlcmFzZSBzaXplIChlLmcuIFVCSUZTIHJl
cXVpcmVzIDE1IEtpQiBhcyBhIG1pbmltdW0pLgo+Pj4KPj4+ICtjaG9pY2UKPj4+ICvCoMKgwqAg
cHJvbXB0ICJXcml0ZSBwcm90ZWN0aW9uIGF0IGJvb3QiCj4+PiArwqDCoMKgIGRlZmF1bHQgTVRE
X1NQSV9OT1JfV1BfRElTQUJMRQo+Pgo+PiBUaGVzZSBjaG9pY2UgY29udHJvbCBob3cgQlAwLVgg
Yml0cyBhcmUgbWFuaXB1bGF0ZWQgb24gYm9vdC4gSGVuY2UsIHRvCj4+IGJlIGNvbnNpc3RlbnQg
c2hvdWxkIHVzZSBCbG9jayBQcm90ZWN0aW9uIChCUCkgdGVybWlub2xvZ3kgdGhyb3VnaG91dC4K
Pj4KPj4gVGhpcyB3b3VsZCBhbHNvIGJlIGlubGluZSB3aXRoIG1vc3QgZmxhc2ggZGF0YXNoZWV0
cyB3aGljaCBhbHNvIHVzZQo+PiB0ZXJtIEJQCj4gCj4gV2hlcmUgc2hvdWxkIEkgbWVudGlvbiB0
aGUgQlAgYml0cz8gSW4gdGhlIGNob2ljZSBvciBpbiB0aGUgaGVscCB0ZXh0LgoKY2hvaWNlIHBy
b21wdCBhbmQgaW4gaGVscCB0ZXh0LgoKPiBJIHRyaWVkIHRvIGtlZXAgdGhlIGNob2ljZSBwcm9t
cHQgYXMgZWFzeSB0byB1bmRlcnN0YW5kIGFzIHBvc3NpYmxlLCBzbyBhbgo+IHVzZXIgd2hvIGRv
ZXNuJ3Qga25vdyBhbnl0aGluZyBhYm91dCBob3cgdGhlIHdyaXRlIHByb3RlY3Rpb24gYWN0dWFs
bHkKPiB3b3Jrcwo+IGNhbiBzdGlsbCBtYWtlIHRoYXQgY2hvaWNlICh3aXRob3V0IGZpcnN0IHJl
YWRpbmcgYSBkYXRhc2hlZXQpLiBBbHNvCj4ga2VlcCBpbgo+IG1pbmQsIHRoYXQgdGhlcmUgaXMg
YWxzbyB0aGUgcGVyIHNlY3RvciBsb2NraW5nLiBXb3VsZG4ndCB0aGlzIG9wdGlvbiBhbHNvCj4g
YXBwbHkgdG8gdGhhdD8KPiAKCkJ1dCwgdGhlcmUgaXMgbW9yZSB0aGFuIG9uZSB3YXkgb2YgYWNo
aWV2aW5nIHdyaXRlIHByb3RlY3Rpb24gaW4gCmFkZGl0aW9uIHRvIEJQIGJpdHMgc3VjaCBhcyBB
ZHZhbmNlZCBTZWN0b3IgUHJvdGVjdGlvbiB3aGljaCBtYXkgYmUgCmFkZGVkIGluIGZ1dHVyZS4g
U28gd2Ugc2hvdWxkIGJlIGFzIHNwZWNpZmljIGFzIHBvc3NpYmxlIHdoaWxlIG1ha2luZyBpdCAK
ZWFzeSBmb3IgdXNlci4KCkhvdyBhYm91dCAKCgkJcHJvbXB0ICJXcml0ZSBQcm90ZWN0aW9uIChM
ZWdhY3kgQmxvY2sgUHJvdGVjdGlvbiBiYXNlZCkgYXQgYm9vdCIKCgoKCj4gVGhlcmVmb3JlLCBJ
J2QgbWVudGlvbiBpbiB0aGUgaGVscCB0ZXh0LCB0aGF0IChjdXJyZW50bHkpIHRoZSBCUCBiaXRz
IGFyZQo+IGFmZmVjdGVkLgo+IAo+Pj4gKwo+Pj4gK2NvbmZpZyBNVERfU1BJX05PUl9XUF9ESVNB
QkxFCj4+PiArwqDCoMKgIGJvb2wgIkRpc2FibGUgV1Agb24gYW55IGZsYXNoZXMgKGxlZ2FjeSBi
ZWhhdmlvdXIpIgo+Pj4gK8KgwqDCoCBoZWxwCj4+PiArwqDCoMKgwqDCoCBUaGlzIG9wdGlvbiBk
aXNhYmxlcyB0aGUgd3JpdGUgcHJvdGVjdGlvbiBvbiBhbnkgU1BJIGZsYXNoZXMgYXQKPj4+ICvC
oMKgwqDCoMKgIGJvb3QtdXAuCj4+PiArCj4+PiArwqDCoMKgwqDCoCBEb24ndCB1c2UgdGhpcyBp
ZiB5b3UgaW50ZW50IHRvIHVzZSB0aGUgd3JpdGUgcHJvdGVjdGlvbiBvZiB5b3VyCj4+PiArwqDC
oMKgwqDCoCBTUEkgZmxhc2guIFRoaXMgaXMgb25seSB0byBrZWVwIGJhY2t3YXJkcyBjb21wYXRp
YmlsaXR5Lgo+Pj4gKwo+Pj4gK2NvbmZpZyBNVERfU1BJX05PUl9XUF9ESVNBQkxFX09OX1ZPTEFU
SUxFCj4+PiArwqDCoMKgIGJvb2wgIkRpc2FibGUgV1Agb24gZmxhc2hlcyB3LyB2b2xhdGlsZSBw
cm90ZWN0aW9uIGJpdHMiCj4+PiArwqDCoMKgIGhlbHAKPj4+ICvCoMKgwqDCoMKgIFNvbWUgU1BJ
IGZsYXNoZXMgaGF2ZSB2b2xhdGlsZSBibG9jayBwcm90ZWN0aW9uIGJpdHMsIGllLiBhZnRlciBh
Cj4+PiArwqDCoMKgwqDCoCBwb3dlci11cCBvciBhIHJlc2V0IHRoZSBmbGFzaCBpcyB3cml0ZSBw
cm90ZWN0ZWQgYnkgZGVmYXVsdC4KPj4+ICsKPj4+ICvCoMKgwqDCoMKgIFRoaXMgb3B0aW9uIGRp
c2FibGVzIHRoZSB3cml0ZSBwcm90ZWN0aW9uIGZvciB0aGVzZSBraW5kIG9mCj4+PiBmbGFzaGVz
Cj4+PiArwqDCoMKgwqDCoCB3aGlsZSBrZWVwaW5nIGl0IGVuYWJsZWQgZm9yIGFueSBvdGhlciBT
UEkgZmxhc2hlcyB3aGljaCBoYXZlCj4+PiArwqDCoMKgwqDCoCBub24tdm9sYXRpbGUgYmxvY2sg
cHJvdGVjdGlvbiBiaXRzLgo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqAgSWYgeW91IGFyZSB1bnN1cmUs
IHNlbGVjdCB0aGlzIG9wdGlvbi4KPj4+ICsKPj4+ICtjb25maWcgTVREX1NQSV9OT1JfV1BfS0VF
UAo+Pj4gK8KgwqDCoCBib29sICJLZWVwIHdyaXRlIHByb3RlY3Rpb24gYXMgaXMiCj4+PiArwqDC
oMKgIGhlbHAKPj4+ICvCoMKgwqDCoMKgIElmIHlvdSBzZWxlY3QgdGhpcyBvcHRpb24gdGhlIHdy
aXRlIHByb3RlY3Rpb24gb2YgYW55IFNQSSBmbGFzaGVzCj4+PiArwqDCoMKgwqDCoCB3aWxsIG5v
dCBiZSBjaGFuZ2VkLiBJZiB5b3VyIGZsYXNoIGlzIHdyaXRlIHByb3RlY3RlZCBvciB3aWxsIGJl
Cj4+PiArwqDCoMKgwqDCoCBhdXRvbWF0aWNhbGx5IHdyaXRlIHByb3RlY3RlZCBhZnRlciBwb3dl
ci11cCB5b3UgaGF2ZSB0byBtYW51YWxseQo+Pj4gK8KgwqDCoMKgwqAgdW5sb2NrIGl0IGJlZm9y
ZSB5b3UgYXJlIGFibGUgdG8gd3JpdGUgdG8gaXQuCj4+PiArCj4+PiArZW5kY2hvaWNlCj4+PiAr
Cj4+PiDCoHNvdXJjZSAiZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9LY29uZmlnIgo+
Pj4KPj4+IMKgZW5kaWYgIyBNVERfU1BJX05PUgo+Pgo+PiBbLi4uXQo+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5oIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3Jl
LmgKPj4+IGluZGV4IDZmMmY2YjI3MTczZi4uOWEzM2MwMjM3MTdmIDEwMDY0NAo+Pj4gLS0tIGEv
ZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmgKPj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
Y29yZS5oCj4+PiBAQCAtMjYsNiArMjYsNyBAQCBlbnVtIHNwaV9ub3Jfb3B0aW9uX2ZsYWdzIHsK
Pj4+IMKgwqDCoMKgIFNOT1JfRl9IQVNfU1JfVEJfQklUNsKgwqDCoCA9IEJJVCgxMSksCj4+PiDC
oMKgwqDCoCBTTk9SX0ZfSEFTXzRCSVRfQlDCoMKgwqDCoMKgID0gQklUKDEyKSwKPj4+IMKgwqDC
oMKgIFNOT1JfRl9IQVNfU1JfQlAzX0JJVDbCoCA9IEJJVCgxMyksCj4+PiArwqDCoMKgIFNOT1Jf
Rl9ORUVEX1VOUFJPVEVDVMKgwqDCoCA9IEJJVCgxNCksCj4+PiDCoH07Cj4+Pgo+Pj4gwqBzdHJ1
Y3Qgc3BpX25vcl9yZWFkX2NvbW1hbmQgewo+Pj4gQEAgLTMxMSw2ICszMTIsMTEgQEAgc3RydWN0
IGZsYXNoX2luZm8gewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICogQlAzIGlzIGJpdCA2IG9mIHN0YXR1cyByZWdpc3Rlci4KPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIE11c3QgYmUgdXNlZCB3aXRoIFNQSV9OT1Jf
NEJJVF9CUC4KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
Lwo+Pj4gKyNkZWZpbmUgU1BJX05PUl9VTlBST1RFQ1TCoMKgwqAgQklUKDE5KcKgwqDCoCAvKgo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBGbGFzaCBpcyB3
cml0ZS1wcm90ZWN0ZWQgYWZ0ZXIKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICogcG93ZXItdXAgYW5kIG5lZWRzIGEgZ2xvYmFsCj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHVucHJvdGVjdC4KPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4+Pgo+Pgo+PiBJdCB3b3VsZCBiZSBi
ZXR0ZXIgdG8gbmFtZSB0aGUgZmxhZyB0byBpbmRpY2F0ZSBCUCBiaXRzIGFyZSB2b2xhdGlsZSBv
cgo+PiBwb3dlcnMgdXAgbG9ja2VkIGluc3RlYWQgb2YgU1BJX05PUl9VTlBST1RFQ1QuIFRoaXMg
bWFrZXMgaXQgZWFzaWVyIHRvCj4+IHVuZGVyc3RhbmQgd2hhdCB0aGlzIGZsYWcgbWVhbnMgd3J0
IGZsYXNoIEhXIGZlYXR1cmUuIE1heWJlOgo+Pgo+PiBTUElfTk9SX0xPQ0tFRF9PTl9QT1dFUl9V
UCBvciBTUElfTk9SX0JQX0lTX1ZPTEFUSUxFCj4gCj4gU1BJX05PUl9CUF9JU19WT0xBVElMRSBz
b3VuZHMgZ29vZCB0byBtZS4KPiAKPiAtbWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
