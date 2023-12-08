Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2390C4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Dec 2023 07:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xFQ36l6t0OP2scyE48vhPaaDTJlRkH3zRkakXuasAjA=; b=sizjemok4Uwpdi
	yw+XsOUovPNdEwA2w3gE0yiYb9OmZ45fHj5HAJmGgGDT8Cvs0SpkZJSAh9KAfXmmLn82hz8XGf7dZ
	QiPjqyeY56eGgJsgF0MZXbh+7obWQ0phSTQjfF+b67+XzWqUwanYTH+LO9GF/+fdkASsSMlThxmGu
	eq+LArdRtAOYYmq3vT1fjHlFXU2eFhA/u5rYepTmiPNVqnhoTKkaVjpyEgdJsVAyZiFIAFvkmpDqm
	3yHe33DXtMn34XdCD/eta1uEzBbVRn6lnnNNvmdsIAdenkL+2eLxby+HM8VYFJ3EBKhFEqOiLrt0g
	fNQ0OZknKz6hCtS1b/0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBVTp-00Eyeq-2m;
	Fri, 08 Dec 2023 07:41:01 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBVTm-00EydZ-0x
	for linux-mtd@lists.infradead.org;
	Fri, 08 Dec 2023 07:41:00 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Smjjk5L46z4f3l2K
	for <linux-mtd@lists.infradead.org>; Fri,  8 Dec 2023 15:40:42 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 13B221A032C
	for <linux-mtd@lists.infradead.org>; Fri,  8 Dec 2023 15:40:45 +0800 (CST)
Received: from [10.174.179.247] (unknown [10.174.179.247])
	by APP2 (Coremail) with SMTP id Syh0CgD3Tk15yHJlMbOhDA--.39237S3;
	Fri, 08 Dec 2023 15:40:44 +0800 (CST)
Message-ID: <4385d754-acbb-30b8-f311-ba542a8211e9@huaweicloud.com>
Date: Fri, 8 Dec 2023 15:40:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ubi: block: fix null-pointer-dereference in
 ubiblock_create()
To: Zhihao Cheng <chengzhihao1@huawei.com>, linan666@huaweicloud.com,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 yukuai3@huawei.com, yi.zhang@huawei.com, houtao1@huawei.com,
 yangerkun@huawei.com
References: <20231208071317.1268465-1-linan666@huaweicloud.com>
 <a1e3aa71-d89e-0579-b55f-125c17b45f29@huawei.com>
From: Li Nan <linan666@huaweicloud.com>
In-Reply-To: <a1e3aa71-d89e-0579-b55f-125c17b45f29@huawei.com>
X-CM-TRANSID: Syh0CgD3Tk15yHJlMbOhDA--.39237S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tF17Gr1rZw1fWr1fXw4fXwb_yoW8GFW7pa
	ykZa4Y9ryFkF1qkF4qq3WUXFZxJw48G3ykGFWxAw10qrW3Ary2krWa9r4qgrWkZF4xCaya
	qF17GrWrZFn7Xa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v
	4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQZ23UUUUU=
X-CM-SenderInfo: polqt0awwwqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_234058_705246_F27464D0 
X-CRM114-Status: GOOD (  11.09  )
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

CgrlnKggMjAyMy8xMi84IDE1OjI5LCBaaGloYW8gQ2hlbmcg5YaZ6YGTOgo+IOWcqCAyMDIzLzEy
LzggMTU6MTMsIGxpbmFuNjY2QGh1YXdlaWNsb3VkLmNvbSDlhpnpgZM6Cj4+IEZyb206IExpIE5h
biA8bGluYW4xMjJAaHVhd2VpLmNvbT4KPj4KPj4gSWYgaWRyX2FsbG9jKCkgZmFpbHMsIGRldi0+
Z2Qgd2lsbCBiZSBwdXQgYWZ0ZXIgZ290byBvdXRfY2xlYW51cF9kaXNrIGluCj4+IHViaWJsb2Nr
X2NyZWF0ZSgpLCBidXQgZGV2LT5nZCBoYXMgbm90IGJlZW4gYXNzaWduZWQgeWV0IGF0IHRoaXMg
dGltZSwgCj4+IGFuZAo+PiBhY2Nlc3NpbmcgaXQgd2lsbCB0cmlnZ2VyIGEgbnVsbC1wb2ludGVy
LWRlcmVmZXJlbmNlIGlzc3VlLiBGaXggaXQgYnkgcHV0Cj4+IGdkIGRpcmVjdGx5Lgo+IEZ1bmN0
aW9uICdwdXRfZGlzaygpJyBjaGVja3MgZGlzayB3aGV0aGVyIGlzIE5VTEwsIHNvIEkgdGhpbmsg
aXQncyBhIAo+ICdtZW1sZWFrJyBwcm9ibGVtLCBub3QgYSBudWxsLXB0ci1kZXJlZiBwcm9ibGVt
Lgo+PgoKRGFtbiwgSSBvdmVybG9va2VkIGl0IGhlcmUuIFRoYW5rcyBmb3IgeW91ciByZXZpZXcs
IEkgd2lsbCBmaXggdGhlIGxvZwppbiB2Mi4KCj4+IFNpZ25lZC1vZmYtYnk6IExpIE5hbiA8bGlu
YW4xMjJAaHVhd2VpLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvbXRkL3ViaS9ibG9jay5jIHwg
MiArLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jIGIvZHJpdmVycy9tdGQv
dWJpL2Jsb2NrLmMKPj4gaW5kZXggMzA5YTQyYWVhYTRjLi42NTRiZDczNzJjZDggMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS9i
bG9jay5jCj4+IEBAIC00MzQsNyArNDM0LDcgQEAgaW50IHViaWJsb2NrX2NyZWF0ZShzdHJ1Y3Qg
dWJpX3ZvbHVtZV9pbmZvICp2aSkKPj4gwqDCoMKgwqDCoCBsaXN0X2RlbCgmZGV2LT5saXN0KTsK
Pj4gwqDCoMKgwqDCoCBpZHJfcmVtb3ZlKCZ1YmlibG9ja19taW5vcl9pZHIsIGdkLT5maXJzdF9t
aW5vcik7Cj4+IMKgIG91dF9jbGVhbnVwX2Rpc2s6Cj4+IC3CoMKgwqAgcHV0X2Rpc2soZGV2LT5n
ZCk7Cj4+ICvCoMKgwqAgcHV0X2Rpc2soZ2QpOwo+IAo+IEZvciBtZW1sZWFrIHNvbHV0aW9uOgo+
IAo+IFJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+
IAo+PiDCoCBvdXRfZnJlZV90YWdzOgo+PiDCoMKgwqDCoMKgIGJsa19tcV9mcmVlX3RhZ19zZXQo
JmRldi0+dGFnX3NldCk7Cj4+IMKgIG91dF9mcmVlX2RldjoKPiAKPiAKPiAuCgotLSAKVGhhbmtz
LApOYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
