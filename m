Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFEAC282C2
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 12:35:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CBA22146E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 12:35:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="glz1f7DQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CBA22146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uczzKKGCZvLX/ZnYMAM+4FvPOvedx51ucsDSv+lUrkQ=; b=glz1f7DQzgwPkw
	lSgey4QseO29262+s28YMnH2Rcml0eTa3UXWHMXAUiPOXPjF8E9Nf+HHE59iA2Svo/0BF4nEz6kiL
	QNJgocTuW1l7VCZ3aVEmOaOWvKxhQNsqJgE9Gv+JiFDlnCYWwEl4Ba2HIBb+/2z6G/FVYq1ou5B6Q
	iv59ffaiGL590kgrWURlk82xlOEACWdh9i3roHtld/ImzBq6tODcMx4sq3w1pCNvvlnPwhQczNmZW
	0OHN/U8XxbiG0Iuv8W/wP5rF4gZCz4bB9nIM81Pk+78+6oOsThD1YbWMzrVeTvu/+GblJwUJWfLOD
	UfQOEfrou059BTIqSqxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn0hi-00052h-M9; Fri, 25 Jan 2019 12:35:26 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn0hf-00052D-Uh
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 12:35:25 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 7784D207B0; Fri, 25 Jan 2019 13:35:22 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr
 [90.88.29.206])
 by mail.bootlin.com (Postfix) with ESMTPSA id 2076920397;
 Fri, 25 Jan 2019 13:35:12 +0100 (CET)
Date: Fri, 25 Jan 2019 13:35:12 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yoshio Furuyama <tmcmc-mb-yfuruyama7@ml.toshiba.co.jp>
Subject: Re: [PATCH] mtd: spinand: Add support for all Toshiba Memory products
Message-ID: <20190125133512.01018a33@xps13>
In-Reply-To: <20190116055319.2755-1-tmcmc-mb-yfuruyama7@ml.toshiba.co.jp>
References: <20190116055319.2755-1-tmcmc-mb-yfuruyama7@ml.toshiba.co.jp>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_043524_127332_EC13A644 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
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
Cc: bbrezillon@kernel.org, richard@nod.at, linux-kernel@vger.kernel.org,
 frieder.schrempf@kontron.De, marek.vasut@gmail.com, peron.clem@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWW9zaGlvLAoKWW9zaGlvIEZ1cnV5YW1hIDx0bWNtYy1tYi15ZnVydXlhbWE3QG1sLnRvc2hp
YmEuY28uanA+IHdyb3RlIG9uIFdlZCwgMTYKSmFuIDIwMTkgMTQ6NTM6MTkgKzA5MDA6Cgo+IEFk
ZCBkZXZpY2UgdGFibGUgZm9yIFRvc2hpYmEgTWVtb3J5IHByb2R1Y3RzLgo+IEFsc28sIGdlbmVy
YWxpemUgT09CIGxheW91dCBzdHJ1Y3R1cmUgYW5kIGZ1bmN0aW9uIG5hbWVzLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFlvc2hpbyBGdXJ1eWFtYSA8dG1jbWMtbWIteWZ1cnV5YW1hN0BtbC50b3NoaWJh
LmNvLmpwPgo+IAo+IC0tLQoKQXBwbGllZCB0byBuYW5kL25leHQgd2l0aCB0aGUgbWF0aGVtYXRp
Y2FsIG9wZXJhdGlvbnMgZW5jbG9zZWQgaW4KYnJhY2VzIGFzIGRpc2N1c3NlZDoKCi0JcmVnaW9u
LT5sZW5ndGggPSBtdGQtPm9vYnNpemUgLyAyIC0gMjsgIAorCXJlZ2lvbi0+bGVuZ3RoID0gKG10
ZC0+b29ic2l6ZSAvIDIpIC0gMjsgIAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
