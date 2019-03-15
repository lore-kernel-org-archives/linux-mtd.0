Return-Path: <SRS0=5Vwq=RS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F57CC43381
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 08:40:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C68921872
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 08:40:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SreVYEBQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C68921872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vc/yE3kc0U0wcWDyp96vpfqr+BalDPYS8iOh8pYxvkQ=; b=SreVYEBQ1VXAaJ
	+4jmdKecGtHBDEhk6Gm8nKf3kF64TiGx8zXLFmbfwxtF6PnCSFoeytc9qZZMzu8AkKa8GCefI6Nxa
	QXRVksa4mxCm5SxBMSdVJR90jd1oRW4ZJRnaHeEw+WpWr6/xkO71qCbfmoBebrH773wZEFhfi6+/l
	3M8n31/ZHFS+z8L0MPhXkrMr9Wav6djRys1x1paeTJow8k0VokFREkY87zkP4McFya80koEE1Ohdl
	QNTrQ20PR6Cv+aHqtWQM3nBTMSmDWcdWvRSs2Er36guOGtIdiIYAS1aIGslCvFNjZWZO/G//jFHns
	b9dOeKYQX3OQSohlqTVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4iO3-0005kZ-Pp; Fri, 15 Mar 2019 08:40:19 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4iO1-0005jn-9v
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2019 08:40:18 +0000
X-Originating-IP: 90.88.22.102
Received: from xps13 (aaubervilliers-681-1-80-102.w90-88.abo.wanadoo.fr
 [90.88.22.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6D05F60020;
 Fri, 15 Mar 2019 08:40:10 +0000 (UTC)
Date: Fri, 15 Mar 2019 09:40:09 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 09/12] mtd: rawnand: ingenic: Make use of ecc-engine
 property
Message-ID: <20190315094009.66b91ad5@xps13>
In-Reply-To: <20190313222259.28704-9-paul@crapouillou.net>
References: <20190313222259.28704-1-paul@crapouillou.net>
 <20190313222259.28704-9-paul@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_014017_499342_440865B2 
X-CRM114-Status: GOOD (  19.00  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 Boris Brezillon <bbrezillon@kernel.org>, Mathieu Malaterre <malat@debian.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Harvey Hunt <harveyhuntnexus@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGF1bCwKClBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZSBvbiBX
ZWQsIDEzIE1hciAyMDE5IDIzOjIyOjU2CiswMTAwOgoKPiBVc2UgdGhlICdlY2MtZW5naW5lJyBz
dGFuZGFyZCBwcm9wZXJ0eSBpbnN0ZWFkIG9mIHRoZSBjdXN0b20KPiAnaW5nZW5pYyxiY2gtY29u
dHJvbGxlcicgY3VzdG9tIHByb3BlcnR5LCB3aGljaCBpcyBub3cgZGVwcmVjYXRlZC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KPiAtLS0K
PiAKPiBOb3RlczoKPiAgICAgdjU6IE5ldyBwYXRjaAo+IAo+ICBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9pbmdlbmljL2luZ2VuaWNfZWNjLmMgfCAxMyArKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfZWNjLmMgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfZWNjLmMKPiBpbmRleCBkN2YzYThjM2FiZWEuLjMwNDM2
Y2E2NjI4YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2Vu
aWNfZWNjLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfZWNj
LmMKPiBAQCAtODIsOSArODIsOSBAQCBzdGF0aWMgc3RydWN0IGluZ2VuaWNfZWNjICppbmdlbmlj
X2VjY19nZXQoc3RydWN0IGRldmljZV9ub2RlICpucCkKPiAgCj4gIC8qKgo+ICAgKiBvZl9pbmdl
bmljX2VjY19nZXQoKSAtIGdldCB0aGUgRUNDIGNvbnRyb2xsZXIgZnJvbSBhIERUIG5vZGUKPiAt
ICogQG9mX25vZGU6IHRoZSBub2RlIHRoYXQgY29udGFpbnMgYSBiY2gtY29udHJvbGxlciBwcm9w
ZXJ0eS4KPiArICogQG9mX25vZGU6IHRoZSBub2RlIHRoYXQgY29udGFpbnMgYSBlY2MtZW5naW5l
IHByb3BlcnR5LgoKV291bGQgImNvbnRhaW5zIGFuIGVjYy1lbmdpbmUgcHJvcGVydHkiIGJlIGJl
dHRlciBFbmdsaXNoPwoKSSBhbSBub3Qgc3VyZSB3aGF0IGlzIHRoZSBydWxlIHdoZW4gaXQgY29t
ZXMgdG8gcGxhaW4gRW5nbGlzaCB3aXRoCnZhcmlhYmxlIG5hbWVzLiBIb3dldmVyIGlmIHlvdSBh
Z3JlZSwgbm8gbmVlZCB0byByZS1zZW5kIHRoZSBzZXJpZXMsIEkKY2FuIGZpeCBpdCB3aGVuIGFw
cGx5aW5nLgoKQlRXLCBJIGFkZGVkIGh3IEVDQyBlbmdpbmVzIHN1cHBvcnQgdG8gbXkgZ2VuZXJp
YyBFQ0MgZW5naW5lCmltcGxlbWVudGF0aW9uLCBidXQgbWlncmF0aW5nIHRoZSB3aG9sZSByYXcg
TkFORCBzdWJzeXN0ZW0gKHVzaW5nIEkvTwpyZXF1ZXN0cyBsaWtlIGluIHRoZSBTUEktTkFORCBj
b3JlLCBhZGRpbmcgcHJlcGFyZS9maW5pc2hfaW9fcmVxIGhvb2tzKQppcyBnb2luZyB0byBiZSBt
dWNoIG1vcmUgaW52YXNpdmUgdGhhbiBpbml0aWFsbHkgZXhwZWN0ZWQsIHNvIEkgYW0gbm90CnN1
cmUgSSB3aWxsIGZpbmlzaCB0aGUgbWlncmF0aW9uIGFueSB0aW1lIHNvb24uCgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
