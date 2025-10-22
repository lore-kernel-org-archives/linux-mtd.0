Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C34CCD1AB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 09:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HftPX+bJXpRHE5W0a8WUm/4vo1USUwhISuYJoO5XReQ=; b=rXKwvLJrFO9Bsy
	SUde+rcg/RNeaG46xrSrinKEtHyQXA+wWKjMY0AYmATzg0cLTqR2bT211TosnlqaZ4PXLk5VemVKC
	KWBriLmSxNQqRT++PrW4UCRdwRwEhc7lNPp8qdEMqJQ8qsMryho4+LhJLDSv5DW4+SYa9VAa1sOcm
	lds4lamfQbZBR4G/fujKUYgpsxRA92pSC5s01GdiSvrwyb6sLUXM9VLEltDciCxubdD8OPcrJ7AVm
	ZhFGsoRDvdmq/dxGZ8tPvR/MOT5FU/GmAW+tkL/LVWfZJ8qiPvGRdsvVaH6qnMStAWgU29LFVkuzo
	bARCYucYtc05eSz0ok9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVaW-00000002LGk-1mJL;
	Wed, 22 Oct 2025 09:57:00 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVaQ-00000002LFL-1HQH
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 09:56:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AD1AD1A15CE;
	Wed, 22 Oct 2025 09:56:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 81543606DC;
	Wed, 22 Oct 2025 09:56:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD497102F242A;
	Wed, 22 Oct 2025 11:56:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761127011; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PtUVlEJ95DFrLMp1kRswERQY+ixJI6wZGrq1K1yw3ck=;
	b=EClQ6rS26/rnP/zhUZKi0h9SDoA5ZzfeiYjG2Umwvn3r2OlW98nK5bomlonaRmsXwAJOEE
	fV8TjWbPOuc2wvZlJjqZ5ZlK7a8Y8LCI+SHCRjB/Tu+6hdPD1ozA2C1t4ZS5U6bb9dQDJF
	6RUG0vSc6rp2JaZQC2pqrXLIjaBG0t9SSDaI89F3YxNZ1DPl0vKmZPGu7jaK+L15O/Epeh
	2FXFzStLOhs43muKwx3rg1u5A2clefITADHkb3XmdFlsaXqn4Puif2LjiXQCobAm8Ey8gE
	dP+LRRR7aBGunuiUKETHmqDvjtwC2Zu71daYnppwJ+vPwTe52p3Cm+o/l9Tzpg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <aNvN4kfJ2ROB353Q@stanley.mountain>
References: <aNvN4kfJ2ROB353Q@stanley.mountain>
Subject: Re: [PATCH v2 resend] mtdchar: fix integer overflow in read/write
 ioctls
Message-Id: <176112699838.140484.7478020068192325576.b4-ty@bootlin.com>
Date: Wed, 22 Oct 2025 11:56:38 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_025655_274951_62B675C0 
X-CRM114-Status: UNSURE (   7.51  )
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

T24gVHVlLCAzMCBTZXAgMjAyNSAxNTozMjozNCArMDMwMCwgRGFuIENhcnBlbnRlciB3cm90ZToK
PiBUaGUgInJlcS5zdGFydCIgYW5kICJyZXEubGVuIiB2YXJpYWJsZXMgYXJlIHU2NCB2YWx1ZXMg
dGhhdCBjb21lIGZyb20gdGhlCj4gdXNlciBhdCB0aGUgc3RhcnQgb2YgdGhlIGZ1bmN0aW9uLiAg
V2UgbWFzayBhd2F5IHRoZSBoaWdoIDMyIGJpdHMgb2YKPiAicmVxLmxlbiIgc28gdGhhdCdzIGNh
cHBlZCBhdCBVMzJfTUFYIGJ1dCB0aGUgInJlcS5zdGFydCIgdmFyaWFibGUgY2FuIGdvCj4gdXAg
dG8gVTY0X01BWCB3aGljaCBtZWFucyB0aGF0IHRoZSBhZGRpdGlvbiBjYW4gc3RpbGwgaW50ZWdl
ciBvdmVyZmxvdy4KPiAKPiBVc2UgY2hlY2tfYWRkX292ZXJmbG93KCkgdG8gZml4IHRoaXMgYnVn
Lgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoKWzEvMV0gbXRkY2hh
cjogZml4IGludGVnZXIgb3ZlcmZsb3cgaW4gcmVhZC93cml0ZSBpb2N0bHMKICAgICAgY29tbWl0
OiBlNDE4NWJlZDczOGRhNzU1YjE5MWFhM2YyZTE2ZThiNDg0NTBlMWI4CgpQYXRjaGUocykgc2hv
dWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhl
IG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2lu
ZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
