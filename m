Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36BACDB47E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Oct 2023 07:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Upmsxk6m8k4BCYsrlfZ6Vs6EBERSXFtdqVMUPNBwBoE=; b=itqXDTVpmN11/mi157XQPptPQL
	zGeZrFp2S9NVWi5tmcwS1LFwSBfmIsT02ECTMjTjwC8Y4E6IlLQ4WRylZQlIGlx+kzjsj3e1gIwwT
	RilnuIU/nqy5/hLRvJ0+r6+Ooq1wP/tTJlFB08kmBZQnqp6VTgaGFdJHLLwVqxSIXqHXqGQGPb724
	Wimd1szNH3fyyvHswlSR2XAJbYJyGneNAnambCvMQY6WaXsXG1KEXfIovwT8M+00mpiNqz2q5+mCp
	Zp+qhkG9Nj1yT57yIMOYMHDo13PXLCBjCJFbU5wiitD+zqTxUuHx3L6ihe/l4E61/ZYaDh0nfk9n3
	kmG73iiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1CA-00E4A9-1t;
	Wed, 18 Oct 2023 07:42:22 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1C6-00E48b-1l
	for linux-mtd@lists.infradead.org;
	Wed, 18 Oct 2023 07:42:20 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4S9N5k54kdz15NX4
	for <linux-mtd@lists.infradead.org>; Wed, 18 Oct 2023 15:39:22 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 18 Oct 2023 15:42:04 +0800
Subject: Re: ubi: some invalid code in the function scan_peb
To: Ryder Wang <rydercoding@hotmail.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
References: <MEYP282MB3164B8C92CD51ACC0897F0F2BFD5A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
 <497aa593-5999-821d-a2b7-69c0953e1e3e@huawei.com>
 <MEYP282MB3164701A51B29DB61B106566BFD5A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <51024aa2-9bb9-00ad-5005-464210789e83@huawei.com>
Date: Wed, 18 Oct 2023 15:42:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <MEYP282MB3164701A51B29DB61B106566BFD5A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_004219_034559_3666027F 
X-CRM114-Status: GOOD (  21.29  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjMvMTAvMTggMTU6MjgsIFJ5ZGVyIFdhbmcg5YaZ6YGTOgo+IFRoZSBwYXRjaCBiZWxv
dyBjYW4gcmVtb3ZlIHRoZSBpbnZhbGlkIGNvZGUuIEl0IGNhbiBwYXNzIHViaSBjb2RlIGJ1aWxk
IGFuZCB1YmkgYXR0YWNoIGNhbiBhbHNvIGJlIE9LIGZyb20gdGhlIHRlc3RpbmcuCj4gCgpSZXZp
ZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9hdHRhY2guYyBiL2RyaXZlcnMvbXRkL3ViaS9hdHRhY2gu
Ywo+IGluZGV4IDEwYjI0NTlmODk1MS4uODI2OGNhNmE5MWQxCj4gLS0tIGEvZHJpdmVycy9tdGQv
dWJpL2F0dGFjaC5jCj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL2F0dGFjaC5jCj4gQEAgLTk5NSwy
OCArOTk1LDYgQEAgc3RhdGljIGludCBzY2FuX3BlYihzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBz
dHJ1Y3QgdWJpX2F0dGFjaF9pbmZvICphaSwKPiAgwqDigILigILigILigILigIJpZiAoIWVjX2Vy
cikgewo+ICDCoOKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgmludCBpbWFnZV9zZXE7
Cj4gICAKPiAt4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCLyogTWFrZSBzdXJlIFVC
SSB2ZXJzaW9uIGlzIE9LICovCj4gLeKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgmlm
IChlY2gtPnZlcnNpb24gIT0gVUJJX1ZFUlNJT04pIHsKPiAt4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCdWJpX2Vycih1YmksICJ0aGlzIFVCSSB2ZXJz
aW9uIGlzICVkLCBpbWFnZSB2ZXJzaW9uIGlzICVkIiwKPiAt4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCVUJJX1ZFUlNJ
T04sIChpbnQpZWNoLT52ZXJzaW9uKTsKPiAt4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCCcmV0dXJuIC1FSU5WQUw7Cj4gLeKAguKAguKAguKAguKAguKA
guKAguKAguKAguKAguKAgn0KPiAtCj4gLeKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKA
gmVjID0gYmU2NF90b19jcHUoZWNoLT5lYyk7Cj4gLeKAguKAguKAguKAguKAguKAguKAguKAguKA
guKAguKAgmlmIChlYyA+IFVCSV9NQVhfRVJBU0VDT1VOVEVSKSB7Cj4gLeKAguKAguKAguKAguKA
guKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgi8qCj4gLeKAguKAguKAguKAguKA
guKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgiAqIEVyYXNlIGNvdW50ZXIgb3Zl
cmZsb3cuIFRoZSBFQyBoZWFkZXJzIGhhdmUgNjQgYml0cwo+IC3igILigILigILigILigILigILi
gILigILigILigILigILigILigILigILigILigILigIIgKiByZXNlcnZlZCwgYnV0IHdlIGFueXdh
eSBtYWtlIHVzZSBvZiBvbmx5IDMxIGJpdAo+IC3igILigILigILigILigILigILigILigILigILi
gILigILigILigILigILigILigILigIIgKiB2YWx1ZXMsIGFzIHRoaXMgc2VlbXMgdG8gYmUgZW5v
dWdoIGZvciBhbnkgZXhpc3RpbmcKPiAt4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCCICogZmxhc2guIFVwZ3JhZGUgVUJJIGFuZCB1c2UgNjQtYml0IGVy
YXNlIGNvdW50ZXJzCj4gLeKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKA
guKAguKAguKAgiAqIGludGVybmFsbHkuCj4gLeKAguKAguKAguKAguKAguKAguKAguKAguKAguKA
guKAguKAguKAguKAguKAguKAguKAgiAqLwo+IC3igILigILigILigILigILigILigILigILigILi
gILigILigILigILigILigILigILigIJ1YmlfZXJyKHViaSwgImVyYXNlIGNvdW50ZXIgb3ZlcmZs
b3csIG1heCBpcyAlZCIsCj4gLeKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKA
guKAguKAguKAguKAguKAguKAguKAguKAguKAguKAglVCSV9NQVhfRVJBU0VDT1VOVEVSKTsKPiAt
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCdWJpX2R1
bXBfZWNfaGRyKGVjaCk7Cj4gLeKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKA
guKAguKAguKAguKAgnJldHVybiAtRUlOVkFMOwo+IC3igILigILigILigILigILigILigILigILi
gILigILigIJ9Cj4gLQo+ICDCoOKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgi8qCj4g
IMKg4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCICogTWFrZSBzdXJlIHRoYXQgYWxs
IFBFQnMgaGF2ZSB0aGUgc2FtZSBpbWFnZSBzZXF1ZW5jZSBudW1iZXIuCj4gIMKg4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCICogVGhpcyBhbGxvd3MgdXMgdG8gZGV0ZWN0IHNpdHVh
dGlvbnMgd2hlbiB1c2VycyBmbGFzaCBVQkkKPiAKPiAKPiBGcm9tOiBaaGloYW8gQ2hlbmcgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAxOCwgMjAy
MyAxNDozMQo+IFRvOiBSeWRlciBXYW5nIDxyeWRlcmNvZGluZ0Bob3RtYWlsLmNvbT47IGxpbnV4
LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4K
PiBTdWJqZWN0OiBSZTogdWJpOiBzb21lIGludmFsaWQgY29kZSBpbiB0aGUgZnVuY3Rpb24gc2Nh
bl9wZWIKPiAgIAo+IOWcqCAyMDIzLzEwLzE4IDEzOjU5LCBSeWRlciBXYW5nIOWGmemBkzoKPj4g
SSBqdXN0IGZpbmQgc29tZSBkZWFkIGNvZGUgaW4gdGhlIGZ1bmN0aW9uwqBzY2FuX3BlYiBpbiBk
cnZpZXIvbXRkL3ViaS9hdHRhY2guYy4KPj4KPj4gSW4gdGhlIGZ1bmN0aW9uIHNjYW5fcGViLCBp
dCBjYWxscyB2YWxpZGF0ZV9lY19oZHIgd2hpY2ggY2FsbHMgdmFsaWRhdGVfZWNfaGRyLiBJZiB1
YmkgdmVyc2lvbiBvciBlcmFzZSBjb3VudCBpcyBpbmNvcnJlY3QsIGl0IHdpbGwgcmVwb3J0IC1F
SU5WQUwgYW5kIGFib3J0IHRoZSBmdW5jdGlvbiBzY2FuX3BlYi4gSG93ZXZlciwgdWJpIHZlcnNp
b24gb3IgZXJhc2UgY291bnQgd2lsbCBiZSBjaGVja2VkIGFnYWluIGluIHNjYW5fcGViIGFuZCBz
dWNoIGNoZWNrIGNvZGUgd2lsbCBuZXZlciBmaW5kIHRoZSBlcnJvcnMgYmVjYXVzZSBzdWNoIGVy
cm9ycyBzaG91bGQgaGF2ZSBiZWVuIGRldGVjdGVkIGJ5IHZhbGlkYXRlX2VjX2hkciAoYWJvcnRp
bmcpLgo+Pgo+IAo+IFllcywgcmVkdW5kYW50IGNoZWNraW5nIGluZGVlZCBleGlzdHMgaW4gc2Nh
bl9wZWIoKSwgY291bGQgeW91IHNlbmQgYQo+IHBhdGNoIHRvIGNsZWFuIGl0IHVwPwo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
