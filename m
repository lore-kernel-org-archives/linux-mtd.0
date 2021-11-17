Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EF7C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 03:38:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D02A61545
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 03:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D02A61545
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:CC:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zhScKlg1WWL7Fjz27QzKMip06KNp4oSdJ42oxfqE32Y=; b=0B9IySkZYuR3nCxu87tsx7DVOt
	PKZwadwJAqtoS4dqrZ6LINu6B0S9eesJsSj4vstZt7xQGRd6iZY9FgGO4aw0haa+UaqZmoWVZDX/B
	P3BByOB/T3UKQJbRsuXk4gBCj5FOCJD6myMDsL2g1KMCH89Mj7lU91tdhL8E2HshcWqQ5F4MzORHa
	6S94HeJTdcchFJsLNFqtpJms1FKQ90+sgeStXjywfDNiXLytzw9dKut0lb2M+srRkrMd/OFTXVaVA
	k1GWazfOjFIsYocH2OKMHI9AcI01DtnCYwSQRkoi5ZDaxX2jAkXkM+Q7VcnLDP13YD1nA38kW/dNh
	czAI0bxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnBlD-003Cqq-M6; Wed, 17 Nov 2021 03:37:23 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnBl9-003Cp5-Vg
 for linux-mtd@lists.infradead.org; Wed, 17 Nov 2021 03:37:22 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hv7ll5dHkzbhyW;
 Wed, 17 Nov 2021 11:32:19 +0800 (CST)
Received: from kwepemm600019.china.huawei.com (7.193.23.64) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 17 Nov 2021 11:37:14 +0800
Received: from [10.174.177.210] (10.174.177.210) by
 kwepemm600019.china.huawei.com (7.193.23.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 17 Nov 2021 11:37:13 +0800
To: <ming.lei@redhat.com>, <damien.lemoal@wdc.com>, <axboe@kernel.dk>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-block@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <yangerkun@huawei.com>, <yi.zhang@huawei.com>, <yebin10@huawei.com>,
 <houtao1@huawei.com>
From: yangerkun <yangerkun@huawei.com>
Subject: [QUESTION] blk_mq_freeze_queue in elevator_init_mq
Message-ID: <d9113bf8-4654-cb04-f79c-38e11493cb2c@huawei.com>
Date: Wed, 17 Nov 2021 11:37:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.174.177.210]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600019.china.huawei.com (7.193.23.64)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_193720_245983_B8FD905E 
X-CRM114-Status: UNSURE (   7.97  )
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

Tm93ZGF5cyB3ZSBtZWV0IHRoZSBib290IHJlZ3Jlc3Npb24gd2hpbGUgZW5hYmxlIGxvdHMgb2Yg
bXRkYmxvY2sKY29tcGFyZSB3aXRoIDQuNC4gVGhlIG1haW4gcmVhc29uIHdhcyB0aGF0IHRoZSBi
bGtfbXFfZnJlZXplX3F1ZXVlIGluCmVsZXZhdG9yX2luaXRfbXEgd2lsbCB3YWl0IGEgUkNVIGdh
cCB3aGljaCB3YW50IHRvIG1ha2Ugc3VyZSBubyBJTyB3aWxsCmhhcHBlbiB3aGlsZSBibGtfbXFf
aW5pdF9zY2hlZC4KCk90aGVyIG1vZHVsZSBsaWtlIGxvb3AgbWVldHMgdGhpcyBwcm9ibGVtIHRv
byBhbmQgaGFzIGJlZW4gZml4IHdpdGgKZm9sbG93IHBhdGNoZXM6CgogIDIxMTJmNWMxMzMwYSBs
b29wOiBTZWxlY3QgSS9PIHNjaGVkdWxlciAnbm9uZScgZnJvbSBpbnNpZGUgYWRkX2Rpc2soKQog
IDkwYjcxOTgwMDFmMiBibGstbXE6IEludHJvZHVjZSB0aGUgQkxLX01RX0ZfTk9fU0NIRURfQllf
REVGQVVMVCBmbGFnCgpUaGV5IGNoYW5nZSB0aGUgZGVmYXVsdCBJTyBzY2hlZHVsZXIgZm9yIGxv
b3AgdG8gJ25vbmUnLiBTbyBubyBuZWVkIHRvCmNhbGwgYmxrX21xX2ZyZWV6ZV9xdWV1ZSBhbmQg
YmxrX21xX2luaXRfc2NoZWQuIEJ1dCBpdCBzZWVtcyBub3QKYXBwcm9wcmlhdGUgZm9yIG10ZGJs
b2Nrcy4gTXRkYmxvY2tzIGNhbiB1c2UgJ21xLWRlYWRsaW5lJyB0byBoZWxwCm9wdGltaXplIHRo
ZSByYW5kb20gd3JpdGUgd2l0aCB0aGUgaGVscCBvZiBtdGRibG9jaydzIGNhY2hlLiBPbmNlIGNo
YW5nZQp0byAnbm9uZScsIHdlIG1heSBtZWV0IHRoZSByZWdyZXNzaW9uIGZvciByYW5kb20gd3Jp
dGUuCgpjb21taXQgNzM3ZWI3OGU4MmQ1MmQzNWRmMTY2ZDI5YWYzMmJmNjE5OTJkZTcxZApBdXRo
b3I6IERhbWllbiBMZSBNb2FsIDxkYW1pZW4ubGVtb2FsQHdkYy5jb20+CkRhdGU6ICAgVGh1IFNl
cCA1IDE4OjUxOjMzIDIwMTkgKzA5MDAKCiAgICAgYmxvY2s6IERlbGF5IGRlZmF1bHQgZWxldmF0
b3IgaW5pdGlhbGl6YXRpb24KCiAgICAgLi4uCgogICAgIEFkZGl0aW9uYWxseSwgdG8gbWFrZSBz
dXJlIHRoYXQgdGhlIGVsZXZhdG9yIGluaXRpYWxpemF0aW9uIGlzIG5ldmVyCiAgICAgZG9uZSB3
aGlsZSByZXF1ZXN0cyBhcmUgaW4tZmxpZ2h0ICh0aGVyZSBzaG91bGQgYmUgbm9uZSB3aGVuIHRo
ZSBkZXZpY2UKICAgICBkcml2ZXIgY2FsbHMgZGV2aWNlX2FkZF9kaXNrKCkpLCBmcmVlemUgYW5k
IHF1aWVzY2UgdGhlIGRldmljZSByZXF1ZXN0CiAgICAgcXVldWUgYmVmb3JlIGNhbGxpbmcgYmxr
X21xX2luaXRfc2NoZWQoKSBpbiBlbGV2YXRvcl9pbml0X21xKCkuCiAgICAgLi4uCgpUaGlzIGNv
bW1pdCBhZGQgYmxrX21xX2ZyZWV6ZV9xdWV1ZSBpbiBlbGV2YXRvcl9pbml0X21xIHdoaWNoIHRy
eSB0bwptYWtlIHN1cmUgbm8gaW4tZmxpZ2h0IHJlcXVlc3Qgd2hpbGUgd2UgZ28gdGhyb3VnaCBi
bGtfbXFfaW5pdF9zY2hlZC4KQnV0IGRvZXMgdGhlcmUgYW55IGRyaXZlcnMgY2FuIGxlYXZlIElP
IGFsaXZlIHdoaWxlIHdlIGdvIHRocm91Z2gKZWxldmF0b3JfaW5pdF9tce+8nyBBbmQgaWYgbm8s
IG1heWJlIHdlIGNhbiBqdXN0IHJlbW92ZSB0aGlzIGxvZ2ljYWwgdG8KZml4IHRoZSByZWdyZXNz
aW9uLi4uCi4KLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
