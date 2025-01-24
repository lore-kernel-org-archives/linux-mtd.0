Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81ABCC02181
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2025 10:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hxcOA8mlDZ59DmGOUgiR1mBoS970mpOhVwUX/B1PKTE=; b=JWit1czw1VrYyP
	02rIMNdIwHmJg7NCYyrJtdvdEjR+vOfn389AkdMPQxTpm8Iq/ivGXBqT2xFYALBojUwNHGTaR0tj/
	K4gA2/75wZ9hRNjkoluFpdaZgJbHm5e6v+b7/Je6nH3tnppMLh5NDoApLJV1BuathBdX28sqroIRu
	xwPFtHQ5+GjZtTGVvtUAIoS4ti1nrXEXXOwFe3ktG98WBRf3Z39gYgJhBwLJ4146Ts/cmNJPCWOee
	CWXVxR6Pp2roOaU+v3HBAnxduJTeO1ZK/wB/78C7wgZIbTCoNSZ37ffWk8Rk+zdD3135Bon/AooJi
	FqvISdoZLnbpESG8uFWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGYu-0000000EQV3-0BtP;
	Fri, 24 Jan 2025 10:05:16 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGYr-0000000EQUE-2y7n
	for linux-mtd@lists.infradead.org;
	Fri, 24 Jan 2025 10:05:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E018B1BF20F;
	Fri, 24 Jan 2025 10:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737713112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CGSOjOzgbslE2BUadN1cajeu+WJb/ys5DceD3ReZXCg=;
	b=GdcbpD4nX4BvmMOTs3qQ6nLmrrR6BajSnFb1Ng8LCPgh8nSzh9Dq2T+8jSakOAhXWMukAF
	L7IUylOs6cjQLxGZYXbJ/4FGHxQUSULWEVIQ8YoQAaYF7OmwCa72yoNM/Fm/UDu01pKbG/
	p50qSJBxjyMEMw+isWPp6GRxjLC/CRrgubD3EmvwN6E1NQsxZqYWZdHaUx6wO+W2jJA943
	LZw3QGN9odk1hgGa26y4T5pG8UnU2svJ3gl95po8yOwct9qg3vUkGqKQIehSO4UBlTa63e
	I95AmZF3vrDz0Vdaqyf2JwfGvyc7UQNRXy+Ks3h0vHLMlUhxDIjUbAvgBrIR3g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Tudor Ambarus <Tudor.Ambarus@linaro.org>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Frieder Schrempf <frieder.schrempf@kontron.de>,
  Michael Walle <michael@walle.cc>,  Pratyush Yadav <pratyush@kernel.org>,
  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: NAND changes for 6.14
In-Reply-To: <87a5bhkukf.fsf@bootlin.com> (Miquel Raynal's message of "Thu, 23
	Jan 2025 23:57:04 +0100")
References: <87a5bhkukf.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 24 Jan 2025 11:05:11 +0100
Message-ID: <87msfgil2g.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_020513_894569_03567D72 
X-CRM114-Status: UNSURE (   3.96  )
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

SGVsbG8sCgpPbiAyMy8wMS8yMDI1IGF0IDIzOjU3OjA0ICswMSwgTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cgo+IEhlbGxvLAo+Cj4gVGhpcyBpcyB0aGUg
TkFORCBQUiBmb3IgNi4xNC4KClB1bGxlZCBpbnRvIG10ZC9uZXh0LgoKQ2hlZXJzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
