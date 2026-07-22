Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768BFC44536
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2026 12:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ws3OS3TSvy9Cmth/lZdunuyW3RIgBtx/AIW/XPnLuA=; b=TypUCUP4bUBRll
	mMa2tR9UcD3HVtv4ssoo10gI0Bv5TsuWTLk4GF338yeygmQpmwWhT/CNfkawjqfeqADMd50arMNdc
	BZDCtk4/vmanZEULCtTPr3Tuv4knaPM79cp3SM6khsex8sbdLuMLi4GTp8MNxf1kH2tLqCL7yNrVl
	tga+FFgsuqrNv7S5NGolrboe2QV4KaHgiUKgOaCQRWt4Cx5vjscR7V7i1cUWm1Vpd5C2BfU4pRn3h
	uTAFuTBNOsA/JN1floGmppXxw7oTztKxhzJPUy3jdoZR1KUJteQ44j49mmHuqKWAU++4fazNbmi0x
	1qj5z+Ib5gbihFcXHb9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWR1-0000000BnmD-2bQB;
	Wed, 22 Jul 2026 12:52:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWQy-0000000Bnla-3Jqd
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jul 2026 12:52:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0B3244E40ECB;
	Wed, 22 Jul 2026 12:52:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBAC060388;
	Wed, 22 Jul 2026 12:52:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 557F511BD3B59;
	Wed, 22 Jul 2026 14:52:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784724742; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0XjFcLO5Yc/PWL7+KiVD7lYWWnqAxmMK/+0WiaRitms=;
	b=2xfWsUtvvIqIZUHVu4xH+Uwi6NTLqPIy5tvzmkTiKqL3D8x+NASL2EtkFBz9MXkh8Hk0BR
	jgxagqMsr8+vqXubCapKTXrYaBsqyDp+lmyqtrBN7N6c9JQa7NLq3V+vIZi43gzyrT3klr
	XeI+v4BXyKyLt4zEbL3Nvj9AvbobBqVIbxlAPBlwB2VebdKf2nNYUKeqQVQmiG63OItL+6
	tJxxO5cwNziuChTzJlAA69VSAmGPu8je4pvbATOvavTGiQ5HKmVXcmooPOp9a1nIatICJW
	ha5qFnEDY47BAnz2hKjo3+6c20OuVUa1qPwCCl0J781Rsj2vbqJijW37NmbeWQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 02/30] mtd: spi-nor: winbond: Normalize names
In-Reply-To: <DJRJH8H54BBB.9ZNM5OJBFG47@kernel.org> (Michael Walle's message
	of "Mon, 06 Jul 2026 15:57:10 +0200")
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
	<20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-2-87e5d3122244@bootlin.com>
	<DJRJH8H54BBB.9ZNM5OJBFG47@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Jul 2026 14:52:19 +0200
Message-ID: <878q73jif0.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_055224_974989_1A51529E 
X-CRM114-Status: UNSURE (   9.00  )
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

SGVsbG8gTWljaGFlbCwKCj4+IEFzIGEgcmVzdWx0LCBXMjVRMDFOV3h4SVEgaXMgaXJyZWxldmFu
dCBhbmQgd291bGQgYmV0dGVyIGJlIG5hbWVkCj4+IFcyNVEwMU5XLVEsIFcyNVEwMkpWIGlzIGly
cmVsZXZhbnQgYW5kIHdvdWxkIGJldHRlciBiZSBuYW1lZCBXMjVRMDJKVi1NLAo+PiBldGMuCj4K
PiBPVE9IIGlmIHlvdSB0cnkgdG8gc2VhcmNoIGZvciB0aGF0IG5hbWUgb24gdGhlIGludGVybmV0
L2RhdGFzaGVldHMKPiB5b3UgZG9uJ3QgZmluZCBhbnl0aGluZywgd2hpbGUgdGhlIHh4IHNvbWVo
b3cgaW5kaWNhdGVzIHRoYXQKPiBzb21ldGhpbmcgaXMgbWlzc2luZyBoZXJlLgoKVGhlIGRhdGFz
aGVldCBpcyBvZnRlbiB0aGUgc2FtZSBmb3IgTi9RL00gdmFyaWFudHMsIGEgdGFibGUgY2xvc2Ug
dG8gdGhlCmVuZCBtZW50aW9ucyB0aGUgZGlmZmVyZW5jZXMuIFRoZSBpbnRlcm1lZGlhdGUgbGV0
dGVycyBoYXZlIG5vIHVzZWZ1bAptZWFuaW5nIGZvciB1cyBhbmQgSUlSQyB0aGV5IG51bWJlciBt
YXkgdmFyeS4gVGhlIG1lYW5naW5nIGlzOgoKICAgICAgICAtIFc6IFdpbmJvbmQKICAgICAgICAt
IDI1UTogU1BJIE5PUiBmYW1pbHkKICAgICAgICAtIDAySjogRGVuc2l0eQogICAgICAgIC0gVjog
Vm9sdGFnZSBsZXZlbAogICAgICAgIC0gVXNlbGVzcyBpbmZvcm1hdGlvbiBmb3Igc29mdHdhcmUg
c3VwcG9ydCBzdWNoIGFzIHRoZSBwYWNrYWdlCiAgICAgICAgICBzaXplIG9yIHNvbWUgcmF0aW5n
cyB3aGljaCBoYXZlIG5vIGltcGFjdCBvbiB0aGUgc29mdHdhcmUsIHRoZQogICAgICAgICAgYWJz
ZW5jZSBvZiBsZWFkLCBldGMuCiAgICAgICAgLSBBbmQgdGhlbiB0aGVyZSBhcmUgc3VidGxldGll
cyBzdWNoIGFzIGZlYXR1cmVzIGF2YWlsYWJsZSBvcgogICAgICAgICAgbm90LCBlbmFibGVkIGJ5
IGRlZmF1bHQgb3Igbm90LCB3aGljaCBjYW4gYmUgZGlzYWJsZWQgb3Igbm90LAogICAgICAgICAg
dGhhdCBpcyBjYXJyaWVkIGJ5IHRoZSBsYXN0IGxldHRlci4KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
