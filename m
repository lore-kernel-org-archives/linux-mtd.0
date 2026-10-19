Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AA0CCF2D6
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2026 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CaJfK6usl5IlJgJGXhp4Hk4jJkxyKdyk8UifTfJhHTw=; b=j6t3zzaFkMjOJM
	4gvQ2rYu8KEOeE3Ecuq5yC9HA5IkTG/Re4VVMgf6P9lET4PD3g4GAJOHz+jc6752nz7/4Vr+GXOrk
	50LPJXkXZlfP9Ct/HHx7vhtVVWm3djYBmytrybTuLaCQeYvX8QgcpgqxwYrmi9/s7y0d7j6XvOoPP
	+QgYPSBJA5K3CCXWSZuGFkX1QaHTBWxLMYKzDC1csnMrA3jZN3jsH7uutT4hUYiFzreXvCrKs1KoT
	L+Xl9uviQsXctuT0SkM3F90dRC3FjtJ2vlnqbus4SCF2KSK9v4zR40y1Gu6O0ooTI0944HssoxDf4
	eCftYbxdsIGhnfm5aMBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiPA-00000006pix-36NH;
	Mon, 19 Oct 2026 08:07:36 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiP4-00000006pdI-0HEA
	for linux-mtd@lists.infradead.org;
	Mon, 19 Oct 2026 08:07:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DD1FE1A120F;
	Mon, 19 Oct 2026 08:07:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B044060582;
	Mon, 19 Oct 2026 08:07:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 773CC10328429;
	Mon, 19 Oct 2026 10:07:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792397245; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d3/hopPp/eVkECxCWqkP7OqN5b2zcWeLjUMHnlh7neg=;
	b=A+n+tbMIPM96uVCPMtv3oEeslRi7Fnzoqjl6CrZWdXjp+OxbvqOVPPA+rwrHXMh1J//UIl
	V5XmNAJkgBb6J9VTVdBp95Woak0aWgQvP+YC6qN0fKyUMiesX96umeAGppt641H0T7mgKa
	YudJ+qFkzGwyTIYegG3lxVgOHNJWns7JXUlU5qgAXbNAf/cb+gcow1Um8fmv9HfEL1yTDT
	RjaNzSJ88CegPXFSR8/AL8mp+okOM0K/y7BS4jekvQHdr0V64LI7EKG2iGLbRQm330VJ+L
	bkUA/uWZ8apzeq+pbxHZ0QelouPS9QPhuCKvyek4brEuz5AE/COMPleCMEyexg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Orgad Shaneh <orgads@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] mtd: cfi_cmdset_0002: also clamp the write
 buffer of an x16 part strapped to x8
In-Reply-To: <20261019034922.3805782-1-orgads@gmail.com> (Orgad Shaneh's
	message of "Mon, 19 Oct 2026 03:49:22 +0000")
References: <20261019034922.3805782-1-orgads@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 19 Oct 2026 10:07:22 +0200
Message-ID: <875wyy15c5.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_010731_491398_18688317 
X-CRM114-Status: UNSURE (   5.26  )
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

SGksCgo+IEZpeGVzOiBjZmM1ZWJjOTU0MGUgKCJtdGQ6IGNmaV9jbWRzZXRfMDAwMjogY2FwIHRo
ZSB3cml0ZS1idWZmZXIgY2h1bmsgYXQgMjU2IGJ5dGVzIG9uIGFuIHg4IGRldmljZSIpCj4gQXNz
aXN0ZWQtYnk6IExMTQo+IFNpZ25lZC1vZmYtYnk6IE9yZ2FkIFNoYW5laCA8b3JnYWRzQGdtYWls
LmNvbT4KPiAtLS0KPiBSRVNFTkQ6IHVuY2hhbmdlZCB2Miwgd2hpY2ggZ290IG5vIHJlcGx5IGlu
IGEgd2VlazsgaXQgc3RpbGwgYXBwbGllcwo+ICAgICB0byBtdGQvbmV4dCAoY2ZjNWViYzk1NDBl
IGlzIGl0cyBwYXJlbnQgdGhlcmUpLgoKV2UgYXJlIG1haW50YWluZXJzLCBub3QgY2hhdGJvdHMu
IFBsZWFzZSBhbGxvdyB1cyByZWFzb25hYmxlIHRpbWUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
