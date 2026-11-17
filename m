Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F92606A8B8
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 14:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bTBJvVSc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PrCsK8oh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3lnJetYZFKiXjej2q26qPOxVI3qEeeELp22zOVUYkAs=; b=bTBJvVScq88hIolspCi5SYlCok
	FRYmIBU3Mf/3w8IE8oWmWEnWZUqn3cqueHcXRdgzaE2AGg3FzUdrzYWzBCUeytv5LlXzHI1UJ38ct
	DwPQ5C0/ggewQp5Ggk5UTVAVjeaFv62qVbUTS53qwfk537wyVMXvJYFd/YEA5Uvsi4DXVobwI6czR
	XRYwm0/uf0g92sCpc6BSfbG1LI2ZLXZC0b3vLQJ5/9rTgnNyH2e8tlTOpP11qzQhqKF2mBcC/NdhJ
	mBrHl6YFtBltn6wud7xisjXNJI/MXN8hLWdnqgatSo1nXx4AELdlJhdiDcbY9O9UwqKbiZJPjhKwB
	4HG9XtEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5r-000000066qv-41Wb;
	Tue, 17 Nov 2026 14:23:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5l-000000066gf-0RcM
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 14:23:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9AAF64E415EE;
	Tue, 17 Nov 2026 14:23:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69BB75FD6A;
	Tue, 17 Nov 2026 14:23:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 22B6711BC004A;
	Tue, 17 Nov 2026 15:23:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925402; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g80SiH+ng5urDF4FCTLf1bdd/UkOkxO1eAY1IXDz8z8=;
	b=PrCsK8ohahMc/1D7Hut2u+V9puAKhj4hTNcOwBMLVIYQwO6jZPWsVDRtxdiU1DCNFUrHIa
	JmIeqpUMOCPhhCyd3P7HHCQFbuaLRhy2NZ4hoN1xQi6RvbSHb58uK9pKgNQ7caheWi56fh
	fvysmDdCyTsv0do4b8580zr12tDBrvqyvaUKifbT1MZs/9zsaFsPKiNR3lyNobSmOr+cld
	Kvh6v9xeIWEk486znBuyfdPcdY+Hq/6rk4mupi5k+Fk7i8WMho8dLefkc1sOJwVAiimD5/
	cFncLsIKPbCMmbVoogXRa2InJaNhRnjnyfwqvS/CVclIuhQy5QrjlgJm1oh6Tg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261110-9f141e6bc8-mtd-marvell@mail.sdu.edu.cn>
References: <20261110-9f141e6bc8-mtd-marvell@mail.sdu.edu.cn>
Subject: Re: [PATCH] mtd: rawnand: marvell: Fix potential DMA buffer leak
Message-Id: <179492540106.2259780.10780989763768054974.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_062326_478106_0EE3CB05 
X-CRM114-Status: UNSURE (   8.55  )
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

T24gVHVlLCAxMCBOb3YgMjAyNiAyMjozMjoyNCArMDgwMCwgR3VhbmdzaHVvIExpIHdyb3RlOgo+
IFRoZSBib3VuY2UgYnVmZmVyIGFsbG9jYXRlZCBieSBtYXJ2ZWxsX25mY19pbml0X2RtYSgpIGlz
IG5vdCBmcmVlZCBvbgo+IHByb2JlIGZhaWx1cmUgb3IgcmVtb3ZhbC4gUmVsZWFzaW5nIHRoZSBj
b250cm9sbGVyIGxvc2VzIHRoZSBidWZmZXIuCj4gCj4gVXNlIGEgZGV2aWNlLW1hbmFnZWQgYWxs
b2NhdGlvbiBzbyB0aGUgYnVmZmVyIGlzIGZyZWVkIGFmdGVyIHRoZSBETUEKPiBjaGFubmVsIGhh
cyBiZWVuIHNodXQgZG93bi4KPiAKPiBUaGlzIGlzc3VlIHdhcyBmb3VuZCBieSBvdXIgc3RhdGlj
IGFuYWx5c2lzIHRvb2wgdW5kZXIgZGV2ZWxvcG1lbnQuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8g
bmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IG1hcnZlbGw6IEZpeCBwb3Rl
bnRpYWwgRE1BIGJ1ZmZlciBsZWFrCiAgICAgIGNvbW1pdDogZjM5MDQ1ZGE1Mjc1NjViYzU4MTcx
YWQ2Yzg4ZWU0YmU0NzcxZmI2MgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRk
L2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0
IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
