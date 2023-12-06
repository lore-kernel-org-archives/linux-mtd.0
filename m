Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81968C4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Dec 2023 06:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKVBrNQy/jVnpcm2gtpIhzWgmFmy71Z2Vnp6s3kYwxU=; b=EbwvvB/D7ALdPCYwIMXD7bEVag
	fMob2CCM+v+YKROWZzxu7+UyaSfou51rgWx4wkFvLL2tNKM/yciKDOvPGty1W6Z/28oe6gkswwaWc
	HihVvMf2ElQRczzS2p9X7uqC/tup+2e6O03cz+PS26k51EBWJI2QeFqpPwZwXxYMxFLQzeKuKrBzi
	M3g9gNIe7IWrTy6eqHl1karEcm9iXehJyCzftSNwMSIiUJfIvKkTaLaUwsQPcIJ+5NkJSmyTRBB/K
	ohT0az5Dh+IteLc2xRTNzl7tDuHFbWAx2iEAGVNqWsUXh7HKVFgMCnZnMByTL3C9zKCKisXtDhRnP
	m+e86hhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAl3a-0099Qi-1h;
	Wed, 06 Dec 2023 06:06:50 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAl3X-0099Q1-0G
	for linux-mtd@lists.infradead.org;
	Wed, 06 Dec 2023 06:06:49 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4SlRk31P2Kz4f3jMg
	for <linux-mtd@lists.infradead.org>; Wed,  6 Dec 2023 14:06:35 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 683291A0220
	for <linux-mtd@lists.infradead.org>; Wed,  6 Dec 2023 14:06:37 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP1 (Coremail) with SMTP id cCh0CgBXWhBpD3BlSn2ACw--.13338S3;
	Wed, 06 Dec 2023 14:06:36 +0800 (CST)
Subject: Re: [PATCH -next RFC 00/14] block: don't access bd_inode directly
 from other modules
To: Christoph Hellwig <hch@infradead.org>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
 kent.overstreet@gmail.com, joern@lazybastard.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, nico@fluxnic.net, xiang@kernel.org,
 chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
 agruenba@redhat.com, jack@suse.com, konishi.ryusuke@gmail.com,
 willy@infradead.org, akpm@linux-foundation.org, hare@suse.de,
 p.raghav@samsung.com, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org, yi.zhang@huawei.com,
 yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
 <ZXAMh02h4FAwt2FY@infradead.org>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <4b11a311-c121-1f44-0ccf-a3966a396994@huaweicloud.com>
Date: Wed, 6 Dec 2023 14:06:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ZXAMh02h4FAwt2FY@infradead.org>
X-CM-TRANSID: cCh0CgBXWhBpD3BlSn2ACw--.13338S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GrW3AFy7uF4rXry3Ary8uFg_yoWxuFc_XF
	ZYkrW0yw4rJFy0ka1UKF15A3yxCa40gan5ZrW8JFyxXF1rtFs5Ja9rWry5Z3srJrW0krZ7
	tF92gay7Cr4qvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUba8FF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E
	3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbJ73DUUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_220647_472591_092CA62C 
X-CRM114-Status: GOOD (  10.37  )
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

SGksCgrU2iAyMDIzLzEyLzA2IDEzOjU0LCBDaHJpc3RvcGggSGVsbHdpZyDQtLXAOgo+IE9uIFR1
ZSwgRGVjIDA1LCAyMDIzIGF0IDA4OjM3OjE0UE0gKzA4MDAsIFl1IEt1YWkgd3JvdGU6Cj4+IEZy
b206IFl1IEt1YWkgPHl1a3VhaTNAaHVhd2VpLmNvbT4KPj4KPj4gUGF0Y2ggMSBhZGQgc29tZSBi
ZGV2IGFwaXMsIHRoZW4gZm9sbG93IHVwIHBhdGNoZXMgd2lsbCB1c2UgdGhlc2UgYXBpcwo+PiB0
byBhdm9pZCBhY2Nlc3MgYmRfaW5vZGUgZGlyZWN0bHksIGFuZCBob3BlZnVsbHkgdGhlIGZpZWxk
IGJkX2lub2RlIGNhbgo+PiBiZSByZW1vdmVkIGV2ZW50dWFsbHkoYWZ0ZXIgZmlndXJlIG91dCBh
IHdheSBmb3IgZnMvYnVmZmVyLmMpLgo+IAo+IFdoYXQgdHJlZSBpcyB0aGlzIGFnYWluc3Q/ICBJ
dCBmYWlscyB0byBhcHBseSB0byBlaXRoZXIgSmVucycKPiBmb3ItNi44L2Jsb2NrIG9yIExpbnVz
IHRyZWUgaW4gdGhlIHZlcnkgZmlyc3QgcGF0Y2guCgpJdCB3YXMgYWdhaW5zdCBsaW51eC1uZXh0
IGJyYW5jaCwgZm9yIHRoZSB0YWcgbmV4dC0yMDIzMTIwMSwgYmVjYXVzZSBJJ20Kbm90IHN1cmUg
eWV0IGlmIHRoaXMgcGF0Y2hzZXQgc2hvdWxkIGJlIGFwcGxpZWQgdG8gSmFucycgdHJlZS4gUGxl
YXNlCmxldCBtZSBrbm93IGlmIEkgc2hvdWxkIHN3aXRoIHdvIEplbnMnIHRyZWUgZm9yIHYyLgoK
VGhhbmtzLApLdWFpCj4gCj4gLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
