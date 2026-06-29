Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB40C43458
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 14:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eW/DlgTQWbgUoOQVgS/beGJsKwHT1w8POZF6ESX1d28=; b=QgKsCJYoMmM2FR
	nYgolM0XcP6zgDMAUY8o5z+PaTRES3w0TtrluiQjAFO/zlwsbtI1UWXQImIOV4DVTyLMFybBqPTHw
	rHOBG0kbRxRvHt5ZQEUHdeHTfustp6bzA1tBqg4+1AQQcgys1KqvntpTY6vXZ2Z5owTqSXwUj/T5u
	7MqC5O5Y03rDapmJhzqtFnTAyVsjrXMUx9LtnKU0H9GNoz8WoTGhd2cSTm2HYcSp948Y1rHfZYtCO
	an9R9ctfAiT3k0Mu9xZnW6aLmiD1K06Tmoka/ktHd4edTnkcsoYhIIahi4VFOn5gCTc5ZmhA9DOzJ
	rpaE6FQ6Kn2ASlg02XMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weD9E-0000000Eu0e-0rHd;
	Mon, 29 Jun 2026 14:39:44 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weD9C-0000000EtzX-0Ocl
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 14:39:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 57EB3C6B3B6
	for <linux-mtd@lists.infradead.org>; Mon, 29 Jun 2026 14:39:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3B1EA5FF96;
	Mon, 29 Jun 2026 14:39:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67E93106F1841;
	Mon, 29 Jun 2026 16:39:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782743978; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RpX2OkovsIpnoQ1BPzvMrCVTbCR1KD9DR+Nldc7a7g8=;
	b=tDP8v3IP91t5zSRU6ORd00QpU3A4zF7y4jEAsrIbYxbs+u8UsQxkuuhHCePourFq+FWxRt
	1yh4Q2htW7dCYoJuVHb8nAs025TKNGLoiN/vX+e5x8cYel3X7yOjxLvKNe9u+wZHpfrjG1
	LpNl6kRxp2qZruBt3ckbBo0nCmuoaSgnogpsnU0anJoAcZtazFOXOv/b8Ir2rF4wfSYBCl
	XT2nEqftjvv2pTFRMmIIg3+U1k3UHKvqfBFgWDJNdJzLl6MdtJMEpMoSgOCRZrT4ZaZfdy
	wpZSDzHlHE7N+oAB+xfzJ49bQA4b/30DZnJVOuMfOJ72q7PeiNcN6mdRyq6Iww==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260614063152.1522268-1-rosenp@gmail.com>
References: <20260614063152.1522268-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: ndfc: fix gcc uninitialized var
Message-Id: <178274397720.256048.16887941612561231602.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:39:37 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_073942_299236_31E0CA6E 
X-CRM114-Status: UNSURE (   5.32  )
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

T24gU2F0LCAxMyBKdW4gMjAyNiAyMzozMTo1MiAtMDcwMCwgUm9zZW4gUGVuZXYgd3JvdGU6Cj4g
Tm93IHRoYXQgdGhpcyBjYW4gYmUgYnVpbHQgd2l0aCBDT01QSUxFX1RFU1QsIGFuIHVuYXNzaWdu
ZWQgdmFyaWFibGUgd2FzCj4gZm91bmQuIFNldCB0byAwIHRvIGZpeCB0aGUgVz0xIGVycm9yIHVu
ZGVyIEdDQy4KPiAKPiAKCkFwcGxpZWQgdG8gbXRkL2ZpeGVzLCB0aGFua3MhCgpbMS8xXSBtdGQ6
IHJhd25hbmQ6IG5kZmM6IGZpeCBnY2MgdW5pbml0aWFsaXplZCB2YXIKICAgICAgY29tbWl0OiBj
Y2VjYThjYjc3NmIwM2U4Mzk4NTU3OGY4NGJkNzMwYzMwZDU3ZjcwCgpQYXRjaGUocykgc2hvdWxk
IGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5l
eHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCBy
ZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
