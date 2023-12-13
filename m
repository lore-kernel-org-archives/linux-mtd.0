Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9015FC4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Dec 2023 01:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKIcvgVf1ot239wOK7IW7p6DvaFA7Tz2HJv7dBb/NWo=; b=cqOcHbw6JSKsuO9PQvkKvsGCKS
	9ZeUJyYVl0fSZn2fYViayzUXEXrNKe8rj1KFwxHWcNwbHdoPuN5WkFSWSTg5zKJuiRjHs4LlfLwOt
	4SDt/mUhVwmrt9irOQXcyseisQ0tpOnmoBV7aA4rycZD6wZDMy6ApES40Pjhv8o13j2LTgW4XgEML
	7kLAuf2B3VnkOo6OxGAbFhpkdJ7n8TKKAZuvDGxvgDrMOCIPRgvw0wSx+a/+2Q4ziMEHpOELc5Zn2
	Br6bbTwHUUYT4hfwnGBZIZ9lCLS7WgenloIqK+6VKfrAXRyp2Yn19CPqwDiSj38Cs37xEJwS3w5vW
	xxz5xMCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDDkn-00DGlE-1v;
	Wed, 13 Dec 2023 01:09:37 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDDkj-00DGho-2u
	for linux-mtd@lists.infradead.org;
	Wed, 13 Dec 2023 01:09:36 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Sqcnk5Y2wz4f3jrk
	for <linux-mtd@lists.infradead.org>; Wed, 13 Dec 2023 09:09:14 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 451371A0938
	for <linux-mtd@lists.infradead.org>; Wed, 13 Dec 2023 09:09:17 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP1 (Coremail) with SMTP id cCh0CgBntQs5BHllRkz5DQ--.6696S3;
	Wed, 13 Dec 2023 09:09:16 +0800 (CST)
Subject: Re: [PATCH RFC v2 for-6.8/block 01/18] block: add some bdev apis
To: Christoph Hellwig <hch@infradead.org>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
 kent.overstreet@gmail.com, joern@lazybastard.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org, chao@kernel.org,
 tytso@mit.edu, adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
 konishi.ryusuke@gmail.com, willy@infradead.org, akpm@linux-foundation.org,
 p.raghav@samsung.com, hare@suse.de, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
 linux-nilfs@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 "yukuai (C)" <yukuai3@huawei.com>
References: <20231211140552.973290-1-yukuai1@huaweicloud.com>
 <20231211140552.973290-2-yukuai1@huaweicloud.com>
 <ZXhdRhfr+JoWdhyj@infradead.org>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <893e2764-65a6-ef73-5ddf-95cd9f97cb19@huaweicloud.com>
Date: Wed, 13 Dec 2023 09:09:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ZXhdRhfr+JoWdhyj@infradead.org>
X-CM-TRANSID: cCh0CgBntQs5BHllRkz5DQ--.6696S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw4fJw1rAF1UKF4fJrWDJwb_yoWfurcEqr
	n7Cryv9w1jvws5Wr4UKFy5JrWrJFWYyr43Xay8ta4Iq3s8Xa18Ar92ka48uas8Ww47Z3ZI
	9FsxuFy8uF4fujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbaxFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j
	6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUd8n5UUUUU=
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_170934_314385_11785150 
X-CRM114-Status: GOOD (  10.72  )
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

SGksCgrU2iAyMDIzLzEyLzEyIDIxOjE2LCBDaHJpc3RvcGggSGVsbHdpZyDQtLXAOgo+PiArdm9p
ZCBpbnZhbGlkYXRlX2JkZXZfcmFuZ2Uoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgcGdvZmZf
dCBzdGFydCwKPj4gKwkJCSAgIHBnb2ZmX3QgZW5kKQo+PiArewo+PiArCWludmFsaWRhdGVfbWFw
cGluZ19wYWdlcyhiZGV2LT5iZF9pbm9kZS0+aV9tYXBwaW5nLCBzdGFydCwgZW5kKTsKPj4gK30K
Pj4gK0VYUE9SVF9TWU1CT0xfR1BMKGludmFsaWRhdGVfYmRldl9yYW5nZSk7Cj4gCj4gQ2FuIHdl
IGhhdmUga2VybmVsZG9jIGNvbW1lbnRzIGZvciB0aGUgbmV3IGhlbHBlcnMgcGxlYXNlPwoKT2Yg
Y291cnNlLCB3aWxsIGRlZmluaXRlbHkgZG8gdGhpcyBpbiB2My4KPiAKPj4gK3N0cnVjdCBmb2xp
byAqX19iZGV2X2dldF9mb2xpbyhzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2LCBsb2ZmX3QgcG9z
LAo+PiArCQkJICAgICAgIGZnZl90IGZncF9mbGFncywgZ2ZwX3QgZ2ZwKQo+PiArewo+PiArCXJl
dHVybiBfX2ZpbGVtYXBfZ2V0X2ZvbGlvKGJkZXYtPmJkX2lub2RlLT5pX21hcHBpbmcsIHBvcyA+
PiBQQUdFX1NISUZULAo+PiArCQkJCSAgIGZncF9mbGFncywgZ2ZwKTsKPj4gK30KPj4gK0VYUE9S
VF9TWU1CT0xfR1BMKF9fYmRldl9nZXRfZm9saW8pOwo+IAo+IEl0J3MgYSBiaXQgc2lsbHkgdG8g
aGF2ZSBhIF9fLXByZWZpeGVkIEFQSSB3aXRob3V0IGEgdmVyc2lvbiB0aGF0Cj4gZG9lc24ndCBo
YXZlIHRoZSBwcmVmaXgsIHNvIEknZCBwcmVmZXIgdG8gZHJvcCBpdC4gIFVubGVzcyB3aWxseSBo
YXMKPiBhIGdvb2QgYXJndW1lbnQgZm9yIGtlZXBpbmcgaXQgdGhlIHNhbWUgYXMgdGhlIGZpbGVt
YXAgQVBJLgoKT2ssIEknbGwgZHJvcCBpdCBpZiB3aWxseSBkb2Vzbid0IGFnYWluc3QgdGhpcy4K
ClRoYW5rcywKS3VhaQo+IAo+IC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
