Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D2AC28B28
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 05:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fmg3mHfV6pv5VmJEnYxxdnuIyHhEmohsQUtOqOXFYgE=; b=mL9/rJmyyfGGxTu+33pqKtaBah
	32Ns1YgNVV+WBB9rDo42BKV9B9XM6VRNIb12K6gTysTIWRjUsjPZH15malMuwuZwnLi0DaeOAsQe6
	M8jqICqqUv755Ti8OpNikAsBwOb67dR0FZ858rsUWwr3Ryqvvz/vl68YLcddSu+ae4muwH2ia63Z5
	syEoztdbj8XH8oijizLlrbOtBNw+RxT549ZGuVDl70ClfhMfyGBk2Vi5rz6pHMjB0l7Tg+Pqp3wdk
	VE5+Nu4jiWtKZt4jV9JwFm7y/FvQc80adRitkiEiM5KeCGNwFP7dJBXTm3jD0LS6Ks0hpWaLvpjcC
	HAn9ghAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttJlC-0000000Fpqm-01fb;
	Sat, 15 Mar 2025 05:08:34 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttJl9-0000000FpqE-1MJX
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 05:08:33 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4ZF8K91pNRz1f0sc;
	Sat, 15 Mar 2025 13:03:57 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id E65A61402E1;
	Sat, 15 Mar 2025 13:08:22 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 15 Mar 2025 13:08:22 +0800
Subject: Re: [v4 PATCH 10/13] ubifs: Use crypto_acomp interface
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	<linux-pm@vger.kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>,
	<netdev@vger.kernel.org>
References: <cover.1741954523.git.herbert@gondor.apana.org.au>
 <349a78bc53d3620a29cc6105b55985db51aa0a11.1741954523.git.herbert@gondor.apana.org.au>
 <023a23b0-d9fd-6d4d-d5a2-207e47419645@huawei.com>
 <Z9T79PKW0TFO-2xl@gondor.apana.org.au>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f4a51d32-0b04-2c27-924d-f3a54d6b63a5@huawei.com>
Date: Sat, 15 Mar 2025 13:08:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <Z9T79PKW0TFO-2xl@gondor.apana.org.au>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_220831_563314_9225DA3A 
X-CRM114-Status: GOOD (  12.00  )
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

1NogMjAyNS8zLzE1IDEyOjAzLCBIZXJiZXJ0IFh1INC0tcA6Cj4gT24gU2F0LCBNYXIgMTUsIDIw
MjUgYXQgMTE6NTQ6NDNBTSArMDgwMCwgWmhpaGFvIENoZW5nIHdyb3RlOgo+Pgo+PiBXZSBnZXQg
Y2FwaV9uYW1lIGJ5ICdjcnlwdG9fYWNvbXBfYWxnX25hbWUoY3J5cHRvX2Fjb21wX3JlcXRmbShy
ZXEpKScsIG5vdAo+PiBjb21wci0+bmFtZS4KPiAKPiBJdCBzaG91bGQgcmV0dXJuIHRoZSBzYW1l
IHN0cmluZy4KClRoZSBjcnlwdG9fYWNvbXBfYWxnX25hbWUoKSBnZXRzIG5hbWUgZnJvbSBjb21w
ci0+Y2ModGhlIG5hbWUgaXMgCmluaXRpYWxpemVkIGJ5IGNvbXByLT5jYXBpX25hbWUpLgpJIGdv
dCB0aGUgZm9sbG93aW5nIG1lc3NhZ2VzIGFmdGVyIHZlcmlmeWluZzoKWyAgMTU0LjkwNzA0OF0g
VUJJRlMgd2FybmluZyAodWJpMDowIHBpZCAxMTApOiB1Ymlmc19jb21wcmVzc19yZXEuaXNyYS4w
IApbdWJpZnNdOiBjYW5ub3QgY29tcHJlc3MgNDA5NiBieXRlcywgY29tcHJlc3NvciBkZWZsYXRl
LCBlcnJvciAtMTIsIApsZWF2ZSBkYXRhIHVuY29tcHJlc3NlZAoKVGhlICdkZWZsYXRlJyBpcyB6
bGliIGNvbXByZXNzb3IncyBjYXBpX25hbWUsIGJ1dCB3ZSBleHBlY3QgaXQgYmUgJ3psaWInIApo
ZXJlLgo+IAo+PiBUaGVyZSBhcmUgY29uZmxpY3RzIGluIHBhdGNoIDIgb24gdGhlIGxhdGVzdCBt
YWlubGluZSB2ZXJzaW9uLCBjYW4geW91Cj4+IHJlYmFzZSB0aGlzIHNlcmllcyBzbyBJIGNhbiBk
byBzb21lIHRlc3RzIGZvciBVQklGUy4KPiAKPiBUaGFua3MgZm9yIHRlc3RpbmchIEkndmUganVz
dCBwdXNoZWQgaXQgdG8KPiAKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvaGVyYmVydC9jcnlwdG9kZXYtMi42LmdpdCBhY29tcAo+IAo+IFNvIHlvdSBzaG91
bGQgYmUgYWJsZSB0byBwdWxsIHRoYXQgdG8gdGVzdC4KPiAKPiBDaGVlcnMsCj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
