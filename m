Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE6AC46CD4
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Dec 2023 08:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KA4pI3vWg6m4zPiFfW7A9hqBs2ihMiZJMZ+nsAGp+A=; b=D+moSv1HZ0wM+Zulwo61WkzWHq
	O++BIQoH8KgzZUF7DSM13pgxTVbUTmgvqwQjtqLVmdFbn5hugg0cbL0D9w62tKTU59zDNnZPmUPPG
	Ax7/QdHiMDSm2JXHv06lB8ARyfyfcaHQE7BnI5zv4HXXT0u9DLsEgB/HRFKqXUTAgsxKr/RxeVNyV
	aqYT17LXh2w+xKwZ2a/lW271QMd7UWpWTo5MiwWJOAHwbtOCcjLjoUPklcDFW96B5SkdvoVTZplGX
	dyjXJc5CIG+7p5OEZWCJ6Cxf3TTQkmdRrPABJ/F09wp5UgSYSP7FFrBtDz3eWQDgVPMj/fxcqOMi2
	Q5lPcpiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGb3C-005KaG-0N;
	Fri, 22 Dec 2023 08:38:34 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGb37-005KYl-2h
	for linux-mtd@lists.infradead.org;
	Fri, 22 Dec 2023 08:38:31 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4SxLKW0yd2zZddK;
	Fri, 22 Dec 2023 16:38:07 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 2B3EE18001A;
	Fri, 22 Dec 2023 16:38:15 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Dec 2023 16:38:12 +0800
Subject: Re: [PATCH 2/2] ubifs: ubifs_symlink: Fix memleak of inode->i_link in
 error path
To: Eric Biggers <ebiggers@kernel.org>
CC: <richard@nod.at>, <terrelln@fb.com>, <ext-adrian.hunter@nokia.com>,
	<linux-mtd@lists.infradead.org>
References: <20231222025025.2940450-1-chengzhihao1@huawei.com>
 <20231222025025.2940450-3-chengzhihao1@huawei.com>
 <20231222062256.GA98205@quark.localdomain>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <d3a5c29d-3d42-c1bb-54ba-a211f1a6e460@huawei.com>
Date: Fri, 22 Dec 2023 16:38:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20231222062256.GA98205@quark.localdomain>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_003830_039577_4E14F8A3 
X-CRM114-Status: UNSURE (   6.49  )
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

1NogMjAyMy8xMi8yMiAxNDoyMiwgRXJpYyBCaWdnZXJzINC0tcA6Cj4gZnNjcnlwdF9mcmVlX2lu
b2RlKCkgc2hvdWxkIGJlIGNhbGxlZCB1bmNvbmRpdGlvbmFsbHksIGJlY2F1c2UKPiBmc2NyeXB0
X2ZyZWVfaW5vZGUoKSBhbHJlYWR5IGNoZWNrcyBmb3IgSVNfRU5DUllQVEVEKCkuCj4KPiBBbHNv
LCBwbGVhc2UgYWRkICdDYzpzdGFibGVAdmdlci5rZXJuZWwub3JnJyB0byB5b3VyIGNvbW1pdCBt
ZXNzYWdlLgo+Cj4gQWxzbywgcGxlYXNlIGFkZGxpbnV4LWZzY3J5cHRAdmdlci5rZXJuZWwub3Jn
ICB0byB0aGUgcmVjaXBpZW50cyBvZiB0aGlzIHBhdGNoLgo+Cj4gQW55d2F5LCB0aGFua3MgZm9y
IGNhdGNoaW5nIHRoaXMgYnVnISAgSXQncyBhbm5veWluZyB0aGF0IG1ha2VfYmFkX2lub2RlKCkK
PiBjaGFuZ2VzIHRoZSBpbm9kZSdzIHR5cGUgZnJvbSBhIHN5bWxpbmsgdG8gYSByZWd1bGFyIGZp
bGU7IG5vcm1hbGx5IGFuIGlub2RlJ3MKPiB0eXBlIGNhbiBuZXZlciBjaGFuZ2UuICBZb3VyIGZp
eCBsb29rcyBmaW5lLCB0aG91Z2guICBUaGFua3MhCgpUaGFua3MgZm9yIHN1Z2dlc3Rpb25zLCBJ
IHdpbGwgbW9kaWZ5IHRoZW0gaW4gdjIuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
