Return-Path: <SRS0=QbZc=CZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8035C433E2
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2020 06:11:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 773652087D
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2020 06:11:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dQlm5OTY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MvgijY6j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 773652087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UavznEerg8wcVtEQjFHk9gKg0SvBL+RQTZqH9uik7U=; b=dQlm5OTYEwj1eyJlP0HWsiHj7O
	4Lkxhn3N7Cwh1oWmsc+pMFOVRxjWtzGbLxCZCCEtSvYSl66Xv9pIhK/dY029JRcSR2ZrvfkHj//R3
	KdQe0NL37l93t2f3BYHPUDdfxnUM1TKPPufUhkdwicuGZJqc4SpZ9rpguDQw1Nt5IK96Wa3eDKCrk
	JCMuAkxQGtYHWXBzeraMhVkzzzxBn4H/wJ2hU/p4Z+Zn5bZW9x3msDom7tKSeOQxtK5y1+qwsZ/05
	YUo49nJLphrTC6QHxHlDY2gZ1x36IX4RV5uLMR7VRxUZ8M3Coz0ZcNxrzE2mMlNavNgQD6l2mKKTR
	KFqscCwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIQem-00043Z-VI; Wed, 16 Sep 2020 06:11:05 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIQef-00041X-Cy
 for linux-mtd@lists.infradead.org; Wed, 16 Sep 2020 06:10:58 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08G6AmnC053816;
 Wed, 16 Sep 2020 01:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600236648;
 bh=BHvk5tZjaOhlvRm0sdrz/fPYoFED0L5KUXp4i9oQC1c=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=MvgijY6j2kl56wUdCjobLjy1K8Xugj54HrEuXk4I7KTSyKAvbHUW8eiVY2KPgHoS8
 NzX9w/GPbA9cSydMEcYHEtxTo1rf5oic6soHJCUjtao/q4k2DI65kZFYr8ZcnRmJ7L
 z/EK1RVK8RvTYqMtmrB1eCOtP300NPc1TeD2Px10=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08G6AmGr089834;
 Wed, 16 Sep 2020 01:10:48 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 16
 Sep 2020 01:10:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 16 Sep 2020 01:10:47 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08G6AjjI078151;
 Wed, 16 Sep 2020 01:10:46 -0500
Subject: Re: [PATCH v2] mtd: hyperbus: add Renesas RPC-IF driver
To: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <3e4cf141-52a3-ef88-5e25-eb5c75b16186@cogentembedded.com>
 <c3cbbc7e-ded0-86dc-8582-af80ff641cfa@ti.com>
 <663f56cb-d38c-1e38-8459-4306a6da88db@de.bosch.com>
 <45a1542d-d053-a571-fe0d-79bd6c2499d7@ti.com>
 <05f38c1c-e466-9cb2-e603-e215e7b2d563@de.bosch.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <73ae0290-a129-bc52-a305-66d50b3029fc@ti.com>
Date: Wed, 16 Sep 2020 11:40:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <05f38c1c-e466-9cb2-e603-e215e7b2d563@de.bosch.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_021057_593506_1BAAC185 
X-CRM114-Status: GOOD (  24.33  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiA5LzE1LzIwIDM6MDcgUE0sIEJlaG1lIERpcmsgKENNL0VTTzIpIHdyb3RlOgo+IAo+IAo+
IE9uIDE1LjA5LjIwMjAgMDc6MjcsIFZpZ25lc2ggUmFnaGF2ZW5kcmEgd3JvdGU6Cj4+Cj4+Cj4+
IE9uIDkvMTUvMjAgOTozNyBBTSwgQmVobWUgRGlyayAoQ00vRVNPMikgd3JvdGU6Cj4+Pgo+Pj4K
Pj4+IE9uIDE0LjA5LjIwMjAgMTU6MDksIFZpZ25lc2ggUmFnaGF2ZW5kcmEgd3JvdGU6Cj4+Pj4g
SGkgU2VyZ2VpLAo+Pj4+Cj4+Pj4gT24gNS8xNC8yMCAyOjEzIEFNLCBTZXJnZWkgU2h0eWx5b3Yg
d3JvdGU6Cj4+Pj4+IEFkZCB0aGUgSHlwZXJGTGFzaCBkcml2ZXIgZm9yIHRoZSBSZW5lc2FzIFJQ
Qy1JRi7CoCBJdCdzIHRoZSAiZnJvbnQKPj4+Pj4gZW5kIgo+Pj4+PiBkcml2ZXIgdXNpbmcgdGhl
ICJiYWNrIGVuZCIgQVBJcyBpbiB0aGUgbWFpbiBkcml2ZXIgdG8gdGFsayB0byB0aGUKPj4+Pj4g
cmVhbAo+Pj4+PiBoYXJkd2FyZS4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogU2VyZ2VpIFNo
dHlseW92IDxzZXJnZWkuc2h0eWx5b3ZAY29nZW50ZW1iZWRkZWQuY29tPgo+PiBbLi4uXQo+Pj4+
Pgo+Pj4+Pgo+Pj4+IFsuLi5dCj4+Pj4+IC0tLSAvZGV2L251bGwKPj4+Pj4gKysrIGxpbnV4L2Ry
aXZlcnMvbXRkL2h5cGVyYnVzL3JwYy1pZi5jCj4+Pj4+IEBAIC0wLDAgKzEsMTY1IEBACj4+Pj4+
ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+Pj4+PiArLyoKPj4+Pj4gKyAq
IExpbnV4IGRyaXZlciBmb3IgUlBDLUlGIEh5cGVyRmxhc2gKPj4+Pj4gKyAqCj4+Pj4+ICsgKiBD
b3B5cmlnaHQgKEMpIDIwMTktMjAyMCBDb2dlbnQgRW1iZWRkZWQsIEluYy4KPj4+Pj4gKyAqLwo+
Pj4+PiArCj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvZXJyLmg+Cj4+Pj4+ICsjaW5jbHVkZSA8bGlu
dXgva2VybmVsLmg+Cj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+Pj4+ICsjaW5j
bHVkZSA8bGludXgvbXRkL2h5cGVyYnVzLmg+Cj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvbXRkL210
ZC5oPgo+Pj4+PiArI2luY2x1ZGUgPGxpbnV4L211eC9jb25zdW1lci5oPgo+Pj4+PiArI2luY2x1
ZGUgPGxpbnV4L29mLmg+Cj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+
Cj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPj4+Pj4gKwo+Pj4+PiArI2luY2x1ZGUg
PG1lbW9yeS9yZW5lc2FzLXJwYy1pZi5oPgo+Pj4+PiArCj4+Pj4+ICsvKiBGSVhNRTogSG93IHRv
IGRyb3AgdGhpcz8gKi8KPj4+Pj4gKyNpZm5kZWYgQ09ORklHX01URF9DRklfQkVfQllURV9TV0FQ
Cj4+Pj4+ICsjZXJyb3IgRW5hYmxlIGNvbmZpZyAiRmxhc2ggY21kL3F1ZXJ5IGRhdGEgc3dhcHBp
bmcKPj4+Pj4gKEJJR19FTkRJQU5fQllURSkiCj4+Pj4+ICsjZW5kaWYKPj4+Pgo+Pj4+IHNlbGVj
dCBNVERfQ0ZJX0JFX0JZVEVfU1dBUCBpbiBLY29uZmlnIGRvZXMgbm90IGhlbHA/Cj4+Pgo+Pj4K
Pj4+IElmIEkgcmVtZW1iZXIgY29ycmVjdGx5ICdzZWxlY3QgTVREX0NGSV9CRV9CWVRFX1NXQVAn
IGluIEtjb25maWcgZG9lc24ndAo+Pj4gc2VlbSB0byB3b3JrLiBUaGVyZWZvcmUgdGhlIEZJWE1F
LiBJIGNhbid0IHJlbWVtYmVyIGV4YWN0bHkgdGhlIHJvb3QKPj4+IGNhdXNlIGZvciB0aGF0IGFu
eSBtb3JlLCBidXQgbWF5YmUgaXQgd2FzIHRoZSAnYm9vbCcgdHlwZSBvZgo+Pj4gTVREX0NGSV9C
RV9CWVRFX1NXQVA/Cj4+Pgo+Pgo+PiBBaCwgc29ycnkgTVREX0NGSV9CRV9CWVRFX1NXQVAgaXMg
YSBjaG9pY2UgYW5kIHNlbGVjdCBkb2VzIG5vdCB3b3JrIG9uCj4+IGNob2ljZSBtZW51cy4gaG93
IGFib3V0Ogo+Pgo+Pj4gSWYgYW55Ym9keSBoYXMgYSBuaWNlIHNvbHV0aW9uIGZvciB0aGF0LCBp
dCB3b3VsZCBiZSB3ZWxjb21lIDopCj4+Cj4+IERvZXMgdGhpcyB3b3JrOgo+Pgo+PiDCoCBjb25m
aWcgUlBDSUZfSFlQRVJCVVMKPj4gwqDCoMKgwqDCoMKgwqDCoCB0cmlzdGF0ZSAiUmVuZXNhcyBS
UEMtSUYgSHlwZXJCdXMgZHJpdmVyIgo+PiDCoMKgwqDCoMKgwqDCoMKgIGRlcGVuZHMgb24gUkVO
RVNBU19SUENJRgo+PiAtwqDCoMKgwqDCoMKgIHNlbGVjdCBNVERfQ0ZJX0FEVl9PUFRJT05TCj4+
ICvCoMKgwqDCoMKgwqAgZGVwZW5kcyBvbiBNVERfQ0ZJX0JFX0JZVEVfU1dBUCB8fCBDT01QSUxF
X1RFU1QKPj4gwqDCoMKgwqDCoMKgwqDCoCBoZWxwCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRo
aXMgb3B0aW9uIGluY2x1ZGVzIFJlbmVzYXMgUlBDLUlGIEh5cGVyRmxhc2ggc3VwcG9ydC4KPiAK
PiAKPiBXZWxsLCBpdCBhdCBsZWFzdCBtYWtlcyB0aGUgd2hvbGUgUlBDSUZfSFlQRVJCVVMgb3B0
aW9uIHRvIHZhbmlzaCBpbgo+IGNhc2UgdGhlIChxdWl0ZSB1bmNvbW1vbj8pIE1URF9DRklfQkVf
QllURV9TV0FQIGlzIG5vdCBzZXQsIG5vPyBPcgo+IHJlcGhyYXNlZDogSG93IHRvIG1ha2UgdGhl
IHBvdGVudGlhbCB1c2VyIGF3YXJlIHRoYXQKPiBNVERfQ0ZJX0JFX0JZVEVfU1dBUCBuZWVkcyB0
byBiZSBlbmFibGVkIHRvIG1ha2UgdGhpcyBvcHRpb24gYXQgbGVhc3QKPiB2aXNpYmxlPyAKClVz
ZXIgY2FuIHNlYXJjaCBmb3IgUlBDSUZfSFlQRVJCVVMgc3ltYm9sIChzYXkgaW4gbWVudWNvbmZp
ZykgYW5kCmRlcGVuZGVuY2llcyB3aWxsIHNob3cgdXAuCgoKPiBGcm9tIHRoYXQgcG9pbnQgb2Yg
dmlldyBJIGZlZWwgdGhlICNlcnJvciBhcyBnaXZlbiBhYm92ZSBtb3JlCj4gdXNlciBmcmllbmRs
eTogUlBDSUZfSFlQRVJCVVMgaXMgdGhlcmUgYW4gY2FuIGJlIGVuYWJsZWQsIGJ1dCBjb21waWxp
bmcKPiBpcyBmYWlsaW5nIHdpdGggYSByZWFzb25hYmxlIG1lc3NhZ2UgaWYgdGhlIGRlcGVuZGVu
Y2llcyBhcmUgbm90IG1ldC4KPiAKCk5vLCB0aGlzIGlzIHVuY29tbW9uLi4gSWYgYSBkcml2ZXIg
bmVlZHMgYSBzeW1ib2wgdG8gYmUgZW5hYmxlZCBmb3IgaXQKdG8gd29yaywgdGhlbiBLY29uZmln
IGVudHJ5IHNob3VsZCBpbmRpY2F0ZSBzbyB3aXRoICJkZXBlbmRzIG9uIiB2cwp1c2luZyAiI2Vy
cm9yIiBjbGF1c2UuCgpVc2luZyAic2VsZWN0IiB0byBmb3JjZSBlbmFibGUgYWxsIGRlcGVuZGVu
Y2llcyBpcyBub3QgcmVjb21tZW5kZWQKZWl0aGVyIGFzIGl0IGRvZXMgbm90IHRha2UgY2FyZSBv
ZiBkZXBlbmRlbmNpZXMgb2YgdGhlIHN5bWJvbCBiZWluZwpzZWxlY3RlZC4gInNlbGVjdCIgaXMg
Z2VuZXJhbGx5IGlzIHVzZWQgZm9yIHN5bWJvbHMgdGhhdCBhcmUgbm90IHVzZXIKc2VsZWN0YWJs
ZSAoaW4gbWVudWNvbmZpZykuCgpEcml2ZXJzIGFsb25nIHdpdGggcmVxdWlyZWQgZGVwZW5kZW5j
aWVzIGZvciBhIHBsYXRmb3JtIGNhbiBiZSBhZGRlZCB0bwphcHByb3ByaWF0ZSBkZWZjb25maWcg
KFNlZSBhcmNoLyovY29uZmlncy8pIHRvIG1ha2UgZW5kIHVzZXJzIGpvYiBlYXN5CgoKUmVnYXJk
cwpWaWduZXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
