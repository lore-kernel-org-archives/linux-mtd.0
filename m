Return-Path: <SRS0=H+qW=CU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF57C2D0E1
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 15:56:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A1DC221ED
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 15:56:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Goj++CUh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A1DC221ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=36Ycn7cU4NSxZOJ8QTfDPsWnJnsVpnXjF4Yk7boGLw4=; b=Goj++CUhtCiHzBHl2/jfGCFcy
	HXADa0+S1XTwu0K0MuhIL9IuPP2CPhRZrXNMYKi23VQDl9sq72j8jic+f4J3fQcn2Luqo+NB0+Bfu
	yrHvILq7ksqt61nI+v/KhdGZsoU9lgPpMMBbq5b5IHehf3GCYpZDWXK7FEMIdd9WdOPVbuQMsdi2x
	LvwDGDbdgWy/mPM+nGmFfQsBBBFwDm/nYkBdCPWr95ghrc8mU8PQNPAjSFdK9hqfwlp4KLCTWkRSI
	WObyqHFQYKVYLy9xtb9pHMg77VnEqXamb9eM5tRIhYFgNVNzeFWuzPAlulGKcPLf8qBOwko4IXnIp
	cAJ8+e+6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGlOX-0001Lx-Uz; Fri, 11 Sep 2020 15:55:25 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGlOT-0001Jr-DE
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2020 15:55:22 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 13E07E000F;
 Fri, 11 Sep 2020 15:55:15 +0000 (UTC)
Date: Fri, 11 Sep 2020 17:55:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] mtd: remove redundant assignment to pointer eb
Message-ID: <20200911175514.766eeaf1@xps13>
In-Reply-To: <20200911102321.22515-1-colin.king@canonical.com>
References: <20200911102321.22515-1-colin.king@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_115521_570123_B6E8583A 
X-CRM114-Status: GOOD (  17.36  )
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
Cc: Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ29saW4sCgpDb2xpbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlIG9u
IEZyaSwgMTEgU2VwIDIwMjAKMTE6MjM6MjEgKzAxMDA6Cgo+IEZyb206IENvbGluIElhbiBLaW5n
IDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gCj4gUG9pbnRlciBlYiBpcyBiZWluZyBhc3Np
Z25lZCBhIHZhbHVlIHRoYXQgaXMgbmV2ZXIgcmVhZCwgdGhlIGFzc2lnbm1lbnQKPiBpcyByZWR1
bmRhbnQgYW5kIGNhbiBiZSByZW1vdmVkLgo+IAo+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJVbnVz
ZWQgdmFsdWUiKQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNh
bm9uaWNhbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL210ZHN3YXAuYyB8IDEgLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9t
dGRzd2FwLmMgYi9kcml2ZXJzL210ZC9tdGRzd2FwLmMKPiBpbmRleCA1OGVlZmE0M2FmMTQuLjc5
NWRlYzQ0ODNjMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRzd2FwLmMKPiArKysgYi9k
cml2ZXJzL210ZC9tdGRzd2FwLmMKPiBAQCAtMTA1Myw3ICsxMDUzLDYgQEAgc3RhdGljIGludCBt
dGRzd2FwX3dyaXRlc2VjdChzdHJ1Y3QgbXRkX2Jsa3RyYW5zX2RldiAqZGV2LAo+ICAJaWYgKHJl
dCA8IDApCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gLQllYiA9IGQtPmViX2RhdGEgKyAobmV3Ymxv
Y2sgLyBkLT5wYWdlc19wZXJfZWJsayk7Cj4gIAlkLT5wYWdlX2RhdGFbcGFnZV0gPSBuZXdibG9j
azsKPiAgCj4gIAlyZXR1cm4gMDsKClllcyBpdCBsb29rcyB1bnVzZWQgYnV0IHBlcmhhcHMgaXQg
aGVscHMgdG8gY2F0Y2ggdGhlIGxvZ2ljIGhlcmUuIFRoaXMKaXMgbm90IGEgc3Ryb25nIGRpc2Fn
cmVlbWVudCBidXQgSSdkIGtlZXAgaXQgdGhpcyB3YXkuIExldCdzIHNlZSB3aGF0Cm90aGVyIG1h
aW50YWluZXJzIHRoaW5rLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
