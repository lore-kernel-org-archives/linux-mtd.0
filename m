Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3545606A33C
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 15:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e3EjOAtg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vF5PatK9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tiinxDMqZxMnNuE5C577HvWK/lvoOl8yBMlPaTDndss=; b=e3EjOAtgUpDTf0xcmosWa8OLoh
	fUxjU53gEgm3VA73VYLUULJbA9RdxQZLsvvpKf96jo6LDjWWZe73beU2Iw/hIsYwsIlvw+mJIMywi
	hlJg1yGYpEUySBRPEKZaGJYwFvA76hjMGgO1MBYmIQQ3cXnJkDXAzNcWVAjYWAn/48o9DM8PfaosM
	0WptHqVIquEfMIIrg3+aocKrznPibIoAK+GB2F4k2BdNPCCNUqB4EWUSY1NjxWENn3q/4xPZ2J9+F
	WHc0yM2ZilTAWee9d2M3ljSVbj0NBwy+eu5xnzVcjlQNfE1WbptaH7hNOc04bHeZ7qn1Lxr8Z1XpO
	jPnZ2R2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ9o-0000000FLiX-2lrN;
	Fri, 20 Nov 2026 15:04:08 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ9h-0000000FLfe-0aoq
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 15:04:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AA34E1A174F;
	Fri, 20 Nov 2026 15:03:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77572601B9;
	Fri, 20 Nov 2026 15:03:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9636B11BC02EB;
	Fri, 20 Nov 2026 16:03:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795187038; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PPlgudp8kDoJrGMgm5LS5TFYAYMRC1AIU9IQdrQKlfc=;
	b=vF5PatK9+yan2jGusie8MfaHibhqHKzP8xWR3hC/VYtA/s+jg1dYmo59YA1s0ECkKMg3GX
	lZiZHWOMmZDrCU2nntBKiNMiKdaBugPjycIrWd2LQLWGTYyCH6vqkvUwjgTP7lk2Tf2Kha
	05oLrv7beJkBHPZpkAx6zhnSp/Dd3rDFlo6wqpvvm/eP0LukNITz7sVaJmKiBjNLynJc46
	EoycnSkkEGFZh3axC7C7HJoOvYN1kxCMTXdIZ904T7h/2gQ4A6+BeMSn8Zmc574+lvjYwF
	bELZKZWpuRPk/1d4v/oqTaCARHEfQwxeAT8xYhGMkWHYaC0amhyFgdzjltkVfA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261108-submit-intel-nand-probe-disable-v1-v1-1-eb0471429e09@gmail.com>
References: <20261108-submit-intel-nand-probe-disable-v1-v1-1-eb0471429e09@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: intel: disable NAND when probe fails
 after scanning
Message-Id: <179518703726.3404688.15982261234436640386.b4-ty@bootlin.com>
Date: Fri, 20 Nov 2026 16:03:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_070401_414621_3EA611EE 
X-CRM114-Status: UNSURE (   5.52  )
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

T24gU3VuLCAwOCBOb3YgMjAyNiAxNDowNToxNyAtMDcwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6
Cj4gT3BlcmF0aW9ucyBpc3N1ZWQgYnkgbmFuZF9zY2FuKCkgZW5hYmxlIE5BTkQgbW9kZSBpbiBF
QlVfTkFORF9DT04gdGhyb3VnaAo+IGVidV9zZWxlY3RfY2hpcCgpLiBBIGZhaWxlZCBzY2FuIG9y
IE1URCByZWdpc3RyYXRpb24gcmVsZWFzZXMgdGhlIERNQQo+IGNoYW5uZWxzIGFuZCBvdGhlciBw
cm9iZSByZXNvdXJjZXMgd2l0aG91dCBjbGVhcmluZyB0aGF0IGVuYWJsZSBiaXQuCj4gCj4gRGlz
YWJsZSBOQU5EIG1vZGUgb24gYm90aCBlcnJvciBwYXRocywgYXMgdGhlIHJlbW92YWwgcGF0aCBh
bHJlYWR5IGRvZXMuCj4gS2VlcCBmYWlsdXJlcyBiZWZvcmUgc2Nhbm5pbmcgb24gdGhlaXIgZXhp
c3RpbmcgY2xlYW51cCBwYXRoLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhh
bmtzIQoKWzEvMV0gbXRkOiByYXduYW5kOiBpbnRlbDogZGlzYWJsZSBOQU5EIHdoZW4gcHJvYmUg
ZmFpbHMgYWZ0ZXIgc2Nhbm5pbmcKICAgICAgY29tbWl0OiA3ZWE2NzM2ZWViMDFlNWY4NzAzZmJi
Zjk1NjIwYTVmNTJmNDlmZDE5CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQv
bGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQg
bm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
