Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B756606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 08:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0dtaf8cN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jK5O1uSF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Rimor1YlMdB06N14EjV0ZyPcn912oCjedHZb1RVCgDw=; b=0dtaf8cNjmFupXH4ElzDxRtR8l
	2B7w4X5lePeQYIMhzY0C7cOvi3E9joEd1eKfDH0yb6ns9yelfEufyOlZLPfRRxSbTnWtIfxoKEilX
	H5weaeOfgM1R4gH3o/b5fT9HVam7NPjlMElJ6U6adlHufPCsee5Hvp9wMFXA6ixewNJ3TC33TybaG
	znAKJiMFU3onyJbv/Op+x05Rqld1IhriCqRNebpoR4KkhhBetgqt3hMCf8VBpLDQ+mvHS36rd8ETY
	jFI17hNrHDUteNleBH4saw1vQl+spCt/vj+zsoyZStiBaZyqG90MYtbXh6a2u7ovGC2S3HIxuAYEj
	xzhDV6cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh81-000000036Ux-3c0o;
	Tue, 10 Nov 2026 08:22:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh81-000000036Ur-18fS
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 08:22:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EEBF241A69;
	Tue, 10 Nov 2026 08:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC761F0089F;
	Tue, 10 Nov 2026 08:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794298972;
	bh=gN/qn1UFN9a0PBuqG744WCOeHPPqLp+Uj5LHW6IdzB0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jK5O1uSFJgVNFYRi+pUbE++HOljBmMFJ4iI4f6tzftXpfJzTTzOv8zZH7aRVhanZN
	 ZK1UStsd2vx4pAtWfFp6U2R4mxT4Sb0MekxGvEQbwPDKu7pv/j/nQoZL6xXdxQcrVN
	 KCvY5eJ+oKZOhpzBlnxD8idOGdZLsBIXwM4MzwPkViNWN3ucyivOmBBcF/e/Y3G8bl
	 5P4OGfYxCZJw7OsUOWIUNqWRTCZCiH0Pb2TmN6/BkQ/tEezVmhsM8g4BV6kHoBmWlS
	 6kfgQGxUZ0WdMCk75Dsxej4/MFQQoFzRbc+ZNYZ9JfzOtySXQkVUyjrK9AnGfhjwT6
	 QrcCTIB4mOvKQ==
Message-ID: <sashiko-outbox-206600@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 21/58] mtd: rawnand: fsl_upm: retain open-handle
 state on removal
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-21-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
 <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-21-9137d08f05df@gmail.com>
Date: Tue, 10 Nov 2026 08:22:52 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gbXRkOiByYXduYW5kOiBmc2xf
dXBtOiBtaXNzaW5nIEZpeGVzIHRyYWlsZXIgZm9yIGxpZmV0aW1lIGFuZAogIGNsZWFudXAgYnVn
cwotLQoKY29tbWl0IDJjN2M0MmZkNGMwNmI1ZWRjNWVjY2VhMTVkYjUyNWJmNzJhZWY5MTkKQXV0
aG9yOiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KCj4gbXRkOiBy
YXduYW5kOiBmc2xfdXBtOiByZXRhaW4gb3Blbi1oYW5kbGUgc3RhdGUgb24gcmVtb3ZhbAo+Cj4g
S2VlcCBjaGlwIG1ldGFkYXRhIGFuZCBjb250cm9sbGVyIHN0b3JhZ2UgYWxpdmUgdW50aWwgdGhl
IGZpbmFsIE1URAo+IHJlZmVyZW5jZSBpcyByZWxlYXNlZC4gVW5yZWdpc3RlciBhbmQgZGlzY29u
bmVjdCBlYWNoIHB1Ymxpc2hlZCBjaGlwCj4gYmVmb3JlIHJlbGVhc2luZyB0aGUgcmVzb3VyY2Vz
IHVzZWQgYnkgaXRzIGhhcmR3YXJlIG9wZXJhdGlvbnMuCj4KPiBBbHNvIGNsZWFuIHVwIHNjYW5u
ZWQgY2hpcHMgd2hlbiBwYXJ0aXRpb24gcmVnaXN0cmF0aW9uIGZhaWxzLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpbU2V2ZXJp
dHk6IExvd10KU2luY2UgdGhpcyBmaXhlcyBmcmVlaW5nIHRoZSBjaGlwIGFuZCBjb250cm9sbGVy
IHN0YXRlIG9uIHJlbW92YWwgd2hpbGUgTVRECmhhbmRsZXMgcmVtYWluIG9wZW4gYW5kIGxlYWtp
bmcgc2Nhbm5lZCBjaGlwIGFsbG9jYXRpb25zIHdoZW4KbXRkX2RldmljZV9yZWdpc3RlcigpIGZh
aWxzIGluIGZ1bl9jaGlwX2luaXQoKSwgc2hvdWxkIGl0IGluY2x1ZGUgYSBGaXhlcwp0YWc/Cgog
IEZpeGVzOiA1YzI0OWM1YTU3ZGMgKCJbTVREXSBbTkFORF0gRlNMIFVQTSBOQU5EIGRyaXZlciIp
CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYxMTEwLXN1Ym1pdC1yYXduYW5kLXJldGFpbmVkLWhhbmRsZS1saWZldGltZS12MS12Mi0w
LTkxMzdkMDhmMDVkZkBnbWFpbC5jb20/cGFydD0yMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
