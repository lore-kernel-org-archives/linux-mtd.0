Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FB3CCF9F8
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Nov 2025 10:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HTxnAzHMqeIOuX8WIBMIHHSxr4b05rcOihKjufmvEWk=; b=vLb3/lpqBEpyhB
	5/JJlGaByi3dDIbreDYfpZyWPhVg99yfkr5y9C1uTPk7dTe+JJMO5x23XO+WYkCrRKkm1VPRwmmMA
	CQBAa8U6E29g7SXCfeGfNB5FS+NpjJZryU/uBRODpEHF4XjyafYMfB3xkEdLrK4fXwnqUyh7O8VI+
	Fbxtrj0n0TIvSItUYiFM+W7+AEukBJmsNtfD6CP3LYhhlU0HhGJ6qtOqHDj+mh6qEFuZEgTzj7uZ+
	jWb6I5rrGTfrS4Oovkbz9hgDdVRIF7qMoDI7rIBlGX5TvODfJ7xCjLnTfOqOXLL99mEol+6M22nXC
	l7ZPiHqfbXU7qk1qcRew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs2b-00000009eaR-1MZe;
	Mon, 03 Nov 2025 10:44:01 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs2Y-00000009eZp-1rDe
	for linux-mtd@lists.infradead.org;
	Mon, 03 Nov 2025 10:43:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EA132C0D7A8;
	Mon,  3 Nov 2025 10:43:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8D39B60628;
	Mon,  3 Nov 2025 10:43:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F7AB10B50003;
	Mon,  3 Nov 2025 11:43:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762166635; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vIHKi4Zn2T0wcQp28mHyoJxRO/S2syht65h8AwmUtxs=;
	b=PHZ4M4zFXw354dDzIifG05ygoxXArB4D494J2+nZbJiCnEX0X9GixAlTxKdAqceVP6NMdw
	9siYgR/FMT+EU/fop+XL6ychisL8PXdOAo7qrE3LFXSqaDQ9B9rFa+RK5pWCHJhLYv+2Xt
	XjT77E0ez42kyXMujTbncxqowlxDbyiY77f3AF9MsPAs7Xw/s8nNE/Q89MMCh34he3uG37
	M1bYFfrsTDwhv9iSASnxc1NukrsBqqWttgCv1JLRStQZdsiogt155YO+WDEht5D7GUFXrY
	1bY5hrQrA/Nt12/CJ3Wl2l9nbGOS6ponovjNqwbYlUIf8H4K9P0/X1vO8zGvOQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20251031054118.1402280-1-rdunlap@infradead.org>
References: <20251031054118.1402280-1-rdunlap@infradead.org>
Subject: Re: [PATCH] mtd: spear_smi: fix kernel-doc warnings
 <linux/mtd/spear_smi.h>
Message-Id: <176216663305.908867.6989807234811696368.b4-ty@bootlin.com>
Date: Mon, 03 Nov 2025 11:43:53 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_024358_633267_BE800F15 
X-CRM114-Status: UNSURE (   7.87  )
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

T24gVGh1LCAzMCBPY3QgMjAyNSAyMjo0MToxOCAtMDcwMCwgUmFuZHkgRHVubGFwIHdyb3RlOgo+
IENvcnJlY3QgbW9zdCBrZXJuZWwtZG9jIHdhcm5pbmdzIGluIGluY2x1ZGUvbGludXgvbXRkL3Nw
ZWFyX3NtaS5oCj4gYnkgYWRkaW5nIGEgbGVhZGluZyAnQCcgdG8gdGhlIGRlc2NyaXB0aW9uIG9m
IHN0cnVjdCBtZW1iZXJzLgo+IEFkZCBhIG5ldyBkZXNjcmlwdGlvbiBmb3IgdGhlIG1pc3Npbmcg
QG5wIG1lbWJlci4KPiAKPiBXYXJuaW5nOiBzcGVhcl9zbWkuaDo0OCBzdHJ1Y3QgbWVtYmVyICdu
YW1lJyBub3QgZGVzY3JpYmVkCj4gIGluICdzcGVhcl9zbWlfZmxhc2hfaW5mbycKPiBXYXJuaW5n
OiBzcGVhcl9zbWkuaDo0OCBzdHJ1Y3QgbWVtYmVyICdtZW1fYmFzZScgbm90IGRlc2NyaWJlZAo+
ICBpbiAnc3BlYXJfc21pX2ZsYXNoX2luZm8nCj4gV2FybmluZzogc3BlYXJfc21pLmg6NDggc3Ry
dWN0IG1lbWJlciAnc2l6ZScgbm90IGRlc2NyaWJlZAo+ICBpbiAnc3BlYXJfc21pX2ZsYXNoX2lu
Zm8nCj4gV2FybmluZzogc3BlYXJfc21pLmg6NDggc3RydWN0IG1lbWJlciAncGFydGl0aW9ucycg
bm90IGRlc2NyaWJlZAo+ICBpbiAnc3BlYXJfc21pX2ZsYXNoX2luZm8nCj4gV2FybmluZzogc3Bl
YXJfc21pLmg6NDggc3RydWN0IG1lbWJlciAnbnJfcGFydGl0aW9ucycgbm90IGRlc2NyaWJlZAo+
ICBpbiAnc3BlYXJfc21pX2ZsYXNoX2luZm8nCj4gV2FybmluZzogc3BlYXJfc21pLmg6NDggc3Ry
dWN0IG1lbWJlciAnZmFzdF9tb2RlJyBub3QgZGVzY3JpYmVkCj4gIGluICdzcGVhcl9zbWlfZmxh
c2hfaW5mbycKPiBXYXJuaW5nOiBzcGVhcl9zbWkuaDo2MiBzdHJ1Y3QgbWVtYmVyICdjbGtfcmF0
ZScgbm90IGRlc2NyaWJlZAo+ICBpbiAnc3BlYXJfc21pX3BsYXRfZGF0YScKPiBXYXJuaW5nOiBz
cGVhcl9zbWkuaDo2MiBzdHJ1Y3QgbWVtYmVyICdudW1fZmxhc2hlcycgbm90IGRlc2NyaWJlZAo+
ICBpbiAnc3BlYXJfc21pX3BsYXRfZGF0YScKPiBXYXJuaW5nOiBzcGVhcl9zbWkuaDo2MiBzdHJ1
Y3QgbWVtYmVyICdib2FyZF9mbGFzaF9pbmZvJyBub3QgZGVzY3JpYmVkCj4gIGluICdzcGVhcl9z
bWlfcGxhdF9kYXRhJwo+IFdhcm5pbmc6IHNwZWFyX3NtaS5oOjYyIHN0cnVjdCBtZW1iZXIgJ25w
JyBub3QgZGVzY3JpYmVkCj4gIGluICdzcGVhcl9zbWlfcGxhdF9kYXRhJwo+IAo+IFsuLi5dCgpB
cHBsaWVkIHRvIG10ZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHNwZWFyX3NtaTogZml4IGtl
cm5lbC1kb2Mgd2FybmluZ3MgPGxpbnV4L210ZC9zcGVhcl9zbWkuaD4KICAgICAgY29tbWl0OiBj
OTVkZTczZGExMmJmNDU4NmI3YmNkNmIyM2E2OTY4YzIxOTkxY2M3CgpQYXRjaGUocykgc2hvdWxk
IGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5l
eHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCBy
ZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
