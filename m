Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A415C43602
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 14:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n08CQ4qvrqIXIkxlBHvqCUFZnDbA99RhPRDOJUycyxY=; b=Eeug/I62s0Abd+
	gsSgcHE6jdIEpLZM84y/V6JlxmYlCwmDxqndeWP+cjS5RzEBWbakHxFKw0ZY9XSpYbYIEcziH0AlP
	h2udHkwfMb1PvQ2drTzSF+HkF1cCdsCe7XjP3wMug+a0QliNGskS1KY908MnC2jl9TpYwCwuCxBRp
	794jwbitgyI1Zs44c7zFyrUk7nIdg9yo+gSyPM9NOBel0TP8VLmzGyyf8gpcsbI8dNpHEY2/Vk0YW
	dNH0PkhRPKS7GTaFHa+3UmJVD2t10/BuUiJ2tdSGb/Kn9TkWNLVp/i1B3BK5cT7m5OMaRHP7WFhrK
	0VrZBGmpbW1f4NVlhGtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDDh-0000000Ev2M-2qeE;
	Mon, 29 Jun 2026 14:44:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDDe-0000000EuyP-2QxG
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 14:44:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 20E5A4E407B2
	for <linux-mtd@lists.infradead.org>; Mon, 29 Jun 2026 14:44:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EACBA5FF96;
	Mon, 29 Jun 2026 14:44:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9D4A106F17BD;
	Mon, 29 Jun 2026 16:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782744256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=C7FmotKDjnl37krpFZ9TC3fGqXfs/kp9xs2O49cdpyQ=;
	b=VHxd+yx7WLTn21Snmpdl6bWvwm7vliVxx9gmjCLAuMpK7sKnZzvwezBQHPZtOCsLP/e8zp
	THrbxUcdrFpUdhnTLoez+CaWaHRi0eI2858SPqHk97PezhYzz6moGsIaGwFpm6SsuziaK9
	x7ZlnFcezReMU95fn2BKYMRnDDJj2RDgnOsbWw0sWFQKnVYMQ5sGgWZYTNco3cFT6ICAGL
	gDxd6IeCnHzQL2bwOAmxXqp0rPpZ9jrA2qwzbN+o96arzWtWjA+OD7vf8JGwa+810MwhsO
	O804zFIY9F1HDBFkmcdwVuSygoUQqP5md7y11ZVpxqsJcuUJEhIOkK1AdHcXIA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, 
 Deepanshu Kartikey <kartikey406@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 syzbot+3ae80219c633aca5431c@syzkaller.appspotmail.com
In-Reply-To: <20260620225625.45243-1-kartikey406@gmail.com>
References: <20260620225625.45243-1-kartikey406@gmail.com>
Subject: Re: [PATCH] mtd: mtdpart: validate partition bounds in
 mtd_add_partition()
Message-Id: <178274425566.260178.12137869983888783826.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:44:15 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_074418_759409_F635BDD0 
X-CRM114-Status: UNSURE (   5.55  )
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

T24gU3VuLCAyMSBKdW4gMjAyNiAwNDoyNjoyNSArMDUzMCwgRGVlcGFuc2h1IEthcnRpa2V5IHdy
b3RlOgo+IG10ZF9hZGRfcGFydGl0aW9uKCkgY2hlY2tzIHRoYXQgJ2xlbmd0aCcgaXMgcG9zaXRp
dmUgYnV0IGRvZXMgbm90Cj4gdmFsaWRhdGUgdGhhdCAnb2Zmc2V0ICsgbGVuZ3RoJyBmaXRzIHdp
dGhpbiB0aGUgcGFyZW50IHBhcnRpdGlvbidzCj4gc2l6ZS4gQSB1c2Vyc3BhY2UgY2FsbGVyIHVz
aW5nIHRoZSBCTEtQR19BRERfUEFSVElUSU9OIGlvY3RsIGNhbgo+IHN1cHBseSBhIGNyYWZ0ZWQg
bGFyZ2UgJ2xlbmd0aCcgdmFsdWUgdGhhdCBwYXNzZXMgdGhlIGxlbmd0aCA8PSAwCj4gY2hlY2ss
IGNhdXNpbmcgYWRkX210ZF9kZXZpY2UoKSB0byBmaXJlIGEgV0FSTl9PTigpIHdoZW4gaXQgZGV0
ZWN0cwo+IHRoZSBvdmVyc2l6ZWQgcGFydGl0aW9uLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10
ZC9maXhlcywgdGhhbmtzIQoKWzEvMV0gbXRkOiBtdGRwYXJ0OiB2YWxpZGF0ZSBwYXJ0aXRpb24g
Ym91bmRzIGluIG10ZF9hZGRfcGFydGl0aW9uKCkKICAgICAgY29tbWl0OiBhNzRlMzFkMGEyZDUy
YzY1ZDlhNjY0N2M4N2I1NGJmNzhjMGQ5MzE3CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJs
ZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3Zp
ZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1
w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
