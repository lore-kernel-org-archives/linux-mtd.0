Return-Path: <SRS0=FSZL=DT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C127C433E7
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 06:45:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 693B2206FB
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 06:45:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e/MuDY2u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PL/e6qrr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 693B2206FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ftKpC6KOFkfbRR9xzxouv0+jFkKgKpjsbJ2j1XtuHI8=; b=e/MuDY2uDJY67msa0S98Lf61I
	QIX1w5yLsLqVSeFqr/iv/PmyIwFnVluoCR1f950FGctWVplRTtplHQJN/yONs1ZVoa4WISwy3Gi5o
	SYVXA8nlPfGu7eTydzoBniZvR74byjsVtc8IHuFyp64xwq8Qtc+VjGvRzoUFLEKcHV+FkEnLIIt8a
	aNZtE1lnrwCpAO9pEDsNtI3e8P7Ah63T99z/ZAZ5QFGuvl8jX7NAHDqFiCoWh+j3EPrEZDN7dFld7
	guG9B3t+p9GTle4KExsx44pi+Xo8kenAUNPyubsFnO39urCwN8eTCUN6Ah6njgO4ScdE/3qrxUZaX
	hJN3MVxyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRrZ1-0007na-DV; Mon, 12 Oct 2020 06:44:07 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRrYy-0007nA-TP
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2020 06:44:06 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09C6hvTq111778;
 Mon, 12 Oct 2020 01:43:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1602485037;
 bh=7G/UNwfIGals5GBKxKjvF9hAcJt5FhCoaZheMHZygog=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=PL/e6qrrDQP5mv+7D9sfkk9/ctDTz3E6/z9xy58V2/Hmv1KSxiZJWbJtcLzC/LkBB
 kJXFyKA3t07I1gGzL4BuyGAaUQ2l/CySwBR9nAoOcDTqWkm2rYqrFNHfLpLolFf1zt
 U/qB3f7X/qWWVzT/soDPaqrn6FuBsGSU8VvMEoQM=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09C6hvb9099832
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 12 Oct 2020 01:43:57 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 12
 Oct 2020 01:43:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 12 Oct 2020 01:43:57 -0500
Received: from [10.250.233.64] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09C6hsrf011734;
 Mon, 12 Oct 2020 01:43:55 -0500
Subject: Re: [GIT PULL] CFI and HyperFlash changes for v5.10-rc1
To: Richard Weinberger <richard@nod.at>
References: <6755a43e-1fec-4a5f-760d-44ac834787aa@ti.com>
 <2085985092.185629.1602448941236.JavaMail.zimbra@nod.at>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <597639d5-8941-57e0-0889-2ec48b156d29@ti.com>
Date: Mon, 12 Oct 2020 12:13:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2085985092.185629.1602448941236.JavaMail.zimbra@nod.at>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_024405_091727_301E91B9 
X-CRM114-Status: GOOD (  21.98  )
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
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxMC8xMi8yMCAyOjEyIEFNLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4gVmlnbmVz
aCwKPiAKPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZvbjogIlZpZ25lc2gg
UmFnaGF2ZW5kcmEiIDx2aWduZXNockB0aS5jb20+Cj4+IEFuOiAiTWlxdWVsIFJheW5hbCIgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+LCAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Pgo+PiBD
QzogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgIlR1ZG9yIEFt
YmFydXMiIDxUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20+Cj4+IEdlc2VuZGV0OiBGcmVpdGFn
LCA5LiBPa3RvYmVyIDIwMjAgMTM6NDM6MzYKPj4gQmV0cmVmZjogW0dJVCBQVUxMXSBDRkkgYW5k
IEh5cGVyRmxhc2ggY2hhbmdlcyBmb3IgdjUuMTAtcmMxCj4gCj4+IEhpICBNaXF1ZWwsIFJpY2hh
cmQsCj4+Cj4+IEhlcmUgaXMgdGhlIENGSSBhbmQgSHlwZXJGbGFzaCByZWxhdGVkIFBSIGZvciB2
NS4xMC1yYzEuIFRoYW5rcyEKPj4KPj4gUmVnYXJkcwo+PiBWaWduZXNoCj4+Cj4+IFRoZSBmb2xs
b3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYmE0ZjE4NGUxMjZiNzUxZDFiZmZhZDU4OTdmMjYz
MTA4YmVmYzc4MDoKPj4KPj4gIExpbnV4IDUuOS1yYzYgKDIwMjAtMDktMjAgMTY6MzM6NTUgLTA3
MDApCj4gCj4gRGlkIHlvdSBiYXNlIHlvdXIgcGF0Y2hlcyBvbiBwdXJwb3NlIG9uIC1yYzY/Cj4g
bXRkL25leHQgaXMgYmFzZWQgb24gLXJjMi4KPiBOb3QgYSBiaWcgZGVhbCwgYnV0IGNhbiBjYXVz
ZSBjb25mdXNpb24uCj4gCj4+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0
Ogo+Pgo+PiAgZ2l0QGdpdG9saXRlLmtlcm5lbC5vcmc6cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L210ZC9saW51eC5naXQgdGFncy9jZmkvZm9yLTUuMTAKPj4KPj4gZm9yIHlvdSB0byBmZXRjaCBj
aGFuZ2VzIHVwIHRvIDVkZTE1YjYxMGY3ODVmMGUxODhmZWZiNzA3ZjBiMTlkZTE1Njk2OGE6Cj4+
Cj4+ICBtdGQ6IGh5cGVyYnVzOiBhZGQgUmVuZXNhcyBSUEMtSUYgZHJpdmVyICgyMDIwLTEwLTA2
IDEyOjM2OjIxICswNTMwKQo+Pgo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IEh5cGVyQnVzIGNoYW5nZXMKPj4KPj4g
KiBETUEgc3VwcG9ydCBmb3IgVEkncyBBTTY1NCBIeXBlckJ1cyBjb250cm9sbGVyIGRyaXZlci4K
Pj4gKiBIeXBlckJ1cyBmcm9udGVuZCBkcml2ZXIgZm9yIFJlbmVzYXMgUlBDLUlGIGRyaXZlci4K
Pj4KPj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+PiBTZXJnZWkgU2h0eWx5b3YgKDEpOgo+PiAgICAgIG10ZDogaHlwZXJi
dXM6IGFkZCBSZW5lc2FzIFJQQy1JRiBkcml2ZXIKPj4KPj4gVmlnbmVzaCBSYWdoYXZlbmRyYSAo
NCk6Cj4+ICAgICAgbXRkOiBoeXBlcmJ1czogUHJvdmlkZSBwZXIgZGV2aWNlIHByaXZhdGUgcG9p
bnRlcgo+PiAgICAgIG10ZDogaHlwZXJidXM6IGhibWMtYW02NTQ6IEZpeCBkaXJlY3QgbWFwcGlu
ZyBzZXR1cCBmbGFzaCBhY2Nlc3MKPj4gICAgICBtdGQ6IGh5cGVyYnVzOiBoYm1jLWFtNjU0OiBE
cm9wIHBtX3J1bnRpbWUqIGNhbGxzIGZyb20gcHJvYmUKPj4gICAgICBtdGQ6IGh5cGVyYnVzOiBo
Ym1jLWFtNjU0OiBBZGQgRE1BIHN1cHBvcnQgZm9yIHJlYWRzCj4gCj4gNWRlMTViNjEwZjc4ICgi
bXRkOiBoeXBlcmJ1czogYWRkIFJlbmVzYXMgUlBDLUlGIGRyaXZlciIpIGRvZXMgbm90IGJ1aWxk
IGhlcmUKPiB3aXRoIENPTkZJR19DT01QSUxFX1RFU1QgYmVjYXVzZSB0aGUgZHJpdmVyIG5lZWRz
IGZ1bmN0aW9ucyBmcm9tIENPTkZJR19SRU5FU0FTX1JQQ0lGCj4gd2hpY2ggaXMgb25seSBidWls
ZGFibGUgZm9yIENPTkZJR19BUkNIX1JFTkVTQVMuCj4gCj4gcnBjLWlmLmM6KC50ZXh0KzB4MjAp
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBycGNpZl9kaXNhYmxlX3JwbScKPiBsZDogZHJpdmVy
cy9tdGQvaHlwZXJidXMvcnBjLWlmLm86IGluIGZ1bmN0aW9uIGBycGNpZl9oYl9wcmVwYXJlX3Jl
YWQnOgo+IHJwYy1pZi5jOigudGV4dCsweGQ2KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgcnBj
aWZfcHJlcGFyZScKPiBsZDogZHJpdmVycy9tdGQvaHlwZXJidXMvcnBjLWlmLm86IGluIGZ1bmN0
aW9uIGBycGNpZl9oYl9yZWFkMTYnOgo+IHJwYy1pZi5jOigudGV4dCsweDE3MCk6IHVuZGVmaW5l
ZCByZWZlcmVuY2UgdG8gYHJwY2lmX21hbnVhbF94ZmVyJwo+IGxkOiBkcml2ZXJzL210ZC9oeXBl
cmJ1cy9ycGMtaWYubzogaW4gZnVuY3Rpb24gYHJwY2lmX2hiX3Byb2JlJzoKPiBycGMtaWYuYzoo
LnRleHQrMHgxZDUpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBycGNpZl9zd19pbml0Jwo+IGxk
OiBycGMtaWYuYzooLnRleHQrMHgxZTQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBycGNpZl9l
bmFibGVfcnBtJwo+IGxkOiBycGMtaWYuYzooLnRleHQrMHgxZjEpOiB1bmRlZmluZWQgcmVmZXJl
bmNlIHRvIGBycGNpZl9od19pbml0Jwo+IGxkOiBycGMtaWYuYzooLnRleHQrMHgyM2YpOiB1bmRl
ZmluZWQgcmVmZXJlbmNlIHRvIGBycGNpZl9kaXNhYmxlX3JwbScKPiBsZDogZHJpdmVycy9tdGQv
aHlwZXJidXMvcnBjLWlmLm86IGluIGZ1bmN0aW9uIGBycGNpZl9oYl93cml0ZTE2JzoKPiBycGMt
aWYuYzooLnRleHQrMHgyZTUpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBycGNpZl9wcmVwYXJl
Jwo+IGxkOiBycGMtaWYuYzooLnRleHQrMHgyZWQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBy
cGNpZl9tYW51YWxfeGZlcicKPiBsZDogZHJpdmVycy9tdGQvaHlwZXJidXMvcnBjLWlmLm86IGlu
IGZ1bmN0aW9uIGBycGNpZl9oYl9jb3B5X2Zyb20nOgo+IHJwYy1pZi5jOigudGV4dCsweDEyZSk6
IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHJwY2lmX2Rpcm1hcF9yZWFkJwo+IAo+IFRoaXMgc2hv
dWxkIGRvIHRoZSB0cmljaywgcGxlYXNlIGRvdWJsZSBjaGVjazoKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tZW1vcnkvS2NvbmZpZyBiL2RyaXZlcnMvbWVtb3J5L0tjb25maWcKPiBpbmRleCAyYzc5
ZTk1ZGQ0ODYuLjc5NDc0MDYzNmJjNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lbW9yeS9LY29u
ZmlnCj4gKysrIGIvZHJpdmVycy9tZW1vcnkvS2NvbmZpZwo+IEBAIC0xODEsNyArMTgxLDcgQEAg
Y29uZmlnIFBMMzUzX1NNQwo+ICAKPiAgY29uZmlnIFJFTkVTQVNfUlBDSUYKPiAgCXRyaXN0YXRl
ICJSZW5lc2FzIFJQQy1JRiBkcml2ZXIiCj4gLQlkZXBlbmRzIG9uIEFSQ0hfUkVORVNBUwo+ICsJ
ZGVwZW5kcyBvbiBBUkNIX1JFTkVTQVMgfHwgQ09NUElMRV9URVNUCj4gIAlzZWxlY3QgUkVHTUFQ
X01NSU8KPiAgCWhlbHAKPiAgCSAgVGhpcyBzdXBwb3J0cyBSZW5lc2FzIFItQ2FyIEdlbjMgUlBD
LUlGIHdoaWNoIHByb3ZpZGVzIGVpdGhlciBTUEkKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
aHlwZXJidXMvS2NvbmZpZyBiL2RyaXZlcnMvbXRkL2h5cGVyYnVzL0tjb25maWcKPiBpbmRleCAz
NWIzYWI0YzhiOTQuLjQ2YzdlNDA3ZTM3OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9oeXBl
cmJ1cy9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9tdGQvaHlwZXJidXMvS2NvbmZpZwo+IEBAIC0y
NCw3ICsyNCw3IEBAIGNvbmZpZyBIQk1DX0FNNjU0Cj4gIAo+ICBjb25maWcgUlBDSUZfSFlQRVJC
VVMKPiAgCXRyaXN0YXRlICJSZW5lc2FzIFJQQy1JRiBIeXBlckJ1cyBkcml2ZXIiCj4gLQlkZXBl
bmRzIG9uIFJFTkVTQVNfUlBDSUYgfHwgQ09NUElMRV9URVNUCj4gKwlkZXBlbmRzIG9uIFJFTkVT
QVNfUlBDSUYKPiAgCWRlcGVuZHMgb24gTVREX0NGSV9CRV9CWVRFX1NXQVAKPiAgCWhlbHAKPiAg
CSAgVGhpcyBvcHRpb24gaW5jbHVkZXMgUmVuZXNhcyBSUEMtSUYgSHlwZXJCdXMgc3VwcG9ydC4K
PiAKPiBBbnl3YXksIHB1bGxlZC4gOi0pCgpZZXMsIHRoaXMgbWlzc2VkIG15IHRlc3RpbmcgYW5k
IHNsaXBwZWQgMGRheSBidWlsZHMgYXMgd2VsbCA6KAoKVG8gYmUgY29uc2VydmF0aXZlLCBjYW4g
d2UganVzdCBkcm9wIENPTVBJTEVfVEVTVCBmb3IgUlBDSUZfSFlQRVJCVVMgYW5kCmxldHMgYWRk
IENPTVBJTEVfVEVTVCB0byBSRU5FU0FTX1JQQ0lGIGFmdGVyIDUuMTAtcmMxCgo+IAo+IFRoYW5r
cywKPiAvL3JpY2hhcmQKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
