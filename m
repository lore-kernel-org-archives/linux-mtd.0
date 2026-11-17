Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006D5606A89D
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GfJjUDi0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HXx5EytN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=98Ef2JWf1oO+FZrrmRZFf93l0cfVo9Ud3pFJ51maziA=; b=GfJjUDi0ROUhEACEy1C3WJJ6KC
	KvvhxcHSH60UNEjrctnDz2Bw2psbwGA6KW3N0twU0HIGtftLd1CkNt57YnWZbDSnquU9BLjudbFbe
	XQJW4tpKj6C9NtK59HPawHjaxuRMLiYCMObtvemhPm//So8XOt0TxdZXJrWSOHppORNiddpL/aop+
	ylEZH+VOwbaVINa2xtm2i3usqF0W2OddgyTADqIkRGbGte385hvjryHXtBBxGLZ0zbHV//zOejoEo
	YW1LR3d9tiJra2l5JPtD9pmbJ9zPVSUel/4fsQJQdSfu56e0UaXGBIIRLMYqT5VGiDAkhd6foXaU3
	ViA+6tQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5v-000000066wi-2AKs;
	Tue, 17 Nov 2026 14:23:35 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5q-000000066mi-2wBZ
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 14:23:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 091A01A1691;
	Tue, 17 Nov 2026 14:23:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D35375FD6A;
	Tue, 17 Nov 2026 14:23:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E00F11BC0041;
	Tue, 17 Nov 2026 15:23:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925408; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LFhzcWwrTklSI8rmoJqaj5WMDMpXtGy+ZT60s1LjZyY=;
	b=HXx5EytN6e3Yr2QCfvkblUYi+D8RzT2TGOvGMCoUvE7pxq2eDfNCdEPF3puWzxAzUjwBct
	Fkz/TETgSNJbXU7ooX5ajRShwX+cpzr/vHTKJ9aDygbugpno0237Zjf0YuvzZtQalhYvQo
	I5fDmHePQ+NWkqlTMWSNVcq5WAa/VyMqzl/EntFIifVmTP3FK/xqHb/ioEWmVKHN+Jjwad
	VOsQRrDIMFnq8ACb4wbjPBpjoEGPkRZayfsWH5N4twBbQWjBL+8brb3yGJb8Fym/iV7cqv
	jRZ8N42BbK9A2PECIncnc+C0jNvgvfvF4J1P76S304Aai8RrTySOoKL4SXYQ8w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20261115-nandc_unalloc-v1-1-65d849fa9998@gmail.com>
References: <20261115-nandc_unalloc-v1-1-65d849fa9998@gmail.com>
Subject: Re: [PATCH] mtd: nand: qpic_common: fix BAM transaction memory
 leak
Message-Id: <179492540601.2259780.2816763714967014660.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_062331_229602_7D5CE62D 
X-CRM114-Status: UNSURE (   7.88  )
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

T24gU3VuLCAxNSBOb3YgMjAyNiAxNToyMDowMSArMDgwMCwgRmVsaXggR3Ugd3JvdGU6Cj4gcWNv
bV9uYW5kY19hbGxvYygpIGFsbG9jYXRlcyB0aGUgQkFNIHRyYW5zYWN0aW9uLCBidXQKPiBxY29t
X25hbmRjX3VuYWxsb2MoKSBkb2VzIG5vdCBmcmVlIGl0LiBUaGlzIGxlYWtzIHRoZSB0cmFuc2Fj
dGlvbiBvbgo+IGNvbnRyb2xsZXIgcmVtb3ZhbCBhbmQgcHJvYmUgZmFpbHVyZXMgYWZ0ZXIgc3Vj
Y2Vzc2Z1bCBhbGxvY2F0aW9uLgo+IAo+IFJlbGVhc2UgaXQgaW4gcWNvbV9uYW5kY191bmFsbG9j
KCkuCj4gCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBt
dGQ6IG5hbmQ6IHFwaWNfY29tbW9uOiBmaXggQkFNIHRyYW5zYWN0aW9uIG1lbW9yeSBsZWFrCiAg
ICAgIGNvbW1pdDogYTUzYmM5NDY4ZjdjNDQ2MWQ1MWM2NmNiZTk0OWQwZmJjYTM3ZjdmNgoKUGF0
Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpw
YXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0
aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
