Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DA0606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 08:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ghmVoAH1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HpG5xSIK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5lH3YAn2C/wYa++3H/iHbbaE7G2180GhUhw2iXkyLDs=; b=ghmVoAH1ha6zZ/Z6hjBOjMn0VI
	Ogm4wutfMpkMx+ZqJof6e1bEK4ZFXK1OoLmJxxQA9LGNRMnOPBlogQpK7YLbsfIQQbHw4UGTeGL9M
	R92AZUxUh2z7zQcDf/5VcEiEwQ5FlwfBj5CHY6yNMyIk70TBHOJUvK+oSEr/pilLhgjBjhCq/ewLO
	k8uzA9OBXq1Gse5W3o01jIRhwRHlL0JJNIG3j70BIKoOuOBXpBQuoivvxs8TvHTYzPmi9mfReofyq
	v4eYE97F9KLuUGX821uZPmvfkUUeEuVE/7aQX6FDBzKOlOMnmaYKDFnFN4CQtxmyccQzaI5HwZJl6
	7LSp7dYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh5y-000000036Ku-2Mty;
	Tue, 10 Nov 2026 08:20:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh5y-000000036Kn-0XD0
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 08:20:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BDFD6637CE;
	Tue, 10 Nov 2026 08:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3150D1F0089F;
	Tue, 10 Nov 2026 08:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794298844;
	bh=xdjLlE3TPnjGbut7JIlNiYOdcW9plPzP7VbCwBzOz+U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HpG5xSIKXYYuSfcSOruc/f3jzj2w91oN28ss1/atrM7V90PQF/W3C854bZpD6vz4E
	 KT7Vtyqucj+jcbykvwXvmPmrZX/RNunwuF54WmKnL4iqTkyrq479KYvzPqSba/xYhb
	 GPMPNIL0XLgH5b0L1HUGXBRqbaMnu/DTAjUO7MYJI07HyUk+/q4SN7QCMlcEyX6Wm1
	 Fl3qKiY+1Odvq2Y2psWRwtOFKG29Pb9Kq/rdt55UzVjg4Bu/zGUalkAUqz/wX1GJT+
	 Gx/dx9ojAZJINmphzTa2TUqG3r/7WZWGWZJMJmX2v61MyyM9NiGbY5l0G9wES+jsUy
	 /TjHghBz6s4hw==
Message-ID: <sashiko-outbox-206592@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 20/58] mtd: rawnand: socrates: retain open-handle
 state on removal
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-20-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
 <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-20-9137d08f05df@gmail.com>
Date: Tue, 10 Nov 2026 08:20:43 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gbXRkOiByYXduYW5kOiBzb2Ny
YXRlczogbWlzc2luZyBGaXhlcyB0cmFpbGVyIGZvcgogIHNvY3JhdGVzX25hbmRfcmVtb3ZlKCkg
VUFGCi0tCgpjb21taXQgZDVkZGRmMTczM2NjOTMwODY0YjVmNTQyY2U5MTUxNWJkZWQ3NDdlOQpB
dXRob3I6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKPiBtdGQ6
IHJhd25hbmQ6IHNvY3JhdGVzOiByZXRhaW4gb3Blbi1oYW5kbGUgc3RhdGUgb24gcmVtb3ZhbAo+
Cj4gS2VlcCBjaGlwIG1ldGFkYXRhIGFuZCBjb250cm9sbGVyIHN0b3JhZ2UgYWxpdmUgdW50aWwg
dGhlIGZpbmFsIE1URAo+IHJlZmVyZW5jZSBpcyByZWxlYXNlZC4gVW5yZWdpc3RlciBhbmQgZGlz
Y29ubmVjdCBlYWNoIHB1Ymxpc2hlZCBjaGlwCj4gYmVmb3JlIHJlbGVhc2luZyB0aGUgcmVzb3Vy
Y2VzIHVzZWQgYnkgaXRzIGhhcmR3YXJlIG9wZXJhdGlvbnMuCj4KPiBEcmFpbiBvcGVyYXRpb25z
IGJlZm9yZSB1bm1hcHBpbmcgdGhlIEZQR0EgcmVnaXN0ZXJzLgo+Cj4gU2lnbmVkLW9mZi1ieTog
SmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpbU2V2ZXJpdHk6IExv
d10KU2luY2UgdGhpcyBmaXhlcyBwcmVtYXR1cmUgdGVhcmRvd24gaW4gc29jcmF0ZXNfbmFuZF9y
ZW1vdmUoKSB3aGVuIGFuIG9wZW4KTVREIGhhbmRsZSBvdXRsaXZlcyBkZXZpY2UgdW5iaW5kLCBz
aG91bGQgaXQgaW5jbHVkZSBhIEZpeGVzIHRhZz8KCiAgRml4ZXM6IDFiNTc4MTkzYWYzYiAoIltN
VERdIFtOQU5EXSBBZGQgc3VwcG9ydCBmb3IgTkFORCBvbiB0aGUgU29jcmF0ZXMgYm9hcmQiKQoK
LS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8y
MDI2MTExMC1zdWJtaXQtcmF3bmFuZC1yZXRhaW5lZC1oYW5kbGUtbGlmZXRpbWUtdjEtdjItMC05
MTM3ZDA4ZjA1ZGZAZ21haWwuY29tP3BhcnQ9MjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
