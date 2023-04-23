Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296D5C77B73
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Apr 2023 09:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Lt1/IakhgHDiuYeTLr1nsZOCSiAinRW9ac5NWGAqr4=; b=SYd/zTssqSysLFQ9lmyAme9Qyy
	DUL0igTN720F4tVz110z+mO6Bmy2rZIxvoVL14JRkaS3EG0vEtpOs+sHnUB2E65SDlwkbp2pDWPia
	PBxvQg2R8Z4n3EpWh4D2NB93x5AbcAJWqEYfRldPfwdDzulubU4bn8E8cgrOADPZ3yiRHKhRFD5bz
	TyP91zeQRjX/0c5obAevKQDVv9O8gW/ALo2Uhzh0dIUK8hxoAwy2KkvV0XzaSsMP5+Nt3lBydWOYq
	lc74fA0QRBttUL/VFNF3DeT9HRDBXk02vmB75hAr1SjceDlR2yWfIB0kLrwGndRbsPeaLhEVbhD7t
	VX5yYoDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqVmk-00Dwk6-1Y;
	Sun, 23 Apr 2023 09:13:30 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqVmg-00Dwim-2N
	for linux-mtd@lists.infradead.org;
	Sun, 23 Apr 2023 09:13:28 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Q42Wt2yv7zndg5;
	Sun, 23 Apr 2023 17:09:30 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 23 Apr 2023 17:13:18 +0800
Subject: Re: BUG: divide error in ubi_attach_mtd_dev
To: Richard Weinberger <richard@nod.at>
CC: Yu Hao <yhao016@ucr.edu>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd
	<linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
References: <CA+UBctD_w=75wChmePZHp7KsBSNPWYGDBtzHPRPPtaFoqhGvXA@mail.gmail.com>
 <687864524.118195.1681799447034.JavaMail.zimbra@nod.at>
 <ff419c45-7d76-0219-a598-f6f4d081e29c@huawei.com>
 <CA+UBctBVHouL-3rM3zKYLpk01fXFvCpBnU7EpSRVdGW7cEjcJQ@mail.gmail.com>
 <977347543.226888.1682011999468.JavaMail.zimbra@nod.at>
 <CA+UBctA4fSbSdooQ9q9fwNuaHb_PnkfFuqJ7Q5vii-3-uCiUjw@mail.gmail.com>
 <412779912.228444.1682023015809.JavaMail.zimbra@nod.at>
 <ed510d18-47f1-7f46-03dd-84e043cab6d9@huawei.com>
 <1366603418.245114.1682236940160.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <951e4cf7-a0ea-b3ec-931d-e6a394ddc2ab@huawei.com>
Date: Sun, 23 Apr 2023 17:13:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1366603418.245114.1682236940160.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_021326_946716_3F716C2C 
X-CRM114-Status: GOOD (  10.59  )
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

5ZyoIDIwMjMvNC8yMyAxNjowMiwgUmljaGFyZCBXZWluYmVyZ2VyIOWGmemBkzoKPiAtLS0tLSBV
cnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZvbjogImNoZW5nemhpaGFvMSIgPGNoZW5nemhp
aGFvMUBodWF3ZWkuY29tPgo+Pj4+IHJvb3RAc3l6a2FsbGVyOn4jIGNhdCAvcHJvYy9tdGQKPj4+
PiBkZXY6ICAgIHNpemUgICBlcmFzZXNpemUgIG5hbWUKPj4+PiBtdGQwOiAwMDAyMDAwMCAwMDAw
MTAwMCDigJxtdGRyYW0gdGVzdCBkZXZpY2XigJ0KPj4+Cj4+PiBIbW0sIG10ZHJhbSBzaG91bGQg
YmUgZmluZSwgZXJhc2VzaXplIGlzIG5vdCB6ZXJvLgo+Pj4KPj4KPj4gSSBndWVzcyB0aGUgemVy
by1lcmFzZXNpemUgbXRkIGRldmljZSBpcyBkeW5hbWljYWxseSBnZW5lcmF0ZWQgaW4KPj4gcnVu
dGltZSwgYWZ0ZXIgbG9va2luZyB0aHJvdWdoIHRoZSBjb2RlLCBJIGZpbmQgZXJhc2VzaXplIGlz
Cj4+IGluaXRpYWxsaXplZCBpbiBzcGVjaWZpYyBmbGFzaCBkcml2ZXIgYW5kIGl0IHdvbid0IGJl
IHVwZGF0ZWQgbGF0ZXIoZWcuCj4+IGlvY3RsXHN5c2N0bCkuIEFuZCBzb21lIG10ZCBkZXZpY2Vz
IG1heSBoYXZlIHplcm8gZXJhc2VzaXplLCBlZy4KPj4gZHJpdmVycy9tdGQvZGV2aWNlcy9tY2hw
MjNrMjU2LmNbMV0uIFVuZm9ydHVuYXRlbHksIEkgZG9uJ3Qga25vdyBob3cgdG8KPj4gbG9hZC9z
aW11bGF0ZSB0aGlzIG10ZCwgbWF5YmUgaXQgcmVxdWlyZXMgYSByZWFsIGRldmljZT8gSWYgd2Ug
bG9hZCB0aGlzCj4+IG10ZCBkZXZpY2UgYXMgdWJpLCBpdCB3aWxsIHRyaWdnZXIgdGhlIHByb2Js
ZW0/Cj4gCj4gSW5kZWVkLiBJIGd1ZXNzIHFlbXUgY2FuIGVtdWxhdGUgc3VjaCBjaGlwcy4KPiBT
byBiZXR0ZXIgZml4IFVCSSB0byByZWplY3QgYXR0YWNoaW5nIG9mIG10ZCdzIHdpdGggZXJhc2Vz
aXplIGJlaW5nIDAuCj4gKFBsZWFzZSBub3RlLCB3ZSBjYW5ub3QgdGVzdCBmb3IgTVREX05PX0VS
QVNFLCB0aGlzIG9uZSBtZWFucyB0aGVyZSBpcyBubwo+IGVyYXNlIG1ldGhvZCkuCgpQaHJhbSBp
cyBhbiBleGNlcHRpb24sIGl0IGhhcyBlcmFzZSBmdW5jdGlvbiBidXQgaXMgc2V0IGZsYWcgCidN
VERfQ0FQX1JBTScuIE1heSBJIGludGVycHJldCAnTVREX05PX0VSQVNFJyBhcyBlcmFzZSBmdW5j
dGlvbiBpcyBub3QgCm5lY2Vzc2FyeT8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
