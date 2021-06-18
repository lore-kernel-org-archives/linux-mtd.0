Return-Path: <SRS0=7qTJ=LM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7B3C49EA3
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 07:52:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F36D1613B4
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 07:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F36D1613B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=THycvN4BezrDgLlFchjcdHa42DWCQ9cOfX3ykdHImXw=; b=1+Yb1d+CbhgeZ6
	NQZvJhqm+00jDns8XmUh22lQMkzISeiUWkWQOASAVZJz/kcwXywQBTKvYrFqf+jOHqJbQL7yIiPYH
	OtdQZstBcQ9vTqQCdpUb9H9qaVRjPY6B4U166aOLwg5YyVxKSDlohdC8douqceVEZkQvWrwVWWekJ
	LEPu+vWQrix9n2XUxpDB/4FvvAe/hOIMSlTz52+Dd7zGja1qTw0pSdLIkB4+EwsMJpj5kIdH45q+C
	YYoNMemY3LS6romVJKd+h72A65G4HSF3gBWXE3/kt82/K+3lqM1+jj+ywAInNHGqr02JXspdMlGbU
	pLKOiM/iXhlPAOsRpHyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu9IX-00D8cS-BR; Fri, 18 Jun 2021 07:52:17 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu9IT-00D8bh-5M
 for linux-mtd@lists.infradead.org; Fri, 18 Jun 2021 07:52:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E49E8FF809;
 Fri, 18 Jun 2021 07:52:08 +0000 (UTC)
Date: Fri, 18 Jun 2021 09:52:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>, Christoph Hellwig
 <hch@lst.de>
Subject: Re: [PATCH v2] mtd: mtd_blkdevs: Initialize
 rq.limits.discard_granularity
Message-ID: <20210618095207.0bec4fde@xps13>
In-Reply-To: <20210615093905.3473709-1-chengzhihao1@huawei.com>
References: <20210615093905.3473709-1-chengzhihao1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_005213_380823_4BEF7123 
X-CRM114-Status: GOOD (  14.95  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWmhpaGFvLAoKWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4gd3JvdGUg
b24gVHVlLCAxNSBKdW4gMjAyMQoxNzozOTowNSArMDgwMDoKCj4gU2luY2UgY29tbWl0IGIzNWZk
NzQyMmMyZjgoImJsb2NrOiBjaGVjayBxdWV1ZSdzIGxpbWl0cy5kaXNjYXJkX2dyYW51bGFyaXR5
Cj4gaW4gX19ibGtkZXZfaXNzdWVfZGlzY2FyZCgpIikgY2hlY2tzIHJxLmxpbWl0cy5kaXNjYXJk
X2dyYW51bGFyaXR5IGluCj4gX19ibGtkZXZfaXNzdWVfZGlzY2FyZCgpLCB3ZSBtYXkgZ2V0IGZv
bGxvd2luZyB3YXJuaW5ncyBvbiBmb3JtYXR0ZWQgZnRsOgo+IAo+ICAgV0FSTklORzogQ1BVOiAy
IFBJRDogNzMxMyBhdCBibG9jay9ibGstbGliLmM6NTEKPiAgIF9fYmxrZGV2X2lzc3VlX2Rpc2Nh
cmQrMHgyYTcvMHgzOTAKPiAKPiBSZXByb2R1Y2VyOgo+ICAgMS4gZnRsX2Zvcm1hdCAvZGV2L210
ZDAKPiAgIDIuIG1vZHByb2JlIGZ0bAo+ICAgMy4gbWtmcy52ZmF0IC9kZXYvZnRsYQo+ICAgNC4g
bW91bnQgLW9kaXNjYXJkIC9kZXYvZnRsYSB0ZW1wCj4gICA1LiBkZCBpZj0vZGV2L3plcm8gb2Y9
dGVtcC90c3QgYnM9MU0gY291bnQ9MTAgb2ZsYWc9ZGlyZWN0Cj4gICA2LiBkZCBpZj0vZGV2L3pl
cm8gb2Y9dGVtcC90c3QgYnM9MU0gY291bnQ9MTAgb2ZsYWc9ZGlyZWN0Cj4gCj4gRml4IGl0IGJ5
IGluaXRpYWxpemluZyBycS5saW1pdHMuZGlzY2FyZF9ncmFudWxhcml0eSBpZiBkZXZpY2Ugc3Vw
cG9ydHMKPiBkaXNjYXJkIG9wZXJhdGlvbi4KCkNhbiB5b3UgcGxlYXNlIHZlcmlmeSB0aGF0IHRo
aXMgaXMgc3RpbGwgbmVlZGVkIGFmdGVyIENocmlzdG9waCdzCmFkZGl0aW9uYWwgZml4OgpodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL3BhdGNoLzIwMjEwNjAy
MDY1MzQ1LjM1NTI3NC0xMC1oY2hAbHN0LmRlLwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBaaGloYW8g
Q2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9tdGRf
YmxrZGV2cy5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jIGIvZHJpdmVycy9tdGQvbXRkX2Js
a2RldnMuYwo+IGluZGV4IDAxYmYyMzRlN2YzYS4uNmVhYzFjOWMxNjRkIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRfYmxrZGV2
cy5jCj4gQEAgLTQxMyw2ICs0MTMsNyBAQCBpbnQgYWRkX210ZF9ibGt0cmFuc19kZXYoc3RydWN0
IG10ZF9ibGt0cmFuc19kZXYgKm5ldykKPiAgCWlmICh0ci0+ZGlzY2FyZCkgewo+ICAJCWJsa19x
dWV1ZV9mbGFnX3NldChRVUVVRV9GTEFHX0RJU0NBUkQsIG5ldy0+cnEpOwo+ICAJCWJsa19xdWV1
ZV9tYXhfZGlzY2FyZF9zZWN0b3JzKG5ldy0+cnEsIFVJTlRfTUFYKTsKPiArCQluZXctPnJxLT5s
aW1pdHMuZGlzY2FyZF9ncmFudWxhcml0eSA9IHRyLT5ibGtzaXplOwo+ICAJfQo+ICAKPiAgCWdk
LT5xdWV1ZSA9IG5ldy0+cnE7CgoKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
