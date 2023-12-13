Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B52BC4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Dec 2023 01:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VL580eZVnWO2Gav8xyQTfphfxw21MFGklF5i1rldUgU=; b=MSZRu5IpNvC74cTSus6bVP9JCq
	tWxb7eOmvjqiMDqfkSfRwg/QiKrKmY1k4rDm8JFTFKnELZ9WCVuODtq+Bp1OwiRpkq9RbkJEp/56q
	SuEkQCd6yK0t/frVydpJ3Cia0gomJH/jWMf1KjrKTfu38zi7NyVPHMQk7sq0k4kqfXVie5h8ZC1qW
	FFzVu+hOZXZ7KKb4D7qFgTuKVJSI+/AUdXuFcF9e/tJtwR0ku+zNb8KFJs5T7sdRdMwJJbdNn1naS
	gbYb05mX0QFDvWC/Sc8xn616VzpsdjO2t5iyYH1pqA4TEnfx9L/qT9svn2uueFf2f/u/xFtVnJ3xs
	W+0XB6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDDlT-00DH0M-1Y;
	Wed, 13 Dec 2023 01:10:19 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDDlR-00DGzC-18
	for linux-mtd@lists.infradead.org;
	Wed, 13 Dec 2023 01:10:18 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Sqcpl17Jjz4f3jHx
	for <linux-mtd@lists.infradead.org>; Wed, 13 Dec 2023 09:10:07 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 5E4D91A0C7E
	for <linux-mtd@lists.infradead.org>; Wed, 13 Dec 2023 09:10:08 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP1 (Coremail) with SMTP id cCh0CgDX2xFuBHlllVr5DQ--.61515S3;
	Wed, 13 Dec 2023 09:10:07 +0800 (CST)
Subject: Re: [PATCH RFC v2 for-6.8/block 01/18] block: add some bdev apis
To: Christoph Hellwig <hch@infradead.org>, Jan Kara <jack@suse.cz>
Cc: Yu Kuai <yukuai1@huaweicloud.com>, axboe@kernel.dk, roger.pau@citrix.com,
 colyli@suse.de, kent.overstreet@gmail.com, joern@lazybastard.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
 nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
 adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
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
 <20231211165217.fil437byq7w2vcp7@quack3> <ZXhcsNbvzbArtBUj@infradead.org>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <718c424e-2514-8a14-b461-7e20b6355d16@huaweicloud.com>
Date: Wed, 13 Dec 2023 09:10:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ZXhcsNbvzbArtBUj@infradead.org>
X-CM-TRANSID: cCh0CgDX2xFuBHlllVr5DQ--.61515S3
X-Coremail-Antispam: 1UD129KBjvdXoW7XF1DtryfCryDXw4DAry7Wrg_yoW3GFg_Xr
	909FW8K3W8A3ykJr43trs8Kr9YyFs2gr1UZrWrJ3W7X34kXFs8GFWvyr98WryfGw48CrnI
	kF9F934fJr92qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbaxFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Gr0_
	Zr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUCXdbUUUUU=
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_171017_755040_BF53D59E 
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

SGksCgrU2iAyMDIzLzEyLzEyIDIxOjE0LCBDaHJpc3RvcGggSGVsbHdpZyDQtLXAOgo+IE9uIE1v
biwgRGVjIDExLCAyMDIzIGF0IDA1OjUyOjE3UE0gKzAxMDAsIEphbiBLYXJhIHdyb3RlOgo+Pj4g
K3ZvaWQgYmRldl9hc3NvY2lhdGVkX21hcHBpbmcoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwK
Pj4+ICsJCQkgICAgIHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nKQo+Pj4gK3sKPj4+ICsJ
bWFwcGluZy0+aG9zdCA9IGJkZXYtPmJkX2lub2RlOwo+Pj4gK30KPj4KPj4gSGVyZSBJJ20gbm90
IHN1cmUgLSBpcyB0aGUgaGVscGVyIHJlYWxseSBhIHdpbj8gSXQgc2VlbXMgYSBiaXQgb2JzY3Vy
ZSB0bwo+PiBtZS4gVGhpcyBpbml0aWFsaXphdGlvbiBvZiBhbm90aGVyIG1hcHBpbmcgZm9yIGEg
YmRldiBsb29rcyByZWFsbHkgc3BlY2lhbC4KPiAKPiBJZiB3ZSB3YW50IHRvIGhpZGUgYmRfaW5v
ZGUgd2UnbGwgc29tZXRoaW5nIGxpa2UgdGhpcyBoZWxwZXIgZXZlbiBpZgo+IEkgZG9uJ3QgcGFy
dGljdWxhcmx5IGxpa2UgaXQgZWl0aGVyLgo+IAo+IEJ1dCBpdCBtaWdodCBiZSBhIGdvb2QgaWRl
YSB0byBtb3ZlIG91dCBvZiB0aGlzIHNlcmllcyBhbmQgaW50byB0aGUKPiBmb2xsb3cgb24gcmVt
b3ZpbmcgYmRfaW5vZGUsIGFzIGl0J3MgcmF0aGVyIHBvaW50bGVzcyB3aXRob3V0IHRoYXQKPiBj
b250ZXh0LgoKWWVzLCB0aGlzIHNvdW5kcyBnb29kLCBJJ2xsIHJlbW92ZSB0aGlzIGZyb20gdjMu
CgpUaGFua3MsCkt1YWkKCj4gLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
