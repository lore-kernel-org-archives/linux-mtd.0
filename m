Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C64C5AD05
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Aug 2026 01:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNwkpwFMqGV4F8usWz+qrVdozXutnDDnMUOD+gW1Lik=; b=XtSgZScw9SYXOh+C/0wG8KqDcZ
	GpsLeV6YRFmzRJvH1dcXB7KUHGALLTIG5HS1GV4MF0dJCKAW3rn+cr/IQEhwpKpVYT/SRU915T4rD
	LnFJKNjN0V/kP8TTHnwvA+rsDMA8b5Mak+Fg5qRZVIJXWt/2qNoJsbzgIfqYa61AszIm9Uu8DeEwW
	Fg/HjhftqNm8vbznozrAe+MkzW7kGHrv6OCUD6/k46IYhTBHmgB9wPJbc/hdmxfqhF6y0FpwSDUzC
	GthqWVbITQrE6jqPtWNZPdeTlN8dxRjilCOOwtIfCZScxjwWMk7QX3YVX4bxZwngzWx/HU627Nw6T
	4mGH3Qug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsWDB-00000008yZl-16Ck;
	Sat, 08 Aug 2026 01:50:57 +0000
Received: from [113.46.200.217] (helo=canpmsgout02.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsWD8-00000008yYv-06IX
	for linux-mtd@lists.infradead.org;
	Sat, 08 Aug 2026 01:50:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FYEubiyYr6zS1fRSlm+uizseM6hbxeSSR9TZ4jFwLPE=;
	b=ijjjCSWbHGYQo4l4UiFOlOVbMe57x1p34SCgZlF6yO2U3072qNOL/fOt7RrzN4585vPYsuP/e
	J6ZGgMB6Pd3jgwc0qwH3GVTxKPCfOcakF0KxblByiYn0bNmmtw3oqhvUMzyMmpChiGJX8fwg1UP
	pj7cqEJd84SXdUkLRm0gPbs=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hH3cP0cdKzcb0T;
	Sat,  8 Aug 2026 09:40:21 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 59D884056D;
	Sat,  8 Aug 2026 09:50:20 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 8 Aug 2026 09:50:19 +0800
Subject: Re: [PATCH v1] mtd: ubi: Release device reference on busy detach
To: Yuho Choi <dbgh9129@gmail.com>, <richard@nod.at>
CC: <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260807204550.1016755-1-dbgh9129@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <27eaa6d4-cae1-2e44-6b46-a753c2475c50@huawei.com>
Date: Sat, 8 Aug 2026 09:50:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260807204550.1016755-1-dbgh9129@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_185054_555893_D72E1800 
X-CRM114-Status: GOOD (  13.46  )
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

1NogMjAyNi84LzggNDo0NSwgWXVobyBDaG9pINC0tcA6Cj4gdWJpX2RldGFjaF9tdGRfZGV2KCkg
b2J0YWlucyBhIGRldmljZSByZWZlcmVuY2UgdGhyb3VnaCB1YmlfZ2V0X2RldmljZSgpCj4gYmVm
b3JlIGNoZWNraW5nIHdoZXRoZXIgdGhlIFVCSSBkZXZpY2UgaXMgYnVzeS4gVGhlIGJ1c3kgcmV0
dXJuIHBhdGggZHJvcHMKPiB1YmktPnJlZl9jb3VudCBidXQgbGVhdmVzIHRoZSBkZXZpY2UgcmVm
ZXJlbmNlIGhlbGQsIHNvIHRoZSBkZXZpY2Ugb2JqZWN0Cj4gY2Fubm90IGJlIHJlbGVhc2VkIGFm
dGVyIGEgbGF0ZXIgZGV0YWNoLgo+IAo+IERyb3AgdGhlIGRldmljZSByZWZlcmVuY2UgYmVmb3Jl
IHJldHVybmluZyAtRUJVU1kuCj4gCj4gRml4ZXM6IDdlODRjOTYxYjJlYiAoIm10ZDogdWJpOiBp
bnRyb2R1Y2UgcHJlLXJlbW92YWwgbm90aWZpY2F0aW9uIGZvciBVQkkgdm9sdW1lcyIpCj4gU2ln
bmVkLW9mZi1ieTogWXVobyBDaG9pIDxkYmdoOTEyOUBnbWFpbC5jb20+Cj4gLS0tCj4gICBkcml2
ZXJzL210ZC91YmkvYnVpbGQuYyB8IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpJIHRoaW5rIHlvdSBoYXZlIHNlbnQgdGhpcyBwYXRjaCBiZWZvcmU/Cmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yNmM5Yzk1OS1hM2I2LWUxZGUtMTIxNS04ODc5OTBhNDY4
NzBAaHVhd2VpLmNvbS8KPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMg
Yi9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+IGluZGV4IDY3NGFkODc4MDlkZi4uZWU2Y2U0NDcx
YjI1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCj4gKysrIGIvZHJpdmVy
cy9tdGQvdWJpL2J1aWxkLmMKPiBAQCAtMTEwNSw2ICsxMTA1LDcgQEAgaW50IHViaV9kZXRhY2hf
bXRkX2RldihpbnQgdWJpX251bSwgaW50IGFueXdheSkKPiAgIAl1YmktPnJlZl9jb3VudCAtPSAx
Owo+ICAgCWlmICh1YmktPnJlZl9jb3VudCkgewo+ICAgCQlpZiAoIWFueXdheSkgewo+ICsJCQlw
dXRfZGV2aWNlKCZ1YmktPmRldik7Cj4gICAJCQlzcGluX3VubG9jaygmdWJpX2RldmljZXNfbG9j
ayk7Cj4gICAJCQlyZXR1cm4gLUVCVVNZOwo+ICAgCQl9Cj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
