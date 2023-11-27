Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81310C07D5A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 07:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=guhf5NS2hwsnL0q/3akVEo1CvyDlbIDNvurvdwyI9J0=; b=hZsRilIS7v+pplZ+9IygMgC3aX
	kcC7oZ9fHi6qgZiZy9M8yiVt1jq/jWvHB0tZggTW4WENJIxB8l+Y5J+a7c0TgOMEerbTK6T5HjZ/c
	/I8jx+QbpppKMIfco5dIYanXdqbqSlr2VejSBDlt/PUJLciaxZW0N5EkLdwNLjkTbk12wPKIIM8dR
	CixkWXH2c7MnAjJnUDJfzo5VnICCd0w2AqUSogwzRhyO+7JoTSVysx/obBFYHH9scEbxYTLEMJomu
	mvQwUnYl+eHJAoSwWHzRMGQSTq+ueZ8DVj5Mwg39MKo3yR8sJtQht3KV9HVVzXabmXDOPXdTe3byk
	WDQkkIdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7WQJ-001lRS-0K;
	Mon, 27 Nov 2023 07:52:55 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7WQE-001lQ1-2o
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 07:52:53 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SdyVb2XTTz4f3n65
	for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2023 15:52:39 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id BEB311A0D63
	for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2023 15:52:43 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP1 (Coremail) with SMTP id cCh0CgBXWhDISmRl1qdCCA--.65049S3;
	Mon, 27 Nov 2023 15:52:43 +0800 (CST)
Subject: Re: [PATCH block/for-next v2 07/16] bcachefs: use new helper to get
 inode from block_device
To: Kent Overstreet <kent.overstreet@linux.dev>,
 Damien Le Moal <dlemoal@kernel.org>
Cc: Yu Kuai <yukuai1@huaweicloud.com>, hch@infradead.org,
 ming.lei@redhat.com, axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
 kent.overstreet@gmail.com, joern@lazybastard.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org, chao@kernel.org,
 tytso@mit.edu, adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
 konishi.ryusuke@gmail.com, dchinner@redhat.com, linux@weissschuh.net,
 min15.li@samsung.com, willy@infradead.org, akpm@linux-foundation.org,
 hare@suse.de, p.raghav@samsung.com, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
 linux-nilfs@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 "yukuai (C)" <yukuai3@huawei.com>
References: <20231127062116.2355129-1-yukuai1@huaweicloud.com>
 <20231127062116.2355129-8-yukuai1@huaweicloud.com>
 <d3b87b87-2ca7-43ca-9fb4-ee3696561eb5@kernel.org>
 <20231127072409.y22jkynrchm4tkd2@moria.home.lan>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <58ced33e-0a8c-7bd3-beb8-d75119cab60b@huaweicloud.com>
Date: Mon, 27 Nov 2023 15:52:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20231127072409.y22jkynrchm4tkd2@moria.home.lan>
X-CM-TRANSID: cCh0CgBXWhDISmRl1qdCCA--.65049S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw1kGw4ktFy5uF47KryUKFg_yoWkArX_XF
	17ur47Zw4fJF1vq3ZYqFsYqrZF9rWrXrWaqFn5JF1UWa4kJFZ5ZFZ5Kr93ZrsxJr4DGF12
	vrZ5XFW3CrySkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j
	6s0DMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_GcCE3sUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbJ73DUUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_235251_328678_14AD42B4 
X-CRM114-Status: GOOD (  12.00  )
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

SGksCgrU2iAyMDIzLzExLzI3IDE1OjI0LCBLZW50IE92ZXJzdHJlZXQg0LS1wDoKPiBPbiBNb24s
IE5vdiAyNywgMjAyMyBhdCAwNDowOTo0N1BNICswOTAwLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToK
Pj4gT24gMTEvMjcvMjMgMTU6MjEsIFl1IEt1YWkgd3JvdGU6Cj4+PiBGcm9tOiBZdSBLdWFpIDx5
dWt1YWkzQGh1YXdlaS5jb20+Cj4+Pgo+Pj4gV2hpY2ggaXMgbW9yZSBlZmZpY2llbmN5LCBhbmQg
YWxzbyBwcmVwYXJlIHRvIHJlbW92ZSB0aGUgZmllbGQKPj4+ICdiZF9pbm9kZScgZnJvbSBibG9j
a19kZXZpY2UuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogWXUgS3VhaSA8eXVrdWFpM0BodWF3ZWku
Y29tPgo+Pj4gLS0tCj4+PiAgIGZzL2JjYWNoZWZzL3V0aWwuaCB8IDIgKy0KPj4+ICAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2ZzL2JjYWNoZWZzL3V0aWwuaCBiL2ZzL2JjYWNoZWZzL3V0aWwuaAo+Pj4gaW5kZXggMjk4
NGI1N2IyOTU4Li5mZTdjY2IzYTM1MTcgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9iY2FjaGVmcy91dGls
LmgKPj4+ICsrKyBiL2ZzL2JjYWNoZWZzL3V0aWwuaAo+Pj4gQEAgLTUxOCw3ICs1MTgsNyBAQCBp
bnQgYmNoMl9iaW9fYWxsb2NfcGFnZXMoc3RydWN0IGJpbyAqLCBzaXplX3QsIGdmcF90KTsKPj4+
ICAgCj4+PiAgIHN0YXRpYyBpbmxpbmUgc2VjdG9yX3QgYmRldl9zZWN0b3JzKHN0cnVjdCBibG9j
a19kZXZpY2UgKmJkZXYpCj4+PiAgIHsKPj4+IC0JcmV0dXJuIGJkZXYtPmJkX2lub2RlLT5pX3Np
emUgPj4gOTsKPj4+ICsJcmV0dXJuIGJkZXZfaW5vZGUoYmRldiktPmlfc2l6ZSA+PiA5Owo+Pgo+
PiBzaG91bGRuJ3QgdGhpcyB1c2UgaV9zaXplX3JlYWQoKSA/Cj4+Cj4+IEkgbWlzc2VkIHRoZSBo
aXN0b3J5IHdpdGggdGhpcyBidXQgd2h5IG5vdCB1c2UgYmRldl9ucl9zZWN0b3JzKCkgYW5kIGRl
bGV0ZSB0aGlzCj4+IGhlbHBlciA/Cj4gCj4gQWN0dWFsbHksIHRoaXMgaGVscGVyIHNlZW1zIHRv
IGJlIGRlYWQgY29kZS4KClllcywgdGhlcmUgaXMgbm8gY2FsbGVyIG9mIHRoaXMgaGVscGVyLCBJ
J2xsIHJlbW92ZSB0aGlzIGhlbHBlci4KClRoYW5rcywKS3VhaQoKPiAuCj4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
