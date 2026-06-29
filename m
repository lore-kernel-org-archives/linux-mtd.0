Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AA2C43327
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 14:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TxqKG3g/RbARvdBYO1ROuLABAxKwsBcQe/qqBPvkoxE=; b=0qAuw6w2njMl7u
	mZTje40IooEdAIraNj4dQ9yUErfd1UgIKVq2fFZwHe4cD0tfljEPOhZ/wRUirL4cHfqpuSHGQ4dCq
	wUBmYdWAq9cvZBSYMnDJcSJVVTZeDHVZZ9GdBsk8WICPl3GROTIkzuEC0byTtaIJgBcOnOFPoiCcz
	iC4uml8QGCjr9DE2ki0zDA/Pn6L7piQgs0RlxqSFgj5zPPPfgiXiwAj82SivbNckypx0cv752NBkA
	9X0ekW5wRKoG4xeF3QlX7krJBvRdGP2VEVvBA6AHVK/+Lyg/8BhTv4B60g82PSj6BEUKEV/BqK7FW
	xXP/KwruL0IEYQlc7bFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDI8-0000000EwQn-00SU;
	Mon, 29 Jun 2026 14:48:56 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDI2-0000000EwJQ-2q8x
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 14:48:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2E57E4E407B2;
	Mon, 29 Jun 2026 14:48:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 026425FF96;
	Mon, 29 Jun 2026 14:48:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 26810106F18BD;
	Mon, 29 Jun 2026 16:48:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782744528; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RXgkiW8fJ783HKy7+f8bBbD7cjAiDUriTDabL9hWev0=;
	b=Ni+IZYUINKEnoiKFXO0JkpjNmwJclhS0zEorlsW5vScqIqnYtjvgz3In/MSg4r0WpOPZjY
	x740koyBNYbv+PG0YZb/pCrgXHRWUUHwqTshLBw0+uQXAUaZ9Wy8Cog761Df1LVNplsrYT
	P9eB8RNh2OGxf+5HI54SGqjZ1E+rPzoO/3rqxByRQKeKCxRPlVJsNC/RVCmm8j9od6JYrp
	VotrUECHjtJEujRxoebKHTUmwCLnO8AKdQAmy9FJGeubNe1QmSESdeI5Zf8qwkP2PcpIeF
	+A3mbe4De9SWgeMj6Y2l29tumgUgR2ciNjS/w3bL9Z2rKdM9lnrL9q/GB+aZSw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ziyang Huang <hzyitc@outlook.com>
Cc: richard@nod.at, vigneshr@ti.com, cnsztl@gmail.com, 
 csharper2005@gmail.com, mikhail.kshevetskiy@iopsys.eu, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <SEYPR01MB5882BF9E8BB94DA488A3A2ABC9EE2@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
References: <SEYPR01MB58820CD8B60FF0712FF31B42C9E12@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
 <SEYPR01MB5882BF9E8BB94DA488A3A2ABC9EE2@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
Subject: Re: [PATCH v5] mtd: spinand: fmsh: add support for FM25G{01,02}B
Message-Id: <178274452706.266238.1734146832124036215.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:48:47 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_074850_861796_987E9F1E 
X-CRM114-Status: UNSURE (   4.80  )
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

T24gVHVlLCAyMyBKdW4gMjAyNiAyMjo1NDoyMiArMDgwMCwgWml5YW5nIEh1YW5nIHdyb3RlOgo+
IEFkZCBzdXBwb3J0IGZvciBGdWRhbk1pY3JvIEZNMjVHMDFCIFNQSSBOQU5EIGFuZCBGdWRhbk1p
Y3JvIEZNMjVHMDJCIFNQSQo+IE5BTkQuCj4gCj4gRk0yNUcwMUIgZGF0YXNoZWV0OiBodHRwczov
L3d3dy5mbXNoLmNvbS9udm0vRk0yNUcwMUJfZHNfZW5nLnBkZgo+IEZNMjVHMDJCIGRhdGFzaGVl
dDogaHR0cHM6Ly93d3cuZm1zaC5jb20vbnZtL0ZNMjVHMDJCX2RzX2VuZy5wZGYKPiAKPiAKPiBb
Li4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogc3BpbmFuZDog
Zm1zaDogYWRkIHN1cHBvcnQgZm9yIEZNMjVHezAxLDAyfUIKICAgICAgY29tbWl0OiBkNWE1Yzll
YjJlZTlmZjViNGNjMGJlMTVhYzdmNDg3OWQ0YzJmMjQ3CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2
YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIg
KHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRz
LApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
