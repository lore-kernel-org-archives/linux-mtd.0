Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8779CC61D92
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Nov 2023 12:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=L0+rByw99RCW6Ioy40MeNMkMXALFe8Lw/AuM/tIqKCQ=; b=wdC8rFWXRQ6vXdvySITT0tS3zW
	hZPiRdnt7N7R+hbADavXWZyJ2BEHMzcuffVR9eSOIkDNlALPwSpnafRFa+s7q9w+JIqcRK+amf3RP
	iKNEAVTo/eJe6D895hCRNurFXbYjbXv8F6bzE6+Rj3sPxzqJz5JmFTzKlnw99o9VVN38yQ7tD4Voq
	GLh41IiXgXNByy7dmrJZGpIK4t5Bh/A0GtmSAxbgnIHnsooRLWuTsrOuCMBS/sZ8kCKwf371LgXIL
	6xNGzW8JpdgyxAdD8f6s0dCQaee5QjBx+rrJoM/ERDF0nQe+7+6wN07V11QeJsgUqCJGTL7s80r5M
	pIOyejAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Pye-00GiqH-1x;
	Tue, 21 Nov 2023 12:35:40 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Pya-00Ginz-1W
	for linux-mtd@lists.infradead.org;
	Tue, 21 Nov 2023 12:35:38 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7FD866413F8B;
	Tue, 21 Nov 2023 13:35:25 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id DYjy_CggPaDQ; Tue, 21 Nov 2023 13:35:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 031BB6413F8D;
	Tue, 21 Nov 2023 13:35:25 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MBz0_Oa-Wd39; Tue, 21 Nov 2023 13:35:24 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id D31776413F8B;
	Tue, 21 Nov 2023 13:35:24 +0100 (CET)
Date: Tue, 21 Nov 2023 13:35:24 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, pratyush <pratyush@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <392117029.267.1700570124623.JavaMail.zimbra@nod.at>
In-Reply-To: <20231121122134.1952738-1-michael@walle.cc>
References: <20231121122134.1952738-1-michael@walle.cc>
Subject: Re: [PATCH] MAINTAINERS: spi-nor: add myself as maintainer
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: MAINTAINERS: spi-nor: add myself as maintainer
Thread-Index: XXm5cxo5uR3xZsbjePg4JQGqruK4XQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_043536_678845_E8E2CC0C 
X-CRM114-Status: UNSURE (   9.57  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pY2hhZWwgV2FsbGUiIDxt
aWNoYWVsQHdhbGxlLmNjPgo+IEFmdGVyIGJlaW5nIGEgcmV2aWV3ZXIgZm9yIGEgd2hpbGUsIGFk
ZCBteXNlbGYgYXMgYSBtYWludGFpbmVyIGZvciB0aGUKPiBzcGktbm9yIHN1YnN5c3RlbS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPgo+IC0tLQo+
IE1BSU5UQUlORVJTIHwgMiArLQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4g
aW5kZXggZTU1MTczYWU1ZTM5Li42NGRiZDg0ZmMzMjQgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5F
UlMKPiArKysgYi9NQUlOVEFJTkVSUwo+IEBAIC0yMDQzMCw3ICsyMDQzMCw3IEBAIEY6CWRyaXZl
cnMvcGluY3RybC9zcGVhci8KPiBTUEkgTk9SIFNVQlNZU1RFTQo+IE06CVR1ZG9yIEFtYmFydXMg
PHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4KPiBNOglQcmF0eXVzaCBZYWRhdiA8cHJhdHl1c2hA
a2VybmVsLm9yZz4KPiAtUjoJTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz4KPiArTToJ
TWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz4KPiBMOglsaW51eC1tdGRAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IFM6CU1haW50YWluZWQKPiBXOglodHRwOi8vd3d3LmxpbnV4LW10ZC5pbmZy
YWRlYWQub3JnLwo+IC0tCj4gMi4zOS4yCgpBY2tlZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxy
aWNoYXJkQG5vZC5hdD4KClRoYW5rcywKL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
