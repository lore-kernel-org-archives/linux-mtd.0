Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B71C10F0E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:22:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E707206B6
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:22:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GSzSNNV8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E707206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXXH2Ihf9DRCGYMiiSkPxgCP0ZEuloTizUWVXY6bOXQ=; b=GSzSNNV8/k2k2B
	+rJrQeFmQcPOvYnZveDUBv3fNjfiFCW+DlLc4bfeklc1XN6lGkDQ3SUZHmwXIPGMDy4GyfgU2pFGY
	VtA+9H9yTwbiJAFaiGqq6G3Z/sM3Qhbwo93GNPE/q7+Cnly0Yuh9vrOe55UfW2ZcUBRMv8DC+mMU8
	oefjavUtmUQ6yboHWJS6nVIwIJbw62z4s6YgERt1Op2YgDhvZa6EUp9rfq6uPZzObUmdDTs0LF9/F
	+h2g2F24h4SCxcRW0Knl/OEWpAF+g5XXoYfqMCwiJY6xsnOgOVndzZBejPhqMvfxmTl68LgeH8kLu
	Rnv0AzCSixv85RWkZzZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH9na-0000z6-Jk; Thu, 18 Apr 2019 16:22:06 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH9nY-0000yj-8i
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 16:22:05 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C58C420003;
 Thu, 18 Apr 2019 16:22:00 +0000 (UTC)
Date: Thu, 18 Apr 2019 18:21:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mtd: rawnand: constify elements of
 NAND_OP_PARSER(_PATTERN)
Message-ID: <20190418182159.66d5188c@xps13>
In-Reply-To: <20190409045332.5452-1-yamada.masahiro@socionext.com>
References: <20190409045332.5452-1-yamada.masahiro@socionext.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_092204_455109_FD685A4F 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBUdWUsICA5IEFwcgoyMDE5IDEzOjUzOjMyICswOTAwOgoKPiBDdXJyZW50
bHksIGRyaXZlcnMgYXJlIGFibGUgdG8gY29uc3RpZnkgYSBuYW5kX29wX3BhcnNlciBhcnJheSwK
PiBidXQgbm90IG5hbmRfb3BfcGFyc2VyX3BhdHRlcm4gYW5kIG5hbmRfb3BfcGFyc2VyX3BhdHRl
cm5fZWxlbQo+IHNpbmNlIHRoZXkgYXJlIGluc3RhbnRpYXRlZCBieSB1c2luZyB0aGUgTkFORF9P
UF9QQVJTRVIoX1BBVFRFUk4pLgo+IAo+IEFkZCAnY29uc3QnIHRvIHRoZW0gaW4gb3JkZXIgdG8g
bW92ZSBtb3JlIGRyaXZlciBkYXRhIGZyb20gLmRhdGEgdG8KPiAucm9kYXRhIHNlY3Rpb24uCj4g
Cj4gU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9u
ZXh0LmNvbT4KPiAtLS0KPiAKCkFwcGxpZWQgdG8gCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgCmJyYW5jaCBuYW5kL25leHQuCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
