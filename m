Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFEBC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:31:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CA4920880
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:31:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r+CgUtUw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CA4920880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B7N+2nZGmolMVjPgSFkcnGhx3x7Px7ZkIcUU7fOkiK4=; b=r+CgUtUwvNEO23
	4l5eLsmtKAH6cTFBAGKXmTDDfMPrWbTy1qAptrdyMfoVq9tqivYBaEUbHNIS52WFJA2Teid1N8BXi
	J7rVYkJHv9sYLlVDpb2rmrRBYwaXycBBspMJtbLmWoLSztAQ+7q/TPMUP8tzGoJzCCjahgYjHNgnR
	HkTwgrnE0HjRLAO6suMedMLmdBWQJCxKGNpSFsnqMSxjJS78ukSHIwBoXOvk3pwfjWbYtJtot9LMu
	vh+eaLQsGC9501HVJqP91Z6dHEBpMayFrpVfkfKvv8IqnprlW/mLtwK6JM6GH2e6OOt5p7UnxhPu/
	KqErs69awe0TxLaq5FaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAytl-00031z-3R; Mon, 01 Apr 2019 15:30:57 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAyta-0002q8-91; Mon, 01 Apr 2019 15:30:47 +0000
X-Originating-IP: 90.88.32.136
Received: from xps13 (aaubervilliers-681-1-91-136.w90-88.abo.wanadoo.fr
 [90.88.32.136]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id ED9F3C0014;
 Mon,  1 Apr 2019 15:30:40 +0000 (UTC)
Date: Mon, 1 Apr 2019 17:30:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liang Yang <liang.yang@amlogic.com>
Subject: Re: [PATCH 1/1] mtd: rawnand: meson: set oob layout ops
Message-ID: <20190401173039.723dc3ea@xps13>
In-Reply-To: <1553170441-23448-1-git-send-email-liang.yang@amlogic.com>
References: <1553170441-23448-1-git-send-email-liang.yang@amlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_083046_474746_87BCB873 
X-CRM114-Status: GOOD (  13.95  )
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
Cc: Rob Herring <robh@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Richard Weinberger <richard@nod.at>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>,
 devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>,
 linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTGlhbmcsCgpMaWFuZyBZYW5nIDxsaWFuZy55YW5nQGFtbG9naWMuY29tPiB3cm90ZSBvbiBU
aHUsIDIxIE1hciAyMDE5IDIwOjE0OjAxCiswODAwOgoKPiBTcGVjaWZ5IHRoZSBvb2IgbGF5b3V0
IG9wZXJhdGlvbiB0byBhdm9pZCBubyBvb2Igc2NoZW1lIGRlZmluZWQgZm9yCj4gc29tZSBuYW5k
IGZsYXNoLgo+IAo+IEZpeGVzOiA4ZmFlODU2YzUzNTAgKCJtdGQ6IHJhd25hbmQ6IG1lc29uOiBh
ZGQgc3VwcG9ydCBmb3IgQW1sb2dpYyBOQU5EIGZsYXNoIGNvbnRyb2xsZXIiKQo+IFNpZ25lZC1v
ZmYtYnk6IExpYW5nIFlhbmcgPGxpYW5nLnlhbmdAYW1sb2dpYy5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNv
bl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiBpbmRleCAzZThh
YTcxLi5hMjE1NGEyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25h
bmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+IEBAIC0xMTgz
LDYgKzExODMsOCBAQCBzdGF0aWMgaW50IG1lc29uX25hbmRfYXR0YWNoX2NoaXAoc3RydWN0IG5h
bmRfY2hpcCAqbmFuZCkKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCX0KPiAgCj4gKwltdGRfc2V0
X29vYmxheW91dChtdGQsICZtZXNvbl9vb2JsYXlvdXRfb3BzKTsKPiArCj4gIAlyZXQgPSBtZXNv
bl9uYW5kX2JjaF9tb2RlKG5hbmQpOwo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gLUVJTlZBTDsK
CgpBcHBsaWVkIHRvIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9tdGQvbGludXguZ2l0Cm9uIG5hbmQvbmV4dC4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
