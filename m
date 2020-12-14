Return-Path: <SRS0=YYID=FS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F7DC4361B
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 07:18:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 065A922597
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 07:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 065A922597
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9GOXNHSiW4xXH/pZ37icF/LJehAsnBUBvgAUqYKfbUE=; b=lbRuC2mr2hOk3kK7DeTQMHdHa
	UHf13xFjch3Gz6uoXhpRzzToWuVNMqeHxf1VTtME/BUIKxq02nahHJ+NJJLOrk1AukH8ZpG/MhGJ2
	Qw4tQXaYYqn7lH7bIQIoTp56SG0mbLGskWG3U7py7NqYT+1MqrtBFIbtuMwqDXoLaOxvtzzm4cjZE
	xFfxs38QHKsDJ3afyK2k5GCUilZrAZrJ48P5GFXDK3b7ZymbBzuaG1KCfaEIRJuCDRMlTuLgjkVHB
	+gTivQEV/UuTzD3czCq8597FLQF98KStGmbecVVbNsU37UPb7khE/3Dvqpo4dcJHII+jNPWm2+Hdv
	6EUIwY46A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koi6t-0001o7-Qz; Mon, 14 Dec 2020 07:17:31 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koi6r-0001nl-55
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2020 07:17:29 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BE7Gtgh074940;
 Mon, 14 Dec 2020 01:16:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607930215;
 bh=8FHqPP8PBL/oO2YZ5LjA9fGaAwrrvB9dOJXSZMgKL24=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=i6wTFtj2r08OWxpTCqDKPlwFrEkRth5z4rhY833WWd0Ym490ManQwNO/x3t4p2HsH
 JAURnj8+vPWgb/NgnBXeGb1ImDnoxyMrxOSIwWewpc5mhZbqNhBhUaLkKwZIzOGjb4
 SI/ucIWQEk5QAhMGOwyCt/vMIAYfT2/d9h3eWcqc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BE7GsmG105549
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Dec 2020 01:16:55 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 14
 Dec 2020 01:16:54 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 14 Dec 2020 01:16:54 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BE7GpkQ093250;
 Mon, 14 Dec 2020 01:16:51 -0600
Subject: Re: ping // [PATCH] mtd:cfi_cmdset_0002: fix atomic sleep bug when
 CONFIG_MTD_XIP=y
To: Xiaoming Ni <nixiaoming@huawei.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
References: <20201127130731.99270-1-nixiaoming@huawei.com>
 <a02e1364-3b82-039a-4b65-e2a216663dd4@huawei.com>
 <20201207115228.0a6de398@xps13> <73b539eb-616e-64d8-07d8-4606da2ea2ea@ti.com>
 <b5c52547-b3cc-4217-cc69-067cee7d536f@huawei.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <f14ccb94-cb53-f495-e95c-fe657122f16c@ti.com>
Date: Mon, 14 Dec 2020 12:46:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b5c52547-b3cc-4217-cc69-067cee7d536f@huawei.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_021729_291437_B820EE72 
X-CRM114-Status: GOOD (  21.58  )
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
Cc: wangle6@huawei.com, tudor.ambarus@microchip.com, richard@nod.at,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, gregkh@linuxfoundation.org, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxMi84LzIwIDY6NTMgQU0sIFhpYW9taW5nIE5pIHdyb3RlOgo+IE9uIDIwMjAvMTIvOCAy
OjU5LCBWaWduZXNoIFJhZ2hhdmVuZHJhIHdyb3RlOgo+PiBIaSBYaWFvbWluZywKPj4KWy4uLl0K
Pj4+Pj4gLS0tCj4+Pj4+IMKgwqAgZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMg
fCAxNiArKysrKysrKysrKysrKysrCj4+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKykKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9j
bWRzZXRfMDAwMi5jCj4+Pj4+IGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMK
Pj4+Pj4gaW5kZXggYTFmM2UxMDMxYzNkLi4xMmMzNzc2ZjA5M2EgMTAwNjQ0Cj4+Pj4+IC0tLSBh
L2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMv
bXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4+Pj4+IEBAIC0xNjgyLDcgKzE2ODIsMTEgQEAg
c3RhdGljIGludCBfX3hpcHJhbQo+Pj4+PiBkb193cml0ZV9vbmV3b3JkX29uY2Uoc3RydWN0IG1h
cF9pbmZvICptYXAsCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0X2N1cnJl
bnRfc3RhdGUoVEFTS19VTklOVEVSUlVQVElCTEUpOwo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGFkZF93YWl0X3F1ZXVlKCZjaGlwLT53cSwgJndhaXQpOwo+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG11dGV4X3VubG9jaygmY2hpcC0+bXV0ZXgpOwo+Pj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoSVNfRU5BQkxFRChDT05GSUdfTVREX1hJUCkpCj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbG9jYWxfaXJxX2VuYWJsZSgpOwo+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNjaGVkdWxlKCk7Cj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChJU19FTkFCTEVEKENPTkZJR19NVERfWElQKSkKPj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb2NhbF9pcnFfZGlzYWJsZSgpOwo+Pj4K
Pj4+IFRoZSBmaXggcmVhbGx5IHNlZW1zIHN0cmFuZ2UgdG8gbWUuIEkgd2lsbCBsZXQgVmlnbmVz
aCBkZWNpZGUgYnV0IEkKPj4+IHRoaW5rIHdlIHNob3VsZCBjb25zaWRlciB1cGRhdGluZy9maXhp
bmcgeGlwX2Rpc2FibGUgaW5zdGVhZC4KPj4KPj4gQWdyZWUgd2l0aCBNaXF1ZWwuIEhhdmUgeW91
IGRvbmUgYW55IHRlc3RpbmcKPj4gb3IgaXMgdGhpcyBwdXJlbHkgYmFzZWQgb24gY29kZSBpbnNw
ZWN0aW9uPwo+Pgo+IEkgZG9uJ3QgaGF2ZSB0aGUgY29ycmVzcG9uZGluZyBkZXZpY2UgdGVzdCBl
bnZpcm9ubWVudC4KPiBJIGZvdW5kIHRoZSBwcm9ibGVtIHRocm91Z2ggY29kZSByZXZpZXcuCj4g
CgpTb3JyeSwgSSBhbSBub3QgY29tZm9ydGFibGUgYXBwbHlpbmcgdGhpcyBwYXRjaCB3aXRob3V0
IHByb3BlciB0ZXN0aW5nCnRoYXQgZ2l2ZW4gdGhlIHVua25vd25zIGFuZCBsZWdhY3kgbmF0dXJl
IG9mIHRoZSBjb2RlLgoKPiAKPj4gV2hhdCBhYm91dCBjb21tZW50IGJlZm9yZSB4aXBfZGlzYWJs
ZSgpIGZ1bmN0aW9uOgo+Pgo+PiAvKgo+PiDCoCAqIE5vIGludGVycnVwdCB3aGF0IHNvIGV2ZXIg
Y2FuIGJlIHNlcnZpY2VkIHdoaWxlIHRoZSBmbGFzaCBpc24ndCBpbgo+PiBhcnJheQo+PiDCoCAq
IG1vZGUuwqAgVGhpcyBpcyBlbnN1cmVkIGJ5IHRoZSB4aXBfZGlzYWJsZSgpIGFuZCB4aXBfZW5h
YmxlKCkKPj4gZnVuY3Rpb25zCj4+IMKgICogZW5jbG9zaW5nIGFueSBjb2RlIHBhdGggd2hlcmUg
dGhlIGZsYXNoIGlzIGtub3duIG5vdCB0byBiZSBpbgo+PiBhcnJheSBtb2RlLgo+PiDCoCAqIEFu
ZCB3aXRoaW4gYSBYSVAgZGlzYWJsZWQgY29kZSBwYXRoLCBvbmx5IGZ1bmN0aW9ucyBtYXJrZWQg
d2l0aAo+PiBfX3hpcHJhbQo+PiDCoCAqIG1heSBiZSBjYWxsZWQgYW5kIG5vdGhpbmcgZWxzZSAo
aXQncyBhIGdvb2QgdGhpbmcgdG8gaW5zcGVjdAo+PiBnZW5lcmF0ZWQKPj4gwqAgKiBhc3NlbWJs
eSB0byBtYWtlIHN1cmUgaW5saW5lIGZ1bmN0aW9ucyB3ZXJlIGFjdHVhbGx5IGlubGluZWQgYW5k
Cj4+IHRoYXQgZ2NjCj4+IMKgICogZGlkbid0IGVtaXQgY2FsbHMgdG8gaXRzIG93biBzdXBwb3J0
IGZ1bmN0aW9ucykuIEFsc28gY29uZmlndXJpbmcKPj4gTVREIENGSQo+PiDCoCAqIHN1cHBvcnQg
dG8gYSBzaW5nbGUgYnVzd2lkdGggYW5kIGEgc2luZ2xlIGludGVybGVhdmUgaXMgYWxzbwo+PiBy
ZWNvbW1lbmRlZC4KPj4gwqAgKi8KPj4KPj4gU28sIEkgZG9uJ3QgdGhpbmsgdGhlIGZpeCBpcyBh
cyBzaW1wbGUgYXMgdGhpcyBwYXRjaC4KPj4KPiAreGlwX2VuYWJsZSgpOwo+IMKgc2NoZWR1bGUo
KTsKPiAreGlwX2Rpc2FibGUoKTsKPiAKPiBEbyBJIG5lZWQgdG8gY2hhbmdlIGl0IHRvIHRoaXM/
Cj4gCgpUaGlzIGp1c3QgbmFycm93cyB0aGUgd2luZG93LCBidXQgYW4gSVJRIGlzIHN0aWxsIHBv
c3NpYmxlIGp1c3QgYWZ0ZXIKeGlwX2VuYWJsZSgpIGJ1dCBiZWZvcmUgc2NoZWR1bGUoKS4KClJl
Z2FyZHMKVmlnbmVzaAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
