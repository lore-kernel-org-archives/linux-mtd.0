Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8C5606A882
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 14:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q9BhLA3R;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1q1S9Pd7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qk4tgURUWU/IzMbJqsUtgrOu0TXsctTUmcEoOLBWg3Q=; b=q9BhLA3RRLgmonNR2mqD+Ht3Wh
	pst13v7JtmunEni/jlB4fNDlnlG7teQmRzs8Yq3h+PX+hxlPG8bPzMwS7TJAFOVYIGzcStOfcCpY+
	SIBkILB/seZzpQMjTapcwtd2r1+qjTQCF6qgiQdJD341ois1Sro8jrf9fJ1Jr/scgxPnF/OaCeFe1
	2sN/NMObvvw3TQe1j2uXnAdaFKJPJjtL9V7bZY+KloskbaQO1i6mk4alzvzudEoKIJy4tznUQYokk
	wylhRnMRo33pqhIA9Twc4QjBqzslS2+U8H4OeM+0W+6ci5vW8NUjSQHakngML0A35Az9Zlt+SfZ6v
	xB2+rfyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5t-000000066sw-0tF7;
	Tue, 17 Nov 2026 14:23:33 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5o-000000066lX-3Odi
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 14:23:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3E62A4E4157D;
	Tue, 17 Nov 2026 14:23:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 120E55FD6A;
	Tue, 17 Nov 2026 14:23:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B0D011BC0039;
	Tue, 17 Nov 2026 15:23:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925405; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XtFQDcwceQa3Sr+OhE1k+wWRHerfk4qk4lkJyg2kfJo=;
	b=1q1S9Pd77qyl4ks/rAZs4tWBzzKJxwbhs+GjdlKzNE8v8VfwmKF1gAM4tm+wT0HKqXcAI8
	V85azkHVlxyod7PF09JjNMsoOJcva5H4RmM0O9j269IgEIWVqqsjN9q2t52UD2l+Pt+Rba
	fGgerv2m2bVMgqfC3zwj7QEe38Clb9aL0GNUHpXkOwI/CzSrkE28jExKHZM51eC/e9M3I5
	XVTsoW4/jxNOIsB0teTHQ++StlGA6+fp+3tSLe+8N9qIiCkIiblYqh6LUj/14ctV8D/8lZ
	olnCiWeeX8ixtcvqSdcQJW7OSR/fmDNkexg9nNNHhdgJGQMCsn2h7SfendL1Aw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Frank Li <Frank.Li@nxp.com>, 
 Alok Tiwari <alok.a.tiwari@oracle.com>, Runyu Xiao <runyu.xiao@seu.edu.cn>, 
 Chen Ni <nichen@iscas.ac.cn>, Kees Cook <kees+treewide@kernel.org>, 
 Hemanth Selam <hemanth.selam@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev
In-Reply-To: <20261111202502.3860647-1-Frank.Li@oss.nxp.com>
References: <20261111202502.3860647-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] mtd: nand: raw: use dmaengine accessor API
 functions
Message-Id: <179492540302.2259780.2818998667835752553.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_062329_638408_B3B75539 
X-CRM114-Status: UNSURE (   8.15  )
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

T24gV2VkLCAxMSBOb3YgMjAyNiAxNToyNDo0NSAtMDUwMCwgRnJhbmsuTGlAb3NzLm54cC5jb20g
d3JvdGU6Cj4gVXNlIGRtYWVuZ2luZV9nZXRfZG1hX2RldmljZSgpIGluc3RlYWQgb2YgZGlyZWN0
bHkgYWNjZXNzaW5nIGNoYW4tPmRldmljZQo+IGFuZCB1c2UgZG1hZW5naW5lX3ByZXBfZG1hX21l
bWNweSgpIGluc3RlYWQgb2YgY2FsbGluZyB0aGUgZnVuY3Rpb24gcG9pbnRlcgo+IGRpcmVjdGx5
LiBUaGlzIGZvbGxvd3MgdGhlIGRtYWVuZ2luZSBBUEkgY29udmVudGlvbiBvZiB1c2luZyBhY2Nl
c3Nvcgo+IGhlbHBlcnMgdG8gZGVjb3VwbGUgZHJpdmVycyBmcm9tIGludGVybmFsIGRtYWVuZ2lu
ZSBzdHJ1Y3R1cmVzLgo+IAo+IEFmZmVjdHMgY2FkZW5jZS1uYW5kLWNvbnRyb2xsZXIgYW5kIGZz
bWNfbmFuZCBkcml2ZXJzLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtz
IQoKWzEvMV0gbXRkOiBuYW5kOiByYXc6IHVzZSBkbWFlbmdpbmUgYWNjZXNzb3IgQVBJIGZ1bmN0
aW9ucwogICAgICAobm8gY29tbWl0IGluZm8pCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJs
ZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3Zp
ZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1
w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
