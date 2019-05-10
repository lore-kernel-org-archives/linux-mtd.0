Return-Path: <SRS0=FkjY=TK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8454EC04A6B
	for <linux-mtd@archiver.kernel.org>; Fri, 10 May 2019 14:18:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 580572175B
	for <linux-mtd@archiver.kernel.org>; Fri, 10 May 2019 14:18:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LjzAkzzA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 580572175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWQjl7NDljppCgfzQ6j4W+lbCn0hLfEjq0bDAs25ILQ=; b=LjzAkzzAVUAQCU
	mUREYaZ4GPpzMUPxG1NWh3oso47iuNJTDTz8KV2aNroK1CAgG6FuiNNIV7335hkqxuZ2OhrLHAlms
	8l1vWnBFt1Zu8RKxwfkptKDtz0m8OG/EV6tN8ZE6GEwufDbwx179WWplOJoyVpAyLUDI4cZKgA09T
	xctJkBqdYHkTLjjtMASoUerEW34Ur64i5nNp/yu1O4mYHUkxyF55tgZDgGR1UAy2SZ6B4PuiL+N1T
	t6kxEAEKKzt8b/vu0z3gt3/E3mO4/2qEGzIuao4/VgTcFGietK9sIUx7SQSldXzMCeJBFrTUsTr5v
	g+YyJu4mXbaRdfHjR3kQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hP6Lq-00066q-Ix; Fri, 10 May 2019 14:18:18 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP6Ln-000661-EV
 for linux-mtd@lists.infradead.org; Fri, 10 May 2019 14:18:17 +0000
X-Originating-IP: 90.88.28.253
Received: from xps13 (aaubervilliers-681-1-86-253.w90-88.abo.wanadoo.fr
 [90.88.28.253]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id EC9C460016;
 Fri, 10 May 2019 14:18:06 +0000 (UTC)
Date: Fri, 10 May 2019 16:18:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v1] mtd: rawnand: Add Macronix NAND read retry support
Message-ID: <20190510161805.202e6aea@xps13>
In-Reply-To: <20190510153704.33de9568@windsurf.home>
References: <1557474062-4949-1-git-send-email-masonccyang@mxic.com.tw>
 <20190510153704.33de9568@windsurf.home>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_071815_635494_8BE0B5F7 
X-CRM114-Status: GOOD (  10.44  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: computersforpeace@gmail.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, Mason Yang <masonccyang@mxic.com.tw>,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3
cm90ZSBvbiBGcmksIDEwIE1heQoyMDE5IDE1OjM3OjA0ICswMjAwOgoKPiBIZWxsbywKPiAKPiBT
b21lIHB1cmVseSBjb3NtZXRpYyBzdWdnZXN0aW9ucyBiZWxvdy4KPiAKPiBPbiBGcmksIDEwIE1h
eSAyMDE5IDE1OjQxOjAyICswODAwCj4gTWFzb24gWWFuZyA8bWFzb25jY3lhbmdAbXhpYy5jb20u
dHc+IHdyb3RlOgo+IAo+ID4gKwlpZiAocmV0KQo+ID4gKwkJcHJfZXJyKCJzZXQgZmVhdHVyZSBm
YWlsZWQgdG8gcmVhZCByZXRyeSBtb2RlZDolZFxuIiwgbW9kZSk7ICAgIAo+IAo+IEkgZG9uJ3Qg
a25vdyB3aGF0IGlzIHRoZSBwb2xpY3kgaW4gdGhlIE1URC9OQU5EIHN1YnN5c3RlbSwgYnV0Cj4g
c2hvdWxkbid0IHlvdSBiZSB1c2luZyBkZXZfZXJyKCkgaW5zdGVhZCBvZiBwcl9lcnIoKSBoZXJl
IHRvIGhhdmUgYQo+IG5pY2UgcHJlZml4IGZvciB0aGUgbWVzc2FnZSA/Cj4gCj4gCQlkZXZfZXJy
KCZuYW5kX3RvX210ZChjaGlwKS0+ZGV2LCAic2V0IGZlYXR1cmUgLi4iLCBtb2RlKTsKCkFjdHVh
bGx5LCBubywgbWFudWZhY3R1cmVyIGluaXRpYWxpemF0aW9ucyBoYXBwZW5zIGluCm5hbmRfc2Nh
bl90YWlsKCkgd2hpY2ggcnVucyBiZWZvcmUgbXRkX2RldmljZV9yZWdpc3RlcigpLiBBdCB0aGlz
CnBvaW50LCBtdGQtPmRldiBpcyBub3QgeWV0IHBvcHVsYXRlZCBzbyBkZXZfZXJyKCkgY2Fubm90
IGJlIHVzZWQuIFlvdQpzaG91bGQga2VlcCBhIHByX2VycigpLgoKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
