Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024E5606A8AB
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 14:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u8nUAvnD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rEgKSgR3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qzuk1o/bYtjJp3n7KelCQX2QxifyG9C/HpTC8l+QqJk=; b=u8nUAvnD7j3Tb4Xp+p1AW3ZfZe
	pvcbQEVr4azwscfPUQIqwcst97NqyOWoBX1LV+hsNGcIOsQAadhX/ZphdW9TGqtJ29Gbga41RXcM3
	OmKrRd5nSHSH4rn31R6iaFSWmhAKDuzfALNKi8N5IwtAGa5SfnWbjFQkLReWIituGg6iUlJD8nPyR
	8hohy6AvR4vrsnneoKrRHKpyVm7Z33qvD+GQZMo+ikuYqrRUvefSDHQqo7wBWHW1pMHDZ1+PDN8Ib
	cjrzmZY3s5i23LDCcheYjJbzysxXBbNJkPwMFYEoQQtkeoj3nhKzxdJvSy0pJhYrPTZD4NhZnemIa
	TR65VUpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5g-000000066cV-2vfi;
	Tue, 17 Nov 2026 14:23:20 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5c-000000066Z7-2sZX
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 14:23:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D7937C79A9B;
	Tue, 17 Nov 2026 14:23:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73E7F5FD6A;
	Tue, 17 Nov 2026 14:23:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9011C11BC0036;
	Tue, 17 Nov 2026 15:23:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925394; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lDjARk/TKyIY+6gtL116fhoYJSM5rMVECdu6F8I4r+4=;
	b=rEgKSgR3HmsgCjrD9Glac4eEYmkrmRhJo9Wlm1GNMOYokEdZXKiMTvUNhvsySo7//fyWfU
	L7hP6iftSft1hD63K5jGUrlAy7rfgWajarckzBqtigwGvjfHAP0xdnb++nz9tV01eS8xuZ
	jX4PVtxc6dUTgbXMVopp3uBjSX6UbFIkGJzOCvXAnej4phm8iRzpbN69lgHZW0FBCuQwyg
	aOp1Vn19CVePK98+zpyuZKLVlwosthW5mCH4C1AGfQCjVlOS5DbCjOt2XUXdKpai/kXx87
	8J7IeA+245B1HRawhIhSLTwL/22jDo94KiodcsCCUzmMHJdi346mFonDGX+VHg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261013224134.42967-1-rosenp@gmail.com>
References: <20261013224134.42967-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: fsl_ifc: drop unused controller chips
 array
Message-Id: <179492539251.2259780.17318669528209958816.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_062316_889028_44204ADD 
X-CRM114-Status: UNSURE (   6.86  )
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

T24gVHVlLCAxMyBPY3QgMjAyNiAxNTo0MTozNCAtMDcwMCwgUm9zZW4gUGVuZXYgd3JvdGU6Cj4g
VGhlIGNoaXBzW10gYXJyYXkgaW4gc3RydWN0IGZzbF9pZmNfbmFuZF9jdHJsIGlzIG9ubHkgZXZl
ciB3cml0dGVuIHRvLAo+IG5ldmVyIHJlYWQuICBSZW1vdmUgdGhlIGFycmF5LCB0aGUgZnNsX2lm
Y19jaGlwX3JlbW92ZSgpIGZ1bmN0aW9uIHRoYXQKPiBjbGVhcmVkIGl0LCBhbmQgaXRzIGNhbGxl
cnMgaW4gcHJvYmUgYW5kIHJlbW92ZS4KPiAKPiAKCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFu
a3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IGZzbF9pZmM6IGRyb3AgdW51c2VkIGNvbnRyb2xsZXIg
Y2hpcHMgYXJyYXkKICAgICAgY29tbWl0OiBhODQ2MDljZDVkNTBkN2UyMWJkZmNjMzk3YjM2Nzdl
MDRmNDgyMWZhCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0
IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3Qg
Y29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
