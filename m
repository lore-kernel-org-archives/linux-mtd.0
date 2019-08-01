Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=CHARSET_FARAWAY_HEADER,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC1BC433FF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 09:13:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21BA7206A2
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 09:13:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WeMiwA3c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21BA7206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQbieHwR7QkhHgMLM7tGxW386GiWYUSgcsXmmvbiuqo=; b=WeMiwA3cC9+pl5
	F9/b7vRZUF9TfjkkC4C9BhZ65w6FENgQERiV+r0poC+gk/p/Rp4PXvOA/1LlpjCxqBhoR611f0VDm
	tLwyH9BTJnbW+LexiWdFv3ntzs0ZDXoQdRtfIRLBgcjLvHgVPEALEfQXascNZMJBq2Qd+QY1BJFNJ
	tF91JhCQ3UhmXELBNfEYWgbSjzOnVPBLpAiFmegoWMdN/pR/jt8GMM2y2i8U5wtOr4X7VoFMnmWKV
	+sC8FVl2M6xagWKSvJKE8SckuLPAzjKZ/aQmfzMPxSWp8reY53cXz97ZinRYQ2atRVlWn9ClE418W
	pSQK270PXlnbkKpDa5JA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht79R-000387-Pe; Thu, 01 Aug 2019 09:13:33 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht79O-00037A-NO
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 09:13:32 +0000
Received: from dggemi401-hub.china.huawei.com (unknown [172.30.72.54])
 by Forcepoint Email with ESMTP id 906E81AEC0426B887148;
 Thu,  1 Aug 2019 17:13:27 +0800 (CST)
Received: from DGGEMI423-HUB.china.huawei.com (10.1.199.152) by
 dggemi401-hub.china.huawei.com (10.3.17.134) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 1 Aug 2019 17:13:27 +0800
Received: from DGGEMI524-MBX.china.huawei.com ([169.254.7.227]) by
 dggemi423-hub.china.huawei.com ([10.1.199.152]) with mapi id 14.03.0439.000;
 Thu, 1 Aug 2019 17:13:20 +0800
From: chengzhihao <chengzhihao1@huawei.com>
To: "richard@nod.at" <richard@nod.at>, "zhangyi (F)" <yi.zhang@huawei.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIFJGQ10gdWJpOiB1Ymlfd2xfZ2V0X3BlYjogUmVwbGFj?=
 =?gb2312?B?ZSBhIGxpbWl0ZWQgbnVtYmVyIG9mIGF0dGVtcHRzIHdpdGggcG9sbGluZyB3?=
 =?gb2312?Q?hile_getting_PEB?=
Thread-Topic: [PATCH RFC] ubi: ubi_wl_get_peb: Replace a limited number of
 attempts with polling while getting PEB
Thread-Index: AQHVSEkuRooM7Daz00mNhjuG43MDw6bmAggA
Date: Thu, 1 Aug 2019 09:13:20 +0000
Message-ID: <0B80F9D4116B2F4484E7279D5A66984F7A8A13@dggemi524-mbx.china.huawei.com>
References: <1564651065-4585-1-git-send-email-chengzhihao1@huawei.com>
In-Reply-To: <1564651065-4585-1-git-send-email-chengzhihao1@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.177.224.82]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_021330_937031_6F67AE0F 
X-CRM114-Status: GOOD (  16.78  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIHdoeSBhIGxpbWl0ZWQgbnVtYmVyIG9mIGF0dGVtcHRz
IGhhdmUgYmVlbiBtYWRlIHRvIGdldCBhIGZyZWUgUEVCIGluIHViaV93bF9nZXRfcGViIChpbiBm
YXN0bWFwLXdsLmMpLiBJIHByb3Bvc2VkIHRoaXMgUEFUQ0ggd2l0aCByZWZlcmVuY2UgdG8gdGhl
IGltcGxlbWVudGF0aW9uIG9mIHViaV93bF9nZXRfcGViIChpbiB3bC5jKS4gQXMgZmFyIGFzIEkg
a25vdywgZ2V0dGluZyBQRUIgYnkgcG9sbGluZyBwcm9iYWJseSB3b24ndCBmYWxsIGludG8gc29m
dC1sb2NrdXAuDQp1YmlfdXBkYXRlX2Zhc3RtYXAgbWF5IGFkZCBuZXcgdGFza3MgKGluY2x1ZGlu
ZyBlcmFzZSB0YXNrIG9yIHdsIHRhc2trLCB3bCB0YXNrcyBnZW5lcmFsbHkgZG8gbm90IGdlbmVy
YXRlIGFkZGl0aW9uYWwgZnJlZSBQRUJzKSB0byB1YmktPndvcmtzLCBhbmQgcHJvZHVjZV9mcmVl
X3BlYiB3aWxsIGV2ZW50dWFsbHkgY29tcGxldGUgYWxsIHRhc2tzIGluIHViaS0+d29ya3Mgb3Ig
b2J0YWluIGFuIGZyZWUgUEVCIHRoYXQgY2FuIGJlIGZpbGxlZCBpbnRvIHBvb2wuDQoNCi0tLS0t
08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBjaGVuZ3poaWhhbyANCreiy83KsbzkOiAyMDE5xOo41MIx
yNUgMTc6MTgNCsrVvP7IyzogcmljaGFyZEBub2QuYXQ7IHpoYW5neWkgKEYpIDx5aS56aGFuZ0Bo
dWF3ZWkuY29tPg0Ks63LzTogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGNoZW5nemhpaGFvIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNv
bT4NCtb3zOI6IFtQQVRDSCBSRkNdIHViaTogdWJpX3dsX2dldF9wZWI6IFJlcGxhY2UgYSBsaW1p
dGVkIG51bWJlciBvZiBhdHRlbXB0cyB3aXRoIHBvbGxpbmcgd2hpbGUgZ2V0dGluZyBQRUINCg0K
UnVubmluZyBwcmVzc3VyZSB0ZXN0IGlvX3BhcmFsIChBIHByZXNzdXJlIHViaSB0ZXN0IGluIG10
ZC11dGlscykgb24gYW4gVUJJIGRldmljZSB3aXRoIGZld2VyIFBFQnMgKGZhc3RtYXAgZW5hYmxl
ZCkgbWF5IGNhdXNlIEVOT1NQQyBlcnJvcnMgYW5kIG1ha2UgVUJJIGRldmljZSByZWFkLW9ubHks
IGJ1dCB0aGVyZSBhcmUgc3RpbGwgZnJlZSBQRUJzIG9uIHRoZSBVQkkgZGV2aWNlLiBUaGlzIHBy
b2JsZW0gY2FuIGJlIGVhc2lseSByZXByb2R1Y2VkIGJ5IHBlcmZvcm1pbmcgdGhlIGZvbGxvd2lu
ZyBzdGVwcyBvbiBhIDItY29yZSBtYWNoaW5lOg0KICAkIG1vZHByb2JlIG5hbmRzaW0gZmlyc3Rf
aWRfYnl0ZT0weDIwIHNlY29uZF9pZF9ieXRlPTB4MzMgcGFydHM9ODANCiAgJCBtb2Rwcm9iZSB1
YmkgbXRkPSIwLDAiIGZtX2F1dG9jb252ZXJ0DQogICQgLi9pb19wYXJhbCAvZGV2L3ViaTANCg0K
V2UgbWF5IHNlZSB0aGUgZm9sbG93aW5nIHZlcmJvc2U6DQoob3V0cHV0KQ0KICBbaW9fcGFyYWxd
IHVwZGF0ZV92b2x1bWUoKToxMDU6IGZ1bmN0aW9uIHdyaXRlKCkgZmFpbGVkIHdpdGggZXJyb3Ig
MzANCiAgKFJlYWQtb25seSBmaWxlIHN5c3RlbSkNCiAgW2lvX3BhcmFsXSB1cGRhdGVfdm9sdW1l
KCk6MTA4OiBmYWlsZWQgdG8gd3JpdGUgMzgwIGJ5dGVzIGF0IG9mZnNldA0KICA5NTkyMCBvZiB2
b2x1bWUgMg0KICBbaW9fcGFyYWxdIHVwZGF0ZV92b2x1bWUoKToxMDk6IHVwZGF0ZTogOTcwODgg
Ynl0ZXMNCiAgW2lvX3BhcmFsXSB3cml0ZV90aHJlYWQoKToyMjc6IGZ1bmN0aW9uIHB3cml0ZSgp
IGZhaWxlZCB3aXRoIGVycm9yIDI4DQogIChObyBzcGFjZSBsZWZ0IG9uIGRldmljZSkNCiAgW2lv
X3BhcmFsXSB3cml0ZV90aHJlYWQoKToyMjk6IGNhbm5vdCB3cml0ZSAxNTg3MiBieXRlcyB0byBv
ZmZzIDMxNzQ0LA0KICB3cm90ZSAtMQ0KKGRtZXNnKQ0KICB1YmkwIGVycm9yOiB1Ymlfd2xfZ2V0
X3BlYiBbdWJpXTogVW5hYmxlIHRvIGdldCBhIGZyZWUgUEVCIGZyb20gdXNlciBXTA0KICBwb29s
DQogIHViaTAgd2FybmluZzogdWJpX2ViYV93cml0ZV9sZWIgW3ViaV06IHN3aXRjaCB0byByZWFk
LW9ubHkgbW9kZQ0KICB1YmkwIGVycm9yOiB1YmlfaW9fd3JpdGUgW3ViaV06IHJlYWQtb25seSBt
b2RlDQogIENQVTogMCBQSUQ6IDIwMjcgQ29tbTogaW9fcGFyYWwgTm90IHRhaW50ZWQgNS4zLjAt
cmMyLTAwMDAxLWc1OTg2Y2QwICM5DQogIHViaTAgd2FybmluZzogdHJ5X3dyaXRlX3ZpZF9hbmRf
ZGF0YSBbdWJpXTogZmFpbGVkIHRvIHdyaXRlIFZJRCBoZWFkZXINCiAgdG8gTEVCIDI6NSwgUEVC
IDE4DQogIEhhcmR3YXJlIG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMgKGk0NDBGWCArIFBJSVgsIDE5
OTYpLCBCSU9TIHJlbC0xLjEyLjANCiAgLTAtZ2E2OThjODk5NWYtcHJlYnVpbHQucWVtdS5vcmcg
MDQvMDEvMjAxNA0KICBDYWxsIFRyYWNlOg0KICAgZHVtcF9zdGFjaysweDg1LzB4YmENCiAgIHVi
aV9lYmFfd3JpdGVfbGViKzB4YTFlLzB4YTQwIFt1YmldDQogICB2b2xfY2Rldl93cml0ZSsweDMw
Ny8weDUyMCBbdWJpXQ0KICB1YmkwIGVycm9yOiB2b2xfY2Rldl93cml0ZSBbdWJpXTogY2Fubm90
IGFjY2VwdCBtb3JlIDM4MCBieXRlcyBvZiBkYXRhLA0KICBlcnJvciAtMzANCiAgIHZmc193cml0
ZSsweGZhLzB4MjgwDQogICBrc3lzX3B3cml0ZTY0KzB4YzUvMHhlMA0KICAgX194NjRfc3lzX3B3
cml0ZTY0KzB4MjIvMHgzMA0KICAgZG9fc3lzY2FsbF82NCsweGJmLzB4NDQwDQoNCkluIGZ1bmN0
aW9uIHViaV93bF9nZXRfcGViLCB0aGUgb3BlcmF0aW9uIG9mIGZpbGxpbmcgdGhlIHBvb2wNCih1
YmlfdXBkYXRlX2Zhc3RtYXApIHdpdGggZnJlZSBQRUJzIGFuZCBmZXRjaGluZyBhIGZyZWUgUEVC
IGZyb20gdGhlIHBvb2wgaXMgbm90IGF0b21pYy4gQWZ0ZXIgdGhyZWFkIEEgZmlsbGluZyB0aGUg
cG9vbCB3aXRoIGZyZWUgUEVCLCBmcmVlIFBFQiBtYXkgYmUgdGFrZW4gYXdheSBieSB0aHJlYWQg
Qi4gV2hlbiB0aHJlYWQgQSBjaGVja3MgdGhlIGV4cHJlc3Npb24gYWdhaW4sIHRoZSBjb25kaXRp
b24gaXMgc3RpbGwgdW5zYXRpc2ZhY3RvcnkuIEF0IHRoaXMgdGltZSwgdGhlcmUgbWF5IHN0aWxs
IGJlIGZyZWUgUEVCcyBvbiBVQkkgdGhhdCBjYW4gYmUgZmlsbGVkIGludG8gdGhlIHBvb2wuDQpT
bywgdWJpX3dsX2dldF9wZWIgKGluIGZhc3RtYXAtd2lsLmMpIHNob3VsZCBiZSBpbXBsZW1lbnRl
ZCB0byBvYnRhaW4gYSBmcmVlIFBFQiBieSBwb2xsaW5nIG1ldGhvZC4gVGhlIHBvbGxpbmcgZXhp
dCBjb25kaXRpb24gaXMgdGhhdCB0aGVyZSBpcyBubyBmcmVlIFBFQnMgb24gVUJJLCBubyBmcmVl
IFBFQnMgaW4gcG9vbCwgYW5kIHViaS0+d29ya3NfY291bnQgaXMgMC4NCg0KU2lnbmVkLW9mZi1i
eTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4NCi0tLQ0KIGRyaXZlcnMv
bXRkL3ViaS9mYXN0bWFwLXdsLmMgfCA5ICsrKysrLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91
YmkvZmFzdG1hcC13bC5jIGIvZHJpdmVycy9tdGQvdWJpL2Zhc3RtYXAtd2wuYyBpbmRleCBkOWUy
ZTNhLi5jNTUxMmNmIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tdGQvdWJpL2Zhc3RtYXAtd2wuYw0K
KysrIGIvZHJpdmVycy9tdGQvdWJpL2Zhc3RtYXAtd2wuYw0KQEAgLTE5Niw3ICsxOTYsNyBAQCBz
dGF0aWMgaW50IHByb2R1Y2VfZnJlZV9wZWIoc3RydWN0IHViaV9kZXZpY2UgKnViaSkNCiAgKi8N
CiBpbnQgdWJpX3dsX2dldF9wZWIoc3RydWN0IHViaV9kZXZpY2UgKnViaSkgIHsNCi0JaW50IHJl
dCwgcmV0cmllZCA9IDA7DQorCWludCByZXQ7DQogCXN0cnVjdCB1YmlfZm1fcG9vbCAqcG9vbCA9
ICZ1YmktPmZtX3Bvb2w7DQogCXN0cnVjdCB1YmlfZm1fcG9vbCAqd2xfcG9vbCA9ICZ1YmktPmZt
X3dsX3Bvb2w7DQogDQpAQCAtMjIwLDEzICsyMjAsMTQgQEAgaW50IHViaV93bF9nZXRfcGViKHN0
cnVjdCB1YmlfZGV2aWNlICp1YmkpDQogCX0NCiANCiAJaWYgKHBvb2wtPnVzZWQgPT0gcG9vbC0+
c2l6ZSkgew0KLQkJc3Bpbl91bmxvY2soJnViaS0+d2xfbG9jayk7DQotCQlpZiAocmV0cmllZCkg
ew0KKwkJaWYgKCF1YmktPmZyZWUucmJfbm9kZSAmJiB1YmktPndvcmtzX2NvdW50ID09IDApIHsN
CiAJCQl1YmlfZXJyKHViaSwgIlVuYWJsZSB0byBnZXQgYSBmcmVlIFBFQiBmcm9tIHVzZXIgV0wg
cG9vbCIpOw0KKwkJCXViaV9hc3NlcnQobGlzdF9lbXB0eSgmdWJpLT53b3JrcykpOw0KKwkJCXNw
aW5fdW5sb2NrKCZ1YmktPndsX2xvY2spOw0KIAkJCXJldCA9IC1FTk9TUEM7DQogCQkJZ290byBv
dXQ7DQogCQl9DQotCQlyZXRyaWVkID0gMTsNCisJCXNwaW5fdW5sb2NrKCZ1YmktPndsX2xvY2sp
Ow0KIAkJdXBfcmVhZCgmdWJpLT5mbV9lYmFfc2VtKTsNCiAJCXJldCA9IHByb2R1Y2VfZnJlZV9w
ZWIodWJpKTsNCiAJCWlmIChyZXQgPCAwKSB7DQotLQ0KMi43LjQNCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
