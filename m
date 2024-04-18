Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615BAC4345F
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2024 09:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UkAvFoVaCIEtHfTZ/IaqMa7n4XTJLMZKUCUQDSj2yN8=; b=3B93H63n+IFd//
	FnxUt/bMOJH41P05lZ9nwchcXzZIgVh3KJURnz/BlhZ2kBY4BufXqhQF5FeKXEMZ89ZtI+JJxrjxs
	yi8r1tvJVLr77BugUsOkQhfwNxJw/gxDBP0rBvMppCA4qKjE0QTIz6mvtyg14OizR1X+XmHd8yhJo
	hU1sWojlzOEsU8xrdLYnGiRYVkwiGnSbnCLf0k7XYtahvxzdn4jU4GpfE5BJ+b01/baaS+8eN+en4
	4GOXE6cHMJZG/cKSji/AZ/htVj9DF/b2gCOLSlYGibBtD1PHAOveQvQHENfnZYQwJourq4CJbuLlA
	BSkS1PGOvfr8NYsL3F7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxNke-00000001Y0G-3uWY;
	Thu, 18 Apr 2024 09:08:16 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxNkX-00000001XyM-3JKu
	for linux-mtd@lists.infradead.org;
	Thu, 18 Apr 2024 09:08:14 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4VKsPM5CrJz4f3l84
	for <linux-mtd@lists.infradead.org>; Thu, 18 Apr 2024 17:07:51 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 6419E1A0175
	for <linux-mtd@lists.infradead.org>; Thu, 18 Apr 2024 17:07:56 +0800 (CST)
Received: from [10.174.179.247] (unknown [10.174.179.247])
	by APP2 (Coremail) with SMTP id Syh0CgC32w7q4iBmfXcbKg--.44051S3;
	Thu, 18 Apr 2024 17:07:56 +0800 (CST)
Message-ID: <6d826865-b296-627c-3f83-e0a18263de7a@huaweicloud.com>
Date: Thu, 18 Apr 2024 17:07:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] ubi: block: fix memleak in ubiblock_create()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linan122@huawei.com, yukuai3@huawei.com, yi.zhang@huawei.com,
 houtao1@huawei.com, yangerkun@huawei.com
References: <20231208074629.1656356-1-linan666@huaweicloud.com>
 <79703e8b-ce3a-4407-9750-05f9202039d4@moroto.mountain>
From: Li Nan <linan666@huaweicloud.com>
In-Reply-To: <79703e8b-ce3a-4407-9750-05f9202039d4@moroto.mountain>
X-CM-TRANSID: Syh0CgC32w7q4iBmfXcbKg--.44051S3
X-Coremail-Antispam: 1UD129KBjvdXoWrZrW7Gw47JFy3CryrtFWxtFb_yoWxAFbE9a
	n0vr95ZrWxAr9FywsrG3sYkwn8Jrn8t3y8ZrZ7JrZxur18ZFykGFZxX3s0ya15Za13uan0
	k345Kr4Igw1FgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbaAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l
	5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67
	AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3
	Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7IU1VOJ7UUUUU==
X-CM-SenderInfo: polqt0awwwqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_020810_115812_5E7992BD 
X-CRM114-Status: UNSURE (   7.10  )
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

SGksIGRhbiwKCuWcqCAyMDI0LzQvMTUgMTQ6MzMsIERhbiBDYXJwZW50ZXIg5YaZ6YGTOgo+IE9u
IEZyaSwgRGVjIDA4LCAyMDIzIGF0IDAzOjQ2OjI5UE0gKzA4MDAsIGxpbmFuNjY2QGh1YXdlaWNs
b3VkLmNvbSB3cm90ZToKPj4gRnJvbTogTGkgTmFuIDxsaW5hbjEyMkBodWF3ZWkuY29tPgo+Pgo+
PiBJZiBpZHJfYWxsb2MoKSBmYWlscywgZGV2LT5nZCB3aWxsIGJlIHB1dCBhZnRlciBnb3RvIG91
dF9jbGVhbnVwX2Rpc2sgaW4KPj4gdWJpYmxvY2tfY3JlYXRlKCksIGJ1dCBkZXYtPmdkIGhhcyBu
b3QgYmVlbiBhc3NpZ25lZCB5ZXQgYXQgdGhpcyB0aW1lLCBhbmQKPj4gJ2dkJyB3aWxsIG5vdCBi
ZSBwdXQgYW55bW9yZS4gRml4IGl0IGJ5IHB1dHRpbmcgJ2dkJyBkaXJlY3RseS4KPj4KPiAKPiBU
aGVyZSBpcyBhbm90aGVyIGludmFsaWQgcmVmZXJlbmNlIHRvIGRldi0+Z2QgaWYgYmxrX21xX2Fs
bG9jX3RhZ19zZXQoKQo+IGZhaWxzLgo+IAo+IAlkZXZfZXJyKGRpc2tfdG9fZGV2KGRldi0+Z2Qp
LCAiYmxrX21xX2FsbG9jX3RhZ19zZXQgZmFpbGVkIik7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBeXl5eXl5eCj4gCgpZb3UgYXJlIHJlYWxseSB2ZXJ5IGNhcmVmdWwhIEkgd2lsbCBm
aXggaXQgbGF0ZXIuCgo+IHJlZ2FyZHMsCj4gZGFuIGNhcnBlbnRlcgoKLS0gClRoYW5rcywKTmFu
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
