Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4396DCE7A94
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Sep 2023 14:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSX1YCWDmXsx1WVUIKiFJTAFmqIQrnxamQcQPcH6iS8=; b=S+we1d+0ZQ78Ab
	mS67PX/pwlhza4lBj0qsSd8k77ugTmpmzmYeNvp+KxJN8HNoqx0dCaJeL6B0mhMmsv2LfQC4tcOYp
	Ig2Rtfg9+muMcBkIDUpCxvrUfVWLCEHJCVk/h81jZzUGfzGVHQ0+48i3hP4Vr39SZ6H3UP8yvHV7s
	tjK/g3/HGNNwkE8JGBPt2CaT3X5n2rx/3EgtkD1B5RqPowfv+pf/CmCCb0avpiDBHkizmYzwZ5wGg
	Rr+fqCb1ufMvMFus+WLh8P+f4dO5hGSj1DCxcMxSmt6WGRGArUROTyAS7uTDgfzmnaNOQrRTmGVc/
	d7aM8rKSOg9ojkaaWSJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmTm-00EQue-3D;
	Mon, 25 Sep 2023 14:22:31 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmTj-00EQtV-2M
	for linux-mtd@lists.infradead.org;
	Mon, 25 Sep 2023 14:22:29 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RvQ2m3Cs5zNnfR;
	Mon, 25 Sep 2023 22:18:24 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 dggpemm500009.china.huawei.com (7.185.36.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 25 Sep 2023 22:22:12 +0800
Message-ID: <cc5c393d-c495-8f0d-9cc8-4e195c25c237@huawei.com>
Date: Mon, 25 Sep 2023 22:22:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [RFC] mtd: Fix error code loss in mtdchar_read() function.
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chengzhihao1@huawei.com>,
	<yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20230923005856.2538223-1-wangzhaolong1@huawei.com>
 <20230925104938.3f7b4284@xps-13>
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
In-Reply-To: <20230925104938.3f7b4284@xps-13>
X-Originating-IP: [10.174.178.209]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_072228_012317_AB5D076F 
X-CRM114-Status: UNSURE (   8.55  )
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

PiBUaGVyZSBpcyB0aGlzIGNvbW1lbnQgcmlnaHQgYWJvdmUsIGFuZCBJJ20gbm90IHN1cmUgaXQg
aXMgc3RpbGwgdXAgdG8KPiBkYXRlIGJlY2F1c2UgSSBiZWxpZXZlIG1hbnkgZHJpdmVycyBqdXN0
IGRvbid0IHByb3ZpZGUgdGhlIGRhdGEgdXBvbgo+IEVDQyBlcnJvcjoKCkFmdGVyIG9ic2Vydmlu
ZyB0aGUgbmFuZF9iYXNlIGZyYW1ld29yayBjb2RlLCBJIHRoaW5rIHRoZSBjdXJyZW50IG5hbmRf
YmFzZQpmcmFtZXdvcmsgY2FuIGxpbWl0IHRoZSBsZW5ndGggb2YgcmV0bGVuIHRvIDAgd2hlbiBh
biBFQ0MgZXJyb3Igb2NjdXJzLiBUaGUKcHJlcmVxdWlzaXRlIGlzIHRoYXQgdGhlIE5BTkQgZHJp
dmVyIGRldmVsb3BtZW50IHBlcnNvbm5lbCBjYW4gY29ycmVjdGx5IApwcm92aWRlCnRoZSByZXR1
cm4gdmFsdWUgb2YgdGhlIGZ1bmN0aW9uIGFjY29yZGluZyB0byB0aGUgcmVxdWlyZW1lbnRzIG9m
IHRoZSAKY2hpcC0+ZWNjLnJlYWRfcGFnZSgpCmNhbGxiYWNrLgoKSG93ZXZlciwgdGhlIHJlYWRf
cGFnZSgpIGNhbGxiYWNrIGNvbW1lbnQgZG9lcyBub3Qgbm90aWNlIHRoZSAKcGFydGljdWxhcml0
eSBvZiB0aGUKZm9sbG93aW5nIHR3byBlcnJvciBjb2RlczoKCiogLUVVQ0xFQU4gLSBSZXR1cm5l
ZCBieSB0aGUgTVREIGxheWVyIHdoZW4gbWF4Yml0ZmxpcHMgZ3JlYXRlciB0aGVuIApiaXRmbGlw
X3RocmVzaG9sZAoqIC1FQkFETVNHIC0gUmV0dXJuZWQgYnkgTkFORCBHZW5lcmljIExheWVyIHdo
ZW4gdGhlIHN0YXRpc3RpY2FsIEVDQyAKZXJyb3Igc3RhdHMKIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjaGFuZ2VzIGFuZCB0aGUgbnVtYmVyIG9mIHJl
dHJpZXMgaXMgZXhoYXVzdGVkLgoKVGhlc2UgdHdvIGVycm9yIGNvZGVzIGFyZSBoYW5kbGVkIGJ5
IHRoZSB1cHBlciBsYXllciBhbmQgc2hvdWxkIG5vdCBiZSAKcmV0dXJuZWQgYnkgdGhlCk5BTkQg
ZHJpdmVyIGRldmVsb3Blci4gQnV0IHNvbWUgZHJpdmVyIGRldmVsb3BlcnMgZG9uJ3QgcmVhbGl6
ZSB0aGlzLgoKU28gSSBkb24ndCB0aGluayBpdCdzIHdvcnRoIGZpeGluZyByaWdodCBub3csIGJ1
dCBpcyB0aGUgZGVzY3JpcHRpb24gb2YgCnRoZSByZXR1cm4gdmFsdWUgb2YgdGhlCmNhbGxiYWNr
IHRvbyBzaW1wbGlzdGljPyBJcyB0aGVyZSBhbnkgb3RoZXIgbW9yZSBkZXRhaWxlZCBkZXNjcmlw
dGlvbiAKZG9jdW1lbnQgZm9yIHJlZmVyZW5jZT8KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
