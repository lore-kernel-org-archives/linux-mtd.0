Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D07FF885E
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 13:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7CapPY2i1q+wtprTqgYL5Or9i7Sx62rYNzFP+tT0wyU=; b=K41ZutrMdOz2Q3
	yy7qKXOB3/1oefYDjVC6VxwQsHJg51X+Umj4pUoCNWtV+ej8tvD2dlCwE6cydX9+w1SrsXlemWHka
	SuOzWQFRsJPaawuvLexAD+rwXwzcTYxgcGiyZQy96qBvqX5Wg0NvN84AyyBt3aKJhDh8JBjrgQryp
	fxI/vUuP9FUlItUmYmPmLhz24eScnDDtIwTy3Cnnxq7czdrUyTEHBUa23NjlZZF0ihKjpkwi4MWGu
	9+tAPkQe+T5LKzokP1qik137AEW3is0VvEva5u5TSaVcMJqMU8KvbAuQOOuTPnvSR40AZV3Mm+jlw
	CB0wGvHsLaehSiNyoM7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLjE-0000000GyoT-2GKB;
	Mon, 27 Apr 2026 13:10:24 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLjB-0000000Gynu-18xg
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 13:10:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D4FB6C5CD4A;
	Mon, 27 Apr 2026 13:11:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC662600D1;
	Mon, 27 Apr 2026 13:10:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73730107281F5;
	Mon, 27 Apr 2026 15:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777295418; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KbSewh1KEQe103QabR+kkgAxSdXaSeUSFmLvF7jxFgk=;
	b=RdPOVtoweKEtUdvuut6ZZ/jSBiSnmJkAqhzbnauw2KYTInyw8M0jYWKTFLdiC7bzSW+MQx
	WgHxFlrG3gElWWp8GciAvRGo/B3L7GAriv01tGI4pCJm5BSWheczOWooUMtDBisyW2KWzm
	160aB7jNcGch9FOtKoNinmEvKRZdFEsdha2fHap46wtHRGIgJ4Kf872xK3J8IaoOVdKmcl
	a8ilxSTaA6F+guFKYRdsp87fpUu7Csa9JKX+hdrbR4MJpysM1AMFaYOWqC8LWnbtwCLH6U
	pJeoGwW4BqdD6h+zfNuTmlubWOe/qlk9pXN5AcBgIyU2J4NfvSwleyXQsQqqEA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <pratyush@kernel.org>,  Steam Lin
 <STLin2@winbond.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: (subset) [PATCH 0/5] mtd/spi: Fix Winbond W35N02JW / W35N04JW
 support
In-Reply-To: <177590483913.1311359.6081286854444459409.b4-ty@b4> (Mark Brown's
	message of "Sat, 11 Apr 2026 11:53:59 +0100")
References: <20260410-winbond-6-19-rc1-oddr-v1-0-2ac4827a3868@bootlin.com>
	<177590483913.1311359.6081286854444459409.b4-ty@b4>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 27 Apr 2026 15:10:17 +0200
Message-ID: <87se8gh7ly.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_061021_514602_70AC9065 
X-CRM114-Status: UNSURE (   6.98  )
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

Cj4+IFdpbmJvbmQgY2hpcHMgVzM1TjAySlcgYW5kIFczNU4wNEpXIGRpZmZlciBzbGlnaHRseSBm
cm9tIFczNU4wMUpXLiBBcwo+PiB0aGV5IGhhdmUgbW9yZSBibG9ja3MsIHRoZXkgcmVxdWlyZSBh
IGNvdXBsZSBtb3JlIGJpdHMgdG8gZnVsbHkgYWRkcmVzcwo+PiB0aGUgd2hvbGUgZGV2aWNlLiBU
aGVzZSBhZGRyZXNzIGJpdHMgaGF2ZSBiZWVuIHN0dWZmZWQgYXQgdGhlIGVuZCBvZiB0aGUKPj4g
Y29tbWFuZCBjeWNsZXMsIHdoaWNoIGlzIG5vbiBzdGFuZGFyZCwgYW5kIHRoaXMgaXMgc29tZXRo
aW5nIEkgZGlkbid0Cj4+IGNhdGNoIGluIHRoZSBmaXJzdCBwbGFjZS4KPj4gCj4+IFsuLi5dCj4K
PiBBcHBsaWVkIHRvCj4KPiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9icm9vbmllL3NwaS5naXQgZm9yLTcuMQo+Cj4gVGhhbmtzIQo+Cj4gWzEvNV0g
c3BpOiBjYWRlbmNlLXFzcGk6IFJldmVydCB0aGUgZmlsdGVyaW5nIG9mIGNlcnRhaW4gb3Bjb2Rl
cyBpbiBPRFRSCj4gICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9icm9vbmllL3NwaS9jLzVl
NzVjMWQ0ZDM4Ngo+IFsyLzVdIHNwaTogc3BpLW1lbTogQWRkIGEgcGFja2VkIGNvbW1hbmQgb3Bl
cmF0aW9uCj4gICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9icm9vbmllL3NwaS9jL2Y3OWVl
OWU0YjIzMgoKVGhlIDMgb3RoZXIgcGF0Y2hlcyBoYXZlIGJlZW4gcXVldWVkIGZvciB0aGUgbmV4
dCBtdGQvZml4ZXMgUFIuCgpUaGFua3MgYSBsb3QgTWFyayBmb3IgdGhlIHJlc3BvbnNpdmVuZXNz
LgoKQmVzIHJlZ2FyZHMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
