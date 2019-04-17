Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335ACC282DA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 09:40:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F30BB2173C
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 09:40:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n9QdnXT2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F30BB2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jY52jtHjxy4IH+tiRZybSk6G7eSSU/oXgv7bLYSiaSc=; b=n9QdnXT2dIvsbV
	DaQ0c8CABh2uZdxF1upWr1NdZ0H/oGbo0QTmBhHp1J1G4+p7haRVDzWEygf5yZ20P1NCKxYZlxzp+
	i/ag4YdSZBlDec1hS4+WcatJU/wf1kbGuDC8R2sPEHdU70RotDFANq8dcXJ1dAo29MqO75Fh74l/O
	ek/eST+LzdVKHi28cYQ3DvEL9k/Tn5TL/23V0rKRaWd0Rw+KcrAw8/s4+iTuhbhNr+b3ORaqOwf4Y
	hL3yEHR1fKHeXbP57D6uwc9sydisEsUczvI+lGwT6RT1eIgp/QaNoe6pLzaFd7RoItGOZDSXjQlOp
	VG6y49twsxGAEybGhPiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGh3O-0005eE-Hi; Wed, 17 Apr 2019 09:40:30 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGh3G-0005XL-60; Wed, 17 Apr 2019 09:40:23 +0000
X-Originating-IP: 90.88.160.238
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 07E3BC0016;
 Wed, 17 Apr 2019 09:40:11 +0000 (UTC)
Date: Wed, 17 Apr 2019 11:40:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: ams-delta: Drop board specific
 partition info
Message-ID: <20190417114010.774693cf@xps13>
In-Reply-To: <20190324223344.24590-1-jmkrzyszt@gmail.com>
References: <20190319223718.26131-1-jmkrzyszt@gmail.com>
 <20190324223344.24590-1-jmkrzyszt@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_024022_375450_AA320861 
X-CRM114-Status: GOOD (  12.44  )
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
Cc: linux-omap@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSmFudXN6LAoKSmFudXN6IEtyenlzenRvZmlrIDxqbWtyenlzenRAZ21haWwuY29tPiB3cm90
ZSBvbiBTdW4sIDI0IE1hciAyMDE5CjIzOjMzOjQ0ICswMTAwOgoKPiBBZnRlciByZWNlbnQgbW9k
aWZpY2F0aW9ucywgb25seSBhIGhhcmRjb2RlZCBwYXJ0aXRpb24gaW5mbyBtYWtlcwo+IHRoZSBk
cml2ZXIgZGV2aWNlIHNwZWNpZmljLiAgT3RoZXIgdGhhbiB0aGF0LCB0aGUgZHJpdmVyIHVzZXMg
R1BJTwo+IGV4Y2x1c2l2ZWx5IGFuZCBjYW4gYmUgdXNlZCBvbiBhbnkgaGFyZHdhcmUuCj4gCj4g
RHJvcCB0aGUgcGFydGl0aW9uIGluZm8gYW5kIHVzZSBNVEQgcGFydGl0aW9uIHBhcnNlciB3aXRo
IGRlZmF1bHQgbGlzdAo+IG9mIHBhcnNlciBuYW1lcyBpbnN0ZWFkLiAgRm9yIHRoZSBPRiBwYXJz
ZXIgdG8gd29yayBjb3JyZWN0bHksIHBhc3MKPiBkZXZpY2Ugb2Zfbm9kZSB0byBtdGQuCj4gCj4g
QW1zdHJhZCBEZWx0YSB1c2VycyBzaG91bGQgYXBwZW5kIHRoZSBmb2xsb3dpbmcgcGFydGl0aW9u
IGluZm8gdG8gdGhlaXIKPiBrZXJuZWwgY29tbWFuZCBsaW5lLCBwb3NzaWJseSBieSBlbWJlZGRp
bmcgaXQgaW4gQ09ORklHX0NNRExJTkU6Cj4gCj4gbXRkcGFydHM9YW1zLWRlbHRhLW5hbmQ6MzU4
NGsoS2VybmVsKSwyNTZrKHUtYm9vdCksMjU2ayh1LWJvb3RfcGFyYW1zKSxcCj4gMjU2ayhBbXN0
cmFkX0xEUiksMjdtKEZpbGVfc3lzdGVtKSw3NjhrKFBCTF9yZXNlcnZlZCkuCj4gCj4gRm9yIHRo
ZWlyIGNvbnZlbmllbmNlLCBDT05GSUdfTVREX0NNRExJTkVfUEFSVFMgc3ltYm9sIGlzIHNlbGVj
dGVkCj4gYXV0b21hdGljYWxseSBmcm9tIHRoYXQgYm9hcmQgS2NvbmZpZyBpZiB0aGlzIE5BTkQg
ZHJpdmVyIGlzIGFsc28KPiBzZWxlY3RlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW51c3ogS3J6
eXN6dG9maWsgPGpta3J6eXN6dEBnbWFpbC5jb20+Cj4gQ2M6IFRvbnkgTGluZGdyZW4gPHRvbnlA
YXRvbWlkZS5jb20+Cj4gLS0tCgpGWUkgSSBhbSBva2F5IHdpdGggdGhlIGNoYW5nZSBidXQgSSBh
bSB3YWl0aW5nIGZvciBhY2tzIGJlZm9yZSBhcHBseWluZwppdC4KClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
