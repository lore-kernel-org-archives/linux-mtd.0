Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E27C79F87
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTG4DziF2nh7DSO3xfW+i96omMEKLkK9HFfGxQ/kpJI=; b=FieYR98+qYdFN7
	Bx9pBzFCTkvQ02Nc8/4bODPq5AjKiIFDfJnX0Qcgl5x2Z+gXqzJxbej00A/2FjEY6VLt6Rry+VQTm
	JxaV0qzA3JvM+enuDrDRKB6WTp7LnFPScCrqiz7PQvXwF48Up9Z0kQRtt6Z3Zu+yDQgUjlhiUybVt
	A7gxqbK7cXKgjF/kcvyMH9CNlxdp4hpOoaiobaaHLFa5oN2he54fi0x292Ud9UGKKNqujo7SlpDOM
	M2+5rRqBA70tqgu3Q0EdPnFR56XSQj5fZ3g6DjCfaGK8NG9CzK/h3ia9c1f7KKCkt4lbs5tj1A8MU
	kDaPSmLKi45tWUnqI7jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xs7-00000002uDg-2Nrx;
	Fri, 04 Sep 2026 17:38:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xs5-00000002uAl-2lDY
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:38:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 30A1C1A19B9;
	Fri,  4 Sep 2026 17:38:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 045566057F;
	Fri,  4 Sep 2026 17:38:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD6F611C78158;
	Fri,  4 Sep 2026 19:38:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788543515; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fCUZAB1CODJMooW/JvhKB0bkDCO+uGwldLqxXNdhU9I=;
	b=RVjekmHP2791GzZBTe+bKEIhfKS3+lwgibzp7lc6FZqo00F4Wnx1nmLddTyy7VTPooC2yg
	R4PLGef0PtCHiSJIkakwJy2ouLSbx+GJ4AJ+wtRF+IzHfOXtunD724QB3AiEssiH/ALXLY
	GmxpSpuW/oZv3Q0x9ePFJ9XjTp0/qU2/0husfaGwPeXFh2xD03VeiHMZzS9VZ/RHa4PeqE
	MV9ikFn6Oz2+i5OqOCGuxMt9dwE6HTeDfcenecwpQK7P/HJKr7x5twvbvJdzUqSEWlc0Hb
	+R3+zQr2wK8rdf1YSlFTQqWCJAcCS5qNyLcWNWlUUrBKSF7DEnffzyYdE02rzQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jianhao Xu <jianhao.xu@seu.edu.cn>
In-Reply-To: <20260902070542.3485515-1-runyu.xiao@seu.edu.cn>
References: <20260902070542.3485515-1-runyu.xiao@seu.edu.cn>
Subject: Re: [PATCH] mtd: rawnand: cadence: Initialize IRQ state before
 requesting IRQ
Message-Id: <178854351280.1467647.11088878922601581121.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 19:38:32 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_103837_842699_F6ECD5F1 
X-CRM114-Status: UNSURE (   6.24  )
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

T24gV2VkLCAwMiBTZXAgMjAyNiAxNTowNTo0MiArMDgwMCwgUnVueXUgWGlhbyB3cm90ZToKPiBU
aGUgQ2FkZW5jZSBOQU5EIGludGVycnVwdCBoYW5kbGVyIHVzZXMgYm90aCB0aGUgSVJRIGxvY2sg
YW5kIGNvbXBsZXRpb24KPiBvYmplY3QuIFJlZ2lzdGVyaW5nIHRoZSBJUlEgYmVmb3JlIGluaXRp
YWxpemluZyB0aGVtIGxlYXZlcyBhIHdpbmRvdyBpbgo+IHdoaWNoIGEgcGVuZGluZyBpbnRlcnJ1
cHQgY2FuIGFjY2VzcyB1bmluaXRpYWxpemVkIHN5bmNocm9uaXphdGlvbiBzdGF0ZS4KPiAKPiBJ
bml0aWFsaXplIHRoZW0gYmVmb3JlIHJlZ2lzdGVyaW5nIHRoZSBoYW5kbGVyLgo+IAo+IAo+IFsu
Li5dCgpBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoKWzEvMV0gbXRkOiByYXduYW5kOiBj
YWRlbmNlOiBJbml0aWFsaXplIElSUSBzdGF0ZSBiZWZvcmUgcmVxdWVzdGluZyBJUlEKICAgICAg
Y29tbWl0OiBjNGRhMjM3NzdkMzVmNGFhYWU3ZmYwZWE5YTUwM2JhMjcwMmVmNTNjCgpQYXRjaGUo
cykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQg
b2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4p
LgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
