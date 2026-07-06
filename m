Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53254C44500
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 06:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEWVq9qb5eJndwPD7s8ISZnB/rBBcB078JSDWcQ5/S0=; b=OIomzanPL9/6M4
	AdcZvZRMI3SK2QqeQfGbfVRUTrMu73CFGJB/mkFAR6oa780OH55BxBzcGzII69ey7eAyOvc/NOEMF
	O1zJOwVUacsxFayoJQZLTa5CrUCjZzEqjIn9EPkKaJKf4tw1ays23ANOs2WLDjr0zVJ2f5YPebxad
	F9AX7G/rO0aS64Xa+VAwaa8GxJOn2Dd5BATNRuRTeTw9m7lnzf/4bPBg2JE+zDGPhTN6dFo3Sekb5
	QUVrCwsCMmJ7hmWeTX/Mv+M8yF9OvYBPBM9mm4xyl633C0CvpYzGYi11LX1uFHDxOLF8W0xj8H83I
	ALcheLLHLN/VvHMpQRzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgcku-0000000BbyR-3zhm;
	Mon, 06 Jul 2026 06:24:36 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgcko-0000000BbsA-3xhx
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 06:24:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 30F90C8EC65;
	Mon,  6 Jul 2026 06:24:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38FA7601A2;
	Mon,  6 Jul 2026 06:24:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6538E11BB98DA;
	Mon,  6 Jul 2026 08:24:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783319068; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oWy73pQkQkykoXtmTREjFgcQDsCw6POAoGsrElatGjo=;
	b=V0mw8dsrSBSByAJAKvS8O3OxgpTuNmyWSRvuUtyWFhVX5iCHK3DHymMXLzJ8rBCzVz6lPJ
	bBOdDprjSupXr8P9uXIeg0ZsAA8eHRMKfz5ypqIF4vZGvXO5zfhbHnKB7VcuvwcrmYMtdD
	4IO3OUYL7bpMwhNwYa8CD2ZVJZrrpEIyH/1kFwCd4vHL+6TSyLns45G88HpdF+mGIFE7aI
	0c9w2f9BE2sO94wAZ3vYGwOUucyDKACtrwxghroXxwgCV5zlyzynZ6/+SuUlnyfnI7vKFL
	tU09jA7BSVkjdnyN6SlTJ4H2GkpIXlMIKaCFGXyps+zdmo4XxTLsYt/gODqshQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Frank Li <Frank.Li@nxp.com>, 
 Kees Cook <kees@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260703074233.59967-1-pengpeng@iscas.ac.cn>
References: <20260703074233.59967-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2] mtd: rawnand: fsl_ifc: return errors for failed
 page reads
Message-Id: <178331906728.868671.5254954365609125128.b4-ty@bootlin.com>
Date: Mon, 06 Jul 2026 08:24:27 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_232431_181498_90FE6C53 
X-CRM114-Status: UNSURE (   7.40  )
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

T24gRnJpLCAwMyBKdWwgMjAyNiAxNTo0MjozMyArMDgwMCwgUGVuZ3BlbmcgSG91IHdyb3RlOgo+
IGZzbF9pZmNfcnVuX2NvbW1hbmQoKSBsb2dzIGNvbnRyb2xsZXIgdGltZW91dCBhbmQgb3RoZXIg
bm9uLU9QQwo+IGNvbXBsZXRpb24gc3RhdGVzIGluIGN0cmwtPm5hbmRfc3RhdC4gZnNsX2lmY19y
ZWFkX3BhZ2UoKSB0aGVuIG9ubHkKPiBpbmNyZW1lbnRzIHRoZSBFQ0MgZmFpbHVyZSBjb3VudGVy
IGZvciBub24tT1BDIHN0YXR1cyBhbmQgc3RpbGwgcmV0dXJucwo+IG1heF9iaXRmbGlwcywgd2hp
Y2ggY2FuIGJlIHplcm8uCj4gCj4gUmV0dXJuIC1FVElNRURPVVQgd2hlbiB0aGUgY29tbWFuZCBk
aWQgbm90IGNvbXBsZXRlIGF0IGFsbCBhbmQgLUVJTyBmb3IKPiBvdGhlciBub24tT1BDIHJlYWQg
Y29tcGxldGlvbnMgc28gdGhlIE5BTkQgY29yZSBkb2VzIG5vdCB0cmVhdCBhIGZhaWxlZAo+IHBh
Z2UgcmVhZCBhcyBhIGNsZWFuIHBhZ2UuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL2ZpeGVz
LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IGZzbF9pZmM6IHJldHVybiBlcnJvcnMgZm9y
IGZhaWxlZCBwYWdlIHJlYWRzCiAgICAgIGNvbW1pdDogZjlhMTNlMDVhMzI3MDgwYzNhMWM4MTY1
YWRmOWU2NzhmYjY4ZmVmMgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xp
bnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5v
IHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
