Return-Path: <SRS0=fZpl=PO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B42C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 07:32:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E527E60F0F
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 07:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E527E60F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+dcs/18LnlP6A/Red/5BjpPhe5MD9ufJkaAN6abjQo8=; b=SMW3CL+slhgWW+
	KNerXXv5LsDLPzZpimDSik3AOJQg35q4Gal4CFfHlp7B5KOllX5HBIacvN+UTX5rPg0TjMbS4+hia
	yuIDiVv/E++wu8JFgUdAu+WQWdh9TLBz4Z6Ud2yW2QpHvTOTbRJIQ02yNCFx92BT6vLrPGN+o8wQN
	UWUU+ObX/yhBAitykCCNvGlnBAsJm4xwdJfLxVxrBnd2pDA/zhkW0PygHhz9qSHyQn/bYEXC+Dbo+
	Fa88rUzmBTCPQz1rZAYbUq1nTWxmjcxULMH/pItZMNexfzuj0/8rNRytYGFykpcxfPD9P3n7VcCff
	13jHEkZSAjjLPlj7KGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfGw4-000wZX-Ih; Tue, 26 Oct 2021 07:31:52 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfGw0-000wYA-Dt
 for linux-mtd@lists.infradead.org; Tue, 26 Oct 2021 07:31:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 85D98100002;
 Tue, 26 Oct 2021 07:31:42 +0000 (UTC)
Date: Tue, 26 Oct 2021 09:31:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andreas Oetken <ennoerlangen@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andreas Oetken
 <andreas.oetken@siemens-energy.com>
Subject: Re: [PATCH] drivers: mtd: Fixed breaking list in __mtd_del_partition.
Message-ID: <20211026093141.64be4e38@xps13>
In-Reply-To: <20211025205724.3306739-1-andreas.oetken@siemens-energy.com>
References: <20211025205724.3306739-1-andreas.oetken@siemens-energy.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_003148_652601_B1702CA9 
X-CRM114-Status: GOOD (  16.09  )
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

SGkgQW5kcmVhcywKCmVubm9lcmxhbmdlbkBnbWFpbC5jb20gd3JvdGUgb24gTW9uLCAyNSBPY3Qg
MjAyMSAyMjo1NzoyNCArMDIwMDoKCj4gTm90IHRoZSBjaGlsZCBwYXJ0aXRpb24gc2hvdWxkIGJl
IHJlbW92ZWQgZnJvbSB0aGUgcGFydGl0aW9uIGxpc3QKPiBidXQgdGhlIHBhcnRpdGlvbiBpdHNl
bGYuIE90aGVyd2lzZSB0aGUgcGFydGl0aW9uIGxpc3QgZ2V0cyBicm9rZW4KPiBhbmQgYW55IHN1
YnNlcXVlbnQgcmVtb3ZlIG9wZXJhdGlvbnMgbGVhZHMgdG8gYSBrZXJuZWwgcGFuaWMuCj4gCgpD
YW4geW91IHBsZWFzZSBBZGQgYSBjb3VwbGUgb2YgRml4ZXM6ICsgQ2M6IHN0YWJsZSB0YWdzPwoK
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIE9ldGtlbiA8YW5kcmVhcy5vZXRrZW5Ac2llbWVucy1l
bmVyZ3kuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9tdGRwYXJ0LmMgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9tdGRwYXJ0LmMgYi9kcml2ZXJzL210ZC9tdGRwYXJ0LmMKPiBpbmRleCA5
NWQ0NzQyMmJiZjIwLi41NzI1ODE4ZmExOTlmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210
ZHBhcnQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYwo+IEBAIC0zMTMsNyArMzEzLDcg
QEAgc3RhdGljIGludCBfX210ZF9kZWxfcGFydGl0aW9uKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+
ICAJaWYgKGVycikKPiAgCQlyZXR1cm4gZXJyOwo+ICAKPiAtCWxpc3RfZGVsKCZjaGlsZC0+cGFy
dC5ub2RlKTsKPiArCWxpc3RfZGVsKCZtdGQtPnBhcnQubm9kZSk7Cj4gIAlmcmVlX3BhcnRpdGlv
bihtdGQpOwo+ICAKPiAgCXJldHVybiAwOwoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
