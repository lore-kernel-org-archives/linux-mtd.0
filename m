Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF65C02198
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 09:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQeX1s5sqcBYgs6vpAzwvJPPgY8hBgF07wes8I8J1cw=; b=uNYjFYpbAz3H8L9UYSmX/b0n0H
	LklJr+XlwEPGpMW9DxFC8qblW6QyEYbb8j3e1uZMPEalCumauQOn/A9lcRSM5FG3YrOJWEg7oFJeE
	Uwk/2r+9oh5B+2NIPN9fU1rBfKZhGGYMhlphHZC+jR/Zezy6PlbF+ecuqOFwZb1Zv5xNB6EHU+52x
	Aa5t9dSrcLsITmr6QQBC0Tb8YvMVBq3bttNGGmWH+mScdLNP2b7qjGO5MtquJEaJUBKmt6YyOlNh4
	gr46N9UtQ2FuxLzDcRctOtjeeD+KGUW4dgeGDxixEF4tX8Taqmc0faWnk8eTHDf1B9xxtTr0T1Avi
	acGMo3bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKCe-00000007acX-19Jn;
	Tue, 18 Feb 2025 09:47:44 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkK0P-00000007XlS-1cxP
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 09:35:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YxvTf6Hl3zMrby;
	Tue, 18 Feb 2025 17:33:26 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 62B1C1A0188;
	Tue, 18 Feb 2025 17:34:56 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 18 Feb 2025 17:34:55 +0800
Subject: Re: [PATCH mtd-utils 2/5] ubifs-utils: ubifs.h: Include <fcntl.h>
To: Fabio Estevam <festevam@gmail.com>, <david.oberhollenzer@sigma-star.at>
CC: <raj.khem@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20250218001512.1862030-1-festevam@gmail.com>
 <20250218001512.1862030-2-festevam@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <41f11697-a6ba-c9c4-cd4e-b8fe19004eac@huawei.com>
Date: Tue, 18 Feb 2025 17:34:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250218001512.1862030-2-festevam@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_013505_612438_47004CF6 
X-CRM114-Status: GOOD (  13.50  )
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

1NogMjAyNS8yLzE4IDg6MTUsIEZhYmlvIEVzdGV2YW0g0LS1wDoKPiBJbmNsdWRlIHRoZSA8ZmNu
dGwuaD4gaGVhZGVyIGZpbGUgdG8gZml4IHRoZSBmb2xsb3dpbmcgZXJyb3IKPiB3aGVuIGJ1aWxk
aW5nIHdpdGggbXVzbDoKPiAKPiB8IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9naXQvdWJpZnMt
dXRpbHMvY29tbW9uL2NvbXByLmM6NDI6Cj4gfCAuLi9naXQvdWJpZnMtdXRpbHMvbGlidWJpZnMv
dWJpZnMuaDozMTM6OTogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICdsb2ZmX3QnOyBkaWQgeW91
IG1lYW4gJ29mZl90Jz8KPiB8ICAgMzEzIHwgICAgICAgICBsb2ZmX3QgdWlfc2l6ZTsKPiB8ICAg
ICAgIHwgICAgICAgICBefn5+fn4KPiB8ICAgICAgIHwgICAgICAgICBvZmZfdAo+IHwgLi4vZ2l0
L3ViaWZzLXV0aWxzL2xpYnViaWZzL3ViaWZzLmg6MTM0MTo5OiBlcnJvcjogdW5rbm93biB0eXBl
IG5hbWUgJ2xvZmZfdCc7IGRpZCB5b3UgbWVhbiAnb2ZmX3QnPwo+IHwgIDEzNDEgfCAgICAgICAg
IGxvZmZfdCBpX3NpemU7Cj4gfCAgICAgICB8ICAgICAgICAgXn5+fn5+Cj4gfCAgICAgICB8ICAg
ICAgICAgb2ZmX3QKPiB8IC4uL2dpdC91Ymlmcy11dGlscy9saWJ1Ymlmcy91Ymlmcy5oOjEzNDI6
OTogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICdsb2ZmX3QnOyBkaWQgeW91IG1lYW4gJ29mZl90
Jz8KPiB8ICAxMzQyIHwgICAgICAgICBsb2ZmX3QgZF9zaXplOwo+IHwgICAgICAgfCAgICAgICAg
IF5+fn5+fgo+IHwgICAgICAgfCAgICAgICAgIG9mZl90Cj4gfCAuLi9naXQvdWJpZnMtdXRpbHMv
bGlidWJpZnMvdWJpZnMuaDoxODk5OjQ0OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ2xvZmZf
dCc7IGRpZCB5b3UgbWVhbiAnb2ZmX3QnPwo+IHwgIDE4OTkgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGludCBkZWxldGlvbiwgbG9mZl90IG5ld19zaXplKTsKPiB8ICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fgo+IHwgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2ZmX3QKPiB8IG1h
a2U6ICoqKiBbTWFrZWZpbGU6NDg3ODogdWJpZnMtdXRpbHMvY29tbW9uL21rZnNfdWJpZnMtY29t
cHIub10gRXJyb3IgMQo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFt
QGdtYWlsLmNvbT4KPiAtLS0KPiAgIHViaWZzLXV0aWxzL2xpYnViaWZzL3ViaWZzLmggfCAxICsK
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS91Ymlm
cy11dGlscy9saWJ1Ymlmcy91Ymlmcy5oIGIvdWJpZnMtdXRpbHMvbGlidWJpZnMvdWJpZnMuaAo+
IGluZGV4IDA5MDhhMjI4OTIwOC4uMWM3YmM3YmQwYzgwIDEwMDY0NAo+IC0tLSBhL3ViaWZzLXV0
aWxzL2xpYnViaWZzL3ViaWZzLmgKPiArKysgYi91Ymlmcy11dGlscy9saWJ1Ymlmcy91Ymlmcy5o
Cj4gQEAgLTExLDYgKzExLDcgQEAKPiAgICNpZm5kZWYgX19VQklGU19IX18KPiAgICNkZWZpbmUg
X19VQklGU19IX18KPiAgIAo+ICsjaW5jbHVkZSA8ZmNudGwuaD4KPiAgICNpbmNsdWRlIDxzdHJp
bmcuaD4KPiAgIAo+ICAgI2luY2x1ZGUgImxpbnV4X3R5cGVzLmgiCj4gCgpUaGUgJ3ViaWZzLmgn
IGlzIGluY2x1ZGVkIGluICdkZWZzLmgnLCBzbyB0aGUgcHJvYmxlbSBkZXNjcmliZWQgaW4gZmly
c3QgCnBhdGNoIGNhbiBiZSBmaXhlZCBieSB0aGlzIHBhdGNoPwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
