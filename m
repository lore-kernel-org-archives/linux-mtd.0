Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C046606BCB5
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 15:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tes019vI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mvfJrJIS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uDYDpto0OZeZ93JPtWGHNHMxU115kiIzufmIrD4hkso=; b=tes019vImdyaZFcse4b7xsHXR0
	3MJowYYrgiTik8Xy2ZVONksQNyHjjHWst9eujecIleh3yGQ61mj2ZF3GE2cnFuv5b5phTt4f312il
	ghOEroW+BgnSfqVJuB4kH+C+wfg00jH9n2cFcLzYdoXB9lzl5cFGoJjRP4yJ4EKfCu3y/t0s7K4Vo
	RAe/m4LCmQ7YNd1mw9K4jShKY4yz3f5RFA+bAICx480Bxs1z5h8J3rl9/vtYTQzjsk+F7RDG8NvqT
	/N/Nyp2dDYHWEdpWen7EbN0mCiXVYYO9V6BJN19v+IbXf27jY5113aDZshrJCzOvL0TFWZjmgDPEF
	2NMO1fPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ8b-0000000FLHT-2kMb;
	Fri, 20 Nov 2026 15:02:53 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ8Y-0000000FLFp-1XzD
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 15:02:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ABCB51A174E;
	Fri, 20 Nov 2026 15:02:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 805B3601B9;
	Fri, 20 Nov 2026 15:02:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8BE4911BC027B;
	Fri, 20 Nov 2026 16:02:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795186968; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eCJcsk7nKdE/zS/Mw/SS7quXmWWfDvd3Vyxw1OphYiQ=;
	b=mvfJrJISZSYm07vBBw4iF43fWAabOWg2boVfJFPB39RisD6iY9q30nyj60ph5H2VU7+61h
	thwRC9ePbnMQMJpiVpHJh6nQ0ErljTqNrd2pcRtLNqKpkk7PX+P54naI3d7g0tVJJRHtVy
	SShzP6sO9qRyKPaRYF7ZUTnB+q+ZuioWAZ8u8An7Zy/p+Koa+b2f4K73xKi/3PpqfMelXX
	+zrLPyJT/5bZipyIGRyw2s1JlzIv3oXheujAnfk4Gtt4kyWjjwrcpSk3qct7c44AO/Frk0
	de8xJXkYe8Bcd5xbhdUkZm43vsd+uG57mDOr3WOUhgm1oW3dhhctkiYT1Fv8kA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261105-submit-mtd-oob-end-v1-v2-1-734bffdc2914@gmail.com>
References: <20261105-submit-mtd-oob-end-v1-v2-1-734bffdc2914@gmail.com>
Subject: Re: [PATCH v2] mtd: core: reject OOB transfers with no complete
 page remaining
Message-Id: <179518696533.3401781.5807779748202005416.b4-ty@bootlin.com>
Date: Fri, 20 Nov 2026 16:02:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_070250_559610_08452853 
X-CRM114-Status: UNSURE (   9.46  )
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

T24gVGh1LCAwNSBOb3YgMjAyNiAxMjoyOTo0MCAtMDcwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6
Cj4gbXRkX2NoZWNrX29vYl9vcHMoKSBwZXJtaXRzIG9mZnMgPT0gbXRkLT5zaXplIHdoZW4gdGhl
IGRhdGEgbGVuZ3RoIGlzCj4gemVyby4gRm9yIGFuIE9PQi1vbmx5IHJlcXVlc3Qgd2l0aCBhIG5v
bnplcm8gb29ib2ZmcywgbWF4b29ibGVuIHRoZW4KPiB1bmRlcmZsb3dzIGJlY2F1c2UgdGhlcmUg
YXJlIG5vIHBhZ2VzIHJlbWFpbmluZy4gVGhlIHdyYXBwZWQgdmFsdWUgbGV0cwo+IHRoZSByZXF1
ZXN0IHBhc3MgdGhlIE9PQiBsZW5ndGggY2hlY2suCj4gCj4gVGhlIE9PQiBpb2N0bHMgY2FuIHJl
YWNoIHRoaXMgY2FzZSBieSBlbmNvZGluZyB0aGUgT09CIG9mZnNldCBpbiB0aGUgbG93Cj4gYml0
cyBvZiBzdGFydC4gT24gYSBwYXJ0aXRpb24gZW5kaW5nIGJlZm9yZSBpdHMgbWFzdGVyIGRldmlj
ZSwgdGhlCj4gc3Vic2VxdWVudCBhZGRyZXNzIHRyYW5zbGF0aW9uIGFsbG93cyB0aGUgcmVxdWVz
dCB0byByZWFkIG9yIHdyaXRlIE9PQgo+IGluIHRoZSBwYWdlIGltbWVkaWF0ZWx5IGZvbGxvd2lu
ZyB0aGUgcGFydGl0aW9uLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9uZXh0LCB0aGFua3Mh
CgpbMS8xXSBtdGQ6IGNvcmU6IHJlamVjdCBPT0IgdHJhbnNmZXJzIHdpdGggbm8gY29tcGxldGUg
cGFnZSByZW1haW5pbmcKICAgICAgY29tbWl0OiA2NTY0OTY5NTJiN2QzYjdhMDI4MzM1MTM4N2Ey
ZTQ0NGRmMDdmNmNjCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXgu
Z2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9i
b3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
