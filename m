Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BFAC54E58
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2024 11:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q3/oJnnff1VHotFy8FtK2uUS4aRhvxURvFOYRocT5nQ=; b=JsS+5PB48NQvkg
	N0GA9/eRIh47+Qyc+vBjfq2zM2W25OyltcMRtHC632yn5DLVgKpZc17YV52n/M53WxwrwfMZ9yfyB
	yZe4ohRjjK2Q2eyaZaHEvHKf8QwPmgxaPDQNPYweEqSQyeLfVryBVUeU18wI5qOVBzF12Ed7/1T5Z
	6Y64jg1iS+DCaX6lFnJpK0yQ/PFojoYQNyn5UrAy4qYM56wFfboY9bpkHtx3qU5UmAC0n08CpZ4h/
	0dLFX/IGWYU253dPIPu4LfTV0oKwDEWBgLsAwCjQDUC4cDtZFXj6KJixOmIPhaVANy6vQaL/JX0Bl
	k9XzQjVwnetvtIa6H7IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5ej-000000000y8-0lZA;
	Fri, 15 Mar 2024 11:23:21 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5eg-000000000xY-0teY
	for linux-mtd@lists.infradead.org;
	Fri, 15 Mar 2024 11:23:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE1931BF20A;
	Fri, 15 Mar 2024 11:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710501795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GeTP5bEePyOuvebkB0BuN2D/O1tfYQC98LPeBAAStZ0=;
	b=O8xB4puMENYwa+EjCH2boH1SitdEbL/XA/R5/ByNThfteRuIeh2MdiOGpcI9gtNJLWe0tF
	P9ucX5Yj9bCcU4wC3JHLxTtp7Dwa+8VJII8Wowj9RTzNIlAsSqCiKZaboNH4HoZtF7SuBB
	GrRDum97E0Y03NMyqdzln/E17SDUVVB23JvddCoB++VRkblV1Oxv9MVa4YA47+Hnvzwvds
	SYMTn4/Qxhe1TBnoOB+c/As8bWT+xjjL3JgrQNMbVDj7SSBPVMT+idAJ/ij1xjomXcLPy7
	1r2Gi/mgza/HFMm96WhwfxhdVJwujA0KrO0l8VXhrhRzNvHClGdTRZg75baoFg==
Date: Fri, 15 Mar 2024 12:23:14 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxim Korotkov <korotkov.maxim.s@gmail.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Hector Palacios
 <hector.palacios@digi.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] mtd: rawnand: hynix: fixed typo
Message-ID: <20240315122314.10c88c2e@xps-13>
In-Reply-To: <20240313102721.1991299-1-korotkov.maxim.s@gmail.com>
References: <20240313102721.1991299-1-korotkov.maxim.s@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_042318_418692_8ECF27E5 
X-CRM114-Status: GOOD (  10.09  )
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

SGkgTWF4aW0sCgprb3JvdGtvdi5tYXhpbS5zQGdtYWlsLmNvbSB3cm90ZSBvbiBXZWQsIDEzIE1h
ciAyMDI0IDEzOjI3OjIwICswMzAwOgoKPiBUaGUgZnVuY3Rpb24gaHluaXhfbmFuZF9ycl9pbml0
KCkgc2hvdWxkIHByb2JhYmx5IHJldHVybiBhbiBlcnJvciBjb2RlLgo+IEp1ZGdpbmcgYnkgdGhl
IHVzYWdlLCBpdCBzZWVtcyB0aGF0IHRoZSByZXR1cm4gY29kZSBpcyBwYXNzZWQgdXAgCj4gdGhl
IGNhbGwgc3RhY2suCj4gUmlnaHQgbm93LCBpdCBhbHdheXMgcmV0dXJucyAwIGFuZCB0aGUgZnVu
Y3Rpb24gaHluaXhfbmFuZF9jbGVhbnVwKCkKPiBpbiBoeW5peF9uYW5kX2luaXQoKSBoYXMgbmV2
ZXIgYmVlbiBjYWxsZWQuCgpJc24ndCBpdCBkb25lIGxpa2UgdGhhdCBvbiBwdXJwb3NlPyBSZWFk
LXJldHJ5IGlzIG5vdCBhIG1hbmRhdG9yeQpmZWF0dXJlLgoKPiBGb3VuZCBieSBSQVNVIEpTQyBh
bmQgTGludXggVmVyaWZpY2F0aW9uIENlbnRlciAobGludXh0ZXN0aW5nLm9yZykKPiAKPiBGaXhl
czogNjI2OTk0ZTA3NDgwICgibXRkOiBuYW5kOiBoeW5peDogQWRkIHJlYWQtcmV0cnkgc3VwcG9y
dCBmb3IgMXggbm0gTUxDIE5BTkRzIikKPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbSBLb3JvdGtv
diA8a29yb3Rrb3YubWF4aW0uc0BnbWFpbC5jb20+Cj4gLS0tCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
