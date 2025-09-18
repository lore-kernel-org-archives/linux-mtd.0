Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36710CAC59A
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Sep 2025 08:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmkVjlb8L2y7Z00GeL6X7oxoiK39eSkKiyZbn1qODIk=; b=rHva7qjZE6vfrF
	glgcHf3TQnd0UDXW3mcc6ufPzSB5AOoRA8yGAlw8kB8bEQDHIvllcR5ANAo6F1CYtb9WROBxr+bpK
	ktDi1BLX0thQQypQYHx1hDfqO/JJGO7ai0IGxJ/FwF6DMeTw0blUkNkall86k6NlfxjEXq+LVe+Am
	+n3DHQyfyhk+0FDxk3F/04z8y/xw7Yv2Jpi3YIC715034Y0SCAST1Y9G2luiNjx1trXZVYoPROH1i
	BYr5DBVmfN3iCzo9ogCfsPOz/t2yI9ZD3JVqKef6Egicr9lTY2FKtZoCRiFYF/0wzP07ML2edOEQj
	rZSwkWM8MrOXe6yyunOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9yf-0000000GhCI-0i66;
	Thu, 18 Sep 2025 08:26:53 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9yc-0000000GhBw-1KkB
	for linux-mtd@lists.infradead.org;
	Thu, 18 Sep 2025 08:26:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6E7601A0EC5;
	Thu, 18 Sep 2025 08:26:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43EDE6062C;
	Thu, 18 Sep 2025 08:26:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FEEB102F1A63;
	Thu, 18 Sep 2025 10:26:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758184007; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5IaPwRTM0oie4mB87Ujle/rv2fSoo8Z+ofAqYkKA8w4=;
	b=n/hG5ToTC5xO91+v33o6k85Yp5PDW9V9Dfxe4ur8vZGY39yQW5x5QQAg0IdOl/XZ7Oz526
	r/+qZjqfFtLivvw0L5f1VDiujxxTkliPFox8qvPJABx0qyhXuAY1LS1c8O9NDhPnuq4cH8
	QauL3sL3q4kT6U2xStRr2AF5L86eLXukaTP2DEyjeoDHWH6HFA1W7vm2jYTsz1LyurNB5d
	eosKe7CRKCNqrgxU5meG+LLxUYC6MG0dleO8JD0wcY4XQNZOLpj9jd7o7g8TIHWmS6jpZs
	125oSW/iVmSmLP31oqTPP9NmHuuJU0d0qWO5rF7glQlDZXLYG0DR0QmbLu1qFg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Martin
 Kurbanov <mmkurbanov@salutedevices.com>,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: Re: [PATCH RESEND v5 0/3] mtd: spinand: fix continuous reading mode
 support
In-Reply-To: <20250917215401.19132-1-mikhail.kshevetskiy@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Thu, 18 Sep 2025 00:53:58 +0300")
References: <20250917215401.19132-1-mikhail.kshevetskiy@iopsys.eu>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 18 Sep 2025 10:26:28 +0200
Message-ID: <87h5x0180b.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_012650_489817_2CF6C27C 
X-CRM114-Status: UNSURE (   6.16  )
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

SGkgTWlraGFpbCwKCj4gQ2hhbmdlcyB2NToKPiAgKiByZW5hbWUgc3BpbmFuZF9jcmVhdGVfcmRl
c2NfaGVscGVyKCkgdG8gc3BpbmFuZF9jcmVhdGVfcmRlc2MoKQo+ICAqIGdldCByaWQgb2YgY29u
dHJvbGxlcl9pc19idWdneSBib29sZWFuCgpJIHJlY2VpdmVkIHBhdGNoIDAgYW5kIDEgb3ZlciAz
IG9ubHkuIFBsdXMsIHdoYXQgaXMgdGhlIHJlYXNvbiBmb3IgdGhlCnJlc2VuZD8gVGhpcyBzZXJp
ZXMgd2FzIG5vIGxvbmdlciBpbiBteSB3YXRjaCBsaXN0IHdoaWNoIG1lYW5zIEkgd2FzCnByb2Jh
Ymx5IGV4cGVjdGluZyBjaGFuZ2VzIG9uIGl0LCB3aGljaCB3b3VsZCBoYXZlIGxlYWQgdG8gYSB2
ZXJzaW9uCmluY3JlYXNlLiBDYW4geW91IHBsZWFzZSBjbGFyaWZ5PwoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
