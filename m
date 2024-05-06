Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892F0C10F16
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2024 13:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jdwPSUozzPJKasBwRCUu/t50s/nUwdLAxPBUrmwBV5Y=; b=Do5+eNkKIX9qu+
	kSbJ5xUXP+9fGEIe4zf9VJEItBjIDuHgFVzZjpU6oMCfJSElU3/VWP8qUVZoM+IfDtneYMppcTWFY
	vXhaG9ELxkgrB87+jpAvn4bgTaaM06mtn7An/blm6JTknMAiF6InOu3tYPnN1Ho/IW7/3j2HEtGc2
	jGOLvJvRVsSftbahDOrhMHtriGcKchBtC8JrjuijY5nfjtEX821/AZrxoP2HVbIIIJCgV4+BPd5fl
	AJvB5DqRHAsRU1hrrh6881KGPo7xFz0VyFF5LzxdLlqYWfNw3+K40mpUYV70rn7YBL4r3WDeO/SvY
	y9ic16aBJrpPWdv8MwHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yWD-00000007Tx9-2yLV;
	Mon, 06 May 2024 13:36:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yVl-00000007Tay-0wai
	for linux-mtd@bombadil.infradead.org;
	Mon, 06 May 2024 13:36:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PLvWOOR4KliZ94BamoogZkRGL8WWjBJheDipDdI0h84=; b=AIYCllol//yYlkS4bemNwPl0Df
	MJf1z6QSKXU6/b/2RSr7dAoqO+AemdAN7z2lzJ80lB1rV0UWMP1HFu22pZWzHVBYEiaGvsPGm1XoN
	i+oyaZ1BZBYChavJnWbU/jeLKypnOLWgMqHclBwBJfY8bFL1nrEKTpZvNmNl1fGRSZqQyMbajpLgY
	ooL+kzVdGOnGSKBgY/jhLOmDyWCgVyiZBPV6SeBL4VbOtoooFk0jWL0CLoeXZWFNr/YNEXry6Ve9C
	FyPwJQAyVnKWvuM11JmuOXdXgNuPKZQfyk262eIoeX1+wCFrNFBs9dWoOi4qMNcTwHRqQxTfu1b33
	xf5dErpA==;
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yVY-00000001j6O-3DIb
	for linux-mtd@lists.infradead.org;
	Mon, 06 May 2024 13:36:05 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4VY2Tm1dMGz4f3lX6
	for <linux-mtd@lists.infradead.org>; Mon,  6 May 2024 21:35:24 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 790A91A0572
	for <linux-mtd@lists.infradead.org>; Mon,  6 May 2024 21:35:29 +0800 (CST)
Received: from [10.174.179.247] (unknown [10.174.179.247])
	by APP2 (Coremail) with SMTP id Syh0CgC32w6a3DhmpivTMA--.53986S3;
	Mon, 06 May 2024 21:35:29 +0800 (CST)
Message-ID: <9bad9355-5b5a-de61-8c53-6e65ed3332b1@huaweicloud.com>
Date: Mon, 6 May 2024 21:35:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ubi: block: fix null-pointer-dereference in
 ubiblock_create()
To: Zhihao Cheng <chengzhihao1@huawei.com>, richard@nod.at,
 miquel.raynal@bootlin.com, vigneshr@ti.com, axboe@kernel.dk,
 chaitanya.kulkarni@wdc.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 yukuai3@huawei.com, yi.zhang@huawei.com, houtao1@huawei.com,
 yangerkun@huawei.com
References: <20240428071922.2270892-1-linan666@huaweicloud.com>
 <98698009-e3a2-5c00-7619-6b6e3422cd1b@huawei.com>
From: Li Nan <linan666@huaweicloud.com>
In-Reply-To: <98698009-e3a2-5c00-7619-6b6e3422cd1b@huawei.com>
X-CM-TRANSID: Syh0CgC32w6a3DhmpivTMA--.53986S3
X-Coremail-Antispam: 1UD129KBjvJXoWxur1xAr4DJryruFyUXFW3Awb_yoW5GFyUpF
	4kWa4jqrWrCrykWF4DJw1UCFy5Xw4UG3Z5Gr47Z3W8ZrWrJr1Igr4qqr1jgr48Jr4xJanI
	qF1UWrW8uF1xJw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9ab4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l
	5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67
	AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3
	Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7IU17DG7UUUUU==
X-CM-SenderInfo: polqt0awwwqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_143559_595341_13A1174E 
X-CRM114-Status: GOOD (  13.30  )
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

CgrlnKggMjAyNC80LzI4IDE1OjUxLCBaaGloYW8gQ2hlbmcg5YaZ6YGTOgo+IOWcqCAyMDI0LzQv
MjggMTU6MTksIGxpbmFuNjY2QGh1YXdlaWNsb3VkLmNvbSDlhpnpgZM6Cj4+IEZyb206IExpIE5h
biA8bGluYW4xMjJAaHVhd2VpLmNvbT4KPj4KPj4gU2ltaWxhciB0byBjb21taXQgYWRiZjRjNDk1
NGUzICgidWJpOiBibG9jazogZml4IG1lbWxlYWsgaW4KPj4gdWJpYmxvY2tfY3JlYXRlKCkiKSwg
J2Rldi0+Z2QnIGlzIG5vdCBhc3NpZ25lZCBidXQgZGVyZWZlcmVuY2VkIGlmCj4+IGJsa19tcV9h
bGxvY190YWdfc2V0KCkgZmFpbHMsIGFuZCBsZWFkaW5nIHRvIGEgbnVsbC1wb2ludGVyLWRlcmVm
ZXJlbmNlLgo+Pgo+PiBVc2luZyAnZ2QnIGRpcmVjdGx5IGhlcmUgaXMgbm90IGEgZ29vZCBpZGVh
LCB0b28uICdnZC0+cGFydDAuYmRfZGV2aWNlJwo+PiBpcyBub3QgaW5pdGlhbGl6ZWQgYXQgdGhp
cyBwb2ludC4gVGhlIGVycm9yIGxvZyB3aWxsIGJlOgo+PiDCoMKgIGJsb2NrIChudWxsKTogYmxv
Y2s6IGR5bmFtaWMgbWlub3IgYWxsb2NhdGlvbiBmYWlsZWQKPj4KPj4gRml4IGl0IGJ5IHVzaW5n
IHByX2VycigpIGFuZCBwcmludCB1YmkgaWQuCj4+Cj4+IEZpeGVzOiA3NzU2N2IyNWFiOWYgKCJ1
Ymk6IHVzZSBibGtfbXFfYWxsb2NfZGlzayBhbmQgYmxrX2NsZWFudXBfZGlzayIpCj4+IFNpZ25l
ZC1vZmYtYnk6IExpIE5hbiA8bGluYW4xMjJAaHVhd2VpLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZl
cnMvbXRkL3ViaS9ibG9jay5jIHwgNyArKysrLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC91YmkvYmxvY2suYyBiL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCj4+IGluZGV4IGY4MmUzNDIz
YWNiOS4uYmY3MzA4ZThlYzJmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC91YmkvYmxvY2su
Ywo+PiArKysgYi9kcml2ZXJzL210ZC91YmkvYmxvY2suYwo+PiBAQCAtMzkwLDcgKzM5MCw4IEBA
IGludCB1YmlibG9ja19jcmVhdGUoc3RydWN0IHViaV92b2x1bWVfaW5mbyAqdmkpCj4+IMKgwqDC
oMKgwqAgcmV0ID0gYmxrX21xX2FsbG9jX3RhZ19zZXQoJmRldi0+dGFnX3NldCk7Cj4+IMKgwqDC
oMKgwqAgaWYgKHJldCkgewo+PiAtwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkaXNrX3RvX2Rldihk
ZXYtPmdkKSwgImJsa19tcV9hbGxvY190YWdfc2V0IGZhaWxlZCIpOwo+PiArwqDCoMKgwqDCoMKg
wqAgcHJfZXJyKCJ1YmlibG9jayVkXyVkOiBibGtfbXFfYWxsb2NfdGFnX3NldCBmYWlsZWRcbiIs
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldi0+dWJpX251bSwgZGV2LT52b2xfaWQpOwo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXRfZnJlZV9kZXY7Cj4+IMKgwqDCoMKgwqAgfQo+
PiBAQCAtNDA3LDggKzQwOCw4IEBAIGludCB1YmlibG9ja19jcmVhdGUoc3RydWN0IHViaV92b2x1
bWVfaW5mbyAqdmkpCj4+IMKgwqDCoMKgwqAgZ2QtPm1pbm9ycyA9IDE7Cj4+IMKgwqDCoMKgwqAg
Z2QtPmZpcnN0X21pbm9yID0gaWRyX2FsbG9jKCZ1YmlibG9ja19taW5vcl9pZHIsIGRldiwgMCwg
MCwgCj4+IEdGUF9LRVJORUwpOwo+IAo+IFRoZXJlIGlzIG5vIG5lZWQgdG8gbW9kaWZ5IHRoaXMg
cGxhY2UuIFRoZSBkZXZpY2Ugb2YgJ2dkJyBpcyBpbml0aWFsaXplZCBpbiAKPiBibGtfbXFfYWxs
b2NfZGlzay4gUmVmZXIgdG8gbmJkX2Rldl9hZGQuCgoKVGhlIHByaW50IG9mIHRoaXMgZGV2X2Vy
cigpIGlzOgogICBibG9jayAobnVsbCk6IGJsb2NrOiBkeW5hbWljIG1pbm9yIGFsbG9jYXRpb24g
ZmFpbGVkCgl+fn5+fn4KVGhlcmUgaXMgbm8gaW5mb3JtYXRpb24gYWJvdXQgd2hpY2ggZGV2aWNl
IGZhaWxlZC4gZGV2X2VycigpCnVzZSAna29iamVjdF9uYW1lKCZkZXYtPmtvYmopJyBoZXJlLCB3
aGljaCBpcyBpbml0IGluIGRldmljZV9hZGRfZGlzaygpCmxhdGVyLiBTbyB1c2UgcHJfZXJyKCkg
aGVyZSBjYW4gcHJpbnQgbW9yZSBkZXRhaWwuCgpJIHdpbGwgc3BsaXQgdGhlIHBhdGNoIGludG8g
dHdvIGluIHYyIHRvIG1ha2UgaXQgY2xlYXJlci4KCj4+IMKgwqDCoMKgwqAgaWYgKGdkLT5maXJz
dF9taW5vciA8IDApIHsKPj4gLcKgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGlza190b19kZXYoZ2Qp
LAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiYmxvY2s6IGR5bmFtaWMgbWlub3IgYWxsb2Nh
dGlvbiBmYWlsZWQiKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHByX2VycigidWJpYmxvY2slZF8lZDog
YmxvY2s6IGR5bmFtaWMgbWlub3IgYWxsb2NhdGlvbiBmYWlsZWRcbiIsCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGRldi0+dWJpX251bSwgZGV2LT52b2xfaWQpOwo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0ID0gLUVOT0RFVjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X2NsZWFu
dXBfZGlzazsKPj4gwqDCoMKgwqDCoCB9Cj4+CgotLSAKVGhhbmtzLApOYW4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
