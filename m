Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29240CF6491
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Sep 2024 01:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3RC159zNFm6LmU5rESDHj6YNYOyb9FyjeEP6Xe05og=; b=vs3xB4jB3D/0Dsct8aRkWd5gOI
	J2WtmV8GKwReb/OOnUCYHu0G41+xp32MYptuqeunEUmSGLCgPK98L9h5r4LdpkouHmzw7Y/uM3gwd
	wkufQ3PuVr6Sd2Jsri3MSRlGdCQW5GHoiU1A5MxHhlUtNiJkJs5em1BKx2ZWAuMZX/zwOBEaJS40B
	MFjgOkTed3DUx34hWtHmQ2oNNsMnxeAmX13uu5BQoiDWkAGLKoh7YQaj6CR2Fp5thbNyAx/n04wcw
	cvPCHCM7l5dmhckQdDMqfFAMGpiYInRMwoFDn3hmBIDFKdkbwLsRm/T0Rk1ajByKtu2U7T2eoVf9z
	Lpru4Kvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suiY0-0000000Dtpb-1CW5;
	Sun, 29 Sep 2024 01:16:28 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suiXw-0000000DtoD-2VNX
	for linux-mtd@lists.infradead.org;
	Sun, 29 Sep 2024 01:16:27 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4XGR8w3rJ7zFqyP;
	Sun, 29 Sep 2024 09:15:44 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id F3CBF140133;
	Sun, 29 Sep 2024 09:16:09 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 29 Sep 2024 09:16:09 +0800
Subject: Re: [PATCH RESEND] ubifs: xattr: remove unused anonymous enum
To: <pascal.eberhard@gmail.com>, Richard Weinberger <richard@nod.at>
CC: <miquel.raynal@bootlin.com>, Pascal Eberhard <pascal.eberhard@se.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240927145757.347630-1-pascal.eberhard@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f6cbf88c-733d-95a1-c959-b2045b9edea8@huawei.com>
Date: Sun, 29 Sep 2024 09:16:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240927145757.347630-1-pascal.eberhard@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_181624_927748_8C747019 
X-CRM114-Status: GOOD (  11.11  )
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

1NogMjAyNC85LzI3IDIyOjU3LCBwYXNjYWwuZWJlcmhhcmRAZ21haWwuY29tINC0tcA6Cj4gRnJv
bTogUGFzY2FsIEViZXJoYXJkIDxwYXNjYWwuZWJlcmhhcmRAc2UuY29tPgo+IAo+IGNvbW1pdCAy
Yjg4ZmMyMWNhZTkgKCJ1YmlmczogU3dpdGNoIHRvIGdlbmVyaWMgeGF0dHIgaGFuZGxlcnMiKSBy
ZW1vdmVzCj4gdXNhZ2Ugb2YgdGhpcyBhbm9ueW1vdXMgZW51bS4gRGVsZXRlIHRoZSBlbnVtIGFz
IHdlbGwuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGFzY2FsIEViZXJoYXJkIDxwYXNjYWwuZWJlcmhh
cmRAc2UuY29tPgo+IC0tLQo+ICAgZnMvdWJpZnMveGF0dHIuYyB8IDEzIC0tLS0tLS0tLS0tLS0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMyBkZWxldGlvbnMoLSkKPiAKClJldmlld2VkLWJ5OiBaaGlo
YW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IGRpZmYgLS1naXQgYS9mcy91Ymlm
cy94YXR0ci5jIGIvZnMvdWJpZnMveGF0dHIuYwo+IGluZGV4IDNkYjg0ODZlMzcyNS4uMzI5Mjdi
Zjk4MzA2IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL3hhdHRyLmMKPiArKysgYi9mcy91Ymlmcy94
YXR0ci5jCj4gQEAgLTQ4LDE5ICs0OCw2IEBACj4gICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+
ICAgI2luY2x1ZGUgPGxpbnV4L3hhdHRyLmg+Cj4gICAKPiAtLyoKPiAtICogRXh0ZW5kZWQgYXR0
cmlidXRlIHR5cGUgY29uc3RhbnRzLgo+IC0gKgo+IC0gKiBVU0VSX1hBVFRSOiB1c2VyIGV4dGVu
ZGVkIGF0dHJpYnV0ZSAoInVzZXIuKiIpCj4gLSAqIFRSVVNURURfWEFUVFI6IHRydXN0ZWQgZXh0
ZW5kZWQgYXR0cmlidXRlICgidHJ1c3RlZC4qKQo+IC0gKiBTRUNVUklUWV9YQVRUUjogc2VjdXJp
dHkgZXh0ZW5kZWQgYXR0cmlidXRlICgic2VjdXJpdHkuKiIpCj4gLSAqLwo+IC1lbnVtIHsKPiAt
CVVTRVJfWEFUVFIsCj4gLQlUUlVTVEVEX1hBVFRSLAo+IC0JU0VDVVJJVFlfWEFUVFIsCj4gLX07
Cj4gLQo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbm9kZV9vcGVyYXRpb25zIGVtcHR5X2lvcHM7
Cj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBlbXB0eV9mb3BzOwo+ICAg
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
