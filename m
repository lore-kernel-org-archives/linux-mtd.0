Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE08C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Dec 2021 12:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJeyD2b+JstSnVbqCjdIhKgN7c3ImmxDUieSu93Dkzk=; b=w1dWk4Cc/5YUh5F9e0q0SIO09v
	6i3xou3R+0h2E6a5TFXukhe0q9jgsoTiBsyR4lUZmDkJ8AAnRUBnAH3eZUfkkxmSg4cVs9Qe2hGZE
	ueDcS3thqBsXjrNBDCgUad1fta6KjoVWXUTSk3Q1zVxaGN8yVEUTqtO482vvtgq5WjQvMf80GtdQX
	qvdXh4Q2DeDd03DFaIQAl01vWu0zNqSdX9O2GtfGC3X0cWuSKljl0JIhUm+8fSkmsdrU8L15sP4od
	oCVPwqCtaA8GHZc6hOAu50m7BEpqoKGEog4bcMTEABV3NyjBkAxB4yvP17uyWaVaZiJuEsrwOtG1X
	7rLGP+Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2BmM-000uK9-Sw; Tue, 28 Dec 2021 12:40:34 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2BmJ-000uIH-NM
 for linux-mtd@lists.infradead.org; Tue, 28 Dec 2021 12:40:33 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4JNYvK6rwjz1DKHx;
 Tue, 28 Dec 2021 20:37:01 +0800 (CST)
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 20:40:18 +0800
Subject: Re: [PATCH -next V3] ubi: fix race condition between ctrl_cdev_ioctl
 and ubi_cdev_ioctl
To: Richard Weinberger <richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>, Hulk Robot
 <hulkci@huawei.com>, Baokun Li <libaokun1@huawei.com>
References: <20211105093022.1360601-1-libaokun1@huawei.com>
 <7e00eda5-3b35-6d3c-29fb-664b12cca6dd@huawei.com>
 <509065063.197038.1640293568550.JavaMail.zimbra@nod.at>
From: "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <e36106b0-2f7d-c618-4915-476168d7fa7a@huawei.com>
Date: Tue, 28 Dec 2021 20:40:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <509065063.197038.1640293568550.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_044031_992316_A5685389 
X-CRM114-Status: GOOD (  10.88  )
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

5ZyoIDIwMjEvMTIvMjQgNTowNiwgUmljaGFyZCBXZWluYmVyZ2VyIOWGmemBkzoKPiAtLS0tLSBV
cnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZvbjogImxpYmFva3VuIChBKSIgPGxpYmFva3Vu
MUBodWF3ZWkuY29tPgo+PiDlnKggMjAyMS8xMS81IDE3OjMwLCBCYW9rdW4gTGkg5YaZ6YGTOgo+
Pgo+PiBwaW5nCj4gVGhhbmtzIGZvciB5b3VyIHBhdGllbmNlLgo+ICAgCj4+PiBIdWxrIFJvYm90
IHJlcG9ydGVkIGEgS0FTQU4gcmVwb3J0IGFib3V0IHVzZS1hZnRlci1mcmVlOgo+IFsuLi5dCj4K
Pj4+IFRoZSBjYXVzZSBvZiB0aGlzIHByb2JsZW0gaXMgdGhhdCBjb21taXQgNzE0ZmI4N2U4YmMw
IG1ha2UgZGV2aWNlCj4+PiAiYXZhaWxhYmxlIiBiZWZvcmUgaXQgYmVjb21lcyBhY2Nlc3NpYmxl
IHZpYSBzeXNmcy4gVGhlcmVmb3JlLCB3ZQo+Pj4gcm9sbCBiYWNrIHRoZSBtb2RpZmljYXRpb24u
IFdlIHdpbGwgZml4IHRoZSByYWNlIGNvbmRpdGlvbiBiZXR3ZWVuCj4+PiB1YmkgZGV2aWNlIGNy
ZWF0aW9uIGFuZCB1ZGV2IGJ5IHJlbW92aW5nIHViaV9nZXRfZGV2aWNlIGluCj4+PiB2b2xfYXR0
cmlidXRlX3Nob3cgYW5kIGRldl9hdHRyaWJ1dGVfc2hvdy5UaGlzIGF2b2lkcyBhY2Nlc3NpbmcK
Pj4+IHVuaW5pdGlhbGl6ZWQgdWJpX2RldmljZXNbdWJpX251bV0uCj4+Pgo+Pj4gdWJpX2dldF9k
ZXZpY2UgaXMgdXNlZCB0byBwcmV2ZW50IGRldmljZXMgZnJvbSBiZWluZyBkZWxldGVkIGR1cmlu
Zwo+Pj4gc3lzZnMgZXhlY3V0aW9uLiBIb3dldmVyLCBub3cga2VybmZzIGVuc3VyZXMgdGhhdCBk
ZXZpY2VzIHdpbGwgbm90Cj4+PiBiZSBkZWxldGVkIGJlZm9yZSBhbGwgcmVmZXJlbmNlIGNvdW50
aW5nIGFyZSByZWxlYXNlZC4KPj4+IFRoZSBrZXkgcHJvY2VzcyBpcyBzaG93biBpbiB0aGUgZm9s
bG93aW5nIHN0YWNrLgo+IHViaV9nZXRfZGV2aWNlKCkgaW4gZGV2X2F0dHJpYnV0ZV9zaG93KCkg
aXMgdXNlZCB0byBkZXRlY3Qgd2hldGhlcgo+IHRoZSB1YmkgZGV2aWNlIGdvdCBkZXRhY2hlZCB3
aGlsZSB0aGUgc3lzZnMgZmlsZSBpcyBvcGVuLgo+Cj4gSG1tLiBJIHRob3VnaHQgZm9yIHN5c2Zz
IHRoaXMgaXMgbm90IHRoZSBjYXNlIHNpbmNlIHN5c2ZzIGRvZXMgbm90IGltcGxlbWVudAo+IGEg
cmVsZWFzZSgpIG1ldGhvZC4gU28ga2VybmZzX2RyYWluX29wZW5fZmlsZXMoKSB3aWxsIHJldHVy
biBlYXJseS4KPiBCdXQgdGhlcmUgaXMgYSBnb29kIGNoYW5jZSB0aGF0IEkgZG9uJ3QgZ290IGFs
bCBrZXJuZnMvc3lzZnMgZGV0YWlscy4KPgo+IFRoYW5rcywKPiAvL3JpY2hhcmQKPiAuCgpUaGFu
ayB5b3UgZm9yIHlvdXIgcmV2aWV3IQoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApCYW9rdW4gTGkK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
