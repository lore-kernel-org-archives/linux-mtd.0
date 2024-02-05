Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7321DC48297
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 14:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yHn8uiX+jdsVDUzuyf8JrtzNVjCbH/WJ0P/rqM7bOaE=; b=n3Lkm1GmQJddih
	SsBZO2YBcYFJFjcfHq40lBmgkRBRSG+UKa2794m9TvbHPTkBLnhKZ/f4aJQ6m8YjskWJ/dBrQPDQm
	ACYrnucBqZLqAlPP9BrrQluroKg62YDuYTCiGMYN08Bb65shmjh50PkyIUJ54/j3cB0bx26hbliYb
	vtClj70Ec3tqpJC/3t00AYCKSfSvZ1FWIRdI8DrrqImCpwgA+hX8bZlvWj3ArD28B9KxM8hHsvcbT
	0xATlpPw2Op7vNjpgD6MBVBng6ah6LvcUCLf3mZTLPPTPHMXW1leUxudJ2wDnCGGqGdxL7xkKztUd
	cZ+/u7fJvoiit6SW1j1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0Hp-00000003fa8-1opU;
	Mon, 05 Feb 2024 14:49:29 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0Hm-00000003fYm-3HET
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 14:49:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EA2720002;
	Mon,  5 Feb 2024 14:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707144563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dAMct4XydDhj7Dn6t3PmUwO6bQQpLn0EUiFoIl9qKD0=;
	b=Gyw0R3/rDe8otg2fYOkPgs/ShdqP93PHrKI3IXqHBt8qD2XQIQYQHE5EieK/shXpJN7pD0
	0MY8NWfJ8iCD+Y+82Uh7hU8Yi5G46djMbfyHBX25IpI4BJYT8+lLSeFdJlIgHbFVOHvEWF
	SU6kJWKXaVMjh4TPOrP0RceO8r4GgARxnTgiAO4JLHYZBMIoMDWQq4IGActhyJzLVHp0qu
	QG6/XoeVt1R0gtKEEneQK/PNhVZtLdZVz+B+apcK/AvFlt1V7JNtjbiMuFyfOXdLK6NSo2
	SomifhdW+f/iu3lMA9fkpyjlaFYXbSNqmT4J8dyPRcEx6esAjeYPbWNOciw5iw==
Date: Mon, 5 Feb 2024 15:49:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH] mtd: rawnand: fsl_elbc: Let .probe retry if local bus
 is missing
Message-ID: <20240205154921.2eef881d@xps-13>
In-Reply-To: <20240115141245.3415035-2-u.kleine-koenig@pengutronix.de>
References: <20240115141245.3415035-2-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_064927_027814_08585735 
X-CRM114-Status: UNSURE (   8.23  )
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

SGkgVXdlLAoKdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIE1vbiwgMTUg
SmFuIDIwMjQgMTU6MTI6NDYgKzAxMDA6Cgo+IElmIGR1cmluZyBwcm9iZSBmc2xfbGJjX2N0cmxf
ZGV2IGlzIE5VTEwgdGhhdCBtaWdodCBqdXN0IGJlIGJlY2F1c2UgdGhlCj4gZnNsX2xiYyBkcml2
ZXIgZGlkbid0IGJpbmQgeWV0LiBTbyByZXR1cm4gLUVQUk9CRV9ERUZFUiBpbiB0aGlzIGNhc2Ug
dG8KPiBtYWtlIHRoZSBkcml2ZXIgY29yZSByZXRyeSBwcm9iaW5nIGxhdGVyLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXgu
ZGU+CgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
