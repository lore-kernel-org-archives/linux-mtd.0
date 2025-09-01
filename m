Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55512CA1009
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 17:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/mnpioBx9RDOEzLBy7fV9Au8IhNG4EQBM+y0cL3YQu8=; b=CfTG1AnPcavnLB
	aFtPEiNdWeLU+xA/KK+vkqVbSXah7ss5DKvNNaHgdmd6M4fNEZeNERGAVPdM9TiiMsTr8x9XylT39
	ynFCQXt5d3AXFomU5dRf/8yaJSKVYRdVYlTc4np75CSWQWzEYwnm44d+EvlVs8zYZTLy4/82bguah
	d7+YgYNbcC+1AtjIUAfziOKUukqQic6xquWy8grS2bf0SV0rgv4MoK+baoZE2d+bOH5gTy+oCV3h8
	BH3GV1KtwCVJYU8s0MUciAmN41WKXeV7RFPvGYN+IJkDS/nbMkz66CAGSYG1pV0IGVqFD9qgwbU6N
	4Q52uiuc2ZbjqNspCQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8Kj-0000000DSUF-3HQe;
	Mon, 01 Sep 2025 17:28:45 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5IY-0000000CoYV-40tR
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 14:14:20 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4cFrTf1KYkzKHMXN
	for <linux-mtd@lists.infradead.org>; Mon,  1 Sep 2025 22:14:14 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 08C4A1A0AF3
	for <linux-mtd@lists.infradead.org>; Mon,  1 Sep 2025 22:14:14 +0800 (CST)
Received: from [10.174.178.209] (unknown [10.174.178.209])
	by APP4 (Coremail) with SMTP id gCh0CgAXYIw0qrVoS8AnBA--.50217S3;
	Mon, 01 Sep 2025 22:14:13 +0800 (CST)
Message-ID: <d07644fc-a5a4-4ba0-a8d3-b7bb2e06031e@huaweicloud.com>
Date: Mon, 1 Sep 2025 22:14:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] mtd: bad block counter inflated when repeatedly
 marking the same block
To: Zhihao Cheng <chengzhihao1@huawei.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org
Cc: yi.zhang@huawei.com, yangerkun@huawei.com
References: <ef573188-9815-4a6b-bad1-3d8ff7c9b16f@huaweicloud.com>
 <3ac8c8e7-df84-5595-86df-23064a1c64f8@huawei.com>
From: Wang Zhaolong <wangzhaolong@huaweicloud.com>
In-Reply-To: <3ac8c8e7-df84-5595-86df-23064a1c64f8@huawei.com>
X-CM-TRANSID: gCh0CgAXYIw0qrVoS8AnBA--.50217S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWDtryUCw1fArWfAF4xWFg_yoWDZFc_Wa
	s7Z34vva93JrsIvF17Gr1YvFWSqF95ZryDurW5Xrs7Wry5GFnxJa18Z39xJrZ5Ga1DJ34r
	CrWkWFy5u3WYkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbz8YFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUwxhLUUUUU
X-CM-SenderInfo: pzdqw6xkdrz0tqj6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_071419_178848_AE131251 
X-CRM114-Status: UNSURE (   7.92  )
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

Cj4+Cj4+IFBvc3NpYmxlIGZpeGVzIChoaWdoIGxldmVsKQo+PiAtIENvcmUtc2lkZSBjb25zZXJ2
YXRpdmUgZml4IChtaW5pbWFsIEFCSSBjaGFuZ2UpOgo+PiDCoMKgICogSW4gbXRkX2Jsb2NrX21h
cmtiYWQoKSwgcHJvYmUgX2Jsb2NrX2lzYmFkKG1hc3Rlciwgb2ZzKSBiZWZvcmUKPj4gwqDCoMKg
wqAgY2FsbGluZyBfYmxvY2tfbWFya2JhZCgpLCBhbmQgKGlmIGF2YWlsYWJsZSkgcHJvYmUgYWdh
aW4gYWZ0ZXIgc3VjY2Vzcy4KPj4gwqDCoCAqIE9ubHkgaW5jcmVtZW50IGVjY19zdGF0cy5iYWRi
bG9ja3MgaWYgdGhlIHN0YXRlIHRyYW5zaXRpb25lZCBmcm9tCj4+IMKgwqDCoMKgIOKAnGdvb2Ti
gJ0gdG8g4oCcYmFk4oCdLgo+IAo+IElNSE8sIHRoZSByZXR1cm4gdmFsdWUgb2YgX2Jsb2NrX21h
cmtiYWQoKSBpcyB1c2VkIHRvIGlkZW50aWZ5IHdoZXRoZXIgdGhlIGJsb2NrIGJlY29tZXMgYmFk
IHN1Y2Nlc3NmdWxseSBhZnRlciB0aGUgb3BlcmF0aW9uLCB0aGUgZXh0cmEgbWVzc2FnZShlZy4g
d2hldGhlciB0aGUgYmxvY2sgaXMgYWxyZWFkeSBiYWQgb3IgbmV3bHkgbWFya2VkIGFzIGJhZCkg
Y291bGQgYmUgcGFzc2VkIG91dCBmcm9tIGEgcG9pbnRlci10eXBlIGZ1bmN0aW9uIHBhcmFtZXRl
ci4KPiBTaW5jZSB0aGVyZSBpcyBvbmx5IG9uZSBwbGFjZSAobXRkX2Jsb2NrX21hcmtiYWQpIGlu
dm9rZXMgdGhlIF9ibG9ja19tYXJrYmFkKCksIEkgcHJlZmVyIHRoZSBjb25zZXJ2YXRpdmUoc2lt
cGxlKSBmaXguCj4gCgpUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uIQoKSSBhZ3JlZSB3aXRo
IHlvdXIgaW50ZXJwcmV0YXRpb24gb2YgX2Jsb2NrX21hcmtiYWQoKeKAmXMgcmV0dXJuIHZhbHVl
CigwID0gc3VjY2VzcywgPDAgPSBlcnJvcikuCgpHaXZlbiB0aGVyZSBpcyBvbmx5IG9uZSBjYWxs
ZXIgKG10ZF9ibG9ja19tYXJrYmFkKSwgSeKAmWxsIHByb2NlZWQgd2l0aAp0aGUgY29uc2VydmF0
aXZlIGZpeC4KClRoYW5rcyBhZ2FpbiEKCkJlc3QgcmVnYXJkcywKV2FuZyBaaGFvbG9uZwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
