Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B22606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zg0UfRVS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xDtsy/Rf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ftDqqyOGQrjKTPts4XO3d2gqTJbKBHNWhTSEtd8mwzE=; b=Zg0UfRVSai060rUeGZG9ykfnNN
	7oZmlPmaGg7pzABlriG+uTVXw/SWl/QDBetbNwKOpH53PzZcQeuUICPREAWD2OPuzjiLxWzsXRwKj
	V+aCuqCnIWZBb7SYTLYxxVaBOl4r4WHGrMqOS42DHbc2gdpGHOYa5gOoOo3/GVB8UOAaXfj6+Xu+9
	sWgtWLaoi4EVIjdvJV41riu57BRoxwDfwGPoTrYY/U9T/0RIBEgQZOwK9NtUO4xOUr0e6qPcqFAax
	LByVP8BkCRKiZ9M2FL6VDQUzW0dfJDmpzNnrVaaADQauYuEQwljAWLl1xnX+/bQXL7PPpQ3gcW2TB
	TdeSdD9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJ72-00000005u8r-467E;
	Tue, 17 Nov 2026 13:20:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJ70-00000005u8H-3foR
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 13:20:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1C2654E4156A;
	Tue, 17 Nov 2026 13:20:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC5EE5FC81;
	Tue, 17 Nov 2026 13:20:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0D7411BC0008;
	Tue, 17 Nov 2026 14:20:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794921636; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=as2bP3qIug0TDDXT95nQC48G4K/EWHj8XpcUK6G72ho=;
	b=xDtsy/RfXW1rUgZURt3srXiISdfAUzV46xtUr5eD2JdSXO0u/PByxGeagxdYtT+9hkb3lG
	1yWTeBzkOQ1UIUJDqjyWKRdlnkzvnF0WdGtvpb2qNlPHQZUG9YZCXnI4ZZRo+u1gkjHxBA
	yHuHfu58h/JRzEvUyy1P9Eyan7snapLIxjlciANVXY/4duFFyXoFyd5liCVxPB8LBgDSzB
	IHuyrhKhJ3FOwS3GnQG3AUGBL70A6DQ2NbLOXRQFqE78cIedLv0gMS6Ks+JAKEq9Cb7qDL
	0QWfOfNJaOB2eWaQu7l5J+prIDJ2odbbH/U/I0QPAKPup+5fKBfgQkLpxJBTOA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: <richard@nod.at>,  <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: mtdpart: convert printk to pr_* and define pr_fmt
In-Reply-To: <20261013082352.5051-2-mihai.sain@microchip.com> (Mihai Sain's
	message of "Tue, 13 Oct 2026 11:23:43 +0300")
References: <20261013082352.5051-2-mihai.sain@microchip.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 14:20:33 +0100
Message-ID: <87se0zlhlq.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_052039_049888_1704211F 
X-CRM114-Status: UNSURE (   4.93  )
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

SGkgTWloYWksCgpPbiAxMy8xMC8yMDI2IGF0IDExOjIzOjQzICswMywgTWloYWkgU2FpbiA8bWlo
YWkuc2FpbkBtaWNyb2NoaXAuY29tPiB3cm90ZToKCj4gRGVmaW5lIHByX2ZtdCB0byBwcmVmaXgg
YWxsIHByXyogcHJpbnQgc3RhdGVtZW50cyBpbiB0aGlzIGZpbGUgd2l0aAo+ICJtdGQ6ICIuIENv
bnZlcnQgbGVnYWN5IHByaW50aygpIGludm9jYXRpb25zIHRvIHRoZWlyIG1vZGVybiBwcl9lcnIo
KSwKPiBwcl93YXJuKCksIGFuZCBwcl9ub3RpY2UoKSBlcXVpdmFsZW50cyBzbyB0aGF0IHRoZSBw
cmVmaXggYXBwbGllcwo+IGNvbnNpc3RlbnRseSBhY3Jvc3MgYWxsIGxvZ3MuCgpZb3VyIGNoYW5n
ZSBicmVha3MgYWxpZ25tZW50cyB3aXRoIHBhcmVudGhlc2lzLiBQbGVhc2UgcnVuCmNoZWNrcGF0
Y2gucGwsIHlvdSdsbCBzZWUgdGhlbS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
