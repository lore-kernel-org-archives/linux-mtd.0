Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D5EC46CD2
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Dec 2023 06:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LwW42jbpfPLjrlK4wmuOM1meBuiUHZ7QXiTFrwGNnvQ=; b=CbqnQ8/SIifNSH
	0N4PZAk9aZr4SoWAyEk5ruQ+2WvmMO4NpqTQ2mSGnbZG5D9a47YuLKEktocvLPs2RymbcjNiNE0HH
	sUvvfz+XzwaSkwNixQGChGFvsa4/N8BSUA3bA7uFlCm7tqjlhCiBarx4gLKPiBODEZN6yDzmAQ/W0
	VjK+dhpifuOQERzFYxxtwiKY5TP+Qwi7012ssHX85e+fYOser03sS71+ndi+W/ncHstahwZDBhOey
	x78Ey7DopnmTOQuURPiTTWGc2wtQb1cDP4+VVV+NNrhAaIY6+Kz6TS08QbUSZfIPcJB6Rw1Yv421x
	HKa89R2Y9QsGfNv2KdQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJSux-002HV6-0s;
	Sat, 30 Dec 2023 06:33:55 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJSut-002HTk-2p
	for linux-mtd@lists.infradead.org;
	Sat, 30 Dec 2023 06:33:53 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4T2C9x6KsPz4f3jM1
	for <linux-mtd@lists.infradead.org>; Sat, 30 Dec 2023 14:33:25 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 665F11A0964
	for <linux-mtd@lists.infradead.org>; Sat, 30 Dec 2023 14:33:31 +0800 (CST)
Received: from [10.174.179.247] (unknown [10.174.179.247])
	by APP2 (Coremail) with SMTP id Syh0CgAnyki6uY9lCnOaFA--.42895S3;
	Sat, 30 Dec 2023 14:33:31 +0800 (CST)
Message-ID: <9a4da75c-b6cf-0ee4-ef3b-5e19af6cb144@huaweicloud.com>
Date: Sat, 30 Dec 2023 14:33:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] ubi: block: fix memleak in ubiblock_create()
To: linan666@huaweicloud.com, richard@nod.at, miquel.raynal@bootlin.com,
 vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 yukuai3@huawei.com, yi.zhang@huawei.com, houtao1@huawei.com,
 yangerkun@huawei.com
References: <20231208074629.1656356-1-linan666@huaweicloud.com>
From: Li Nan <linan666@huaweicloud.com>
In-Reply-To: <20231208074629.1656356-1-linan666@huaweicloud.com>
X-CM-TRANSID: Syh0CgAnyki6uY9lCnOaFA--.42895S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKry7KrWrWFyDAr43CFWUtwb_yoWkGrcE9w
	4aqr93XrWIkwn2k34jyry3ua1Ykr4UKrWkuF1ftws8XFW7XFn7AF93Kr15Ww4DAF429a4r
	A3W8Wr12yr40qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbfAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7
	M4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VU1c4S5UUUUU==
X-CM-SenderInfo: polqt0awwwqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_223352_116226_B9ABBFD4 
X-CRM114-Status: GOOD (  12.32  )
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

ZnJpZW5kbHkgcGluZy4uLgoK5ZyoIDIwMjMvMTIvOCAxNTo0NiwgbGluYW42NjZAaHVhd2VpY2xv
dWQuY29tIOWGmemBkzoKPiBGcm9tOiBMaSBOYW4gPGxpbmFuMTIyQGh1YXdlaS5jb20+Cj4gCj4g
SWYgaWRyX2FsbG9jKCkgZmFpbHMsIGRldi0+Z2Qgd2lsbCBiZSBwdXQgYWZ0ZXIgZ290byBvdXRf
Y2xlYW51cF9kaXNrIGluCj4gdWJpYmxvY2tfY3JlYXRlKCksIGJ1dCBkZXYtPmdkIGhhcyBub3Qg
YmVlbiBhc3NpZ25lZCB5ZXQgYXQgdGhpcyB0aW1lLCBhbmQKPiAnZ2QnIHdpbGwgbm90IGJlIHB1
dCBhbnltb3JlLiBGaXggaXQgYnkgcHV0dGluZyAnZ2QnIGRpcmVjdGx5Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IExpIE5hbiA8bGluYW4xMjJAaHVhd2VpLmNvbT4KPiBSZXZpZXdlZC1ieTogWmhpaGFv
IENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+
ICAgLSBtb2RpZnkgdGhlIGRlc2NyaXB0aW9uIG9mIHRoZSBwcm9ibGVtIGluIGxvZwo+IAo+ICAg
ZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJp
L2Jsb2NrLmMgYi9kcml2ZXJzL210ZC91YmkvYmxvY2suYwo+IGluZGV4IDMwOWE0MmFlYWE0Yy4u
NjU0YmQ3MzcyY2Q4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCj4gKysr
IGIvZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMKPiBAQCAtNDM0LDcgKzQzNCw3IEBAIGludCB1Ymli
bG9ja19jcmVhdGUoc3RydWN0IHViaV92b2x1bWVfaW5mbyAqdmkpCj4gICAJbGlzdF9kZWwoJmRl
di0+bGlzdCk7Cj4gICAJaWRyX3JlbW92ZSgmdWJpYmxvY2tfbWlub3JfaWRyLCBnZC0+Zmlyc3Rf
bWlub3IpOwo+ICAgb3V0X2NsZWFudXBfZGlzazoKPiAtCXB1dF9kaXNrKGRldi0+Z2QpOwo+ICsJ
cHV0X2Rpc2soZ2QpOwo+ICAgb3V0X2ZyZWVfdGFnczoKPiAgIAlibGtfbXFfZnJlZV90YWdfc2V0
KCZkZXYtPnRhZ19zZXQpOwo+ICAgb3V0X2ZyZWVfZGV2OgoKLS0gClRoYW5rcywKTmFuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
