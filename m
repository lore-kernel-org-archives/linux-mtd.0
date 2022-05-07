Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC16C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  7 May 2022 02:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqK04yhgu6ddptF79dW8fYYN3qvK4KJ+GLAGAOfhBqc=; b=JVwM95WD707Uhzh4uZlzhpbAi/
	0CZRLmXYEFUISYgu3hINFeHC7JK8jzVyQ3SbpN1tvHXYYbv0npwOrofyIbbE62ii2c6qdOEpyKOdj
	fB2oZHdSiGigMQAuC89dQc1TocbRa4ZqfvYs72lAq2ad8cJYXH16oxIQjvFVetRv95bNM2VpyUBpE
	kGgHFK4Z9s9GiTprvnFNbgmnyVl9Ee9lo0Xo2q0N3zCo292Bn2swYdPw5VJ7gLdBqh0tVx/+IFqAD
	ctvEsSVqUKI7JulKhTQQ9MV9K9HoxEOTwtgXDyJJeM5qijDPD3ATKyhyBWOd0M0HO1RjDRb2LLj2z
	Rb2q+RoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnAbR-005o8X-G3; Sat, 07 May 2022 02:55:29 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnAbM-005o7i-FO
 for linux-mtd@lists.infradead.org; Sat, 07 May 2022 02:55:26 +0000
Received: from kwepemi100015.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KwBpr0hMzz1JBw9;
 Sat,  7 May 2022 10:54:12 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100015.china.huawei.com (7.221.188.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 7 May 2022 10:55:18 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 7 May 2022 10:55:18 +0800
Subject: Re: UBIFS: is the corrupted file in a finite state when power cut ?
To: =?UTF-8?B?6KKB5bu66bmP?= <yuanjp89@163.com>,
 <linux-mtd@lists.infradead.org>
References: <77eb7829.4ee3.1805aeab188.Coremail.yuanjp89@163.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <6e6de35c-662f-39bd-2a45-dd4cf85e9b1f@huawei.com>
Date: Sat, 7 May 2022 10:55:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <77eb7829.4ee3.1805aeab188.Coremail.yuanjp89@163.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_195524_716116_809F0E4D 
X-CRM114-Status: GOOD (  10.16  )
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

1NogMjAyMi80LzI0IDE3OjMyLCDUrL2oxfQg0LS1wDoKPiBUaGVzZSBxdWVzdGlvbnMgcHV6emxl
cyBtZSBhIGxvdCwgYW5kIG5vdCBtZW50aW9uZWQgaW4gdWJpZnMgZG9jdW1lbnRzLgo+IAo+IFEx
LiBQb3dlciBjdXQgd2hpbGUgd3JpdHRpbmcgdG8gYSBuZXcgZmlsZSwgIGRvZXMgdGhlIGZpbGUg
aXMgaW4gdGhlIGZvbGxvd2luZyBmaW5pdGUgc3RhdGUsIG5vdCBwb3NzaWJsZSBpbiBvdGhlciBz
dGF0ZSwgcmlnaHQgPwo+IAo+IAkxLiB0aGUgZmlsZSBub3QgZXhpc3RzLgo+IAkKPiAJMi4gdGhl
IGZpbGUgaXMgZW1wdHkuCj4gCQo+IAkzLiB0aGUgZmlsZSBzaXplIGlzIHBhcnRpYWwsIGJ1dCBu
byB0YWlsIGhvbGUuCj4gCQo+IAk0LiB0aGUgZmlsZSBzaXplIGlzIHBhcnRpYWwsIGJ1dCB3aXRo
IHRhaWwgaG9sZS4KPiAJCj4gCTUuIHRoZSBmaWxlIHNpemUgaXMgZW50aXJlLCBidXQgd2l0aCB0
YWlsIGhvbGUuCj4gCQo+IAk2LiB0aGUgZmlsZSBpcyByaWdodC4KPiAKQTEuIEFmdGVyIGxvb2tp
bmcgdGhyb3VnaCB1YmlmcydzIHdyaXRpbmcvcmVhZGluZyBhbmQgc2l6ZS1yZWNvdmVyeSAKcHJv
Y2VzcywgSSB0aGluayB0aGVyZSBhcmUgZm9sbG93aW5nIHN0YXRlczoKMS4gdGhlIGZpbGUgbm90
IGV4aXN0cy4KMi4gdGhlIGZpbGUgaXMgZW1wdHkuCjMuIGZpbGUgc2l6ZSA+IGRhdGEgbGVuZ3Ro
LCB3aXRoIHRhaWwgaG9sZS4gKFNlZSBkb19yZWFkcGFnZSgpKQo0LiB0aGUgZmlsZSBpcyByaWdo
dC4KCkJUVywgd2hhdCBkb2VzICdmaWxlIHNpemUgaXMgZW50aXJlL3BhcnRpYWwnIG1lYW4/Cj4g
UTIuIFBvd2VyIGN1dCB3aGlsZSB0cnVuY2F0aW5nIG9sZCBmaWxlIHRoZW4gd3JpdGUKPiAKPiAJ
MS4gdGhlIGZpbGUgaXMgbm90IGNoYW5nZWQuCj4gCQo+IAlvdGhlciBzdGF0ZXMgYXJlIHNhbWUg
YXMgUTEgMi8zLzQvNS82Cj4gCj4gUTMuIHBvd2VyIGN1dCBvbmx5IGxvc3QgdGFpbGluZyB3cml0
ZXMgPwo+IAo+IAl3cml0ZSAzIHRpbWVzOiBhIGIgYywgaXQncyBub3QgcG9zc2libGUgdGhhdCBi
IGlzIGxvc3QgYnV0IGEgYyB3cml0dGVuLgo+IAkKQTMuIFllcy4gVUJJRlMgcmVwbGF5cyBqb3Vy
bmFsIGluIG9yZGVyIGFjY29yZGluZyB0byBzcW51bS4gKFNlZSAKYXBwbHlfcmVwbGF5X2xpc3Qo
KSkKPiBRNC4gcG93ZXIgY3V0IG9ubHkgbG9zdCB3aG9sZSBtaW4gSS9PIHVuaXQgc2l6ZSA/Cj4g
Cj4gCXdpdGggMjA0OCBieXRlcyBtaW4gaW8gdW5pdCBzaXplLiB3cml0ZSAxMDAgYnl0ZXMgaW4g
b25lIHdyaXRlKCkgY2FsbC4KPiAJaXQncyBub3QgcG9zc2libGUgdGhhdCBzZWVuIDIwIGJ5dGVz
IHdpdGggODAgYnl0ZXMgbG9zdC4KQTQuIEZvciBEQVRBIGhlYWQsIHViaWZzIGRyb3BzIGFsbCBu
b2RlcyB1bnRpbCBhIGNvbXBsZXRlIGdyb3VwKFlvdSBtYXkgCnRyZWF0IGl0IGFzIGFuIGF0b21p
YyBvcGVyYXRpb24pLCBzZWUgdWJpZnNfcmVjb3Zlcl9sZWItPmRyb3BfbGFzdF9ncm91cC4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
