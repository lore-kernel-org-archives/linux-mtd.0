Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2457CC07CB1
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 13:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvG9Vk/GG07bgdwl0Ev3n9cs0/XPlmiv+6c3mp8Mf58=; b=nVntn7LVqY6V1OHm7D8L3N3te7
	bsANRi2ZofzFXc+6d2lmXm+KghbyfsvUS3AtE+o7jklAwVY3D/KphZ2BdsZ2kRlp/0NoSPr9MJ+tM
	st0dcxxx1VU4KKIFqQDT3sEAWLU7SUIrhh2gdgpwat97rYr2wfNdxBiL7JGkXOh3dFH9H+Mb1UZzt
	RAFOqaGpuBIzhTt5uoR7arcQGUYhxxr3WN+jXY0qMzfKJhoEabEvm1ST87qi6bYpByvTz7T7wCM2D
	CJkgIMibeNAP+MiV6hk8oop7opSpapnt/kytzpXCIA3RYaBI04d8F5tnL8008gLZZYqfbzzYSSkK8
	QKaGgwwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7bKw-002WIn-0N;
	Mon, 27 Nov 2023 13:07:42 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7bKs-002WGe-10
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 13:07:40 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Sf5Tj4gzBz4f3lCm
	for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2023 21:07:21 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 152D31A07D8
	for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2023 21:07:26 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP1 (Coremail) with SMTP id cCh0CgDX2hCKlGRldTJXCA--.14854S3;
	Mon, 27 Nov 2023 21:07:25 +0800 (CST)
Subject: Re: [PATCH block/for-next v2 01/16] block: add a new helper to get
 inode from block_device
To: Christoph Hellwig <hch@infradead.org>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: ming.lei@redhat.com, axboe@kernel.dk, roger.pau@citrix.com,
 colyli@suse.de, kent.overstreet@gmail.com, joern@lazybastard.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
 nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
 adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
 konishi.ryusuke@gmail.com, dchinner@redhat.com, linux@weissschuh.net,
 min15.li@samsung.com, dlemoal@kernel.org, willy@infradead.org,
 akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org, yi.zhang@huawei.com,
 yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20231127062116.2355129-1-yukuai1@huaweicloud.com>
 <20231127062116.2355129-2-yukuai1@huaweicloud.com>
 <ZWRDeQ4K8BiYnV+X@infradead.org>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <6acdeece-7163-3219-95e2-827e54eadd0c@huaweicloud.com>
Date: Mon, 27 Nov 2023 21:07:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ZWRDeQ4K8BiYnV+X@infradead.org>
X-CM-TRANSID: cCh0CgDX2hCKlGRldTJXCA--.14854S3
X-Coremail-Antispam: 1UD129KBjvJXoW7KF1fWFWkJw1kuFy8XF43KFg_yoW8KrWDp3
	y7KFn8tw1DJryFgan7tw1jqrn0g3W7GrWUZ34rZrsxurZ8WFy2qF10krsrXFyIyr48Jw4I
	qF45AF43Xry2grJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_WFyU
	JVCq3wCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26rxl6s0DYx
	BIdaVFxhVjvjDU0xZFpf9x0JUd8n5UUUUU=
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_050738_718548_50044506 
X-CRM114-Status: GOOD (  16.74  )
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

SGksCgrU2iAyMDIzLzExLzI3IDE1OjIxLCBDaHJpc3RvcGggSGVsbHdpZyDQtLXAOgo+IE9uIE1v
biwgTm92IDI3LCAyMDIzIGF0IDAyOjIxOjAxUE0gKzA4MDAsIFl1IEt1YWkgd3JvdGU6Cj4+IEZy
b206IFl1IEt1YWkgPHl1a3VhaTNAaHVhd2VpLmNvbT4KPj4KPj4gYmxvY2tfZGV2Y2llIGlzIGFs
bG9jYXRlZCBmcm9tIGJkZXZfYWxsb2MoKSBieSBiZGV2X2FsbG9jX2lub2RlKCksIGFuZAo+PiBj
dXJyZW50bHkgYmxvY2tfZGV2aWNlIGNvbnRhaW5zIGEgcG9pbnRlciB0aGF0IHBvaW50IHRvIHRo
ZSBhZGRyZXNzIG9mCj4+IGlub2RlLCB3aGlsZSBzdWNoIGlub2RlIGlzIGFsbG9jYXRlZCB0b2dl
dGhlcjoKPiAKPiBUaGlzIGlzIGdvaW5nIHRoZSB3cm9uZyB3YXkuICBOb3RoaW5nIG91dHNpZGUg
b2YgY29yZSBibG9jayBsYXllciBjb2RlCj4gc2hvdWxkIGV2ZXIgZGlyZWN0bHkgdXNlIHRoZSBi
ZGV2IGlub2RlLiAgV2UndmUgYmVlbiByYXRoZXIgc2xvcHB5Cj4gYW5kIGFkZGVkIGEgbG90IG9m
IGRpcmVjdCByZWZlcmVuY2UgdG8gaXQsIGJ1dCB0aGV5IHJlYWxseSBuZWVkIHRvCj4gZ28gYXdh
eSBhbmQgYmUgcmVwbGFjZWQgd2l0aCB3ZWxsIGRlZmluZWQgaGlnaCBsZXZlbCBvcGVyYXRpb24g
b24KPiBzdHJ1Y3QgYmxvY2tfZGV2aWNlLiAgT25jZSB0aGF0IGlzIGRvbmUgd2UgY2FuIHJlbW92
ZSB0aGUgYmRfaW5vZGUKPiBwb2ludGVyLCBidXQgcmVwbGFjaW5nIGl0IHdpdGggc29tZXRoaW5n
IHRoYXQgcG9rZXMgZXZlbiBtb3JlIGRlZXBseQo+IGludG8gYmRldiBpbnRlcm5hbHMgaXMgYSBi
YWQgaWRlYS4KClRoYW5rcyBmb3IgdGhlIGFkdmljZSwgaG93ZXZlciwgYWZ0ZXIgY29sbGVjdGlu
ZyBob3cgb3RoZXIgbW9kdWxlcyBhcmUKdXNpbmcgYmRldiBpbm9kZSwgSSBnb3QgdHdvIG1haW4g
cXVlc3Rpb25zOgoKMSkgSXMndCBva2F5IHRvIGFkZCBhIG5ldyBoZWxwZXIgdG8gcGFzcyBpbiBi
ZGV2IGZvciBmb2xsb3dpbmcgYXBpcz8KSWYgc28sIHRoZW4gYWxtb3N0IGFsbCB0aGUgZnMgYW5k
IGRyaXZlciBjYW4gYXZvaWQgdG8gYWNjZXNzIGJkX2lub2RlCmRpcmN0bHkuCgplcnJzZXFfY2hl
Y2soJmJkZXYtPmJkX2lub2RlLT5pX21hcHBpbmctPndiX2Vyciwgd2JfZXJyKTsKZXJyc2VxX2No
ZWNrX2FuZF9hZHZhbmNlKCZiZGV2LT5iZF9pbm9kZS0+aV9tYXBwaW5nLT53Yl9lcnIsICZ3Yl9l
cnIpOwptYXBwaW5nX2dmcF9jb25zdHJhaW50KGJkZXYtPmJkX2lub2RlLT5pX21hcHBpbmcsIGdm
cCk7Cmlfc2l6ZV9yZWFkKGJkZXYtPmJkX2lub2RlKQpmaW5kX2dldF9wYWdlKGJkZXYtPmJkX2lu
b2RlLT5pX21hcHBpbmcsIG9mZnNldCk7CmZpbmRfb3JfY3JlYXRlX3BhZ2UoYmRldi0+YmRfaW5v
ZGUtPmlfbWFwcGluZywgaW5kZXgsIGdmcCk7CnJlYWRfY2FjaGVfcGFnZV9nZnAoYmRldi0+YmRf
aW5vZGUtPmlfbWFwcGluZywgaW5kZXgsIGdmcCk7CmludmFsaWRhdGVfaW5vZGVfcGFnZXMyKGJk
ZXYtPmJkX2lub2RlLT5pX21hcHBpbmcpOwppbnZhbGlkYXRlX2lub2RlX3BhZ2VzMl9yYW5nZShi
ZGV2LT5iZF9pbm9kZS0+aV9tYXBwaW5nLCBzdGFydCwgZW5kKTsKcmVhZF9tYXBwaW5nX2ZvbGlv
KGJkZXYtPmJkX2lub2RlLT5pX21hcHBpbmcsIGluZGV4LCBmaWxlKTsKcmVhZF9tYXBwaW5nX3Bh
Z2UoYmRldi0+YmRfaW5vZGUtPmlfbWFwcGluZywgaW5kZXgsIGZpbGUpOwpiYWxhbmNlX2RpcnR5
X3BhZ2VzX3JhdGVsaW1pdGVkKGJkZXYtPmJkX2lub2RlLT5pX21hcHBpbmcpCmZpbGVfcmFfc3Rh
dGVfaW5pdChyYSwgYmRldi0+YmRfaW5vZGUtPmlfbWFwcGluZyk7CnBhZ2VfY2FjaGVfc3luY19y
ZWFkYWhlYWQoYmRldi0+YmRfaW5vZGUtPmlfbWFwcGluZywgcmEsIGZpbGUsIGluZGV4LCAKcmVx
X2NvdW50KTsKaW5vZGVfdG9fYmRpKGJkZXYtPmJkX2lub2RlKQoKMikgRm9yIHRoZSBmaWxlIGZz
L2J1ZmZlci5jLCB0aGVyZSBhcmUgc29tZSBzcGVjaWFsIHVzYWdlIGxpa2UKZm9sbG93aW5nIHRo
YXQgSSBkb24ndCB0aGluayBpdCdzIGdvb2QgdG8gYWRkIGEgaGVscGVyOgoKc3Bpbl9sb2NrKCZi
ZF9pbm9kZS0+aV9tYXBwaW5nLT5wcml2YXRlX2xvY2spOwoKSXMndCBva2F5IHRvIG1vdmUgZm9s
bG93aW5nIGFwaXMgZnJvbSBmcy9idWZmZXIuYyBkaXJlY3RseSB0bwpibG9jay9iZGV2LmM/Cgpf
X2ZpbmRfZ2V0X2Jsb2NrCmJkZXZfZ2V0YmxrCgpUaGFua3MsCkt1YWkKCj4gLgo+IAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
