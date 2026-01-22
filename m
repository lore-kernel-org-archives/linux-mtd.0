Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7677D3EE66
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jan 2026 14:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BB8jp1PcG6LjFoE1gDtUQLcte1lKQXYVGCvwJ4WdPzc=; b=jMDqNVIsH8aZYw
	TSDUd0apSvCIdDq6H3cxlWVxbcZVI5Q42dwGyz8oS54TneU0LAoFPO4oRj7YZjYjvO/XQQJOn2Qjk
	OmldxfPg9Q8ifZdI1ZR8rTG6Hd82NnKpF7mdcN+Lkc69r89ubTseGBRCX39d0briMJTr+NoapfwUz
	PtWgS6isIHGMQWu7nWs7cTeSPjAf81qV4tZVA3kx1pNwbGLkFQBV94NXFMyc6x4YVWHraMCv2xl+/
	ihJPwNKXyLmhqzxM7ltej4mJ4bTIbZqlWyrmt1t31ra4E1o1i5LgEjqYK4n0n6JxSGle4qfMVQH+s
	GUTknRdgqbNsoi9poj/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivN4-00000007Cjl-49vi;
	Thu, 22 Jan 2026 14:09:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivN4-00000007CjN-1NF1
	for linux-mtd@bombadil.infradead.org;
	Thu, 22 Jan 2026 14:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t9la6mpZscOhYTRRUbNnDUeRBa5XdyG8pAYvC1s2yws=; b=DfDYMWAt0QM5dxgw26VW2IFc18
	PRSFRCU7XNF6zr5lYHHoT1E6I89ep8DmqipjFX/aY6GcxqH4Y6Lzw9ilxqrzOzYknPwbIx85CxKDI
	Dyg3bXULjw2ATJEpmfvz++VJ5Fsa4TQgOz+FZI7hopmclUGd9Ib5LOCkq7BBPOCqX+hZq0fXnL+Q6
	eHTmnMXOHGhxGu80DLXImML2XEMojKinIJ5V8kXOICAp4OepnRomm8oHCjBuEXTUDDeF7Mo0Gq+NI
	moRUBx2cQpadc3UIOrPm4kGou7hk5TdaCtvtRSfwebI/WwH4289J4kLc0mTPXrb8M345dLSOySSiY
	vRuaqqIA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivN0-00000000UZG-1tV1
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jan 2026 14:09:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C78EA1A2A8B;
	Thu, 22 Jan 2026 14:09:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93CC0606B6;
	Thu, 22 Jan 2026 14:09:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0815D119B824B;
	Thu, 22 Jan 2026 15:08:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769090941; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t9la6mpZscOhYTRRUbNnDUeRBa5XdyG8pAYvC1s2yws=;
	b=yrDqE4IBe5NhjOkoLhYX7TMOF1B8v3dv9/OPAitwQTrmtg3SRfrFDuPFsFkt4Gy6qvBL67
	0VhbpG1u3uGaqYBLs2AWzIJoxb0M2ws+1nJj++8cshWmN3K2hLw4CvtrG4Gh9oRC9ZWvCU
	VW79aJGJpwB/mm/8OuEFftrT1j/ZpF21KzgHL01CTl4dutz3mvU/3ck7fdf4t7m4j6KhyT
	pibqJbIl5SBBaTX1+rL9ulrPHvBCRbodjvV49Gwt8CM8XMBjdwnsxS0r5HKWLNjx6ZM0aH
	pRD+b2jz4KeMXyo2Gpg22JgrMMw8s6MqET3AwoE9cxVWXcZaa2YA7RpWi77MEg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-kernel@vger.kernel.org, Chenxi Hou <ch395@njit.edu>
Cc: colin.i.king@gmail.com, linux-mtd@lists.infradead.org, richard@nod.at, 
 rk0006818@gmail.com, vigneshr@ti.com, Hui Peng <benquike@gmail.com>, 
 "Zhihao (Zephyr) Yao" <zhihao.yao@njit.edu>
In-Reply-To: <20260122013250.19384-1-ch395@njit.edu>
References: <20260122013250.19384-1-ch395@njit.edu>
Subject: Re: [PATCH] mtd: jedec_probe: fix shift-out-of-bounds UB in JEDEC
 ID masking
Message-Id: <176909093883.3112602.14114861213916444270.b4-ty@bootlin.com>
Date: Thu, 22 Jan 2026 15:08:58 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_140911_437644_CB1013EC 
X-CRM114-Status: UNSURE (   5.53  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMSBKYW4gMjAyNiAyMDozMjo1MCAtMDUwMCwgQ2hlbnhpIEhvdSB3cm90ZToKPiBV
QlNBTiByZXBvcnRzIHNoaWZ0LW91dC1vZi1ib3VuZHMgaW4gamVkZWNfcmVhZF9tZnIoKSBhbmQg
amVkZWNfcmVhZF9pZCgpOgo+IAo+IMKgIFVCU0FOOiBzaGlmdC1vdXQtb2YtYm91bmRzIGluIGRy
aXZlcnMvbXRkL2NoaXBzL2plZGVjX3Byb2JlLmM6MTkyNDoxMwo+IMKgIHNoaWZ0IGV4cG9uZW50
IDMyIGlzIHRvbyBsYXJnZSBmb3IgMzItYml0IHR5cGUgJ2ludCcKPiDCoCBVQlNBTjogc2hpZnQt
b3V0LW9mLWJvdW5kcyBpbiBkcml2ZXJzL210ZC9jaGlwcy9qZWRlY19wcm9iZS5jOjE5NDA6MTIK
PiDCoCBzaGlmdCBleHBvbmVudCAzMiBpcyB0b28gbGFyZ2UgZm9yIDMyLWJpdCB0eXBlICdpbnQn
Cj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogamVk
ZWNfcHJvYmU6IGZpeCBzaGlmdC1vdXQtb2YtYm91bmRzIFVCIGluIEpFREVDIElEIG1hc2tpbmcK
ICAgICAgY29tbWl0OiAyYjE0NjYwYzFjYWYwYjY3YWRmOTk0MjhhMjI1ZjcxZWQ2NTM0MzdkCgpQ
YXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJl
CnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5
IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
