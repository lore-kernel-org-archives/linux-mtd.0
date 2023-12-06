Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD64C4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Dec 2023 06:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p26l19rJaY/kSyNtiQZKOByarsASSAqhIZXglYUwKDQ=; b=S2YB9jutCrXSbzPgX50gKC1pxd
	0JCHeiZ+fUyR2+ggquCasG9UT8xGLlkdE0A1ofGBFZTMCaDLFYo8v/Uxe4dynJvP0W08grvouZsGm
	TbpEiFMqlM059hFC+SfRJwreKc+H8sJQ0YZaDQiMovtt8UPtxM4HMfKDvHUt2efaiS5Vx4xQYEpvM
	zxcVud1vHkh5h3bL5h6wpQTk3Xs+youhO4zando7MRcuKTpCz/kNgfscZ9U3QM/IAHGOTRuNVu0Un
	H3VrmE7GozV3NQAA1HUDRyt+MxCZay/OHh56xgb4VbX89igO4Wp5Bdb/Cqk2FGABb2ysdihaPAieW
	dFA3nWCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAlpP-009FgN-0O;
	Wed, 06 Dec 2023 06:56:15 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAlpL-009Ffl-2m
	for linux-mtd@lists.infradead.org;
	Wed, 06 Dec 2023 06:56:13 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SlSqB48Kxz4f3kK9
	for <linux-mtd@lists.infradead.org>; Wed,  6 Dec 2023 14:56:06 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 9E2F11A09B3
	for <linux-mtd@lists.infradead.org>; Wed,  6 Dec 2023 14:56:07 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP1 (Coremail) with SMTP id cCh0CgA3iA4FG3Bl+7GDCw--.10511S3;
	Wed, 06 Dec 2023 14:56:07 +0800 (CST)
Subject: Re: [PATCH -next RFC 02/14] xen/blkback: use bdev api in
 xen_update_blkif_status()
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
 <20231205123728.1866699-3-yukuai1@huaweicloud.com>
 <ZXAMwBD8pd48qwX/@infradead.org>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <783b5515-db42-c77f-62ab-050f7cc8ef5e@huaweicloud.com>
Date: Wed, 6 Dec 2023 14:56:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ZXAMwBD8pd48qwX/@infradead.org>
X-CM-TRANSID: cCh0CgA3iA4FG3Bl+7GDCw--.10511S3
X-Coremail-Antispam: 1UD129KBjvdXoW7JryDJrWDur4DGrWUZr1DZFb_yoWkGFX_Wr
	4UCrWqqr1kursYka9F9FsYy34qkFy8ZryruayIqFZIg34UWay2vrW7Xrn5CF43WayUKan0
	kF45Aa47trWrKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbaAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_
	WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJr
	UvcSsGvfC2KfnxnUUI43ZEXa7VU1VOJ5UUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_225612_262504_28FC4340 
X-CRM114-Status: GOOD (  10.86  )
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

SGksCgrU2iAyMDIzLzEyLzA2IDEzOjU1LCBDaHJpc3RvcGggSGVsbHdpZyDQtLXAOgo+IE9uIFR1
ZSwgRGVjIDA1LCAyMDIzIGF0IDA4OjM3OjE2UE0gKzA4MDAsIFl1IEt1YWkgd3JvdGU6Cj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jIGIvZHJpdmVycy9i
bG9jay94ZW4tYmxrYmFjay94ZW5idXMuYwo+PiBpbmRleCBlMzQyMTllYTJiMDUuLmU2NDVhZmE0
YWY1NyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYwo+
PiArKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jCj4+IEBAIC0xMDQsOCAr
MTA0LDcgQEAgc3RhdGljIHZvaWQgeGVuX3VwZGF0ZV9ibGtpZl9zdGF0dXMoc3RydWN0IHhlbl9i
bGtpZiAqYmxraWYpCj4+ICAgCQl4ZW5idXNfZGV2X2Vycm9yKGJsa2lmLT5iZS0+ZGV2LCBlcnIs
ICJibG9jayBmbHVzaCIpOwo+PiAgIAkJcmV0dXJuOwo+PiAgIAl9Cj4+IC0JaW52YWxpZGF0ZV9p
bm9kZV9wYWdlczIoCj4+IC0JCQlibGtpZi0+dmJkLmJkZXZfaGFuZGxlLT5iZGV2LT5iZF9pbm9k
ZS0+aV9tYXBwaW5nKTsKPj4gKwlpbnZhbGlkYXRlX2JkZXYoYmxraWYtPnZiZC5iZGV2X2hhbmRs
ZS0+YmRldik7Cj4gCj4gYmxrYmFrIGlzIGEgYmRldiBleHBvcnRlZC4gICBJIGRvbid0IHRoaW5r
IGl0IHNob3VsZCBldmVyIGNhbGwKPiBpbnZhbGlkYXRlX2lub2RlX3BhZ2VzMiwgdGhyb3VnaCBh
IHdyYXBwZXIgb3Igbm90LgoKSSdtIG5vdCBzdXJlIGFib3V0IHRoaXMuIEknbSBub3QgZmFtaWxp
YXIgd2l0aCB4ZW4vYmxrYmFjaywgYnV0IEkgc2F3CnRoYXQgeGVuLWJsa2JhY2sgd2lsbCBvcGVu
IGEgYmRldiBmcm9tIHhlbl92YmRfY3JlYXRlKCksIGhlbmNlIHRoaXMKbG9va3MgbGlrZSBhIGRt
L21kIGZvciBtZSwgaGVuY2UgaXQgc291bmRzIHJlYXNvbmFibGUgdG8gc3luYyArCmludmFsaWRh
dGUgdGhlIG9wZW5lZCBiZGV2IHdoaWxlIGluaXRpYWxpemF0aW9uLiBQbGVhc2Uga2luZGx5IGNv
cnJlY3QKbWUgaWYgSSdtIHdyb25nLgoKVGhhbmtzLApLdWFpCgo+IAo+IC4KPiAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
