Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E065C4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 16:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lNG5/xD8po893JBV3QTaWwzEgJLYSf5rF7mPdHTDLkg=; b=QeQFjX4YRslWyI
	X9loDrX5eS1ujAv2SJi9ZiFq5q3L56kw3qkoImCD7RbZRKqo6du7cHomweiBHWLzaRrDFG/FBCzmi
	Ow4AAsiFiOdA9nQXXKKYNwSE9blk0KWiWQfdH9exRiBQJdlMqAsLaowXRsqa7Htsf0WjIl4Gwf4RM
	1RCWYA1j++3jOejSahNNI+xl8tdEaG+uoZrB4+TUgBK0My5rRthXIu6rz6+CLzAuTNiwQ4S8cHCqH
	lBduo1WcjycSbPIkTBgJr2ii1KGESXirlY+IkxgdQ/tBrhcwATHLpS84VlLc0wBJ0JqHsUN0GcgI5
	CToOacmHnYdklW6QIZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os58b-00GGAG-SN; Mon, 07 Nov 2022 16:38:17 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4u3-00G9Dw-FE; Mon, 07 Nov 2022 16:23:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1CFC6FF80D;
	Mon,  7 Nov 2022 16:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667838191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7LxItcH4X2mFQAidJj37AbVcqbpSvYbEJuz7SqLc9TQ=;
	b=p1NvpJd/KJM+3OIkyg9dl4Z+40cVp9CZaN5QONPOCiumjj9tqvbOEaEDAOrJVSXoxuO142
	xLWnUKsqmVRsO4SssF/AhCAtEcbp/FouJzGS2aCSAwV8zCtEs+mriyj5g1SgzC/nFqH17C
	DfZFw0ImIQt2Ur86oIheCRM7Ml1ASh9KiQzzYyffQMNDEWKSFybaj1LnfGSCnxPk0kpOei
	21+bYkFUqMQfIfdoV41NL6vAgDbXnkWedFMYVwCXVdrWrjv8RNGx49vCBDOrkpG+1ZSaPQ
	GU9bVBb6UG2ka9VnaqMEfm28YA0aGSiPOnVy79SmknToN7WkAMB1UGBdZGsGSg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	noreply@ellerman.id.au
Subject: Re: [PATCH 1/2] mtd: rawnand: lpc32xx_mlc: Switch to using pm_ptr()
Date: Mon,  7 Nov 2022 17:23:09 +0100
Message-Id: <20221107162309.54192-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027131028.3838303-1-geert@linux-m68k.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'991cc42a276f1d9303674a04a351942e47c29a3f'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_082315_689082_3B5F7392 
X-CRM114-Status: UNSURE (   9.51  )
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

T24gVGh1LCAyMDIyLTEwLTI3IGF0IDEzOjEwOjI3IFVUQywgR2VlcnQgVXl0dGVyaG9ldmVuIHdy
b3RlOgo+IFRoZSBzd2l0Y2ggdG8gdXNpbmcgdGhlIGdwaW9kIEFQSSByZW1vdmVkIHRoZSBsYXN0
IHVzZXIgb2YKPiBscGMzMnh4X3dwX2Rpc2FibGUoKSBvdXRzaWRlICNpZmRlZiBDT05GSUdfUE0s
IGNhdXNpbmcgYnVpbGQgZmFpbHVyZXMgaWYKPiBDT05GSUdfUE09bjoKPiAKPiAgICAgZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbHBjMzJ4eF9tbGMuYzozODA6MTM6IGVycm9yOiDigJhscGMzMnh4X3dw
X2Rpc2FibGXigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWZ1bmN0aW9u
XQo+ICAgICAgIDM4MCB8IHN0YXRpYyB2b2lkIGxwYzMyeHhfd3BfZGlzYWJsZShzdHJ1Y3QgbHBj
MzJ4eF9uYW5kX2hvc3QgKmhvc3QpCj4gICAgICAgICAgIHwgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+Cj4gCj4gRml4IHRoaXMgYnkgc3dpdGNoaW5nIGZyb20gI2lmZGVmIENPTkZJR19Q
TSB0byBwbV9wdHIoKSwgaW5jcmVhc2luZwo+IGNvbXBpbGUtY292ZXJhZ2UgYXMgYSBzaWRlLWVm
ZmVjdC4KPiAKPiBSZXBvcnRlZC1ieTogbm9yZXBseUBlbGxlcm1hbi5pZC5hdQo+IEZpeGVzOiA3
ODJlMzJhOTkwZDlkNzAyICgibXRkOiByYXduYW5kOiBscGMzMnh4X21sYzogc3dpdGNoIHRvIHVz
aW5nIGdwaW9kIEFQSSIpCj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dEBsaW51eC1tNjhrLm9yZz4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBuYW5kL25leHQsIHRoYW5rcy4KCk1p
cXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
