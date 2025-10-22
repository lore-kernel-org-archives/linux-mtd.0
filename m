Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454FBCCD1AB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 09:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5AviEvUVPle5BUxnbWFsFdbDoRvCx/+BH/niB6E8vwo=; b=Kvv7UCQ76l2/by
	JY0cZlKZmIJ/r1hpYsLqGhDJhMeNdJexuXNfnW9r0krqsdG3A/zGjYENNlr7Tx3K0bJaqDGxpXMsC
	xzhmKnZijKfovZqmfGN6gk6mVZh8+0LOsTJuPSHsjIIjzV22wULiT6ci1CGusn1Rlqhs3B5fvT/1V
	lNx+JwhKR83dSeH7drq2QJGUw4OFpfDjUIQXyU5IRy3WCtBBvLJz14Im4pCfXyqV6vnadydjJgiX6
	vWSEDLL4TJWZPX1t3vW0DdN3meqaxFuiIM5K2ApPvMT8XyNUaakNej+62qPNa6GcjxuGdUQYuiXOQ
	OY09AbaS2D4K8K1ZC1rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVac-00000002LK9-3Qm8;
	Wed, 22 Oct 2025 09:57:06 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVaW-00000002LGF-2Dp6
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 09:57:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1AE394E41271;
	Wed, 22 Oct 2025 09:56:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4AF7606DC;
	Wed, 22 Oct 2025 09:56:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D35D102F242A;
	Wed, 22 Oct 2025 11:56:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761127018; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dyDM/lHlh9+h2cDK+opXbELVb8qGok73uNfmtfylgmA=;
	b=lOwRt36u0feYh+E2/gQGjNed5H2r2LrOJN6oUo7PyJilelbyInUX7vC3wmr5iwcIB/ZUhp
	0y7Lo9Iv8QJkzO93J8EU7cN3FzEq9HNNbB1okb+VZT9EnZm6zb/RtVYaecTXCRppC+jJTp
	03lTENOGx8qAdQpgpvhNMmeEyx7XavgUdLQdYI8guNK37rdK96kBhLy+dwjGBR1Tz5fa9p
	r7xn6MXwhCt9C4diJ8y7lZXQZUJBkMZp1CAGwPshwmhoMPb5oV0AycEAs0fmjwa6CvTWYQ
	XJbhw0EsdMzDjNrF34v40+SLW0BaYVgFX+seqbUE9U5liczZEvM0veld1cyTDw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Markus Stockhausen <markus.stockhausen@gmx.de>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <5109cd228940c246d2e1ef4ff01799315601c285.1759916792.git.geert@linux-m68k.org>
References: <5109cd228940c246d2e1ef4ff01799315601c285.1759916792.git.geert@linux-m68k.org>
Subject: Re: [PATCH] mtd: nand: MTD_NAND_ECC_REALTEK should depend on
 HAS_DMA
Message-Id: <176112701735.140484.10535546133170470087.b4-ty@bootlin.com>
Date: Wed, 22 Oct 2025 11:56:57 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_025700_734471_1E7970E9 
X-CRM114-Status: UNSURE (   6.61  )
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

T24gV2VkLCAwOCBPY3QgMjAyNSAxMTo0NzoxNSArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdy
b3RlOgo+IElmIENPTkZJR19OT19ETUE9eToKPiAKPiAgICAgRVJST1I6IG1vZHBvc3Q6ICJkbWFf
ZnJlZV9wYWdlcyIgW2RyaXZlcnMvbXRkL25hbmQvZWNjLXJlYWx0ZWsua29dIHVuZGVmaW5lZCEK
PiAgICAgRVJST1I6IG1vZHBvc3Q6ICJkbWFfYWxsb2NfcGFnZXMiIFtkcml2ZXJzL210ZC9uYW5k
L2VjYy1yZWFsdGVrLmtvXSB1bmRlZmluZWQhCj4gCj4gVGhlIGRyaXZlciBjYW5ub3QgZnVuY3Rp
b24gd2l0aG91dCBETUEsIGhlbmNlIGZpeCB0aGlzIGJ5IGFkZGluZyBhCj4gZGVwZW5kZW5jeSBv
biBIQVNfRE1BLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoKWzEv
MV0gbXRkOiBuYW5kOiBNVERfTkFORF9FQ0NfUkVBTFRFSyBzaG91bGQgZGVwZW5kIG9uIEhBU19E
TUEKICAgICAgY29tbWl0OiAwZDljODBhYTU3MjE4MmQ0YjE0NjQ4MjZjZDc3YWE4OTczMjEzMjE2
CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxs
IGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5z
IGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
