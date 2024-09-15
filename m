Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647F1C35FE7
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Sep 2024 10:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m8jL2JkU5Xjcy6QQ5qLpOfPy4O3oidphCpaFBXRwvRQ=; b=rWeDtUKUpxffH3
	QQYUBzPbGqrLnCklOv6Q9qFihHoMmE58MwlamUX4rObA+rG4fxiDKpK+4ZeoSHQqSrX7aUlSgy60z
	fEXMCLmeOILBjBnngj2a3Fu4pDNGaUXceuR2Q7wEEbQjoqr5SbJHSmTzlOuR+mNQm4rTji+LV4dVb
	X+1hraXqVfsP+Q+VhDIrFnGlNffdxQoUTg2Jn6l7FuKBLLl8w7qc0IyXm9OrWtJSqImOlTIUVA6Bi
	s4gwGi5Z3v5+8Sgr0wGeyfW5Xc2rmU2jv/VcWBokH6+5ilPl9KKRsxLDnLf35EVm6AkJzgWt4yJS0
	npT4PLUKMecLvGij0f5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spmsJ-00000001zXV-2XCc;
	Sun, 15 Sep 2024 10:53:03 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spmsF-00000001zWV-1G2F
	for linux-mtd@lists.infradead.org;
	Sun, 15 Sep 2024 10:53:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6453E1BF203;
	Sun, 15 Sep 2024 10:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726397576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EDAX1qKUCPoLdtS6DQdwjQH1UHn7wmOjcgYrP0j8xuE=;
	b=e75F9gQ+cIHkPJnp58hHv9QoztuqbqVJh/oiXa34OhNBQuyRfPUAqrsRIRR4HzS/T9dHEW
	Z9SB4aIWFI1Ff/Nj+6gGj4bP8CkKvAdZzLg6ifNvV55FXiJoirS+SEv9zwYxjWjH3LWRCe
	QQ1xIKKafk9LGACBFTcyoKnP3akmcKeXQtEZ8O9gwZm9fOoQHDz+8NTJmic6A6nEDpT16N
	BUGUFFDFSUtz6K+Lc9rTB2pGCdJYWvRn3MiktGOkCSpdD0btxoY7t8u4gHQ7NpJwAlLjvx
	9JB/gevC6Zsi5dS+JSOnjwugmX3mcz/a597ZNFU8mfhd1erzvZIfWSavYqnysg==
Date: Sun, 15 Sep 2024 12:52:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>, Pratyush
 Yadav <pratyush@kernel.org>
Subject: Re: [GIT PULL] mtd: nand: Changes for 6.12
Message-ID: <20240915125250.72e93909@xps-13>
In-Reply-To: <20240913200113.0a899012@xps-13>
References: <20240913200113.0a899012@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_035259_503713_48900F85 
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

SGksCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIEZyaSwgMTMgU2VwIDIwMjQg
MjA6MDE6MTMgKzAyMDA6Cgo+IEhlbGxvLAo+IAo+IFRoaXMgaXMgdGhlIE5BTkQgUFIgZm9yIDYu
MTIuCgpQdWxsZWQgaW50byBtdGQvbmV4dC4KCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
