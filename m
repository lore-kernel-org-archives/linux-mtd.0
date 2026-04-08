Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1295FD5F80
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Apr 2026 06:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQ13W3/a9H/arGAtc59AlNeTxUbPVFyBnd/JtBWuZJ8=; b=Ozw5xOG1VLXJi+nIo4PXG4uRX9
	cNV59mvTojS0bE96KvdBxdwADk4v6OQkFrC26sxRTAdwdPiWklAZxT6Eqa7dQ1DPaT/na6lZ4foQp
	knivUe4NUIHHY/klkb3ugeW3oX96l0MyKzSxtJTADcG+aENGz2iU+KYNHL+3u1U7nW0i9Lj98L3+E
	2ZniUuSoHxsq7K2P64FDMu+E825U4NZVN5YjTTwuU8pUF5zRANogUYUnU1hAMLvIxgZXmKGLncY4X
	OxL46yfYNL159tEjQPanZ36DW1omYKBxQBxVlgzoEccEdTOBNAhbcGmV0Yw+pzFyvHGFI4zCraQPz
	za2ER1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAM6W-00000008K6j-0iLz;
	Wed, 08 Apr 2026 06:09:32 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAM6R-00000008K5u-1eyX
	for linux-mtd@lists.infradead.org;
	Wed, 08 Apr 2026 06:09:29 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MTwi3/64T7o04Xd907QjbicznGuQS5p3hTFHxw5Kinc=;
	b=s8fjsLhW44jIawsytVxr7xrDsp0JVbb7J7wdMzjjVtlgPYnqt1lZbi/mDpkCt+q4dtoFD3bds
	3qPkMseULxQeHP3OldI06QAOC9GSRWTVhoWYy0PNnBEs6ZMRM9RVGtW/7Fb5YUPDIJ0gY5Rjcya
	MGavtk9oSmD+ui0ltIMQKf0=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4frCCp1Jbqz1cyVm;
	Wed,  8 Apr 2026 14:03:02 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 5F40640565;
	Wed,  8 Apr 2026 14:09:15 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 8 Apr 2026 14:09:13 +0800
Subject: Re: [PATCH v3 2/2] ubifs: use strscpy() and kmemdup_nul() where
 appropriate
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <f20e6570-8b71-a6da-8e7f-4d25357c3978@huawei.com>
 <20260407160518.2825450-1-dmantipov@yandex.ru>
 <20260407160518.2825450-2-dmantipov@yandex.ru>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5deffdfa-6a99-8205-1f71-ff1f07ce28d1@huawei.com>
Date: Wed, 8 Apr 2026 14:09:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260407160518.2825450-2-dmantipov@yandex.ru>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_230927_899477_DF9469EC 
X-CRM114-Status: GOOD (  12.58  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNi80LzggMDowNSwgRG1pdHJ5IEFudGlwb3Yg0LS1wDoKPiBHbyBjbG9zZXIgdG8gdGhl
IG1vZGVybiBrZXJuZWwgQVBJIGFuZCB1c2UgJ3N0cnNjcHkoKScgYW5kICdrbWVtZHVwX251bCgp
Jwo+IG92ZXIgYW4gYWQtaG9jIGVuc3VyZS10by1oYXZlLSdcMCcgcXVpcmtzIHdoZXJlIGFwcHJv
cHJpYXRlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBBbnRpcG92IDxkbWFudGlwb3ZAeWFu
ZGV4LnJ1Pgo+IC0tLQo+IHYzOiBmaXggc3Ryc2NweSgpIHVzYWdlIGFzIG5vdGljZWQgYnkgWmhp
aGFvCj4gdjI6IGluaXRpYWwgdmVyc2lvbiB0byBqb2luIHRoZSBzZXJpZXMKPiAtLS0KPiAgIGZz
L3ViaWZzL2pvdXJuYWwuYyB8IDE4ICsrKysrKy0tLS0tLS0tLS0tLQo+ICAgZnMvdWJpZnMvcmVw
bGF5LmMgIHwgIDMgKy0tCj4gICBmcy91Ymlmcy9zdXBlci5jICAgfCAgOCArKy0tLS0tLQo+ICAg
MyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9mcy91Ymlmcy9qb3VybmFsLmMgYi9mcy91Ymlmcy9qb3VybmFsLmMKPiBpbmRl
eCBlMjhhYjQzOTVlNWMuLmI4YzRhYjg5OTBjMiAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9qb3Vy
bmFsLmMKPiArKysgYi9mcy91Ymlmcy9qb3VybmFsLmMKPiBAQCAtNzI5LDggKzcyOSw3IEBAIGlu
dCB1Ymlmc19qbmxfdXBkYXRlKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBjb25zdCBzdHJ1Y3QgaW5v
ZGUgKmRpciwKPiAgIAlkZW50LT5pbnVtID0gZGVsZXRpb24gPyAwIDogY3B1X3RvX2xlNjQoaW5v
ZGUtPmlfaW5vKTsKPiAgIAlkZW50LT50eXBlID0gZ2V0X2RlbnRfdHlwZShpbm9kZS0+aV9tb2Rl
KTsKPiAgIAlkZW50LT5ubGVuID0gY3B1X3RvX2xlMTYoZm5hbWVfbGVuKG5tKSk7Cj4gLQltZW1j
cHkoZGVudC0+bmFtZSwgZm5hbWVfbmFtZShubSksIGZuYW1lX2xlbihubSkpOwo+IC0JZGVudC0+
bmFtZVtmbmFtZV9sZW4obm0pXSA9ICdcMCc7Cj4gKwlzdHJzY3B5KGRlbnQtPm5hbWUsIGZuYW1l
X25hbWUobm0pLCBkZW50LT5ubGVuICsgMSk7CgpUaGUgJ2RlbnQtPm5sZW4nIGlzIGEgbGl0dGxl
IGVuZGlhbiB0eXBlLCBjYW5ub3QgYmUgdXNlZCBkaXJlY3RseS4KPiAgIAlzZXRfZGVudF9jb29r
aWUoYywgZGVudCk7Cj4gICAKPiAgIAl6ZXJvX2RlbnRfbm9kZV91bnVzZWQoZGVudCk7CgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
