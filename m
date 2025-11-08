Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CA0CCF9F8
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Nov 2025 03:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rg6DjEPrcrtzTyIXF/nmGBD+hI3OFUOIuL9udi5jMg0=; b=cmAZ7tn1cEeJevS/blaK5m1stf
	92X10HOvBTzCJoprmhIyh7yovb9TZKHP+51ifBbOkVNjtr3mvYQQyjbW01gI+Y64C9vXyHLg2F8fP
	Wb4ndI1Hs3ZL75IMYuYQBhZKk67DQmAHVfiCHoBnR7wiwgp0Aa3vRmrHNUUv1FJCIVvsIG/lDP3XS
	hQoNq2jrvhUNJ1hP83HtzQ9rZrvAF8FhnqQq8IA8DxxvPyVbME6bGudgPAXg0AfvADNeZU7EpPUMT
	Qscu2bd4qO9mZtd1uY4IFOO6XLP3aNuIWF/1LAK/8rBy1SFElFKgH9be5ZzXG2FUbEkhuRxLB9q1y
	LuuKuU8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHZLI-00000002GAc-0ZJs;
	Sat, 08 Nov 2025 03:10:20 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHZLE-00000002G8v-3wHs
	for linux-mtd@lists.infradead.org;
	Sat, 08 Nov 2025 03:10:18 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fWTb2pOcM9CXmYC6UdWot4dWCYfXpxLg0tPmGPgdwak=;
	b=3JB5MYKtzMDOEFTMGqRYCsUNmJnLgQLHT8NUaT/G2qYNOfCyLO/TgCL7udDTHyLBDIFdzqsmv
	rx4WV+baK74czTdS+9ZPXLRcqlK0tAmZxI5m1Tk7tqKt9/XLS4ieYqRUM7ve3nXgVyfbKrOJlpg
	/Px2qfkM5/JwdsDW1ZqfVCU=
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4d3LV837zKzLlSX;
	Sat,  8 Nov 2025 11:08:32 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id F17B7140142;
	Sat,  8 Nov 2025 11:10:08 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 8 Nov 2025 11:10:07 +0800
Subject: Re: UBIFS errors since Linux 5.15
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: Eddie James <eajames@linux.ibm.com>, <linux-mtd@lists.infradead.org>,
	<richard@nod.at>, <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, <sethjenkins@google.com>,
	<adobriyan@gmail.com>
References: <068ba254-0053-46d5-bff4-74c948d2e8ac@linux.ibm.com>
 <183bacc4-3e27-59a7-ceb5-0bcac7d566e9@huawei.com>
Message-ID: <b48c9bad-3224-d606-d1a4-72239c3561e4@huawei.com>
Date: Sat, 8 Nov 2025 11:10:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <183bacc4-3e27-59a7-ceb5-0bcac7d566e9@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_191017_146352_405476BD 
X-CRM114-Status: GOOD (  15.67  )
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

5ZyoIDIwMjUvMTEvOCAxMTowMywgWmhpaGFvIENoZW5nIOWGmemBkzoKPiDlnKggMjAyNS8xMS84
IDE6MzgsIEVkZGllIEphbWVzIOWGmemBkzoKPj4KPj4gSGVsbG8sCj4+Cj4+IFdlIGFyZSB1cGRh
dGluZyBzb21lIEJNQyAoQXNwZWVkIEFTVDI2MDAsIEFSTTMyKSBzeXN0ZW1zIHRoYXQgd2VyZSBv
biAKPj4gTGludXggNS40IGJ1dCBvYnNlcnZlIGNvbnNpc3RlbnQgVUJJRlMgZXJyb3JzIHdpdGgg
TGludXggNS4xNSBhbmQgCj4+IGxhdGVyLiBUaGUgZXJyb3JzIHNlZW0gdG8gdmFyeTsgdGhlcmUg
aXMgYSBzYW1wbGluZyBiZWxvdy4KPj4KPj4KPj4gV2UgcGVyZm9ybWVkIGEgZ2l0IGJpc2VjdCBh
bmQgY2FtZSB1cCB3aXRoIHRoZSBmb2xsb3dpbmcgY29tbWl0LCB3aGljaCAKPj4gb2YgY291cnNl
IGlzIGNvbXBsZXRlbHkgdW5yZWxhdGVkIHRvIFVCSUZTLiBSZXZlcnRpbmcgaXQgZG9lcyBwcmV2
ZW50IAo+PiB0aGUgaXNzdWUuLi4gRG9lcyBhbnlvbmUgaGF2ZSBhbnkgc3VnZ2VzdGlvbnM/Cj4+
Cj4+IGNvbW1pdCAzM2ZjOWUyNmI3Y2IzOWYwZDQyMTljODc1YTI0NTE4MDIyNDljMjI1Cj4gWy4u
Ll0KPj4gW8KgIMKgIDguMTgwNDg2XSBVQklGUyBlcnJvciAodWJpMDoyIHBpZCA2Nik6IHViaWZz
X2NoZWNrX25vZGU6IGJhZCAKPj4gbWFnaWMgMHgxMDE4MzEsIGV4cGVjdGVkIDB4NjEwMTgzMQo+
IAo+IEhpLCBsb29rIGhlcmUsIHRoZSBtYWdpYyBudW1iZXIgMHgxMDE4MzEgdnMgMHg2MTAxODMx
LCB0aGUgZGlmZmVyZW5jZSBpcyAKPiB0aGUgaGlnaGVzdCBiaXQoMCB2cyA2WzAxMTBdKQo+PiBb
wqAgwqAgOC4xODk1NzhdIFVCSUZTIGVycm9yICh1YmkwOjIgcGlkIDY2KTogdWJpZnNfY2hlY2tf
bm9kZTogYmFkIG5vZGUgCj4+IGF0IExFQiAxNzo2NDY2NAo+IAo+IFsuLi5dCj4+IFsgMzczOS42
Nzg5NjhdIFVCSUZTIGVycm9yICh1YmkwOjIgcGlkIDEzKTogdWJpZnNfY2hlY2tfbm9kZTogYmFk
IENSQzogCj4+IGNhbGN1bGF0ZWQgMHg5MTc5YWYyOSwgcmVhZCAweGE3NjBmNGY1Cj4gCj4gWy4u
Ll0KPj4gWzEwNDEyLjcyMzExMV0gVUJJRlMgZXJyb3IgKHViaTA6MiBwaWQgMjk3KTogdWJpZnNf
Y2hlY2tfbm9kZTogYmFkIAo+PiBtYWdpYyAweDYxMDA4MzAsIGV4cGVjdGVkIDB4NjEwMTgzMQo+
IAo+IGFuZCB0aGVyZSwgbWFnaWMgbnVtYmVyIDB4NjEwMDgzMCB2cyAweDYxMDE4MzEsIHRoZSBk
aWZmZXJlbmNlIGlzIGxvd2VzdCAKPiBiaXQoMCB2cyAxKS4KClNvcnJ5LCBJIG5lZWQgdG8gbWFr
ZSBhIGNvcnJlY3Rpb24sIHRoZSBkaWZmZXJlbmNlcyBhcmUgdGhlIGxvd2VzdCBiaXQoMCAKdnMg
MSkgYW5kIHRoZSBtaWRkbGUgYml0ICgwIHZzIDEpLiBUaGUgbnVtYmVyIG9mIGZsaXBwZWQgYml0
cyBpcyBhbHNvIHR3by4KPiAKPiBTbywgSSBndWVzcyB0aGUgY3JjIGVycm9yIGlzIGNhdXNlZCBi
eSB0aGUgc2ltaWxhciByZWFzb24sIG1heWJlIHRoZXJlIAo+IGlzIHNvbWV0aGluZyB3cm9uZyB3
aXRoIHRoZSBuYW5kIGRyaXZlciBvciBmbGFzaD8gQWNjb3JkaW5nIHRvIHRoZSAKPiB2ZXJzaW9u
IGluZm9ybWF0aW9uKDUuMTUsIGFuZCB0aGUgdW5yZWxhdGVkIGNvbW1pdCAzM2ZjOWUyNmI3Y2Iz
KSwgaXMgaXQgCj4gcG9zc2libGUgdGhhdCB0aGVyZSBpcyBhIGNvbXBhdGliaWxpdHkgaXNzdWUg
YmV0d2VlbiB5b3VyIG5hbmQoYnNwKSAKPiBkcml2ZXIgd2l0aCBrZXJuZWwgbmFuZCBjb21tb24g
bGF5ZXIod2hpY2ggZnJvbSBkaWZmZXJlbnQgdmVyc2lvbnMpPwo+IAo+PiBbMTA0MTIuNzMyNDM2
XSBVQklGUyBlcnJvciAodWJpMDoyIHBpZCAyOTcpOiB1Ymlmc19jaGVja19ub2RlOiBiYWQgCj4+
IG5vZGUgYXQgTEVCIDEzOjYwMjQ4Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
