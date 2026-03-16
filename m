Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BC4F53D6F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 16:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OkWYUSnNWYwHie68g3HnwZoFxsaOwEv/wy3vcXJqsA8=; b=UCHSUF5KL42EJ2
	M+Cn3szYQX1loYo8a1llPP4qKHsg2+/KM41fQZJAPvNDK/6w4FFIyV/+HC9UtWT5GA8+lQkveH7NM
	aM2BUqqi8sf1d1VnUZ/s2wXp24t5PY+IbZR+N1VobbZRDvzdGgBTFitaVzJOP92javQnzDzZ+mSg1
	fyNw7Y60LN6v0KJMRBefYLOBMm8+91XKrcaDt8POu1uqHSxB9kVlOxJyVQI7IAD5pV+bNPwjLmzVF
	ByBWFcsKNA0oLBVJPifgW1KXpbrWN937959HnFIBDquUziUnNJBuEyF87ubZjGqeAlMivz4JuZlGG
	MrmJ2bbDq+j1Gf3GSOow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ajh-00000004RtR-34Ml;
	Mon, 16 Mar 2026 16:24:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ajg-00000004RtA-2Koh
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Mar 2026 16:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=lvaVqaYlK3zNr558loCdHm73KHYnHroVUEK/O2NKRBw=; b=hnIRLJKhJPbKb16smkREdQCCzI
	GUh6vN/SAqTLdKR9yXyf4+6dwHu5c2Ir+dNkrGESXu/K5Obqzsbz++7TGze5G88DA8GxvRuK0kaKL
	aucfTyH2tgKSikyJ9JrpSZPSGHGWf/1YxqbhuEFgkzPNsG/52xcdKT7YtD6YSjG+tnQHL7GzXVkGW
	jU6D1AVspi/hg8nJWOwnIM9fETeWyadGQRGkbWM5JsuWOZZnSAe1xGAVfCp4YaJ5lx4OCc+jhS++m
	NtOfoD/1rIU0vU97MolaxLB2/MxuZGHUUt1i6BC0tlxwlHX34I0trr0X44utY63b5dJiTSUi61plH
	j7otVU2w==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ajd-00000001FnB-21Pt
	for linux-mtd@lists.infradead.org;
	Mon, 16 Mar 2026 16:24:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F0C52C55049;
	Mon, 16 Mar 2026 16:24:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 54CB65FC4A;
	Mon, 16 Mar 2026 16:23:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D644410372204;
	Mon, 16 Mar 2026 17:23:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773678238; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lvaVqaYlK3zNr558loCdHm73KHYnHroVUEK/O2NKRBw=;
	b=MIJV+NT9bSKIHcON0meqXwer8FeCy0LO56DxveUXXze60MwQVlhiAjivarSV4iB6rgZRRR
	Rdmy6YejCpGBRx2XSBKs4fD5XefCH0TajsaldcDrA50EY8OYnhTryutRnbe0AexzYykoUx
	SzWzgVpi9vlnzeNIr5wOslxLs62ELmIKKkWMcs7ynJ1qWCX0Gnn2abR9JfJvzHNAIXEuIE
	4t9fSREruK5D9vmWg7lBaYNw6If0/Toh5NyHpchfnSwR3kSQooqiCy0J3IglvGp+8KLKRH
	N+TyRL01t2eJHpicOG/AeUn36m+zk03lm/utUK238ixtRsJpbm4/SCZhkgP2Pw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linusw@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, kernel test robot <lkp@intel.com>, 
 Mark Brown <broonie@kernel.org>
In-Reply-To: <20260313113409.1151020-1-andriy.shevchenko@linux.intel.com>
References: <20260313113409.1151020-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] mtd: physmap: Drop leftovers of removed code
 for Baikal SoC
Message-Id: <177367823345.141937.12272933599451902691.b4-ty@bootlin.com>
Date: Mon, 16 Mar 2026 17:23:53 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_162405_560552_7688A781 
X-CRM114-Status: UNSURE (   6.34  )
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

T24gRnJpLCAxMyBNYXIgMjAyNiAxMjozNDowOSArMDEwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3Rl
Ogo+IFRoZSBwcmV2aW91cyBjbGVhbiB1cCBraWxsZWQgdGhlIGRyaXZlciBhbG9uZyB3aXRoIGRy
b3BwaW5nIHNvbWUgY2FsbHMKPiBidXQgbWlzc2VkIG9uZSBwbGFjZSB0byBkcm9wLiBEbyBpdCBo
ZXJlLgo+IAo+IAoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiBwaHlz
bWFwOiBEcm9wIGxlZnRvdmVycyBvZiByZW1vdmVkIGNvZGUgZm9yIEJhaWthbCBTb0MKICAgICAg
Y29tbWl0OiA1NGY5NTViYTA5MzY3ZWI5YWJhZDZjNGFmZDNiYjgxYzJiN2UwYjU0CgpQYXRjaGUo
cykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQg
b2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4p
LgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
