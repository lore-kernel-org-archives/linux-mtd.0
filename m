Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C85CA1007
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 15:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EX8O+yeghvSAqTvCbM8uQqkvw3M7RKDx3CD77yfxvJg=; b=wOB9kb9vqBgW3l
	CXs+97M9E4EPJab7pYmOb1fsHOEZg55/bWVA2b7pTYa/Ydh2c0911IYkMPpYHvM7FduE6MxHPXX+G
	288MyF4/lGNiYI8d229JZSQw2MWohewl5oW6IXNvZACqVCBdKr2SxfQ6z9k1IzLKHxU9btxLflqkg
	/Ob4XxjXqaFU2S3BPUnKrUh0tk9zfTCZXuJlZoe1ieUdRbtqYj69NXAU1cIFRf/xPFp111mQvbkqk
	UPqlbj6gNQgSD9kPAt4Qb70JscPPp4NsTKbErJpzRnc+2cA36RyQW/j6MUu8ZRFRGf2P664D2NkxY
	1fxrsr0ic7X8kZ9S2V7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6Ai-0000000CzWJ-0bp6;
	Mon, 01 Sep 2025 15:10:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3fS-0000000CTMM-0RyN
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 12:29:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DD78B1A0A08;
	Mon,  1 Sep 2025 12:29:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B621D60699;
	Mon,  1 Sep 2025 12:29:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18ACA1C22D9EE;
	Mon,  1 Sep 2025 14:29:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729788; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AeYpbZsIhquiBEK6QCKGdwjwjeTwyh8ByoAGh5hJubI=;
	b=PW81rS0WzD+5BJ0VnKdYe8F8pIYWRTh83LgCyLKNt95t6VjLnVsTV/TqcrvMvpgmSaexrN
	BvABRkonhVBLBqwLYN1dMF4fcQVel1iGO6hZq5qHZQYc+1WPLA2jHJ/L3wwEUkT0DDDbCj
	uvFewSL8k5lw7rsavw01OJr+ajqfrCaCmuRbvhcPFx8EGj2JzXXA6gLu4N4HH4RF/E0vFP
	CMj1X5oThuOZpFG7v/1v6L1ELK3zG26Fop47uBTxAx1e8Szc8Ox1KA6jVZCJ5o2I5G9UsY
	FdVOd9TWgbUOA+RSicC2NZlGVkxpYPBVqEqqX4SCagbHDfbRlrKQYK5hUPkubg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 WangYuli <wangyuli@uniontech.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <20250812035856.501130-1-rongqianfeng@vivo.com>
References: <20250812035856.501130-1-rongqianfeng@vivo.com>
Subject: Re: [PATCH] mtd: use vmalloc_array and vcalloc to simplify code
Message-Id: <175672978602.48892.293348155362794718.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:29:46 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052950_288023_7FA469B2 
X-CRM114-Status: UNSURE (   6.70  )
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

T24gVHVlLCAxMiBBdWcgMjAyNSAxMTo1ODo1MyArMDgwMCwgUWlhbmZlbmcgUm9uZyB3cm90ZToK
PiBSZW1vdmUgYXJyYXlfc2l6ZSgpIGNhbGxzIGFuZCByZXBsYWNlIHZtYWxsb2MoYXJyYXlfc2l6
ZSgpKSB3aXRoCj4gdm1hbGxvY19hcnJheSgpIGFuZCB2emFsbG9jKGFycmF5X3NpemUoKSkgd2l0
aCB2Y2FsbG9jKCkgdG8gc2ltcGxpZnkKPiB0aGUgY29kZS4KPiAKPiBDb21waWxlLXRlc3RlZCBv
bmx5Lgo+IAo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBt
dGQ6IHVzZSB2bWFsbG9jX2FycmF5IGFuZCB2Y2FsbG9jIHRvIHNpbXBsaWZ5IGNvZGUKICAgICAg
Y29tbWl0OiA4NDkwOGNiMGQ0NmE1NzRhNDA0YmVlYTVhYzg5OWVkOTQ5ZWY0ZTgxCgpQYXRjaGUo
cykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQg
b2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4p
LgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
