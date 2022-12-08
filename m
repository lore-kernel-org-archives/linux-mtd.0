Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BA7C3A5A7
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 12:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d0qsijWSe3uVdyaoTdWC0Oy/IxtZU3fq1bdvUf/q7HY=; b=Ar392HdMfgd01L
	vJAJ5Kkg3vAePmKk/W2H0JmWjfcOXUzqhagQRDMCe9Qz6rJPB2OQ+56iC82fsLQ76LBsLmov+aEq/
	be3ocj3Myh9CV3qr3s+eJzfDbNxpoNa0l/5HkJHC0xODpLPDcW8GQfjeoyfSroUILhlZJ2QlVc8km
	FXvfyHayzlJF2LJYjSRgMDNve7V19TkGW2XiPdjFkdYcvoLtRDiYNdbbo243Uc4OBsXR4H6N8YwGq
	9eopGQSwU7P634kHApuSlWXKizq4O1nxIQHBPmIptJbiWxgQu2OsUQ1DMmIbvoEkhvNC44J7vCxYW
	WcM1wLkuX4ToeHzAZs3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Fcj-00G8uS-QS; Thu, 08 Dec 2022 12:03:33 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Fcd-00G8gB-On
	for linux-mtd@lists.infradead.org; Thu, 08 Dec 2022 12:03:32 +0000
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NSXlF1470zJp8v;
	Thu,  8 Dec 2022 19:59:53 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Dec 2022 20:03:24 +0800
Message-ID: <694c5b4a-d193-b183-11e2-94eac0ff45ba@huawei.com>
Date: Thu, 8 Dec 2022 20:03:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 RESEND] mtd: parsers: Fix potential memory leak in
 mtd_parser_tplink_safeloader_parse()
To: Dan Carpenter <error27@gmail.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<rafal@milecki.pl>, <linux-mtd@lists.infradead.org>
References: <20221208113620.78855-1-yuancan@huawei.com>
 <Y5HQNxsCI5yfd+dV@kadam>
From: Yuan Can <yuancan@huawei.com>
In-Reply-To: <Y5HQNxsCI5yfd+dV@kadam>
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_040328_014766_52F892BA 
X-CRM114-Status: GOOD (  17.02  )
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

CuWcqCAyMDIyLzEyLzggMTk6NTMsIERhbiBDYXJwZW50ZXIg5YaZ6YGTOgo+IE9uIFRodSwgRGVj
IDA4LCAyMDIyIGF0IDExOjM2OjIwQU0gKzAwMDAsIFl1YW4gQ2FuIHdyb3RlOgo+PiBUaGUgcGFy
dHMgbmVlZHMgdG8gYmUgZnJlZWQgd2l0aCBhbGwgaXRzIGVsZW1lbnRzLCBvdGhlcndpc2UgaXQg
d2lsbCBiZQo+PiBsZWFrZWQuCj4+Cj4+IEZpeGVzOiAwMGEzNTg4MDg0YmUgKCJtdGQ6IHBhcnNl
cnM6IGFkZCBUUC1MaW5rIFNhZmVMb2FkZXIgcGFydGl0aW9ucyB0YWJsZSBwYXJzZXIiKQo+PiBT
aWduZWQtb2ZmLWJ5OiBZdWFuIENhbiA8eXVhbmNhbkBodWF3ZWkuY29tPgo+PiAtLS0KPj4gQ2hh
bmdlcyBpbiB2MjoKPj4gLSBBZGQgYSBuZXcgbGFiZWwgZXJyX2ZyZWVfcGFydHMgYW5kIGp1bXBz
IHRvIGl0IHdoZW4KPj4gICAgbXRkX3BhcnNlcl90cGxpbmtfc2FmZWxvYWRlcl9yZWFkX3RhYmxl
KCkgZmFpbGVkIHRvIGF2b2lkIGxlYWtpbmcgcGFydHMuCj4+Cj4gUmV2aWV3ZWQtYnk6IERhbiBD
YXJwZW50ZXIgPGVycm9yMjdAZ21haWwuY29tPgo+Cj4gVGhpcyBpcyB0aGUgc2FtZSBjb2RlIGFz
IHYyIGJ1dCB3aXRoIGFuIGV4cGxhbmF0aW9uIGFkZGVkLgo+Cj4gSSBzcG90dGVkIHRoYXQgdGhl
IGV4cGxhbmF0aW9uIHdhcyBtaXNzaW5nIGJ1dCBrbmV3IHdoYXQgdGhlIGV4cGxhbmF0aW9uCj4g
d2FzIHNvIEkgZGlkbid0IG1lbnRpb24gaXQuICBGb3IgbWUsIGEgbG90IG9mIHBhdGNoZXMgaGF2
ZSBtaW5vciBmbGF3cwo+IGFuZCBpZiBJIGNvbXBsYWluZWQgYWJvdXQgZXZlcnl0aGluZyB0aGUg
d2hvbGUga2VybmVsIGRldmVsb3BtZW50Cj4gcHJvY2VzcyB3b3VsZCBncmluZCB0byBhIGhhbHQu
ICBHcmVnIGlzIG1vcmUgcGlja3kgYWJvdXQgZXhwbGFuYXRpb25zCj4gZm9yIG5ldyB2ZXJzaW9u
cyBiZWNhdXNlIGhlIGhhcyB0byBkZWFsIHdpdGggYSBsb3Qgb2YgcGF0Y2hlcyBhbmQKPiBiZWNh
dXNlIGhlIGlzIHRyeWluZyB0byB0ZWFjaCBuZXdiaWVzIGhvdyB0byBmb2xsb3cgdGhlIHByb2Nl
c3MuCj4KPiBBbHRob3VnaCBtaW51dGVzIGFnbyBJIGp1c3QgY3JpdGljaXplZCBzb21lb25lIGVs
c2UgZm9yIG5vdCBwdXR0aW5nIHRoZQo+IG5vdGUgdW5kZXIgdGhlIGN1dCBvZmYgYnV0IHRoYXQn
cyBiZWNhdXNlIEkgaGFkIG5vIGlkZWEgd2h5IHRoZXkgd2VyZQo+IHJlc2VuZGluZy4KPgo+IE5l
eHQgdGltZSBwbGVhc2UgYXZvaWQgcHV0dGluZyBSRVNFTkQgaW4gdGhlIHN1YmplY3QgYmVjYXVz
ZSB0aGF0IG1lYW5zCj4gdGhlcmUgd2FzIG5vIGNoYW5nZXMgYmVjYXVzZSB5b3VyIHBhdGNoIHdh
cyBwZXJmZWN0IGFzLWlzLiAgSW5zdGVhZCBwdXQKPiB2MzoKPgo+IHYyOiBibGFoIGJsYWgKPiB2
MzogYWRkIHRoaXMgZXhwbGFuYXRvcnkgbWVzc2FnZS4KPgo+IEJ1dCBkb24ndCBkbyB0aGF0IGlu
IHRoaXMgY2FzZSwgZm9yIG5vdyB0aGUgcGF0Y2ggaXMgZmluZS4gIDpQICBJJ20KPiBqdXN0IHRl
bGxpbmcgeW91IHRoZSBwcm9jZXNzIGZvciBuZXh0IHRpbWUuCk9rLCB0aGFua3MgZm9yIHlvdXIg
ZXhwbGFuYXRpb24hCgotLSAKQmVzdCByZWdhcmRzLApZdWFuIENhbgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
