Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A09606A326
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 11:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hr+U1xPY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=C+h+G0n9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o0mg9Db4X0rQvJihCTYGh4t6r+JdRJgIiBerZL60nlw=; b=hr+U1xPYdfPj9idDuyLObrdEuI
	tJBzGN26HP+AG3tDXJcJ8MjHgcNXP5lxM/DLmgzOOmZ+JLo7WW4Y9B34Y50DbzlzX9rwXGIoVPBVS
	qeVd7r/0miXlx9wTfOOTd3u1cQIiOYrn/lfiUQ028YuqvJwUhkYQJEZn3lGkBZWkqrrV1m9n9lh1J
	7iZjLetIEsdwAniygryGI4GBmWBUfWi4ASsqLp4ef+qM+5rp1bh1T796mjSorJQ6v+eyNicZc6qJy
	+EKhPIbXfJziyGXAVkclvuV900W1ttZfkYJxFsu6pfWPQ0+y8+wN4vqOpnl255I6FYJY+Cw/PRGU5
	fYPRG4HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXGg-0000000Co6Z-2uu8;
	Thu, 26 Nov 2026 11:03:58 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXGE-0000000Cnjj-0kGa
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 11:03:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1B55DC2B9C7;
	Thu, 26 Nov 2026 11:03:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFEC560237;
	Thu, 26 Nov 2026 11:03:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CE2711E6B324;
	Thu, 26 Nov 2026 12:03:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795691007; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=npSdeVNnEXo0fDaSskw+IfPzWwdyEZ0iRyxES/k6S44=;
	b=C+h+G0n9mX/mNGp0csm/ZEJBKWuiiM+J//gekf9DIuq+MESc/W++D4MYhgl+EsGx93Re/J
	O8XFCxeOmyzAADrMFX9/5TokBtaN+XDmpiU5TDPQDPnOd+GhDoOZ7U3hnizImaKsJVMEev
	ewr1rJ131MK1T38yvCaxOpNc522jX18vt4Kh6fDKXY9gZbtdfntpLmnS6yQBiwU2K5dts7
	0tFlnMcgz6e/oqiszhpE1kYkyC0oCjzFcPx8PdPBFuY+Vs7FW0YbSOH7qT3PchQtmoGprU
	1pIPC8j+tMm6QetcsNEJtpdZOPvcL7A0bT5yQeiu2dKOjVgE1wsttdKJ7wsCkw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ping Li <leeonion.muyu@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
In-Reply-To: <20261126060216.3155872-1-leeonion.muyu@gmail.com> (Ping Li's
	message of "Thu, 26 Nov 2026 14:02:16 +0800")
References: <87cxrtyss2.fsf@bootlin.com>
	<20261126060216.3155872-1-leeonion.muyu@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 12:03:25 +0100
Message-ID: <878q2fyhvm.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_030330_374866_72FC89A6 
X-CRM114-Status: GOOD (  11.49  )
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

T24gMjYvMTEvMjAyNiBhdCAxNDowMjoxNiArMDgsIFBpbmcgTGkgPGxlZW9uaW9uLm11eXVAZ21h
aWwuY29tPiB3cm90ZToKCj4gRnJvbTogbGVlb25pb24ubXV5dUBnbWFpbC5jb20KPgo+IEhpIE1p
cXVlbCwKPgo+PiBXYXNuJ3QgaW4gdGhpcyBkcml2ZXIgYSBib3VuY2UgYnVmZmVyaW5nIG9wZXJh
dGlvbiB0aGF0IGlzIG5vCj4+IGxvbmdlciBuZWVkZWQ/Cj4KPiBXaXRoIG91ciBwYXRjaCBpbiBw
bGFjZSwgYSB2bWFsbG9jJ2QgYnVmZmVyIG5vdyBnZXRzIGJvdW5jZWQgYnkKPiB0aGUgY29yZSB0
aHJvdWdoIGNoaXAtPmRhdGFfYnVmLiAgQnV0IGRhdGFfYnVmIGNvbWVzIGZyb20gYSBiYXJlCj4g
a21hbGxvYygpLCBhbmQga21hbGxvYygpIGRvZXMgbm90IGd1YXJhbnRlZSB0aGUgcmV0dXJuZWQg
YWRkcmVzcwo+IHRvIGJlIDUxMi1hbGlnbmVkICh3aXRoIFNMVUIgZGVidWcgb3B0aW9ucywgZm9y
IGluc3RhbmNlLCB0aGUKPiByZWR6b25lIHBhZGRpbmcgc2hpZnRzIHRoZSBvYmplY3QgcGxhY2Vt
ZW50KS4gIFNvIHRoZSBjaGVjayBpbgo+IHI4NTJfZG9fZG1hKCkgLS0gKHVuc2lnbmVkIGxvbmcp
YnVmICYgKFI4NTJfRE1BX0xFTiAtIDEpIC0tIHN0aWxsCj4gaGFzIHNvbWV0aGluZyB0byBjYXRj
aCwgYW5kIEkgYmVsaWV2ZSBpdCBjYW5ub3QgYmUgcmVtb3ZlZC4KPgo+IFRoZSBzZWNvbmQgcmVh
c29uIHRvIGtlZXAgaXQgaXMgdGhhdCB0aGUgbG9jYWwgYm91bmNlIGlzIGFsc28gdGhlCj4gZmFs
bGJhY2sgd2hlbiBkbWFfbWFwX3NpbmdsZSgpIGZhaWxzLgoKT2suCgpQbGVhc2UgZG8gbm90IHNl
bmQgbmV3IGl0ZXJhdGlvbnMgaW4gcmVzcG9uc2VzIG9mIHlvdXIgcHJldmlvdXMKcGF0Y2hzZXQu
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
