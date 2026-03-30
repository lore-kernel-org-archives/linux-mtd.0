Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E3FFF4959
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2026 08:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6hP8NdDPaxBwHotm+fKZTpK/+pL/gRSJrRXOtAoW1I=; b=xj0ZmbZhqRU+ag
	/mQ5bcLRJaZz6o4KZbI1AdcKoSiGqx32jw9CnJwZaav48+xLU7JA6tqoXEnGZHHRMPB8x9N5pJIY8
	CiBMH+oGvvtsDYvNB/hCx6Ox+zdIDTZ8Ub8yVeVuDKx3fE0n2tCBwzBi9bOhUt1mrlrI/i8H6RBKY
	Vh3b8g9rkyBbngmUaCMVeFUBoz00xw9XKi8CZIP3LfHG9mR9WbG4PvZ84skN7il1VAL5oCs+1iXdk
	gveX6HciqgdT02gUcdmiqIDLi/g78UmIh5p6ngwFaQiDejDuH5E/1dqH302Q6DbwEI2MknKgkog6F
	7vHeU5D9yztGiZ9waD8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77c8-0000000AoFM-017m;
	Mon, 30 Mar 2026 08:04:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77c1-0000000AoDA-3tSH
	for linux-mtd@lists.infradead.org;
	Mon, 30 Mar 2026 08:04:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D41151A3095;
	Mon, 30 Mar 2026 08:04:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A8E525FFA8;
	Mon, 30 Mar 2026 08:04:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC6F110451B68;
	Mon, 30 Mar 2026 10:04:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774857874; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e9yXhXYtA6S7FCEzYya4xIi0QVtCAmYf97xEC+a39pE=;
	b=BuLAqCs+HBjveDvPLCofBbG3aZy+a93jX/iMOoC574ORAOecwYhDZ09PuPx2PYleznVEuX
	F+SVcj/mvXpWnUqakXVfj+24ofCXLNpg87FiS2fkHDdD+N3uvb1Bn7M50LKueAwkimYCwo
	F/ebg/i4BGA104opCHdNPWw1/pDQjewsSbM95bsM5WAhx8lkUEI5YEXlVgKMOp3K7ZrEWc
	gVT/CrDIU/adbPBjqFewfx+8OGL8KnGZz9vUtT3JdgwqkiZbe7+ynqPhXmf/ozL6pj7INl
	VBJN8D7+dUhrOX1ksxOMMzZVABbl7TaBhcjPKVIQuxBi1Ov5yE84uCqiP9rQTA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,  Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,  Bartosz Golaszewski <brgl@kernel.org>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mips@vger.kernel.org,
  linux-input@vger.kernel.org,  linux-gpio@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] MIPS/mtd: Handle READY GPIO in generic NAND
 platform data
In-Reply-To: <20260328-mips-input-rb532-button-v1-2-98e201621501@kernel.org>
	(Linus Walleij's message of "Sat, 28 Mar 2026 16:55:48 +0100")
References: <20260328-mips-input-rb532-button-v1-0-98e201621501@kernel.org>
	<20260328-mips-input-rb532-button-v1-2-98e201621501@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 30 Mar 2026 10:04:30 +0200
Message-ID: <87a4vpbv5d.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_010442_451206_A6FD52DE 
X-CRM114-Status: GOOD (  12.65  )
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

T24gMjgvMDMvMjAyNiBhdCAxNjo1NTo0OCArMDEsIExpbnVzIFdhbGxlaWogPGxpbnVzd0BrZXJu
ZWwub3JnPiB3cm90ZToKCj4gVGhlIGNhbGxiYWNrcyBpbnRvIHRoZSBNSVBTIFJCNTMyIHBsYXRm
b3JtIHRvIHJlYWQgdGhlIEdQSU8gcGluCj4gaW5kaWNhdGluZyB0aGF0IHRoZSBOQU5EIGNoaXAg
aXMgcmVhZHkgYXJlIG9sZHNjaG9vbCBhbmQgZG9lcwo+IG5vdCBhc3NpZ24gR1BJT3MgYXMgcHJv
cGVydGllcyB0byB0aGUgTkFORCBkZXZpY2UuCj4KPiBBZGQgYSBjYXBhYmlsaXR5IHRvIHRoZSBn
ZW5lcmljIHBsYXRmb3JtIE5BTkQgY2hpcCBkcml2ZXIgdG8gdXNlCj4gYSBHUElPIGxpbmUgdG8g
ZGV0ZWN0IGlmIGEgTkFORCBjaGlwIGlzIHJlYWR5IGFuZCBvdmVycmlkZSB0aGUKPiBwbGF0Zm9y
bS1sb2NhbCBkcnZfcmVhZHkoKSBjYWxsYmFjayB3aXRoIHRoaXMgY2hlY2sgaWYgdGhlIEdQSU8K
PiBpcyBwcmVzZW50Lgo+Cj4gVGhpcyBtYWtlcyBpdCBwb3NzaWJsZSB0byBkcm9wIHRoZSBsZWdh
Y3kgaW5jbHVkZSBoZWFkZXIKPiA8bGludXgvZ3Bpby5oPiBmcm9tIHRoZSBSQjUzMiBkZXZpY2Vz
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+Cj4g
LS0tCj4gIGFyY2gvbWlwcy9yYjUzMi9kZXZpY2VzLmMgICAgICAgIHwgMzYgKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3BsYXRfbmFu
ZC5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKystCgpGaW5lIGJ5IG1lIGZvciB0aGUgTVRE
IGJpdHMhCgpBY2tlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNv
bT4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
