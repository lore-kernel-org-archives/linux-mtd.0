Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C90C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 14:38:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D05F20B1F
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 14:38:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dYVkqBXA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="HB1pojty"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D05F20B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hafUEXeXIBbfCjGzlA4eVXElcry2+Grp0mQTO8DOlYY=; b=dYVkqBXAKgUPqSWZrIpTudfUy
	kOEAXlbU8EXVPKN2lf+9wPTAsZFl2Mg1nJgqsH+asLj+Q1HIHPssXdRCOCh1Z/bJZtA7m9GuZDzww
	76BmXHDY0WYnwgvlyZ6huK+ZHrjGA/L6rV/NqVBQM7anrOLXBcanTgLp8W9FE0jXsjKCAVKmV9tMG
	g56dksCkFMryj5/eaBF+1IASzYEpEPbOP+/Gu5SatipR6r6WXzgpgm2sXXDipv9yJcUuMWmfv3Xgg
	A4g0Syt4uEUXMHgyUguaEE1YgTWxxWT9svgj2Y7/Z/EkK46Q2fKDK1WZVCY5R/pbOtb1d6hu9AVvT
	dZdVANRzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNziR-0000Zm-Ek; Thu, 01 Oct 2020 14:37:51 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNziL-0000YO-Hw; Thu, 01 Oct 2020 14:37:46 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id CA37D22F99;
 Thu,  1 Oct 2020 16:37:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1601563064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sHnoC007BhcQryU1h/VWQg6Nfp1hU7r14kF5KUeDT6U=;
 b=HB1pojtydHPtv5XR0DjynLgNLsylo8bVN0HuJHIC9t+XPG6HOtSq79G815KFYQ4izsCl7a
 haPh77jV4xmGv/vlE7uQ0OtDyUKMuSb0HSNqtRBpEhgLYZ6XlpLGnFSpLFoT4OnqvJFpU0
 xhnRGkmNV+3m838p3TpWOFhsyHxb3nE=
MIME-Version: 1.0
Date: Thu, 01 Oct 2020 16:37:43 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [RFC PATCH 1/2] mtd: spi-nor: atmel: remove global SNOR_F_HAS_LOCK
In-Reply-To: <137692b0-ab6d-b9be-17c2-68e3b3146076@microchip.com>
References: <20201001122828.23186-1-michael@walle.cc>
 <5eb8f95c-e9d5-6043-fb7d-bffcda044262@microchip.com>
 <871da0d058ba89320615098ee26150b3@walle.cc>
 <137692b0-ab6d-b9be-17c2-68e3b3146076@microchip.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <279cea35b94647031b6593a45f8f2608@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_103745_838073_FFF7933B 
X-CRM114-Status: GOOD (  18.89  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMC0xMC0wMSAxNjoyNSwgc2NocmllYiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206
Cj4gT24gMTAvMS8yMCA1OjEyIFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBFWFRFUk5BTCBF
TUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBr
bm93IAo+PiB0aGUgY29udGVudCBpcyBzYWZlCj4+IAo+PiBBbSAyMDIwLTEwLTAxIDE2OjA2LCBz
Y2hyaWViIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbToKPj4+IE9uIDEwLzEvMjAgMzoyOCBQ
TSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNr
IGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSAKPj4+PiBrbm93Cj4+Pj4gdGhl
IGNvbnRlbnQgaXMgc2FmZQo+Pj4+IAo+Pj4+IFRoaXMgaXMgY29uc2lkZXJlZCBiYWQgZm9yIHRo
ZSBmb2xsb3dpbmcgcmVhc29uczoKPj4+PiDCoCgxKSBXZSBvbmx5IHN1cHBvcnQgdGhlIGJsb2Nr
IHByb3RlY3Rpb24gd2l0aCBCUG4gYml0cyBmb3Igd3JpdGUKPj4+PiDCoMKgwqDCoCBwcm90ZWN0
aW9uLiBOb3QgYWxsIEF0bWVsIHBhcnRzIHN1cHBvcnQgdGhpcy4KPj4+PiDCoCgyKSBOZXdseSBh
ZGRlZCBmbGFzaCBjaGlwIHdpbGwgYXV0b21hdGljYWxseSBpbmhlcml0IHRoZSAiaGFzCj4+Pj4g
wqDCoMKgwqAgbG9ja2luZyIgc3VwcG9ydCBhbmQgdGh1cyBuZWVkcyB0byBleHBsaWNpdGx5IHRl
c3RlZC4gQmV0dGVyCj4+Pj4gwqDCoMKgwqAgYmUgb3B0LWluIGluc3RlYWQgb2Ygb3B0LW91dC4K
Pj4+PiDCoCgzKSBUaGVyZSBhcmUgYWxyZWFkeSBzdXBwb3J0ZWQgZmxhc2hlcyB3aGljaCBkb24n
dCBzdXBwb3J0IHRoZQo+Pj4+IGxvY2tpbmcKPj4+PiDCoMKgwqDCoMKgwqDCoMKgIHNjaGVtZS4g
U28gSSBhc3N1bWUgdGhpcyB3YXNuJ3QgcHJvcGVybHkgdGVzdGVkIGJlZm9yZSAKPj4+PiBhZGRp
bmcKPj4+PiB0aGF0Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBjaGlwOyB3aGljaCBlbmZvcmNlcyBt
eSBwcmV2aW91cyBhcmd1bWVudCB0aGF0IGxvY2tpbmcKPj4+PiBzdXBwb3J0IHNob3VsZAo+Pj4+
IMKgwqDCoMKgwqDCoMKgwqAgYmUgYW4gb3B0LWluLgo+Pj4+IAo+Pj4+IFJlbW92ZSB0aGUgZ2xv
YmFsIGZsYWcgYW5kIGFkZCBpbmRpdmlkdWFsIGZsYWdzIHRvIGFsbCBmbGFzaGVzCj4+Pj4gd2hp
Y2ggc3VwcG9ydHMgQlAgbG9ja2luZy4gSW4gcGFydGljdWxhciB0aGUgZm9sbG93aW5nIGZsYXNo
ZXMKPj4+PiBkb24ndCBzdXBwb3J0IHRoZSBCUCBzY2hlbWU6Cj4+Pj4gwqAtIEFUMjZGMDA0Cj4+
Pj4gwqAtIEFUMjVTTDMyMQo+Pj4+IMKgLSBBVDQ1REIwODFECj4+Pj4gCj4+Pj4gU2lnbmVkLW9m
Zi1ieTogTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz4KPj4+PiAtLS0KPj4+PiDCoGRy
aXZlcnMvbXRkL3NwaS1ub3IvYXRtZWwuYyB8IDI4ICsrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0KPj4+PiDCoDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygt
KQo+Pj4+IAo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2F0bWVsLmMgCj4+
Pj4gYi9kcml2ZXJzL210ZC9zcGktbm9yL2F0bWVsLmMKPj4+PiBpbmRleCAzZjVmMjFhNDczYTYu
LjQ5ZDM5MmM2YzhiYyAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2F0bWVs
LmMKPj4+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2F0bWVsLmMKPj4+PiBAQCAtMTAsMzcg
KzEwLDI3IEBACj4+Pj4gCj4+Pj4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gYXRt
ZWxfcGFydHNbXSA9IHsKPj4+PiDCoMKgwqDCoMKgwqDCoCAvKiBBdG1lbCAtLSBzb21lIGFyZSAo
Y29uZnVzaW5nbHkpIG1hcmtldGVkIGFzICJEYXRhRmxhc2giIAo+Pj4+ICovCj4+Pj4gLcKgwqDC
oMKgwqDCoCB7ICJhdDI1ZnMwMTAiLMKgIElORk8oMHgxZjY2MDEsIDAsIDMyICogMTAyNCzCoMKg
IDQsIFNFQ1RfNEspIAo+Pj4+IH0sCj4+Pj4gLcKgwqDCoMKgwqDCoCB7ICJhdDI1ZnMwNDAiLMKg
IElORk8oMHgxZjY2MDQsIDAsIDY0ICogMTAyNCzCoMKgIDgsIFNFQ1RfNEspIAo+Pj4+IH0sCj4+
Pj4gK8KgwqDCoMKgwqDCoCB7ICJhdDI1ZnMwMTAiLMKgIElORk8oMHgxZjY2MDEsIDAsIDMyICog
MTAyNCzCoMKgIDQsIFNFQ1RfNEsgfAo+Pj4+IFNQSV9OT1JfSEFTX0xPQ0spIH0sCj4+Pj4gK8Kg
wqDCoMKgwqDCoCB7ICJhdDI1ZnMwNDAiLMKgIElORk8oMHgxZjY2MDQsIDAsIDY0ICogMTAyNCzC
oMKgIDgsIFNFQ1RfNEsgfAo+Pj4+IFNQSV9OT1JfSEFTX0xPQ0spIH0sCj4+PiAKPj4+IGFmdGVy
IGEgcXVpY2sgbG9vayBpbiB0aGUgZGF0YXNoZWV0cyBvZiB0aGVzZSBmbGFzaGVzLCBJIHN1c3Bl
Y3QgdGhhdAo+Pj4gd2hhdCB3ZSBoYXZlIG5vdyBpbiB0aGUgU1BJIE5PUiBjb3JlIGZvciBTUiBs
b2NraW5nIGRvZXMgbm90IHdvcmsgZm9yCj4+PiB0aGVtLiBUaGV5IHByb2JhYmx5IHN1cHBvcnRl
ZCBqdXN0ICJ1bmxvY2sgYWxsIiwgY2xlYXJpbmcgYWxsIHRoZQo+Pj4gQlAgYml0cy4gQW55d2F5
LCBkaWZmZXJlbnQgcHJvYmxlbS4KPj4+PiAKPj4+PiAtwqDCoMKgwqDCoMKgIHsgImF0MjVkZjA0
MWEiLCBJTkZPKDB4MWY0NDAxLCAwLCA2NCAqIDEwMjQswqDCoCA4LCBTRUNUXzRLKSAKPj4+PiB9
LAo+Pj4+IC3CoMKgwqDCoMKgwqAgeyAiYXQyNWRmMzIxIizCoCBJTkZPKDB4MWY0NzAwLCAwLCA2
NCAqIDEwMjQswqAgNjQsIFNFQ1RfNEspIAo+Pj4+IH0sCj4+Pj4gLcKgwqDCoMKgwqDCoCB7ICJh
dDI1ZGYzMjFhIiwgSU5GTygweDFmNDcwMSwgMCwgNjQgKiAxMDI0LMKgIDY0LCBTRUNUXzRLKSAK
Pj4+PiB9LAo+Pj4+IC3CoMKgwqDCoMKgwqAgeyAiYXQyNWRmNjQxIizCoCBJTkZPKDB4MWY0ODAw
LCAwLCA2NCAqIDEwMjQsIDEyOCwgU0VDVF80SykgCj4+Pj4gfSwKPj4+PiArwqDCoMKgwqDCoMKg
IHsgImF0MjVkZjA0MWEiLCBJTkZPKDB4MWY0NDAxLCAwLCA2NCAqIDEwMjQswqDCoCA4LCBTRUNU
XzRLIHwKPj4+PiBTUElfTk9SX0hBU19MT0NLKSB9LAo+Pj4gCj4+PiB0aGlzIG9uZSBkb2VzIG5v
dCBzdXBwb3J0IEJQIGxvY2tpbmc6Cj4+PiBodHRwczovL3d3dy5hZGVzdG90ZWNoLmNvbS93cC1j
b250ZW50L3VwbG9hZHMvZG9jMzY2OC5wZGYKPj4+IAo+Pj4+ICvCoMKgwqDCoMKgwqAgeyAiYXQy
NWRmMzIxIizCoCBJTkZPKDB4MWY0NzAwLCAwLCA2NCAqIDEwMjQswqAgNjQsIFNFQ1RfNEsgfAo+
Pj4+IFNQSV9OT1JfSEFTX0xPQ0spIH0sCj4+PiAKPj4+IG5laXRoZXIgdGhpcyBvbmU6Cj4+PiBo
dHRwczovL2RhdGFzaGVldC5vY3RvcGFydC5jb20vQVQyNURGMzIxLVMzVS1BdG1lbC1kYXRhc2hl
ZXQtODcwMDg5Ni5wZGYKPj4+IAo+Pj4+ICvCoMKgwqDCoMKgwqAgeyAiYXQyNWRmMzIxYSIsIElO
Rk8oMHgxZjQ3MDEsIDAsIDY0ICogMTAyNCzCoCA2NCwgU0VDVF80SyB8Cj4+Pj4gU1BJX05PUl9I
QVNfTE9DSykgfSwKPj4+IAo+Pj4gbm9yIHRoaXMgb25lOiAKPj4+IGh0dHBzOi8vd3d3LmFkZXN0
b3RlY2guY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy9kb2MzNjg2LnBkZgo+Pj4gCj4+Pj4gK8KgwqDC
oMKgwqDCoCB7ICJhdDI1ZGY2NDEiLMKgIElORk8oMHgxZjQ4MDAsIDAsIDY0ICogMTAyNCwgMTI4
LCBTRUNUXzRLIHwKPj4+PiBTUElfTk9SX0hBU19MT0NLKSB9LAo+Pj4gCj4+PiBub3IgdGhpcyBv
bmU6IAo+Pj4gaHR0cHM6Ly93d3cuYWRlc3RvdGVjaC5jb20vd3AtY29udGVudC91cGxvYWRzL2Rv
YzM2ODAucGRmCj4+PiAKPj4+IEkgc3RvcCBoZXJlLgo+PiAKPj4gVGhlc2UgYXJlIGFsbCB0aGUg
b25lcyB3aGljaCB1c2UgdGhlIGdsb2JhbCB1bmxvY2suIEkgY2Fubm90IGp1c3Qgc2tpcAo+PiB0
aGUgSEFTX0xPQ0sgYml0IGhlcmUsIGJlY2F1c2Ugb3RoZXJ3aXNlIHRoaXMgcGF0Y2ggd291bGRu
J3QgYmUKPj4gYmFja3dhcmRzCj4+IGNvbXBhdGliZS4gWWVzIEkgbWlzc2VkIHRoYXQgaW4gdGhl
IGNvbW1pdCBsb2csIG15IGJhZC4KPj4gCj4gCj4gTm8gd29ycmllcy4KPiAKPiAidW5sb2NrIGFs
bCBhdCBib290IiBqdXN0IGNsZWFyZWQgdGhlIFNSIGJpdHMuIENsZWFyaW5nIHRoZSBTUiBiaXRz
IAo+IHVubG9ja3MKPiB0aGVzZSBmbGFzaGVzPwoKQ2xlYXJpbmcgYml0cyA1LDQsMywyLCB5ZXMg
KHdpdGggU1BSTD0wKQoKICAgQ29udmVyc2VseSwgdG8gcGVyZm9ybSBhIEdsb2JhbCBVbnByb3Rl
Y3QsIHRoZSBzYW1lIFdQIGFuZCBTUFJMIApjb25kaXRpb25zCiAgIG11c3QgYmUgbWV0IGJ1dCB0
aGUgc3lzdGVtIG11c3Qgd3JpdGUgYSBMb2dpY2FsIDAgdG8gYml0cyA1LCA0LCAzLCBhbmQgCjIK
ICAgb2YgdGhlIGZpcnN0IGJ5dGUgb2YgdGhlIFN0YXR1cyBSZWdpc3Rlci4KClRoaXMgd2lsbCBo
b3BlZnVsbHkgYmUgY2xlYW5lZCB1cCBieSBteSAibXRkOiBzcGktbm9yOiBrZWVwIGxvY2sgYml0
cyBpZiAKdGhleQphcmUgbm9uLXZvbGF0aWxlIiBwYXRjaC4KCi1taWNoYWVsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
