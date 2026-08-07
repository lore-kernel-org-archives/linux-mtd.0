Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6492C5AC7A
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 13:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Glhe7PhGjZudtwewTTPPZPW5PvwmMSsolFN/M7wcaXQ=; b=Ja4mQa/lLTt6XV
	LIsr1LyGr90lYW69DKAzpeF1Kxp//rU8vWaorWxW8QQWOR8rCekOqKKp/1qlbN1M0gR3MC6GS7iHI
	iEScI8hYI44B1JyoGbevOW4lYHybdVs/3ZQKw/1SEIjjHfZ8UBS9CKqnKSkzCNoQqS8drdoOJ3UkP
	Xd+OZg0GcDJrRN+kxjc9+OHeFut2k/cG0RoBFRnw42kACN5NW9liXIqUcdWOjjLCk8VYuKPO8iCO0
	9yIbasCF1lqkoYULuYtxm2FEYS+vDyhSemFPRrxg6Cn9qevXPaxmTMe5X0HYBRrXOlFvxqLFIaQu2
	bZOq93yJaMtn3iOdPJkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL6A-00000008D3A-1Iej;
	Fri, 07 Aug 2026 13:58:58 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL67-00000008D1r-25nb;
	Fri, 07 Aug 2026 13:58:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AECDA1A14AF;
	Fri,  7 Aug 2026 13:58:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C544603F0;
	Fri,  7 Aug 2026 13:58:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A28C11C37949;
	Fri,  7 Aug 2026 15:58:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786111128; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ga9YwrOPByLdYiHYo8H6DvEk34V4v2367x//laxUrRs=;
	b=ScjCdzgXo+20f1TJ6yi9Y/gKNAsJXE1WMAzB6zofImyQULjEyDv5RGjTT33PlmgCknlKbS
	VJSaztZ959rp0Y7HWX9dRfOBnoycM+h5mLttSH99O4Vv5pymAx8bXhTBppiznhFVqOvQyF
	YzaOojK9GvGdrS+wNZEmdWMausOaHCKSaVsTsUC9udre0NzV5UMqu4NyqmFt6Cngzb0JYq
	06vrCjL1Wp4j/LwTVG/wwMtxZmQXRgKbrzpKdNFC9Wh2fj+On6LT39EgskXzsYwQu5m8Ax
	nuRQ1dDgw5P2o60WVuWk6wasqhQa9V9IKYH2LBTIfRFDfupQVAzfR3uDMSfjHA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Richard Genoud <richard.genoud@bootlin.com>,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH v2 0/3] mtd: rawnand: sunxi: fix H6/H616 controller timings
In-Reply-To: <20260717-submit-sunxi-nand-h6-h616-timings-v2-0-225515107640@gmail.com>
	(James Hilliard's message of "Fri, 17 Jul 2026 11:33:56 -0600")
References: <20260717-submit-sunxi-nand-h6-h616-timings-v2-0-225515107640@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 07 Aug 2026 15:58:46 +0200
Message-ID: <87ik5mav6x.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_065855_677902_618E7993 
X-CRM114-Status: UNSURE (   8.84  )
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

SGkgSmFtZXMsCgpPbiAxNy8wNy8yMDI2IGF0IDExOjMzOjU2IC0wNiwgSmFtZXMgSGlsbGlhcmQg
PGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgoKPiBUaGUgc3VueGkgTkFORCB0aW1p
bmcgc29sdmVyIGN1cnJlbnRseSBhcHBsaWVzIHRoZSBvcmlnaW5hbCBBMTAgTkRGQwo+IHRpbWlu
ZyBjaGFyYWN0ZXJpc3RpY3MgdG8gZXZlcnkgc3VwcG9ydGVkIGNvbnRyb2xsZXIuIFRoZSBINi9I
NjE2IE5ERkMKPiB1c2VzIHR3byBpbnRlcm5hbCBjeWNsZXMgZm9yIHNldmVyYWwgc2V0dXAgYW5k
IGhvbGQgaW50ZXJ2YWxzIGFuZCBoYXMKPiBkaWZmZXJlbnQgZGVsYXktZmllbGQgZW5jb2Rpbmdz
LCBzbyB0aGUgcmVzdWx0aW5nIGNsb2NrIGFuZCB0aW1pbmcKPiByZWdpc3RlciB2YWx1ZXMgZG8g
bm90IG1hdGNoIHRoZSBoYXJkd2FyZS4KPgo+IFByZXBhcmUgZm9yIHBlci1jb250cm9sbGVyIHRp
bWluZyBkYXRhIGluIHR3byBiZWhhdmlvcmFsbHkgZm9jdXNlZAo+IHBhdGNoZXMsIHRoZW4gYWRk
IGFuZCBzZWxlY3QgdGhlIEg2MTYgY2hhcmFjdGVyaXN0aWNzIGluIHRoZSBmaW5hbCBmaXguCj4g
TGVnYWN5IGNvbnRyb2xsZXJzIHJldGFpbiB0aGVpciBleGlzdGluZyBzZXR1cC1jeWNsZSBiZWhh
dmlvciBhbmQgZGVsYXkKPiBlbmNvZGluZ3MuCj4KPiBUZXN0ZWQgb24gYW4gSDYxNiBib2FyZCB3
aXRoIFRvc2hpYmEgVEM1OE5WRzFTM0ggTkFORC4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhp
bGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKVGhlcmUgYXJlIGEgbnVtYmVyIG9m
IGNoZWNrcGF0Y2ggaXNzdWUuIENhbiB5b3UgcGxlYXNlIGZpeCB0aGVtPyAoZXhjZXB0CnRoZSBj
YW1lbGNhc2Ugb25lIHdoaWNoIGlzIGZpbmUgd2l0aCB0aW1pbmcgbmFtZXMgY29taW5nIGZyb20g
dGhlIE9ORkkKc3BlYykuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
