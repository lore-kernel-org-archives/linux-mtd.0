Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82B4C3DA6E
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jan 2024 04:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6AuPWK9EHvQg9varwK5HGSv9K8huWHLouT3/g5yST4=; b=lkZ3KJZ475NMmm
	DDJx66DgBbK0swpm20MFCQpsQ2tVfCut6njgKQyDwo23IHCVEOos/TY6NXXrr7sofYydv00iMtBtY
	IktG3DxoRvTRQh0v3rKPMY7TGQwpRnzFaA4u0gAnKBbrpLwauPx0/5BKRQW027N5OxoaxvYE3ivky
	7KD/SQsj4zEr1PSi9TKQZnZ3Q3FogxlfBVl4i9IzITATQ2of52+93d4DzRQ3hJL1PHLYD5YQpkVda
	Ln4v2L85Nj8kaAst9dNtXZIfAfQu1JKna4YVRM5sNTVjfH9iiEsICTxIP6jMGuyXI1F4uWC60mBOU
	Gxa6f0ja1C6Xxx/O1jPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLc3y-00Fvdv-1e;
	Fri, 05 Jan 2024 04:44:06 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLc3v-00FvdV-1x
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jan 2024 04:44:04 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R881e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=49;SR=0;TI=SMTPD_---0VzzUQHt_1704429833;
Received: from 30.222.33.160(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0VzzUQHt_1704429833)
          by smtp.aliyun-inc.com;
          Fri, 05 Jan 2024 12:43:56 +0800
Message-ID: <a2c7910c-4c2f-4290-a895-1c4255b2ee62@linux.alibaba.com>
Date: Fri, 5 Jan 2024 12:43:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 for-6.8/block 11/17] erofs: use bdev api
To: Yu Kuai <yukuai1@huaweicloud.com>, Jan Kara <jack@suse.cz>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
 kent.overstreet@gmail.com, joern@lazybastard.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org, chao@kernel.org,
 tytso@mit.edu, adilger.kernel@dilger.ca, jack@suse.com,
 konishi.ryusuke@gmail.com, willy@infradead.org, akpm@linux-foundation.org,
 hare@suse.de, p.raghav@samsung.com, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, linux-nilfs@vger.kernel.org,
 yi.zhang@huawei.com, yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
 <20231221085826.1768395-1-yukuai1@huaweicloud.com>
 <20240104120207.ig7tfc3mgckwkp2n@quack3>
 <7f868579-f993-aaa1-b7d7-eccbe0b0173c@huaweicloud.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <7f868579-f993-aaa1-b7d7-eccbe0b0173c@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_204403_812905_0282E3B0 
X-CRM114-Status: UNSURE (   7.63  )
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

CgpPbiAyMDI0LzEvNCAyMDozMiwgWXUgS3VhaSB3cm90ZToKPiBIaSwgSmFuIQo+IAo+IOWcqCAy
MDI0LzAxLzA0IDIwOjAyLCBKYW4gS2FyYSDlhpnpgZM6Cj4+IE9uIFRodSAyMS0xMi0yMyAxNjo1
ODoyNiwgWXUgS3VhaSB3cm90ZToKPj4+IEZyb206IFl1IEt1YWkgPHl1a3VhaTNAaHVhd2VpLmNv
bT4KPj4+Cj4+PiBBdm9pZCB0byBhY2Nlc3MgYmRfaW5vZGUgZGlyZWN0bHksIHByZXBhcmUgdG8g
cmVtb3ZlIGJkX2lub2RlIGZyb20KPj4+IGJsb2NrX2RldmljZS4KPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBZdSBLdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+Cj4+Cj4+IEknbSBub3QgZXJvZnMgbWFp
bnRhaW5lciBidXQgSU1PIHRoaXMgaXMgcXVpdGUgdWdseSBhbmQgZ3Jvd3MgZXJvZnNfYnVmCj4+
IHVubmVjZXNzYXJpbHkuIEknZCByYXRoZXIgc3RvcmUgJ3NiJyBwb2ludGVyIGluIGVyb2ZzX2J1
ZiBhbmQgdGhlbiBkbyB0aGUKPj4gcmlnaHQgdGhpbmcgaW4gZXJvZnNfYnJlYWQoKSB3aGljaCBp
cyB0aGUgb25seSBwbGFjZSB0aGF0IHNlZW1zIHRvIGNhcmUKPj4gYWJvdXQgdGhlIGVyb2ZzX2lz
X2ZzY2FjaGVfbW9kZSgpIGRpc3RpbmN0aW9uLi4uIEFsc28gYmxrc3piaXRzIGlzIHRoZW4KPj4g
dHJpdmlhbGx5IHNiLT5zX2Jsb2Nrc2l6ZV9iaXRzIHNvIGl0IHdvdWxkIGFsbCBzZWVtIG11Y2gg
bW9yZQo+PiBzdHJhaWdodGZvcndhcmQuCj4gCj4gVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24s
IEknbGwgZm9sbG93IHRoaXMgdW5sZXNzIEdhbyBYaWFuZyBoYXMgb3RoZXIKPiBzdWdnZXN0aW9u
cy4KClllcywgdGhhdCB3b3VsZCBiZSBiZXR0ZXIsIEknbSBmaW5lIHdpdGggdGhhdC4gIFlldCBp
biB0aGUgZnV0dXJlIHdlCm1heSBzdXBwb3J0IGEgc2VwZXJhdGUgbGFyZ2UgZGlyYmxvY2tzaXpl
IG1vcmUgdGhhbiBibG9jayBzaXplLCBidXQKd2UgY291bGQgcmV2aXNpdCBsYXRlci4KClRoYW5r
cywKR2FvIFhpYW5nCgo+IAo+IEt1YWkKPj4KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSG9uemEKPj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
