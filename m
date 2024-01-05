Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC920C3DA6E
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jan 2024 10:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgjcnBsPPuYwgvv3mTH64urgAavFRu+13j9gRw/UWbY=; b=xAaX9Fdw9rI/z43nnxQEgjUpFf
	N2Wz8IPhB4oZcCWNq0lfulNF40MnwEzUB/hp73Q4gDeu9lQvoTmYX3eQVikRjvqJ8SCDLdjwjY9Xg
	Yr4+JiMfyAyEMzAVYt1u1IicYxAG9BpsSmP6qnYB34DszAw/ZZIB7Ok73qyy2lcDLAFajRvTk7OTT
	e9GRrEwb8Eca4vPpBLoEM8pcQffBuidzgSggT4Yykh746ehcRTXMYCTNvhkYDrOAAAhDF4rxjkvBc
	OwakYMQJmdHpsJ5f9IlKI1ORcwlDnubUKr6mX0D0MzdDrOUKZk7B7WD1T2G5MqxgpFUjzbIGWUoM7
	ZfCLUOrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLhUr-00GXdF-0N;
	Fri, 05 Jan 2024 10:32:13 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLhUm-00GXcc-1f
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jan 2024 10:32:10 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4T60BL30QYz4f3jMq
	for <linux-mtd@lists.infradead.org>; Fri,  5 Jan 2024 18:31:54 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id BC03A1A0818
	for <linux-mtd@lists.infradead.org>; Fri,  5 Jan 2024 18:31:57 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP1 (Coremail) with SMTP id cCh0CgDX2xGZ2pdlGeddFg--.44050S3;
	Fri, 05 Jan 2024 18:31:56 +0800 (CST)
Subject: Re: [PATCH RFC v3 for-6.8/block 04/17] mtd: block2mtd: use bdev apis
To: Christoph Hellwig <hch@infradead.org>, Jan Kara <jack@suse.cz>
Cc: Yu Kuai <yukuai1@huaweicloud.com>, axboe@kernel.dk, roger.pau@citrix.com,
 colyli@suse.de, kent.overstreet@gmail.com, joern@lazybastard.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
 nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
 adilger.kernel@dilger.ca, jack@suse.com, konishi.ryusuke@gmail.com,
 willy@infradead.org, akpm@linux-foundation.org, hare@suse.de,
 p.raghav@samsung.com, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, linux-nilfs@vger.kernel.org,
 yi.zhang@huawei.com, yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
 <20231221085712.1766333-5-yukuai1@huaweicloud.com>
 <20240104112855.uci45hhqaiitmsir@quack3> <ZZedSYAedA05Oex2@infradead.org>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <28237ec3-c3c1-1f0c-5250-04a88845d4a6@huaweicloud.com>
Date: Fri, 5 Jan 2024 18:31:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ZZedSYAedA05Oex2@infradead.org>
X-CM-TRANSID: cCh0CgDX2xGZ2pdlGeddFg--.44050S3
X-Coremail-Antispam: 1UD129KBjvdXoW7XryUXFWDtw1fXr4DKF17Jrb_yoWxuFgEgF
	yvkFZrKa13JrZ2vFsxKw15tFZ2ya47Zry8JrW0qay7W3s5Xa9rG3WkGr13XF1qqan7WFnI
	9r9FqayrKay2qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbaxFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWr
	Zr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUd8n5UUUUU=
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_023208_939417_F90D04B2 
X-CRM114-Status: GOOD (  11.58  )
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

SGksCgrU2iAyMDI0LzAxLzA1IDE0OjEwLCBDaHJpc3RvcGggSGVsbHdpZyDQtLXAOgo+IE9uIFRo
dSwgSmFuIDA0LCAyMDI0IGF0IDEyOjI4OjU1UE0gKzAxMDAsIEphbiBLYXJhIHdyb3RlOgo+PiBX
aGF0IGRvIHlvdSB0aGluaz8gQmVjYXVzZSB3aGVuIHdlIGFyZSB3b3JraW5nIHdpdGggdGhlIGZv
bGlvcyBpdCBpcyByYXRoZXIKPj4gbmF0dXJhbCB0byB1c2UgdGhlaXIgbWFwcGluZyBmb3IgZGly
dHkgYmFsYW5jaW5nPwo+IAo+IFRoZSByZWFsIHByb2JsZW0gaXMgdGhhdCBibG9jazJtdGQgcG9r
ZXMgd2F5IHRvIGRlZXAgaW50byBibG9jawo+IGludGVybmFscy4KPiAKPiBJIHRoaW5rIHRoZSBz
YXZpb3VyIGhlcmUgaXMgQ2hyaXN0aWFucyBzZXJpZXMgdG8gcmVwbGFjZSB0aGUgYmRldiBoYW5k
bGUKPiB3aXRoIGEgc3RydWN0IGZpbGUsIHdoaWNoIHdpbGwgYWxsb3cgdG8gdXNlIHRoZSBub3Jt
YWwgZmlsZSB3cml0ZSBwYXRoCj4gaGVyZSBhbmQgZ2V0IHJpZCBvZiB0aGUgZW50aXJlIGxheWVy
aW5nIHZvbGF0aW9uLgoKWWVzLCBsb29rcyBsaWtlIGxvdHMgb2YgcGF0Y2hlcyBmcm9tIHRoaXMg
c2V0IGlzIG5vdCBuZWVkZWQgYW55bW9yZS4KSSdsbCBzdG9wIHNlbmRpbmcgdjQgYW5kIGp1c3Qg
c2VuZCBzb21lIHBhdGNoZXMgdGhhdCBpcyBub3QgcmVsYXRlZCB0bwonYmRfaW5vZGUnIHNlcGFy
YXRlbHkuCgpUaGFua3MsCkt1YWkKCj4gCj4gLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
