Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC8BC61DD3
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2026 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXQCFugH68EdW060lk7+Fui161xndqvlEPRgZdMgMgg=; b=If2FlHbIivzewy
	/1VPZi0yqebLwyUBy8CC3jDQFYgIx2pZhbTraUi2NXmJ6GDhPiBQh8TF71TSmG8O+uVZru98R478v
	sLBab2cFHJYxFuzjUExFX/X0EgBWP1XahDyuciOFDHtit9dG8IJj86K7ZB44Ppy1BzB/W94dqFW+V
	DcAksNr9Y+Q4Xl9OVgjeTMHgl/DrMzFiZtekXh2Yi7Mup9e1NjzsJMJnz5QgDY1YPWXZhMsLdBRjf
	WreRE9jQb1la9IrCkwMh/YHSlzSibEi1h9LV5J2YU9Y/1dN4JY0dylP/7MmwAkbhZ2Cfg0z3SAA86
	oBaM/JIsdfCh+y1U3mmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26Ya-0000000HISf-2zvq;
	Thu, 03 Sep 2026 12:28:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26YX-0000000HIRY-2jSm;
	Thu, 03 Sep 2026 12:28:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DEE9E4E414EC;
	Thu,  3 Sep 2026 12:28:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B2488602B8;
	Thu,  3 Sep 2026 12:28:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2328C11C7A01D;
	Thu,  3 Sep 2026 14:28:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788438509; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vrKxt9vYXse+6frgKnd7jpIrxEBJjTuM8wsMTzUkcIc=;
	b=bTdOVqSf6aGtK5L9ynAP9tmNJoU674gqZTEd0auCuwYFgr2gDd9RQxKLWuPlJfOHojFxFz
	bezMq3ngSZng9k9uJl3UN5HXqWvglovciNMXg2SE6y/hWkpM26mbPQuUn5GE6CtYkpSGzt
	0aMqIEe3/LczcK2RIL0HTphRPGsXyj+hmCtkDLVKSl5ZUZYhGepVo6N/DP9ADxEptK6F1S
	Cnt1HwTOXMMGpFalqM5gWyWUW9mhS1KTfsDahBuFXS/DOp88SVydrMNvKEqUIUX/PKlySo
	66ysanBlXFnNTtQ3xBXWkYlw7H/0OlUXrx9SIOkJZQPwggUWeWEwnL39sQINBA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] mtd: rawnand: lpc32xx: Remove platform data support
 from drivers
In-Reply-To: <20260903112425.1904748-1-vz@kernel.org> (Vladimir Zapolskiy's
	message of "Thu, 3 Sep 2026 14:24:22 +0300")
References: <20260903112425.1904748-1-vz@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 03 Sep 2026 14:28:26 +0200
Message-ID: <878q5i4iz9.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_052837_862257_08E75DB1 
X-CRM114-Status: UNSURE (   9.28  )
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

SGVsbG8gVmxhZGltaXIsCgpPbiAwMy8wOS8yMDI2IGF0IDE0OjI0OjIyICswMywgVmxhZGltaXIg
WmFwb2xza2l5IDx2ekBrZXJuZWwub3JnPiB3cm90ZToKCj4gU2luY2UgTlhQIExQQzMyeHggU29D
IHN1cHBvcnQgaW4gdGhlIExpbnV4IGtlcm5lbCBzdHJpY3RseSBkZXBlbmRzIG9uCj4gZGV2aWNl
IHRyZWUgc3VwcG9ydCwgdGhlIHVudXNlZCBwbGF0Zm9ybSBkYXRhIHN1cHBvcnQgY2FuIGJlIHJl
bW92ZWQKPiBmcm9tIHRoZSBMUEMzMnh4IE5BTkQgTUxDIGFuZCBTTEMgZHJpdmVycy4KPgo+IFZs
YWRpbWlyIFphcG9sc2tpeSAoMik6Cj4gICBtdGQ6IHJhd25hbmQ6IGxwYzMyeHhfc2xjOiBSZW1v
dmUgcGxhdGZvcm0gZGF0YSBzdXBwb3J0Cj4gICBtdGQ6IHJhd25hbmQ6IGxwYzMyeHhfbWxjOiBS
ZW1vdmUgcGxhdGZvcm0gZGF0YSBzdXBwb3J0Cj4KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbHBj
MzJ4eF9tbGMuYyB8IDIxICsrLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9scGMzMnh4X3NsYy5jIHwgMjEgKystLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGluY2x1ZGUv
bGludXgvbXRkL2xwYzMyeHhfbWxjLmggICAgfCAxNyAtLS0tLS0tLS0tLS0tLS0tLQo+ICBpbmNs
dWRlL2xpbnV4L210ZC9scGMzMnh4X3NsYy5oICAgIHwgMTcgLS0tLS0tLS0tLS0tLS0tLS0KPiAg
NCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDcyIGRlbGV0aW9ucygtKQo+ICBkZWxl
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tdGQvbHBjMzJ4eF9tbGMuaAo+ICBkZWxldGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tdGQvbHBjMzJ4eF9zbGMuaAoKU2FzaGlrbyByYWlz
ZXMgYSBidWlsZCBpc3N1ZSBkdWUgdG8gdGhlIGNsZWFudXAgbWlzc2luZyBvbmUgdXNlIG9mIGEK
aGVhZGVyLiBDYW4geW91IHBsZWFzZSBjaGVjaz8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
