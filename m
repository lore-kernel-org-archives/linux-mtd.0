Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4357EC33CA3
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 17:28:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AB26206ED
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 17:28:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KgGk0lX9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AB26206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NhW3xpshFqxDG4+QLT3tcVehvgxVBv3CdxaMgGHZqUA=; b=KgGk0lX92rXek7
	3hTgQhPZ3wB1k5iAyKwPAJOrJR9epXG3RxdvF3FoHhRw2qoUdH7spyivsF/8Vs180yxJ9U7p24tY8
	3btrCP+4EH6z7RDi5oGbi50x/NrMid0cTmeYznPFa898GOFlGcSqWDjRF1qV6II0qeTR5RJ9VgUDV
	UCXSXftN4X7PNnEu7sKhLag2/7nmSoh8BSqS8BUzdT82k++On7YOUbE5VBHlh6pZxvoDCzMtzGy0h
	gezg5jgQh/G7PlmydVh/Qe2nuZbwLjDYbe9hGEdaYcIQF2cPb0gR8s3tqTqE1WEDRKi+7XfmrK6Jq
	wAliK0eu+hHcmvIJwIUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipbbR-0001Va-Pw; Thu, 09 Jan 2020 17:28:13 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipbbP-0001UT-5Y
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 17:28:12 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 974F5C0014;
 Thu,  9 Jan 2020 17:28:08 +0000 (UTC)
Date: Thu, 9 Jan 2020 18:28:07 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Subject: Re: [PATCH] mtd: set mtd partition panic write flag
Message-ID: <20200109182807.04c8866a@xps13>
In-Reply-To: <CAKekbeucdjZgttQfHeiXH6S92He2qkKGsQcEqz_4_okHzDK16A@mail.gmail.com>
References: <20191021193343.41320-1-kdasu.kdev@gmail.com>
 <20191105200344.1e8c3eab@xps13>
 <1718371158.75883.1572995022606.JavaMail.zimbra@nod.at>
 <20200109160352.6080e1e5@xps13>
 <CAKekbeucdjZgttQfHeiXH6S92He2qkKGsQcEqz_4_okHzDK16A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_092811_350965_5F78F96A 
X-CRM114-Status: GOOD (  11.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS2FtYWwsCgpLYW1hbCBEYXN1IDxrYW1hbC5kYXN1QGJyb2FkY29tLmNvbT4gd3JvdGUgb24g
VGh1LCA5IEphbiAyMDIwIDEwOjI1OjU5Ci0wNTAwOgoKPiBNaXF1ZWwsCj4gCj4gWWVzIHRoZSBp
c3N1ZSBpcyBzdGlsbCBvcGVuLiBJIHdhcyB0cnlpbmcgdG8gdW5kZXJzdGFuZCB0aGUgc3VnZ2Vz
dGlvbgo+IGFuZCBkaWQgbm90IGdldCBhIHJlcGx5IG9uIHRoZSBxdWVzdGlvbiBJIGhhZAo+IAo+
IFJpY2hhcmQgd3JvdGUgOgo+ICJTbyB0aGUgcmlnaHQgZml4IHdvdWxkIGJlIHNldHRpbmcgdGhl
IHBhcmVudCdzIG9vcHNfcGFuaWNfd3JpdGUgaW4KPiBtdGRfcGFuaWNfd3JpdGUoKS4KPiBUaGVu
IHdlIGRvbid0IGhhdmUgdG8gdG91Y2ggbXRkcGFydC5jIgo+IAo+IEhvdyBkbyBJIGdldCBhY2Nl
c3MgdG8gdGhlIHBhcnRzIHBhcmVudCBpbiB0aGUgY29yZSA/LiBNYXliZSBJIGFtCj4gbWlzc2lu
ZyBzb21ldGhpbmcuCgpJIHRoaW5rIHRoZSBzb2x1dGlvbiBpcyB0byBzZXQgdGhlIG9vcHNfcGFu
aWNfd3JpdGUgb2YgdGhlIHJvb3QgcGFyZW50LCBpbnN0ZWFkIG9mIHVwZGF0aW5nIHRoZSBmbGFn
IG9mIHRoZSBtdGQgZGV2aWNlIGl0c2VsZiAod2hpY2ggaXMgbWF5YmUgYSBwYXJ0aXRpb24pLgoK
V291bGQgdGhpcyBoZWxwPwoKaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgtbXRk
L21zZzEwNDU0Lmh0bWwKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
