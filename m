Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C203C98324
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4QVmFP1WTG83HjcpjW9TtNrH/FuYE2OnQ+X6IYN4olU=; b=Hw1h+pZxwyKGIh
	CEoZrnLxykkshIy9fLu/1cs63BXe1xxb7mE/oUt4OOPViieXh91eE363tU+z6BwiU0YHn6Wv8HpAn
	OIEDIqkikyDk8HV5GV9Ow3AFFPge48N4yHtvSryGM7JBM+V34OPljpuAikYJ+sTJU52DruTeV7AvX
	NfEWwACF14P+A9tgvzaqeQvOXgibnldlTm/YBLo9dsVsrOXjKuHnH1+sKnmB7HC8eG9Yz7QabEH7B
	lnvnGumPGHvisaItQ2O98vjLCSrrZ4L0s8+0ZB16+FkvnDVvNlnfB01a1HxwvfuI3A+JIOQu9dW2f
	oYNTmxhXSHv+6HtnSzDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA65d-0000000DSCg-41et;
	Fri, 25 Sep 2026 13:35:49 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA65Y-0000000DS9b-0HL1
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 13:35:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 93EC71A1019
	for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2026 13:35:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 683CC6073B;
	Fri, 25 Sep 2026 13:35:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A18410328BBC;
	Fri, 25 Sep 2026 15:35:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790343341; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RIgFQa3K9BMUyYdYoij1l3EaF6VOi89oVBTPQ0Z1Exk=;
	b=EivssIu2EVRljDYUooK3tmHhzq4bDIYJz91uO1olWpEsh5oE7xKQIox/we/vSRNKJFc6Rj
	rpkrwOWwLvRbrIhjfjDgcUFWQGs2hPRMnZikIhlZNwatfQgOOmMJoj1VkVYXKOENpjgCvk
	k5vRMckHWgnHC6z/O4nn8x2oSgotWlwabMifmZf9vAc7/6X+2vY6kz+sh7rgwM/GJHfN+U
	abbG5zT1gXlVxXxc4hsK3yN+duVZGs4n9N68fXh1CBQJ8VJCBSOSUv7sSkk3a+6mvSegtW
	1W6SQV3Y4PDYw+8bK9ldb/4kBsS0w0VYXbtifXRzNqNColsLpl0psTbLPdJlOg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20260923-mtd-nand-new-chip-support-v2-1-f8bfc5754620@analog.com>
References: <20260923-mtd-nand-new-chip-support-v2-1-f8bfc5754620@analog.com>
Subject: Re: [PATCH RESEND v2] mtd: spinand: winbond: Add support for
 W25N08LW
Message-Id: <179034334048.1124555.11337705616716481308.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 15:35:40 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_063544_250113_38BBB5A0 
X-CRM114-Status: UNSURE (   8.52  )
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

T24gV2VkLCAyMyBTZXAgMjAyNiAxNDo1MjoyOSArMDEwMCwgTnVubyBTw6Egd3JvdGU6Cj4gQWRk
IHN1cHBvcnQgZm9yIHRoZSBXMjVOMDhMVywgYSAxLjhWIDhHYml0IFNQSS1OQU5EIG1hZGUgb2Yg
dHdvCj4gNEdiaXQgTFVOcywgd2l0aCA0MDk2LWJ5dGUgcGFnZXMgYW5kIDI1NiBieXRlcyBvZiBz
cGFyZSBhcmVhLgo+IAo+IFRoZSBjaGlwIHJldXNlcyB0aGUgS1YgRUNDIHN0YXR1cyBoZWxwZXIs
IGJ1dCBuZWVkcyBpdHMgb3duIE9PQgo+IGxheW91dCBiZWNhdXNlIHRoZSBnZW9tZXRyeSBvZiBp
dHMgc3BhcmUgYXJlYSBkaWZmZXJzIGZyb20gdGhlCj4gZXhpc3RpbmcgV2luYm9uZCBwYXJ0cy4g
T25seSBoYWxmIG9mIGl0IGlzIHZpc2libGUgd2hpbGUgdGhlCj4gaW50ZXJuYWwgRUNDIGlzIGVu
YWJsZWQsIHNvIHRoZSBFQ0MgcmVnaW9uIGlzIHJlcG9ydGVkIGFzCj4gaW5hY2Nlc3NpYmxlIGFu
ZCBqdXN0IHRoZSBmcmVlIGJ5dGVzIGFyZSBleHBvc2VkLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRv
IG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiBzcGluYW5kOiB3aW5ib25kOiBBZGQgc3Vw
cG9ydCBmb3IgVzI1TjA4TFcKICAgICAgY29tbWl0OiAwMTk0N2VjYzM3YmRlYWQ3ZDJlMWYxOTkx
ODViOTM2ODIwYjkwZWRhCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGlu
dXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8g
cm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
