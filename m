Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CC8606A31D
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ffSq5FWk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HQxupqJW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5G0yLzl46x9+g4PumVxrmksB0LAQiJvVXDt6HqNjhyk=; b=ffSq5FWkjKaowFx5X1RKn7RAAG
	+kfJCProIHcc2pyFeyGOeul55Y3siuaesNus+xCoXoQfQIwQGZcR6hDTjhjH/f6CujBGolO7X4v2J
	yvGdHy8bUQub0hn2WYCfWjwGJzozvWCE4OgIxvHCM99oSkuAgDF9CFB0tWzUF+LJoixuvtwKvmHta
	vM79rsO10bPyjz0PHCPpF0sNMRsZeGExfoF72vk9RShAhU78+6QTvPr4HzVhGmvp+r3OPNDIP/R3r
	/fstnR/YVZ8rwIz5Xv+WEge110hVql7gQsLCy2TkJvG3cqSp1iQWc8r49nf8uE9wIpenkpUBRR6Sh
	jlBG05gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiKk-0000000BANS-2TOq;
	Fri, 30 Oct 2026 08:51:34 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiKg-0000000BALc-2CGt
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 08:51:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C07124E413A0;
	Fri, 30 Oct 2026 08:51:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9319E603C2;
	Fri, 30 Oct 2026 08:51:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F6C6103286AD;
	Fri, 30 Oct 2026 09:51:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793350284; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wZVbk57gT2iqyu8IKrJI6vssVo5jjwGVzOMOSn3tWns=;
	b=HQxupqJW+fseP2wr4JcoiD8kkAgEsL36SqXmMgkKePufVwvdnfTRAhIXjuNsxodj9YUSgR
	rboNip63vFtBCj5OgSL8YA5A+t4jFwHfNV8xJ/bK3CWiQGiOeKJllv8YzDeqmWzUenc5Bv
	teC4ejZ54Wp48XrpXYvuwNM40xFmeomrax3PgMajAyZn0gT8wOm8kADsjwvwH9YuHL2VI+
	AjwQy2hlqYCoAvexOJclGq9525HIcKOW27CaoBb0Nl5U2341pdh7B4m5bv9+gbfNbl2Li9
	MVlzbHo4qF9dfutC3Lhef7spAjR30dJ/be/dNbgXDxzA9kzrZ+MZ7wjZCNSlJQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Martin
 Kurbanov <mmkurbanov@salutedevices.com>,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: Re: [PATCH RESEND v5 3/3] mtd: spinand: repeat reading in regular
 mode if continuous reading fails
In-Reply-To: <73cc1302-d1fa-4c32-b6ed-4c44cd48ad39@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Fri, 30 Oct 2026 10:37:25 +0300")
References: <20250917215401.19132-1-mikhail.kshevetskiy@iopsys.eu>
	<20250917215401.19132-4-mikhail.kshevetskiy@iopsys.eu>
	<87mrrwebxh.fsf@bootlin.com>
	<73cc1302-d1fa-4c32-b6ed-4c44cd48ad39@iopsys.eu>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 30 Oct 2026 09:51:19 +0100
Message-ID: <87h5i3eflk.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_015130_702877_3E80AA16 
X-CRM114-Status: UNSURE (   5.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMzAvMTAvMjAyNiBhdCAxMDozNzoyNSArMDMsIE1pa2hhaWwgS3NoZXZldHNraXkgPG1pa2hh
aWwua3NoZXZldHNraXlAaW9wc3lzLmV1PiB3cm90ZToKCj4gSGkgTWlxdWVsLAo+IEkgdGhpbmsg
c3BpLW1lbSBjYXBhYmlsaXR5IGZvciBjb250aW51b3VzIHJlYWQgc3VwcG9ydCBpcyB0aGUgYmVz
dAo+IHNvbHV0aW9uLgoKR3JlYXQsIHRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrIQoKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
