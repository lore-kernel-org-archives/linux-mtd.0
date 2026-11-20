Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B65E606BCBE
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=45mDC9NV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=u+RlR5X/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Bo7KYfNt4/xHDz4odO6AGjouA+ekJKB8g3QNy22wM4Q=; b=45mDC9NVlN0XAO/TOHBAI+YDXw
	aw2yjnbHUZK48UTPY9LVRD8QTJspxXEbvDRQZlGf62pQMVtOWFLEH6eHMjcBsuHJ30/zsPRC7I+dN
	16ekXDlff9yeIsQEZJNx2l60z9lvsldDthQRAbBA1UnUKHaZz+9zefD58LTFMrNxjZ1LcY6wCMC0U
	+4miAI+mM2SrO9DGvtzkOapD0pFUZEdvXQd+kZp0Tu85Y5UI3P1VRYkmEfeWtXJnRQVr2ungl3bC7
	7SdXEh3S1BWxnbUwVf+7VeHm8sVQs9mLt3ZXRn05i4M+Rf1Lev32aShTdWgeaanHcsRhk4V9WIl7V
	XOcidBDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ8h-0000000FLKD-3kNv;
	Fri, 20 Nov 2026 15:02:59 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ8a-0000000FLGe-2a8y
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 15:02:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 27F141A1750;
	Fri, 20 Nov 2026 15:02:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F185A601B9;
	Fri, 20 Nov 2026 15:02:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A43011BC0287;
	Fri, 20 Nov 2026 16:02:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795186970; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w2JNVqlywgOd3cbja4YeU0OvXBPq0KJjVEc5VZH0bak=;
	b=u+RlR5X/Uj6VONc0iRYDYVpdkcj0kNA1lDot50DNV2mar1BrEpZsOfJr4/O4yWwaW8o044
	3ejImhs/SKhlL8wsxgGHIMOa8/E3jNUu6D33IpC/S+nI/0+d58Kxmfiw18AXSZJeHQyTQv
	zjmwTgghiWqQ7IbK5SFpZmei2UphSMrGrH8mSlmSe+Rq6NukFQccwK1RjIT8Bc4jViJkgZ
	HCG7eShjD70zWQ/jlK2zB3627gtrK1Fjln5zjZPK0TCm7za/sjBkxU375N6V9f6f1Ppvo4
	B4RrsjArf9bjmOzLd91Apfp8blykd/vC6YbW9Yl0mfQLjALhn2YajrqZm8NRxA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261106-submit-mtdchar-read-stats-v1-v1-1-173ac5c3ceb0@gmail.com>
References: <20261106-submit-mtdchar-read-stats-v1-v1-1-173ac5c3ceb0@gmail.com>
Subject: Re: [PATCH] mtdchar: initialize MEMREAD statistics before each
 read
Message-Id: <179518696919.3401781.15182182480121919685.b4-ty@bootlin.com>
Date: Fri, 20 Nov 2026 16:02:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_070252_809749_7B9F5122 
X-CRM114-Status: UNSURE (   6.59  )
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

T24gRnJpLCAwNiBOb3YgMjAyNiAyMTozMToxOCAtMDcwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6
Cj4gbXRkX3JlYWRfb29iKCkgY2FuIHJlamVjdCBhbiBpbnZhbGlkIE9PQiByYW5nZSBiZWZvcmUg
aW5pdGlhbGl6aW5nCj4gb3BzLT5zdGF0cy4gbXRkY2hhcl9yZWFkX2lvY3RsKCkgbmV2ZXJ0aGVs
ZXNzIGFjY3VtdWxhdGVzIHRoZSBwZXItcmVhZAo+IHN0YXRpc3RpY3MgYmVmb3JlIGNoZWNraW5n
IHRoZSByZXR1cm4gY29kZSBhbmQgY29waWVzIHRoZSBhY2N1bXVsYXRlZAo+IHZhbHVlcyBiYWNr
IHRvIHVzZXJzcGFjZSwgZXZlbiB3aGVuIHRoZSBpb2N0bCByZXR1cm5zIGFuIGVycm9yLgo+IAo+
IEluaXRpYWxpemUgdGhlIGxvY2FsIHN0YXRpc3RpY3Mgb24gZXZlcnkgbG9vcCBpdGVyYXRpb24g
c28gYSByZWplY3RlZAo+IHJlYWQgY29udHJpYnV0ZXMgemVybyBjb3VudGVycyBhbmQgcHJlc2Vy
dmVzIHN0YXRpc3RpY3MgZnJvbSBhbnkgZWFybGllcgo+IGNvbXBsZXRlZCByZWFkcy4KPiAKPiBb
Li4uXQoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkY2hhcjogaW5pdGlh
bGl6ZSBNRU1SRUFEIHN0YXRpc3RpY3MgYmVmb3JlIGVhY2ggcmVhZAogICAgICBjb21taXQ6IGIz
Yjg2ZmJkMTRiOThjNmExNzg2MzA4YmEwZWNkNjY2ODI3ZGNiMGUKClBhdGNoZShzKSBzaG91bGQg
YmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4
dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJl
Z2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
