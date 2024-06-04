Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AD5C25B75
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2024 01:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	CC:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzd7odB6NjQppfXvqhv6gigo+PrE1vcYF70KZaWuUOs=; b=T8Tzvc/L2u85kFql49U8GrU9Vj
	BftqdKvxseGaToCCs9CZUJ7xOL0asGgHjLXQiNDbHfRalNHbiJsONMyjO4vJDW4kI0BuHzqm6ZXlY
	GdcxMnI+fkj/9DsgLxUwEXu2wHixCb9ycu1Drnr2ecXkHUhW21Bdok7Kf+n8pbqF3qi7sU33LQuIZ
	G3Mecr24PIvljm5Ibng6a3gC2IUQKLtIxhrxmSYRWONOzztvHH+1KxvM4cH3W7m1BGDnN5xE74Nnz
	qxzf+vtztZNlRbtmxW60XNss5dUeo2j/gwyhHrLlCf7PqjkrBJie8fgbu8jFbEhCgPMds0ZMHAtAO
	asLxTA6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEJM9-00000000rGZ-29Wk;
	Tue, 04 Jun 2024 01:52:57 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEJM5-00000000rG3-0mIR
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jun 2024 01:52:55 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4VtYRq2198zPpGM;
	Tue,  4 Jun 2024 09:49:27 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 2D9E8140109;
	Tue,  4 Jun 2024 09:52:43 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 09:52:42 +0800
Subject: Re: Lots of fastmap writes
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: Rickard x Andersson <rickaran@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>
CC: <rickard314.andersson@gmail.com>
References: <f59e5ae3-8193-43f3-604c-9a846d6e8ead@axis.com>
 <95a9872f-77b2-e9a0-f5dc-a376964bc93e@huawei.com>
Message-ID: <f92bb95d-05a1-315b-000c-5189004175d5@huawei.com>
Date: Tue, 4 Jun 2024 09:52:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <95a9872f-77b2-e9a0-f5dc-a376964bc93e@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_185253_446403_9E185917 
X-CRM114-Status: UNSURE (   9.11  )
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

5ZyoIDIwMjQvNi80IDk6NDEsIFpoaWhhbyBDaGVuZyDlhpnpgZM6Cj4g5ZyoIDIwMjQvNi8zIDE2
OjU1LCBSaWNrYXJkIHggQW5kZXJzc29uIOWGmemBkzoKPj4gSGksCj4+Cj4+IEkgaGF2ZSBhIHN5
c3RlbSBydW5uaW5nIExpbnV4IDUuMTAgd2hpY2ggbG9ncyBxdWl0ZSBhIGxvdCB0byBhIAo+PiBk
YXRhYmFzZS4gVGhlIHN5c3RlbSBoYXMgYmVlbiBydW5uaW5nIE9LIHNpbmNlIGJlZm9yZSBDaHJp
c3RtYXMgYnV0IAo+PiBub3cgaXQgdXN1YWxseSBmYWlscyBhZnRlciBhIGZldyBob3VycyB3aXRo
IGVycm9ycyBsaWtlIHRoZXNlOgo+Pgo+PiBNYXnCoCA2IDIyOjI5OjU4IDE3Mi4yNi4yMDMuOTDC
oMKgIHdhcm5pbmcgdWJpMiB3YXJuaW5nOiB1YmlfaW9fcmVhZDogCj4+IGVycm9yIC03NCAoRUND
IGVycm9yKSB3aGlsZSByZWFkaW5nIDU4IGJ5dGVzIGZyb20gUEVCIDE6MjMwODcyLCByZWFkIAo+
PiBvbmx5IDU4IGJ5dGVzLCByZXRyeQo+PiBNYXnCoCA3IDAwOjExOjA4IDE3Mi4yNi4yMDMuOTDC
oMKgIHdhcm5pbmcgdWJpMiB3YXJuaW5nOiB1YmlfaW9fcmVhZDogCj4+IGVycm9yIC03NCAoRUND
IGVycm9yKSB3aGlsZSByZWFkaW5nIDU4IGJ5dGVzIGZyb20gUEVCIDQwOjIzOTc1MiwgcmVhZCAK
Pj4gb25seSA1OCBieXRlcywgcmV0cnkKPj4gTWF5wqAgNyAwMDoxMTowOCAxNzIuMjYuMjAzLjkw
wqDCoCBlcnLCoMKgwqDCoCB1YmkyIGVycm9yOiB1YmlfaW9fcmVhZDogZXJyb3IgCj4+IC03NCAo
RUNDIGVycm9yKSB3aGlsZSByZWFkaW5nIDU4IGJ5dGVzIGZyb20gUEVCIDQwOjIzOTc1MiwgcmVh
ZCA1OCBieXRlcwo+Pgo+PiBGYXN0bWFwIGlzIHVzZWQgb24gdGhpcyBzeXN0ZW0uIFRoZSBFQ0Mg
ZXJyb3JzIGFyZSB1c3VhbGx5IGluIHRoZSAKPj4gZmFzdG1hcCBhcmVhLCBlcmFzZSBibG9ja3Mg
MC0gNjMuCj4+Cj4+IFdoZW4gbG9va2luZyBtb3JlIGNsb3NlbHkgYXQgdGhlIGVyYXNlIGNvdW50
ZXJzIHRoZXkgbG9vayBzb21ldGhpbmcgCj4+IGxpa2UgdGhpczoKPj4KPj4gMCAtIDYzOiAyOTYw
MAo+PiA2NCAtIDIwNDM6IDIyMDAKPiAKPiBUcnkgdGhpcyBzZXJpZXMgb2YgcGF0Y2hlcyAKPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyMzA4MTIwODAwMDUuMzE2MjEyNS0y
LWNoZW5nemhpaGFvMUBodWF3ZWkuY29tL1QvIAo+IAoKQlRXLCBhZnRlciBhcHBseWluZyB0aGUg
cGF0Y2hlcywgdGhlIGtlcm5lbCBzaG91bGQgcnVuIG9uIGEgbmV3IGZsYXNoLCAKdGhlIGltcHJv
dmVkIHdlYXItbGV2ZWxpbmcgYWxnb3JpdGhtIGNhbm5vdCByZXNjdWUgdGhlIHdvcm4gb3V0IGlt
YWdlLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
