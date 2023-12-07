Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E162BC4167B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Dec 2023 02:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lky09/VGWnVO7QSQNK92FBxN58bmj5XD8HUN5rRWqlA=; b=ZAmWf4SWIpxg7QUZp3AnJRLUbu
	fU9CmllfiVDlRGnYkSqmT5MqkLoRgJhfmisIK4smY7/L9PkoYve5yafyzh+3V/3tjEsFMVbRvDcKP
	lI2nHFNDl6eqwDxelQWJt41BwA1cnQTfGTjx2IuDFo3HxE0pWMWzjzDlcAR4HCr6E6ekSpo0k/BII
	X+R5v8JcIMevSf+2Jm6Pr+n4LXjr9o7D+xCralYvJ7eDzlV3Ez4Ygd/5NENW8dAn9nxkuaVLq4f/H
	b4lsGtT/j5tQmrOyLiF1MAmO5KZ0ueHkWP1LHE9gOaEsQISfy/O8j+TRms0nLigJDRem16af3OxRL
	9cQvL0mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB4OL-00BikO-2v;
	Thu, 07 Dec 2023 02:45:33 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB4OG-00BiiT-1b
	for linux-mtd@lists.infradead.org;
	Thu, 07 Dec 2023 02:45:30 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SlzCD1ygPz4f3lDc
	for <linux-mtd@lists.infradead.org>; Thu,  7 Dec 2023 10:45:12 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 08F8D1A08A5
	for <linux-mtd@lists.infradead.org>; Thu,  7 Dec 2023 10:45:17 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP1 (Coremail) with SMTP id cCh0CgCnqxG5MXFllH3QCw--.13955S3;
	Thu, 07 Dec 2023 10:45:16 +0800 (CST)
Subject: Re: [PATCH -next RFC 01/14] block: add some bdev apis
To: Matthew Wilcox <willy@infradead.org>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
 kent.overstreet@gmail.com, joern@lazybastard.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, nico@fluxnic.net, xiang@kernel.org,
 chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
 agruenba@redhat.com, jack@suse.com, konishi.ryusuke@gmail.com,
 akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
 linux-nilfs@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 "yukuai (C)" <yukuai3@huawei.com>
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
 <20231205123728.1866699-2-yukuai1@huaweicloud.com>
 <ZXCMJ9skAAgPm4z3@casper.infradead.org>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <d195aba8-7b89-698f-b7a0-06b87ae01c21@huaweicloud.com>
Date: Thu, 7 Dec 2023 10:45:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ZXCMJ9skAAgPm4z3@casper.infradead.org>
X-CM-TRANSID: cCh0CgCnqxG5MXFllH3QCw--.13955S3
X-Coremail-Antispam: 1UD129KBjvJXoWxuF4Dury5Kr13Aw47Gr4Uurg_yoW5Ar4DpF
	W8KFZ8JrW8Gr18ursrJa15Z3WFg34UJFW5ZrWxG343C3s0yr9akFWYgws0kayIv3yUJFs7
	ZFWjvrW8WF1j9FJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_
	WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjfUojjgUUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_184528_925654_98067C83 
X-CRM114-Status: GOOD (  22.31  )
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

SGksCgrU2iAyMDIzLzEyLzA2IDIyOjU4LCBNYXR0aGV3IFdpbGNveCDQtLXAOgo+IE9uIFR1ZSwg
RGVjIDA1LCAyMDIzIGF0IDA4OjM3OjE1UE0gKzA4MDAsIFl1IEt1YWkgd3JvdGU6Cj4+ICtzdHJ1
Y3QgZm9saW8gKmJkZXZfcmVhZF9mb2xpbyhzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2LCBwZ29m
Zl90IGluZGV4KQo+PiArewo+PiArCXJldHVybiByZWFkX21hcHBpbmdfZm9saW8oYmRldi0+YmRf
aW5vZGUtPmlfbWFwcGluZywgaW5kZXgsIE5VTEwpOwo+PiArfQo+PiArRVhQT1JUX1NZTUJPTF9H
UEwoYmRldl9yZWFkX2ZvbGlvKTsKPiAKPiBJJ20gY29taW5nIHRvIHRoZSBvcGluaW9uIHRoYXQg
J2luZGV4JyBpcyB0aGUgd3JvbmcgcGFyYW1ldGVyIGhlcmUuCj4gTG9va2luZyB0aHJvdWdoIGFs
bCB0aGUgY2FsbGVycyBvZiBiZGV2X3JlYWRfZm9saW8oKSBpbiB0aGlzIHBhdGNoc2V0LAo+IHRo
ZXkgYWxsIGhhdmUgYSBwb3NpdGlvbiBpbiBieXRlcywgYW5kIHRoZXkgYWxsIGNvbnZlcnQgaXQg
dG8KPiBpbmRleCBmb3IgdGhpcyBjYWxsLiAgVGhlIEFQSSBzaG91bGQgcHJvYmFibHkgYmU6Cj4g
Cj4gc3RydWN0IGZvbGlvICpiZGV2X3JlYWRfZm9saW8oc3RydWN0IGJsb2NrX2RldmljZSAqYmRl
diwgbG9mZl90IHBvcykKPiB7Cj4gCXJldHVybiByZWFkX21hcHBpbmdfZm9saW8oYmRldi0+YmRf
aW5vZGUtPmlfbWFwcGluZywKPiAJCQlwb3MgLyBQQUdFX1NJWkUsIE5VTEwpOwo+IH0KClRoYW5r
cyBmb3IgcmV2aWV3aW5nIHRoaXMgcGF0Y2hzZXQhIE9rYXksIEknbGwgY29udmVydCB0byBwYXNz
IGluICJwb3MiCmluIHYyLgo+IAo+IC4uLiBhbmQgYXQgc29tZSBwb2ludCwgd2UnbGwgZ2V0IHJv
dW5kIHRvIGNvbnZlcnRpbmcgcmVhZF9tYXBwaW5nX2ZvbGlvKCkKPiB0byB0YWtlIGl0cyBhcmd1
bWVudCBpbiBsb2ZmX3QuCj4gCj4gU2ltaWxpYXJseSBmb3IgdGhlc2UgdHdvIEFQSXM6Cj4gCj4+
ICtzdHJ1Y3QgZm9saW8gKmJkZXZfcmVhZF9mb2xpb19nZnAoc3RydWN0IGJsb2NrX2RldmljZSAq
YmRldiwgcGdvZmZfdCBpbmRleCwKPj4gKwkJCQkgIGdmcF90IGdmcCkKPj4gK3N0cnVjdCBmb2xp
byAqYmRldl9nZXRfZm9saW8oc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgcGdvZmZfdCBpbmRl
eCkKPiAKPj4gK3N0cnVjdCBmb2xpbyAqYmRldl9maW5kX29yX2NyZWF0ZV9mb2xpbyhzdHJ1Y3Qg
YmxvY2tfZGV2aWNlICpiZGV2LAo+PiArCQkJCQlwZ29mZl90IGluZGV4LCBnZnBfdCBnZnApCj4+
ICt7Cj4+ICsJcmV0dXJuIF9fZmlsZW1hcF9nZXRfZm9saW8oYmRldi0+YmRfaW5vZGUtPmlfbWFw
cGluZywgaW5kZXgsCj4+ICsJCQkJICAgRkdQX0xPQ0sgfCBGR1BfQUNDRVNTRUQgfCBGR1BfQ1JF
QVQsIGdmcCk7Cj4+ICt9Cj4+ICtFWFBPUlRfU1lNQk9MX0dQTChiZGV2X2ZpbmRfb3JfY3JlYXRl
X2ZvbGlvKTsKPiAKPiBUaGlzIG9uZSBwcm9iYWJseSBzaG91bGRuJ3QgZXhpc3QuICBJJ3ZlIGJl
ZW4gY29udmVydGluZyBjYWxsZXJzIG9mCj4gZmluZF9vcl9jcmVhdGVfcGFnZSgpIHRvIGNhbGwg
X19maWxlbWFwX2dldF9mb2xpbzsgSSBzdXNwZWN0IHdlCj4gc2hvdWxkIGV4cG9zZSBhIF9fYmRl
dl9nZXRfZm9saW8gYW5kIGhhdmUgdGhlIGNhbGxlcnMgdXNlIHRoZSBGR1AKPiBhcmd1bWVudHMg
ZGlyZWN0bHksIGJ1dCBJJ20gb3BlbiB0byBvdGhlciBvcGluaW9ucyBoZXJlLgoKSWYgbm9ib2R5
IGFnYWluc3QgdGhpcywgSSB3aWxsIGV4cG9zZSBzaW5nbGUgX19iZGV2X2dldF9mb2xpbygpIHRv
IHVzZQppbiB2Mi4KPiAKPj4gK3ZvaWQgYmRldl9zeW5jX3JlYWRhaGVhZChzdHJ1Y3QgYmxvY2tf
ZGV2aWNlICpiZGV2LCBzdHJ1Y3QgZmlsZV9yYV9zdGF0ZSAqcmEsCj4+ICsJCQkgc3RydWN0IGZp
bGUgKmZpbGUsIHBnb2ZmX3QgaW5kZXgsCj4+ICsJCQkgdW5zaWduZWQgbG9uZyByZXFfY291bnQp
Cj4+ICt7Cj4+ICsJc3RydWN0IGZpbGVfcmFfc3RhdGUgdG1wX3JhID0ge307Cj4+ICsKPj4gKwlp
ZiAoIXJhKSB7Cj4+ICsJCXJhID0gJnRtcF9yYTsKPj4gKwkJZmlsZV9yYV9zdGF0ZV9pbml0KHJh
LCBiZGV2LT5iZF9pbm9kZS0+aV9tYXBwaW5nKTsKPj4gKwl9Cj4+ICsJcGFnZV9jYWNoZV9zeW5j
X3JlYWRhaGVhZChiZGV2LT5iZF9pbm9kZS0+aV9tYXBwaW5nLCByYSwgZmlsZSwgaW5kZXgsCj4+
ICsJCQkJICByZXFfY291bnQpOwo+PiArfQo+IAo+IEkgdGhpbmsgdGhlIGNhbGxlciBzaG91bGQg
YWx3YXlzIGJlIHBhc3NpbmcgaW4gYSB2YWxpZCBmaWxlX3JhX3N0YXRlLgo+IEl0J3Mgb25seSBj
cmFtZnMgdGhhdCBkb2Vzbid0IGhhdmUgb25lLCBhbmQgaXQgcmVhbGx5IHNob3VsZCEKPiBOb3Qg
ZW50aXJlbHkgc3VyZSBhYm91dCB0aGUgYXJndW1lbnRzIGhlcmU7IHBhcnQgb2YgbWUgc2F5cyAi
Ynl0ZXMiLAo+IGJ1dCB0aGlzIGlzIHdlaXJkIGVub3VnaCB0byBtYXliZSB0YWtlIGFyZ3VtZW50
cyBpbiBwYWdlcy4KCkluIGZhY3QsIGJkZXZfc3luY19yZWFkYWhlYWQoKSBpcyBvbmx5IGNhbGxl
ZCBmb3IgY3JhbWZzIGFuZCBleHQ0LgoKRm9yIGV4dDQgaXQncyB1c2VkIGluIGV4dDRfcmVhZGRp
cigpIHNvIHRoZXJlIGlzIHZhbGlkIGZpbGVfcmFfc3RhdGUuCgpIb2V2ZXIsIGZvciBjcmFtZnMg
aXQncyB1c2VkIGluIGNyYW1mc19yZWFkKCksIGFuZCBjcmFtZnNfcmVhZCgpIGlzIHVzZWQKZm9y
OgoKMSkgY3JhbWZzX3JlYWRfZm9saW8KMikgY3JhbWZzX3JlYWRkaXIKMykgY3JhbWZzX2xvb2t1
cAo0KSBjcmFtZnNfcmVhZF9zdXBlcgoKTG9va3MgbGlrZSBpdCdzIGVhc3kgdG8gcGFzcyBpbiB2
YWxpZCBmaWxlX3JhX3N0YXRlKCkgZm9yIDEpIGFuZCAyKSwKaG93ZXZlciwgSSBkb24ndCBzZWUg
YW4gZWFzeSB3YXkgdG8gZG8gdGhpcyBmb3IgMykgYW5kIDQpLgoKVGhhbmtzLApLdWFpCgo+IAo+
IC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
