Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE3C606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 21:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AMX+exBW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gTNpmDi7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qkIL5j69XWXG6E3Ce+iH8PLc7psm4RNQ9uZePiqYNoY=; b=AMX+exBWQhFJSdRLrny1CZEcDs
	9NqAB64xfJDmOlxZ3WJ21/xe1T35U1wpMPaktYyc/VX1gxg4gmByLsZcaLZLCLbmqHPJND8+3BeLJ
	x8/sFc2PZPdLkagX+G6Rlm9RosQ1K8VjVwDgw30yXOJc4g2LO6Eaw8aL0G7mF7vpT2b49ThsXrZoH
	Eem87y7+aF37doKctxcY/mOl0kYKU3+Al9Vp2BeRGbr2MgGpnSVrYFOcUl5gYNaOyYhL+47x35Y+n
	MBYU4vXab7vbYtDRSu3T91m7hIAi+ulIXNz/7hV+8D9RLeITn1GKdnmCnIsGOfvDcOyuYjVaws4JK
	FdFonUqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTR45-00000007Aby-3t51;
	Tue, 17 Nov 2026 21:50:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTR44-00000007Abq-2zDc
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 21:50:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E71540A1B;
	Tue, 17 Nov 2026 21:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6994D1F000C4;
	Tue, 17 Nov 2026 21:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794952208;
	bh=4EDeYWn1TuKklzj6GTTtorjiaL9WrcrL1t6GBP4EZsw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gTNpmDi7GKf7lYxLi0va76ls/nemSYJae3oDaAOaKQra2ASHbApsEsFNx4WraJ8BN
	 C/KykNO7c0VQdwus+Gjz8pWuDSDp+dVtwwG15iPpI20Q5jl/ZDy4oJSbBvwDV/9M2B
	 cIceDSD4MrnJr6igZ39TfOCEXyn0qbv7/FgNxtLvTe+jLUiHBM3QU3bSAHlYB5rPzR
	 sNH+9ZGNqh1OryIMEgHzZcln+J/UQwFCXhyE9cPn6axk1KnMlnu4K4aK3KIDrU31py
	 kzonekZHcdLqQVBfFmTRYAC5gM3X+Qef14TWfdsxAvKGNUf1akLC/wKn6LLuQSEStc
	 VkcN81HxExryw==
Message-ID: <sashiko-outbox-219714@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] MIPS: Octeon: flash: allocate the map per device
To: "Orgad Shaneh" <orgads@gmail.com>, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org, linusw@kernel.org, kaloz@kernel.org, ulli.kroll@googlemail.com, john@phrozen.org, nico@fluxnic.net, dwmw2@infradead.org, corbet@lwn.net
In-Reply-To: <20261117214141.3826637-4-orgads@gmail.com>
References: <20261117214141.3826637-1-orgads@gmail.com>
 <20261117214141.3826637-4-orgads@gmail.com>
Date: Tue, 17 Nov 2026 21:50:06 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gTUlQUzogT2N0ZW9uOiBtaXNz
aW5nIEZpeGVzIHRyYWlsZXIgZm9yIG9jdGVvbl9mbGFzaF9wcm9iZSgpCiAgc3RhdGljIG1hcCBi
dWcKLS0KCmNvbW1pdCBiZTUxNzNhMzRhZWNjNTcxYTM5ZjYzNTVhNTA4OGUwOWYyZDYxMTQ2CkF1
dGhvcjogT3JnYWQgU2hhbmVoIDxvcmdhZHNAZ21haWwuY29tPgoKPiBNSVBTOiBPY3Rlb246IGZs
YXNoOiBhbGxvY2F0ZSB0aGUgbWFwIHBlciBkZXZpY2UKPgo+IG9jdGVvbl9mbGFzaF9wcm9iZSgp
IGZpbGxzIGluIG9uZSBzdGF0aWMgbWFwX2luZm8gZm9yIGV2ZXJ5ICJjZmktZmxhc2giCj4gbm9k
ZSBpdCBiaW5kcyB0bywgc28gYSBzZWNvbmQgY2hpcCBzZWxlY3Qgb3ZlcndyaXRlcyB0aGUgcGh5
cywgdmlydCwKPiBzaXplIGFuZCBiYW5rIHdpZHRoIG9mIHRoZSBmaXJzdCB3aGlsZSB0aGF0IE1U
RCBkZXZpY2Ugc3RpbGwgdXNlcyB0aGUKPiBtYXAuIEEgcHJvYmUgd2hvc2UgZG9fbWFwX3Byb2Jl
KCkgZmluZHMgbm8gY2hpcCBhbHNvIGtlZXBzIGl0cwo+IGlvcmVtYXAoKSBtYXBwaW5nIGFuZCBz
dGlsbCByZXR1cm5zIHN1Y2Nlc3MuCj4KPiBBbGxvY2F0ZSB0aGUgbWFwIHdpdGggZGV2bV9remFs
bG9jKCksIG1hcCBpdCB3aXRoIGRldm1faW9yZW1hcCgpIGFuZAo+IGZhaWwgdGhlIHByb2JlIHdo
ZW4gbm8gY2hpcCBpcyBmb3VuZCBvciB0aGUgcGFydGl0aW9ucyBjYW5ub3QgYmUKPiByZWdpc3Rl
cmVkLCBzbyB0aGUgbWFwcGluZyBnb2VzIGF3YXkgd2l0aCB0aGUgZGV2aWNlLiBteW10ZCB3YXMg
bmV2ZXIKPiByZWFkOyBkcm9wIGl0Lgo+Cj4gVGhlIGRyaXZlciBoYXMgbm8gcmVtb3ZlKCksIGFu
ZCB0aGUgbWFwcGluZyBpcyBub3cgZGV2aWNlLW1hbmFnZWQ6IGEKPiBzeXNmcyB1bmJpbmQgd291
bGQgdW5tYXAgdGhlIGZsYXNoIHdoaWxlIGl0cyBNVEQgZGV2aWNlIHN0YXlzCj4gcmVnaXN0ZXJl
ZC4gU2V0IHN1cHByZXNzX2JpbmRfYXR0cnMgdG8gcnVsZSB0aGF0IG91dC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IE9yZ2FkIFNoYW5laCA8b3JnYWRzQGdtYWlsLmNvbT4KCltTZXZlcml0eTogTG93XQpU
aGlzIGZpeGVzIHRoZSBzdGF0aWMgZmxhc2hfbWFwIG92ZXJ3cml0ZSBhbmQgcHJvYmUgZXJyb3Ig
aGFuZGxpbmcgaW4Kb2N0ZW9uX2ZsYXNoX3Byb2JlKCkuICBTaG91bGQgaXQgaW5jbHVkZToKCiAg
Rml4ZXM6IDdmNDgxNzE2YmM5MCAoIk1JUFM6IE9DVEVPTjogVXNlIGRldmljZSB0cmVlIHRvIHBy
b2JlIGZvciBmbGFzaCBjaGlwcy4iKQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8v
c2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTExNzIxNDE0MS4zODI2NjM3LTEtb3JnYWRzQGdt
YWlsLmNvbT9wYXJ0PTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
