Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33266112584E
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 15:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qHH3RjNFLCs+LBoCTCG8L1o218+pVXRehmwTF2sFUQ=; b=S8j92hhnQP0h3N
	LQvymCDaHb4ym6J3AN2VdsW5837JVbIBoVDZY8Abf5U7XJzl6k+VWDpsoijBQRabJI7n0dzBMj1A8
	Ls/bjAlPkgMZqbQYW+m6vWsyUi3eYtIlWEyviZeSgmDGsJXdrFHIJ1p8YC4YIdBCfAeiNvjZ9rYIt
	jn8977ggQmvxD9InIhyyXlGmQ/qk6EZMnfrCalq+dyB7ya7fb/Hy6qJ+4E4MsvYf1oB90Q5is6PaK
	gabkZhDDkH2X7MG9OLZGkxMNrvKsmvWXhx4T4lX2oixCyxwi2OM/CmLPb6DVHU+W9coqu/C1DeVoX
	OXKBmGwbmy/4xleawxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LRY-0000000Bohp-1EhS;
	Wed, 11 Mar 2026 15:25:52 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LRU-0000000Bofd-3kUf
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 15:25:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 73A5C4E4261D
	for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2026 15:25:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A7B460004;
	Wed, 11 Mar 2026 15:25:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8290210369D00;
	Wed, 11 Mar 2026 16:25:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773242745; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gaR4eOVvsNw2/nWa+whtGSNJLjMrciNjpMuluuy5o6U=;
	b=WDPUMJLKJomNAQPMnjdL2I7BxBkfwFK+iVMsOlkybxj9+YkxktsoL43sjjKim1mMfiEaVG
	sR/OEqM93F/0KduG7RFdIpBHniqkfgaKGLWqLzdLF5sB/vBMfo6ZZ2grg+jviihLRxPj/b
	zId6BCbBdad+NDFJ6CVIfGfwt9EHvHXoTTm+aINh3tYJoINaw7x6a6mJq8+xSv/kufyoe4
	eKfWW9VY9weLnZsn5ci1DpcwmLvnW5kbp+AQFnXy9abKg+5veyNbZ85pkD4xcjlEutZpw3
	k2rEibOT8ca5fULR7nohngOQ6mFK/TZSL9R8fquXPPF0RfkpooELvaT4qPEvDQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20260309-mtd-virt-concat-fix-kdoc-v1-1-7028579b944a@bootlin.com>
References: <20260309-mtd-virt-concat-fix-kdoc-v1-1-7028579b944a@bootlin.com>
Subject: Re: [PATCH] mtd: virt_concat: fix kdoc text
Message-Id: <177324274434.685435.2585720366835129972.b4-ty@bootlin.com>
Date: Wed, 11 Mar 2026 16:25:44 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_082549_083077_3E21507C 
X-CRM114-Status: UNSURE (   7.56  )
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

T24gTW9uLCAwOSBNYXIgMjAyNiAyMjoxNzo0OCArMDEwMCwgTHVjYSBDZXJlc29saSB3cm90ZToK
PiBUaGUgZnVuY3Rpb24gbmFtZSBpbiB0aGUga2RvYyBjb21tZW50IGlzIGRpZmZlcmVudCBmcm9t
IHRoZSBuYW1lIG9mIHRoZQo+IGZ1bmN0aW9uIGJlaW5nIGRvY3VtZW50ZWQsIGZpeCBpdC4KPiAK
PiAKCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogdmlydF9jb25jYXQ6
IGZpeCBrZG9jIHRleHQKICAgICAgY29tbWl0OiA4N2Q4ZjEyODU0NzBiM2M4MzY3ODgwOTkzMTEz
ZWE2MDRkMzY1ZTMzCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXgu
Z2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9i
b3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
