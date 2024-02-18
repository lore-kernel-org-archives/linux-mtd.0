Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACD5C48BC4
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Feb 2024 02:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsNLHV6ZiU28CwNnjgOFLg0EU0HJyDI48nuOpCed87I=; b=IHNF2I4JtDqfmPHFBTCOte15Wj
	k70ZzXs074GahN5Z9uD8eB6/iaclYjp/tAFJW6LixoMhYT4JpZ+E25ha13b6RBLj2qhWUOIHWi/GK
	bM97FZJJXi5c5+zQvRfQ7mhZ6F9ECgI6YlcazR0qbIGaN26w4NL7TbuONS/UqHr6MFd55Tp9XdDuq
	PhFv8auvgYca4K1aiwoeya9OckkvrrLN1lQ6K0KIb60G4RAwcbXK5qrtlvYEpZDIn7wdb3G2wwgsB
	6dVObGAHA+uMcdlStmWBfIOAigMMrB+WOZmfS/aANbV0dacMBZokGiiWE/S1C6yw7q8lBFtUTEjCI
	HyKsqwgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbWzy-00000006pEe-1Uef;
	Sun, 18 Feb 2024 02:33:46 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbWzu-00000006pBK-0Jg0
	for linux-mtd@lists.infradead.org;
	Sun, 18 Feb 2024 02:33:43 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TcqSj2TRzz1xmkD;
	Sun, 18 Feb 2024 10:32:21 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 546CF1400CC;
	Sun, 18 Feb 2024 10:33:40 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 18 Feb 2024 10:33:38 +0800
Subject: Re: [PATCH 14/17] ubiblock: pass queue_limits to blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
CC: Richard Weinberger <richard@nod.at>, Anton Ivanov
	<anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>,
	Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>, Josef
 Bacik <josef@toxicpanda.com>, Geoff Levand <geoff@infradead.org>, Ilya
 Dryomov <idryomov@gmail.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack
 Wang <jinpu.wang@ionos.com>, Ming Lei <ming.lei@redhat.com>, Maxim Levitsky
	<maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
	<linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<ceph-devel@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-s390@vger.kernel.org>
References: <20240215070300.2200308-1-hch@lst.de>
 <20240215070300.2200308-15-hch@lst.de>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <6b559ea2-944e-c5f6-f7ce-1119c5369a48@huawei.com>
Date: Sun, 18 Feb 2024 10:33:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240215070300.2200308-15-hch@lst.de>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_183342_345204_96E8C16C 
X-CRM114-Status: GOOD (  14.72  )
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

1NogMjAyNC8yLzE1IDE1OjAyLCBDaHJpc3RvcGggSGVsbHdpZyDQtLXAOgo+IFBhc3MgdGhlIGZl
dyBsaW1pdHMgdWJpYmxvY2sgaW1wb3NlcyBkaXJlY3RseSB0byBibGtfbXFfYWxsb2NfZGlzawo+
IGluc3RlYWQgb2Ygc2V0dGluZyB0aGVtIG9uZSBhdCBhIHRpbWUuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gICBkcml2ZXJzL210ZC91
YmkvYmxvY2suYyB8IDYgKysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8x
QGh1YXdlaS5jb20+Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jIGIv
ZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMKPiBpbmRleCA5YmU4N2MyMzFhMmViYS4uNWM4ZmRjYzA4
OGEwZGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMKPiArKysgYi9kcml2
ZXJzL210ZC91YmkvYmxvY2suYwo+IEBAIC0zNDgsNiArMzQ4LDkgQEAgc3RhdGljIGludCBjYWxj
X2Rpc2tfY2FwYWNpdHkoc3RydWN0IHViaV92b2x1bWVfaW5mbyAqdmksIHU2NCAqZGlza19jYXBh
Y2l0eSkKPiAgIAo+ICAgaW50IHViaWJsb2NrX2NyZWF0ZShzdHJ1Y3QgdWJpX3ZvbHVtZV9pbmZv
ICp2aSkKPiAgIHsKPiArCXN0cnVjdCBxdWV1ZV9saW1pdHMgbGltID0gewo+ICsJCS5tYXhfc2Vn
bWVudHMJCT0gVUJJX01BWF9TR19DT1VOVCwKPiArCX07Cj4gICAJc3RydWN0IHViaWJsb2NrICpk
ZXY7Cj4gICAJc3RydWN0IGdlbmRpc2sgKmdkOwo+ICAgCXU2NCBkaXNrX2NhcGFjaXR5Owo+IEBA
IC0zOTMsNyArMzk2LDcgQEAgaW50IHViaWJsb2NrX2NyZWF0ZShzdHJ1Y3QgdWJpX3ZvbHVtZV9p
bmZvICp2aSkKPiAgIAo+ICAgCj4gICAJLyogSW5pdGlhbGl6ZSB0aGUgZ2VuZGlzayBvZiB0aGlz
IHViaWJsb2NrIGRldmljZSAqLwo+IC0JZ2QgPSBibGtfbXFfYWxsb2NfZGlzaygmZGV2LT50YWdf
c2V0LCBOVUxMLCBkZXYpOwo+ICsJZ2QgPSBibGtfbXFfYWxsb2NfZGlzaygmZGV2LT50YWdfc2V0
LCAmbGltLCBkZXYpOwo+ICAgCWlmIChJU19FUlIoZ2QpKSB7Cj4gICAJCXJldCA9IFBUUl9FUlIo
Z2QpOwo+ICAgCQlnb3RvIG91dF9mcmVlX3RhZ3M7Cj4gQEAgLTQxNiw3ICs0MTksNiBAQCBpbnQg
dWJpYmxvY2tfY3JlYXRlKHN0cnVjdCB1Ymlfdm9sdW1lX2luZm8gKnZpKQo+ICAgCWRldi0+Z2Qg
PSBnZDsKPiAgIAo+ICAgCWRldi0+cnEgPSBnZC0+cXVldWU7Cj4gLQlibGtfcXVldWVfbWF4X3Nl
Z21lbnRzKGRldi0+cnEsIFVCSV9NQVhfU0dfQ09VTlQpOwo+ICAgCj4gICAJbGlzdF9hZGRfdGFp
bCgmZGV2LT5saXN0LCAmdWJpYmxvY2tfZGV2aWNlcyk7Cj4gICAKPiAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
