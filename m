Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6CFC47422
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jan 2024 13:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vB7/KfyUV+Cf2rF72ZkrO5zJW7MNIxd3Bz8rMoy+3KQ=; b=s3raR+6pjpXMzV
	Fk5+eP+vocfVL07nDwvTD0Suk/7zqDkCsvm4G+sy/iII/F1BcKWlaIYgelBfC6aWHIlU5kfD968/L
	onBHvb1+98fvMJ9ncrk31qfvDsPd0ir3tN4Wb+Sgx7mlL7PaOsby+Fw/Jr40WL+7uutczXNWNuGS/
	T2jXSJjbLACSFarjNWWBd0AVdMQgeYNgsAq3Lnk5+IqNyqpUoqCkcV6LOoTX+faGLcTVu3FS2GyCm
	nyxJ0HtoBumD5+qapEDklZskfOvMI37rKL6PtGPMGV9y0mcvO/w/GQO92CylA7PH9w3CnVsgQk3cp
	L6IOCRIjHUKXywADqikA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURgq-0000000CrtU-09rG;
	Mon, 29 Jan 2024 13:28:44 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURgM-0000000CrWU-0P9l
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jan 2024 13:28:16 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4TNpyP5t88z4f3kK4
	for <linux-mtd@lists.infradead.org>; Mon, 29 Jan 2024 21:27:57 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 53BD81A016E
	for <linux-mtd@lists.infradead.org>; Mon, 29 Jan 2024 21:28:00 +0800 (CST)
Received: from [10.174.179.247] (unknown [10.174.179.247])
	by APP2 (Coremail) with SMTP id Syh0CgDH6w7fp7dl3CmSCQ--.20232S3;
	Mon, 29 Jan 2024 21:28:00 +0800 (CST)
Message-ID: <eac2fbfe-5565-96ad-68cb-11efa8af2ec8@huaweicloud.com>
Date: Mon, 29 Jan 2024 21:27:59 +0800
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
X-CM-TRANSID: Syh0CgDH6w7fp7dl3CmSCQ--.20232S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKry7KrWrWFyDAr43CFWUtwb_yoWkGrcE9w
	4aqr93XrWIkwn2k34jyry3ua1Ykr4UKrWkuF1ftws8XFW7XFn7AF93Kr15Ww4DAF429a4r
	A3W8Wr12yr40qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbS8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIF
	xwACI402YVCY1x02628vn2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUAkucUUUUU=
X-CM-SenderInfo: polqt0awwwqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_052814_411858_182F16A1 
X-CRM114-Status: GOOD (  12.86  )
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

ZnJpZW5kbHkgcGluZyAuLi4KCuWcqCAyMDIzLzEyLzggMTU6NDYsIGxpbmFuNjY2QGh1YXdlaWNs
b3VkLmNvbSDlhpnpgZM6Cj4gRnJvbTogTGkgTmFuIDxsaW5hbjEyMkBodWF3ZWkuY29tPgo+IAo+
IElmIGlkcl9hbGxvYygpIGZhaWxzLCBkZXYtPmdkIHdpbGwgYmUgcHV0IGFmdGVyIGdvdG8gb3V0
X2NsZWFudXBfZGlzayBpbgo+IHViaWJsb2NrX2NyZWF0ZSgpLCBidXQgZGV2LT5nZCBoYXMgbm90
IGJlZW4gYXNzaWduZWQgeWV0IGF0IHRoaXMgdGltZSwgYW5kCj4gJ2dkJyB3aWxsIG5vdCBiZSBw
dXQgYW55bW9yZS4gRml4IGl0IGJ5IHB1dHRpbmcgJ2dkJyBkaXJlY3RseS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBMaSBOYW4gPGxpbmFuMTIyQGh1YXdlaS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFpoaWhh
byBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoK
PiAgIC0gbW9kaWZ5IHRoZSBkZXNjcmlwdGlvbiBvZiB0aGUgcHJvYmxlbSBpbiBsb2cKPiAKPiAg
IGRyaXZlcnMvbXRkL3ViaS9ibG9jay5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3Vi
aS9ibG9jay5jIGIvZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMKPiBpbmRleCAzMDlhNDJhZWFhNGMu
LjY1NGJkNzM3MmNkOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91YmkvYmxvY2suYwo+ICsr
KyBiL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCj4gQEAgLTQzNCw3ICs0MzQsNyBAQCBpbnQgdWJp
YmxvY2tfY3JlYXRlKHN0cnVjdCB1Ymlfdm9sdW1lX2luZm8gKnZpKQo+ICAgCWxpc3RfZGVsKCZk
ZXYtPmxpc3QpOwo+ICAgCWlkcl9yZW1vdmUoJnViaWJsb2NrX21pbm9yX2lkciwgZ2QtPmZpcnN0
X21pbm9yKTsKPiAgIG91dF9jbGVhbnVwX2Rpc2s6Cj4gLQlwdXRfZGlzayhkZXYtPmdkKTsKPiAr
CXB1dF9kaXNrKGdkKTsKPiAgIG91dF9mcmVlX3RhZ3M6Cj4gICAJYmxrX21xX2ZyZWVfdGFnX3Nl
dCgmZGV2LT50YWdfc2V0KTsKPiAgIG91dF9mcmVlX2RldjoKCi0tIApUaGFua3MsCk5hbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
