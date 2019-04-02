Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5EBC43381
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 08:00:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0284120856
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 08:00:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D8no62Z9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0284120856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4pOaeBxh1ZnLBrFVBNbpM9ndpzXgkTAkiCl7gZb5Qw=; b=D8no62Z9sE6glX
	iNbidd3UuiM95zbFvyR1d2E85kR4o31GJPJMUrf81rgvXOLhgq7DeNNCTEZWoRY7RSKRHnsHKMvix
	TuvXdRkotqcFCUn2D43lOJv5DzPewXtrGT4wxgmrbdt7TZA1f6VY/JRuQi6rxGxiEtlv0et4loqGz
	eTfQnvlE80CvfvfNn7014cvxJIuEk+hJOQ1pSAqOmDFEVC8qHUmtRI0YSgSKSe2w3JGNvHdd18jlH
	lcn7cihxCcKkHOFFx9NCFL8KsKrib7aK+c6hSHLb3JY/8fKh85s1Giw/PQqobDh7xAOywjihPZV5W
	05A0U21wShhndMKuQWtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBEKr-0002Rt-3L; Tue, 02 Apr 2019 07:59:57 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBEKi-0002JA-88; Tue, 02 Apr 2019 07:59:50 +0000
X-Originating-IP: 90.88.32.136
Received: from xps13 (aaubervilliers-681-1-91-136.w90-88.abo.wanadoo.fr
 [90.88.32.136]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 501891BF212;
 Tue,  2 Apr 2019 07:59:37 +0000 (UTC)
Date: Tue, 2 Apr 2019 09:59:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/4] dt-bindings: mtd: Add YAML schemas for the generic
 NAND options
Message-ID: <20190402095936.3e197a38@xps13>
In-Reply-To: <20190402061505.34r53q75spqtuqcv@flea>
References: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
 <CAL_JsqLSfitzkb8P5xQ+cCmcSeL6fTjQ3rVPJ2qiNdSXyps-sw@mail.gmail.com>
 <20190402061505.34r53q75spqtuqcv@flea>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_005948_440975_06928DCD 
X-CRM114-Status: GOOD (  13.63  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWF4aW1lLAoKPiA+ID4gKyAgICAgIG5hbmQtZWNjLXN0cmVuZ3RoOgo+ID4gPiArICAgICAg
ICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPiA+ID4gKyAg
ICAgICAgZGVzY3JpcHRpb246Cj4gPiA+ICsgICAgICAgICAgTnVtYmVyIG9mIGJpdHMgdG8gY29y
cmVjdCBwZXIgRUNDIHN0ZXAuICAKPiA+Cj4gPiBJcyB0aGVyZSBhIHJhbmdlIHdlIGNhbiBkZWZp
bmUgaGVyZT8gQ2VydGFpbmx5IHRoZXJlJ3MgYSBtaW5pbXVtCj4gPiB2YWx1ZXMgb2YgYXQgbGVh
c3QgMS4gIAo+IAo+IEl0IGRvZXNuJ3QgbG9vayBsaWtlIHRoZXJlIGlzIGZyb20gYSBxdWljayBn
cmVwLiBUaGUgRFQgc2VlbXMgdG8gYmUgaW4KPiB0aGUgNCAtIDMyIHJhbmdlLCBidXQgSSdtIG5v
dCBzdXJlIGlmIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gaGF2ZQo+IHNvbWV0aGluZyBoaWdoZXIu
Cj4gCj4gSSdsbCBsZXQgTWlxdWVsIGFuZCBCb3JpcyBjb21tZW50LgoKQSB2YWx1ZSBvZiB6ZXJv
IHdvdWxkIG5vdCBoYXZlIGFueSBtZWFuaW5nIElNSE8uIDEgaXMgZGVmaW5pdGVseSB0aGUKbWlu
aW11bSAoRUNDIEhhbW1pbmcgYWxnb3JpdGhtKS4gVGhlcmUgaXMgdGVjaG5pY2FsbHkgbm8gbWF4
aW11bS4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
