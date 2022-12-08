Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6721BC3A5A7
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 11:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRXOeki1eznKH/HZ9NK8ZnIfQItQjprQjqLkXlUkECo=; b=v/CkEsZ4rGQjjQ
	7JtYulITtJaLvYjD4/SMF06Lg/SYMDq9FXUSJVtX4T/e5xbB3ugAPoNSYca3v4acdBYvRDktlpPG8
	Rp0HRXF1f/gaXc4isY/94L26cEPDoSzGV3EyGwBh6hpn/VM02GbvfdgXKVX3wzAmnOXI5CNWwYn4G
	gTpVnwQrOYZISkxGdSkZqrm/QccgAUb2+FN8jQ6Aw83NuJX4UB+qpT/LyPSKRu65sGedAWUtGUBNc
	fKB/BxHPbVYzdMFYxA8R7e4mttv05mLWVvEsuauOYqIomxB3KAGDsyIDG/pW12MeBi2mVym6K2U7G
	8bNKRg/4eQXicV9zg4VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3F2o-00F8jZ-Gp; Thu, 08 Dec 2022 11:26:26 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3F2l-00F8JZ-1H
	for linux-mtd@lists.infradead.org; Thu, 08 Dec 2022 11:26:25 +0000
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NSWwN1HGBzJp8s;
	Thu,  8 Dec 2022 19:22:44 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Dec 2022 19:26:15 +0800
Message-ID: <4c39f759-553f-bd73-46e8-384d52be450c@huawei.com>
Date: Thu, 8 Dec 2022 19:26:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] mtd: parsers: Fix potential memory leak in
 mtd_parser_tplink_safeloader_parse()
To: Dan Carpenter <error27@gmail.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<rafal@milecki.pl>, <linux-mtd@lists.infradead.org>
References: <20221208083859.122622-1-yuancan@huawei.com>
 <Y5Gv3Gz52ILDMpWg@kadam>
From: Yuan Can <yuancan@huawei.com>
In-Reply-To: <Y5Gv3Gz52ILDMpWg@kadam>
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_032623_289187_3F5EDF44 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

CuWcqCAyMDIyLzEyLzggMTc6MzUsIERhbiBDYXJwZW50ZXIg5YaZ6YGTOgo+IE9uIFRodSwgRGVj
IDA4LCAyMDIyIGF0IDA4OjM4OjU5QU0gKzAwMDAsIFl1YW4gQ2FuIHdyb3RlOgo+PiBUaGUgcGFy
dHMgbmVlZHMgdG8gYmUgZnJlZWQgd2l0aCBhbGwgaXRzIGVsZW1lbnRzLCBvdGhlcndpc2UgaXQg
d2lsbCBiZQo+PiBsZWFrZWQuCj4+Cj4+IEZpeGVzOiAwMGEzNTg4MDg0YmUgKCJtdGQ6IHBhcnNl
cnM6IGFkZCBUUC1MaW5rIFNhZmVMb2FkZXIgcGFydGl0aW9ucyB0YWJsZSBwYXJzZXIiKQo+PiBT
aWduZWQtb2ZmLWJ5OiBZdWFuIENhbiA8eXVhbmNhbkBodWF3ZWkuY29tPgo+PiAtLS0KPj4gICBk
cml2ZXJzL210ZC9wYXJzZXJzL3RwbGlua19zYWZlbG9hZGVyLmMgfCAxICsKPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3Bh
cnNlcnMvdHBsaW5rX3NhZmVsb2FkZXIuYyBiL2RyaXZlcnMvbXRkL3BhcnNlcnMvdHBsaW5rX3Nh
ZmVsb2FkZXIuYwo+PiBpbmRleCBmNjAxZTdiZDg2MjcuLjg2MDMzOTQ2MTkwNSAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy9tdGQvcGFyc2Vycy90cGxpbmtfc2FmZWxvYWRlci5jCj4+ICsrKyBiL2Ry
aXZlcnMvbXRkL3BhcnNlcnMvdHBsaW5rX3NhZmVsb2FkZXIuYwo+PiBAQCAtMTE4LDYgKzExOCw3
IEBAIHN0YXRpYyBpbnQgbXRkX3BhcnNlcl90cGxpbmtfc2FmZWxvYWRlcl9wYXJzZShzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCwKPj4gICBlcnJfZnJlZToKPj4gICAJZm9yIChpZHggLT0gMTsgaWR4ID49
IDA7IGlkeC0tKQo+PiAgIAkJa2ZyZWUocGFydHNbaWR4XS5uYW1lKTsKPj4gKwlrZnJlZShwYXJ0
cyk7Cj4+ICAgZXJyX291dDoKPiBUaGlzIHN0aWxsIGxlYXZlcyBhIGxlYWsgaWYgbXRkX3BhcnNl
cl90cGxpbmtfc2FmZWxvYWRlcl9yZWFkX3RhYmxlKCkKPiBmYWlscy4gIENyZWF0ZSBhIG5ldyBs
YWJlbCBhbmQgdXBkYXRlIHRoZSBnb3RvLgo+Cj4gZXJyX2ZyZWU6Cj4gICAJZm9yIChpZHggLT0g
MTsgaWR4ID49IDA7IGlkeC0tKQo+ICAgCQlrZnJlZShwYXJ0c1tpZHhdLm5hbWUpOwo+IGVycl9m
cmVlX3BhcnRzOgo+IAlrZnJlZShwYXJ0cyk7Cj4gZXJyX291dDoKPiAJcmV0dXJuIGVycjsKVGhh
bmtzIGZvciBwb2ludGluZyBvdXQgdGhpcyEgd2lsbCBiZSBmaXhlZCBpbiB0aGUgbmV4dCB2ZXJz
aW9uLgoKLS0gCkJlc3QgcmVnYXJkcywKWXVhbiBDYW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
