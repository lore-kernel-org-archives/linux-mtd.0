Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D688CCF9E9
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 11:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fQsLR0E406gagE5eKro+ThKnorA6eewQi/xGULjk0o=; b=4nQepN/TxqyfIH24RlIepHvEFg
	HrDPEoU5V3lyoriM4N1vBLvSyjzfNGHgU0WUXrfH4hSfiVfbAm4Uds9E2HZVyZWybo/l4R+rGH39Z
	Fjkt44lT0RHxF+RtmAAxEIbVk0lw7Vv7o6mg/rjctoQiNISq84k1b4hH6wrbbciAKT0n/HK07Djxz
	cXJ6lmOkh6RJmHJVqiaAYdf7sAjiNfOS/WcIw8u6eI5DvxXii9SnQHyTAoHypTkHWozonb2ptrXUa
	g00DM42hdlBxG8x6+19bVXSwwekU3XHlWbQWXGPcMfWgkULgRL8Ki4gsa6B9ZlCK2/8/taYy5zLY6
	1TNcfFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stmQm-00000008Bdb-3xF1;
	Thu, 26 Sep 2024 11:13:09 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stmQi-00000008Bbw-1EUk
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 11:13:06 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4XDrXM5htwz1SBnY;
	Thu, 26 Sep 2024 19:12:03 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 0BD191402CD;
	Thu, 26 Sep 2024 19:12:53 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 19:12:52 +0800
Subject: Re: [PATCH 1/2] ubifs: Call iput(xino) only once in
 ubifs_purge_xattrs()
To: Markus Elfring <Markus.Elfring@web.de>, <linux-mtd@lists.infradead.org>,
	Richard Weinberger <richard@nod.at>
CC: LKML <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <ff787fb9-a9fc-4798-8460-3ec310e6cd9f@web.de>
 <c5bd9bb7-2636-4c48-9623-4c93ded3469c@web.de>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <002d1dee-0e34-279d-c2e6-3d0fdfa385af@huawei.com>
Date: Thu, 26 Sep 2024 19:12:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c5bd9bb7-2636-4c48-9623-4c93ded3469c@web.de>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_041304_630116_4AB7478C 
X-CRM114-Status: GOOD (  15.02  )
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

5ZyoIDIwMjQvOS8yNiAxNzo0OSwgTWFya3VzIEVsZnJpbmcg5YaZ6YGTOgo+IEZyb206IE1hcmt1
cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4KPiBEYXRlOiBUaHUsIDI2
IFNlcCAyMDI0IDExOjA1OjI5ICswMjAwCj4gCj4gQW4gaXB1dCh4aW5vKSBjYWxsIHdhcyBpbW1l
ZGlhdGVseSB1c2VkIGFmdGVyIGEgcmV0dXJuIHZhbHVlIGNoZWNrCj4gZm9yIGEgcmVtb3ZlX3hh
dHRyKCkgY2FsbCBpbiB0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uLgo+IFRodXMgY2FsbCBz
dWNoIGEgZnVuY3Rpb24gb25seSBvbmNlIGluc3RlYWQgZGlyZWN0bHkgYmVmb3JlIHRoZSBjaGVj
ay4KPiAKPiBUaGlzIGlzc3VlIHdhcyB0cmFuc2Zvcm1lZCBieSB1c2luZyB0aGUgQ29jY2luZWxs
ZSBzb2Z0d2FyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgRWxmcmluZyA8ZWxmcmluZ0B1
c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+Cj4gLS0tCj4gICBmcy91Ymlmcy94YXR0ci5jIHwgNCArLS0t
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCj4gCgpS
ZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBkaWZm
IC0tZ2l0IGEvZnMvdWJpZnMveGF0dHIuYyBiL2ZzL3ViaWZzL3hhdHRyLmMKPiBpbmRleCBmNzM0
NTg4YjIyNGEuLjc3NTc5NTllOWYwOSAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy94YXR0ci5jCj4g
KysrIGIvZnMvdWJpZnMveGF0dHIuYwo+IEBAIC01NDEsMTYgKzU0MSwxNCBAQCBpbnQgdWJpZnNf
cHVyZ2VfeGF0dHJzKHN0cnVjdCBpbm9kZSAqaG9zdCkKPiAKPiAgIAkJY2xlYXJfbmxpbmsoeGlu
byk7Cj4gICAJCWVyciA9IHJlbW92ZV94YXR0cihjLCBob3N0LCB4aW5vLCAmbm0pOwo+ICsJCWlw
dXQoeGlubyk7Cj4gICAJCWlmIChlcnIpIHsKPiAgIAkJCWtmcmVlKHB4ZW50KTsKPiAgIAkJCWtm
cmVlKHhlbnQpOwo+IC0JCQlpcHV0KHhpbm8pOwo+ICAgCQkJdWJpZnNfZXJyKGMsICJjYW5ub3Qg
cmVtb3ZlIHhhdHRyLCBlcnJvciAlZCIsIGVycik7Cj4gICAJCQlnb3RvIG91dF9lcnI7Cj4gICAJ
CX0KPiAKPiAtCQlpcHV0KHhpbm8pOwo+IC0KPiAgIAkJa2ZyZWUocHhlbnQpOwo+ICAgCQlweGVu
dCA9IHhlbnQ7Cj4gICAJCWtleV9yZWFkKGMsICZ4ZW50LT5rZXksICZrZXkpOwo+IC0tCj4gMi40
Ni4xCj4gCj4gLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
