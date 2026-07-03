Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D6EC43602
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2026 13:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sLQjV8RL4VQMWoStSuoh9fvRzMOgzelHcLgSlMclleA=; b=CXMhHT8FsAXPRc
	q3R3XV+N9zNWYwAiJ9EyBLBm21fOG4sUL5q+R2UuZ0qm4rYyII/tukwmGXp/BD731M8pOhjbt3S8l
	xYI4TMZKeTt+gFF5ef46ov1Ax4VGBkSn6DGZrCd7FsWf/qMt6oWTScWcDbVYRtOyKMsx7BmHMY+CT
	MKnGSjYVMei2sJ7Ni7arlBeQTs7Ao2bkrXHSZuPn47/aZpFv5H0Yy/qHzmix+SY9P52aSucAhqRQY
	t+bqoM+7pji3qQIZo4hwu6g+mgkOGOYz902LvKcHdDe6BvoeH84+71F/NncGjR3/yGmok4vv/1KrF
	K5VBc45qZ4YBMuU0LIMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeGU-000000079gG-3zdo;
	Fri, 03 Jul 2026 13:49:10 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeGR-000000079cY-1oSV
	for linux-mtd@lists.infradead.org;
	Fri, 03 Jul 2026 13:49:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 796B71A0E1D;
	Fri,  3 Jul 2026 13:49:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E81260300;
	Fri,  3 Jul 2026 13:49:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A04A104C94BE;
	Fri,  3 Jul 2026 15:49:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783086543; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Rr2nTQuLNWBEVtJgF3uHq7e/KxQ6dw+Ob0bZrTPZ7mg=;
	b=w7sGsmmDDxQNsvJ91lA74UCrGWxG8xMn2w994ftG0B6kcd9qbrkEuoxKKV+yfRK5HiZoQD
	hqDgsGNRHqdGIwdlwd6LPNtZfcjPGUdR+SB9We0bjU0SwjXIZHUmxD/WPucoY2hIkXC/c3
	N9dCLucHotFNSn3JmCZlvHpqSW9c5PBYjH+Qptjgx/7E+Fbz4fuBJU1U8FVbrY2t9hQqjP
	UMUzoawyqINKIRzQkwHuktwv8xSYRtOCcODlL9G1jHj4uXImrCRGM0d9SPlpgqYEKBy0iO
	+PW1eTsNHJLusLD6UFJ/a0dWYvtSXAv9VEJOGMCDW0krWkdfZ8+zGtGpId+G2g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>, 
 Finn Thain <fthain@linux-m68k.org>, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260701053909.53859-1-pengpeng@iscas.ac.cn>
References: <20260701053909.53859-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] mtd: parsers: redboot: reject unterminated FIS names
Message-Id: <178308654123.836059.8194193110473243177.b4-ty@bootlin.com>
Date: Fri, 03 Jul 2026 15:49:01 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_064907_638349_274E7575 
X-CRM114-Status: UNSURE (   6.45  )
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

T24gV2VkLCAwMSBKdWwgMjAyNiAxMzozOTowOSArMDgwMCwgUGVuZ3BlbmcgSG91IHdyb3RlOgo+
IFJlZEJvb3QgRklTIHBhcnRpdGlvbiBuYW1lcyBhcmUgc3RvcmVkIGluIGEgZml4ZWQgMTYtYnl0
ZSBmaWVsZCB0aGF0IGlzCj4gZXhwZWN0ZWQgdG8gYmUgTlVMLXRlcm1pbmF0ZWQuIHBhcnNlX3Jl
ZGJvb3RfcGFydGl0aW9ucygpIHVzZWQgc3RybGVuKCkKPiB0byBzaXplIHRoZSBuYW1lcyBhcmVh
IGFuZCBsYXRlciBjb3BpZWQgdGhlIHNhbWUgZmllbGQgd2l0aCBzdHJjcHkoKSwgc28KPiBhIG1h
bGZvcm1lZCB0YWJsZSBlbnRyeSB3aXRob3V0IGEgdGVybWluYXRvciBjb3VsZCBtYWtlIGJvdGgg
b3BlcmF0aW9ucwo+IHJlYWQgYmV5b25kIHRoZSBkZXNjcmlwdG9yLgo+IAo+IFZhbGlkYXRlIGVh
Y2ggYWNjZXB0ZWQgRklTIG5hbWUgd2l0aCBzdHJubGVuKCkgYmVmb3JlIGFkZGluZyBpdCB0byB0
aGUKPiBwYXJ0aXRpb24gbGlzdC4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRo
YW5rcyEKClsxLzFdIG10ZDogcGFyc2VyczogcmVkYm9vdDogcmVqZWN0IHVudGVybWluYXRlZCBG
SVMgbmFtZXMKICAgICAgY29tbWl0OiBhZGZjMjc1YjMxN2MwMmNkMDQzYjBjZjI4YjhjZmI3NDU5
YjA0MWYwCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFu
ZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29t
cGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
