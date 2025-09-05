Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E50CA101F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Sep 2025 19:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PWY7tuOvmK4pGqjDxJBsJImeNK12m5quhs0BFHbj0RU=; b=f3HQaxFurxmWd1
	0EBgIswEyc8vRM7/Vk9ZjeO1vFApIxzDHMaTdTbabiMqASYwi/O26/1yG2i8pxEff3Cv4MF+5uQ/y
	YMqxAtMJXh0h7UrY+6JjQc7AT/i3was2rAnZfCZld0gmx3pj7Z0/EfZJMAyhIAKaiAeTWaCDs94qQ
	ZIhW7JxfB27GC9iRSPr3BzbpJPcTPz7iF3ek/cMt2MCohIop/da/ZsmAWu3jzqs8wVI1OFSGV4O1T
	H5mu1fvVD80ydeSMlfPkCLyggw0+KIgCkTVLNb6Pe/iuQatW2mpg8tq2uuIGi3HbwZjIWSh+ldRkZ
	uUnVeAzANeflSSvp1TEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuc54-000000046uL-1h4X;
	Fri, 05 Sep 2025 19:26:42 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXrB-00000002XIO-3LCX
	for linux-mtd@lists.infradead.org;
	Fri, 05 Sep 2025 14:56:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F223D4E40C8C;
	Fri,  5 Sep 2025 14:56:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CACAF6060B;
	Fri,  5 Sep 2025 14:56:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4EA3102F011C;
	Fri,  5 Sep 2025 16:55:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757084161; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d8upgf5hUFHcVx1DQewRFxtyp0Z6M9gguxH2I+ftLSU=;
	b=UDS5yjWZDJ/sceACvO7gs7nFQm2k53K5xf3vdU8j2ZweZuXbszOPIskUz715rBCeSZ8Tcl
	RIfv+rjU7Rg+etCOrrnJc7WbvTlTJLF18qbRLD/Jg6OAzB/JO85kS+4YRR6oGODrKwFxIY
	HNOLTpFtMiP+SuSLwke01pg0utyR5vcjdSuXtzzsyVB5fJb12B2GgyZDa6syR+jEWe0m0h
	3xpANEorxDfTwEpNtV5NF+ne6SmnLeMZcTR52tbzWEl90SEUkOj+Dqc5g70AZXe8eqQVmc
	/NfcoWES0v+kblnCB6QL1IIxX2tl0rOfsw+ApC0wOIv0U3w39D8gUzxkKEEBFw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>
In-Reply-To: <20250901-mtd-validate-ooboffs-v2-1-c1df86a16743@gmail.com>
References: <20250901-mtd-validate-ooboffs-v2-1-c1df86a16743@gmail.com>
Subject: Re: [PATCH v2] mtd: core: always verify OOB offset in
 mtd_check_oob_ops()
Message-Id: <175708415877.334139.11409801733118104229.b4-ty@bootlin.com>
Date: Fri, 05 Sep 2025 16:55:58 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_075606_144969_9E26EDF3 
X-CRM114-Status: GOOD (  10.09  )
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

T24gTW9uLCAwMSBTZXAgMjAyNSAxNjoyNDozNSArMDIwMCwgR2Fib3IgSnVob3Mgd3JvdGU6Cj4g
VXNpbmcgYW4gT09CIG9mZnNldCBwYXN0IGVuZCBvZiB0aGUgYXZhaWxhYmxlIE9PQiBkYXRhIGlz
IGludmFsaWQsCj4gaXJyZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhlICdvb2JsZW4nIGlzIHNldCBp
biB0aGUgb3BzIG9yIG5vdC4gTW92ZQo+IHRoZSByZWxldmFudCBjaGVjayBvdXQgZnJvbSB0aGUg
aWYgc3RhdGVtZW50IHRvIGFsd2F5cyB2ZXJpZnkgdGhhdC4KPiAKPiBUaGUgJ29vYnRlc3QnIG1v
ZHVsZSBleGVjdXRlcyBmb3VyIHRlc3RzIHRvIHZlcmlmeSBob3cgcmVhZGluZy93cml0aW5nCj4g
T09CIGRhdGEgcGFzdCBlbmQgb2YgdGhlIGRldmljZXMgaXMgaGFuZGxlZC4gSXQgZXhwZWN0cyBl
cnJvcnMgaW4gY2FzZQo+IG9mIHRoZXNlIHRlc3RzLCBidXQgdGhpcyBleHBlY3RhdGlvbiBmYWls
cyBpbiB0aGUgbGFzdCB0d28gdGVzdHMgb24KPiBNVEQgZGV2aWNlcywgd2hpY2ggaGF2ZSBubyBP
T0IgYnl0ZXMgYXZhaWxhYmxlLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9uZXh0LCB0aGFu
a3MhCgpbMS8xXSBtdGQ6IGNvcmU6IGFsd2F5cyB2ZXJpZnkgT09CIG9mZnNldCBpbiBtdGRfY2hl
Y2tfb29iX29wcygpCiAgICAgIGNvbW1pdDogYmY3ZDA1NDNiMjYwMmJlNWNiNDUwZDhlYzVhODcx
MDc4NzgwNmY4OAoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4Lmdp
dCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90
IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
