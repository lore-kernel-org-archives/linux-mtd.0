Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13ACAC4167D
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 11:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiuhfdWZHObTMaSSbWljr4KUQrbmJFYLkHuth5hCpsM=; b=WEMzSHEw0dm1ObKDtm/aeT8bfc
	sqd+AW5zQ5R5coHiNmhaFHw9kob9uZaNWe9oqJ3zbj5f9HC/Y6Pdkq4n1wv5XDKoEMO8nEQlJ36C3
	v1fJPp5ivmHxdMTVtqnul33fzUrmjnQ1WjVQm6z3Br4Kk7EZpoRa5GnxBFiOjdCOx9Tk/LwAGg04u
	hwlEU6umIwy0Y9Ergkpnr1IB45mdt13We3AKeYO9XuGE/9JqPRrblsLPIPeT6FIlzvPNzymhq7JDs
	zEZDQj/MqEHodP4zJ7TxRdqFkyH8SYexlX3aG4xbKGASYn2uqAq7Ko8mhYfUAOjCCJZXkrXh9JuSx
	QqOU6wFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qysWQ-00BLXL-0R;
	Fri, 03 Nov 2023 11:39:30 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qysWN-00BLWm-0e
	for linux-mtd@lists.infradead.org;
	Fri, 03 Nov 2023 11:39:28 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SMJbm2LDjzrTXc;
	Fri,  3 Nov 2023 19:36:20 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 3 Nov 2023 19:39:24 +0800
Subject: Re: [PATCH v4 5/5] mtd: Add several functions to the fail_function
 list
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20231103065536.3778940-1-wangzhaolong1@huawei.com>
 <20231103065536.3778940-6-wangzhaolong1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <3a358dd2-a923-a55f-5803-7e97c1178dad@huawei.com>
Date: Fri, 3 Nov 2023 19:39:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20231103065536.3778940-6-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_043927_464542_39B4F39B 
X-CRM114-Status: UNSURE (   9.58  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyMy8xMS8zIDE0OjU1LCBaaGFvTG9uZyBXYW5nINC0tcA6Cj4gYWRkIG10ZF9yZWFkKCks
IG10ZF93cml0ZSgpLCBtdGRfZXJhc2UoKSwgbXRkX2Jsb2NrX21hcmtiYWQoKSB0bwo+IGZhaWxf
ZnVuY3Rpb24gbGlzdCBmb3IgdGVzdGluZyBwdXJwb3NlCj4gCj4gLSBTcGVjaWZ5IHRoZSBmdW5j
dGlvbiB0byBpbmplY3QgdGhlIGZhdWx0Cj4gZWNobyBtdGRfcmVhZCA+IC9zeXMva2VybmVsL2Rl
YnVnL2ZhaWxfZnVuY3Rpb24vaW5qZWN0Cj4gCj4gLSBTcGVjaWZpZXMgdGhlIHJldHVybiB2YWx1
ZSBvZiB0aGUgZnVuY3Rpb24gdG8gaW5qZWN0IHRoZSBmYXVsdAo+IHByaW50ZiAlI3ggLTEyID4g
L3N5cy9rZXJuZWwvZGVidWcvZmFpbF9mdW5jdGlvbi9tdGRfcmVhZC9yZXR2YWwKPiAKPiAtIFNw
ZWNpZnkgb3RoZXIgZmF1bHQgaW5qZWN0aW9uIGNvbmZpZ3VyYXRpb24gcGFyYW1ldGVycy4KPiBl
Y2hvIC0xID4gL3N5cy9rZXJuZWwvZGVidWcvZmFpbF9mdW5jdGlvbi90aW1lcwo+IGVjaG8gMTAw
ID4gL3N5cy9rZXJuZWwvZGVidWcvZmFpbF9mdW5jdGlvbi9wcm9iYWJpbGl0eQo+IGVjaG8gMTUg
PiAvc3lzL2tlcm5lbC9kZWJ1Zy9mYWlsX2Z1bmN0aW9uL3NwYWNlCj4gCj4gU2lnbmVkLW9mZi1i
eTogWmhhb0xvbmcgV2FuZyA8d2FuZ3poYW9sb25nMUBodWF3ZWkuY29tPgo+IC0tLQo+ICAgZHJp
dmVycy9tdGQvbXRkY29yZS5jIHwgNSArKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQo+IAoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdl
aS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
