Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A4EC19759
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 13:20:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE9D4206B8
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 13:20:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i+W6cFAc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE9D4206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKxD7+nNOi2OS1cpOQplHKrYWaevnvd0eRIOxJ+Lm9g=; b=i+W6cFAcg2Q/+J
	R/a/Dblk34NjO3bdcEy3dXS9F1/K6YCh3cRqjwjJfqMG1bPkDcBH9ONVC7sYs5lM9AymjhYqpCx1+
	ESkaDf/HL4+5IS4q18rUVMI+U2fmp3t2ioysK5EC8nHqkAQUjXxIWu/o16hZywqkjXVJGXbjeiezU
	8nwvHgX387bPPcMb2c9EmjVfygekX/iPMTlHBCclHOvrNoQZGFBJxPPL0u7pqgtOpZw8Y/OOvdinE
	q4ePY9zZujoBg+XGDQnHqs694zIpmxfJBjhnlqIH4TDySizyASprSSHsZdlxsFtvUuWZAa0WNjRGo
	RDlzafPWkK6GT4eWI1EA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htAzi-0002rl-4b; Thu, 01 Aug 2019 13:19:46 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htAzd-0002jY-Bw
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 13:19:43 +0000
Received: from dggemi402-hub.china.huawei.com (unknown [172.30.72.54])
 by Forcepoint Email with ESMTP id AC0A2AF970FA64ACEA6D;
 Thu,  1 Aug 2019 21:19:36 +0800 (CST)
Received: from DGGEMI524-MBX.china.huawei.com ([169.254.7.227]) by
 dggemi402-hub.china.huawei.com ([10.3.17.135]) with mapi id 14.03.0439.000;
 Thu, 1 Aug 2019 21:19:28 +0800
From: chengzhihao <chengzhihao1@huawei.com>
To: Richard Weinberger <richard@nod.at>
Subject: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlOWkjTogW1BBVENIIFJGQ10gdWJpOiB1Ymlf?=
 =?utf-8?B?d2xfZ2V0X3BlYjogUmVwbGFjZSBhIGxpbWl0ZWQgbnVtYmVyIG9mIGF0dGVt?=
 =?utf-8?Q?pts_with_polling_while_getting_PEB?=
Thread-Topic: =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRDSCBSRkNdIHViaTogdWJpX3dsX2dldF9w?=
 =?utf-8?B?ZWI6IFJlcGxhY2UgYSBsaW1pdGVkIG51bWJlciBvZiBhdHRlbXB0cyB3aXRo?=
 =?utf-8?Q?_polling_while_getting_PEB?=
Thread-Index: AQHVSEkuRooM7Daz00mNhjuG43MDw6bmAggAJrEe1mz+ynmUUMDzNiElvw0MLiA=
Date: Thu, 1 Aug 2019 13:19:28 +0000
Message-ID: <0B80F9D4116B2F4484E7279D5A66984F7A8ACF@dggemi524-mbx.china.huawei.com>
References: <1564651065-4585-1-git-send-email-chengzhihao1@huawei.com>
 <0B80F9D4116B2F4484E7279D5A66984F7A8A13@dggemi524-mbx.china.huawei.com>
 <1515821930.55881.1564651254907.JavaMail.zimbra@nod.at>
 <0B80F9D4116B2F4484E7279D5A66984F7A8A3A@dggemi524-mbx.china.huawei.com>
 <699614206.55882.1564652413789.JavaMail.zimbra@nod.at>
In-Reply-To: <699614206.55882.1564652413789.JavaMail.zimbra@nod.at>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.177.224.82]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_061941_724966_8FFFA5C9 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "zhangyi \(F\)" <yi.zhang@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SSBoYXZlIHRlc3RlZCB0aGlzIGV4dHJlbWUgY2FzZShObyBmcmVlIFBFQnMgbGVmdCBhZnRlciBj
cmVhdGluZyB0ZXN0IHZvbHVtZXMpIG9uIGRpZmZlcmVudCB0eXBlIG9mIG1hY2hpbmVzIGZvciAx
MDAgdGltZXMuIFRoZSBiaWdnZXN0IG51bWJlciBvZiBhdHRlbXB0cyBhcmUgc2hvd24gYmVsb3c6
DQoNCiAgICAgICAgICAgeDg2XzY0ICAgICBhcm02NA0KMi1jb3JlICAgICAgICA0ICAgICAgICAg
NA0KNC1jb3JlICAgICAgICA4ICAgICAgICAgNA0KOC1jb3JlICAgICAgICA0ICAgICAgICAgNA0K
DQpTbywgc2V0dGluZyB0aGUgbnVtYmVyIG9mIGF0dGVtcHRzIHRvIDEwIGlzIGZpbmUuIE1heSBJ
IHNlbmQgYW5vdGhlciBQQVRDSCB0byBpbXByb3ZlIGl0Pw0KDQpQbGFubmVkIHJldmlzaW9uczoN
Ci0tLSBhL2RyaXZlcnMvbXRkL3ViaS9mYXN0bWFwLXdsLmMNCisrKyBiL2RyaXZlcnMvbXRkL3Vi
aS9mYXN0bWFwLXdsLmMNCkBAIC0yMjEsMTIgKzIyMSwxMiBAQCBpbnQgdWJpX3dsX2dldF9wZWIo
c3RydWN0IHViaV9kZXZpY2UgKnViaSkNCiANCiAgICAgICAgaWYgKHBvb2wtPnVzZWQgPT0gcG9v
bC0+c2l6ZSkgew0KICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZ1YmktPndsX2xvY2spOw0K
LSAgICAgICAgICAgICAgIGlmIChyZXRyaWVkKSB7DQorICAgICAgICAgICAgICAgcmV0cmllZCsr
Ow0KKyAgICAgICAgICAgICAgIGlmIChyZXRyaWVkID09IDEwKSB7DQogICAgICAgICAgICAgICAg
ICAgICAgICB1YmlfZXJyKHViaSwgIlVuYWJsZSB0byBnZXQgYSBmcmVlIFBFQiBmcm9tIHVzZXIg
V0wgcG9vbCIpOw0KICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gLUVOT1NQQzsNCiAgICAg
ICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Ow0KICAgICAgICAgICAgICAgIH0NCi0gICAgICAg
ICAgICAgICByZXRyaWVkID0gMTsNCiAgICAgICAgICAgICAgICB1cF9yZWFkKCZ1YmktPmZtX2Vi
YV9zZW0pOw0KICAgICAgICAgICAgICAgIHJldCA9IHByb2R1Y2VfZnJlZV9wZWIodWJpKTsNCiAg
ICAgICAgICAgICAgICBpZiAocmV0IDwgMCkgew0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrl
j5Hku7bkuro6IFJpY2hhcmQgV2VpbmJlcmdlciBbbWFpbHRvOnJpY2hhcmRAbm9kLmF0XSANCuWP
kemAgeaXtumXtDogMjAxOeW5tDjmnIgx5pelIDE3OjQwDQrmlLbku7bkuro6IGNoZW5nemhpaGFv
IDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4NCuaKhOmAgTogemhhbmd5aSAoRikgPHlpLnpoYW5n
QGh1YXdlaS5jb20+OyBsaW51eC1tdGQgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPjsg
bGludXgta2VybmVsIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPg0K5Li76aKYOiBSZTog
562U5aSNOiDnrZTlpI06IFtQQVRDSCBSRkNdIHViaTogdWJpX3dsX2dldF9wZWI6IFJlcGxhY2Ug
YSBsaW1pdGVkIG51bWJlciBvZiBhdHRlbXB0cyB3aXRoIHBvbGxpbmcgd2hpbGUgZ2V0dGluZyBQ
RUINCg0KLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQ0KPj4gRG8geW91IGhhdmUgbnVt
YmVycyBob3cgbWFueSBhdHRlbXB0cyB3ZXJlIG5lZWRlZCB0byBnZXQgYSBmcmVlIGJsb2NrPw0K
PiBJIHRlc3RlZCBpdCBkb3plbnMgb2YgdGltZXMuIFRoZSBiaWdnZXN0IG51bWJlciBvZiBhdHRl
bXB0cyBJJ3ZlIGV2ZXIgDQo+IGhhZCBzbyBmYXIgaXMgNi4gSW4gbW9zdCBjYXNlcywgaXQgb25s
eSB0YWtlcyAyIG9yIDMgdGltZXMuDQoNClNvIHJhaXNpbmcgdGhlIHJldHJ5IGNvdW50IHRvLCBs
ZXQncyBzYXksIDEwIHdvdWxkIHdvcmsgdG9vPw0KSGF2aW5nIGl0IHVuYm91bmQgZmVlbHMgZGFu
Z2Vyb3VzIGJlY2F1c2UgaXQgbWF5IGhpZGUgb3RoZXIgcHJvYmxlbXMuDQoNClRoYW5rcywNCi8v
cmljaGFyZA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
