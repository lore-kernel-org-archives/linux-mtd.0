Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02A5C38142
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Jan 2023 13:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=igJINTpIuTx/Ltka5K1hi1TXk+axaOQ6/mRsIp3M/Ag=; b=moWYQ6Op+q8S1i
	9+u+L4AeFq4UuBxe1E5u5NATYk7XWqe0XiOPEGeVb+CLEkpSmArjrmajDtWHHGtSwpdCBbPYs8ywg
	SsgRGuMC+4b7D491ev8llloNk/Es1A89KOiKmNAGKxJsGOW3WMxcjKzOcYXJYk1mqjLBjZdM4zsgN
	V3F/3oNbVwc0mXaGy8VQOq3lJFVgr34DfjleEpbfv4UY1vAviIFQfTEOjW0/uyt+98I0f998EVJX2
	k/01fNGzRQ7vWi+ANeuKFESPTj3yG/FJ1hghmtb2qRMCXUQqgwyY/posZKjQRFEFADPH0sYSnrXAs
	LFAANrqLXCalHKL9uUhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqOW-0080OF-MI; Tue, 31 Jan 2023 13:09:52 +0000
Received: from out30-7.freemail.mail.aliyun.com ([115.124.30.7])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqOR-0080KT-78
	for linux-mtd@lists.infradead.org; Tue, 31 Jan 2023 13:09:49 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=guoheyi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VaX6U-C_1675170563;
Received: from 30.233.48.168(mailfrom:guoheyi@linux.alibaba.com fp:SMTPD_---0VaX6U-C_1675170563)
          by smtp.aliyun-inc.com;
          Tue, 31 Jan 2023 21:09:35 +0800
Message-ID: <a5920ee3-7168-7415-f975-fcdbdde069d5@linux.alibaba.com>
Date: Tue, 31 Jan 2023 21:09:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
From: Heyi Guo <guoheyi@linux.alibaba.com>
Subject: Re: [PATCH] drivers/spi-nor: add support for Winbond w25q01jv
To: Michael Walle <michael@walle.cc>
Cc: linux-kernel@vger.kernel.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
References: <20230128033957.125853-1-guoheyi@linux.alibaba.com>
 <c7c3c4cf5dd477953e366053859df08f@walle.cc>
Content-Language: en-US
In-Reply-To: <c7c3c4cf5dd477953e366053859df08f@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_050947_524083_581A1941 
X-CRM114-Status: GOOD (  17.79  )
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

Ck9uIDIwMjMvMS8zMCDkuIvljYg1OjI5LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEhpLAo+Cj4+
IFdpbmJvbmQgVzI1UTAxSlYgaXMgYSAxMjhNQiBTUEktTk9SIGZsYXNoIGNoaXAuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEhleWkgR3VvIDxndW9oZXlpQGxpbnV4LmFsaWJhYmEuY29tPgo+Pgo+PiAt
LSAKPj4gQ2M6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT4KPj4g
Q2M6IFByYXR5dXNoIFlhZGF2IDxwcmF0eXVzaEBrZXJuZWwub3JnPgo+PiBDYzogTWljaGFlbCBX
YWxsZSA8bWljaGFlbEB3YWxsZS5jYz4KPj4gQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+Cj4+IENjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0
Pgo+PiBDYzogVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgo+PiBDYzogbGlu
dXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gLS0tCj4+IMKgZHJpdmVycy9tdGQvc3BpLW5v
ci93aW5ib25kLmMgfCAzICsrKwo+PiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykK
Pj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jIAo+PiBiL2Ry
aXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jCj4+IGluZGV4IGNhMzlhY2Y0MTEyYzguLjBjZDQ5
ZjUzNGJmOGQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jCj4+
ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jCj4+IEBAIC0xNDIsNiArMTQyLDkg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIAo+PiB3aW5ib25kX25vcl9wYXJ0c1td
ID0gewo+PiDCoMKgwqDCoCB7ICJ3MjVxNTEyanZxIiwgSU5GTygweGVmNDAyMCwgMCwgNjQgKiAx
MDI0LCAxMDI0KQo+PiDCoMKgwqDCoMKgwqDCoMKgIE5PX1NGRFBfRkxBR1MoU0VDVF80SyB8IFNQ
SV9OT1JfRFVBTF9SRUFEIHwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFNQSV9OT1JfUVVBRF9SRUFEKSB9LAo+PiArwqDCoMKgIHsgIncyNXEwMWp2IiwgSU5GTygweGVm
NDAyMSwgMCwgNjQgKiAxMDI0LCAyMDQ4KQo+PiArwqDCoMKgwqDCoMKgwqAgTk9fU0ZEUF9GTEFH
UyhTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQgfAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBTUElfTk9SX1FVQURfUkVBRCkgfSwKPgo+IEknZCBndWVzcyB0aGlzIGZs
YXNoIGhhcyBTRkRQIHN1cHBvcnQsIGNvcnJlY3Q/CgpZZXMsIHRoZSBzcGVjIHNheXMgaXQgc3Vw
cG9ydHMgU0ZEUCA6KQoKCj4gSW4gdGhpcyBjYXNlLAo+IGNvdWxkIHlvdSBwbGVhc2UgdHJ5IHRo
ZSBsYXRlc3QgbmV4dCAob3IgLXJjKSBrZXJuZWwgd2l0aG91dAo+IHRoaXMgY2hhbmdlPwoKSXMg
djYuMi1yYzMgT0sgZm9yIHRoZSB0ZXN0PyBJZiBzbywgc3VyZWx5IEkgY2FuIGRvIHRoYXQuCgpU
aGFua3MgZm9yIHlvdXIgY29tbWVudHMgOikKCkhleWkKCgo+IEluIHRoZSBtZWFudGltZSB3ZSBo
YXZlIGEgZ2VuZXJpYyBzcGktbm9yIGRyaXZlciBbMV0KPiBzbyB5b3UgZG9uJ3QgbmVlZCBhIG5l
dyBlbnRyeSBpbiBtb3N0IGNhc2VzLgo+Cj4gQXBhcnQgZnJvbSB0aGF0LCBpdCB3b3VsZCBiZSBu
aWNlIGlmIHlvdSBjb3VsZCBkdW1wIHRoZQo+IFNGRFAgdGFibGVzLCBzZWUgWzJdLgo+Cj4gLW1p
Y2hhZWwKPgo+IFsxXSAKPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4yLXJj
NS9zb3VyY2UvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMjTDE2MzgKPiBbMl0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvci80MzA0ZTE5ZjMzOTlhMGE2ZTg1NjExOWQwMWNjYWJlMEB3YWxsZS5j
Yy8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
