Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EE260A3816
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 14:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lV1XeAg3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=i4rxdppC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UCNYMXaJc/cILeVxgST+gnBXk0m/gigy7m/8JRGQ6iM=; b=lV1XeAg3yKQOijPyqKVdpdz4u4
	vpdfuckeOQDaWVdNi60NFX3Vj3OU4nDH1Dkbjhe331JY94t8ywYrFwvr0EMwsqbto17cJbh47Q59r
	KP4a3NMzdgzOCj44wh4ca4HS/nhnyZxoJH5T/op4p2WMAMu5rdQd2UrDyRK4wdx0eDYnchrjPNk87
	q8X5f1IqvueYloC0oW/O8GPpJd9kfIBJ4s09UnZwkZ3ntdj2SqPQsPPD91LuipUo556aNtgydMaXF
	luaERPz2P+ORQdvRKdoE2K/afbpTL82grFQSdAAMFDIkjfTPrRxTLtO2C/iFVQ+ZG/mzAL9OrEYPj
	/w4+7lKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5r-000000066p2-0cR4;
	Tue, 17 Nov 2026 14:23:31 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5j-000000066eV-0W9H
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 14:23:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A77C81A167E;
	Tue, 17 Nov 2026 14:23:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D30B5FD6A;
	Tue, 17 Nov 2026 14:23:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3333111BC0041;
	Tue, 17 Nov 2026 15:23:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925400; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6WQMx50c6/HUXnMlaTSPMugwkj2McUSU1kPMIyMEHsw=;
	b=i4rxdppCKk1vAV1bBDPISu2sjhV/O07pkl3hWlxjoWPLCOJxe2H3awTDdtMHSzYR1sR72m
	6tnMAHr6C6gOyeelGfpnJSRe6/mgeU2KYHIKgBn47b6ymsa2fPMZK8qXehQWZJUes830Sj
	2ULJEn+uqisojbvAhQXBbLDOhtluiKYyOCHfeXO6Oydd8n21mN7G5lTOw/1vXbGWJphBYk
	PJmNCdInFgHIQ/4so57R+7cMitL7aPvr/KFKNtD+YZI4MF28GL6MjjhMs2QwFkx/8C1hsL
	eq5SMKM+hiD+6r2vHLBAnbJqRLdSh0N/Q/y6sEtoZoi1YhAHojuqy6vv062vcw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: han.xu@nxp.com, Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: richard@nod.at, daniel.baluta@nxp.com, vigneshr@ti.com, 
 imx@lists.linux.dev, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261105095935.159650-1-stefan.ghetu@nxp.com>
References: <20261105095935.159650-1-stefan.ghetu@nxp.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: Fix unintentional integer overflow
Message-Id: <179492539910.2259780.13383890149441799128.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_062323_307434_6D793060 
X-CRM114-Status: UNSURE (   6.36  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCAwNSBOb3YgMjAyNiAxMTo1OTozNSArMDIwMCwgU3RlZmFuIEdoZXR1IHdyb3RlOgo+
IENhc3QgYmxvY2sgdG8gbG9mZl90IGJlZm9yZSBzaGlmdGluZywgc28gdGhhdCB0aGUgc2hpZnQg
aXMgZG9uZSBpbgo+IDY0LWJpdCBhcml0aG1ldGljIGFuZCB0aGUgcG90ZW50aWFsIGludGVnZXIg
b3ZlcmZsb3cgaXMgYXZvaWRlZC4KPiBSZXBvcnRlZCBieSBDb3Zlcml0eS4KPiAKPiAKCkFwcGxp
ZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IGdwbWk6IEZpeCB1
bmludGVudGlvbmFsIGludGVnZXIgb3ZlcmZsb3cKICAgICAgY29tbWl0OiAzYjk1NWFhNjc1MzQ1
Y2Y0OTRhNjdmOTVmMGNmOTFlZmYzM2MxODY2CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJs
ZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3Zp
ZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1
w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
