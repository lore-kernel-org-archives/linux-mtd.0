Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F93606A324
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 12:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YrBBIGU2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TX71ySiD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=glYQjr/28YOrcdiecbKSFKAR4dHJMnqHfxZpQhXAZXk=; b=YrBBIGU27KVtqWfgkPf/xJu1nK
	tI7C69BCt2BM+3mQRnIysPy9MkVKL8x51eeASRAw3WhCxwSm8ejHm2AUV1s9+2zbCHlb0MipLGCF5
	lAu3qhkOUHC4+Vg9v8v5ZQVGJ5qNC4gIVQXv5pPQO44W1ltGMKwdMxtrFIK7+9CP0KlftIc3bcCJH
	WuRKEXn4Ki1+sAcbyxcGvus3qemRVyXHvZMG90pdUFWM4VgyagJXfpgSro1VnanB8APuI4TaGojnB
	LQeDYerQKAUJTBCZeHbs6WpcIrMkbBJmzq8Z+JHN4FK+vXRbMo3aG7E7Ddnr4NHdDoKr/S/JZt0jb
	poaNQVIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvRj-0000000GC6h-1YTj;
	Fri, 27 Nov 2026 12:52:59 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvRg-0000000GC5c-2A8T
	for linux-mtd@lists.infradead.org;
	Fri, 27 Nov 2026 12:52:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4044F1A1836;
	Fri, 27 Nov 2026 12:52:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B8736049C;
	Fri, 27 Nov 2026 12:52:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51CA311E685B7;
	Fri, 27 Nov 2026 13:52:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795783971; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kdsz/cTo8c6uWKeIMZKLzgXvIjfdgd2reyR2+XDYsRw=;
	b=TX71ySiD4ci5ER7xxCGYjHEFyC3KA2DYUhkPZjYegw7X/LWIl6E+mSCQVCHMB635fXwqZj
	K/PWN+Q1Hj76frSMW8e5QE+/A089Emgl290E3iDv/GDOJeM1V2qEveuCaPw8vU1ULFJfUm
	geny3KHiOMlpne0YpYj4eT9OCqrAMGW64T7nN7N8dLuzPL40RVW2MxgVSscipl9FxOqomd
	mxC1f1P8MleF5zz/TwQJugZqKv6bmXxAMH14kIcTn00S+U0vwAeXdtSdyo0pbS7vQ+CHBt
	MrlbnFI9b1kU4oe+PGv84fvGIVxEhgDiuBW2gJJ0dIaih99NU+I/DmUEZDEGMg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Teng Wu <gigadevice2025@gmail.com>
Cc: linux-mtd@lists.infradead.org,  vigneshr@ti.com,  richard@nod.at,
  linux-kernel@vger.kernel.org,  teng.wu@gigadevice.com,
  weijie.huang@gigadevice.com
Subject: Re: [PATCH] mtd: rawnand: Skip timing mode readback check for
 GigaDevice NAND
In-Reply-To: <awl2bMa2cqHZWfD-@Fantast-WT.localdomain> (Teng Wu's message of
	"Fri, 27 Nov 2026 20:24:12 +0800")
References: <awWLzWDg-m9VBZVr@Fantast-WT.localdomain>
	<87qzgas5yv.fsf@bootlin.com> <awl2bMa2cqHZWfD-@Fantast-WT.localdomain>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 27 Nov 2026 13:52:47 +0100
Message-ID: <87ik1itp0g.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_045256_716530_BCD70460 
X-CRM114-Status: UNSURE (   9.57  )
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

SGkgVGVuZywKCj4gSSBhZ3JlZSB0aGF0IHZlbmRvci1zcGVjaWZpYyB3b3JrYXJvdW5kcyBkbyBu
b3QgYmVsb25nIGluIG5hbmRfYmFzZS5jLiAKPiBBZGRpbmcgYSBkZWRpY2F0ZWQgbmFuZF9naWdh
ZGV2aWNlLmMgd291bGQgYmUgYSBzdWJzdGFudGlhbCBwaWVjZSBvZiAKPiB3b3JrIGFuZCBpcyBv
dXRzaWRlIHRoZSBzY29wZSBvZiB0aGlzIGVmZm9ydC5JIHVuZGVyc3RhbmQgaWYgdGhpcyBwYXRj
aAo+IGlzIHJlamVjdGVkLCBhbmQgSSB3aWxsIGRyb3AgaXQgZm9yIG5vdy4gCj4KPiBUaGF0IHNh
aWQsIGlmIHRoZXJlIGlzIGEgc2lnbmlmaWNhbnQgZnV0dXJlIG5lZWQgdG8gYWRkIG5hbmRfZ2ln
YWRldmljZS5jLAo+IHdlIHdpbGwgcmVmZXIgYmFjayB0byB0aGUgY2hhbmdlcyBpbiB0aGlzIHBh
dGNoLgoKWW91IG5lZWQgYSBuYW5kX21hbnVmYWN0dXJlcl9vcHMgKDQgbGluZXMpIGFuZCBpbXBs
ZW1lbnQgdGhlIGFib3ZlIGZpeAppbiB0aGUgaW5pdCBob29rIGFmdGVyIGNvcHktcGFzdGluZyB0
aGUgcGF0dGVybiBmcm9tIGFub3RoZXIgdmVuZG9yCmRyaXZlci4gVGhlbiBhZGQgdGhhdCBmaWxl
IHRvIHRoZSBNYWtlZmlsZSBhbmQgcmVmZXIgdG8gaXQgaW4gdGhlIGNvcmUncwppbmNsdWRlcy4g
SG9uZXN0bHkgbm90IHdoYXQgSSB3b3VsZCBjYWxsIGEgInN1YnN0YW50aWFsIHBpZWNlIG9mIHdv
cmsiIDopCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
