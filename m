Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCC6CD342F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2026 07:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SW83s6KRsDr5JkbKZn2XbVqXrhx7k+CzILz+V3lXc8=; b=kOW9wevKsLbpWV
	XUVqPsPSBtKKEf6ypfAG6wsZwFpMun4NrP7mvaaO8TvM/3MA0unTEMUFHiqPhfnA/1M3G2iu987Ym
	MFtNJNqSZr1+uHfat+pi3RvkazmnHAipb9eCzKzGKuGRzmkW1LD1KcqxF3SE/fHfJaL29O2ar5Cyh
	D5Rbs2v6vvqjF3k1dMRg3H3wJMTXHTVwDsgOuSSUyp5bJtsHTlei4Fe78FhVL3pU2CL8qIAWYGM50
	9M5yT+L+eEnPZoLUiX/op87rH5yXRq0H3R9bvpeUrfgy/2iLRdj6atLZRSXJH8RDaCL2SxDqmfd+8
	5bm2ekeTHELp+uqultjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKAY3-0000000FRze-2whC;
	Tue, 05 May 2026 07:50:31 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKAY0-0000000FRy3-1tQf
	for linux-mtd@lists.infradead.org;
	Tue, 05 May 2026 07:50:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E7254C5D739;
	Tue,  5 May 2026 07:51:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 288D35FD9D;
	Tue,  5 May 2026 07:50:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20E3E11AD1006;
	Tue,  5 May 2026 09:50:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777967424; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LOLxxzEAMizK1N6MnTWd69181RhDona4ue7L+aw+YA8=;
	b=UsA7P2B8feoFxoCTKXhBTkhk9Xpie8FO9SW12TNXFxG38cUGVWBA/DPHiZhn4Lf9jNbIqA
	xGGEO636XKZGZy4PxuNOfQp+OhY/E/XcTQGx7IQsc3PTglvhxE1J0NdwePZS3jX1+BkrlP
	+PXW+SmIZ8OWLnw/vfU0CsLR9Hm4pwKm2tfqn++ON3N7rmHPgIrygIlYI9fiTiPumh0Sav
	wgMtlIwM1RGIk+8Id36bYpgqaITdlU//5tRPUx/oqIarewq8ZbUDuuicRlApSVYtF05FQM
	NK0DM8bi0CbesfTpdCgCVb6Ed4ae5Nd3Yh6JfcJNOpuZKmt/r8+VMIzNYuE5og==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@rulkc.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Frieder Schrempf <frieder.schrempf@kontron.de>,  Boris
 Brezillon <bbrezillon@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  rulkc@linuxtesting.org,
  oxffffaa@gmail.com,  stable@vger.kernel.org
Subject: Re: [PATCH v1] mtd: rawnand: fix condition in 'nand_select_target()'
In-Reply-To: <20260504221012.1310605-1-avkrasnov@rulkc.org> (Arseniy Krasnov's
	message of "Tue, 5 May 2026 01:10:12 +0300")
References: <20260504221012.1310605-1-avkrasnov@rulkc.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 05 May 2026 09:50:19 +0200
Message-ID: <87mryeqoqs.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_005028_943985_A3A532EE 
X-CRM114-Status: UNSURE (   4.40  )
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

SGksCgpPbiAwNS8wNS8yMDI2IGF0IDAxOjEwOjEyICswMywgQXJzZW5peSBLcmFzbm92IDxhdmty
YXNub3ZAcnVsa2Mub3JnPiB3cm90ZToKClR3byBpbXBvcnRhbnQgdHlwb3MgaW4gdGhlIGNvbW1p
dCBsb2cgOi0pCgo+ICdjcycgaGVyZSBtdXN0IGluIHJhbmdlIFswOm5hbmRkZXZfbnRhcmdldHMp
LgoKICAgICAgICAgICAgICAgIGJlICAgICAgICAgICAgICAgICAgICAgICAgICAgWwoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
