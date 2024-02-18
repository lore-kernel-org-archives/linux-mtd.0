Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AA4C48BC3
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Feb 2024 01:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1NdPHrw0THvoWjAGNMqZTgu6xtPvN88KtcJq1D2IFw=; b=Rw+kKtWnoFV3tjnU0s783moBa1
	QhRcY9cAYgMeRzGFmTbfe6qRYQIslgO1ewr9X4FuPXSpAxTlcA4hzPym5vnTF+6HDK6EdvgD7S8Tn
	6zEPRLfOndJRrsy69ochtS9wuCS/j02qlGITb/HFTvF+aZA1PF+2R/bgI5aigdOzd88kamyZ458Ag
	QtUI+bl7nljpHDy7IQarDRQvHHE5bw9P43U0VDWILQ+cXiiGI5cHIcsfKhTQ/lTfZAU4uT8Do1RFt
	EaUEYcHktFpWHZVrEhc72a/Zdozo6Bx02bBlbP3v6kilq9A5wHCGKEFAMG/YL8vr/vLxLKuajz4bA
	A+7SbAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbVkm-00000006i4S-3840;
	Sun, 18 Feb 2024 01:14:00 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbVki-00000006i3P-2Bp3
	for linux-mtd@lists.infradead.org;
	Sun, 18 Feb 2024 01:13:58 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TcncM4vSQz1FKTg;
	Sun, 18 Feb 2024 09:08:51 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id B5AB314040D;
	Sun, 18 Feb 2024 09:13:39 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 18 Feb 2024 09:13:38 +0800
Subject: Re: [PATCH] jffs2: print symbolic error name instead of error code
To: Christian Heusel <christian@heusel.eu>, David Woodhouse
	<dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <kernel-janitors@vger.kernel.org>
References: <20240211003907.167891-1-christian@heusel.eu>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e4d00360-bb36-cfe1-5c0c-8e5b1c7bebc0@huawei.com>
Date: Sun, 18 Feb 2024 09:13:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240211003907.167891-1-christian@heusel.eu>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_171356_746118_6A656F6F 
X-CRM114-Status: GOOD (  14.90  )
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

1NogMjAyNC8yLzExIDg6MzksIENocmlzdGlhbiBIZXVzZWwg0LS1wDoKPiBVdGlsaXplIHRoZSAl
cGUgcHJpbnQgc3BlY2lmaWVyIHRvIGdldCB0aGUgc3ltYm9saWMgZXJyb3IgbmFtZSBhcyBhCj4g
c3RyaW5nIChpLmUgIi1FTk9NRU0iKSBpbiB0aGUgbG9nIG1lc3NhZ2UgaW5zdGVhZCBvZiB0aGUg
ZXJyb3IgY29kZSB0bwo+IGluY3JlYXNlIGl0cyByZWFkYWJsaWxpdHkuCj4gCj4gVGhpcyBjaGFu
Z2Ugd2FzIHN1Z2dlc3RlZCBpbgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC85Mjk3MjQ3
Ni0wYjFmLTRkMGEtOTk1MS1hZjNmYzhiYzZlNjVAc3Vzd2EubW91bnRhaW4vCj4gCj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXN0aWFuIEhldXNlbCA8Y2hyaXN0aWFuQGhldXNlbC5ldT4KPiAtLS0KPiAg
IGZzL2pmZnMyL2JhY2tncm91bmQuYyB8IDQgKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IAo+IGRpZmYgLS1naXQgYS9mcy9qZmZzMi9iYWNrZ3Jv
dW5kLmMgYi9mcy9qZmZzMi9iYWNrZ3JvdW5kLmMKPiBpbmRleCA2ZGE5MmVjYWY2NmQuLmJiMGVl
MWE1OWU3MSAxMDA2NDQKPiAtLS0gYS9mcy9qZmZzMi9iYWNrZ3JvdW5kLmMKPiArKysgYi9mcy9q
ZmZzMi9iYWNrZ3JvdW5kLmMKPiBAQCAtNDQsOCArNDQsOCBAQCBpbnQgamZmczJfc3RhcnRfZ2Fy
YmFnZV9jb2xsZWN0X3RocmVhZChzdHJ1Y3QgamZmczJfc2JfaW5mbyAqYykKPiAKPiAgIAl0c2sg
PSBrdGhyZWFkX3J1bihqZmZzMl9nYXJiYWdlX2NvbGxlY3RfdGhyZWFkLCBjLCAiamZmczJfZ2Nk
X210ZCVkIiwgYy0+bXRkLT5pbmRleCk7Cj4gICAJaWYgKElTX0VSUih0c2spKSB7Cj4gLQkJcHJf
d2FybigiZm9yayBmYWlsZWQgZm9yIEpGRlMyIGdhcmJhZ2UgY29sbGVjdCB0aHJlYWQ6ICVsZFxu
IiwKPiAtCQkJLVBUUl9FUlIodHNrKSk7Cj4gKwkJcHJfd2FybigiZm9yayBmYWlsZWQgZm9yIEpG
RlMyIGdhcmJhZ2UgY29sbGVjdCB0aHJlYWQ6ICVwZVxuIiwKPiArCQkJdHNrKTsKPiAgIAkJY29t
cGxldGUoJmMtPmdjX3RocmVhZF9leGl0KTsKPiAgIAkJcmV0ID0gUFRSX0VSUih0c2spOwo+ICAg
CX0gZWxzZSB7Cj4gLS0KPiAyLjQzLjEKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8KPiAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
