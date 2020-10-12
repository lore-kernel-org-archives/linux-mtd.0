Return-Path: <SRS0=FSZL=DT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A1CC433E7
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 19:18:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E0A52074A
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 19:18:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lp7ae0dV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E0A52074A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rWABxtBMRL7fEaUc+5xWAd8ycTU6lHcxJ50q8EBkOM0=; b=lp7ae0dVkMg35kO+Blpy2Y8PX
	GPtLf/67RIT0l5hqx6fn53HRoBNHr2pQtzOhn3cjAKDoDRzRXjxocx90BP78Dt8KkBMfatTrdosBv
	j9RmsSXZfQ5/Qrl/TjCLxh30T/AptN5Z+LuSG/CzCGw/tl/EaqiDthnpql6vB75U9Jp00FlPNhH1k
	E1aLhjbmmb3WVNPa9UXCCK4OU5yorGS0gsFuBzPzYZ3gN/9d6tzy+QQ8H0/kRgUkvUw2iyg8yb1nV
	Kfu/F6+NGkSNES2JvcbZAvlOiWrteENX7cyTdmH7Dyo9P6ahldAYFRp/5+ODcvA1X8EjvFMdLgxZI
	kKidDPJbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kS3K2-0002cq-M7; Mon, 12 Oct 2020 19:17:26 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kS3K0-0002bp-1E
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2020 19:17:25 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A63AF6125F33;
 Mon, 12 Oct 2020 21:17:21 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0sY4GwlcOtH7; Mon, 12 Oct 2020 21:17:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1558A61D8A8D;
 Mon, 12 Oct 2020 21:17:20 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id VOYcOp75qzIk; Mon, 12 Oct 2020 21:17:19 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id DEBF16125F33;
 Mon, 12 Oct 2020 21:17:19 +0200 (CEST)
Date: Mon, 12 Oct 2020 21:17:19 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <2029402034.189005.1602530239737.JavaMail.zimbra@nod.at>
In-Reply-To: <20201012070958.11083-1-vigneshr@ti.com>
References: <20201012070958.11083-1-vigneshr@ti.com>
Subject: Re: [PATCH] mtd: hyperbus: Fix build failure when only
 RPCIF_HYPERBUS is enabled
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: hyperbus: Fix build failure when only RPCIF_HYPERBUS is enabled
Thread-Index: Uh0XQbUp09aZK/SHpd4OdKcrRr0PTg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_151724_225432_33A55A78 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlZpZ25lc2ggUmFnaGF2ZW5k
cmEiIDx2aWduZXNockB0aS5jb20+Cj4gQW46ICJWaWduZXNoIFJhZ2hhdmVuZHJhIiA8dmlnbmVz
aHJAdGkuY29tPiwgIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwg
InJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4KPiBDQzogIlNlcmdlaSBTaHR5bHlvdiIgPHNlcmdl
aS5zaHR5bHlvdkBnbWFpbC5jb20+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJh
ZGVhZC5vcmc+LCAibGludXgta2VybmVsIgo+IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
Pgo+IEdlc2VuZGV0OiBNb250YWcsIDEyLiBPa3RvYmVyIDIwMjAgMDk6MDk6NTgKPiBCZXRyZWZm
OiBbUEFUQ0hdIG10ZDogaHlwZXJidXM6IEZpeCBidWlsZCBmYWlsdXJlIHdoZW4gb25seSBSUENJ
Rl9IWVBFUkJVUyBpcyBlbmFibGVkCgo+IGNvbW1pdCA1ZGUxNWI2MTBmNzggKCJtdGQ6IGh5cGVy
YnVzOiBhZGQgUmVuZXNhcyBSUEMtSUYgZHJpdmVyIikgbGVhZHMKPiB0byBidWlsZCBmYWlsdXJl
WzFdIHdpdGggQ09NUElMRV9URVNUIGFuZCBSUENJRl9IWVBFUkJVUyBlbmFibGVkLiBUaGlzCj4g
aXMgYmVjYXVzZSBkcml2ZXIgbmVlZHMgZnVuY3Rpb25zIFJFTkVTQVNfUlBDSUYgd2hpY2ggaXMg
b25seSBidWlsZGFibGUKPiBmb3IgQ09ORklHX0FSQ0hfUkVORVNBUy4KPiAKPiBGaXggdGhpcyBi
eSBkcm9wcGluZyBDT01QSUxFX1RFU1QgZnJvbSBSUENJRl9IWVBFUkJVUyBLY29uZmlnIGVudHJ5
Lgo+IFRoaXMgZW5zdXJlcyBkcml2ZXIgY2FuIGJlIGJ1aWx0IG9ubHkgd2hlbiBSRU5FU0FTX1JQ
Q0lGIGlzIGFsc28KPiBzZWxlY3RlZC4KPiAKPiBbMV06Cj4gcnBjLWlmLmM6KC50ZXh0KzB4MjAp
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBycGNpZl9kaXNhYmxlX3JwbScgbGQ6Cj4gZHJpdmVy
cy9tdGQvaHlwZXJidXMvcnBjLWlmLm86IGluIGZ1bmN0aW9uIGBycGNpZl9oYl9wcmVwYXJlX3Jl
YWQnOgo+IHJwYy1pZi5jOigudGV4dCsweGQ2KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgcnBj
aWZfcHJlcGFyZScgbGQ6Cj4gZHJpdmVycy9tdGQvaHlwZXJidXMvcnBjLWlmLm86IGluIGZ1bmN0
aW9uIGBycGNpZl9oYl9yZWFkMTYnOgo+IFsuLi5dCj4gCj4gRml4ZXM6IDVkZTE1YjYxMGY3OCAo
Im10ZDogaHlwZXJidXM6IGFkZCBSZW5lc2FzIFJQQy1JRiBkcml2ZXIiKSBsZWFkcwo+IFJlcG9y
dGVkLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+IFNpZ25lZC1vZmYt
Ynk6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPiAtLS0KPiAKPiBCYXNl
ZCBvbiBtdGQvbmV4dAo+IAo+IFJpY2hhcmQsCj4gCj4gQ291bGQgeW91IHBsZWFzZSBwdWxsIHRo
aXMgaW50byBtdGQvbmV4dD8KCkFwcGxpZWQhIDotKQoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
