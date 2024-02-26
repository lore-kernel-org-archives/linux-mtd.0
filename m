Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7A5C54798
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 02:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzDBJ2dKEsIDvN/aGKWGce/WKIWuCAy8Ylk8pvvc1Io=; b=vBjMYbkaES7YI5k+g2mAPTRRGR
	n8g0l7OC38uH3oby3WlEcOV+RLxK9jFF0povCITPNgnr99EuQjp833C899CNlvVUfVSue4Rrppyqj
	FF6s6IoYzxGFObY7h2kAuK/eyV0ELzI741iMguwBpneI0LcGYstorPsHyBLsuDiw0/PJ/uUwfTCpn
	tLC72JMxkOzoDawd4LjwNBGCOEhSEC8pfSgdpXhICFTmOq6WqAXwpMlTvihalu1E8LoX4HnGM4Tn6
	iqPQWWG75/rdIr7ce5VWw1dvU9/WTMIDs7BnQNIibZP/T2sC61IzJPEOrQXHmwqOp3F7iGp69fXzP
	B/L6YcRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reQUg-0000000G9Ls-21BO;
	Mon, 26 Feb 2024 02:13:26 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reQUd-0000000G9KK-3obF
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 02:13:25 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TjkcR3ff3z1h0bh;
	Mon, 26 Feb 2024 10:11:03 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 40B391A0178;
	Mon, 26 Feb 2024 10:13:16 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 10:13:14 +0800
Subject: Re: [PATCH] jffs2: remove SLAB_MEM_SPREAD flag usage
To: <chengming.zhou@linux.dev>, <dwmw2@infradead.org>, <richard@nod.at>,
	<jack@suse.cz>, <chuck.lever@oracle.com>, <dave.kleikamp@oracle.com>,
	<amir73il@gmail.com>
CC: <zhouchengming@bytedance.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <vbabka@suse.cz>,
	<roman.gushchin@linux.dev>, <Xiongwei.Song@windriver.com>
References: <20240224134915.829634-1-chengming.zhou@linux.dev>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <dac3e4b6-2915-7d77-f5d4-4ba8d510d952@huawei.com>
Date: Mon, 26 Feb 2024 10:13:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240224134915.829634-1-chengming.zhou@linux.dev>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_181324_138214_1272F5A0 
X-CRM114-Status: GOOD (  11.55  )
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

1NogMjAyNC8yLzI0IDIxOjQ5LCBjaGVuZ21pbmcuemhvdUBsaW51eC5kZXYg0LS1wDoKPiBGcm9t
OiBDaGVuZ21pbmcgWmhvdSA8emhvdWNoZW5nbWluZ0BieXRlZGFuY2UuY29tPgo+IAo+IFRoZSBT
TEFCX01FTV9TUFJFQUQgZmxhZyBpcyBhbHJlYWR5IGEgbm8tb3AgYXMgb2YgNi44LXJjMSwgcmVt
b3ZlCj4gaXRzIHVzYWdlIHNvIHdlIGNhbiBkZWxldGUgaXQgZnJvbSBzbGFiLiBObyBmdW5jdGlv
bmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaGVuZ21pbmcgWmhvdSA8emhvdWNoZW5n
bWluZ0BieXRlZGFuY2UuY29tPgo+IC0tLQo+ICAgZnMvamZmczIvc3VwZXIuYyB8IDIgKy0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKUmV2aWV3ZWQt
Ynk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gCj4gZGlmZiAtLWdp
dCBhL2ZzL2pmZnMyL3N1cGVyLmMgYi9mcy9qZmZzMi9zdXBlci5jCj4gaW5kZXggZjk5NTkxYTYz
NGI0Li5hZWRlMWJlNGRjMGMgMTAwNjQ0Cj4gLS0tIGEvZnMvamZmczIvc3VwZXIuYwo+ICsrKyBi
L2ZzL2pmZnMyL3N1cGVyLmMKPiBAQCAtMzg3LDcgKzM4Nyw3IEBAIHN0YXRpYyBpbnQgX19pbml0
IGluaXRfamZmczJfZnModm9pZCkKPiAgIAlqZmZzMl9pbm9kZV9jYWNoZXAgPSBrbWVtX2NhY2hl
X2NyZWF0ZSgiamZmczJfaSIsCj4gICAJCQkJCSAgICAgc2l6ZW9mKHN0cnVjdCBqZmZzMl9pbm9k
ZV9pbmZvKSwKPiAgIAkJCQkJICAgICAwLCAoU0xBQl9SRUNMQUlNX0FDQ09VTlR8Cj4gLQkJCQkJ
CVNMQUJfTUVNX1NQUkVBRHxTTEFCX0FDQ09VTlQpLAo+ICsJCQkJCQlTTEFCX0FDQ09VTlQpLAo+
ICAgCQkJCQkgICAgIGpmZnMyX2lfaW5pdF9vbmNlKTsKPiAgIAlpZiAoIWpmZnMyX2lub2RlX2Nh
Y2hlcCkgewo+ICAgCQlwcl9lcnIoImVycm9yOiBGYWlsZWQgdG8gaW5pdGlhbGlzZSBpbm9kZSBj
YWNoZVxuIik7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
