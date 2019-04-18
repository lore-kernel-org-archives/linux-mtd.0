Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_RHS_DOB autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03356C10F14
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:24:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C079E205F4
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:24:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RlsIswoB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C079E205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4FhhhzyoGNpXuuodsJeKWMGkbcHm+Y/CGZLzhVWCIfQ=; b=RlsIswoBI4miVR
	D565PH8BMSo3vJ65Ne+QuWJKw83tcYJyPARzo68ABOpGBXmrcHRjpBegemIBRWU+wS5YXCGmBzzT4
	hQeWwDzw2ugMG3e73IDqwscl4SpfivFsFAACyhOnLHB/yTfXQgchTqp5agQ6vNiGBPBOya+1jYrmB
	rZn/98CeL408/XIhWFeLriF1zjN2Tf+J6KkNuTP5Zd4bujLenwl61Emrd4zK6uNj1dJusV27A2kLt
	ai794NLrTgrG2/O05zm4d6+aIs93110WTbmzkcTlu8/uS4+qLwfPMNAvmMMt+UlCXfc7p1YNbXouz
	r/F34TwVkgm+Bk10xcIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH9pc-0002Kx-Po; Thu, 18 Apr 2019 16:24:12 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH9pa-0002KM-GR
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 16:24:11 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 2C4D460009;
 Thu, 18 Apr 2019 16:24:06 +0000 (UTC)
Date: Thu, 18 Apr 2019 18:24:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH 1/2] mtd: nand: Kconfig: correct the MTD_NAND_ECC_SW_BCH
 select
Message-ID: <20190418182405.67c7fc88@xps13>
In-Reply-To: <CADYN=9JS9vkw99+LkTVcEQYqwFd1O9_txgRUTYfqK1-9TnKGDg@mail.gmail.com>
References: <20190410195852.4066-1-anders.roxell@linaro.org>
 <20190416235322.3b88df99@xps13>
 <CADYN=9JS9vkw99+LkTVcEQYqwFd1O9_txgRUTYfqK1-9TnKGDg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_092410_693411_CCDBE5A8 
X-CRM114-Status: GOOD (  12.03  )
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
Cc: bbrezillon@kernel.org, richard@nod.at,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQW5kZXJzLAoKQW5kZXJzIFJveGVsbCA8YW5kZXJzLnJveGVsbEBsaW5hcm8ub3JnPiB3cm90
ZSBvbiBUaHUsIDE4IEFwciAyMDE5CjA2OjM5OjA2ICswMjAwOgoKPiBPbiBUdWUsIDE2IEFwciAy
MDE5IGF0IDIzOjUzLCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3
cm90ZToKPiA+Cj4gPiBIaSBBbmRlcnMsCj4gPgo+ID4gQW5kZXJzIFJveGVsbCA8YW5kZXJzLnJv
eGVsbEBsaW5hcm8ub3JnPiB3cm90ZSBvbiBXZWQsIDEwIEFwciAyMDE5Cj4gPiAyMTo1ODo1MSAr
MDIwMDoKPiA+ICAKPiA+ID4gQ29uZmlnIGZyYWdtZW50cyBzaG91bGQgbm90IGhhdmUgdGhlIHBy
ZWZpeCAnQ09ORklHXycuCj4gPiA+Cj4gPiA+IFJld29yayB0byByZW1vdmUgdGhlIHByZWZpeCAn
Q09ORklHXycgZnJvbSAnQ09ORklHX01URF9OQU5EX0VDQ19TV19CQ0gnLgo+ID4gPgo+ID4gPiBG
aXhlczogNTFlZjFkMGIyMDk1ICgibXRkOiBuYW5kOiBDbGFyaWZ5IEtjb25maWcgZW50cnkgZm9y
IHNvZnR3YXJlIEJDSCBFQ0MgYWxnb3JpdGhtIikKPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5kZXJz
IFJveGVsbCA8YW5kZXJzLnJveGVsbEBsaW5hcm8ub3JnPgo+ID4gPiAtLS0gIAo+ID4KPiA+IFRo
YW5rcyBmb3IgYm90aCBwYXRjaGVzLCBkbyB5b3UgbWluZCBpZiBJIHNxdWFzaCB0aGVzZSB3aXRo
IHRoZSBmYXVsdHkKPiA+IGNvbW1pdHMgd2hpY2ggYXJlIHN0aWxsIGluIG5hbmQvbmV4dD8gIAo+
IAo+IFRoYXQgaXMgZmluZSBieSBtZS4KPiAKPiBDaGVlcnMsCj4gQW5kZXJzCgoKVGhhbmtzLCBJ
IHNxdWFzaGVkIHRoaXMgb25lIGFuZCBhcHBsaWVkIHRoZSBzZWNvbmQgb25lLgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
