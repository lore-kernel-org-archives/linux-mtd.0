Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09630C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 19:20:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBF792067D
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 19:20:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t24Qcx/m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBF792067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qYU1/oUWFJDE5F5yMtOXF5cLZHlkvyqjs/oB6DsToxA=; b=t24Qcx/mWmNKL9
	bLxGculRHvQR6s+9gHkJ++u1XtSM3RxA9x1E2Jb/kgkFoApXotdkPMhELOMqq6ugky3adMM/q349v
	YG3QsDjCf7z99OCJWK9ploWmUeqROLe2jNUB2Nbaw730o+dAVQ/AmYJU4jbIyTawdzIUZ139BWOg2
	PpHyEuktSXJXFF3sgfv8tbf3sg/qjqGFm6i56JWUe3sb7WOK3fw+qwPQOxI68eyhQwU/zB5lCIA6c
	mlywK3sT1VgDPp80c7TBhPhL0Ca1NePnIRINX42gbPKyRRJiVhKY11ZuKl+oYBZmOmJCgPz0nvjNP
	iCmiYRcTTxPDIAfO5WLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipdLw-0004F9-IH; Thu, 09 Jan 2020 19:20:20 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipdLt-0004Do-UG
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 19:20:19 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id B3382200006;
 Thu,  9 Jan 2020 19:20:15 +0000 (UTC)
Date: Thu, 9 Jan 2020 20:20:14 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Sroka <piotrs@cadence.com>
Subject: Re: [PATCH -next] mtd: rawnand: cadence: Change types of function
 parameters keeping DMA address
Message-ID: <20200109202003.44ec5102@xps13>
In-Reply-To: <1575546963-436-1-git-send-email-piotrs@cadence.com>
References: <1575546963-436-1-git-send-email-piotrs@cadence.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_112018_116584_80F9E346 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGlvdHIsCgpQaW90ciBTcm9rYSA8cGlvdHJzQGNhZGVuY2UuY29tPiB3cm90ZSBvbiBUaHUs
IDUgRGVjIDIwMTkgMTI6NTU6NTgKKzAxMDA6Cgo+IEl0IHdhcyBjaGFuZ2VkIHRvIGF2b2lkIGNv
bXBpbGF0aW9uIHdhcm5pbmdzIGR1cmluZyB0eXBlIGNhc3RpbmcuCj4gCj4gU2lnbmVkLW9mZi1i
eTogUGlvdHIgU3Jva2EgPHBpb3Ryc0BjYWRlbmNlLmNvbT4KPiBSZXBvcnRlZC1ieToga2J1aWxk
IHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gLS0tCgpJIGp1c3QgcmVhbGl6ZWQgdGhhdCBJ
IHJlY2VpdmVkIHRocmVlIHBhdGNoZXMgZm9yIHRoZSBzYW1lIGlzc3VlIGFib3V0CmEgbW9udGgg
YWdvLCB5b3VycyB3YXMgdG90YWxseSB2YWxpZCBidXQgSSBjaG9vc2UgdG8gYXBwbHkgdGhlIG9u
ZSBmcm9tCnNvbWVvbmUgbm90IGNvbnRyaWJ1dGluZyBhIGxvdCB0byBlbmNvdXJhZ2UgaGltLCBo
b3BlIHlvdSBkb24ndCBtaW5kIDopCgpDaGVlcnMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
