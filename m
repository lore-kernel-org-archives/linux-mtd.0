Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9085BD116F3
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Nov 2025 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dhIy+CPaMZbv3Qj2HttRnywa/frC0aDRiQPDFOcE+0=; b=EYp/JuK6rX56Uo
	s4Fd8L/wWQEN8uN/4ugpPqOPBMi//1yoOdn2h0Hk0bhSNka1QCE11Ytb+QjQzdB3ihg3uPepK/sbN
	UlQhYrLxDPmjqe4qaNcBul508QBawEuNu8TLp2TVgNLL3fjlyKJ2lzETbKz+sxnSWnwYslHLxCpXZ
	eygeFrHu2ig8eiZ+wL13N/9SQCewQZRTziedYZC1nt1RdJg7W2JWs/o2nTf/S2RiLUOgnDwLHCKl+
	/CegKD2iBwJGGq1SlGO7/e5alsaCqdW7nlqtCh7mMBGrFqbc1k4YhhqND6cmOjqSExuKpo3h5kPBn
	WHLQeU0QXYzjn+TnEjRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPKQH-00000001XV7-2cmC;
	Sat, 29 Nov 2025 12:51:33 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPKQF-00000001XTM-3e07
	for linux-mtd@lists.infradead.org;
	Sat, 29 Nov 2025 12:51:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3759B1A1E31
	for <linux-mtd@lists.infradead.org>; Sat, 29 Nov 2025 12:51:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0CF9F60706;
	Sat, 29 Nov 2025 12:51:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 845DF11910699;
	Sat, 29 Nov 2025 13:51:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764420689; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PmzHrTDbSxPe6ldHx+NqhlAl1tlGWcmT7TIHHXkKSbk=;
	b=019ToLmcaVUCc/QEc3NFAHx3jOr85ni1L7WiZ+MsrJ8g7Yt8AVmgZlC7N8KUvsqweoKciX
	8JoY3ua/gg673RgcjxZLhA8Q4jvTyRXmyKw0wW5CFq/kUKux4+nmR0G3Q1U5wrO2RFqL/w
	PkXNCf/VEFjKwsYVtnGyjMuuIQjqRx6nYH0DjRC3MzaltMR8wsHu/h9xtutKUklCF6Wamd
	B8zRuBFAYAwaxbycdVk4hi2FkP/+gJM948dnvtEV36/GNTnNeNoVieHBaixOIqSZ7JgEL/
	46x03YqtS2IItuS+pFcYFPTmJn7JqlbCEM/vY2ps92hhZb0wIFT1FOZ+k8j/8A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251123182102.548130-2-thorsten.blum@linux.dev>
References: <20251123182102.548130-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] mtd: sm_ftl: Replace deprecated strncpy with
 sysfs_emit in sm_attr_show
Message-Id: <176442068835.77093.3412459996845909456.b4-ty@bootlin.com>
Date: Sat, 29 Nov 2025 13:51:28 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_045132_040093_228270AC 
X-CRM114-Status: UNSURE (   9.12  )
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

T24gU3VuLCAyMyBOb3YgMjAyNSAxOToyMTowMiArMDEwMCwgVGhvcnN0ZW4gQmx1bSB3cm90ZToK
PiBzdHJuY3B5KCkgaXMgZGVwcmVjYXRlZCBbMV0gZm9yIE5VTC10ZXJtaW5hdGVkIGRlc3RpbmF0
aW9uIGJ1ZmZlcnMKPiBiZWNhdXNlIGl0IGRvZXMgbm90IGd1YXJhbnRlZSBOVUwgdGVybWluYXRp
b24uIEl0IGFsc28gdW5uZWNlc3NhcmlseQo+IE5VTC1wYWRzIHRoZSBkZXN0aW5hdGlvbiBidWZm
ZXIgaWYgdGhlIHNvdXJjZSBpcyBzaG9ydGVyLiBSZXBsYWNlIGl0Cj4gd2l0aCBzeXNmc19lbWl0
KCkgdXNpbmcgdGhlICIlLipzIiBmb3JtYXQgc3BlY2lmaWVyIGFuZCBzdXBwbHkgdGhlCj4gbGVu
Z3RoICdzbV9hdHRyLT5sZW4nIHRvIGltcHJvdmUgc21fYXR0cl9zaG93KCkuCj4gCj4gUmV0dXJu
IHRoZSBudW1iZXIgb2YgY2hhcmFjdGVycyBhY3R1YWxseSB3cml0dGVuIHRvICdidWYnIGluc3Rl
YWQgb2YKPiAnc21fYXR0ci0+bGVuJy4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvbmV4dCwg
dGhhbmtzIQoKWzEvMV0gbXRkOiBzbV9mdGw6IFJlcGxhY2UgZGVwcmVjYXRlZCBzdHJuY3B5IHdp
dGggc3lzZnNfZW1pdCBpbiBzbV9hdHRyX3Nob3cKICAgICAgY29tbWl0OiBmM2RjNGQ5ODk4YmM5
OGUzY2Y1NjlmMDM4ZDkwYTVmZWM3YmZjNDRhCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJs
ZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3Zp
ZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1
w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
