Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1898C112584D
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 15:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCKqK0kDJFJ1TfjaDVl7xTHdymQfkxt9PIoTOYjtC40=; b=K7wC6HlpMGLMpe
	q7D0vIRIbiUbhup+G50OqQ4xst/1vO2pQEebaGz36DrUaaB2EBFB52BaynuuQ58+v6Z94MOfYXf2I
	35D0An0skfFTpdJ+G7G+ZLtzCbYMmpMXyrU9ysv8Ek1/6kJcakK9Hj0S9KYwhJoRnMdAdwtpwtDso
	ww0dYg3YocL4wIX7o/zylosRXoTNACKnif13vPiKx6vOzFjl4fjpgQX/HAlDGO2VmsIq50a9qfv7q
	UtfSkHNrzldhCZOWm5lE8FEaFjB0zeFmFSlng8Nnxv2y4ihcHUJ8wISOzAmy+LXhnep2TeeJ8ohpt
	pOJmEc10z+DVP13yqnUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Lc8-0000000Bq0n-28m7;
	Wed, 11 Mar 2026 15:36:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Lc5-0000000Bpyy-0L4K;
	Wed, 11 Mar 2026 15:36:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8AC921A2D72;
	Wed, 11 Mar 2026 15:36:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D02060004;
	Wed, 11 Mar 2026 15:36:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3133C10369D16;
	Wed, 11 Mar 2026 16:36:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773243402; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ApzOhorybY3ljiB6CsXLMn4hxGlYu1mNujmVp2N2niQ=;
	b=hTMYs8gbtABgvr7pKPME09y7bDNuLcSMYon9S+fqwHgyT7pTRCzRe2Q5cx3h3jzPvyu78u
	CSXEv3072sVe8fghTqCD5i2AJ6Uo13xuqGXxB1h9404kbtC5/WjpKKY4SAW5vc3ir3h2Hz
	atAnyUR184z2lFRX0XgRoazDzSQtq21N5t85HfAm8BzVR9whLUNsf1j9AkhRW5J9/GAOC6
	XcnI6kSvTQ2+lEqNEw1l4QVKVO0AZHh7cm2EEcwDaEEz13uEDEdsxsQhiWtxgFOj2O6436
	/eIU1dFSyUYSc1CarzwNgnO5QbVNS/qksn6jY0M27XejcC+rfzKvwrRIGuhFKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Max Krummenacher <max.oss.09@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
In-Reply-To: <20260310-gpmi_nand-v1-0-6a665151aa75@nxp.com>
References: <20260310-gpmi_nand-v1-0-6a665151aa75@nxp.com>
Subject: Re: [PATCH 0/3] mtd: rawnand: mxc: set raw chip's to child nand@0
Message-Id: <177324339988.696314.2482763998911227271.b4-ty@bootlin.com>
Date: Wed, 11 Mar 2026 16:36:39 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_083645_330216_3EDD035F 
X-CRM114-Status: UNSURE (   8.49  )
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

T24gVHVlLCAxMCBNYXIgMjAyNiAxNTowNzozNiAtMDQwMCwgRnJhbmsgTGkgd3JvdGU6Cj4gVGhl
IG5hbmQtY29udHJvbGxlci55YW1sIGJpbmRpbmcgcmVxdWlyZXMgYSBjaGlsZCBub2RlIChlLmcu
IG5hbmRAMCkgdW5kZXIKPiB0aGUgTkFORCBjb250cm9sbGVyLiBIb3dldmVyLCB0aGUgZHJpdmVy
IGN1cnJlbnRseSBhc3NpZ25zIHRoZSBjb250cm9sbGVyJ3MKPiBvZl9ub2RlIGRpcmVjdGx5IHRv
IHRoZSBOQU5EIGNoaXAuCj4gCj4gU2VhcmNoIGZvciB0aGUgZmlyc3QgY2hpbGQgbm9kZSB3aXRo
IHRoZSAibmFuZCIgcHJlZml4IGFuZCBhc3NpZ24gaXQgdG8KPiBjaGlwLT5vZl9ub2RlLiBUaGlz
IGZpbHRlcnMgb3V0IHByb3BlcnRpZXMgc3VjaCBhcyAicGFydGl0aW9uIiB0aGF0IG1heSBiZQo+
IHBsYWNlZCB1bmRlciB0aGUgY29udHJvbGxlciBub2RlIGluIHNvbWUgb2xkZXIgRFRTIGZpbGVz
Lgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvM10gbXRkOiBy
YXduYW5kOiBncG1pOiBzZXQgY2hpcC0+b2Zfbm9kZSB0byBuYW5kQDAgY2hpbGQgbm9kZSBpZiBw
cmVzZW50CiAgICAgIGNvbW1pdDogM2E2ZTIxZWE1N2M4MTE4ZDMwOTVmMDczYWVhZjkzNjJkYzJj
Mzg2NQpbMi8zXSBtdGQ6IHJhd25hbmQ6IG14Yzogc2V0IGNoaXAtPm9mX25vZGUgdG8gbmFuZEAw
IGNoaWxkIG5vZGUgaWYgcHJlc2VudAogICAgICBjb21taXQ6IGY3YmQxOTQ4YTU0NjFkZjllMTAy
N2Q1YmQ5YTUxMWU3NTQxNDY2ODkKWzMvM10gbXRkOiByYXduYW5kOiBpZmM6IHNldCBjaGlwLT5v
Zl9ub2RlIHRvIG5hbmRAMCBjaGlsZCBub2RlIGlmIHByZXNlbnQKICAgICAgY29tbWl0OiBlZTc4
ZDQ2NmRiOGEwMDFkMTM3ZDZmOWM5NzAxMGIzNDNhZWU0NTZiCgpQYXRjaGUocykgc2hvdWxkIGJl
IGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQg
UFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdh
cmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
