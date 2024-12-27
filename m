Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB70E77188
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Dec 2024 01:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqVE/Yjp8FiQdGPlxaXsDI4mjDCsWMONEVUupHQ1ino=; b=Nh8VEq5Z+KH+AD/nIXJEgW7SG6
	0Nr/lduKmbXMP++Med8ky5jUJPa9gmWv0KIunnVaTv9jdEI0lyebR+O/mvsLN/wfT0cOEpJV55uLz
	usGnPGa45az7McyBr3MNxYp3CxLqcAqZ6y0wjD9bIsKx6p7GRQd7BXbeNdGwtSnRA3i4GEF7Ee2iI
	diadneuCSz99/aOs5tIruChV5IkQE96aBJ5YYOUyfxoEwQdzFIkGFEZUaPuY8b/3pVVrdEXTsIXcf
	hpw4lyKDOH8Mtpc8nmrHQCtaNe3m8NmqBGEyyLXrKs9sTdLJTeGngumke8Imsp6prmlnIDOYW1DzT
	cby/nDJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQzd1-0000000Gqqx-3A5B;
	Fri, 27 Dec 2024 01:59:03 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQzcy-0000000Gqq4-0LiY
	for linux-mtd@lists.infradead.org;
	Fri, 27 Dec 2024 01:59:01 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4YK7qX2Md1z1W348
	for <linux-mtd@lists.infradead.org>; Fri, 27 Dec 2024 09:55:20 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 27187180A9E
	for <linux-mtd@lists.infradead.org>; Fri, 27 Dec 2024 09:58:46 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Dec 2024 09:58:45 +0800
Subject: Re: [PATCH mtd-utils] nand-utils: fix integer overflow in nftldump.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241226134600.72548-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e7802531-c061-949a-c858-798eb2270db1@huawei.com>
Date: Fri, 27 Dec 2024 09:58:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241226134600.72548-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_175900_287111_C7C0018B 
X-CRM114-Status: GOOD (  15.54  )
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

5ZyoIDIwMjQvMTIvMjYgMjE6NDYsIEFudG9uIE1vcnlha292IOWGmemBkzoKPiBSZXBvcnQgb2Yg
dGhlIHN0YXRpYyBhbmFseXplcjoKPiBUaGUgdmFsdWUgb2YgYW4gYXJpdGhtZXRpYyBleHByZXNz
aW9uICdpICogbWVtaW5mby5lcmFzZXNpemUnIGlzIGEgc3ViamVjdCB0byBvdmVyZmxvdyBiZWNh
dXNlIGl0cyBvcGVyYW5kcyBhcmUgbm90IGNhc3QgdG8gYSBsYXJnZXIgZGF0YSB0eXBlIGJlZm9y
ZSBwZXJmb3JtaW5nIGFyaXRobWV0aWMKPiAKPiBDb3JyZWN0aW9ucyBleHBsYWluZWQ6Cj4gb25l
IG9mIHRoZSBvcGVyYW5kcyB3YXMgY2FzdCB0byBhIHdpZGVyIHR5cGUsIHN1Y2ggYXMgdW5zaWdu
ZWQgbG9uZyBsb25nLCB0byBleHBhbmQgdGhlIHJhbmdlIG9mIHBvc3NpYmxlIHZhbHVlcyDigIvi
gIthbmQgYXZvaWQgb3ZlcmZsb3cKPiAKPiBUcmlnZ2VycyBmb3VuZCBieSBzdGF0aWMgYW5hbHl6
ZXIgU3ZhY2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50b24gTW9yeWFrb3YgPGFudC52Lm1vcnlh
a292QGdtYWlsLmNvbT4KPiAKPiAtLS0KPiAgIG5hbmQtdXRpbHMvbmZ0bGR1bXAuYyB8IDIgKy0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9uYW5kLXV0aWxzL25mdGxkdW1wLmMgYi9uYW5kLXV0aWxzL25mdGxkdW1wLmMK
PiBpbmRleCAzMDMzMmZlLi42OTY0ZDJjIDEwMDY0NAo+IC0tLSBhL25hbmQtdXRpbHMvbmZ0bGR1
bXAuYwo+ICsrKyBiL25hbmQtdXRpbHMvbmZ0bGR1bXAuYwo+IEBAIC0xMjQsNyArMTI0LDcgQEAg
c3RhdGljIHZvaWQgZHVtcF9lcmFzZV91bml0cyh2b2lkKQo+ICAgCWZvciAoaSA9IE1lZEhlYWRb
MF0uRmlyc3RQaHlzaWNhbEVVTjsgaSA8IE1lZEhlYWRbMF0uRmlyc3RQaHlzaWNhbEVVTiArCj4g
ICAJCQlNZWRIZWFkWzBdLk51bUVyYXNlVW5pdHM7IGkrKykgewo+ICAgCQkvKiBGb3IgZWFjaCBF
cmFzZSBVbml0ICovCj4gLQkJb2ZzID0gaSAqIG1lbWluZm8uZXJhc2VzaXplOwo+ICsJCW9mcyA9
ICh1bnNpZ25lZCBsb25nIGxvbmcpaSAqIG1lbWluZm8uZXJhc2VzaXplOwoKVGhpcyBwcm9ncmVh
bSBwYXJzZXMgaW5mb3JtYXRpb24gZnJvbSBtdGQgaW4gdGhlIDMyLWJpdCB3YXkoZWcuIApNRU1S
RUFET09CIHJhdGhlciB0aGFuIE1FTVJFQURPT0IpLCB3aGljaCBtZWFucyB0aGF0IHRoZSB0b3Rh
bCBzaXplIG9mIAp0aGUgc3VwcG9ydGVkIG10ZCBkZXZpY2UgaXMgc21hbGxlciB0aGFuIDJeMzIs
IHNvIEkgdGhpbmsgdGhlIG92ZXJmbG93IAp3b24ndCBoYXBwZW4uCj4gICAKPiAgIAkJLyogcmVh
ZCB0aGUgVW5pdCBDb250cm9sIEluZm9ybWF0aW9uICovCj4gICAJCWZvciAoaiA9IDA7IGogPCAz
OyBqKyspIHsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
